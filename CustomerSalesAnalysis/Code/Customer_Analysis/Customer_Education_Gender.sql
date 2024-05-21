SELECT c.EnglishEducation, c.Gender,
	AVG(c.YearlyIncome) AS AvgIncome,
	COUNT(DISTINCT fis.CustomerKey) AS NumberCustomers,
	COUNT(fis.SalesOrderNumber) AS NumberOfOrders,
	AVG(CAST(c.NumberCarsOwned AS decimal(10,2))) AS AvgCarsPerCustomer,
	AVG(CAST(c.TotalChildren AS decimal(10,2))) AS AvgChildrenPerCustomer,
	COUNT(fis.SalesOrderNumber) / COUNT(DISTINCT fis.CustomerKey) AS OrdersPerCustomer,
	SUM(fis.SalesAmount) /
	COUNT(DISTINCT fis.CustomerKey) AS AvgRevenuePerCustomer
FROM FactInternetSales AS fis
INNER JOIN Customer AS c
ON fis.CustomerKey = c.CustomerKey
GROUP BY c.EnglishEducation, c.Gender
ORDER BY EnglishEducation, NumberCustomers DESC