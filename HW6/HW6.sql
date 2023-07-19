CREATE DATABASE HW6;
USE HW6;

/*
1.	Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/
DROP FUNCTION converterSec;
DELIMITER $$
CREATE FUNCTION converterSec(a INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
	DECLARE sec INT;
    DECLARE min INT;
    DECLARE hours INT;
    DECLARE days INT;
    DECLARE result VARCHAR(50);
    
	SET sec = a % 60;
    SET min = ((a - sec) / 60) % 60; 
    SET hours = ((a - sec) / (60 * 60)) % 24;
    SET days = ((a - sec) / (60 * 60 * 24))/1;
    
	SET result = CONCAT(days, ' days ', hours, ' hours ', min, ' minutes ', sec, ' seconds ');
    
    RETURN result;
END$$
DELIMITER ;

SELECT converterSec(123456);

/* Создайте процедуру, которая выводит только четные числа от 1 до 10. 
Пример: 2,4,6,8,10  */

DROP PROCEDURE even;
DELIMITER //
CREATE PROCEDURE even(n INT)
BEGIN
	CASE 
		WHEN n < 4 THEN
			SELECT 2 AS 'result';
		WHEN n < 6 THEN
			SELECT '2, 4' AS 'result';
		WHEN n < 8 THEN
			SELECT '2, 4, 6' AS 'result';
		WHEN n < 10 THEN
			SELECT '2, 4, 6, 8' AS 'result';
		ELSE 
			SELECT '2, 4, 6, 8, 10' AS 'result';
	END CASE;
END //
DELIMITER ;

CALL even(10); 
