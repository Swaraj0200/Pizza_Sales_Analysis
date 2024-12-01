-- KPI's
use sqlpro;


-- Total Revenue
SELECT SUM(total_price) AS Total_Revenue 
FROM pizza_sales;

-- Average Order Value
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Average_Order_Value 
FROM pizza_sales;


-- Total Pizza Sold
SELECT SUM(quantity) AS Total_pizza_sold 
FROM pizza_sales;

-- Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales;


-- Average Pizzas Per Order
SELECT SUM(quantity) / COUNT(DISTINCT order_id) AS Avg_Pizzas_Per_order
FROM pizza_sales;


-- Chart Requirement 

-- Daily Trend for Total Orders
SELECT DAYNAME(order_date) AS order_day, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DAYNAME(order_date);


-- Monthly Trend for Total Orders
SELECT MONTHNAME(order_date) AS Month_Name, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY MONTHNAME(order_date)
ORDER BY MONTH_NAME DESC;

-- % of Sales by Pizza Category
SELECT pizza_category, CAST(SUM(Total_price) AS DECIMAL(10,2)) AS Total_Sales, CAST(SUM(Total_price) * 100 / (SELECT SUM(Total_price) FROM pizza_sales) AS DECIMAL (10, 2)) AS Percentage_sales
FROM pizza_sales
GROUP BY Pizza_category;


-- % of Sales by Pizza Size
SELECT pizza_size, CAST(SUM(Total_price) AS DECIMAL (10, 2)) AS Total_Sales, CAST(SUM(Total_price) * 100 / (SELECT SUM(Total_price) FROM pizza_sales) AS DECIMAL (10, 2)) AS Percentage_sales
FROM pizza_sales
GROUP BY Pizza_size
ORDER BY pizza_size;

-- Total Pizzas Sold by Pizza Category
 SELECT pizza_category, SUM(quantity) AS Total_Quantity_Sold
 FROM pizza_Sales
 GROUP BY pizza_category;
 
 -- Top 5 Best seller by Revenue
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5;

-- Bottom 5 Best seller by Revenue
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue
LIMIT 5;

 -- Top 5 Best seller by Quantity
 SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
LIMIT 5;

-- Bottom 5 Best seller by Quantity
SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold 
LIMIT 5;

-- Top 5 Best seller by Total Orders
SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Order
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Order DESC
LIMIT 5;

-- Bottom 5 Best seller by Total Orders
SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Order
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Order 
LIMIT 5;
