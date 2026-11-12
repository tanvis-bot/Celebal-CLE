-- =========================================
-- WEEK 1: SQL BASICS
-- Dataset: NYC Yellow Taxi - January 2016
-- Total Records: 50,000
-- =========================================

--Section 1 — Basic SQL Queries (Queries 1–4)
USE nyc_taxi;

-- QUERY 1: Display the first 10 taxi trips

SELECT *
FROM taxi_trips
LIMIT 10;

-- QUERY 2: Find taxi trips with distance greater than 5 miles

SELECT
    VendorID,
    passenger_count,
    trip_distance,
    fare_amount,
    total_amount
FROM taxi_trips
WHERE trip_distance > 5
ORDER BY trip_distance DESC;

-- QUERY 3: Find taxi trips with fare greater than $20

SELECT
    VendorID,
    passenger_count,
    trip_distance,
    fare_amount,
    tip_amount,
    total_amount
FROM taxi_trips
WHERE fare_amount > 20
ORDER BY fare_amount DESC;

-- QUERY 4: Find trips with more than 2 passengers
-- and a trip distance greater than 3 miles

SELECT
    VendorID,
    passenger_count,
    trip_distance,
    fare_amount,
    total_amount
FROM taxi_trips
WHERE passenger_count > 2
AND trip_distance > 3
ORDER BY passenger_count DESC, trip_distance DESC;

--Section 2 — Aggregation and GROUP BY (Queries 5–7)
-- QUERY 5: Calculate average fare for each payment type

SELECT
    payment_type,
    COUNT(*) AS total_trips,
    AVG(fare_amount) AS average_fare
FROM taxi_trips
GROUP BY payment_type
ORDER BY average_fare DESC;

-- QUERY 6: Calculate total revenue by payment type

SELECT
    payment_type,
    COUNT(*) AS total_trips,
    SUM(fare_amount) AS total_fare,
    SUM(tip_amount) AS total_tips,
    SUM(total_amount) AS total_revenue
FROM taxi_trips
GROUP BY payment_type
ORDER BY total_revenue DESC;


-- QUERY 7: Find the 10 longest taxi trips
SELECT
    VendorID,
    passenger_count,
    trip_distance,
    fare_amount,
    total_amount
FROM taxi_trips
ORDER BY trip_distance DESC
LIMIT 10;

--Section 3 — Joins (Query 8)
-- QUERY 8: Join taxi trips with payment methods

SELECT
    t.VendorID,
    t.payment_type,
    p.payment_name,
    COUNT(*) AS total_trips,
    ROUND(AVG(t.total_amount), 2) AS average_amount
FROM taxi_trips t
INNER JOIN payment_methods p
    ON t.payment_type = p.payment_type
GROUP BY
    t.VendorID,
    t.payment_type,
    p.payment_name
ORDER BY total_trips DESC;

--Section 4 — Common Table Expressions (Queries 9–10)
-- QUERY 9: Calculate daily trip count using CTE

WITH daily_trips AS (
    SELECT
        DATE(tpep_pickup_datetime) AS trip_date,
        COUNT(*) AS total_trips
    FROM taxi_trips
    GROUP BY DATE(tpep_pickup_datetime)
)

SELECT
    trip_date,
    total_trips
FROM daily_trips
ORDER BY trip_date
LIMIT 10;


-- QUERY 10: Calculate average fare by passenger count using CTE

WITH passenger_fares AS (
    SELECT
        passenger_count,
        COUNT(*) AS total_trips,
        AVG(fare_amount) AS average_fare
    FROM taxi_trips
    GROUP BY passenger_count
)

SELECT
    passenger_count,
    total_trips,
    ROUND(average_fare, 2) AS average_fare
FROM passenger_fares
ORDER BY passenger_count;

--Section 5 — Window Functions (Queries 11–13)
-- QUERY 11: Rank taxi trips by total amount

SELECT
    VendorID,
    passenger_count,
    trip_distance,
    total_amount,
    RANK() OVER (
        ORDER BY total_amount DESC
    ) AS trip_rank
FROM taxi_trips
ORDER BY total_amount DESC
LIMIT 20;


-- QUERY 12: Calculate running total of taxi revenue

SELECT
    tpep_pickup_datetime,
    total_amount,
    SUM(total_amount) OVER (
        ORDER BY tpep_pickup_datetime
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS running_total
FROM taxi_trips
ORDER BY tpep_pickup_datetime
LIMIT 20;


--Query 13 – Top 3 highest-value trips per vendor

WITH ranked_trips AS (
    SELECT
        VendorID,
        passenger_count,
        trip_distance,
        total_amount,
        ROW_NUMBER() OVER (
            PARTITION BY VendorID
            ORDER BY total_amount DESC
        ) AS row_num
    FROM taxi_trips
)
SELECT
    VendorID,
    passenger_count,
    trip_distance,
    total_amount,
    row_num
FROM ranked_trips
WHERE row_num <= 3
ORDER BY VendorID, row_num;

