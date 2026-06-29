USE BrazilianECommerce;
GO

SELECT
	'dw.dim_customers' AS table_name,
	COUNT(*) AS row_count
FROM
	dw.dim_customers;
GO

SELECT
	'dw.dim_sellers' AS table_name,
	COUNT(*) AS row_count
FROM
	dw.dim_sellers;
GO