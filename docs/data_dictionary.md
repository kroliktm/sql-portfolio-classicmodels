# Data Dictionary – Classic Models

This document describes the structure of the Classic Models database and the meaning of the most important columns.

---

## customers
Description: Business customers who place orders.

Key columns:
- customerNumber (PK) – unique customer identifier
- customerName – customer company name
- contactLastName – contact person's last name
- contactFirstName – contact person's first name
- phone – phone number
- addressLine1 – address
- city – city
- country – country
- salesRepEmployeeNumber (FK) – assigned sales representative
- creditLimit – customer credit limit

---

## orders
Description: Order headers placed by customers.

Key columns:
- orderNumber (PK) – unique order identifier
- orderDate – date when the order was placed
- requiredDate – requested delivery date
- shippedDate – actual shipping date
- status – order status (e.g. Shipped, Cancelled, On Hold)
- customerNumber (FK) – customer who placed the order

---

## orderdetails
Description: Individual order line items.

Key columns:
- orderNumber (FK) – order identifier
- productCode (FK) – product identifier
- quantityOrdered – number of units ordered
- priceEach – price per single item
- orderLineNumber – line number in the order

---

## products
Description: Products offered for sale.

Key columns:
- productCode (PK) – unique product identifier
- productName – product name
- productLine – product category
- productScale – product scale
- buyPrice – product purchase price
- MSRP – manufacturer suggested retail price
- quantityInStock – available stock quantity

---

## payments
Description: Payments made by customers.

Key columns:
- customerNumber (FK) – customer who made the payment
- checkNumber – unique payment identifier
- paymentDate – date of payment
- amount – payment amount

---

## employees
Description: Sales representatives and managers.

Key columns:
- employeeNumber (PK) – unique employee identifier
- lastName – employee last name
- firstName – employee first name
- jobTitle – job title
- officeCode (FK) – office where the employee works
- reportsTo – manager employee number

---

## offices
Description: Company offices.

Key columns:
- officeCode (PK) – unique office identifier
- city – office city
- country – office country
- territory – sales territory
