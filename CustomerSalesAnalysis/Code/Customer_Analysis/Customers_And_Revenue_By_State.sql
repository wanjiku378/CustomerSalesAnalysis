SELECT g.StateProvinceName, 
       g.EnglishCountryRegionName,
	  AVG(c.YearlyIncome) AS AvgIncome,
	  COUNT(DISTINCT fis.CustomerKey) AS NumberCustomers,
	  COUNT(fis.SalesOrderNumber) AS NumberOfOrders,
	  SUM(fis.SalesAmount) /
	  COUNT(DISTINCT fis.CustomerKey) AS AvgRevenuePerCustomer
FROM FactInternetSales AS fis
INNER JOIN Customer AS c
	ON fis.CustomerKey = c.CustomerKey
INNER JOIN Geography AS g
	ON g.GeographyKey = c.GeographyKey
GROUP BY g.StateProvinceName, 
         g.EnglishCountryRegionName
ORDER BY NumberCustomers DESC, 
         NumberOfOrders DESC, 
		 AvgRevenuePerCustomer DESC