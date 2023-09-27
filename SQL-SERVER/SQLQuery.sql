

USE ProductTestDB


CREATE TABLE [dbo].[Products] (
ProductId INT PRIMARY KEY IDENTITY (1, 1),
ProductName NVARCHAR (50) NOT NULL,
ProductDescription NVARCHAR(200),
Price INT NOT NULL,
Quantity INT NOT NULL,
DiscountId INT NOT NULL,
FOREIGN KEY (DiscountId) REFERENCES [dbo].[Discounts] (DiscountId)
);

CREATE TABLE [dbo].[Discounts](
DiscountId INT PRIMARY KEY IDENTITY(1,1),
DiscountPrice INT NOT NULL
);

INSERT INTO [dbo].[Discounts] (DiscountPrice) VALUES  (300)
SELECT * FROM [dbo].[Discounts]

INSERT INTO [dbo].[Products] (ProductName,Price,Quantity,DiscountId) VALUES ('Pen',2000,10,2),('Pencil',1000,2,1);
SELECT * FROM [dbo].[Products];
