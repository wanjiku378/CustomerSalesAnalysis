SELECT ProductKey, Promotion.EnglishPromotionName, SUM(SalesAmount) AS PromoSalesRevenue
FROM FactInternetSales
INNER JOIN Promotion
ON Promotion.PromotionKey = FactInternetSales.PromotionKey
WHERE FactInternetSales.PromotionKey!= 1
GROUP BY ProductKey, Promotion.EnglishPromotionName

--32 Total internet Sales promotions