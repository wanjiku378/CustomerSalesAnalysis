SELECT pc.EnglishProductCategoryName AS ProductCategory, 
	   p.ModelName,
	   isales.CustomerKey, 
	   st.SalesTerritoryRegion AS SalesRegion,
	   d.CalendarYear, 
	   d.FiscalYear, 
	   d.EnglishMonthName AS SaleMonth,
       isales.SalesOrderNumber AS OrderNumber, 
	   isales.OrderQuantity, 
	   isales.SalesAmount,

	(CASE 
		WHEN Customer.YearlyIncome < 40000 THEN 'Low'
		WHEN Customer.YearlyIncome > 60000 THEN 'High'
		ELSE 'Moderate' END)
	 AS CustIncomeLevel
FROM FactInternetSales AS isales
INNER JOIN product AS p
	ON p.ProductKey = isales.ProductKey
LEFT OUTER JOIN ProductSubcategory
	ON ProductSubcategory.ProductSubcategoryKey = p.ProductSubcategoryKey
LEFT OUTER JOIN ProductCategory AS pc
	ON pc.ProductCategoryKey = ProductSubcategory.ProductCategoryKey
INNER JOIN SalesTerritory AS st
	ON st.SalesTerritoryKey = isales.SalesTerritoryKey
INNER JOIN Date AS d
	ON d.DateKey = isales.OrderDateKey
INNER JOIN Customer
	ON Customer.CustomerKey = isales.CustomerKey
ORDER BY pc.EnglishProductCategoryName, 
         p.ModelName, 
		 d.FiscalYear DESC, 
		 isales.SalesOrderNumber;