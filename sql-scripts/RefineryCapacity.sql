CREATE VIEW RefineryCapacity AS 
SELECT
    [Country],
    [Company],
    [Name_of_The_Refinery],
    [Year],
    [Capacity_1_000_b_cd]
FROM Refinerycapacities

UNION 

SELECT
    [Country],
    [Company],
    [Name_of_The_Refinery],
    [Year],
    [Capacity_1_000_b_cd]
FROM RefineryCapacities2023and2024

--ORDER BY Year ASC 

