Use Library;


-- 1
--GO
--CREATE PROCEDURE FactorialCALC
--   @number INT 
--AS  
--BEGIN  
--DECLARE @i int = 1,@result int=1
--WHILE (@i<=@number)
--BEGIN
--	SET @result = @result * @i
--	SET @i += 1
--END
--SELECT @result AS Answer
--END

--GO

--EXEC FactorialCALC 5;


--2
--GO
--CREATE PROCEDURE LazyStudents
--@count_ls AS int OUTPUT
--AS
--BEGIN
--SELECT DISTINCT Students.Id, Students.FirstName, Students.LastName  
--FROM Students LEFT JOIN S_Cards
--ON Students.Id = S_Cards.Id_Student 
--WHERE S_Cards.Id_Student IS NULL
--SET @count_ls = @@ROWCOUNT
--END
--GO

--DECLARE @count_lazy_student AS int

--EXEC LazyStudents @count_lazy_student OUTPUT

--SELECT @count_lazy_student AS [LazyStudents]



--3  
--GO
--CREATE FUNCTION MinBooks(
--@press AS nvarchar(30)
--)
--RETURNS table
--AS
--RETURN(
--SELECT TOP(3) Books.[Name], Books.Pages
--FROM Books INNER JOIN Press
--ON Books.Id_Press = Press.Id
--WHERE Press.[Name] = @press
--ORDER BY Books.Pages
--)
--GO

SELECT * FROM MinBooks('BHV')

--4  
--GO
--CREATE FUNCTION AVGPages(
--@avgpages AS int
--)
--RETURNS table
--AS
--RETURN(
--SELECT Press.[Name], AVG(Books.Pages) AS [Average Pages]
--FROM Books INNER JOIN Press
--ON Books.Id_Press = Press.Id
--GROUP BY Press.[Name]
--HAVING AVG(Books.Pages) > @avgpages
--)
--GO

SELECT * FROM AVGPages(300)

--5

--GO
--CREATE FUNCTION SUMPages(
--@pressname AS nvarchar(30)
--)
--RETURNS table
--AS
--RETURN(
--SELECT  Press.[Name], SUM(Books.Pages * Books.Quantity) AS [SUM Pages] 
--FROM Books INNER JOIN Press
--ON Books.Id_Press = Press.Id
--GROUP BY Press.[Name]
--HAVING Press.[Name] = @pressname
--)
--GO


SELECT * FROM SUMPages('BHV')



 











