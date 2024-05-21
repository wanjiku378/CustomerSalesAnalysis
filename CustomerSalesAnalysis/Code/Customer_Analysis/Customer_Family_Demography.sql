SELECT c.NumberChildrenAtHome,


c.NumberCarsOwned, c.CommuteDistance,
COUNT(DISTINCT fis.CustomerKey) AS NumberCustomers,
COUNT(fis.SalesOrderNumber) AS NumberOfOrders,
SUM(fis.SalesAmount) /
	COUNT(DISTINCT fis.CustomerKey) AS AvgRevenuePerCustomer
FROM FactInternetSales AS fis
INNER JOIN Customer AS c
ON fis.CustomerKey = c.CustomerKey
LEFT OUTER JOIN FactInternetSalesReason AS fisr
ON fisr.SalesOrderNumber = fis.SalesOrderNumber
LEFT OUTER JOIN SalesReason AS sr
ON sr.SalesReasonKey = fisr.SalesReasonKey
INNER JOIN Geography AS g
ON g.GeographyKey = c.GeographyKey
WHERE fis.CustomerKey IN

(SELECT fis2.CustomerKey
	FROM FactInternetSales AS fis2
	INNER JOIN Customer AS c2
	ON fis2.CustomerKey = c2.CustomerKey
	INNER JOIN Geography AS g2
	ON g2.GeographyKey = c2.GeographyKey
	WHERE g2.StateProvinceName IN ('California', 'British Columbia', 'Washington', 'England', 'New South Wales'))

GROUP BY  c.CommuteDistance, c.NumberChildrenAtHome
	
ORDER BY NumberCustomers DESC