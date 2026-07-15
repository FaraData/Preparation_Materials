--- 
--- 
--- 
--- 
--- 
--- SELECT A.quantity,A.unit_price,B.product_name,B.base_price,B.created_at  FROM [sales].[OrderDetail] A
--- INNER JOIN [core].[Product] B ON A.productID = B.productID 
--- 
--- 
--- SELECT * FROM [core].[Product][sales].[OrderHeader]
--- 
--- 
--- SELECT * FROM [inventory].[Inventory]
--- SELECT * FROM [inventory].[Warehouses]

--- ;WITH CTE_A AS
--- (
--- SELECT *, ABS(CHECKSUM(newID()))%19 +1 AS DIS FROM [sales].[OrderDetail]
--- )
--- 
--- UPDATE CTE_A SET discount = DIS

;WITH CTE_A AS
(
SELECT A.unit_price, A.[discount_in_%] , B.base_price, 
ROUND(B.base_price* (1- A.[discount_in_%]/100.00),2) AS price_

FROM [sales].[OrderDetail] A
INNER JOIN [core].[Product] B ON A.productID = B.productID
)

update CTE_A SET unit_price = price_



