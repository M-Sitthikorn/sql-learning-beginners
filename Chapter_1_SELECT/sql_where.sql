-- CREATE TABLE customers 
-- 1. สร้างตาราง customers
CREATE TABLE customers(
Id INT,
first_name VARCHAR(50),
country VARCHAR(50),
score INT 
);

-- 3. เพิมข้อมูล
INSERT INTO customers
VALUES 
(1,'Tum', 'Suphanburi', 900 ),
(2, 'Oat', 'Bangkok', 750 ),
(3, 'Title', 'Chainat', 500),
(4, 'Su', 'Suphanburi', 250),
(5, 'Jeab', 'Bangkok', 0)
;


--4 Create OREDER TABLE 

CREATE TABLE orders (
    order_id INT NOT NULL,
    customer_id INT NOT NULL,
    order_date DATE,
    sales INT,
    CONSTRAINT pk_orders PRIMARY KEY (order_id)
);

-- 5 Insert orders data
INSERT INTO orders (order_id, customer_id, order_date, sales) VALUES
    (1001, 1, '2021-01-11', 35),
    (1002, 2, '2021-04-05', 15),
    (1003, 3, '2021-06-18', 20),
    (1004, 6, '2021-08-31', 10);


SELECT * FROM customers;
SELECT * FROM orders;

-- เปลี่ยน country เป็น province 
ALTER TABLE customers
RENAME COLUMN country TO province;

-- FILTERING WITH WHERE CLAUSE

-- ดึงข้อมุูลลูกค้าที่อยู่ในกรุงเทพ =

SELECT * FROM customers
WHERE province = 'Bankok';

-- ดึงข้อมุูลลูกค้าที่ไม่อยู่ในกรุงเทพ !=

SELECT * FROM customers
WHERE province != 'Bankok';

-- ดึงข้อมูลลูกค้าที่มี score มากกว่า 500  >
SELECT * FROM customers
WHERE score > 500;

-- ดึงข้อมูลลูกค้าที่มี score น้อยกว่า 500  
SELECT * FROM customers
WHERE score < 500;

-- ดึงข้อมูลลูกค้าที่มี score น้อยกว่าหรือเท่ากับ 500  
SELECT * FROM customers
WHERE score >= 500;

-- ดึงข้อมูลลูกค้าที่มี score มากกว่าหรือเท่ากับ 500  
SELECT * FROM customers
WHERE score <= 500;

-- ดึงข้อมูลลูกค้าที่อยู่ใน Bangkok และ
-- ดึงข้อมูลลูกค้าที่มี score มากกว่าหรือเท่ากับ 500

 SELECT * FROM customers 
 WHERE province = 'Bankok'
 AND score > 500;

-- ดึงข้อมูลลูกค้าที่ ไม่อยู่ใน Bangkok และ
-- ดึงข้อมูลลูกค้าที่มี score มากกว่าหรือเท่ากับ 500

SELECT * FROM customers
WHERE province != 'Bankok'
AND score > 500;

-- ดึงข้อมูลลูกค้าที่ อยู่ใน Bangkok และ 
-- ดึงข้อมูลลูกค้าที่มี score น้อยกว่า  500

SELECT * FROM customers
WHERE province = 'Bankok'
AND score < 500;


-- ดึงข้อมูลลูกค้าที่ อยู่ใน Bangkok หรือ 
-- ดึงข้อมูลลูกค้าที่มี score น้อยกว่า  500

SELECT * FROM customers
WHERE province = 'Bankok'
OR score < 500;

-- ดึงข้อมูลของลูกค้าที่ ไม่อยู่ใน กทม 

SELECT * FROM customers 
WHERE NOT province = 'Bankok'


-- ดึงข้อมูลของลูกค้าที่มี Score ระหว่าง 100 ถึง 500
-- Case I use BETWEEN 
SELECT * FROM customers 
WHERE score BETWEEN 100 AND 500
;

--CASE II NOT USE BETWEEN 
SELECT * FROM customers 
WHERE score >=100
AND score <= 500
;


-- Membership Operatore  
-- Case I IN 
-- ดึงข้อมูล ลูกค้าที่อยู่ใน กทม  
SELECT * FROM customers 
WHERE  province IN ('Bankok')
;

-- ดึงข้อมูล ลูกค้าที่อยู่ใน กทม หรือ สุพรรณบุรี 

SELECT * FROM customers 
WHERE  province IN ('Bankok', 'Suphanburi')
;

-- LIKE OPERATORS 
--ดึงข้อมูลลูกค้า  ที่มีชื่อขึ้นด้วย ตัว M 
SELECT * FROM customers 
WHERE first_name LIKE 'T%'
;

--ดึงข้อมูลลูกค้า ที่มีตัวอักษร u อยู่ในชื่อ 

SELECT * FROM customers 
WHERE first_name LIKE '%u%'

-- CHECK 
SELECT * FROM customers;

SELECT * FROM orders;

-- JOIN 
SELECT * 
FROM customers 
JOIN orders
ON customers.id = orders.customer_id;


-- INNER JOIN 
SELECT * 
FROM customers 
INNER JOIN orders
ON customers.id = orders.customer_id;

-- ดึงเฉพาะ id, first_name  ของตาราง customers 
-- และ order_id, sales ของตาราง orders

SELECT 
	id,
	first_name,
	order_id,
	sales
FROM customers 
INNER JOIN orders
ON customers.id = orders.customer_id
;

SELECT 
	customers.id,
	customers.first_name,
	orders.order_id,
	orders.sales
FROM customers 
INNER JOIN orders
ON customers.id = orders.customer_id
;

--Alias  customers AS c 
SELECT 
	c.id,
	c.first_name,
	orders.order_id,
	orders.sales
FROM customers AS c  --customers => c
INNER JOIN orders
ON c.id = orders.customer_id
;

SELECT * FROM customers;
SELECT * FROM orders;

--Alias  customers AS c 
--Alias orders AS o
SELECT 
	c.id,
	c.first_name,
	o.order_id,
	o.sales
FROM customers AS c  --customers => c
INNER JOIN orders AS o --orders => o 
ON c.id = o.customer_id
;


--Alias  customers AS c 
--Alias orders AS o
-- Alias first_name AS FirstName
-- Alias order_id AS OrderId
SELECT 
	c.id,
	c.first_name AS FirstName,
	o.order_id AS OrderId,
	o.sales
FROM customers AS c  --customers => c
INNER JOIN orders AS o --orders => o 
ON c.id = o.customer_id
;



















 



















