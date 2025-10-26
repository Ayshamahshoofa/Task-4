-- =====================================
-- SQL for Data Analysis
-- =====================================

-- Step 1: Create Tables
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS orders;

CREATE TABLE customers (
  customer_id INTEGER PRIMARY KEY,
  name TEXT,
  city TEXT
);

CREATE TABLE orders (
  order_id INTEGER PRIMARY KEY,
  customer_id INTEGER,
  order_date DATE,
  total_amount DECIMAL(10,2),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Step 2: Insert 20 Customers
INSERT INTO customers (customer_id, name, city) VALUES
(1,'Aysha','Mangalore'),
(2,'Rahil','Puttur'),
(3,'Sneha','Udupi'),
(4,'Mohit','Bangalore'),
(5,'Aarav','Mysore'),
(6,'Diya','Kundapur'),
(7,'Rohan','Shimoga'),
(8,'Ananya','Puttur'),
(9,'Neha','Mangalore'),
(10,'Vikram','Madikeri'),
(11,'Aditi','Hubli'),
(12,'Siddharth','Belgaum'),
(13,'Isha','Udupi'),
(14,'Kiran','Bangalore'),
(15,'Meera','Hassan'),
(16,'Dev','Chikmagalur'),
(17,'Roshni','Davangere'),
(18,'Arjun','Mangalore'),
(19,'Nisha','Udupi'),
(20,'Tara','Mysore');

-- Step 3: Insert Orders
INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES
(101,1,'2025-10-01',1200),
(102,1,'2025-10-05',800),
(103,2,'2025-10-02',450),
(104,3,'2025-10-05',1500),
(105,4,'2025-10-03',950),
(106,5,'2025-10-04',1100),
(107,6,'2025-10-06',780),
(108,7,'2025-10-07',600),
(109,8,'2025-10-08',1320),
(110,9,'2025-10-09',2200),
(111,10,'2025-10-10',1550),
(112,11,'2025-10-11',900),
(113,12,'2025-10-12',1250),
(114,13,'2025-10-13',1430),
(115,14,'2025-10-14',1050),
(116,15,'2025-10-15',880),
(117,16,'2025-10-16',970),
(118,17,'2025-10-17',1350),
(119,18,'2025-10-18',1700),
(120,19,'2025-10-19',620),
(121,20,'2025-10-20',1850);

-- Step 4: Sample Queries

-- 1️⃣ View all customers
SELECT * FROM customers;

-- 2️⃣ Total spending per customer
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id;

-- 3️⃣ Customers who spent more than 1000
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id
HAVING total_spent > 1000;

-- 4️⃣ Join customers and orders
SELECT c.name, c.city, o.order_id, o.total_amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
ORDER BY o.total_amount DESC;

-- 5️⃣ Subquery: Customers who spent more than 1500
SELECT name
FROM customers
WHERE customer_id IN (
  SELECT customer_id
  FROM orders
  GROUP BY customer_id
  HAVING SUM(total_amount) > 1500
);

-- 6️⃣ Create and use a view
CREATE VIEW customer_summary AS
SELECT c.name, c.city, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name, c.city;

SELECT * FROM customer_summary;
