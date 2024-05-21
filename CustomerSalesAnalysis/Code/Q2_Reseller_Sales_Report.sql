SELECT pc.EnglishProductCategoryName AS ProductCategory, 
       p.ModelName,
       rsales.ResellerKey, 
	   st.SalesTerritoryRegion AS SalesRegion, 
	   d.CalendarYear, 
	   d.FiscalYear, 
	   d.EnglishMonthName AS SaleMonth,
       rsales.SalesOrderNumber, 
	   rsales.OrderQuantity, 
	   rsales.SalesAmount,

(CASE 
	WHEN r.AnnualRevenue = 30000 THEN 'Low'
	WHEN r.AnnualRevenue >= 80000 AND r.AnnualRevenue <= 100000 THEN 'Middle'
	WHEN r.AnnualRevenue = 150000 THEN 'High'
	ELSE 'Very High' 
END) AS RevenueLevel,
(CASE 
	WHEN r.NumberEmployees <= 25 THEN 'Small'
	WHEN r.NumberEmployees > 25 AND r.NumberEmployees <= 50 THEN 'Mid'
	WHEN r.NumberEmployees > 50 AND r.NumberEmployees <= 75 THEN 'Large'
	ELSE 'Very Large' 
END) AS ResellerSize
FROM FactResellerSales AS rsales
INNER JOIN product AS p
	ON p.ProductKey = rsales.ProductKey
LEFT OUTER JOIN ProductSubcategory
	ON ProductSubcategory.ProductSubcategoryKey = p.ProductSubcategoryKey
LEFT OUTER JOIN ProductCategory AS pc
	ON pc.ProductCategoryKey = ProductSubcategory.ProductCategoryKey
LEFT OUTER JOIN SalesTerritory AS st
	ON st.SalesTerritoryKey = rsales.SalesTerritoryKey
INNER JOIN Date AS d
	ON d.DateKey = rsales.OrderDateKey
INNER JOIN Reseller AS r
	ON r.ResellerKey = rsales.ResellerKey
ORDER BY pc.EnglishProductCategoryName, 
         p.ModelName, 
		 d.FiscalYear DESC,
		 rsales.SalesOrderNumber;