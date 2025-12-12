-- ================================
-- CUSTOMER ANALYSIS
-- File: 01_customers.sql
-- Database: classicmodels
-- Author: Milena
-- ================================

USE classicmodels;

-- ------------------------------------------------
-- STEP 1: Check order values at row level
-- Purpose: Understand how revenue is built from order details
-- ------------------------------------------------

SELECT
    orderNumber,
    quantityOrdered,
    priceEach,
    quantityOrdered * priceEach AS row_revenue
FROM orderdetails
LIMIT 10;

-- ------------------------------------------------
-- STEP 2: Revenue per order
-- Purpose: Calculate total revenue for each order
-- ------------------------------------------------

SELECT
    o.orderNumber,
    c.customerNumber,
    c.customerName,
    ROUND(SUM(od.quantityOrdered * od.priceEach), 2) AS order_revenue
FROM customers c
JOIN orders o USING (customerNumber)
JOIN orderdetails od USING (orderNumber)
GROUP BY
    o.orderNumber,
    c.customerNumber,
    c.customerName
ORDER BY
    order_revenue DESC;

-- ------------------------------------------------
-- STEP 3 (C2): Revenue per customer (Top customers)
-- Business Question:
-- Which customers generate the highest revenue?
-- ------------------------------------------------

SELECT
    c.customerNumber,
    c.customerName,
    c.country,
    ROUND(SUM(od.quantityOrdered * od.priceEach), 2) AS total_revenue
FROM customers c
JOIN orders o USING (customerNumber)
JOIN orderdetails od USING (orderNumber)
GROUP BY
    c.customerNumber,
    c.customerName,
    c.country
ORDER BY
    total_revenue DESC
LIMIT 10;

