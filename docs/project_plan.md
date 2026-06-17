# Project Plan

This document describes the planned phases for the Brazilian E-Commerce data project.

## Phase 1: Project Setup and Dataset Understanding

- Initialize Git repository
- Create project folder structure
- Document raw dataset files
- Document raw CSV columns
- Create initial data profile

## Phase 2: SQL Server Staging Database

- Create a SQL Server database for the project
- Design staging tables that match the raw CSV files
- Import raw CSV data into staging tables
- Validate row counts after import

## Phase 3: Data Cleaning and Validation

- Check for missing values
- Check duplicate keys
- Validate relationships between tables
- Standardize data types
- Document data quality issues

## Phase 4: Analytical Model

- Design cleaned relational tables or warehouse-style tables
- Create views for common analysis
- Prepare data for reporting and SQL analytics

## Phase 5: SQL Analysis

- Analyze order volume over time
- Analyze revenue and freight value
- Analyze product categories
- Analyze sellers and customer locations
- Analyze delivery performance
- Analyze reviews and customer satisfaction

## Phase 6: Optional C# ETL / Helper App

- Build a small C# console application
- Read configuration from a local `.env` or config file
- Run selected ETL or validation tasks
- Log results clearly

## Phase 7: GitHub Portfolio Polish

- Improve README with final project summary
- Add schema diagrams or screenshots if useful
- Add example SQL queries and results
- Explain how another person can reproduce the project

## Current Status

Phase 1 is in progress.