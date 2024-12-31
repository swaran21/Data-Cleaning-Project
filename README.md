# Data-Cleaning-Project
The SQL script follows a structured approach to clean and preprocess the data, which is stored in a staging table (layoffs_staging). The cleaned data is then moved to a new table (layoffs_staging2). The key steps include:

Removing duplicate records.
Standardizing values in key columns like company, industry, and country.
Handling missing or null values.
Renaming and restructuring tables to store cleaned data.


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
