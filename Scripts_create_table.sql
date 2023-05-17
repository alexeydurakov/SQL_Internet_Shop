-- Создание базы данных
CREATE DATABASE IF NOT EXISTS internet_shop;

USE internet_shop;
-- Создание таблиц

-- Создание таблицы users
CREATE TABLE users(
	id SERIAL PRIMARY KEY COMMENT "Идентификатор строки",
	first_name VARCHAR(100) NOT NULL COMMENT "имя пользователя",
	last_name VARCHAR(100) NOT NULL COMMENT "фамилия пользователя",
	gender ENUM('m','f') NOT NULL COMMENT "пол покупателя",
	birthday_at DATE COMMENT "дата рождения",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Покупатели";

-- Создание таблицы accounts
CREATE TABLE accounts(
	user_id BIGINT UNSIGNED NOT NULL COMMENT "индекс пользователя",
	email VARCHAR(100) NOT NULL COMMENT "адресс электронной почты для связи",
	phone VARCHAR(100) NOT NULL COMMENT "телефон для связи",
	index_mail VARCHAR(100) NOT NULL COMMENT "почтовый индекс",
	country VARCHAR(100) NOT NULL COMMENT "страна проживания",
	city VARCHAR(100) NOT NULL COMMENT "город проживания", 
	street VARCHAR(100) NOT NULL COMMENT "улица, дом и квартира",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
)COMMENT "Регистация покупателя";

-- Создание таблицы catalogs
CREATE TABLE catalogs(
	id SERIAL PRIMARY KEY NOT NULL COMMENT "идентификатор категории товара",
	name VARCHAR(100) NOT NULL COMMENT "наименование категории товара",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
)COMMENT "Каталог товаров";

-- Создание таблицы products
CREATE TABLE products(
	id SERIAL PRIMARY KEY NOT NULL COMMENT "идентификатор товара",
	catalog_id BIGINT UNSIGNED NOT NULL COMMENT "идентификатор категории товара",
	name VARCHAR(100) NOT NULL COMMENT "наименование товара",
	desription VARCHAR(250) NOT NULL COMMENT "описание товара",
	price DECIMAL(11,2) NOT NULL COMMENT "цена товара",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
)COMMENT "Описание товаров";

-- Создание таблицы managers
CREATE TABLE managers(
	id SERIAL PRIMARY KEY NOT NULL COMMENT "идентификатор менеджера",
	first_name VARCHAR(100) NOT NULL COMMENT "имя пользователя",
	last_name VARCHAR(100) NOT NULL COMMENT "фамилия пользователя",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
)COMMENT "Менеджеры";

-- Создание таблицы sells_managers
CREATE TABLE sells_managers(
	manager_id BIGINT UNSIGNED NOT NULL COMMENT "идентификатор менеджера",
	order_id BIGINT UNSIGNED NOT NULL COMMENT "идентификатор заказа",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
)COMMENT "Продажи менеджера";

-- Создание таблицы orders
CREATE TABLE orders(
	id SERIAL PRIMARY KEY NOT NULL COMMENT "идентификатор заказа",
	user_id BIGINT UNSIGNED NOT NULL COMMENT "идентификатор пользователя",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
)COMMENT "заказ покупателем";

-- Создание таблицы orders_products
CREATE TABLE orders_products(
	id SERIAL PRIMARY KEY NOT NULL COMMENT "индекс",
	order_id BIGINT UNSIGNED NOT NULL COMMENT "идентификатор заказа",
	product_id BIGINT UNSIGNED NOT NULL COMMENT "идентификатор товара",
	total INT UNSIGNED NOT NULL COMMENT "Количество заказанных товарных позиций",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
)COMMENT "заказы";

-- Создание таблицы discounts
CREATE TABLE discounts(
	id SERIAL PRIMARY KEY NOT NULL COMMENT "индекс",
	user_id BIGINT UNSIGNED NOT NULL COMMENT "идентификатор пользователя",
	product_id BIGINT UNSIGNED NOT NULL COMMENT "идентификатор товара",
	discount FLOAT UNSIGNED COMMENT "дисконт",
	started_at DATETIME COMMENT "начало действия дисконта",
	finished_at DATETIME COMMENT "окончание дисконта",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
)COMMENT "дисконты";

-- Создание таблицы storehouses
CREATE TABLE storehouses(
	id SERIAL PRIMARY KEY NOT NULL COMMENT "идентификатор склада",
	name VARCHAR(100) NOT NULL COMMENT "наименование склада",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
)COMMENT "Список складов";

-- Создание таблицы storehouses
CREATE TABLE storehouses_products(
	id SERIAL PRIMARY KEY NOT NULL COMMENT "индекс",
	storehouse_id BIGINT UNSIGNED NOT NULL COMMENT "идентификатор склада",
	product_id BIGINT UNSIGNED NOT NULL COMMENT "идентификатор товара",
	total INT UNSIGNED NOT NULL COMMENT "общее количество товара на складе",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
)COMMENT "таблица запасов на складе";










