

------------------------------------------------------------------
--- 1.Defining a variable and assigning a value to it.
------------------------------------------------------------------
/*
----1.A
DECLARE @CNT int 
SET @CNT = 4
PRINT @CNT
*/





/*
----1.B
DECLARE @VAR CHAR(50)
SET @VAR = 'This is one Parameter'
PRINT @VAR 
*/



/*
----1.B
DECLARE @CNT int = 4 
PRINT @CNT

*/



/*
----1.D
DECLARE @CNT int 
SET @CNT = 4
SET @CNT = 3
PRINT @CNT
*/
/*
----1.E
DECLARE @CNT int 
SELECT @CNT = COUNT(*) FROM [core].[Customer]
PRINT @CNT
*/

----1.F
---- DECLARE @price FLOAT =  300

--- SELECT COUNT(*) AS CNT FROM [core].[Product]
--- WHERE base_price>@price

------------------------------------------------------------------
--- 2.IF
------------------------------------------------------------------

----2.A
/*
DECLARE @PRICE FLOAT =  800
DECLARE @CNT INT  

SELECT @CNT= COUNT(*) FROM [core].[Product]
WHERE base_price>@price

IF @CNT = 0
BEGIN 
	PRINT('No product is available above the given price') 
END
ELSE
BEGIN
	PRINT('product is available above the given price') 
END 
*/

----2.B
/*
DECLARE @PRICE FLOAT =  200
DECLARE @CNT INT  

SELECT @CNT= COUNT(*) FROM [core].[Product]
WHERE base_price>@price


IF @CNT = 0
	PRINT('No product is available above the given price') 
ELSE IF (@CNT < 250)
	PRINT('Less than 25% of products are available above the given price')    
ELSE IF (@CNT < 500)
	PRINT('Less than 50% of products are available above the given price')    
ELSE IF (@CNT < 750)
	PRINT('Less than 75% of products are available above the given price')    
ELSE 
	PRINT('more than 75% of products are available above the given price')     
*/ 

------------------------------------------------------------------
--- 3.IIF
------------------------------------------------------------------

----3.A
--SELECT *, IIF(status= 1,'Active','Not Active') AS Category_status FROM [core].[customer]

----3.B

--SELECT *, IIF(base_price<=500,'Low price','High price') as Category_price FROM [core].[product]

----3.C
/*
SELECT 
        *,
        IIF(base_price<=300,'Low price',
        IIF(base_price>300 AND base_price <= 600,'Mid Price','High Price')
        ) as Category_price 
FROM [core].[product]
*/
------------------------------------------------------------------
--- 4.CASE
------------------------------------------------------------------

----4.A
/*
SELECT 
    *,
    CASE 
        WHEN base_price <= 300 THEN 'Low price'
        WHEN base_price > 300 AND base_price <= 600 THEN 'Mid-range'
        WHEN base_price > 600 AND base_price <= 1000 THEN 'High price'
        ELSE 'Unkonwn'
    END AS price_category
FROM [core].[Product];
*/

----4.B
/*
SELECT 
    *,
    CASE 
        WHEN status = 1 THEN 'Active'
        WHEN status = 0 THEN 'Not Active'
        ELSE 'Unknown '
    END AS Category_status
FROM [core].[Customer]
*/
----4.C
/*
SELECT 
    *,
    CASE status
        WHEN  1 THEN 'Active'
        WHEN  0 THEN 'Not Active'
        ELSE 'Unknown '
    END AS Category_status
FROM [core].[Customer]
*/

----4.D
/*
SELECT * FROM [core].[Product]
ORDER BY 
    CASE 
        WHEN base_price <= 300 THEN 'Low price'
        WHEN base_price > 300 AND base_price <= 600 THEN 'Mid-range'
        WHEN base_price > 600 AND base_price <= 1000 THEN 'High price'
        END
   DESC
*/

------------------------------------------------------------------
--- 5.EXISTS
------------------------------------------------------------------

----5.A
/*
DECLARE @CNT INT

SELECT @CNT = COUNT(*) FROM [core].[Address] 

IF @CNT > 0
 PRINT 'The table contains data'
ELSE
 PRINT 'The table is empty'
 */
----5.B
/*
IF EXISTS(SELECT * FROM [core].[Address])
 PRINT 'The table contains data'
ELSE
 PRINT 'The table is empty'
 */
----5.C
/*
SELECT * FROM [sales].[OrderHeader] A
WHERE  EXISTS 
(SELECT * FROM [sales].[Payment] B WHERE A.orderHeaderID = B.orderHeaderID)
*/
/*
SELECT * FROM [sales].[OrderHeader] A
WHERE NOT EXISTS 
(SELECT * FROM [sales].[Payment] B WHERE A.orderHeaderID = B.orderHeaderID)
*/

------------------------------------------------------------------
--- 6.WHILE
------------------------------------------------------------------

----6.1
/*
DECLARE @CNT int = 1 
DECLARE @NUM int 

SELECT @NUM = COUNT(*) FROM [core].[Category]


WHILE @CNT <= @NUM
BEGIN
    
    PRINT @CNT

    SET @CNT = @CNT + 1
END 
*/
----6.2

/*
DECLARE @CNT int = 1 
DECLARE @NUM int 
DECLARE @Col_Name Varchar(40)

SELECT @NUM = COUNT(*) FROM [core].[Category]


WHILE @CNT <= @NUM
BEGIN
    
    SELECT @Col_Name = category_name from [core].[Category] where categoryID = @CNT

    SET @CNT = @CNT + 1
    PRINT @Col_Name
END 
*/

