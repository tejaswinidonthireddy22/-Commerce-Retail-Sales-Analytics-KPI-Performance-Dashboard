-- ============================================================
-- E-Commerce Retail Sales Analytics — SQL Query Collection
-- Dataset : ecommerce_sales_dataset.csv (17,049 records)
-- Platform : Turkish Online Retail | Jan 2023 – Mar 2024
-- ============================================================


-- ============================================================
-- 1. REVENUE & SALES KPIs
-- ============================================================

-- Total Revenue, AOV, Transactions
SELECT
    COUNT(Order_ID)                         AS Total_Transactions,
    COUNT(DISTINCT Customer_ID)             AS Unique_Customers,
    ROUND(SUM(Total_Amount), 2)             AS Total_Revenue_TRY,
    ROUND(AVG(Total_Amount), 2)             AS Avg_Order_Value,
    ROUND(AVG(Customer_Rating), 2)          AS Avg_Customer_Rating,
    ROUND(AVG(Delivery_Time_Days), 1)       AS Avg_Delivery_Days,
    ROUND(AVG(Session_Duration_Minutes), 1) AS Avg_Session_Minutes,
    ROUND(AVG(Pages_Viewed), 1)             AS Avg_Pages_Viewed
FROM ecommerce_orders;


-- ============================================================
-- 2. MONTHLY SALES TREND
-- ============================================================

SELECT
    DATE_FORMAT(Date, '%Y-%m')              AS Month,
    COUNT(Order_ID)                         AS Transactions,
    ROUND(SUM(Total_Amount), 0)             AS Monthly_Revenue,
    ROUND(AVG(Total_Amount), 0)             AS Avg_Order_Value,
    ROUND(AVG(Customer_Rating), 2)          AS Avg_Rating,
    ROUND(
        (SUM(Total_Amount) - LAG(SUM(Total_Amount)) OVER (ORDER BY DATE_FORMAT(Date,'%Y-%m')))
        / LAG(SUM(Total_Amount)) OVER (ORDER BY DATE_FORMAT(Date,'%Y-%m')) * 100, 2
    )                                       AS MoM_Growth_Pct
FROM ecommerce_orders
GROUP BY DATE_FORMAT(Date, '%Y-%m')
ORDER BY Month;


-- ============================================================
-- 3. SALES BY PRODUCT CATEGORY
-- ============================================================

SELECT
    Product_Category,
    COUNT(Order_ID)                                             AS Transactions,
    ROUND(SUM(Total_Amount), 0)                                 AS Revenue,
    ROUND(AVG(Total_Amount), 0)                                 AS Avg_Order_Value,
    ROUND(AVG(Unit_Price), 0)                                   AS Avg_Unit_Price,
    ROUND(AVG(Quantity), 2)                                     AS Avg_Quantity,
    ROUND(AVG(Customer_Rating), 2)                              AS Avg_Rating,
    ROUND(
        SUM(Total_Amount) * 100.0 / SUM(SUM(Total_Amount)) OVER(), 1
    )                                                           AS Revenue_Pct
FROM ecommerce_orders
GROUP BY Product_Category
ORDER BY Revenue DESC;


-- ============================================================
-- 4. REVENUE BY CITY
-- ============================================================

SELECT
    City,
    COUNT(Order_ID)                         AS Total_Orders,
    COUNT(DISTINCT Customer_ID)             AS Unique_Customers,
    ROUND(SUM(Total_Amount), 0)             AS City_Revenue,
    ROUND(AVG(Total_Amount), 0)             AS Avg_Order_Value,
    ROUND(AVG(Customer_Rating), 2)          AS Avg_Rating,
    ROUND(AVG(Delivery_Time_Days), 1)       AS Avg_Delivery_Days
FROM ecommerce_orders
GROUP BY City
ORDER BY City_Revenue DESC;


-- ============================================================
-- 5. RETURNING VS NEW CUSTOMER ANALYSIS
-- ============================================================

