-- 00_exploration.sql
-- Basic exploration of the Classic Models database
-- Author: <Milena>
-- Date: <10/12/2025>

-- 1. Show all databases
SHOW DATABASES;

-- 2. Select working database
USE classicmodels;   

-- 3. Show all tables in the database
SHOW TABLES;

-- 4. Count number of rows in main tables
SELECT 'customers' AS table_name, COUNT(*) AS rows_count FROM customers
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'orderdetails', COUNT(*) FROM orderdetails
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'employees', COUNT(*) FROM employees
UNION ALL
SELECT 'offices', COUNT(*) FROM offices
UNION ALL
SELECT 'payments', COUNT(*) FROM payments;

-- 5. Preview customers table
SELECT *
FROM customers
LIMIT 5;

-- 6. Preview orders table
SELECT *
FROM orders
LIMIT 5;

-- 7. Preview products table
SELECT *
FROM products
LIMIT 5;
