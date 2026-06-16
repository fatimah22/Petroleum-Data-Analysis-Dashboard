CREATE VIEW FactCrudeReserveAnnual AS 
SELECT
Country,
product,
Value AS Reserve_MillionBarrels,
Year,
Date
FROM ReserveOIL