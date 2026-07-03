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

-- Revenue by month
SELECT
	d.year_number,
	d.month_number,
	d.month_name,
	COUNT(*) AS order_item_count,
	SUM(oi.price) AS total_revenue,
	SUM(oi.freight_value) AS total_freight
FROM
	dw.fact_order_items AS oi
	JOIN dw.dim_date AS d ON oi.order_date_key = d.date_key
GROUP BY
	d.year_number,
	d.month_number,
	d.month_name
ORDER BY
	d.year_number ASC,
	d.month_number ASC;
GO

-- Revenue by seller state
SELECT
	s.seller_state,
	COUNT(*) AS order_item_count,
	SUM(oi.price) AS total_revenue,
	SUM(oi.freight_value) AS total_freight
FROM
	dw.fact_order_items AS oi
	JOIN dw.dim_sellers AS s ON oi.seller_key = s.seller_key
GROUP BY
	s.seller_state
ORDER BY
	total_revenue DESC;
GO

-- Top 10 product categories by average order item value
SELECT TOP 10
	p.product_category_name_english,
	COUNT(*) AS order_item_count,
	AVG(oi.price) AS average_item_price,
	SUM(oi.price) AS total_revenue
FROM
	dw.fact_order_items AS oi
	JOIN dw.dim_products AS p ON oi.product_key = p.product_key
GROUP BY
	p.product_category_name_english
HAVING
	COUNT(*) >= 50
ORDER BY
	average_item_price DESC;
GO
