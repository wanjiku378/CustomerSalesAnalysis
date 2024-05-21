SELECT st.SalesTerritoryGroup AS SalesTerritory, 
       st.SalesTerritoryCountry AS Country, 
	   d.FiscalYear, 
	   ROUND(SUM(isales.SalesAmount),0) AS YearlyInternetSales, 
	   ROUND(SUM(rsales.SalesAmount),0) AS YearlyResellerSales,
       ROUND((SUM(isales.SalesAmount) + SUM(rsales.SalesAmount)),0) AS TotalSales
FROM SalesTerritory AS st
INNER JOIN FactInternetSales AS isales
	ON isales.SalesTerritoryKey = st.SalesTerritoryKey
INNER JOIN FactResellerSales AS rsales
	ON rsales.SalesTerritoryKey = st.SalesTerritoryKey
INNER JOIN Date AS d
	ON d.DateKey = isales.OrderDateKey
GROUP BY st.SalesTerritoryGroup,
         st.SalesTerritoryCountry, 
		 d.FiscalYear
ORDER BY d.FiscalYear DESC, 
          TotalSales DESC;
