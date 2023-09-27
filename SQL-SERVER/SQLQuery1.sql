USE [master];
GO
RESTORE DATABASE [AdventureWorks2022]
FROM DISK = N'C:\Users\karthik.chikkanna\Desktop\daikin\1.New Project\SQL_SERVER\AdventureWorks2017.bak'
WITH
    FILE = 1,
    NOUNLOAD,
    STATS = 5;
GO