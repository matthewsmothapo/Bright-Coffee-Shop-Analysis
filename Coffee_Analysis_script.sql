SELECT*FROM shopping_trends.sales.sales_data
LIMIT 5;
-- EDA - Understanding the Data Given
-- Checking Values in the columns

SELECT DISTINCT gender
FROM shopping_trends.sales.sales_data;

SELECT DISTINCT item_purchased
FROM shopping_trends.sales.sales_data;

SELECT DISTINCT category
FROM shopping_trends.sales.sales_data;

--- Analysis On Age 

SELECT MAX (age)
FROM shopping_trends.sales.sales_data;

SELECT MIN (age)
FROM shopping_trends.sales.sales_data;

SELECT
CASE
   WHEN age BETWEEN 18 AND 30 THEN 'Youth'
   WHEN age BETWEEN 31 AND 40 THEN 'Adult'BRIGHTSALES
   WHEN age BETWEEN 41 AND 45 THEN 'Senior'
   ELSE 'Elder'
   END AS age_buckets

FROM shopping_trends.sales.sales_data;

------------------------------------

SELECT MAX("Purchase Amount (USD)")
FROM shopping_trends.sales.sales_data;

SELECT MIN("Purchase Amount (USD)")

CASE
    WHEN "Purchase Amount (USD)" BETWEEN 20 AND 30 THEN '01. 20-30: Low Spend'
    WHEN "Purchase Amount (USD)" BETWEEN 31 AND 50 THEN '02. 31-50: Medium Spend'
    WHEN "Purchase Amount (USD)" BETWEEN 51 AND 79 THEN '03. 51-70: High Spend'
    ELSE 'O4. 70+ Very High spend'
END AS spend_buckets
FROM shopping_trends.sales.sales_data;

----------------------------------------------------

SELECT MIN(review_rating)
FROM shopping_trends.sales.sales_data;

SELECT MAX(review_rating)
FROM shopping_trends.sales.sales_data;

SELECT DISTINCT review_rating
FROM shopping_trends.sales.sales_data;

CASE
    WHEN review_rating BETWEEN 2.5 AND 3.0 THEN 'Bad'
    WHEN review_rating BETWEEN 3.1 AND 4.0 THEN 'Neutral'
    ELSE 'Good'
END AS review_rating_bucket
