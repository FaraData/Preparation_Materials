

------------------------------------------------------------------
--- 1. VALUES 
------------------------------------------------------------------
/*
SELECT * FROM [sales].[Payment]

SELECT 1 as Number   

SELECT * FROM (SELECT 1 AS col1)TBL
SELECT * FROM (SELECT 1)TBL(col1)

SELECT * FROM (VALUES (1))TBL(col1)
SELECT * FROM (VALUES (1,2))TBL(col1,col2)
SELECT * FROM (VALUES (1,2),(3,4))TBL(col1,col2)
SELECT * FROM (VALUES (1,2,'A'),(3,4,'B'))TBL(col1,col2,col3)
*/

/*
SELECT * FROM 
(VALUES
('Huawei'),
('Oppo'),
('Vivo'),
('Samsung'),
('OnePlus'),
('Realme'),
('Motorola'),
('TCL'),
('Honor'),
('Fitbit'),
('Fujifilm'),
('Olympus'),
('Panasonic Lumix'),
('Sigma'),
('Tamron'),
('SteelSeries'),
('HyperX'),
('Mad Catz'),
('Turtle Beach'),
('Scuf Gaming'),
('Synology'),
('QNAP'),
('D-Link'),
('Western Digital'),
('Seagate'),
('NetApp'),
('Acer'),
('MSI'),
('Gigabyte'),
('AMD'),
('Intel'),
('EVGA'),
('Supermicro')
)TBL(BrandName)
*/

/*
SELECT * FROM [core].[Product]
WHERE brand in (SELECT * FROM 
(VALUES
('Huawei'),
('Oppo'),
('Vivo'),
('Samsung'),
('OnePlus'),
('Realme'),
('Motorola'),
('TCL'),
('Honor'),
('Fitbit'),
('Fujifilm'),
('Olympus'),
('Panasonic Lumix'),
('Sigma'),
('Tamron'),
('SteelSeries'),
('HyperX'),
('Mad Catz'),
('Turtle Beach'),
('Scuf Gaming'),
('Synology'),
('QNAP'),
('D-Link'),
('Western Digital'),
('Seagate'),
('NetApp'),
('Acer'),
('MSI'),
('Gigabyte'),
('AMD'),
('Intel'),
('EVGA'),
('Supermicro')
)TBL(BrandName))

*/

------------------------------------------------------------------
--- 2.  
------------------------------------------------------------------
SELECT DISTINCT brand FROM [core].[product]

SELECT 
        *,
        IIF(base_price<=300,'Low price',
        IIF(base_price>300 AND base_price <= 600,'Mid Price','High Price')
        ) as Category_price 
FROM [core].[product]


SELECT * FROM (SELECT 
        *,
        IIF(base_price<=300,'Low price',
        IIF(base_price>300 AND base_price <= 600,'Mid Price','High Price')
        ) as Category_price 
FROM [core].[product])TBL
WHERE Category_price = 'High Price'

-- What to do and what no to 

--1. ORDER BY IS  NOT ALLOWED  (Using TOP 100 PERCENT )
--2. All Columns in Subquery must has a name (Title)


