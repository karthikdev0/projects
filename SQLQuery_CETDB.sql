CREATE DATABASE [CETDB]
GO

USE [CETDB]
GO

CREATE TABLE [dbo].[Employee_Details](
	[Employee_ID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Employee_Full_Name] [varchar](50) NOT NULL,
	[Employee_Address] [nvarchar](200) NOT NULL,
	[Employee_Phone] [nvarchar](13) NOT NULL,
	[Employee_Company] [nvarchar](50) NOT NULL,
	[Employee_Join_Date] [date] NOT NULL,
	[Employee_Experience] [numeric](4,2) NOT NULL,
	[Employee_Career_Level] [nvarchar](20) NOT NULL,
	[Employee_Skill] [nvarchar](200) NOT NULL,
	[Off_Shore_Start_Date] [date] NOT NULL,
	[Off_Shore_End_Date] [date] NOT NULL
)
GO


CREATE TABLE [dbo].[User_Details](
	[User_ID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[User_First_Name] [varchar](50) NOT NULL,
	[User_Last_Name] [varchar](50) NOT NULL,
	[User_EmailId] [varchar](50) UNIQUE NOT NULL,
	[User_Password] [varchar](50) NOT NULL
)
GO

CREATE PROCEDURE [dbo].[GetAllEmployeesByCompany]
@empCName varchar(50)
As 
BEGIN
	SELECT * FROM [dbo].[Employee_Details] WHERE Employee_Company 
	LIKE '%' + @empCName + '%';
END
GO

CREATE PROCEDURE [dbo].[GetAllEmployeesByName]
@empName varchar(50)
AS
BEGIN
	SELECT * FROM [dbo].[Employee_Details] WHERE Employee_Company 
	LIKE '%' + @empName + '%';
END
GO

CREATE PROCEDURE [dbo].[GetAllEmployeesBySkill]
@skillName varchar(50)
AS
BEGIN
	SELECT * FROM [dbo].[Employee_Details] WHERE Employee_Company 
	LIKE '%' + @skillName + '%';
END
GO


EXEC [dbo].[GetAllEmployeesByName] @empName = 'asdf';
GO