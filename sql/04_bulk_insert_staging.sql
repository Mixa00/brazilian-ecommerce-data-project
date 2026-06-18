USE BrazilianECommerce;
GO

BULK INSERT stg.customers
FROM 'C:\Users\mihajlo.stankovic\Documents\Codex\brazilian_e-commerce_project\data\raw\olist_customers_dataset.csv'
WITH (
	FORMAT = 'CSV',
	FIRSTROW = 2,
	FIELDQUOTE = '"',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
GO

BULK INSERT stg.orders
FROM 'C:\Users\mihajlo.stankovic\Documents\Codex\brazilian_e-commerce_project\data\raw\olist_orders_dataset.csv'
WITH (
	FORMAT = 'CSV',
	FIRSTROW = 2,
	FIELDQUOTE = '"',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
GO

BULK INSERT stg.order_items
FROM 'C:\Users\mihajlo.stankovic\Documents\Codex\brazilian_e-commerce_project\data\raw\olist_order_items_dataset.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
GO

BULK INSERT stg.order_payments
FROM 'C:\Users\mihajlo.stankovic\Documents\Codex\brazilian_e-commerce_project\data\raw\olist_order_payments_dataset.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
GO

BULK INSERT stg.products
FROM 'C:\Users\mihajlo.stankovic\Documents\Codex\brazilian_e-commerce_project\data\raw\olist_products_dataset.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
GO

BULK INSERT stg.sellers
FROM 'C:\Users\mihajlo.stankovic\Documents\Codex\brazilian_e-commerce_project\data\raw\olist_sellers_dataset.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
GO

BULK INSERT stg.product_category_name_translation
FROM 'C:\Users\mihajlo.stankovic\Documents\Codex\brazilian_e-commerce_project\data\raw\product_category_name_translation.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
GO

BULK INSERT stg.geolocation
FROM 'C:\Users\mihajlo.stankovic\Documents\Codex\brazilian_e-commerce_project\data\raw\olist_geolocation_dataset.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
GO