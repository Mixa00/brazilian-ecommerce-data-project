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