Use BookMyMovieDB
Go

SELECT name FROM BookMyMovieDB.sys.tables;

SELECT name FROM sys.tables;

SELECT * FROM __EFMigrationsHistory;

SELECT * FROM movie;
SELECT * FROM review;
SELECT * FROM screen;
SELECT * FROM seat;
SELECT * FROM theatre;
SELECT * FROM theatreMovie;
SELECT * FROM [dbo].[User]; -- SELECT * FROM User;
SELECT * FROM UserModel;
SELECT * FROM ticket;
SELECT * FROM [dbo].[User];

UPDATE UserModel SET ROLE = 'Standard' WHERE Id = 10;

INSERT INTO movie (Title,Ratings,Description,ReleaseDate,PosterImgPath,Tags,IsDeleted) VALUES
('movie 10',0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,' ,DATEADD(D,1,GETDATE()),	'Resources\Images\movie1.jpg',	'TagA,TagB,TagD',	0),
('movie 11',0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,' ,DATEADD(D,2,GETDATE()),	'Resources\Images\movie1.jpg',	'TagA,TagB,TagD',	0),
('movie 12',0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,' ,DATEADD(D,-1,GETDATE()),	'Resources\Images\movie1.jpg',	'TagA,TagB,TagD',	0)
GO


DELETE FROM theatre;
INSERT INTO theatre (TheatreName,TheatreCity,isDeleted) VALUES ('Theatre A','City A',0),('Theatre B','City B',0),('Theatre C','City B',0);

SELECT * FROM screen;
DELETE FROM screen;
INSERT INTO screen (ScreenName,ScreenFromTime,ScreenToTime,ScreenDate,TotalSeats,SilverSeats,GoldSeats,PlatinumSeats,NumberOfRows,NumberOfColumns,TheatreId)
VALUES ('Screen A', GETDATE(),DATEADD(HH,10,GETDATE()), GETDATE(),100,25,25,50,10,10,1),
('Screen B', GETDATE(),DATEADD(HH,10,GETDATE()), GETDATE(),100,50,25,25,10,10,1),
('Screen C', GETDATE(),DATEADD(HH,10,GETDATE()), GETDATE(),100,25,50,25,10,10,1);

SELECT * FROM theatreMovie;

INSERT INTO [dbo].[theatreMovie] (TotalNumOfSeats,NumOfSeatsSilverClass,NumOfSeatsGoldClass,NumOfSeatsPlatinumClass,PriceOfSilverClass,PriceOfGoldClass,PriceOfPlatinumClass,FromDate,ToDate,MovieId,TheatreId,ScreenId)
VALUES ((SELECT TotalSeats FROM screen WHERE ScreenId = 1),(SELECT SilverSeats FROM screen WHERE ScreenId = 1) ,(SELECT GoldSeats FROM screen WHERE ScreenId = 1), (SELECT PlatinumSeats FROM screen WHERE ScreenId = 1),
	100,200,300, DATEADD(D,0,GETDATE()),DATEADD(D,12,GETDATE()),1,4,1
),
((SELECT TotalSeats FROM screen WHERE ScreenId = 1),(SELECT SilverSeats FROM screen WHERE ScreenId = 1) ,(SELECT GoldSeats FROM screen WHERE ScreenId = 1), (SELECT PlatinumSeats FROM screen WHERE ScreenId = 1),
	100,200,300, DATEADD(D,0,GETDATE()),DATEADD(D,12,GETDATE()),1,3,1
);



select * from [dbo].[seat]
DELETE FROM	seat WHERE SeatId = 2	

INSERT INTO seat (SeatNumber,SeatClass,IsSeatBooked,ScreenId) VALUES 
('A0S','silver',0,1),
('A1S','silver',0,1),
('A2S','silver',0,1),
('A3S','silver',0,1),
('A4S','silver',0,1),
('A5S','silver',0,1),
('A6S','silver',0,1),
('A7S','silver',0,1),
('A8S','silver',0,1),
('A9S','silver',0,1);
Go