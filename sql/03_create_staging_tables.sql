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