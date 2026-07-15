

------------------------------------------------------------------
--- 1. String Function
------------------------------------------------------------------

----1.1 LEN (String Length & Information)

SELECT ADDRESS,LEN(Address) AS Len_Address FROM [core].[Customer]

----1.2 DATALENGTH (String Length & Information)

SELECT ADDRESS,DATALENGTH(Address) AS Len_Bytes FROM [core].[Customer]

----1.3 CHARINDEX (String Length & Information)

SELECT ADDRESS,CHARINDEX('St',Address) AS Position FROM [core].[Customer]

SELECT ADDRESS,CHARINDEX('Paris',Address) AS Position FROM [core].[Customer]

----1.4 PATINDEX (String Length & Information)

SELECT ADDRESS,PATINDEX('%Par%',Address) AS Position FROM [core].[Customer]


/* (String Length & Information)
ASCII(character)
UNICODE(character)
*/


----1.5 SUBSTRING + CHARINDEX (String Extraction)

SELECT email, SUBSTRING(email,1,6)  FROM [core].[Customer]
SELECT CHARINDEX('@', email)  FROM [core].[Customer]
SELECT email, SUBSTRING(email,1,CHARINDEX('@', email)-1 )  FROM [core].[Customer]

----1.6 LEFT + CHARINDEX (String Extraction)

SELECT email, LEFT(email,5)  FROM [core].[Customer]
SELECT email, LEFT(email,CHARINDEX('@', email)-1 )  FROM [core].[Customer]

----1.7 RIGHT + CHARINDEX + LEM (String Extraction)

SELECT email, RIGHT(email,5)  FROM [core].[Customer]
SELECT email, RIGHT(email,LEN(email)- CHARINDEX('@', email) )  FROM [core].[Customer]

SELECT 
	created_at, 
	LEFT(created_at,4) AS YEAR_,
	RIGHT(created_at,2) AS Day_
FROM
	[core].[Customer]


----1.8 REPLACE (String Modification)

SELECT *, REPLACE(ADDRESS,'St','Street') FROM [core].[Customer]
SELECT *, REPLACE(ADDRESS,',','/') FROM [core].[Customer]

----1.9 STUFF (String Modification)

--STUFF('SQL Tutorial', 1, 3, 'SQL SERVER');

SELECT 
	email,
	STUFF(email,CHARINDEX('@',email)+1,
	len(email), 'gmail.com')  AS new_email
FROM 
	[core].[Customer]

----1.10 TRANSLATE (String Modification)

SELECT 
	email,
	TRANSLATE(email,'abc','def')
FROM 
	[core].[Customer]

---1.11 UPPER / LOWER (Case Conversion)

SELECT brand, UPPER(brand) AS brand_upper FROM [core].[Product]

SELECT brand, LOWER(brand) AS brand_lower FROM [core].[Product]

---1.12 Trimming & Padding 

SELECT *,LTRIM(col1) AS LeftTrimmedString FROM (SELECT '     SQL Tutorial' AS col1)TBL

SELECT *,RTRIM(col1) AS RigthTrimmedString FROM (SELECT 'SQL Tutorial     ' AS col1)TBL

SELECT *,TRIM(col1) AS LeftRightTrimmedString FROM (SELECT '    SQL Tutorial     ' AS col1)TBL

---1.13 CONCAT/CONCAT_WS (Concatenation)

SELECT 'Data' + ' is Beautiful'

SELECT 'Data' + ' is Beautiful' 

SELECT '1' + '1'

SELECT '1' + 1

SELECT 'Data' + 1

SELECT CONCAT('Data' , 1)

SELECT 
	first_name,
	last_name, 
	first_name + ' '+ last_name as FullName,
	CONCAT(first_name,' ',last_name) AS FullName
FROM 
	[core].[Customer]

SELECT 
	brand, 
	product_name, 
	[description],
	brand + ' : ' + product_name + ' : ' + [description] AS Full_Description,
	CONCAT(brand,' : ',product_name,' : ',[description]) AS Full_Description,
	CONCAT_WS(' : ',brand,product_name,[description]) AS Full_Description
FROM 
	[core].[Product]

---1.14


