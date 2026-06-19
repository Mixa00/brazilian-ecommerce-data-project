USE BrazilianECommerce;
GO

-- Unique customer_id in customers
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

-- Unique order_id in orders
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

-- Duplicate product_id values
SELECT 
    product_id,
    COUNT(*) AS duplicate_count
FROM stg.products
GROUP BY product_id
HAVING COUNT(*) > 1;
GO

-- Duplicate seller_id values
SELECT 
    seller_id,
    COUNT(*) AS duplicate_count
FROM stg.sellers
GROUP BY seller_id
HAVING COUNT(*) > 1;
GO

-- Duplicate product category translation values
SELECT 
    product_category_name,
    COUNT(*) AS duplicate_count
FROM stg.product_category_name_translation
GROUP BY product_category_name
HAVING COUNT(*) > 1;
GO

-- Duplicate order item keys
SELECT 
    order_id,
    order_item_id,
    COUNT(*) AS duplicate_count
FROM stg.order_items
GROUP BY order_id, order_item_id
HAVING COUNT(*) > 1;
GO

-- Duplicate order payment keys
SELECT 
    order_id,
    payment_sequential,
    COUNT(*) AS duplicate_count
FROM stg.order_payments
GROUP BY order_id, payment_sequential
HAVING COUNT(*) > 1;
GO

