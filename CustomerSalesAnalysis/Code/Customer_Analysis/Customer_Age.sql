
SELECT Customer.CustomerKey,
(CASE 
WHEN CAST((DATEDIFF(DD,Customer.BirthDate, GETDATE()) / 365.25) - 12 AS INT) > 29 
AND CAST((DATEDIFF(DD,Customer.BirthDate, GETDATE()) / 365.25) - 12 AS INT) < 40 THEN 'Thirties'
WHEN CAST((DATEDIFF(DD,Customer.BirthDate, GETDATE()) / 365.25) - 12 AS INT) >= 40 
AND CAST((DATEDIFF(DD,Customer.BirthDate, GETDATE()) / 365.25) - 12 AS INT) < 50 THEN 'Fourties'
WHEN CAST((DATEDIFF(DD,Customer.BirthDate, GETDATE()) / 365.25) - 12 AS INT) >= 50 
AND CAST((DATEDIFF(DD,Customer.BirthDate, GETDATE()) / 365.25) - 12 AS INT) < 60 THEN 'Fifties'
WHEN CAST((DATEDIFF(DD,Customer.BirthDate, GETDATE()) / 365.25) - 12 AS INT) >= 60 THEN 'Senior'
ELSE 'Twenties' END) AS AgeGroup

FROM Customer
ORDER BY AgeGroup


