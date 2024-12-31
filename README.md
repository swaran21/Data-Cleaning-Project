# Data-Cleaning-Project
This project involves data cleaning and transformation of a dataset related to layoffs in various companies. The dataset undergoes several stages of processing to handle duplicates, missing values, and standardize certain fields for further analysis.

Key Steps:
Table Creation and Data Insertion:

Created a staging table (layoffs_staging) that mirrors the original layoffs table.
Inserted data from the layoffs table into layoffs_staging.
Handling Duplicates:

Used ROW_NUMBER() to identify duplicate records based on multiple columns (company, location, industry, etc.).
Deleted duplicate entries to ensure unique records in the staging table.
Data Transformation:

Standardized text fields like company, industry, and country (e.g., trimming spaces and standardizing names).
Converted date fields from text format to the proper DATE type.
Cleaned up missing or erroneous values (e.g., setting empty industries to NULL and deleting rows with NULL values in key columns).
Data Aggregation:

Aggregated total layoffs by company, country, and date.
Performed rolling totals to observe trends in layoffs over time.
Final Cleanup:

Created a new cleaned table (layoffs_staging2) after handling duplicates and transforming data.
Dropped unnecessary columns (like row_num) used for processing.


# Exploratory-Data-Analysis
This repository contains SQL queries used for analyzing and summarizing layoffs data stored in the layoffs_staging2 table.

SQL Queries Overview
Basic Queries:

SELECT *: Retrieves all rows from the layoffs_staging2 table.
SELECT MAX: Finds the maximum values for total_laid_off and percentage_laid_off.
Filtering Data:

WHERE percentage_laid_off = 1: Filters records where the percentage_laid_off is 100%.
Aggregating Data:

SUM(total_laid_off): Calculates the total number of layoffs by company, country, and date.
GROUP BY company, GROUP BY country, and GROUP BY date: Aggregates the data by these columns.
Time-based Analysis:

SELECT YEAR(date): Groups layoffs by year and sums the total layoffs.
SUBSTRING(date, 1, 7): Groups layoffs by month and calculates the total layoffs for each month.
Rolling Totals:

A rolling total is calculated by summing layoffs over time, with the results ordered by month.
Company-Specific Rankings:

The WITH Company_Year and Company_Year_Rank CTEs (Common Table Expressions) are used to rank companies by total layoffs each year, retrieving the top 3 companies per year.
Purpose
These queries are designed to help analyze layoffs data across multiple dimensions:

Total layoffs by company, country, date, and year.
Identification of trends in layoffs over time.
Ranking of companies by layoffs within each year.
