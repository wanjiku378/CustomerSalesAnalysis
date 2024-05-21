--Average reseller sales for promotion items
SELECT isales.ProductKey, 
	promo.EnglishPromotionName AS PromoName, 
	prod.EnglishProductName AS ProductName, 
	prod.ModelName, 
	prodcat.EnglishProductCategoryName AS CategoryName, 

	(CASE 
		WHEN DATEDIFF(month, promo.StartDate, promo.EndDate) = 0 THEN 1
		ELSE DATEDIFF(month, promo.StartDate, promo.EndDate) 
	END) AS MonthsOfPromo,
--Finding the number of months each promo went on for. If it was less than a month listed as a single month

	ROUND(SUM(isales.OrderQuantity), 0) AS TotalQuantSold, --total order quantity of each product for every promotion 
	promo.DiscountPct AS PercentDiscount,
	ROUND(SUM(isales.SalesAmount), 0) AS PromoRevenue, --total product sales of each promotion for each product

	(SUM(isales.OrderQuantity) /
	(CASE 
		WHEN DATEDIFF(month, promo.StartDate, promo.EndDate) = 0 THEN 1
		ELSE DATEDIFF(month, promo.StartDate, promo.EndDate) 
	END)) AS MonthlyQuantSold,
--Average monthly order quantity of each product under each promotion

	(ROUND(SUM(isales.SalesAmount) /
	(CASE 
		WHEN DATEDIFF(month, promo.StartDate, promo.EndDate) = 0 THEN 1
		ELSE DATEDIFF(month, promo.StartDate, promo.EndDate) 
	END), 0)) AS MonthlyPromoRevenue
FROM FactInternetSales AS isales
--Average monthly sales of each product under each promotion

INNER JOIN Promotion AS promo
	ON promo.PromotionKey = isales.PromotionKey
INNER JOIN product AS prod
	ON prod.ProductKey = isales.ProductKey
LEFT OUTER JOIN ProductSubcategory
	ON ProductSubcategory.ProductCategoryKey = prod.ProductSubcategoryKey
LEFT OUTER JOIN ProductCategory AS prodcat
	ON prodcat.ProductCategoryKey = ProductSubcategory.ProductCategoryKey
--Joins to get all columns in SELECT

WHERE isales.PromotionKey != 1 --Filtering out the orders that have no promotional discounts
GROUP BY isales.ProductKey, 
	promo.EnglishPromotionName, 
	prod.EnglishProductName, 
	promo.DiscountPct, 
	prod.ModelName, 
	prodcat.EnglishProductCategoryName, 
	DATEDIFF(month, promo.StartDate, promo.EndDate)

HAVING 
	(SUM(isales.OrderQuantity) /
	(CASE 
		WHEN DATEDIFF(month, promo.StartDate, promo.EndDate) = 0 THEN 1
		ELSE DATEDIFF(month, promo.StartDate, promo.EndDate)
END)) >
--Only show the products and promotions that generated more avg monthly orders than products without promotions in subquery below

	(SELECT (nondiscount.TotalQuant / nondiscount.Months) AS NonDiscountMonthlyQuant
	FROM 
		((SELECT isales2.ProductKey, --Select ProductKey to group by a similar key value as above 
				(SUM(isales2.OrderQuantity)) AS TotalQuant, --Total order quantities for each product
				DATEDIFF(month, promo2.StartDate, promo2.EndDate) AS Months --Total months for the No Discount promotion
		FROM FactInternetSales AS isales2

		INNER JOIN product AS prod2
			ON prod2.ProductKey = isales2.ProductKey
		INNER JOIN Promotion AS promo2
			ON promo2.PromotionKey = isales2.PromotionKey
		WHERE isales2.PromotionKey = 1 --Only show products in the are "No Discount" promotion
			AND isales2.ProductKey = isales2.ProductKey
	--Only show matching Products from the outer query

		GROUP BY isales2.ProductKey, DATEDIFF(month, promo2.StartDate, promo2.EndDate))) AS nondiscount
		WHERE (nondiscount.ProductKey = isales.ProductKey)
	--Group by, alias and match subquery with outer query
		GROUP BY nondiscount.ProductKey, nondiscount.TotalQuant, nondiscount.Months)
--Subquery to get the average monthly sales of products that have no promotions and discounts

ORDER BY MonthlyQuantSold DESC, CategoryName, PromoName;