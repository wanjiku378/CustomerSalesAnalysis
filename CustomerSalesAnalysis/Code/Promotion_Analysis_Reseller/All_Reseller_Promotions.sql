SELECT ProductKey, Promotion.EnglishPromotionName, SUM(SalesAmount) AS PromoSalesRevenue
FROM FactResellerSales
INNER JOIN Promotion
ON Promotion.PromotionKey = FactResellerSales.PromotionKey
WHERE FactResellerSales.PromotionKey!= 1
GROUP BY ProductKey, Promotion.EnglishPromotionName
