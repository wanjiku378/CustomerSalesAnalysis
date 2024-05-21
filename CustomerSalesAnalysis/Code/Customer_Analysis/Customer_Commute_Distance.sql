SELECT c.CommuteDistance,
	AVG(c.YearlyIncome) AS AvgIncome,
	COUNT(DISTINCT fis.CustomerKey) AS NumberCustomers,
	COUNT(fis.SalesOrderNumber) AS NumberOfOrders,
	SUM(fis.SalesAmount) /
	COUNT(DISTINCT fis.CustomerKey) AS AvgRevenuePerCustomer
FROM FactInternetSales AS fis
INNER JOIN Customer AS c
ON fis.CustomerKey = c.CustomerKey
GROUP BY c.CommuteDistance
ORDER BY NumberCustomers DESC, c.CommuteDistance