SELECT
    CASE WHEN Is_Returning_Customer = TRUE THEN 'Returning'
         ELSE 'New' END                     AS Customer_Type,
    COUNT(Order_ID)                         AS Transactions,
    ROUND(SUM(Total_Amount), 0)             AS Total_Revenue,
    ROUND(AVG(Total_Amount), 0)             AS Avg_Order_Value,
    ROUND(
        COUNT(Order_ID) * 100.0 / (SELECT COUNT(*) FROM ecommerce_orders), 1
    )                                       AS Pct_of_Total_Orders,
    ROUND(AVG(Session_Duration_Minutes), 1) AS Avg_Session_Min,
    ROUND(AVG(Pages_Viewed), 1)             AS Avg_Pages,
    ROUND(AVG(Customer_Rating), 2)          AS Avg_Rating
FROM ecommerce_orders
GROUP BY Is_Returning_Customer;


-- ============================================================
-- 6. AVERAGE RATING BY PRODUCT CATEGORY
-- ============================================================

SELECT
    Product_Category,
    ROUND(AVG(Customer_Rating), 2)          AS Avg_Rating,
    COUNT(Order_ID)                         AS Total_Reviews,
    SUM(CASE WHEN Customer_Rating >= 4 THEN 1 ELSE 0 END) AS High_Ratings,
    SUM(CASE WHEN Customer_Rating <= 2 THEN 1 ELSE 0 END) AS Low_Ratings,
    ROUND(
        SUM(CASE WHEN Customer_Rating >= 4 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1
    )                                       AS High_Rating_Pct
FROM ecommerce_orders
GROUP BY Product_Category
ORDER BY Avg_Rating DESC;


-- ============================================================
-- 7. DISCOUNT IMPACT ANALYSIS
-- ============================================================

SELECT
    Product_Category,
    COUNT(Order_ID)                                                 AS Orders,
    ROUND(SUM(Discount_Amount), 0)                                  AS Total_Discount_Given,
    ROUND(SUM(Total_Amount), 0)                                     AS Net_Revenue,
    ROUND(SUM(Total_Amount + Discount_Amount), 0)                   AS Gross_Revenue,
    ROUND(
        SUM(Discount_Amount) * 100.0 / SUM(Total_Amount + Discount_Amount), 2
    )                                                               AS Avg_Discount_Pct,
    ROUND(AVG(Customer_Rating), 2)                                  AS Avg_Rating
FROM ecommerce_orders
GROUP BY Product_Category
ORDER BY Avg_Discount_Pct DESC;

-- Discount vs No Discount comparison
SELECT
    CASE WHEN Discount_Amount > 0 THEN 'Discounted'
         ELSE 'No Discount' END             AS Discount_Applied,
    COUNT(Order_ID)                         AS Orders,
    ROUND(AVG(Total_Amount), 0)             AS Avg_Order_Value,
    ROUND(AVG(Customer_Rating), 2)          AS Avg_Rating,
    ROUND(AVG(Quantity), 2)                 AS Avg_Quantity
FROM ecommerce_orders
GROUP BY (Discount_Amount > 0);


-- ============================================================
-- 8. DEVICE USAGE DISTRIBUTION
-- ============================================================

SELECT
    Device_Type,
    COUNT(Order_ID)                         AS Orders,
    ROUND(
        COUNT(Order_ID) * 100.0 / (SELECT COUNT(*) FROM ecommerce_orders), 1
    )                                       AS Pct_Share,
    ROUND(SUM(Total_Amount), 0)             AS Revenue,
    ROUND(AVG(Session_Duration_Minutes), 1) AS Avg_Session_Min,
    ROUND(AVG(Pages_Viewed), 1)             AS Avg_Pages,
    ROUND(AVG(Customer_Rating), 2)          AS Avg_Rating
FROM ecommerce_orders
GROUP BY Device_Type
ORDER BY Orders DESC;


-- ============================================================
-- 9. CUSTOMER SATISFACTION VS DELIVERY TIME
-- ============================================================

SELECT
    CASE
        WHEN Delivery_Time_Days BETWEEN 1  AND 3  THEN 'Express (1-3d)'
        WHEN Delivery_Time_Days BETWEEN 4  AND 7  THEN 'Fast (4-7d)'
        WHEN Delivery_Time_Days BETWEEN 8  AND 14 THEN 'Standard (8-14d)'
        ELSE 'Slow (15+d)'
    END                                     AS Delivery_Speed,
    COUNT(Order_ID)                         AS Orders,
    ROUND(AVG(Customer_Rating), 2)          AS Avg_Rating,
    ROUND(AVG(Total_Amount), 0)             AS Avg_Order_Value,
    ROUND(
        COUNT(Order_ID) * 100.0 / (SELECT COUNT(*) FROM ecommerce_orders), 1
    )                                       AS Pct_Orders
FROM ecommerce_orders
GROUP BY Delivery_Speed
ORDER BY Avg_Rating DESC;


-- ============================================================
-- 10. PAYMENT METHOD ANALYSIS
-- ============================================================

SELECT
    Payment_Method,
    COUNT(Order_ID)                         AS Transactions,
    ROUND(
        COUNT(Order_ID) * 100.0 / (SELECT COUNT(*) FROM ecommerce_orders), 1
    )                                       AS Pct_Share,
    ROUND(SUM(Total_Amount), 0)             AS Revenue,
    ROUND(AVG(Total_Amount), 0)             AS Avg_Order_Value,
    ROUND(AVG(Customer_Rating), 2)          AS Avg_Rating
FROM ecommerce_orders
GROUP BY Payment_Method
ORDER BY Transactions DESC;


-- ============================================================
-- 11. CUSTOMER ENGAGEMENT METRICS
-- ============================================================

SELECT
    Device_Type,
    ROUND(AVG(Session_Duration_Minutes), 1) AS Avg_Session_Min,
    ROUND(AVG(Pages_Viewed), 1)             AS Avg_Pages_Viewed,
    ROUND(AVG(Total_Amount), 0)             AS Avg_Order_Value,
    ROUND(AVG(Customer_Rating), 2)          AS Avg_Rating,
    COUNT(Order_ID)                         AS Transactions
FROM ecommerce_orders
GROUP BY Device_Type
ORDER BY Avg_Session_Min DESC;

-- Session duration buckets
SELECT
    CASE
        WHEN Session_Duration_Minutes <= 20  THEN 'Short (≤20 min)'
        WHEN Session_Duration_Minutes <= 60  THEN 'Medium (21-60 min)'
        ELSE 'Long (61+ min)'
    END                                     AS Session_Bucket,
    COUNT(Order_ID)                         AS Orders,
    ROUND(AVG(Total_Amount), 0)             AS Avg_Order_Value,
    ROUND(AVG(Customer_Rating), 2)          AS Avg_Rating,
    ROUND(AVG(Pages_Viewed), 1)             AS Avg_Pages
FROM ecommerce_orders
GROUP BY Session_Bucket
ORDER BY Avg_Order_Value DESC;


-- ============================================================
-- 12. TOP HIGH-VALUE CUSTOMERS (RFM STYLE)
-- ============================================================

SELECT
    Customer_ID,
    COUNT(Order_ID)                         AS Order_Count,
    ROUND(SUM(Total_Amount), 0)             AS Total_Spent,
    ROUND(AVG(Total_Amount), 0)             AS Avg_Order_Value,
    ROUND(AVG(Customer_Rating), 2)          AS Avg_Rating,
    MAX(Date)                               AS Last_Order_Date,
    CASE WHEN Is_Returning_Customer THEN 'Returning' ELSE 'New' END AS Customer_Type
FROM ecommerce_orders
GROUP BY Customer_ID, Is_Returning_Customer
ORDER BY Total_Spent DESC
LIMIT 20;
