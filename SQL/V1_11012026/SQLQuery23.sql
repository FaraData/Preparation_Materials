/*
;WITH CTE_A AS
(
SELECT orderHeaderID,SUM(unit_price) AS unit_price_total FROM [sales].[OrderDetail] 
GROUP BY orderHeaderID 
)

UPDATE A SET total_amount = unit_price_total
FROM [sales].[OrderHeader] A
INNER JOIN CTE_A B ON A.orderHeaderID = B.orderHeaderID
*/

SELECT * FROM [sales].[OrderHeader]

SELECT * FROM [sales].[OrderDetail] 
WHERE orderHeaderID = 2
1992.92

