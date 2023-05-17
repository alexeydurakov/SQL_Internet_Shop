-- Доработки и улучшения структуры БД
USE internet_shop;

-- Смотрим структуру таблицы пользователей
DESC users;
-- Анализируем данные пользователей
SELECT * FROM users LIMIT 10;

-- Приводим в порядок временные метки
UPDATE users SET updated_at = NOW() WHERE updated_at < created_at;   

-- Смотрим структуру таблицы products
DESC products;
-- Анализируем данные products
SELECT * FROM products LIMIT 100;

-- Исправляем цену
UPDATE products SET price = FLOOR(100 + (RAND() * 10000)) WHERE price BETWEEN 100 AND 10000;
-- Приводим в порядок временные метки
UPDATE products SET updated_at = NOW() WHERE updated_at < created_at;  

-- Смотрим структуру таблицы catalogs
DESC catalogs;
-- Анализируем данные catalogs
SELECT * FROM catalogs LIMIT 10;

-- Приводим в порядок временные метки
UPDATE catalogs SET updated_at = NOW() WHERE updated_at < created_at;

-- Смотрим структуру таблицы accounts
DESC accounts;
-- Анализируем данные accounts
SELECT * FROM accounts LIMIT 10;

-- Исправляем почтовый индекс
UPDATE accounts SET index_mail = FLOOR(100000 + (RAND() * 500000));
-- Приводим в порядок временные метки
UPDATE accounts SET updated_at = NOW() WHERE updated_at < created_at;

-- Смотрим структуру таблицы managers
DESC managers;
-- Анализируем данные managers
SELECT * FROM managers LIMIT 10;

-- Приводим в порядок временные метки
UPDATE managers SET updated_at = NOW() WHERE updated_at < created_at;


-- Смотрим структуру таблицы orders
DESC orders;
-- Анализируем данные orders
SELECT * FROM orders LIMIT 10;

-- Исправляем случай когда user_id = id
UPDATE orders SET user_id = FLOOR(1 + (RAND() * 100)) WHERE user_id = id;

-- Смотрим структуру таблицы orders_products
DESC orders_products;
-- Анализируем данные orders_products
SELECT * FROM orders_products LIMIT 10;

-- Исправляем случай когда order_id = id
UPDATE orders_products SET order_id = FLOOR(1 + (RAND() * 100)) WHERE order_id = id;
-- Исправляем случай когда product_id = id
UPDATE orders_products SET product_id = FLOOR(1 + (RAND() * 100)) WHERE product_id = id;
-- заполняем колонку total
UPDATE orders_products SET total = FLOOR(1 + (RAND() * 10));

-- Смотрим структуру таблицы discounts
DESC discounts;
-- Анализируем данные discounts
SELECT * FROM discounts LIMIT 10;

-- Исправляем случай когда user_id = id
UPDATE discounts SET user_id = FLOOR(1 + (RAND() * 100)) WHERE user_id = id;
-- Исправляем случай когда product_id = id
UPDATE discounts SET product_id = FLOOR(1 + (RAND() * 100)) WHERE product_id = id;
-- заполняем колонку discount
UPDATE discounts SET discount = FLOOR(1 + (RAND() * 30));
-- Приводим в порядок временные метки
UPDATE discounts SET finished_at = NOW() WHERE finished_at < started_at;

-- Смотрим структуру таблицы storehouses
DESC storehouses_products;
-- Анализируем данные storehouses_products
SELECT * FROM storehouses_products LIMIT 10;

-- -- заполняем колонку storehouse_id
UPDATE storehouses_products SET storehouse_id = FLOOR(1 + (RAND() * 5));
-- Исправляем случай когда product_id = id
UPDATE storehouses_products SET product_id = FLOOR(1 + (RAND() * 100)) WHERE product_id = id;
