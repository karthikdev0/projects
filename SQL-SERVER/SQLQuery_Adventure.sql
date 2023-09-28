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


------------------------------------------------------------------------------------------------------------
--11
SELECT p.BusinessEntityID ,p.FirstName , p.LastName , ph.PhoneNumber FROM [Person].[Person] AS p
INNER JOIN [Person].[PersonPhone] AS ph
ON p.[BusinessEntityID] = ph.[BusinessEntityID]
WHERE p.[LastName] LIKE 'L%' --OR  p.[LastName] LIKE 'l%'
ORDER BY LastName, FirstName

--12
SELECT [SalesPersonId] , [CustomerId] , SUM(SubTotal) AS Sub_Total  FROM [Sales].[SalesOrderHeader]
GROUP BY  ROLLUP(SalesPersonId , CustomerId)

--13
SELECT [LocationID] ,[Shelf] ,SUM(Quantity) AS Total_Quantity FROM [Production].[ProductInventory]
GROUP BY CUBE(LocationID,Shelf)

--16
SELECT * FROM Person.BusinessEntityAddress
SELECT * FROM Person.Address

SELECT A.City , COUNT(BusinessEntityID) AS noofemployees FROM [Person].[BusinessEntityAddress] AS BEA
INNER JOIN [Person].[Address] AS A
ON BEA.AddressID = A.AddressID
GROUP BY A.City
ORDER BY A.City ASC;


--17
SELECT YEAR(OrderDate) FROM [Sales].[SalesOrderHeader]
SELECT DATEPART(YEAR,OrderDate) FROM [Sales].[SalesOrderHeader]
SELECT YEAR(OrderDate) AS 'Year' , SUM(TotalDue) AS 'Order Amount' FROM [Sales].[SalesOrderHeader]
GROUP BY (YEAR(OrderDate))
ORDER BY (YEAR(OrderDate))
SELECT DATEPART(year,OrderDate) ,SUM(TotalDue) FROM [Sales].[SalesOrderHeader]
GROUP BY DATEPART(year,OrderDate)
ORDER BY DATEPART(year,OrderDate)


--18
SELECT DATEPART(YEAR,OrderDate) AS 'YEAR' , SUM(TotalDue) AS 'Total' FROM [Sales].[SalesOrderHeader]
GROUP BY DATEPART(YEAR,OrderDate)
HAVING DATEPART(YEAR,OrderDate) <= 2016
ORDER BY DATEPART(YEAR,OrderDate)


--19
SELECT ContactTypeID ,Name FROM [Person].[ContactType]
WHERE Name LIKE '%Manager%'
ORDER BY Name DESC


--20
SELECT BEC.BusinessEntityID,P.LastName, P.FirstName FROM [Person].[BusinessEntityContact] AS BEC
INNER JOIN [Person].[ContactType] AS CT
ON CT.ContactTypeID = BEC.ContactTypeID 
INNER JOIN [Person].[Person] AS P
ON P.BusinessEntityID = BEC.PersonID
WHERE CT.Name = 'Purchasing Manager'
ORDER BY P.LastName,P.FirstName



