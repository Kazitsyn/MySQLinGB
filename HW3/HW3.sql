CREATE DATABASE hw3;

USE hw3;

DROP TABLE staff;
CREATE TABLE staff
(
id INT PRIMARY KEY AUTO_INCREMENT,
firstname VARCHAR(30),
lastname VARCHAR(30),
post VARCHAR(30),
seniority INT,
salary INT,
age  INT
);

INSERT INTO staff(firstname, lastname, post, seniority, salary, age)
VALUES
("Вася", "Петров", "Начальник", 40, 100000, 60),
("Петр", "Власов", "Начальник", 8, 70000, 30),
("Катя", "Катрина", "Инженер", 2, 70000, 25),
("Саша", "Сасин", "Инженер", 12, 50000, 35),
("Иван", "Иванов", "Рабочий", 40, 30000, 59),
("Петр", "Петров", "Рабочий", 20, 25000, 40),
("Сидр", "Сидоров", "Рабочий", 10, 20000, 35),
("Антон", "Антонов", "Рабочий", 8, 19000, 28),
("Юрий", "Юрков", "Рабочий", 5, 15000, 25),
("Максим", "Максимов", "Рабочий", 2, 11000, 22),
("Юрий", "Галкин", "Рабочий", 3, 12000, 24),
("Людмила", "Маркина", "Убощик", 10, 10000, 49);

-- Отсортируйте данные по полю заработная плата (salary) в порядке:  возрастания
SELECT * FROM staff 
ORDER BY salary;

-- Отсортируйте данные по полю заработная плата (salary) в порядке: убывания
SELECT * FROM staff 
ORDER BY salary DESC;

-- Выведите 5 максимальных заработных плат (salary)
SELECT * FROM staff 
ORDER BY salary DESC LIMIT 5;

-- Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
SELECT SUM(salary), post
FROM staff 
GROUP BY post;

-- Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
SELECT post, COUNT(*) 'кол-во сотрудников возрасте от 24 до 49 лет включительно'
FROM staff 
WHERE post = 'Рабочий' && age BETWEEN 24 AND 49;

-- Найдите количество специальностей
SELECT COUNT(DISTINCT post) 'количество специальностей'
FROM staff;

-- Выведите специальности, у которых средний возраст сотрудников меньше 30 лет включительно
SELECT DISTINCT post, AVG(age) AS 'avg' FROM staff 
GROUP BY post
HAVING avg < 31;