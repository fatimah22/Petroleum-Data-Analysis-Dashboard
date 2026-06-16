ALTER VIEW Gas_Demand AS 
SELECT
    t.[Country],
    t.[Product],
    t.[BALANCE],
    t.[Unit],
    t.[column6] AS Value,
    v.Month,
    v.Year,
    MONTH(v.Month+'1 2000') AS MonthNO,
    DATEFROMPARTS (v.Year, MONTH(v.Month+'1 2000') , 1) AS Date
FROM domesticuseofgasoline AS t

CROSS APPLY (
SELECT
LEFT(t.Time, CHARINDEX('-',t.Time) - 1 ) AS Month,
2000+SUBSTRING(
t.Time, CHARINDEX('-',t.Time) +1 ,
LEN (t.Time) - CHARINDEX('-',t.Time) ) AS Year
                                                ) AS v 
UNION

SELECT
    s.Country,
    s.Product,
    s.BALANCE,
    s.Unit,
    s.Value,
    f.Month,
    f.Year,
    MONTH(f.Month + ' 1 2000') AS MonthNO,
    DATEFROMPARTS(f.Year, MONTH(f.Month + ' 1 2000') , 1) AS Date
FROM LocalGasolineConsumption AS s

CROSS APPLY (
SELECT
2000+ LEFT(s.Time, CHARINDEX('-',s.Time) - 1 )  AS Year,
 SUBSTRING(
                s.Time, CHARINDEX('-',s.Time) +1 ,
                LEN(s.Time) - CHARINDEX('-',s.Time) ) AS Month
                                                ) AS f
UNION

SELECT 
    [Country],
    [Product],
    [Balance],
    [Unit],
    [Value],
    [Month],
    [Year],
    MONTH(Month+ '1 2000') AS MonthNo,
    DATEFROMPARTS (Year, MONTH(Month+ '1 2000'), 1) AS Date
FROM [OIL PROJECT].[dbo].[refinedproductsdemand]
                                                