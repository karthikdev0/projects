USE [AdventureWorks2019]
GO

SELECT * FROM [HumanResources].[Employee] 
ORDER BY [JobTitle];

SELECT e.* FROM [Person].[Person] AS e 
ORDER BY [LastName];

SELECT [FirstName],[LastName],[businessentityid] AS Employee_id FROM [Person].[Person] 
ORDER BY [LastName];

SELECT [ProductID],[ProductNumber],[Name] FROM [production].[Product] 
WHERE [SellStartDate] IS NOT NULL AND [ProductLine] = 'T'
ORDER BY [Name];


SELECT [salesorderid], [customerid], [orderdate], [subtotal], (([TaxAmt] *100)/[subtotal]) AS tax_percent FROM [Sales].[SalesOrderHeader]
ORDER BY [subtotal] DESC;

SELECT DISTINCT [JobTitle] FROM [HumanResources].[Employee]
ORDER BY [JobTitle]

SELECT [customerid], SUM(freight) AS TotalFright FROM [Sales].[SalesOrderHeader]
GROUP BY [CustomerID]
ORDER BY [CustomerID]


SELECT [CustomerID] ,[SalesPersonID], AVG(SubTotal) AS avg_subtotal , SUM(SubTotal) AS sum_subtotal FROM [Sales].[SalesOrderHeader]
GROUP BY [CustomerID] , [SalesPersonID]
ORDER BY [CustomerID] DESC


SELECT [ProductID] ,SUM(Quantity) AS total_quantity FROM [Production].[ProductInventory]
WHERE [Shelf] IN ('A' ,'C' , 'H')
GROUP BY [ProductID]
HAVING SUM([Quantity]) > 500
ORDER BY [ProductID]

SELECT ([LocationID]*10), (SUM(Quantity)) AS 'total_quantity' FROM [Production].[ProductInventory]
GROUP BY ([LocationID]*10)
ORDER BY [LocationID]*10

SELECT ([LocationID]), (SUM(Quantity)) AS 'total_quantity' FROM [Production].[ProductInventory]
GROUP BY ([LocationID])
ORDER BY [LocationID]