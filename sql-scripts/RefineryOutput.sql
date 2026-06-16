CREATE VIEW RefineryOutput AS 
SELECT  
    [Country],
    [Product],
    [Balance],
    [Unit],
    [Year],
    [Month],
    [Value],
    MONTH(Month + '1 2000') AS MonthNo,
    DATEFROMPARTS (Year,  MONTH(Month + '1 2000'),1) AS Date 
FROM ProductionoRefinedProducts
   
