USE BrazilianECommerce;
GO

-- Revenue by product category
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

-- Revenue by customer state
SELECT
	c.customer_state,
	COUNT(*) AS order_item_count,
	SUM(oi.price) AS total_revenue,
	SUM(oi.freight_value) AS total_freight
FROM
	dw.fact_order_items AS oi
	JOIN dw.dim_customers AS c ON oi.customer_key = c.customer_key
GROUP BY
	c.customer_state
ORDER BY
	total_revenue DESC;
GO