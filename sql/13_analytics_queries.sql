USE BrazilianECommerce;
GO

-- Categories and their revenue
SELECT
	p.product_category_name_english,
	COUNT(*) AS order_item_count,
	SUM(oi.price) AS total_revenue,
	SUM(oi.freight_value) AS total_freight
FROM
	dw.fact_order_items AS oi
	JOIN dw.dim_products AS p ON oi.product_key = p.product_key
GROUP BY
	p.product_category_name_english
ORDER BY
	total_revenue DESC;
GO