

;WITH CTE_A AS
(
SELECT  A.OrderHeaderID FROM [sales].[OrderHeader] A
LEFT JOIN [sales].[OrderDetail] B ON A.OrderHeaderID = B.OrderHeaderID  
WHERE B.OrderHeaderID IS NULL 
),
CTE_B AS
(
SELECT TOP 4104  * FROM 
(
SELECT *,
ROW_NUMBER()OVER(Partition BY orderHeaderID ORDER BY quantity ) AS RW 
FROM 
[sales].[OrderDetail]
)TBL
WHERE RW = 3
ORDER BY NEWID()
),
CTE_C AS 
(
SELECT  ROW_NUMBER()OVER(ORDER BY B.OrderHeaderID ) AS RW,B.OrderHeaderID as detail , A.OrderHeaderID AS header FROM CTE_B B
FULL JOIN CTE_A A ON B.OrderHeaderID = A.OrderHeaderID
)




---SELECT * FROM CTE_C
--UPDATE A SET  A.detail = B.header  
--FROM CTE_C A 
--INNER JOIN CTE_C B ON A.RW = B.RW + 4104


SELECT  A.OrderHeaderID, B.OrderHeaderID FROM [sales].[OrderHeader] A
FULL JOIN [sales].[OrderDetail] B ON A.OrderHeaderID = B.OrderHeaderID  
WHERE B.OrderHeaderID IS NULL OR A.OrderHeaderID IS NULL  


SELECT  * FROM [sales].[OrderHeader]
ORDER BY orderHeaderID


'30,000'



