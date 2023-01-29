
CREATE DATABASE Teachers;
GO
USE Teachers;
GO
CREATE TABLE POST (
	Id int PRIMARY KEY IDENTITY (1, 1),
	[Name] nvarchar(20) NOT NULL UNIQUE
);
GO
CREATE TABLE TEACHER (
	Id int PRIMARY KEY IDENTITY (1, 1),
	[Name] nvarchar(15) NOT NULL,
	Code char(10),
	IdPost int NOT NULL,
	Tel char(7),
	Salary int NOT NULL,
	Rise NUMERIC(6,2),
	HireDate DATETIME NOT NULL,
	CONSTRAINT FK_IdPost
	FOREIGN KEY (IdPost)
	REFERENCES Post(Id)
);


GO


ALTER TABLE TEACHER
DROP CONSTRAINT FK_IdPost

ALTER TABLE TEACHER
DROP COLUMN IdPost;
GO

GO
DROP TABLE POST;

ALTER TABLE TEACHER
ADD CONSTRAINT check_hire_date CHECK (HireDate >= '01-01-1990');
               
ALTER TABLE TEACHER		   
ADD CONSTRAINT check_code UNIQUE(Code);

GO
ALTER TABLE TEACHER
ALTER COLUMN Salary NUMERIC(6,2)
GO
ALTER TABLE TEACHER
ADD CONSTRAINT check_salary CHECK (Salary >= 1000 AND Salary <= 5000);

GO
EXEC sp_rename'TEACHER.Tel', 'Phone';
GO

GO
ALTER TABLE TEACHER
ALTER COLUMN Phone CHAR(11)
GO
CREATE TABLE POST (
	Id int PRIMARY KEY IDENTITY (1, 1),
	[Name] nvarchar(20) NOT NULL UNIQUE
	
);
GO
ALTER TABLE POST 
ADD CONSTRAINT check_post_name CHECK ([Name] = N'Профессор' OR [Name] = N'Доцент' OR [Name] = N'Преподаватель' OR [Name] = N'Ассистент');

GO
ALTER TABLE Teacher
ADD CONSTRAINT check_teacher_name CHECK ([Name] NOT LIKE '%[0-9]%');

GO
ALTER TABLE TEACHER
ADD IdPost int;
GO

ALTER TABLE Teacher
ADD FOREIGN KEY (IdPost) REFERENCES Post(Id);

GO
SET IDENTITY_INSERT POST ON;

INSERT INTO post(Id,Name) VALUES(1,N'Профессор');
INSERT INTO post(Id,Name) VALUES(2,N'Доцент');
INSERT INTO post(Id,Name) VALUES(3,N'Преподаватель');
INSERT INTO post(Id,Name) VALUES(4,N'Ассистент');
SET IDENTITY_INSERT POST OFF;
GO


SET IDENTITY_INSERT TEACHER ON;

INSERT INTO TEACHER (Id, Name, Code, IdPost, Phone, Salary, Rise, HireDate)
VALUES (1, N'Сидоров','0123456789', 1, NULL, 1070, 470, '01.09.1992');
INSERT INTO TEACHER (Id, Name, Code, IdPost, phone, Salary, Rise, HireDate)
VALUES (2, N'Рамишевский','4567890123', 2, '4567890', 1110, 370, '09.09.1998');
INSERT INTO TEACHER (Id, Name, Code, IdPost, phone, Salary, Rise, HireDate)
VALUES (3, N'Хоренко','1234567890', 3, NULL, 2000, 230, '10.10.2001');
INSERT INTO TEACHER (Id, Name, Code, IdPost, phone, Salary, Rise, HireDate)
VALUES (4, N'Вибровский','2345678901', 4, NULL, 4000, 170, '01.09.2003');
INSERT INTO TEACHER (Id, Name, Code, IdPost, phone, Salary, Rise, HireDate)
VALUES (5, N'Воропаев',NULL, 4, NULL, 1500, 150, '02.09.2002');
INSERT INTO TEACHER (Id, Name, Code, IdPost, phone, Salary, Rise, HireDate)
VALUES (6, N'Кузинцев','5678901234', 3, '4567890', 3000, 270, '01.01.1991');
SET IDENTITY_INSERT TEACHER OFF;

GO
CREATE VIEW [Post Names] AS
SELECT DISTINCT [Name]
FROM POST;
GO

CREATE VIEW [Teachers Names] AS
SELECT DISTINCT [Name]
FROM TEACHER;
GO

GO

CREATE VIEW [Teachers By Salary] AS
SELECT Teacher.Id, Teacher.[Name], POST.[Name] AS [Teacher Post], TEACHER.Salary + TEACHER.Rise AS [Full Salary]
FROM TEACHER INNER JOIN POST
ON TEACHER.IdPost = POST.Id
ORDER BY [Full Salary] OFFSET 0 ROWS;
GO


CREATE VIEW [Teachers with Code] AS
SELECT Code, [Name], Phone
FROM TEACHER
WHERE Phone IS NOT NULL;
GO


SELECT * 
FROM [Post Names];

SELECT * 
FROM [Teachers Names];


SELECT * 
FROM [Teachers By Salary];


SELECT * 
FROM [Teachers with Code];








