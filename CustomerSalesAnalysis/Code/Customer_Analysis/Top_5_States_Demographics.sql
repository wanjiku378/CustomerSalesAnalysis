
--Characteristics of customers who are in the top 5 states for orders and account for over 5000 orders (CA, WA, England, BC, Wales)
SELECT c.NumberChildrenAtHome, 
	   sr.SalesReasonName,
	CAST(AVG(c.YearlyIncome) AS decimal(10,2)) AS AvgIncome,
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
					WHERE c2.GeographyKey IN
						(SELECT g2.GeographyKey
						FROM Geography AS g2
							WHERE g2.StateProvinceName IN ('California', 'British Columbia', 'Washington', 'England', 'New South Wales')))

GROUP BY  
         c.NumberCarsOwned, 
		 c.NumberChildrenAtHome, 
		 SalesReasonName
	
ORDER BY NumberCustomers DESC

--The results show that in these 5 state with the most orders maintain the same eduaction levels structure as the entirety of the customer database
--All levels of education in these states have a higher aveage income than the average for the database
--Those with graduate degrees, do not own cars, and have a lower average income for graduate degrees order the most bikes
--Car ownership has less of an affect on customers with batchelor degrees