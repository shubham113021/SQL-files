USE groupby_exercise;

-- 1. Number of orders in each region
SELECT region, COUNT(*) AS total_orders
FROM sales
GROUP BY region;

-- 2. Total sales amount for each category
SELECT category, SUM(amount) AS total_sales
FROM sales
GROUP BY category;

-- 3. Average order amount per salesperson
SELECT salesperson, AVG(amount) AS avg_amount
FROM sales
GROUP BY salesperson;

-- 4. Total quantity sold in each region
SELECT region, SUM(quantity) AS total_quantity
FROM sales
GROUP BY region;

-- 5. Total sales amount for each region-category combination
SELECT region, category, SUM(amount) AS total_sales
FROM sales
GROUP BY region, category;

-- 6. Orders count and total sales for region, category, salesperson
SELECT region, category, salesperson,
       COUNT(*) AS total_orders,
       SUM(amount) AS total_sales
FROM sales
GROUP BY region, category, salesperson;

-- 7. Regions with more than 5 orders
SELECT region, COUNT(*) AS total_orders
FROM sales
GROUP BY region
HAVING COUNT(*) > 5;

-- 8. Categories with total sales greater than 150000
SELECT category, SUM(amount) AS total_sales
FROM sales
GROUP BY category
HAVING SUM(amount) > 150000;

-- 9. Salespersons with average order amount greater than 60000
SELECT salesperson, AVG(amount) AS avg_amount
FROM sales
GROUP BY salesperson
HAVING AVG(amount) > 60000;

-- 10. Region-category groups with total quantity at least 12
SELECT region, category, SUM(quantity) AS total_quantity
FROM sales
GROUP BY region, category
HAVING SUM(quantity) >= 12;

-- 11. Orders on/after 2026-02-01, by region and salesperson, total sales > 100000
SELECT region, salesperson, SUM(amount) AS total_sales
FROM sales
WHERE order_date >= '2026-02-01'
GROUP BY region, salesperson
HAVING SUM(amount) > 100000;

-- 12. Region/category/salesperson groups, total sales >= 50000, highest first
SELECT region, category, salesperson,
       COUNT(*) AS total_orders,
       SUM(quantity) AS total_quantity,
       SUM(amount) AS total_sales
FROM sales
GROUP BY region, category, salesperson
HAVING SUM(amount) >= 50000
ORDER BY total_sales DESC;
