/*
=========================================================
        STORE SALES ANALYSIS PROJECT
=========================================================

Project      : Store Sales Analytics
Database     : PostgreSQL
Table Name   : cleaned_sales_data

Author       : Shashwat Sharma
=========================================================
*/


/*
=========================================================
SECTION 1 : DATA EXPLORATION
=========================================================
*/


/*
---------------------------------------------------------
Query 1

Business Question:
How many total records are present in the dataset?

SQL Concepts:
SELECT
COUNT()
AS
---------------------------------------------------------
*/

SELECT COUNT(*) AS total_records
FROM cleaned_sales_data;



/*
---------------------------------------------------------
Query 2

Business Question:
How many unique customers are there?

SQL Concepts:
COUNT()
DISTINCT
---------------------------------------------------------
*/

SELECT COUNT(DISTINCT "Customer ID") AS unique_customers
FROM cleaned_sales_data;



/*
---------------------------------------------------------
Query 3

Business Question:
How many unique products are available?

SQL Concepts:
COUNT()
DISTINCT
---------------------------------------------------------
*/

SELECT COUNT(DISTINCT "Product ID") AS unique_products
FROM cleaned_sales_data;



/*
---------------------------------------------------------
Query 4

Business Question:
How many states does the company operate in?

SQL Concepts:
COUNT()
DISTINCT
---------------------------------------------------------
*/

SELECT COUNT(DISTINCT "State") AS total_states
FROM cleaned_sales_data;



/*
---------------------------------------------------------
Query 5

Business Question:
What are the different product categories available?

SQL Concepts:
SELECT
DISTINCT
ORDER BY
---------------------------------------------------------
*/

SELECT DISTINCT "Category of Goods"
FROM cleaned_sales_data
ORDER BY "Category of Goods";



/*
---------------------------------------------------------
Query 6

Business Question:
What is the date range of the dataset?

SQL Concepts:
MIN()
MAX()
---------------------------------------------------------
*/

SELECT
    MIN("Order Date") AS first_order_date,
    MAX("Order Date") AS last_order_date
FROM cleaned_sales_data;



/*
---------------------------------------------------------
Query 7

Business Question:
What is the highest, lowest and average sales value?

SQL Concepts:
MAX()
MIN()
AVG()
ROUND()
---------------------------------------------------------
*/

SELECT
    MAX("Sales") AS highest_sales,
    MIN("Sales") AS lowest_sales,
    ROUND(AVG("Sales")::NUMERIC,2) AS average_sales
FROM cleaned_sales_data;



/*
---------------------------------------------------------
Query 8

Business Question:
What is the highest, lowest and average profit?

SQL Concepts:
MAX()
MIN()
AVG()
ROUND()
---------------------------------------------------------
*/

SELECT
    MAX("Profit") AS highest_profit,
    MIN("Profit") AS lowest_profit,
    ROUND(AVG("Profit")::NUMERIC,2) AS average_profit
FROM cleaned_sales_data;



/*
=========================================================
SECTION 2 : SALES ANALYSIS
=========================================================
*/


/*
---------------------------------------------------------
Query 9

Business Question:
What are the total sales by region?

SQL Concepts:
SUM()
GROUP BY
ORDER BY
---------------------------------------------------------
*/

SELECT
    "Region",
    ROUND(SUM("Sales")::NUMERIC,2) AS total_sales
FROM cleaned_sales_data
GROUP BY "Region"
ORDER BY total_sales DESC;



/*
---------------------------------------------------------
Query 10

Business Question:
What are the total sales by category?

SQL Concepts:
SUM()
GROUP BY
ORDER BY
---------------------------------------------------------
*/

SELECT
    "Category of Goods",
    ROUND(SUM("Sales")::NUMERIC,2) AS total_sales
FROM cleaned_sales_data
GROUP BY "Category of Goods"
ORDER BY total_sales DESC;



/*
---------------------------------------------------------
Query 11

Business Question:
What are the total sales by sub-category?

SQL Concepts:
SUM()
GROUP BY
ORDER BY
---------------------------------------------------------
*/

SELECT
    "Sub-Category",
    ROUND(SUM("Sales")::NUMERIC,2) AS total_sales
FROM cleaned_sales_data
GROUP BY "Sub-Category"
ORDER BY total_sales DESC;



/*
---------------------------------------------------------
Query 12

Business Question:
What are the total sales by customer segment?

SQL Concepts:
SUM()
GROUP BY
ORDER BY
---------------------------------------------------------
*/

SELECT
    "Segment",
    ROUND(SUM("Sales")::NUMERIC,2) AS total_sales
FROM cleaned_sales_data
GROUP BY "Segment"
ORDER BY total_sales DESC;



