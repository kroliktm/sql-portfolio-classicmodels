-- ================================
-- PRODUCT ANALYSIS
-- File: 02_products.sql
-- Database: classicmodels
-- Author: Milena
-- ================================

USE classicmodels;
-- ------------------------------------------------
-- P1: Top products by revenue
-- Business Question:
-- Which products generate the highest revenue?
-- ------------------------------------------------

SELECT
    p.productCode,
    p.productName,
    p.productLine,
    ROUND(SUM(od.quantityOrdered * od.priceEach), 2) AS total_revenue
FROM products p
JOIN orderdetails od USING (productCode)
GROUP BY
    p.productCode,
    p.productName,
    p.productLine
ORDER BY
    total_revenue DESC
LIMIT 10;
-- ------------------------------------------------
-- P2: Worst-selling products (including products with zero sales)
-- Business Question:
-- Which products generate the lowest revenue?
-- ------------------------------------------------

SELECT
    p.productCode,
    p.productName,
    p.productLine,
    ROUND(IFNULL(SUM(od.quantityOrdered * od.priceEach), 0), 2) AS total_revenue
FROM products p
LEFT JOIN orderdetails od USING (productCode)
GROUP BY
    p.productCode,
    p.productName,
    p.productLine
ORDER BY
    total_revenue ASC
LIMIT 10;

-- P3: High stock but low sales products

SELECT 
    p.productCode,
    p.productName,
    p.quantityInStock,
    IFNULL(SUM(od.quantityOrdered), 0) AS qty_ordered
FROM products p
LEFT JOIN orderdetails od USING (productCode)
GROUP BY 
    p.productCode,
    p.productName,
    p.quantityInStock
ORDER BY 
    p.quantityInStock DESC,
    qty_ordered ASC
LIMIT 10;

