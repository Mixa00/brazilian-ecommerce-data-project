USE BrazilianECommerce;
GO

CREATE TABLE stg.customers (
    customer_id NVARCHAR(50),
    customer_unique_id NVARCHAR(50),
    customer_zip_code_prefix INT,
    customer_city  NVARCHAR(100),
    customer_state CHAR(2)
);
GO

CREATE TABLE stg.orders (
    order_id NVARCHAR(50),
    customer_id NVARCHAR(50),
    order_status NVARCHAR(50),
    order_purchase_timestamp DATETIME2,
    order_approved_at DATETIME2,
    order_delivered_carrier_date DATETIME2,
    order_delivered_customer_date DATETIME2,
    order_estimated_delivery_date DATETIME2
);
GO

CREATE TABLE stg.order_items (
    order_id NVARCHAR(50),
    order_item_id INT,
    product_id NVARCHAR(50),
    seller_id NVARCHAR(50),
    shipping_limit_date DATETIME2,
    price DECIMAL(10, 2),
    freight_value DECIMAL(10, 2)
);
GO

CREATE TABLE stg.order_payments (
    order_id NVARCHAR(50),
    payment_sequential INT,
    payment_type NVARCHAR(50),
    payment_installments INT,
    payment_value DECIMAL(10, 2)
);
GO

CREATE TABLE stg.order_reviews (
    review_id NVARCHAR(50),
    order_id NVARCHAR(50),
    review_score INT,
    review_comment_title NVARCHAR(MAX),
    review_comment_message NVARCHAR(MAX),
    review_creation_date DATETIME2,
    review_answer_timestamp DATETIME2
);
GO

CREATE TABLE stg.products (
    product_id NVARCHAR(50),
    product_category_name NVARCHAR(100),
    product_name_lenght INT,
    product_description_lenght INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);
GO

CREATE TABLE stg.sellers (
    seller_id NVARCHAR(50),
    seller_zip_code_prefix INT,
    seller_city NVARCHAR(100),
    seller_state CHAR(2)
);
GO

CREATE TABLE stg.geolocation (
    geolocation_zip_code_prefix INT,
    geolocation_lat DECIMAL(9, 6),
    geolocation_lng DECIMAL(9, 6),
    geolocation_city NVARCHAR(100),
    geolocation_state CHAR(2)
);
GO