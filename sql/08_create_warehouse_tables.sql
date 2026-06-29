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