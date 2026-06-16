CREATE VIEW Exports_Refined AS 
SELECT
[Country],
[Product],
[Unit],
[Balance],
[Year],
[Month],
[Value],
MONTH(Month+'1 2000') AS MonthNO,
DATEFROMPARTS(Year,MONTH(Month+'1 2000'),1) AS Date
FROM ExportsofRefinedproducts

UNION 

SELECT
t.Country, 
'Total oil products'AS Product,
t.Unit,
'Exports' AS Balance,
v.Year,
v.Month,
t.Exports,
MONTH(v.Month+ '1 2000') AS MonthNO,
DATEFROMPARTS(v.Year,MONTH(v.Month+ '1 2000') , 1) AS Date1 
FROM ExportsofRefinedProducts2024 AS t
CROSS APPLY (
SELECT 
	LEFT(Date, CHARINDEX('-',Date) - 1) AS Month,
	2000+SUBSTRING(
			Date, CHARINDEX('-',Date) +1,
			LEN(Date) - CHARINDEX('-',Date) ) AS Year ) AS v ;