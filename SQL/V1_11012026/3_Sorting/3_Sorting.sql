

------------------------------------------------------------------
--- 1.Sorting based on a single column. 
------------------------------------------------------------------

----1.A. Sorting

SELECT * FROM [core].[Customer]
ORDER BY first_name

----1.B. ASC
SELECT * FROM [core].[Customer]
ORDER BY first_name ASC 

----1.C. DESC

SELECT * FROM [core].[Customer]
ORDER BY first_name DESC

------------------------------------------------------------------
--- 2.Sorting based on a multiple columns. 
------------------------------------------------------------------

----2.A. Sorting

SELECT * FROM [core].[Customer]
ORDER BY first_name,last_name  

----2.B. Sorting (ASC / DESC)

SELECT * FROM [core].[Customer]
ORDER BY first_name ASC,last_name DESC  

----2.C. Sorting using Column Number

SELECT * FROM [core].[Customer]
ORDER BY 2 ASC,3 DESC  

------------------------------------------------------------------
--- 3.TOP N AND ORDER BY 
------------------------------------------------------------------

----3.A. TOP N + ORDER BY

SELECT * FROM [core].[Product]
ORDER BY Base_price DESC 

SELECT TOP 5 * FROM [core].[Product]
ORDER BY Base_price DESC 

----3.B. TOP N with ties + ORDER BY

SELECT TOP 5 with ties * FROM [core].[Product]
ORDER BY Base_price DESC 

SELECT * FROM [core].[Product]
ORDER BY (SELECT NULL)

------------------------------------------------------------------
--- 4.Browsing a Result Set: OFFSET  … FETCH …
------------------------------------------------------------------

SELECT *
FROM [core].[Product]
ORDER BY base_price


SELECT *
FROM [core].[Product]
ORDER BY base_price
OFFSET 3 ROWS
FETCH NEXT 3 ROWS ONLY;

------------------------------------------------------------------
--- 5.Random sorting
------------------------------------------------------------------

SELECT * FROM [core].[Customer]
ORDER BY NEWID()

SELECT TOP 5 * FROM [core].[Customer]
ORDER BY NEWID()

------------------------------------------------------------------
--- 5.SELECT+ TOPN + WHERE + ORDER BY 
------------------------------------------------------------------

SELECT TOP 10 * FROM [core].[Product]
WHERE brand = 'Apple'

SELECT TOP 10 * FROM [core].[Product]
WHERE brand = 'Apple'
ORDER BY base_price DESC 











