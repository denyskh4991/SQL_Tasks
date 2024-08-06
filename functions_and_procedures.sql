CREATE DATABASE [Functions and Procedures]
GO
USE [Functions and Procedures]
GO

-- The user function returns a greeting in the style of "Hello, NAME!" Where the NAME is passed as a parameter. For example, if Nick is passed, it will be Hello, Nick!

CREATE FUNCTION dbo.GreetUser (@Name NVARCHAR(100))
RETURNS NVARCHAR(200)
AS
BEGIN
    RETURN 'Hello, ' + @Name + '!';
END;

SELECT dbo.GreetUser('Nick');

-- The user function returns information about the current number of minutes 

CREATE FUNCTION dbo.GetCurrentMinutes()
RETURNS INT
AS
BEGIN
    RETURN DATEPART(MINUTE, GETDATE());
END;

SELECT dbo.GetCurrentMinutes() AS CurrentMinutes;

-- The user function returns information about the current year

CREATE FUNCTION dbo.GetCurrentYear()
RETURNS INT
AS
BEGIN
    RETURN YEAR(GETDATE());
END;

SELECT dbo.GetCurrentYear() AS CurrentYear;

-- The user function returns information on whether the year is even or odd

CREATE FUNCTION dbo.IsCurrentYearEvenOrOdd()
RETURNS NVARCHAR(10)
AS
BEGIN
    DECLARE @Year INT;
    DECLARE @Result NVARCHAR(10);
    
    SET @Year = YEAR(GETDATE());
    
    IF @Year % 2 = 0
        SET @Result = 'Even';
    ELSE
        SET @Result = 'Odd';
    
    RETURN @Result;
END;

SELECT dbo.IsCurrentYearEvenOrOdd() AS YearType;

-- The user function takes a number and returns yes if the number is prime and no if the number is not prime

CREATE FUNCTION dbo.IsPrime (@Number INT)
RETURNS NVARCHAR(3)
AS
BEGIN
    DECLARE @i INT;
    DECLARE @isPrime NVARCHAR(3);
    
    IF @Number <= 1
    BEGIN
        RETURN 'no';
    END

    SET @isPrime = 'yes';
    SET @i = 2;
    
    WHILE @i <= SQRT(@Number)
    BEGIN
        IF @Number % @i = 0
        BEGIN
            SET @isPrime = 'no';
            BREAK;
        END
        SET @i = @i + 1;
    END
    
    RETURN @isPrime;
END;

SELECT dbo.IsPrime(5) AS Result;  -- 'yes'
SELECT dbo.IsPrime(4) AS Result;  -- 'no'

-- The user function accepts five numbers as parameters. Returns the sum of the minimum and maximum values of the passed five parameters

CREATE FUNCTION dbo.SumMinMax (@Num1 INT, @Num2 INT, @Num3 INT, @Num4 INT, @Num5 INT)
RETURNS INT
AS
BEGIN
    DECLARE @MinValue INT;
    DECLARE @MaxValue INT;

    SET @MinValue = @Num1;
    IF @Num2 < @MinValue SET @MinValue = @Num2;
    IF @Num3 < @MinValue SET @MinValue = @Num3;
    IF @Num4 < @MinValue SET @MinValue = @Num4;
    IF @Num5 < @MinValue SET @MinValue = @Num5;

    SET @MaxValue = @Num1;
    IF @Num2 > @MaxValue SET @MaxValue = @Num2;
    IF @Num3 > @MaxValue SET @MaxValue = @Num3;
    IF @Num4 > @MaxValue SET @MaxValue = @Num4;
    IF @Num5 > @MaxValue SET @MaxValue = @Num5;

    RETURN @MinValue + @MaxValue;
END;

SELECT dbo.SumMinMax(5, 8, 3, 10, 7) AS SumMinMaxResult;

-- The user function shows all even or odd numbers in the passed range. The function accepts three parameters: start of range, end of range, even or odd show

CREATE FUNCTION dbo.GetNumbersInRange
(
    @Start INT,
    @End INT,
    @EvenOdd NVARCHAR(4)  -- 'even' or 'odd'
)
RETURNS @Result TABLE (Number INT)
AS
BEGIN
    ;WITH Numbers AS
    (
        SELECT @Start AS Number
        UNION ALL
        SELECT Number + 1
        FROM Numbers
        WHERE Number < @End
    )
    INSERT INTO @Result (Number)
    SELECT Number
    FROM Numbers
    WHERE 
        (@EvenOdd = 'even' AND Number % 2 = 0) OR
        (@EvenOdd = 'odd' AND Number % 2 = 1)
    
    OPTION (MAXRECURSION 0);

    RETURN;
