DROP DATABASE IF EXISTS sales;
CREATE DATABASE IF NOT EXISTS sales;

USE sales;

CREATE TABLE sales
(id INT PRIMARY KEY NOT NULL,
order_date DATE NOT NULL,
count_order INT NOT NULL);

SELECT * FROM sales;

INSERT INTO sales(id, order_date, count_order)
VALUES
(1, "2022-01-01", 156),
(2, "2022-01-02", 180),
(3, "2022-01-03", 21),
(4, "2022-01-04", 124),
(5, "2022-01-05", 341);


SELECT id "id заказа",
	CASE
		WHEN count_order < 100 THEN "Маленький заказ"
		WHEN 99 < count_order && count_order < 300 THEN "Средний заказ"
		WHEN count_order > 299 THEN "Большой заказ"
	END "тип заказа"
FROM sales;

CREATE TABLE orders
(id INT PRIMARY KEY AUTO_INCREMENT,
emploee_id VARCHAR(10) NOT NULL,
amount FLOAT NOT NULL,
order_status VARCHAR(20) NOT NULL);

INSERT INTO orders(emploee_id, amount, order_status)
VALUES
("e03", 15.00, "OPEN"),
("e01", 25.50, "OPEN"),
("e05", 100.70, "CLOSED"),
("e02", 22.18, "OPEN"),
("e04", 9.50, "CANCELLED");

SELECT * FROM orders;

SELECT 
	CASE
		WHEN order_status = 'OPEN' THEN 'Order is in open stite'
		WHEN order_status = 'CLOSED' THEN 'Order is closed'
		WHEN order_status = 'CANCELLED' THEN 'Order is cancelled'
	END "full_order_status"
FROM orders;

/*
SELECT 
IF( order_status = 'OPEN', 'Order is in open stite',
	IF( order_status = 'CLOSED', 'Order is closed',
		IF( order_status = 'CANCELLED', 'Order is cancelled'))) AS 'full_order_status'
FROM orders;
*/