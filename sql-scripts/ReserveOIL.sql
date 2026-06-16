ALTER VIEW ReserveOIL AS 
SELECT
Country,
product,
Unit,
Year,
Value,
DATEFROMPARTS(Year,1,1) AS Date
FROM crudeoilreserves

UNION 

SELECT
Country,
product,
Unit,
Year,
Value,
DATEFROMPARTS(Year,1,1) AS Date
FROM ReservesofCrudeOil2024
