--1
CREATE DATABASE lab5;

--2
CREATE TABLE customers(
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(100),
    city VARCHAR(100),
    grade INT
);

INSERT INTO customers (customer_id, cust_name, city, grade) VALUES
(3002, 'Nick Rimando', 'New York', 100),
(3005, 'Graham Zusi', 'California', 200),
(3001, 'Brad Guzan', 'London', null),
(3004, 'Fabian Johns', 'Paris', 300),
(3007, 'Brad Davis', 'New York', 200),
(3009, 'Geoff Camero', 'Berlin', 100),
(3008, 'Julian Green', 'London', 300);

CREATE TABLE orders(
    ord_no INT,
    purch_amt REAL,
    ord_date DATE,
    customer_id INT REFERENCES customers(customer_id)
);

INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id) VALUES
(70001, 150.5, '2012-10-05', 3005),
(70009, 270.65, '2012-09-10', 3001),
(70002, 65.26, '2012-10-05', 3002),
(70004, 110.5, '2012-08-17', 3009),
(70007, 948.5, '2012-09-10', 3005),
(70005, 2400.6, '2012-07-27', 3007),
(70008, 5760, '2012-09-10', 3002);

--3
SELECT SUM(purch_amt) FROM orders;

--4
SELECT AVG(purch_amt) FROM orders;

--5
SELECT COUNT(cust_name) FROM customers
WHERE cust_name IS NOT NULL;

--6
SELECT MIN(purch_amt) FROM orders;

--7
SELECT * FROM customers
WHERE cust_name LIKE '%b';

--8
SELECT * FROM orders
WHERE customer_id IN (
    SELECT customer_id
    FROM customers
    WHERE city = 'New York'
);

--9
SELECT * FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    WHERE purch_amt > 10
);

--10
SELECT SUM(grade) FROM customers;

--11
SELECT * FROM customers
WHERE cust_name IS NOT NULL;

--12
SELECT MAX(grade) FROM customers;
