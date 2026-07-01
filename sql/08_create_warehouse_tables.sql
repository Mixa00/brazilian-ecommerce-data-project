USE BrazilianECommerce;
GO

CREATE TABLE dw.dim_customers (
	customer_key INT IDENTITY(1, 1) NOT NULL,
	customer_id NVARCHAR(50) NOT NULL,
	customer_unique_id NVARCHAR(50) NOT NULL,
	customer_zip_code_prefix INT NULL,
	customer_city NVARCHAR(100) NULL,
	customer_state CHAR(2) NULL,

	CONSTRAINT PK_dim_customers PRIMARY KEY(customer_key)
);
GO

/*
SELECT
	TABLE_SCHEMA,
	TABLE_NAME
FROM
	INFORMATION_SCHEMA.TABLES
WHERE
	TABLE_SCHEMA = 'dw'
	AND TABLE_NAME = 'dim_customers';
*/

CREATE TABLE dw.dim_sellers (
	seller_key INT IDENTITY(1, 1) NOT NULL,
	seller_id NVARCHAR(50) NOT NULL,
	seller_zip_code_prefix INT NULL,
	seller_city NVARCHAR(100) NULL,
	seller_state CHAR(2) NULL,

	CONSTRAINT PK_dim_sellers PRIMARY KEY(seller_key)
);
GO

CREATE TABLE dw.dim_products (
	product_key INT IDENTITY(1, 1) NOT NULL,
	product_id NVARCHAR(50) NOT NULL,
	product_category_name NVARCHAR(100) NULL,
	product_category_name_english NVARCHAR(100) NULL,
	product_name_lenght INT NULL,
	product_description_lenght INT NULL,
	product_photos_qty INT NULL,
	product_weight_g INT NULL,
	product_length_cm INT NULL,
	product_height_cm INT NULL,
	product_width_cm INT NULL,

	CONSTRAINT PK_dim_products PRIMARY KEY(product_key)
);
GO

CREATE TABLE dw.dim_date (
	date_key INT NOT NULL,
	full_date DATE NOT NULL,
	day_number INT NOT NULL,
	month_number INT NOT NULL,
	month_name NVARCHAR(20) NOT NULL,
	quarter_number INT NOT NULL,
	year_number INT NOT NULL,

	CONSTRAINT PK_dim_date PRIMARY KEY(date_key)
);
GO

CREATE TABLE dw.fact_order_items (
	order_item_key INT IDENTITY(1, 1) NOT NULL,
	order_id NVARCHAR(50) NOT NULL,
	order_item_id INT NOT NULL,
	customer_key INT NOT NULL,
	product_key INT NOT NULL,
	seller_key INT NOT NULL,
	order_date_key INT NOT NULL,
	shipping_limit_date DATETIME2 NULL,
	price DECIMAL(10, 2) NOT NULL,
	freight_value DECIMAL(10, 2) NOT NULL,

	CONSTRAINT PK_fact_order_items PRIMARY KEY(order_item_key),

	CONSTRAINT FK_fact_order_items_dim_customers
		FOREIGN KEY(customer_key) REFERENCES dw.dim_customers(customer_key),

	CONSTRAINT FK_fact_order_items_dim_products
		FOREIGN KEY(product_key) REFERENCES dw.dim_products(product_key),

	CONSTRAINT FK_fact_order_items_dim_sellers
		FOREIGN KEY(seller_key) REFERENCES dw.dim_sellers(seller_key),

	CONSTRAINT FK_fact_order_items_dim_date
		FOREIGN KEY(order_date_key) REFERENCES dw.dim_date(date_key)
);
GO