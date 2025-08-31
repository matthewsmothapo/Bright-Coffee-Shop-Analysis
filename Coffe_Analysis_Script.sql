
-- Preview the first 10 rows from the Coffe table to validate the structure and content
SELECT
  *
FROM
  "BRIGHTCOFFESALES"."PUBLIC"."COFFE"
LIMIT
  10;

-- Extract date components and classify transactions by day and time

  SELECT TO_DATE(transaction_date) AS purchase_date,
         MONTHNAME(TO_DATE(transaction_date)) AS name_of_month,
         DAYOFMONTH(TO_DATE(transaction_date)) AS day_of_month,
         TO_CHAR(TO_DATE(transaction_date), 'YYYYMM') AS month_id,
         DAYNAME(TO_DATE(transaction_date)) AS day_name,

   -- Classifying day as a Weekday or Weekend
         CASE
         WHEN day_name NOT IN ('Sat','Sun') THEN 'Weekday'
         Else 'Weekend'
         END AS day_classification,

   -- Classifying time into business intervals
         CASE
          WHEN transaction_time BETWEEN '06:00:00' AND '08:59:59' THEN 'Early Morning: 6am-9am'
          WHEN transaction_time BETWEEN '09:00:00' AND '11:59:59' THEN 'Morning: 09am-12pm'
          WHEN transaction_time BETWEEN '12:00:00' AND '13:59:59' THEN 'Lunch: 12pm-2pm'
          WHEN transaction_time BETWEEN '14:00:00' AND '16:59:59' THEN 'Afternoon: 2pm-5pm'
          WHEN transaction_time BETWEEN '17:00:00' AND '18:59:59' THEN 'Evening: 5pm-7pm'
          END AS time_classification,
          HOUR(transaction_time) hour_of_day,

   -- Aggregate metrics
   
        COUNT(DISTINCT transaction_id) AS number_of_sales,
        COUNT (DISTINCT store_id) AS Number_of_stores,
        COUNT (DISTINCT product_id) AS Number_of_different_products,

   -- Categorical dimensions
   
        product_category,
        product_type,
        product_detail,
        store_location,
       
   -- Revenue calculation
         ROUND(SUM(IFNULL(transaction_qty,0)*IFNULL(unit_price,0)),0) AS total_revenue,
   
   FROM
  "BRIGHTCOFFESALES"."PUBLIC"."COFFE"
  GROUP BY ALL;

-- High level summary of sales, store coverage, and product diversity
  SELECT
        COUNT (DISTINCT transaction_id) AS number_of_sales,
        COUNT (DISTINCT store_id) AS Number_of_stores,
        COUNT (DISTINCT store_location) AS Number_of_different_locations,
        COUNT (DISTINCT product_id) AS Number_of_different_products,
 FROM
  "BRIGHTCOFFESALES"."PUBLIC"."COFFE"
  GROUP BY ALL;

  -- Identifying earliest and latest transaction times for business hours

 SELECT MIN(transaction_time) AS opening_time,
        MAX(transaction_time) AS closing_time
FROM
  "BRIGHTCOFFESALES"."PUBLIC"."COFFE"
LIMIT
  10;
