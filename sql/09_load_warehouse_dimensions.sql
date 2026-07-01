USE BrazilianECommerce;
GO
-- ============================
INSERT INTO dw.dim_customers (
	customer_id,
	customer_unique_id,
	customer_zip_code_prefix,
	customer_city,
	customer_state
)
SELECT
	customer_id,
	customer_unique_id,
	customer_zip_code_prefix,
	customer_city,
	customer_state
FROM
	stg.customers;
GO
-- ============================
INSERT INTO dw.dim_sellers (
	seller_id,
	seller_zip_code_prefix,
	seller_city,
	seller_state
)
SELECT
	seller_id,
	seller_zip_code_prefix,
	seller_city,
	seller_state
FROM
	stg.sellers;
GO
-- ============================
INSERT INTO dw.dim_products (
	product_id,
	product_category_name,
	product_category_name_english,
	product_name_lenght,
	product_description_lenght,
	product_photos_qty,
	product_weight_g,
	product_length_cm,
	product_height_cm,
	product_width_cm
)
SELECT
	p.product_id,
	p.product_category_name,
	COALESCE(t.product_category_name_english, p.product_category_name) AS product_category_name_english,
	p.product_name_lenght,
	p.product_description_lenght,
	p.product_photos_qty,
	p.product_weight_g,
	p.product_length_cm,
	p.product_height_cm,
	p.product_width_cm
FROM
	stg.products as p
	LEFT JOIN stg.product_category_name_translation as t ON p.product_category_name = t.product_category_name;
GO
-- ============================
DECLARE @StartDate DATE = '2016-01-01';
DECLARE @EndDate Date = '2018-12-31';

WITH DataSeries AS (
	SELECT
		@StartDate as full_date

	UNION ALL

	SELECT
		DATEADD(DAY, 1, full_date)
	FROM
		DataSeries
	WHERE
		full_date < @EndDate
)
INSERT INTO dw.dim_date (
	date_key,
	full_date,
	day_number,
	month_number,
	month_name,
	quarter_number,
	year_number
)
SELECT
	CONVERT(INT, FORMAT(full_date, 'yyyyMMdd')) AS date_key,
	full_date,
	DAY(full_date) AS day_number,
	MONTH(full_date) AS month_number,
	DATENAME(MONTH, full_date) AS month_name,
	DATEPART(QUARTER, full_date) AS quarter_number,
	YEAR(full_date) AS year_number
FROM
	DataSeries
OPTION (MAXRECURSION 0);
GO