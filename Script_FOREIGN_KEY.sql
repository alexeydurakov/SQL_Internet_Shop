-- Добавляем внешние ключи в БД
USE internet_shop;

-- Для таблицы accounts
DESC accounts;

ALTER TABLE accounts
	ADD CONSTRAINT accounts_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id)
			ON DELETE CASCADE;
		
-- Для таблицы catalogs			
DESC catalogs;

-- Для таблицы discounts	
DESC discounts;
DESC products;
ALTER TABLE discounts
	ADD CONSTRAINT discounts_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id);

ALTER TABLE discounts
	ADD CONSTRAINT discounts_product_id_fk
		FOREIGN KEY (product_id) REFERENCES products(id);
		
-- Для таблицы managers
DESC managers;

-- Для таблицы orders
DESC orders;

ALTER TABLE orders
	ADD CONSTRAINT orders_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id);
		
-- Для таблицы orders_products
DESC orders_products;	

ALTER TABLE orders_products
	ADD CONSTRAINT orders_products_user_id_fk
		FOREIGN KEY (order_id) REFERENCES orders(id);

ALTER TABLE orders_products
	ADD CONSTRAINT orders_products_product_id_fk
		FOREIGN KEY (product_id) REFERENCES products(id);
	
-- Для таблицы products
DESC products;

ALTER TABLE products
	ADD CONSTRAINT products_catalog_id_fk
		FOREIGN KEY (catalog_id) REFERENCES catalogs(id);

-- Для таблицы sells_managers
DESC sells_managers;

ALTER TABLE sells_managers
	ADD CONSTRAINT sells_managers_manager_id_fk
		FOREIGN KEY (manager_id) REFERENCES managers(id);
	
ALTER TABLE sells_managers
	ADD CONSTRAINT sells_managers_order_id_fk
		FOREIGN KEY (order_id) REFERENCES orders(id);
	
-- Для таблицы storehouses
DESC storehouses;

-- Для таблицы storehouses_products
DESC storehouses_products;

ALTER TABLE storehouses_products
	ADD CONSTRAINT storehouses_products_storehouse_id_fk
		FOREIGN KEY (storehouse_id) REFERENCES storehouses(id);

ALTER TABLE storehouses_products
	ADD CONSTRAINT storehouses_products_product_id_fk
		FOREIGN KEY (product_id) REFERENCES products(id);
	
-- Для таблицы users
DESC users;	
