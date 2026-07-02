USE BrazilianECommerce;
GO

INSERT INTO dw.fact_order_items (
	order_id,
	order_item_id,
	customer_key,
	product_key,
	seller_key,
	order_date_key,
	shipping_limit_date,
	price,
	freight_value
)
SELECT
	oi.order_id,
	oi.order_item_id,
	c.customer_key,
	p.product_key,
	s.seller_key,
	d.date_key AS order_date_key,
	oi.shipping_limit_date,
	oi.price,
	oi.freight_value
FROM
	stg.order_items AS oi
	JOIN stg.orders AS o ON oi.order_id = o.order_id
	JOIN dw.dim_customers AS c ON o.customer_id = c.customer_id
	JOIN dw.dim_products AS p ON oi.product_id = p.product_id
	JOIN dw.dim_sellers AS s ON oi.seller_id = s.seller_id
	JOIN dw.dim_date AS d ON CAST(o.order_purchase_timestamp AS DATE) = d.full_date
GO