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

