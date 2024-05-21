SELECT CONCAT(c.FirstName, ' ' ,c.LastName) AS CustomerName, sr.SalesReasonName
FROM FactInternetSales AS fis
INNER JOIN Customer AS c
ON C.CustomerKey = fis.CustomerKey
LEFT OUTER JOIN FactInternetSalesReason AS fisr
ON fisr.SalesOrderNumber = fis.SalesOrderNumber
LEFT OUTER JOIN SalesReason AS sr
ON sr.SalesReasonKey = fisr.SalesReasonKey