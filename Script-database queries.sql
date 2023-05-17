-- Запросы к БД
USE internet_shop;

-- Подсчитать сумму всех товаров хранящихся на всех складах
SELECT SUM(products.price) AS ALL_SUM
FROM storehouses_products
LEFT OUTER JOIN products
ON storehouses_products.product_id = products.id;

-- В разрезе категории товаров расcчитать, на какую сумму хранится 
-- продукции на первом складе 

SELECT SUM(products.price * storehouses_products.total) AS TOTAL, catalogs.name as NAME
FROM products
JOIN storehouses_products
ON products.id = storehouses_products.product_id
JOIN storehouses
ON storehouses.id = storehouses_products.storehouse_id
JOIN catalogs
ON catalogs.id=products.catalog_id
WHERE storehouses.id = 1
GROUP BY catalogs.name;

-- Список товаров products и разделов catalogs, который соответствует
-- товару
SELECT
  p.id,
  p.name,
  p.price,
  c.name AS catalog
  FROM products AS p
    LEFT JOIN catalogs AS c
      ON p.catalog_id = c.id;
     
-- Представление, которое выводит название name товарной
-- позиции из таблицы products и соответствующее название каталога name
-- из таблицы catalogs      
CREATE OR REPLACE VIEW products_catalogs AS
SELECT
  p.name AS product,
  c.name AS catalog
FROM
  products AS p
JOIN
  catalogs AS c
ON
  p.catalog_id = c.id; 

-- Удаление старых заказов, но остаток должен быть не менее 50 
DELIMITER //
CREATE TRIGGER check_fifth_orders BEFORE DELETE ON orders
FOR EACH ROW BEGIN
  DECLARE total INT;
  SELECT COUNT(*) INTO total FROM orders;
  IF total <= 50 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'DELETE canceled';
  END IF;
END//

DELETE FROM orders LIMIT 1//

SELECT * FROM catalogs// 

DELIMITER;

-- Процедура добавление нового менеджера
DROP PROCEDURE IF EXISTS add_meneger;
DELIMITER //
CREATE PROCEDURE add_meneger (@f_name VARCHAR(100), @l_name VARCHAR(100), @cr_at DATETIME, @up_at DATETIME)
BEGIN
	INSERT INTO
		managers(first_name, last_name, created_at, updated_at)
	VALUES (@f_name, @l_name, @cr_at, @up_at);
END
//

DELIMITER;
-- вызов процедуры
CALL ('Tom', 'Hook', NOW(), NOW());


-- Процедура удаления менеджера
DROP PROCEDURE IF EXISTS del_meneger;
DELIMITER //
CREATE PROCEDURE del_meneger (@f_name VARCHAR(100), @l_name VARCHAR(100))
BEGIN
	DELETE FROM managers WHERE first_name = @f_name, last_name = @l_name;
END
//
DELIMITER;
-- вызов процедуры
CALL ('Tom', 'Hook'); 

-- Функция пределения самого активного покупателя
DROP FUNCTION IF EXISTS active_user;
DELIMITER //
CREATE FUNCTION active_user
	RETURNS INT DETERMINISTIC
BEGIN
	RETURN(
		SELECT CONCAT(users.first_name, ' ', users.last_name) AS NAME, SUM(orders_products.total) AS ACTIVE
		FROM users
		JOIN orders
		ON users.id = orders.user_id 
		JOIN orders_products
		ON orders.id = orders_products.order_id	
	);
END;
//
DELIMITER;
  
-- Функция пределения лучшего менеджера
DROP FUNCTION IF EXISTS best_meneger;
DELIMITER //
CREATE FUNCTION best_meneger
	RETURNS INT DETERMINISTIC
BEGIN
	RETURN(
		SELECT CONCAT(managers.first_name, ' ', managers.last_name) AS NAME, SUM(products.price * orders_products.total) AS SOLD
		FROM managers
		INNER JOIN sells_managers
		ON managers.id = sells_managers.order_id 
		JOIN orders
		ON sells_managers.order_id = orders.id 
		JOIN orders_products
		ON orders.id = orders_products.order_id 
		JOIN products
		ON orders_products.order_id = products.id 
		);
END;
//
DELIMITER;

-- Функция по подсчету суммы продаж за определенный период
DROP FUNCTION IF EXISTS sold_period(@start_period DATETIME, @finish_period DATETIME);
DELIMITER //
CREATE FUNCTION best_meneger
	RETURNS INT DETERMINISTIC
BEGIN(
	SELECT SUM((products.price * orders_products.total)*(1-discounts.discount/100)) AS SOLD
	FROM products
	JOIN orders_products
	ON products.id = orders_products.product_id
	JOIN discounts
	ON products.id = discounts.product_id
	WHERE (orders_products.created_at >  AND orders_products.created_at < )
	);
END;
//
DELIMITER;

SELECT sold_period('2012-07-25 16:36:39' '2021-05-16 21:49:29');

-- Тасчитать по категориям товара среднюю цену, минимальную, максимальную , общую сумму товаров в категорииб общую сумму товаров в магазине
-- сумму по категориям товаров в процентном соотношении. Реализовать в виде оконной функции
SELECT DISTINCT catalogs.name AS CATEGORY_NAME,
  AVG(products.price) OVER w_media_type AS AVETAGE_PRICE,
  MIN(products.price) OVER w_media_type AS MIN,
  MAX(products.price) OVER w_media_type AS MAX,
  SUM(products.price) OVER w_media_type AS TOTAL_BY_CATEGORY,
  SUM(products.price) OVER() AS TOTAL,
  SUM(products.price) OVER w_media_type / SUM(products.price) OVER() * 100 AS PERCENT
    FROM (products
      JOIN catalogs
        ON products.catalog_id = catalogs.id)
        WINDOW w_media_type AS (PARTITION BY products.catalog_id);
