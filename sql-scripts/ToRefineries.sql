CREATE VIEW ToRefineries AS 
SELECT 
t.Country,
t.Product,
t.BALANCE,
t.Unit,
t.Value,
v.Month,
v.Year,
MONTH(v.Month + '1 2000') AS MonthNO,
DATEFROMPARTS (v.Year, MONTH(v.Month + '1 2000') , 1) AS Dates 
FROM InputtoRefineries AS t

CROSS APPLY (
SELECT
	LEFT( t.Time, CHARINDEX ('-', t.Time) -1)		AS Month,
	2000 +SUBSTRING(
			t.Time, CHARINDEX ('-', t.Time) +1 ,
			LEN(t.Time) - CHARINDEX ('-',t.Time) 
												) AS Year 
															) AS v ;