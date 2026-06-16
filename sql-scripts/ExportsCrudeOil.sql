CREATE VIEW Exports_CrudeOil AS 
SELECT
    Country,
    Product,
    Balance,
    Unit,
    Year,
    Month,
    Value,
    MONTH(Month+'1 2000') AS MonthNO,
    DATEFROMPARTS (Year,MONTH(Month+'1 2000'),1) AS DATE
FROM exportsofcrudeoil

UNION

SELECT
    t.Country,
    'Crude oil' AS Product,
    'Exports' AS Balance,
    t.Unit,
    v.Year,
    v.Month,
    t.Exports,
    MONTH(v.Month+'1 2000') AS MonthNO,
    DATEFROMPARTS (v.Year,MONTH(v.Month+'1 2000'),1) AS DATE
FROM ExportsofCrudeOil2024 AS t
CROSS APPLY(
SELECT 
t.Date,
    LEFT (t.Date, CHARINDEX('-',t.Date) -1 ) AS Month,
    2000+SUBSTRING(
    t.Date, CHARINDEX('-',t.Date) +1 , 
    LEN(t.Date) - CHARINDEX('-',t.Date ) )AS Year 
    ) AS v; 


