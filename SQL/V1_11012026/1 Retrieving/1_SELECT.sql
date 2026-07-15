
------------------------------------------------------------------
--- 1.Retrieving All Columns (*) 
------------------------------------------------------------------

----1.A SQL-SERVER-NAME->Databasename->schemaname->Tablename

------ SELECT * FROM [FARAMPC\MSSQLSERVER01].[DigitalSalesDB].[core].[Customer]
------ * Denotes all the columns of the table 

----1.B. schemaname->Tablename

------ SELECT * FROM [core].[Customer]

----1.C. schema [dbo]  Tablename

------ SELECT * FROM [core].[Customer]


------------------------------------------------------------------
--- 2.Retrieving Specific columns (*)
------------------------------------------------------------------

----2.A.

------ SELECT first_name F_Name, last_name L_Name FROM [core].[Customer]

--NOTE:
--SELECT first_name , last_name email FROM [core].[Customer]

----2.B.

------SELECT F_Name = first_name  ,L_Name= last_name   FROM [core].[Customer]

----2.C.

------SELECT first_name AS F_Name, last_name AS L_Name FROM [core].[Customer] ----

--QUESTIONS?
-- SELECT first_name, first_name, first_name FROM [core].[Customer]
-- SELECT first_name AS last_name , last_name AS first_name FROM [core].[Customer]

----2.D. Columns with space 

------SELECT [first name] FROM [core].[Customer]



