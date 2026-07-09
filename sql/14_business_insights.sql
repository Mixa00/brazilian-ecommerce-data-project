USE BrazilianECommerce;
GO

-- 1. Which product categories generate the most revenue?
SELECT TOP 10
	p.product_category_name_english,
	COUNT(*) AS order_item_count,
	SUM(oi.price) AS total_revenue,
	SUM(oi.freight_value) AS total_freight,
	AVG(oi.price) AS average_item_price
FROM
	dw.fact_order_items AS oi
	JOIN dw.dim_products AS p ON oi.product_key = p.product_key
GROUP BY
	p.product_category_name_english
HAVING
	COUNT(*) >= 100
ORDER BY
	total_revenue DESC;
GO

-- 2. Which customer states generate the most revenue?
SELECT TOP 10
	c.customer_state,
	COUNT(*) AS order_item_count,
	SUM(oi.price) AS total_revenue,
	SUM(oi.freight_value) AS total_freight,
	AVG(oi.price) AS average_item_price
FROM
	dw.fact_order_items AS oi
	JOIN dw.dim_customers AS c ON oi.customer_key = c.customer_key
GROUP BY
	c.customer_state
ORDER BY
	total_revenue DESC;
GO

-- 3. How does revenue change over time by month?
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

-- 4. Which seller states generate the most revenue?
SELECT TOP 10
	s.seller_state,
	COUNT(*) AS order_item_count,
	SUM(oi.price) AS total_revenue,
	SUM(oi.freight_value) AS total_freight,
	AVG(oi.price) AS average_item_price
FROM
	dw.fact_order_items AS oi
	JOIN dw.dim_sellers AS s ON oi.seller_key = s.seller_key
GROUP BY
	s.seller_state
ORDER BY
	total_revenue DESC;
GO

-- 5. Which product categories have the highest freight cost compared to revenue?
SELECT TOP 10
	p.product_category_name_english,
	COUNT(*) AS order_item_count,
	SUM(oi.price) AS total_revenue,
	SUM(oi.freight_value) AS total_freight,
	SUM(oi.freight_value) / NULLIF(SUM(oi.price), 0) * 100 AS freight_to_revenue_percent
FROM
	dw.fact_order_items AS oi
	JOIN dw.dim_products AS p ON oi.product_key = p.product_key
GROUP BY
	p.product_category_name_english
HAVING
	COUNT(*) >= 100
ORDER BY
	freight_to_revenue_percent DESC;
GO