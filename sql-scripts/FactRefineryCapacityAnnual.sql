
CREATE VIEW FactRefineryCapacityAnnual AS 
SELECT
Year,
Country,
Company,
Name_of_The_Refinery AS  Refinery_Name ,
[Capacity_1_000_b_cd] AS Capacity_kbd
FROM RefineryCapacity