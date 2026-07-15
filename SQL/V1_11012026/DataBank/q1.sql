
;WITH CTE_A AS
(
SELECT CAST(RIGHT(product_name,2) AS INT) AS Number ,* FROM [core].[Product]
),
CTE_B AS
(
SELECT NUMBER/10 + NUMBER%10 AS Number2,* FROM CTE_A 
),
CTE_C AS
(
SELECT * FROM
(
VALUES 
(1,'I'),
(2,'II'),
(3,'III'),
(4,'IV'),
(5,'V'),
(6,'VI'),
(7,'VII'),
(8,'VIII'),
(9,'IX'),
(10,'X'),
(11,'XI'),
(12,'XII'),
(13,'XIII'),
(14,'XIV'),
(15,'XV'),
(16,'XVI'),
(17,'XVII'),
(18,'XVIII'),
(19,'XIX'),
(20,'XX')
)TBL(NUM1,NUM2)
)



SELECT LEFT(product_name,LEN(product_name)-2 ) +' '+ C.Num2,B.* FROM CTE_B B
LEFT JOIN CTE_C C ON B.Number2 = C.Num1





