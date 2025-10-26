# Task-4
extracting and analyze data from a database using SQL

---

# **SQL for Data Analysis**

## **Project Overview**

This project demonstrates basic SQL operations using a **customer-orders database**.
It includes **20 customers** and their corresponding **orders**.
The project covers table creation, data insertion, queries, joins, aggregations, subqueries, and views.

---

## **Database Structure**

### **Tables**

**1. Customers Table**

| Column      | Data Type | Description   |
| ----------- | --------- | ------------- |
| customer_id | INTEGER   | Primary Key   |
| name        | TEXT      | Customer Name |
| city        | TEXT      | Customer City |

**2. Orders Table**

| Column       | Data Type | Description                             |
| ------------ | --------- | --------------------------------------- |
| order_id     | INTEGER   | Primary Key                             |
| customer_id  | INTEGER   | Foreign Key referencing customers table |
| order_date   | DATE      | Date of the order                       |
| total_amount | DECIMAL   | Total amount of the order               |

---

## **Getting Started**

1. Clone the repository:

2. Open the `queries.sql` file in your preferred SQL environment 

3. Run the SQL commands step by step:

   * **Create tables**
   * **Insert 20 customers and their orders**
   * **Run sample queries**

---

## **Sample Queries**

* **View all customers**

```sql
SELECT * FROM customers;
```

* **Total spending per customer**

```sql
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id;
```

* **Customers who spent more than 1000**

```sql
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id
HAVING total_spent > 1000;
```

* **Join customers and orders**

```sql
SELECT c.name, c.city, o.order_id, o.total_amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
ORDER BY o.total_amount DESC;
```

* **Subquery: Customers who spent more than 1500**

```sql
SELECT name
FROM customers
WHERE customer_id IN (
  SELECT customer_id
  FROM orders
  GROUP BY customer_id
  HAVING SUM(total_amount) > 1500
);
```

* **Create and use a view**

```sql
CREATE VIEW customer_summary AS
SELECT c.name, c.city, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name, c.city;

SELECT * FROM customer_summary;
```

## **Technologies Used**

* SQL (SQLite / MySQL / PostgreSQL)
* Basic database concepts: Tables, Primary Key, Foreign Key, Joins, Aggregation, Views

---


