-- ================================
-- SALES TREND ANALYSIS
-- File: 03_sales_trends.sql
-- Database: classicmodels
-- Author: Milena
-- ================================

USE classicmodels;
-- ------------------------------------------------
-- T1: Monthly sales revenue trend
-- Business Question:
-- How does sales revenue change over time?
-- ------------------------------------------------

SELECT
    DATE_FORMAT(o.orderDate, '%Y-%m') AS year_month,
    ROUND(SUM(od.quantityOrdered * od.priceEach), 2) AS total_revenue
FROM orders o
JOIN orderdetails od USING (orderNumber)
GROUP BY
    DATE_FORMAT(o.orderDate, '%Y-%m')
ORDER BY
 DATE_FORMAT(o.orderDate, '%Y-%m');
