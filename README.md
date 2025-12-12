# Classic Models – SQL Data Analysis Portfolio

This project is a SQL-based data analysis of the Classic Models sample database.  
The goal of the project is to practice real-world data analyst skills such as:
- data exploration,
- business analysis,
- revenue calculations,
- and clear documentation of results.

The database represents a company that sells collectible model cars to customers around the world.

---

## Business Context

Classic Models is a company that sells collectible and office model cars to business customers all over the world.

Main business processes:
- A customer places an order.
- Each order consists of order items linked to products.
- Products are sold by sales representatives who work in different offices.
- Customers make payments based on issued invoices.

Main business questions:
- Which customers generate the highest revenue?
- Which products sell the best and the worst?
- How does sales performance look by country or region?
- What is the sales trend over time?

---

## Data Dictionary

The structure and meaning of the main tables are described in:

`docs/data_dictionary.md`

---

## Initial Data Overview

At the beginning of the project, a basic exploration of the database was performed to understand the data volume and check data correctness.

Row counts per main tables:
- customers: 122 rows  
- orders: 326 rows  
- orderdetails: 2996 rows  
- products: 110 rows  
- employees: 23 rows  
- offices: 7 rows  
- payments: 273 rows  

All exploration queries are stored in:
`sql/00_exploration.sql`

---

## Customer Analysis

### C2 – Top Customers by Revenue

This analysis answers the question:

**Which customers generate the highest revenue?**

Revenue is calculated using the formula:

`quantityOrdered × priceEach`

Tables used:
- customers
- orders
- orderdetails

The SQL query is available in:
`sql/01_customers.sql`

---

## Note About Using the Country Column (C2)

The main question of this analysis was to find the customers with the highest revenue.  
The country column is not required for the revenue calculation itself, and the revenue values remain the same with or without it.

The country was added to make the result easier to understand from a business point of view.  
It allows us to see not only who the top customers are, but also where they come from.

---
---

## Product Analysis

### P1 – Top Products by Revenue

This analysis answers the question:

**Which products generate the highest revenue?**

Revenue is calculated as:

`quantityOrdered × priceEach`

The analysis identifies the best-performing products that generate the highest sales value.
The SQL query is available in:
`sql/02_products.sql`

---

### P2 – Worst-Selling Products

This analysis focuses on products with the lowest sales revenue, including products that have never been sold.

The analysis revealed at least one product with zero revenue, meaning it has never been sold.
This may indicate an inactive or underperforming product that requires business attention.

The SQL query is available in:
`sql/02_products.sql`

---

### P3 – High Stock but Low Sales Products

This analysis identifies products that have a high inventory level but low sales volume.

Such products may indicate:
- frozen capital in inventory,
- inefficient stock management,
- the need for promotions or product review.

The SQL query is available in:
`sql/02_products.sql`
---

## Sales Trend Analysis

### T1 – Monthly Sales Trend

This analysis shows how sales change over time on a monthly basis.

- Time period: grouped by month using `orderDate`
- Metric: total monthly revenue = `SUM(quantityOrdered × priceEach)`

This helps identify:
- overall growth or decline,
- seasonality (strong/weak months),
- months that need business investigation.

The SQL query is available in:
`sql/03_sales_trends.sql`

### Pareto Analysis – Sales by Country (80/20)

A Pareto analysis was performed to identify the countries responsible for the majority of total revenue.

The analysis showed that the top 9 countries generate approximately 81% of total company sales.
This indicates a strong concentration of revenue in a small number of key markets.

The SQL query for this analysis is available in:
`sql/04_sales_by_country.sql`



## Tools Used

- MySQL
- MySQL Workbench
- GitHub

---

## Author

Milena  
Junior Data Analyst (in training)
