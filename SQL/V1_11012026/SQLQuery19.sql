


SELECT 
DISTINCT warehouse_name
FROM
(
SELECT 
	B.product_name, 
	C.warehouse_name,
	A.quantity,
	A.last_updated 
FROM 
	[inventory].[Inventory] A
INNER JOIN 
	[core].[Product] B ON A.ProductID = B.ProductID
INNER JOIN 
	[inventory].[Warehouses] C ON A.warehouseID = C.warehouseID 
)TBL


SELECT * fROM [core].[Product]