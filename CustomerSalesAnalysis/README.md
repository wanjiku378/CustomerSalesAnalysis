# sales_analysis
Sales Analysis Final Project using SQL Server for Data Management @ Seattle University

**Analysis**
You will need to understand and analyze the data in the AdventureWorks2012DW database. (This is the data warehouse, not the database you have used for other efforts).

Key points to remember:

The sales data is found in two tables that may need to be joined for some analysis and separate for others.
Internet sales (factInternetSales) are direct, online sales
Reseller sales (factResellerSales) are through reseller network
The data warehouse also contains important information that will be relevant for your analysis, including the following:

Customer data that provides interesting demographic data
Product data that can be segregated into categories and subcategories
Promotion data that may give insights to success of promotions
Geography data to analyze data by region
Territory data that can be joined with sales data to look at sales group performance.
Your objectives:

In each of the following objectives you need to provide the minimum in a clear, concise, and professional manner. Feel free to expand on the objectives if you see something interesting in the data, but make sure you are able to explain your reasoning and your findings. The first three are rather prescriptive and you’ll need to follow the requests. The second three are open to interpretation, as long as you meet the intent of the objective.

1. Provide a detailed list of Internet sales with the following columns for the financial analyst team to review (Category, Model, CustomerKey, Region, IncomeGroup, CalendarYear, FiscalYear, Month, OrderNumber, Quantity, and Amount). Income group should categorize the people based on "Low" being less than 40,000, "High" being greater than 60,000, and the rest will be "Moderate".

2. Provide a similar analysis for Reseller sales with the following columns (Category, Model, CalendarYear, FiscalYear, Month, OrderNumber, Quantity, Amount).

3. Show the total sales (overall) by year rolled up by the Territory group and country. A special request is that the United Kingdom is no longer part of Europe and management wants to see their totals as a separate Territory group. You cannot modify the data, so you will need to address this request in your query.

4. Provide an analysis of sales performance by Promotion. It would be interesting to see how different types of promotions drive sales (quantity and revenue), especially by product category or region. The comparison between Internet and Reseller sales is probably interesting too. Don’t attempt to do everything, but show some good analysis related to Promotion.

5. Our customers are always a big discussion topic with management and the sales team. The Customer table has a wealth of data categories that could be joined with Internet sales and all the extra data that brings along. This request will likely separate the high-performing analysts from the rest.


Communication
The executive team would like to see the results of your analysis separated for two distinct audiences:

For the financial analyst team, you will need to provide a Technical Report that contains your findings for each of the objectives (listed above), along with your SQL queries and a statement describing the approach you took for each and why.
For the executive group you will need to create a Memo that “briefly” summarizes your approach and conclusions. For success with the executive group you will need to take the time to write the short version of your analysis and conclusions. In other words, be clear, but get to the point.
Technical report: Your technical report should be a Word document. This report will be scrutinized by the financial analyst team for technical accuracy to ensure you assumptions are correct and that your queries returned the right data at the right level. This report is the foundation for your conclusions and is critical to your success and reputation, so your work should be reproducible by others.

Memo: A one-page document in Word that follows common practice for an executive memorandum. This document should not restate everything that you will discuss in the presentation but should provide the highlights and key points. The goal is to be brief, but complete.
