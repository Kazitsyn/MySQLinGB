CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;

-- 1. Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов
CREATE VIEW view1 AS
SELECT * FROM cars WHERE cost < 25000;

SELECT * FROM view1;

-- 1.1 Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)

ALTER VIEW view1 AS
SELECT * FROM cars WHERE cost < 30000;

-- Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди” (аналогично)

CREATE VIEW view2 AS
SELECT * FROM cars WHERE cars.name IN ('Skoda', 'Audi');

SELECT * FROM view2;

-- 1* Получить ранжированный список автомобилей по цене в порядке возрастания
SELECT name, cost,
DENSE_RANK() OVER(ORDER BY cost) AS 'dense rank'
FROM cars;
-- 2* Получить топ-3 самых дорогих автомобилей, а также их общую стоимость

SELECT name, cost,
DENSE_RANK() OVER(ORDER BY cost DESC) AS 'dense rank', 
SUM(cost) OVER(PARTITION BY 'dense rank') AS 'sum'
FROM (SELECT name, cost,
DENSE_RANK() OVER(ORDER BY cost DESC) AS 'dense rank'
FROM cars
LIMIT 3) AS task2;

-- 3* Получить список автомобилей, у которых цена больше предыдущей цены
SELECT *,
cost - LAG(cost) OVER() 'lag'
FROM cars;

SELECT id, name, cost FROM
(SELECT *,
cost - LAG(cost) OVER() AS 'diff'
FROM cars) AS task3
WHERE diff > 0;


-- 4* Получить список автомобилей, у которых цена меньше следующей цены
SELECT id, name, cost FROM
(SELECT *,
cost - LEAD(cost) OVER() AS 'diff'
FROM cars) AS task3
WHERE diff < 0;
/* 5*Получить список автомобилей, отсортированный по возрастанию цены, 
и добавить столбец со значением разницы между текущей ценой и ценой следующего автомобиля */
SELECT *, cost - LEAD(cost) OVER() AS 'diff'
FROM cars
ORDER BY cost;