/*
---------------------------------------------------------
Query 13

Business Question:
What are the total sales by outlet type?

SQL Concepts:
SUM()
GROUP BY
ORDER BY
---------------------------------------------------------
*/

SELECT
    "Outlet Type",
    ROUND(SUM("Sales")::NUMERIC,2) AS total_sales
FROM cleaned_sales_data
GROUP BY "Outlet Type"
ORDER BY total_sales DESC;



/*
---------------------------------------------------------
Query 14

Business Question:
What are the total sales by city type?

SQL Concepts:
SUM()
GROUP BY
ORDER BY
---------------------------------------------------------
*/

SELECT
    "City Type",
    ROUND(SUM("Sales")::NUMERIC,2) AS total_sales
FROM cleaned_sales_data
GROUP BY "City Type"
ORDER BY total_sales DESC;



/*
---------------------------------------------------------
Query 15

Business Question:
What are the monthly sales trends?

SQL Concepts:
SUM()
GROUP BY
ORDER BY
---------------------------------------------------------
*/

SELECT
    "Year Month",
    ROUND(SUM("Sales")::NUMERIC,2) AS total_sales
FROM cleaned_sales_data
GROUP BY "Year Month"
ORDER BY "Year Month";

/*
---------------------------------------------------------
Query 16

Business Question:
Which are the Top 10 best-selling products?

SQL Concepts:
SUM()
GROUP BY
ORDER BY
LIMIT
---------------------------------------------------------
*/

SELECT
    "Product ID",
    ROUND(SUM("Sales")::NUMERIC,2) AS total_sales
FROM cleaned_sales_data
GROUP BY "Product ID"
ORDER BY total_sales DESC
LIMIT 10;



/*
---------------------------------------------------------
Query 17

Business Question:
Who are the Top 10 customers by sales?

SQL Concepts:
SUM()
COUNT()
GROUP BY
ORDER BY
LIMIT
---------------------------------------------------------
*/

SELECT
    "Customer ID",
    COUNT(*) AS total_orders,
    ROUND(SUM("Sales")::NUMERIC,2) AS total_sales
FROM cleaned_sales_data
GROUP BY "Customer ID"
ORDER BY total_sales DESC
LIMIT 10;



/*
=========================================================
SECTION 3 : PROFIT ANALYSIS
=========================================================
*/


/*
---------------------------------------------------------
Query 18

Business Question:
What is the total profit generated by each region?

SQL Concepts:
SUM()
GROUP BY
ORDER BY
---------------------------------------------------------
*/

SELECT
    "Region",
    ROUND(SUM("Profit")::NUMERIC,2) AS total_profit
FROM cleaned_sales_data
GROUP BY "Region"
ORDER BY total_profit DESC;



/*
---------------------------------------------------------
Query 19

Business Question:
What is the total profit generated by each product category?

SQL Concepts:
SUM()
GROUP BY
ORDER BY
---------------------------------------------------------
*/

SELECT
    "Category of Goods",
    ROUND(SUM("Profit")::NUMERIC,2) AS total_profit
FROM cleaned_sales_data
GROUP BY "Category of Goods"
ORDER BY total_profit DESC;



/*
---------------------------------------------------------
Query 20

Business Question:
Which are the Top 10 most profitable products?

SQL Concepts:
SUM()
GROUP BY
ORDER BY
LIMIT
---------------------------------------------------------
*/

SELECT
    "Product ID",
    ROUND(SUM("Profit")::NUMERIC,2) AS total_profit
FROM cleaned_sales_data
GROUP BY "Product ID"
ORDER BY total_profit DESC
LIMIT 10;



/*
---------------------------------------------------------
Query 21

Business Question:
Which are the Bottom 10 least profitable products?

SQL Concepts:
SUM()
GROUP BY
ORDER BY
LIMIT
---------------------------------------------------------
*/

SELECT
    "Product ID",
    ROUND(SUM("Profit")::NUMERIC,2) AS total_profit
FROM cleaned_sales_data
GROUP BY "Product ID"
ORDER BY total_profit ASC
LIMIT 10;



/*
---------------------------------------------------------
Query 22

Business Question:
Which product categories are profitable?

SQL Concepts:
SUM()
GROUP BY
HAVING
ORDER BY
---------------------------------------------------------
*/

SELECT
    "Category of Goods",
    ROUND(SUM("Profit")::NUMERIC,2) AS total_profit
FROM cleaned_sales_data
GROUP BY "Category of Goods"
HAVING SUM("Profit") > 0
ORDER BY total_profit DESC;



