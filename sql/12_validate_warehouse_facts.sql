USE BrazilianECommerce;
GO

SELECT
	'dw.fact_order_items' AS table_name,
	COUNT(*) AS row_count
FROM
	dw.fact_order_items;
GO

SELECT
	'stg.order_items' AS table_name,
	COUNT(*) AS row_count
FROM
	stg.order_items;
GO