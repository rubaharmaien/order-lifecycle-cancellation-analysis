CREATE DATABASE order_analysis;
USE order_analysis ;
SELECT COUNT(*) FROM orders;
DESCRIBE orders;

-- Order status distribution
SELECT 
order_status,
COUNT(*) AS order_count
FROM orders
GROUP BY order_status
ORDER BY order_count DESC;

-- Overall cancellation rate
 SELECT 
COUNT(*) AS total_orders,
SUM(is_cancelled) AS cancelled_orders,
ROUND(SUM(is_cancelled)*100/COUNT(*),2) AS cancellation_rate
FROM orders;

SELECT order_purchase_timestamp
FROM orders
LIMIT 10;

SET SQL_SAFE_UPDATES = 0;

UPDATE orders
SET order_purchase_timestamp =
STR_TO_DATE(order_purchase_timestamp,'%d-%m-%Y %H:%i');

SELECT order_purchase_timestamp
FROM orders
LIMIT 5;

-- Monthly order cancellation analysis
SELECT 
DATE_FORMAT(order_purchase_timestamp,'%Y-%m') AS order_month,
COUNT(order_id) AS total_orders,
SUM(is_cancelled) AS cancelled_orders,
ROUND(SUM(is_cancelled)*100/COUNT(*),2) AS cancel_rate
FROM orders
GROUP BY order_month
ORDER BY order_month;

SELECT 
order_status,
COUNT(*) AS order_count
FROM orders
GROUP BY order_status
ORDER BY order_count DESC;