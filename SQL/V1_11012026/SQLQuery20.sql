

SELECT * FROM [core].[Customer] 
ORDER BY created_at 

;WITH CTE_A AS 
(
SELECT 
A.order_date,
B.created_At,
DATEDIFF(DAY,A.order_date , B.created_At) AS DIFF, B.Status FROM [sales].[OrderHeader] A
LEFT JOIN core.Customer  B ON A.customerID = B.CustomerID
)

SELECT * FROM  CTE_A  
--16

SELECT COUNTRY, COUNT(*) FROM
(
SELECT 
REVERSE(
SUBSTRING(REVERSE(ADDRESS),1,CHARINDEX(',',REVERSE(ADDRESS))-2)
) AS COUNTRY
FROM [sales].[OrderHeader] A
INNER JOIN [core].[Customer] B ON A.customerID = B.customerID 
)TBL
GROUP BY COUNTRY

 


SELECT *  FROM [sales].[OrderHeader] 


SELECT *, CHARINDEX(',',REVERSE(ADDRESS)) AS MatchPosition  FROM [core].[Customer]


/*
SELECT COUNTRY, COUNT(*) AS CNT
FROM
(
SELECT *, 
REVERSE(
SUBSTRING(REVERSE(ADDRESS),1,CHARINDEX(',',REVERSE(ADDRESS))-2)
) AS COUNTRY
FROM 
[core].[Customer]
)TBL
GROUP BY COUNTRY 


SELECT DISTINCt country FROM [inventory].[Warehouses]
*/