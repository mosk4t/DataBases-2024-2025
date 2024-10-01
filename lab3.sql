CREATE DATABASE lab3; --task 1

CREATE TABLE departments (      --task 2
  code INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL ,
  budget DECIMAL NOT NULL
);

CREATE TABLE employees (
  ssn INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL ,
  lastname VARCHAR(255) NOT NULL ,
  department INTEGER NOT NULL ,
  city VARCHAR(255),
  FOREIGN KEY (department) REFERENCES departments(code)
);

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL ,
  lastname VARCHAR(255) NOT NULL ,
  city VARCHAR(255)
);

INSERT INTO departments(code,name,budget) VALUES(14,'IT',65000);
INSERT INTO departments(code,name,budget) VALUES(37,'Accounting',15000);
INSERT INTO departments(code,name,budget) VALUES(59,'Human Resources',240000);
INSERT INTO departments(code,name,budget) VALUES(77,'Research',55000);
INSERT INTO departments(code,name,budget) VALUES(45,'Management',155000);
INSERT INTO departments(code,name,budget) VALUES(11,'Sales',85000);

INSERT INTO employees(ssn,name,lastname,department, city) VALUES('123234877','Michael','Rogers',14, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('152934485','Anand','Manikutty',14, 'Shymkent');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('222364883','Carol','Smith',37, 'Astana');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('326587417','Joe','Stevens',37, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('332154719','Mary-Anne','Foster',14, 'Astana');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('332569843','George','ODonnell',77, 'Astana');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('546523478','John','Doe',59, 'Shymkent');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('631231482','David','Smith',77, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('654873219','Zacary','Efron',59, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('745685214','Eric','Goldsmith',59, 'Atyrau');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('845657245','Elizabeth','Doe',14, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('845657246','Kumar','Swamy',14, 'Almaty');



INSERT INTO customers(name,lastname, city) VALUES('John','Wills', 'Almaty');
INSERT INTO customers(name,lastname, city) VALUES('Garry','Foster', 'London');
INSERT INTO customers(name,lastname, city) VALUES('Amanda','Hills', 'Almaty');
INSERT INTO customers(name,lastname, city) VALUES('George','Doe', 'Tokyo');
INSERT INTO customers(name,lastname, city) VALUES('David','Little', 'Almaty');
INSERT INTO customers(name,lastname, city) VALUES('Shawn','Efron', 'Astana');
INSERT INTO customers(name,lastname, city) VALUES('Eric','Gomez', 'Shymkent');
INSERT INTO customers(name,lastname, city) VALUES('Elizabeth','Tailor', 'Almaty');
INSERT INTO customers(name,lastname, city) VALUES('Julia','Adams', 'Astana');

SELECT lastname FROM employees;     --task 3

SELECT DISTINCT lastname FROM employees;    --task 4

SELECT * FROM employees WHERE lastname = 'Smith';   --task 5

SELECT * FROM employees WHERE lastname = 'Doe' OR lastname = 'Smith';   --task 6

SELECT * FROM employees WHERE department = 14;  --task 7

SELECT * FROM employees WHERE department = 37 OR department = 77;   --task 8

SELECT SUM(budget) FROM departments;    --task 9

SELECT department, COUNT(*) FROM employees GROUP BY department;     --task 10

SELECT department FROM employees GROUP BY department HAVING COUNT(*)>2;     --task 11

SELECT name FROM departments ORDER BY budget DESC LIMIT 1 OFFSET 1;     --task 12

SELECT employees.name, employees.lastname FROM employees
JOIN departments ON employees.department = departments.code     --task 13
WHERE departments.budget = (SELECT MIN(budget) FROM departments);

SELECT employees.name FROM employees
UNION ALL
SELECT customers.name FROM customers        --task 14
WHERE city = 'Almaty';

SELECT * FROM departments WHERE budget > 60000 ORDER BY budget ASC, code DESC;      --task 15

UPDATE departments
SET budget = budget * 0.9
WHERE code = (SELECT code FROM departments ORDER BY budget ASC LIMIT 1);    --task 16

UPDATE employees
SET department = 14         --Assuming IT department is 14 and Research department is 77 from previous query
WHERE department = 77;      --task 17

DELETE FROM employees WHERE department = 14;    --task 18

DELETE FROM employees WHERE department = 37 AND department = 59;      --task 19
-- (Assuming that there is left only 37 and 59 department after previous queries)

/*SELECT * FROM departments;
SELECT * FROM customers;
SELECT * FROM employees;*/