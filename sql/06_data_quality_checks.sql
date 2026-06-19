USE BrazilianECommerce;
GO

SELECT
	customer_id,
	COUNT(*) AS duplicate_count
FROM
	stg.customers
GROUP BY
	customer_id
HAVING
	COUNT(*) > 1;
GO

SELECT
	order_id,
	COUNT(*) AS duplicate_count
FROM
	stg.orders
GROUP BY
	order_id
HAVING
	COUNT(*) > 1;
GO