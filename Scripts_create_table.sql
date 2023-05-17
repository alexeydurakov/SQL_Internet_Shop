-- �������� ���� ������
CREATE DATABASE IF NOT EXISTS internet_shop;

USE internet_shop;
-- �������� ������

-- �������� ������� users
CREATE TABLE users(
	id SERIAL PRIMARY KEY COMMENT "������������� ������",
	first_name VARCHAR(100) NOT NULL COMMENT "��� ������������",
	last_name VARCHAR(100) NOT NULL COMMENT "������� ������������",
	gender ENUM('m','f') NOT NULL COMMENT "��� ����������",
	birthday_at DATE COMMENT "���� ��������",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"
) COMMENT "����������";

-- �������� ������� accounts
CREATE TABLE accounts(
	user_id BIGINT UNSIGNED NOT NULL COMMENT "������ ������������",
	email VARCHAR(100) NOT NULL COMMENT "������ ����������� ����� ��� �����",
	phone VARCHAR(100) NOT NULL COMMENT "������� ��� �����",
	index_mail VARCHAR(100) NOT NULL COMMENT "�������� ������",
	country VARCHAR(100) NOT NULL COMMENT "������ ����������",
	city VARCHAR(100) NOT NULL COMMENT "����� ����������", 
	street VARCHAR(100) NOT NULL COMMENT "�����, ��� � ��������",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"
)COMMENT "���������� ����������";

-- �������� ������� catalogs
CREATE TABLE catalogs(
	id SERIAL PRIMARY KEY NOT NULL COMMENT "������������� ��������� ������",
	name VARCHAR(100) NOT NULL COMMENT "������������ ��������� ������",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"
)COMMENT "������� �������";

-- �������� ������� products
CREATE TABLE products(
	id SERIAL PRIMARY KEY NOT NULL COMMENT "������������� ������",
	catalog_id BIGINT UNSIGNED NOT NULL COMMENT "������������� ��������� ������",
	name VARCHAR(100) NOT NULL COMMENT "������������ ������",
	desription VARCHAR(250) NOT NULL COMMENT "�������� ������",
	price DECIMAL(11,2) NOT NULL COMMENT "���� ������",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"
)COMMENT "�������� �������";

-- �������� ������� managers
CREATE TABLE managers(
	id SERIAL PRIMARY KEY NOT NULL COMMENT "������������� ���������",
	first_name VARCHAR(100) NOT NULL COMMENT "��� ������������",
	last_name VARCHAR(100) NOT NULL COMMENT "������� ������������",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"
)COMMENT "���������";

-- �������� ������� sells_managers
CREATE TABLE sells_managers(
	manager_id BIGINT UNSIGNED NOT NULL COMMENT "������������� ���������",
	order_id BIGINT UNSIGNED NOT NULL COMMENT "������������� ������",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"
)COMMENT "������� ���������";

-- �������� ������� orders
CREATE TABLE orders(
	id SERIAL PRIMARY KEY NOT NULL COMMENT "������������� ������",
	user_id BIGINT UNSIGNED NOT NULL COMMENT "������������� ������������",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"
)COMMENT "����� �����������";

-- �������� ������� orders_products
CREATE TABLE orders_products(
	id SERIAL PRIMARY KEY NOT NULL COMMENT "������",
	order_id BIGINT UNSIGNED NOT NULL COMMENT "������������� ������",
	product_id BIGINT UNSIGNED NOT NULL COMMENT "������������� ������",
	total INT UNSIGNED NOT NULL COMMENT "���������� ���������� �������� �������",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"
)COMMENT "������";

-- �������� ������� discounts
CREATE TABLE discounts(
	id SERIAL PRIMARY KEY NOT NULL COMMENT "������",
	user_id BIGINT UNSIGNED NOT NULL COMMENT "������������� ������������",
	product_id BIGINT UNSIGNED NOT NULL COMMENT "������������� ������",
	discount FLOAT UNSIGNED COMMENT "�������",
	started_at DATETIME COMMENT "������ �������� ��������",
	finished_at DATETIME COMMENT "��������� ��������",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"
)COMMENT "��������";

-- �������� ������� storehouses
CREATE TABLE storehouses(
	id SERIAL PRIMARY KEY NOT NULL COMMENT "������������� ������",
	name VARCHAR(100) NOT NULL COMMENT "������������ ������",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"
)COMMENT "������ �������";

-- �������� ������� storehouses
CREATE TABLE storehouses_products(
	id SERIAL PRIMARY KEY NOT NULL COMMENT "������",
	storehouse_id BIGINT UNSIGNED NOT NULL COMMENT "������������� ������",
	product_id BIGINT UNSIGNED NOT NULL COMMENT "������������� ������",
	total INT UNSIGNED NOT NULL COMMENT "����� ���������� ������ �� ������",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"
)COMMENT "������� ������� �� ������";










