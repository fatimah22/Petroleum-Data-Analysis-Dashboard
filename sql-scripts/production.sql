ALTER VIEW Production AS 

SELECT 
[Country],
[Product],
[Balance],
[Unit],
[Year],
[Month],
[Value],
MONTH([month]+ '1 2000') AS MonthNO,
DATEFROMPARTS ([Year], MONTH([month]+ '1 2000'), 1) AS DATE 
FROM Oilproduction 


UNION 

SELECT 
t.Country,
'Crude Oil' AS [Product],
'Production' AS [Product],
t.Unit,
v.Year,
v.Month,
t.production,
MONTH([month]+ '1 2000') AS MonthNO,
DATEFROMPARTS(v.Year,MONTH(Month+'1 2000'),1) AS FullDate
FROM OILProduction2024 AS t
CROSS APPLY(
	SELECT 
	LEFT([Date],CHARINDEX('-',[Date]) -1) AS Month ,
	2000 +SUBSTRING(
	[Date],CHARINDEX('-',[Date]) +1 , 
	LEN([Date]) - CHARINDEX('-',[Date])
										) AS Year 
										) AS v 
