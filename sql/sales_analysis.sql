-- Retail Sales Analytics Project
-- Author: Akshay

-- 1. Customer Lifetime Value
SELECT
CustomerID,
SUM(Revenue) AS total_revenue
FROM retail_sales
GROUP BY CustomerID
ORDER BY total_revenue DESC;

-- 2. Customer Purchase Frequency
SELECT
CustomerID,
COUNT(OrderID) AS total_orders
FROM retail_sales
GROUP BY CustomerID
ORDER BY total_orders DESC;

-- 3. High Value Customers
SELECT
CustomerID,
SUM(Revenue) AS revenue
FROM retail_sales
GROUP BY CustomerID
HAVING revenue > 10000;

-- 4. Revenue by Product
SELECT
Product,
SUM(Revenue) AS total_revenue
FROM retail_sales
GROUP BY Product
ORDER BY total_revenue DESC;

-- 5. Sales Summary Table
CREATE TABLE sales_summary AS
SELECT
Product,
COUNT(OrderID) AS total_orders,
SUM(Quantity) AS total_units_sold,
SUM(Revenue) AS total_revenue,
AVG(Revenue) AS avg_order_value
FROM retail_sales
GROUP BY Product;