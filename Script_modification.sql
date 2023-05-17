-- ��������� � ��������� ��������� ��
USE internet_shop;

-- ������� ��������� ������� �������������
DESC users;
-- ����������� ������ �������������
SELECT * FROM users LIMIT 10;

-- �������� � ������� ��������� �����
UPDATE users SET updated_at = NOW() WHERE updated_at < created_at;   

-- ������� ��������� ������� products
DESC products;
-- ����������� ������ products
SELECT * FROM products LIMIT 100;

-- ���������� ����
UPDATE products SET price = FLOOR(100 + (RAND() * 10000)) WHERE price BETWEEN 100 AND 10000;
-- �������� � ������� ��������� �����
UPDATE products SET updated_at = NOW() WHERE updated_at < created_at;  

-- ������� ��������� ������� catalogs
DESC catalogs;
-- ����������� ������ catalogs
SELECT * FROM catalogs LIMIT 10;

-- �������� � ������� ��������� �����
UPDATE catalogs SET updated_at = NOW() WHERE updated_at < created_at;

-- ������� ��������� ������� accounts
DESC accounts;
-- ����������� ������ accounts
SELECT * FROM accounts LIMIT 10;

-- ���������� �������� ������
UPDATE accounts SET index_mail = FLOOR(100000 + (RAND() * 500000));
-- �������� � ������� ��������� �����
UPDATE accounts SET updated_at = NOW() WHERE updated_at < created_at;

-- ������� ��������� ������� managers
DESC managers;
-- ����������� ������ managers
SELECT * FROM managers LIMIT 10;

-- �������� � ������� ��������� �����
UPDATE managers SET updated_at = NOW() WHERE updated_at < created_at;


-- ������� ��������� ������� orders
DESC orders;
-- ����������� ������ orders
SELECT * FROM orders LIMIT 10;

-- ���������� ������ ����� user_id = id
UPDATE orders SET user_id = FLOOR(1 + (RAND() * 100)) WHERE user_id = id;

-- ������� ��������� ������� orders_products
DESC orders_products;
-- ����������� ������ orders_products
SELECT * FROM orders_products LIMIT 10;

-- ���������� ������ ����� order_id = id
UPDATE orders_products SET order_id = FLOOR(1 + (RAND() * 100)) WHERE order_id = id;
-- ���������� ������ ����� product_id = id
UPDATE orders_products SET product_id = FLOOR(1 + (RAND() * 100)) WHERE product_id = id;
-- ��������� ������� total
UPDATE orders_products SET total = FLOOR(1 + (RAND() * 10));

-- ������� ��������� ������� discounts
DESC discounts;
-- ����������� ������ discounts
SELECT * FROM discounts LIMIT 10;

-- ���������� ������ ����� user_id = id
UPDATE discounts SET user_id = FLOOR(1 + (RAND() * 100)) WHERE user_id = id;
-- ���������� ������ ����� product_id = id
UPDATE discounts SET product_id = FLOOR(1 + (RAND() * 100)) WHERE product_id = id;
-- ��������� ������� discount
UPDATE discounts SET discount = FLOOR(1 + (RAND() * 30));
-- �������� � ������� ��������� �����
UPDATE discounts SET finished_at = NOW() WHERE finished_at < started_at;

-- ������� ��������� ������� storehouses
DESC storehouses_products;
-- ����������� ������ storehouses_products
SELECT * FROM storehouses_products LIMIT 10;

-- -- ��������� ������� storehouse_id
UPDATE storehouses_products SET storehouse_id = FLOOR(1 + (RAND() * 5));
-- ���������� ������ ����� product_id = id
UPDATE storehouses_products SET product_id = FLOOR(1 + (RAND() * 100)) WHERE product_id = id;
