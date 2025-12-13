SELECT 
    c.country,
    ROUND(SUM(od.quantityOrdered * od.priceEach), 2) AS total_revenue
FROM customers c
JOIN orders o USING (customerNumber)
JOIN orderdetails od USING (orderNumber)
GROUP BY 
    c.country
ORDER BY 
    total_revenue DESC;

-- ------------------------------------------------
-- C2: Percentage share of sales by country
-- Business Question:
-- What percentage of total sales does each country contribute?
-- ------------------------------------------------

SELECT 
    c.country,
    ROUND(SUM(od.quantityOrdered * od.priceEach), 2) AS country_revenue,
    ROUND(
        SUM(od.quantityOrdered * od.priceEach)
        / SUM(SUM(od.quantityOrdered * od.priceEach)) OVER () * 100,
        2
    ) AS revenue_share_percent
FROM customers c
JOIN orders o USING (customerNumber)
JOIN orderdetails od USING (orderNumber)
GROUP BY 
    c.country
ORDER BY 
    revenue_share_percent DESC;

-- ------------------------------------------------
-- C3: Pareto Analysis (80/20) - Revenue by Country
-- Business Question:
-- Which countries generate the majority of total revenue?
-- ------------------------------------------------

WITH country_sales AS (
    SELECT
        c.country,
        SUM(od.quantityOrdered * od.priceEach) AS country_revenue
    FROM customers c
    JOIN orders o USING (customerNumber)
    JOIN orderdetails od USING (orderNumber)
    GROUP BY c.country
),
country_share AS (
    SELECT
        country,
        country_revenue,
        country_revenue / SUM(country_revenue) OVER () * 100 AS revenue_share_percent
    FROM country_sales
)
SELECT
    country,
    ROUND(country_revenue, 2) AS country_revenue,
    ROUND(revenue_share_percent, 2) AS revenue_share_percent,
    ROUND(
        SUM(revenue_share_percent) OVER (ORDER BY revenue_share_percent DESC),
        2
    ) AS cumulative_share_percent
FROM country_share
ORDER BY revenue_share_percent DESC;


