# Brazilian E-Commerce Data Project

Portfolio project based on the Brazilian E-Commerce Public Dataset by Olist.

## Project Goal

The goal of this project is to practice data engineering and analytics using a real-world e-commerce dataset.

This project will include:

- Data loading and exploration
- SQL Server database design
- ETL pipeline development
- Data cleaning and transformation
- Analytical SQL queries
- Possible reporting or dashboard layer

## Dataset

Dataset: Brazilian E-Commerce Public Dataset by Olist  
Source: Kaggle

## Planned Tech Stack

- SQL Server
- T-SQL
- C#
- Git and GitHub
- Optional: Power BI or another reporting tool

## Project Structure

```text
data/
docs/
sql/
src/
```

## Current Progress

- Initialized Git project structure
- Documented dataset structure and raw schema
- Created SQL Server database and staging schema
- Imported raw CSV files into staging tables
- Performed initial data quality checks
- Designed a warehouse star schema
- Created and loaded dimension tables
- Created and loaded `dw.fact_order_items`
- Added initial analytical SQL queries

## Current Analytics

The project currently includes SQL queries for:

- revenue by product category
- revenue by customer state
- revenue by month
- revenue by seller state