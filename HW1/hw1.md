# Home Work 1
***

<image src="hw1.png" alt="hw1">

## Skript SQL

```SQL
CREATE DATABASE smartphone;

USE smartphone;

CREATE TABLE smartphone
(ID INT PRIMARY KEY NOT NULL,
ProductName VARCHAR(30) NOT NULL,
Manufacturer VARCHAR(30) NOT NULL,
ProductCount INT NOT NULL,
Price INT NOT NULL);

INSERT INTO smartphone(ID, ProductName, Manufacturer, ProductCount, Price)
VALUES
(1, "iPhone X", "Apple", 3, 76000),
(2, "iPhone 8", "Apple", 2, 51000),
(3, "Galaxy S9", "Samsung", 2, 56000),
(4, "Galaxy S8", "Samsung", 1, 41000),
(5, "P 20 Pro", "Huawey", 5, 36000);

SELECT * FROM smartphone;

-- Выведите название, производителя и цену товаров, количество которых превышает 2. 

SELECT Manufacturer, Price FROM smartphone WHERE ProductCount > 2;

-- Выведите весь ассортимент марки "Samsung"

SELECT * FROM smartphone WHERE Manufacturer = "Samsung";

-- Вывести товары в которых есть упоменаени "Iphone"

SELECT * FROM smartphone WHERE ProductName LIKE "%Iphone%";

-- Вывести товары в которых есть упоменаени "Samsung"

SELECT * FROM smartphone WHERE ProductName LIKE "%Samsung%";

-- Вывести все товары в которых есть упоменание "8"

SELECT * FROM smartphone WHERE ProductName LIKE "%8%";
```