/*
---------------------------------------------------------
Query 23

Business Question:
What is the average profit margin by category?

SQL Concepts:
AVG()
GROUP BY
ORDER BY
---------------------------------------------------------
*/

SELECT
    "Category of Goods",
    ROUND(AVG("Profit Margin (%)")::NUMERIC,2) AS average_profit_margin
FROM cleaned_sales_data
GROUP BY "Category of Goods"
ORDER BY average_profit_margin DESC;



/*
---------------------------------------------------------
Query 24

Business Question:
Which regions have generated more than ₹50,000 profit?

SQL Concepts:
SUM()
GROUP BY
HAVING
ORDER BY
---------------------------------------------------------
*/

SELECT
    "Region",
    ROUND(SUM("Profit")::NUMERIC,2) AS total_profit
FROM cleaned_sales_data
GROUP BY "Region"
HAVING SUM("Profit") > 50000
ORDER BY total_profit DESC;



/*
=========================================================
SECTION 4 : CUSTOMER ANALYSIS
=========================================================
*/


/*
---------------------------------------------------------
Query 25

Business Question:
How many customers belong to each age group?

SQL Concepts:
COUNT()
GROUP BY
ORDER BY
---------------------------------------------------------
*/

SELECT
    "Age Group",
    COUNT(DISTINCT "Customer ID") AS total_customers
FROM cleaned_sales_data
GROUP BY "Age Group"
ORDER BY total_customers DESC;



/*
---------------------------------------------------------
Query 26

Business Question:
What are the total sales generated by each age group?

SQL Concepts:
SUM()
GROUP BY
ORDER BY
---------------------------------------------------------
*/

SELECT
    "Age Group",
    ROUND(SUM("Sales")::NUMERIC,2) AS total_sales
FROM cleaned_sales_data
GROUP BY "Age Group"
ORDER BY total_sales DESC;



/*
---------------------------------------------------------
Query 27

Business Question:
What is the total profit generated by each age group?

SQL Concepts:
SUM()
GROUP BY
ORDER BY
---------------------------------------------------------
*/

SELECT
    "Age Group",
    ROUND(SUM("Profit")::NUMERIC,2) AS total_profit
FROM cleaned_sales_data
GROUP BY "Age Group"
ORDER BY total_profit DESC;



/*
---------------------------------------------------------
Query 28

Business Question:
What is the average selling price for each age group?

SQL Concepts:
AVG()
GROUP BY
ORDER BY
---------------------------------------------------------
*/

SELECT
    "Age Group",
    ROUND(AVG("Average Selling Price")::NUMERIC,2) AS average_selling_price
FROM cleaned_sales_data
GROUP BY "Age Group"
ORDER BY average_selling_price DESC;



/*
---------------------------------------------------------
Query 29

Business Question:
Which customer segments generate the highest sales?

SQL Concepts:
SUM()
GROUP BY
ORDER BY
---------------------------------------------------------
*/

SELECT
    "Segment",
    ROUND(SUM("Sales")::NUMERIC,2) AS total_sales
FROM cleaned_sales_data
GROUP BY "Segment"
ORDER BY total_sales DESC;



/*
---------------------------------------------------------
Query 30

Business Question:
Which customer segments generate the highest profit?

SQL Concepts:
SUM()
GROUP BY
ORDER BY
---------------------------------------------------------
*/

SELECT
    "Segment",
    ROUND(SUM("Profit")::NUMERIC,2) AS total_profit
FROM cleaned_sales_data
GROUP BY "Segment"
ORDER BY total_profit DESC;


/*
---------------------------------------------------------
Query 31

Business Question:
Which are the Top 10 customers based on total profit?

SQL Concepts:
SUM()
GROUP BY
ORDER BY
LIMIT
---------------------------------------------------------
*/

SELECT
    "Customer ID",
    ROUND(SUM("Profit")::NUMERIC,2) AS total_profit
FROM cleaned_sales_data
GROUP BY "Customer ID"
ORDER BY total_profit DESC
LIMIT 10;



/*
=========================================================
SECTION 5 : ADVANCED SQL
=========================================================
*/


/*
---------------------------------------------------------
Query 32

Business Question:
Classify each order based on its profitability.

SQL Concepts:
CASE WHEN
END
AS
---------------------------------------------------------
*/

SELECT
    "Order ID",
    "Profit",

    CASE
        WHEN "Profit" < 0 THEN 'Loss'
        WHEN "Profit" = 0 THEN 'Break Even'
        ELSE 'Profit'
    END AS profit_status

FROM cleaned_sales_data;



/*
---------------------------------------------------------
Query 33

Business Question:
How many orders fall under each profit status?

SQL Concepts:
CASE WHEN
COUNT()
GROUP BY
ORDER BY
---------------------------------------------------------
*/

