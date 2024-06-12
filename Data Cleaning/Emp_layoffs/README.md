## Table of Contents
- [Project Overview](#ProjectOverview)
- [Tools](#Tools)
- [Data Cleaning Steps](#DataCleaningSteps)
## Project Overview
The aim of this project is to clean the Employees layoff data. It involves identifying and correcting inconsistencies, duplicates and handling null values to improve the quality of data. The primary goal of data cleaning is to ensure that dataset is complete, accurate and formatted accurately for analysis. 

## Tools
MS SQL Server <br>
Excel

## Data Cleaning Steps
### Importing Data
Data is imported from csv file into MySQL Server.

### Initial Data Inspection
Executed queries to understand the data structure and identify potential issues in the data. 

### Removing Duplicates
Created Common Table Expressions (CTEs) to identify and remove duplicate records as the data lacks a unique value column.

### Standardizing Data
Standardized the country names, addressing inconsistencies (e.g., "United States" vs. "United States.").

### Handling Missing Value
Identified and fill missing industry names by using corresponding company names.

### Removing Records
Removed records where both layoff and layoff_percentage are null.

### Drop Column
Dropped column created through CTEs to identify Dupicates
