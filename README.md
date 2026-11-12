

# Week 01 – SQL Basics

## Overview

This week focused on learning SQL fundamentals using MySQL and analysing the NYC Yellow Taxi January 2016 dataset.

**Dataset:** NYC Yellow Taxi Trip Data – January 2016  
**Database:** MySQL  
**Sample size:** 50,000 records

## Objectives

- Set up MySQL and Visual Studio Code.
- Import CSV data into a MySQL database.
- Explore and query structured datasets.
- Practise filtering, sorting, aggregation and joins.
- Understand Common Table Expressions (CTEs).
- Perform analysis using SQL window functions.

## Task 1 – Environment Setup and Data Import

### 1. Environment Setup

- Installed and configured MySQL.
- Set up Visual Studio Code.
- Prepared the project directory and dataset files.

### 2. Dataset Selection

Used the NYC Yellow Taxi January 2016 dataset downloaded from Kaggle.

A 50,000-record sample was created for manageable local analysis.

### 3. Database Creation

Created the MySQL database:

`nyc_taxi`

### 4. Table Creation

Created the `taxi_trips` table with 19 columns, including:

- VendorID
- Pickup and drop-off timestamps
- Passenger count
- Trip distance
- Pickup and drop-off coordinates
- Payment type
- Fare, tip, tolls and total amount

### 5. Data Import

Imported the sample CSV using MySQL's `LOAD DATA LOCAL INFILE` command.

### 6. Supporting Table

Created a `payment_methods` lookup table to map payment type codes to payment descriptions.

### 7. Data Verification

Verified the imported data using SQL queries.

**Total records imported: 50,000**

## Task 2 – SQL Queries

Completed 10 SQL queries covering:

| Query | Description | Concepts |
|---|---|---|
| 1 | Display first 10 trips | SELECT, LIMIT |
| 2 | Trips longer than 5 miles | WHERE, ORDER BY |
| 3 | Trips with fare above $20 | WHERE |
| 4 | Trips with more than 2 passengers and distance above 3 miles | AND, filtering |
| 5 | Average fare by payment type | AVG, GROUP BY |
| 6 | Revenue by payment type | SUM, GROUP BY |
| 7 | Find 10 longest trips | ORDER BY, LIMIT |
| 8 | Join trips with payment methods | INNER JOIN |
| 9 | Daily trip count | CTE, COUNT |
| 10 | Average fare by passenger count | CTE, AVG |

## Task 3 – Window Functions

Completed three window function queries:

1. **Ranking:** Ranked taxi trips by total amount using `RANK()`.
2. **Running Total:** Calculated cumulative taxi revenue using `SUM() OVER()`.
3. **Top 3 Trips per Vendor:** Used `ROW_NUMBER()` and `PARTITION BY` to identify the three highest-value trips for each vendor.

## Key Learnings

- SQL database and table creation.
- Importing CSV datasets into MySQL.
- Filtering and sorting records.
- Aggregate functions such as COUNT, SUM and AVG.
- GROUP BY and INNER JOIN.
- Common Table Expressions.
- Window functions including RANK, ROW_NUMBER and SUM OVER.
- Data exploration and basic data-quality observations.

## Project Structure

```text
Week-01-SQL/
├── data/
│   └── raw/
│       ├── yellow_tripdata_2016-01.csv
│       └── yellow_tripdata_sample.csv
├── sql/
│   └── queries.sql
└── README.md
```

## How to Run

1. Install and start MySQL.
2. Create the `nyc_taxi` database.
3. Create the `taxi_trips` and `payment_methods` tables.
4. Import the sample CSV into `taxi_trips`.
5. Open `sql/queries.sql` in MySQL.
6. Execute the queries to reproduce the analysis.

## Completion Status

- [x] Task 1 – Environment Setup and Data Import
- [x] Task 2 – 10 SQL Queries
- [x] Task 3 – 3 Window Function Queries

**Week 01 completed.**