SELECT

    CASE
        WHEN "Profit" < 0 THEN 'Loss'
        WHEN "Profit" = 0 THEN 'Break Even'
        ELSE 'Profit'
    END AS profit_status,

    COUNT(*) AS total_orders

FROM cleaned_sales_data

GROUP BY profit_status

ORDER BY total_orders DESC;



/*
---------------------------------------------------------
Query 34

Business Question:
Find customers whose total sales are greater than the
overall average customer sales.

SQL Concepts:
WITH (CTE)
SUM()
AVG()
GROUP BY
WHERE
---------------------------------------------------------
*/

WITH customer_sales AS
(
    SELECT
        "Customer ID",
        SUM("Sales") AS total_sales
    FROM cleaned_sales_data
    GROUP BY "Customer ID"
)

SELECT
    "Customer ID",
    ROUND(total_sales::NUMERIC,2) AS total_sales
FROM customer_sales
WHERE total_sales >
(
    SELECT AVG(total_sales)
    FROM customer_sales
)
ORDER BY total_sales DESC;



/*
---------------------------------------------------------
Query 35

Business Question:
Assign a unique row number to every customer
based on total sales.

SQL Concepts:
ROW_NUMBER()
OVER()
ORDER BY
---------------------------------------------------------
*/

SELECT

    "Customer ID",

    ROUND(SUM("Sales")::NUMERIC,2) AS total_sales,

    ROW_NUMBER() OVER
    (
        ORDER BY SUM("Sales") DESC
    ) AS customer_rank

FROM cleaned_sales_data

GROUP BY "Customer ID";



/*
---------------------------------------------------------
Query 36

Business Question:
Rank customers based on total sales.

SQL Concepts:
RANK()
OVER()
ORDER BY
---------------------------------------------------------
*/

SELECT

    "Customer ID",

    ROUND(SUM("Sales")::NUMERIC,2) AS total_sales,

    RANK() OVER
    (
        ORDER BY SUM("Sales") DESC
    ) AS sales_rank

FROM cleaned_sales_data

GROUP BY "Customer ID";



/*
---------------------------------------------------------
Query 37

Business Question:
Assign dense ranks to customers
based on total sales.

SQL Concepts:
DENSE_RANK()
OVER()
ORDER BY
---------------------------------------------------------
*/

SELECT

    "Customer ID",

    ROUND(SUM("Sales")::NUMERIC,2) AS total_sales,

    DENSE_RANK() OVER
    (
        ORDER BY SUM("Sales") DESC
    ) AS dense_sales_rank

FROM cleaned_sales_data

GROUP BY "Customer ID";



/*
---------------------------------------------------------
Query 38

Business Question:
Find the Top 3 products within each category.

SQL Concepts:
CTE
ROW_NUMBER()
PARTITION BY
---------------------------------------------------------
*/

WITH product_sales AS
(
    SELECT

        "Category of Goods",

        "Product ID",

        ROUND(SUM("Sales")::NUMERIC,2) AS total_sales,

        ROW_NUMBER() OVER
        (
            PARTITION BY "Category of Goods"
            ORDER BY SUM("Sales") DESC
        ) AS product_rank

    FROM cleaned_sales_data

    GROUP BY
        "Category of Goods",
        "Product ID"
)

SELECT *

FROM product_sales

WHERE product_rank <= 3;



/*
---------------------------------------------------------
Query 39

Business Question:
Calculate the running total of monthly sales.

SQL Concepts:
SUM()
OVER()
ORDER BY
WINDOW FUNCTION
---------------------------------------------------------
*/

SELECT

    "Year Month",

    ROUND(SUM("Sales")::NUMERIC,2) AS monthly_sales,

    ROUND
    (
        SUM(SUM("Sales")) OVER
        (
            ORDER BY "Year Month"
        )::NUMERIC,
        2
    ) AS running_total_sales

FROM cleaned_sales_data

GROUP BY "Year Month"

ORDER BY "Year Month";



/*
---------------------------------------------------------
Query 40

Business Question:
What percentage of total sales
does each region contribute?

SQL Concepts:
SUM()
OVER()
ROUND()
WINDOW FUNCTION
---------------------------------------------------------
*/

SELECT

    "Region",

    ROUND(SUM("Sales")::NUMERIC,2) AS total_sales,

    ROUND
    (
        (
            SUM("Sales")
            /
            SUM(SUM("Sales")) OVER()
        )::NUMERIC * 100,
        2
    ) AS sales_percentage

FROM cleaned_sales_data

GROUP BY "Region"

ORDER BY total_sales DESC;