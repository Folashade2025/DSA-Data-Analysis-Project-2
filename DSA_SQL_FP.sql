create database DSA_FP

--- 1. Which product category had the highest sales?-
SELECT [Product_Category],ROUND(SUM(Sales),2) AS Total_Sales
FROM [dbo].[KMS Sql Case Study]
GROUP BY [Product_Category]
ORDER BY Total_Sales DESC
---ANSWER: TECHNOLOGY has the highest sales category

----2. Top 3 and Bottom 3 regions in terms of sales----
-- Top 3
SELECT TOP 3 Region, ROUND (SUM(Sales),2) AS Total_Sales
FROM [dbo].[KMS Sql Case Study]
GROUP BY Region
ORDER BY Total_Sales DESC
---Top 3 regions includes: West, Ontario and Prarie--

-- Bottom 3
SELECT TOP 3 Region, ROUND (SUM(Sales),2) AS Total_Sales
FROM [dbo].[KMS Sql Case Study]
GROUP BY Region
ORDER BY Total_Sales ASC
---Bottom 3 regions are Nunavut, Northwest Territories and Yukon

SELECT * FROM [dbo].[KMS Sql Case Study]

----3. Total sales of appliances in Ontario-----
SELECT ROUND(SUM(Sales),2) AS Ontario_Appliances_Sales
FROM [dbo].[KMS Sql Case Study]
WHERE [Product_Sub_Category] = 'Appliances' AND Province = 'Ontario'
--- total sales of Ontario Appliances sales:202346.84

----4. Advice to increase revenue from bottom 10 customers----
SELECT [Customer_Name],ROUND(SUM(Sales),2) AS Total_Sales
FROM [dbo].[KMS Sql Case Study]
GROUP BY [Customer_Name]
ORDER BY Total_Sales ASC
--- Answer: For these bottom customers give discounts and personalized promotions

---5. KMS incurred the most shipping cost using which shipping method?---
SELECT [Ship_Mode], ROUND(SUM([Shipping_Cost]),2) AS Total_Shipping_Cost
FROM [dbo].[KMS Sql Case Study]
GROUP BY [Ship_Mode]
ORDER BY Total_Shipping_Cost DESC
---ANSWER: DELIVERY TRUCK----

----6. Most valuable customers and their typical products/services---
SELECT [Customer_Name], ROUND(SUM(Sales),2) AS Total_Sales, 
       COUNT(DISTINCT [Product_Category]) AS Categories_Purchased
FROM [dbo].[KMS Sql Case Study]
GROUP BY [Customer_Name]
ORDER BY Total_Sales DESC
---ANSWER :EMILY PHAN

---7. Which small business customer had the highest sales?
SELECT [Customer_Name], ROUND (SUM(Sales),2) AS Total_Sales
FROM [dbo].[KMS Sql Case Study]
WHERE [Customer_Segment] = 'Small Business'
GROUP BY [Customer_Name]
ORDER BY Total_Sales DESC
---ANSWER: DENNIS KANE

---8. Corporate Customer with most orders between 2009 – 2012---

SELECT TOP 1 [Customer_Name], COUNT([Order_ID]) AS Total_Orders
FROM [dbo].[KMS Sql Case Study]
WHERE [Customer_Segment] = 'Corporate'
  AND YEAR(CONVERT(DATE, [Order_Date], 101)) BETWEEN 2009 AND 2012
GROUP BY [Customer_Name]
ORDER BY Total_Orders DESC;
----ANSWER: ADAM HART


---9. Most profitable consumer customer---
SELECT [Customer_Name], ROUND(SUM(Profit),2) AS Total_Profit
FROM [dbo].[KMS Sql Case Study]
WHERE [Customer_Segment] = 'Consumer'
GROUP BY [Customer_Name]
ORDER BY Total_Profit DESC
---ANSWER: EMILY PHAN

--10. Which customer returned items and what segment do they belong to?--
SELECT* FROM[dbo].[KMS Sql Case Study]
SELECT* FROM[dbo].[Order_Status]

SELECT [Customer_Name], [Customer_Segment]
FROM [dbo].[KMS Sql Case Study]
WHERE [Order_ID] IN (
  SELECT [Order_ID] FROM [Order_Status] WHERE Status = 'Returned'
)
GROUP BY [Customer_Name], [Customer_Segment]
---Answer: Aaron Bergman of Coporate Segment.

--11. Evaluate shipping cost vs. order priority---

SELECT [Order_Priority], [Ship_Mode], ROUND(AVG([Shipping_Cost]),2) AS Avg_Shipping_Cost
FROM [dbo].[KMS Sql Case Study]
GROUP BY [Order_Priority], [Ship_Mode]
ORDER BY [Order_Priority], Avg_Shipping_Cost;
---ANSWER: High-priority orders should ideally use Express Air.
---Low-priority orders should use Delivery Truck. 
---If the inverse is true (e.g., low-priority using Express), the company may be overspending.