END;

SELECT * FROM dbo.GetNumbersInRange(1, 10, 'even'); -- Returns even numbers from 1 to 10
SELECT * FROM dbo.GetNumbersInRange(1, 10, 'odd');  -- Returns odd numbers from 1 to 10

-- The stored procedure for entering "Hello, world!"

CREATE PROCEDURE dbo.HelloWorld
AS
BEGIN
    PRINT 'Hello, world!';
END;

EXEC dbo.HelloWorld;

-- The stored procedure returns information about the current time

CREATE PROCEDURE dbo.GetCurrentTime
AS
BEGIN
    SELECT GETDATE() AS CurrentTime;
END;

EXEC dbo.GetCurrentTime;

-- The stored procedure returns information about the current date

CREATE PROCEDURE dbo.GetCurrentDate
AS
BEGIN
    SELECT CAST(GETDATE() AS DATE) AS CurrentDate;
END;

EXEC dbo.GetCurrentDate;

-- The stored procedure takes three numbers and returns their sum

CREATE PROCEDURE dbo.SumThreeNumbers
    @Num1 INT,
    @Num2 INT,
    @Num3 INT
AS
BEGIN
    SELECT @Num1 + @Num2 + @Num3 AS SumResult;
END;

EXEC dbo.SumThreeNumbers @Num1 = 1, @Num2 = 2, @Num3 = 3;

-- The stored procedure takes three numbers and returns the arithmetic average of the three numbers

CREATE PROCEDURE dbo.AverageOfThreeNumbers
    @Num1 INT,
    @Num2 INT,
    @Num3 INT
AS
BEGIN
    SELECT CAST((@Num1 + @Num2 + @Num3) AS FLOAT) / 3.0 AS AverageResult;
END;

EXEC dbo.AverageOfThreeNumbers @Num1 = 1, @Num2 = 2, @Num3 = 3;

-- The stored procedure takes three numbers and returns the maximum value 

CREATE PROCEDURE dbo.GetMaxOfThreeNumbers
    @Num1 INT,
    @Num2 INT,
    @Num3 INT
AS
BEGIN
    SELECT MAX(val) AS MaxValue
    FROM (VALUES (@Num1), (@Num2), (@Num3)) AS ValueTable(val);
END;

EXEC dbo.GetMaxOfThreeNumbers @Num1 = 1, @Num2 = 2, @Num3 = 3;

-- The stored procedure takes three numbers and returns the minimum value 

CREATE PROCEDURE dbo.GetMinOfThreeNumbers
    @Num1 INT,
    @Num2 INT,
    @Num3 INT
AS
BEGIN
    SELECT MIN(val) AS MinValue
    FROM (VALUES (@Num1), (@Num2), (@Num3)) AS ValueTable(val);
END;

EXEC dbo.GetMinOfThreeNumbers @Num1 = 1, @Num2 = 2, @Num3 = 3;

-- A stored procedure accepts a number and a symbol

CREATE PROCEDURE dbo.DrawLine
    @Length INT,
    @Symbol CHAR(1)
AS
BEGIN
    DECLARE @Line NVARCHAR(MAX);
    SET @Line = REPLICATE(@Symbol, @Length);
    PRINT @Line;
END;

EXEC dbo.DrawLine @Length = 5, @Symbol = '#';

-- The stored procedure takes a number as a parameter and returns its factorial

CREATE PROCEDURE dbo.CalculateFactorial
    @Number INT
AS
BEGIN
    DECLARE @Factorial BIGINT;
    DECLARE @i INT;
    
    SET @Factorial = 1;
    SET @i = 1;
    
    WHILE @i <= @Number
    BEGIN
        SET @Factorial = @Factorial * @i;
        SET @i = @i + 1;
    END
    
    SELECT @Factorial AS FactorialResult;
END;

EXEC dbo.CalculateFactorial @Number = 5;

-- The stored procedure takes two numeric parameters

CREATE PROCEDURE dbo.Power
    @Base FLOAT,
    @Exponent INT
AS
BEGIN
    DECLARE @Result FLOAT;
    
    SET @Result = POWER(@Base, @Exponent);
    
    SELECT @Result AS PowerResult;
END;

EXEC dbo.Power @Base = 2, @Exponent = 3;