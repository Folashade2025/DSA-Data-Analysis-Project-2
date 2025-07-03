# DSA-Data-Analysis-Project-2
##  PROJECT TITLE 2: Kultra Mega Stores (KMS) & Customer Analysis with SQL
---
[Project Overview 2](#project-overview)

[DATA SOURCES 2](#data-sources)

[Tools Used 2](#tools-used)

[Data Cleaning and Preparations 2](data-cleaning-and-preparations)

[Exploratory Data Analysis](#exploratory-data-analysis)

[Data Analysis](#data-analysis)

[Final Report 2](#final-report)

---
### Project Overview: Sales data is analysed in this SQL project to provide important business insights, such as: Finding the product categories with the best sales figuring out the overall sales for particular subcategories (e.g., Office Supplies > Appliances) Region-specific sales data filtering (Ontario, Canada).
The objective is to use SQL queries to illustrate data extraction, aggregation, and business intelligence. In order to find business insights about sales, customers, shipping, and regional performance, it offers a thorough SQL-based analysis of a fictitious retail dataset from Kultra Mega Stores (KMS). Real-world business concerns including determining the most lucrative client categories, examining return trends, assessing regional sales discrepancies, and determining shipping cost effectiveness are all addressed by the project using raw sales data. The included SQL queries are intended to show off real-world uses of subqueries, aggregation functions, GROUP BY, and JOIN, providing a solid basis for corporate information and decision-making.
---
### Tools Used 2:
Microsoft SQL Serve  
Use Case: Perfect for students, data analysts, or job seekers who want to show off their SQL prowess using real-world business scenarios and data exploration methods.
---
### Data Source 2:
- KMS_Table: Simulated retail transactions
- Order_Status: Order return status and delivery outcome
---
### Key Insights Uncovered:
Top-performing product categories and regions
Sales distribution across customer segments
Revenue trends from small business and corporate clients
Return behaviors and their segment associations
Shipping cost analysis by method and priority alignment
---
### Key SQL Queries:
---
create database DSA_FP

--- 1. Which product category had the highest sales?-
SELECT [Product_Category],ROUND(SUM(Sales),2) AS Total_Sales
FROM [dbo].[KMS Sql Case Study]
GROUP BY [Product_Category]
ORDER BY Total_Sales DESC

----2. Top 3 and Bottom 3 regions in terms of sales----
-- Top 3
SELECT TOP 3 Region, ROUND (SUM(Sales),2) AS Total_Sales
FROM [dbo].[KMS Sql Case Study]
GROUP BY Region
ORDER BY Total_Sales DESC


-- Bottom 3
SELECT TOP 3 Region, ROUND (SUM(Sales),2) AS Total_Sales
FROM [dbo].[KMS Sql Case Study]
GROUP BY Region
ORDER BY Total_Sales ASC


SELECT * FROM [dbo].[KMS Sql Case Study]

----3. Total sales of appliances in Ontario-----
SELECT ROUND(SUM(Sales),2) AS Ontario_Appliances_Sales
FROM [dbo].[KMS Sql Case Study]
WHERE [Product_Sub_Category] = 'Appliances' AND Province = 'Ontario'

----4. Advice to increase revenue from bottom 10 customers----
SELECT [Customer_Name],ROUND(SUM(Sales),2) AS Total_Sales
FROM [dbo].[KMS Sql Case Study]
GROUP BY [Customer_Name]
ORDER BY Total_Sales ASC


---5. KMS incurred the most shipping cost using which shipping method?---
SELECT [Ship_Mode], ROUND(SUM([Shipping_Cost]),2) AS Total_Shipping_Cost
FROM [dbo].[KMS Sql Case Study]
GROUP BY [Ship_Mode]
ORDER BY Total_Shipping_Cost DESC


----6. Most valuable customers and their typical products/services---
SELECT [Customer_Name], ROUND(SUM(Sales),2) AS Total_Sales, 
       COUNT(DISTINCT [Product_Category]) AS Categories_Purchased
FROM [dbo].[KMS Sql Case Study]
GROUP BY [Customer_Name]
ORDER BY Total_Sales DESC


---7. Which small business customer had the highest sales?
SELECT [Customer_Name], ROUND (SUM(Sales),2) AS Total_Sales
FROM [dbo].[KMS Sql Case Study]
WHERE [Customer_Segment] = 'Small Business'
GROUP BY [Customer_Name]
ORDER BY Total_Sales DESC


---8. Corporate Customer with most orders between 2009 – 2012---

SELECT TOP 1 [Customer_Name], COUNT([Order_ID]) AS Total_Orders
FROM [dbo].[KMS Sql Case Study]
WHERE [Customer_Segment] = 'Corporate'
  AND YEAR(CONVERT(DATE, [Order_Date], 101)) BETWEEN 2009 AND 2012
GROUP BY [Customer_Name]
ORDER BY Total_Orders DESC;


---9. Most profitable consumer customer---
SELECT [Customer_Name], ROUND(SUM(Profit),2) AS Total_Profit
FROM [dbo].[KMS Sql Case Study]
WHERE [Customer_Segment] = 'Consumer'
GROUP BY [Customer_Name]
ORDER BY Total_Profit DESC


--10. Which customer returned items and what segment do they belong to?--
SELECT* FROM[dbo].[KMS Sql Case Study]
SELECT* FROM[dbo].[Order_Status]

SELECT [Customer_Name], [Customer_Segment]
FROM [dbo].[KMS Sql Case Study]
WHERE [Order_ID] IN (
  SELECT [Order_ID] FROM [Order_Status] WHERE Status = 'Returned'
)
GROUP BY [Customer_Name], [Customer_Segment]


--11. Evaluate shipping cost vs. order priority---

SELECT [Order_Priority], [Ship_Mode], ROUND(AVG([Shipping_Cost]),2) AS Avg_Shipping_Cost
FROM [dbo].[KMS Sql Case Study]
GROUP BY [Order_Priority], [Ship_Mode]
ORDER BY [Order_Priority], Avg_Shipping_Cost;

---
### Final Report 2:
Observation
- TECHNOLOGY has the highest sales category
In terms of Total sales
- The top 3 regions includes: West, Ontario and Prarie
- The bottom 3 regions are Nunavut, Northwest Territories and Yukon
- KMS incurred the most shipping cost using delivery truck shipping method.
- Most valuable and profitable customers is EMILY PHAN
-  DENNIS KANE is the the highest sales small business customer
-  Corporate Customer with most orders between 2009 – 2012 is Adam Hart
Recommendation
Suggestions based on question 4, which asks KMS management for advice on how to boost income from the company's bottom ten clients. Here are some suggestions about that:

Provide these clients with tailored discounts and loyalty plans.
Examine their purchasing patterns to identify any gaps and adjust your marketing strategy.
Assign committed sales representatives to uphold connections and provide assistance.
Combine goods or services that they could find interesting based on their previous purchases.

Evaluate shipping cost vs. order priority
High-priority orders should ideally use Express Air.
Low-priority orders should use Delivery Truck. 
If the inverse is true (e.g., low-priority using Express), the company may be overspending.
