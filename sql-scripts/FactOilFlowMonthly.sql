CREATE VIEW FactOilFlowMonthly AS 
SELECT
Country , Product, Balance, Value, Unit, Month, MonthNO, Year, DATE AS Date,'Production Table' AS SourceTable
FROM Production 
UNION
SELECT
Country , Product, Balance, Value, Unit, Month, MonthNo, Year, Date ,'Direct Use' AS SourceTable
FROM DirectUse
UNION
SELECT 
Country , Product, Balance, Value, Unit, Month, MonthNO, Year, DATE AS Date ,'Export Crude Oil' AS SourceTable
FROM Exports_CrudeOil
UNION
SELECT
Country , Product, BALANCE, Value, Unit, Month, MonthNO, Year, Dates AS Date ,'Input to Refineries' AS SourceTable
FROM ToRefineries
UNION
SELECT
Country , Product, Balance, Value, Unit, Month, MonthNO, Year, Date ,'Exports of Refined products' AS SourceTable
FROM Exports_Refined
UNION
SELECT
Country , Product, BALANCE, Value, Unit, Month, MonthNO, Year, Date ,'Production Table' AS SourceTable
FROM Gas_Demand
UNION
SELECT
Country , Product, Balance, Value, Unit, Month, MonthNo, Year,Date ,'Refined products demand' AS SourceTable
FROM RefineryOutput
