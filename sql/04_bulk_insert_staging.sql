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