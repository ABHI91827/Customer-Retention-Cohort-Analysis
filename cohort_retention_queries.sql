QUERY 1 — COHORT INDEX CREATION

SELECT
    customer_unique_id,
    DATE_TRUNC('month', MIN(order_purchase_timestamp)) 
        OVER (PARTITION BY customer_unique_id) AS cohort_month,
    DATE_TRUNC('month', order_purchase_timestamp) AS order_month,

    (EXTRACT(YEAR FROM DATE_TRUNC('month', order_purchase_timestamp)) - 
     EXTRACT(YEAR FROM DATE_TRUNC('month', MIN(order_purchase_timestamp) 
     OVER (PARTITION BY customer_unique_id)))) * 12
    +
    (EXTRACT(MONTH FROM DATE_TRUNC('month', order_purchase_timestamp)) - 
     EXTRACT(MONTH FROM DATE_TRUNC('month', MIN(order_purchase_timestamp) 
     OVER (PARTITION BY customer_unique_id)))) AS cohort_index

FROM orders;

What it Shows:
Assigns each customer to a cohort month (first purchase)
Tracks each order’s relative month since first purchase
Creates the foundation for retention analysis

QUERY 2 — RETENTION RATE CALCULATION

WITH cohort_data AS (
    SELECT
        customer_unique_id,
        DATE_TRUNC('month', MIN(order_purchase_timestamp)) AS cohort_month,
        DATE_TRUNC('month', order_purchase_timestamp) AS order_month
    FROM orders
    GROUP BY customer_unique_id, order_purchase_timestamp
),

cohort_index_calc AS (
    SELECT
        customer_unique_id,
        cohort_month,
        order_month,
        (EXTRACT(YEAR FROM order_month) - EXTRACT(YEAR FROM cohort_month)) * 12 +
        (EXTRACT(MONTH FROM order_month) - EXTRACT(MONTH FROM cohort_month)) AS cohort_index
    FROM cohort_data
),

cohort_counts AS (
    SELECT
        cohort_month,
        cohort_index,
        COUNT(DISTINCT customer_unique_id) AS customers
    FROM cohort_index_calc
    GROUP BY cohort_month, cohort_index
),

cohort_size AS (
    SELECT
        cohort_month,
        COUNT(DISTINCT customer_unique_id) AS cohort_size
    FROM cohort_index_calc
    WHERE cohort_index = 0
    GROUP BY cohort_month
)

SELECT
    c.cohort_month,
    c.cohort_index,
    c.customers,
    s.cohort_size,
    ROUND(c.customers * 1.0 / s.cohort_size, 4) AS retention_rate
FROM cohort_counts c
JOIN cohort_size s
ON c.cohort_month = s.cohort_month
ORDER BY c.cohort_month, c.cohort_index;

What it Shows:
Number of customers retained in each cohort over time
Retention rate for each cohort month
Drop-off pattern across months