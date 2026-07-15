

------------------------------------------------------------------
--- 1.Filtering Data Using Where claus (Concept)
------------------------------------------------------------------


----1.A Introduction

--- WHERE clause filters based on logical conditions
/*Search conditions are written as predicates, 
which are expressions that evaluate to one of 
the Boolean results of TRUE, FALSE, or UNKNOWN.
Only rows for which the final evaluation of the 
WHERE clause is TRUE are returned. 
Table 1-1 lists some of the common operators
*/


SELECT * FROM [core].[Customer]
WHERE 1=1

SELECT * FROM [core].[Customer]
WHERE 1=0

SELECT * FROM [core].[Customer]
WHERE 1!='A'

------------------------------------------------------------------
--- 2. Different Operators
------------------------------------------------------------------

----2.A Different Operators

/*
= 
!=
<>
>
<
>=
<=
!>
!<
*/

--int

SELECT * FROM [core].[Customer]
WHERE --1!=0 
      --1<>0  
      --1>0  
      --1>=0 
      --1!<0

SELECT * FROM [core].[Customer]
WHERE --1=0   
      --1<0  
      --1<=0 
      --1!>0


SELECT * FROM [core].[Customer]
WHERE --'A'!='B' 
      --'A'<>'B'  
      --'A'<'B' 
      --'A'<='B' 
      --'A'!>'B'

SELECT * FROM [core].[Customer]
WHERE --'A'='B'   
      --'A'>'B'  
      --'A'>='B' 
      --'A'!<'B'

----2.B  Diffetent DataTypes

SELECT * FROM [core].[Customer]
WHERE 1 = 'A'

SELECT * FROM [core].[Customer]
WHERE 1 <>'A'

----2.C  Diffetent Examples

SELECT * FROM [core].[Product]
WHERE brand = 'Apple'

SELECT * FROM [core].[Product]
WHERE brand <> 'Dell'

SELECT * FROM [core].[Product]
WHERE brand != 'Dell'

SELECT * FROM [core].[Product]
WHERE base_price > 400

SELECT * FROM [core].[Product]
WHERE base_price < 800

SELECT * FROM [inventory].[Warehouses]
WHERE country = 'Germany'

SELECT * FROM [inventory].[Inventory]
WHERE updated_at > '2024-12-31'

------------------------------------------------------------------
--- 3. AND OR
------------------------------------------------------------------

----3.A
SELECT * FROM [core].[Product]
WHERE brand = 'Apple' AND  base_price < 500

SELECT * FROM [core].[Product]
WHERE brand = 'Apple' OR base_price < 500

----3.B
SELECT * FROM [core].[Product]
WHERE brand = 'Apple' OR  base_price < 500 AND brand = 'Sony' 

SELECT * FROM [core].[Product]
WHERE (brand = 'Apple' OR  base_price < 500) AND brand = 'Sony' 

SELECT * FROM [core].[Product]
WHERE brand = 'Apple' OR  (base_price < 500 AND brand = 'Sony') 

------------------------------------------------------------------
--- 3. IN  / NOT IN
------------------------------------------------------------------

--- IN

SELECT * FROM [core].[Product]
WHERE brand = 'Apple' 
      OR brand = 'Dell'
      OR brand = 'Sony'
      OR brand = 'Philips'

SELECT * FROM [core].[Product]
WHERE brand in  ('Apple','Dell','Sony','Philips') 
       
-- NOT IN        

SELECT * FROM [core].[Product]      
WHERE     brand != 'Apple' 
      AND brand != 'Dell'
      AND brand != 'Sony'
      AND brand != 'Philips'

SELECT * FROM [core].[Product]      
WHERE     brand <> 'Apple' 
      AND brand <> 'Dell'
      AND brand <> 'Sony'
      AND brand <> 'Philips'

SELECT * FROM [core].[Product]      
WHERE brand NOT IN ('Apple','Dell','Sony','Philips')

SELECT * FROM [core].[Product]      
WHERE NOT brand IN ('Apple','Dell','Sony','Philips')


------------------------------------------------------------------
--- 4. Between / Not Between
------------------------------------------------------------------

---4.A BETWEEN

----Example 1:
SELECT * FROM [sales].[OrderHeader]
WHERE order_date >= '2023-01-01' AND order_date <= '2023-12-31' AND status <> 'Cancelled'

SELECT * FROM [sales].[OrderHeader]
WHERE order_date BETWEEN '2023-01-01' AND '2023-12-31' AND status <> 'Cancelled'


----Example 2:
SELECT * FROM [sales].[OrderHeader]
WHERE total_amount >= 500 AND total_amount <= 1000 status <> 'Cancelled'

SELECT * FROM [sales].[OrderHeader]
WHERE total_amount BETWEEN 500 AND  1000  AND status <> 'Cancelled'

---4.A NOT BETWEEN

SELECT * FROM [sales].[OrderHeader]
WHERE order_date < '2023-01-01' OR order_date > '2023-12-31' AND status <> 'Cancelled'

SELECT * FROM [sales].[OrderHeader]
WHERE order_date NOT BETWEEN '2023-01-01' AND '2023-12-31' AND status <> 'Cancelled'

SELECT * FROM [sales].[OrderHeader]
WHERE NOT order_date BETWEEN '2023-01-01' AND '2023-12-31' AND status <> 'Cancelled'

SELECT * FROM [sales].[OrderHeader]
WHERE total_amount < 500 OR total_amount > 1000 AND status <> 'Cancelled'

SELECT * FROM [sales].[OrderHeader]
WHERE total_amount NOT BETWEEN 500 AND 1000 AND status <> 'Cancelled'

SELECT * FROM [sales].[OrderHeader]
WHERE NOT total_amount BETWEEN 500 AND 1000 AND status <> 'Cancelled'

------------------------------------------------------------------
--- 5. Like
------------------------------------------------------------------

-- '%...'   '...%'   '%...%'

---%...'
SELECT * FROM [core].[Customer]
WHERE Address like '%spain'

---'%...%'
SELECT * FROM [core].[Customer]
WHERE Address like '%Hamburg%'

---'...%'
SELECT * FROM [core].[Customer]
WHERE   first_name Like 'A%'

--[]   
SELECT * FROM [core].[Customer]
WHERE   first_name Like 'A%'
    OR  first_name Like 'B%'
    OR  first_name Like 'C%'
    OR  first_name Like 'D%'

SELECT * FROM [core].[Customer]
WHERE   first_name Like '[A-D]%'
ORDER BY first_name

--[^]
SELECT * FROM [core].[Customer]
WHERE   first_name not Like 'A%'
    AND  first_name not Like 'B%'
    AND  first_name not Like 'C%'
    AND  first_name not Like 'D%'

SELECT * FROM [core].[Customer]
WHERE   first_name  Like '[^A-D]%'

----search /%
--1.like '%/%%'
--2.like '/%%'
--3.like '%/%'

SELECT * FROM [core].[Customer]
WHERE address like '%/%%'