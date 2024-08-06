CREATE DATABASE [WorldCup]
GO
USE [WorldCup]
GO
CREATE TABLE [dbo].[Teams](
	[Id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[country] [nvarchar](50) NULL,
	[Continent] [nvarchar](50) NULL,
	[Capital] [nvarchar](50) NULL,
	[Territory] [float] NULL,
	[Currency] [nvarchar](50) NULL,
	[Language] [nvarchar](50) NULL,
	[Debut] [bit] NULL,
	[Champion] [int] NULL
) ON [PRIMARY]
GO

INSERT [dbo].[Teams] ([country], [Continent], [Capital], [Territory], [Currency], [Language], [Debut], [Champion]) 
VALUES (N'Ukraine', N'Europe', N'Kyiv', 603.7, N'hryvnia', N'Ukrainian', 1, 0),
(N'France', N'Europe', N'Paris', 545.63, N'euro', N'French', 0, 1),
(N'Tunisia', N'Africa', N'Tunis', 155.36, N'Tunisian dinar', N'Arabic', 0, 0),
(N'Angola', N'Africa', N'Luanda', 1246.7, N'kwanza', N'Portuguese', 1, 0),
(N'Japan', N'Asia', N'Tokyo', 374.744, N'yen', N'Japanese', 0, 0),
(N'Brazil', N'South America', N'Brasília', 8456.51, N'Brazilian real', N'Portuguese', 0, 5),
(N'Spain', N'Europe', N'Madrid', 499.542, N'euro', N'Spanish', 0, 0),
(N'Italy', N'Europe', N'Rome', 294.02, N'euro', N'Italian', 0, 4),
(N'Trinidad and Tobago', N'Central America', N'Port of Spain', 5.1, N'Trinidad and Tobago dollar', N'English', 1, 0),
(N'Germany', N'Europe', N'Berlin', 349.223, N'euro', N'German', 0, 3),
(N'Argentina', N'South America', N'Buenos Aires', 2736.69, N'Argentine peso', N'Spanish', 0, 2),
(N'Paraguay', N'South America', N'Asunción', 397.3, N'guarani', N'Spanish', 0, 0),
(N'South Korea', N'Asia', N'Seoul', 98.19, N'won', N'Korean', 0, 0),
(N'Costa Rica', N'Central America', N'San José', 50.66, N'colón', N'Spanish', 0, 0),
(N'Poland', N'Europe', N'Warsaw', 304.465, N'zloty', N'Polish', 0, 0),
(N'USA', N'North America', N'Washington', 9158.96, N'US dollar', N'English', 0, 0),
(N'Portugal', N'Europe', N'Lisbon', 91.951, N'euro', N'Portuguese', 0, 0),
(N'Saudi Arabia', N'Asia', N'Riyadh', 1960.582, N'Saudi riyal', N'Arabic', 0, 0),
(N'England', N'Europe', N'London', 129.634, N'pound sterling', N'English', 0, 1),
(N'Sweden', N'Europe', N'Stockholm', 410.934, N'Swedish krona', N'Swedish', 0, 0),
(N'Ecuador', N'South America', N'Quito', 276.84, N'US dollar', N'Spanish', 0, 0),
(N'Croatia', N'Europe', N'Zagreb', 56.414, N'kuna', N'Croatian', 0, 0),
(N'Mexico', N'Central America', N'Mexico City', 1923.04, N'Mexican peso', N'Spanish', 0, 0),
(N'Ivory Coast', N'Africa', N'Yamoussoukro', 322.5, N'franc', N'French', 1, 0),
(N'Netherlands', N'Europe', N'Amsterdam', 41.5, N'euro', N'Dutch', 0, 0),
(N'Switzerland', N'Europe', N'Bern', 41.3, N'Swiss franc', N'German', 0, 0),
(N'Togo', N'Africa', N'Lomé', 56.6, N'franc', N'French', 1, 0),
(N'Iran', N'Asia', N'Tehran', 1650, N'rial', N'Persian', 0, 0),
(N'Australia', N'Australia', N'Canberra', 7700, N'Australian dollar', N'English', 0, 0),
(N'Serbia and Montenegro', N'Europe', N'Belgrade', 102.2, N'dinar', N'Serbian', 0, 0),
(N'Ghana', N'Africa', N'Accra', 238.5, N'cedi', N'English', 1, 0),
(N'Czech Republic', N'Europe', N'Prague', 78.9, N'koruna', N'Czech', 0, 0)

----------------------

--1. Determine the number of countries participating in the World Cup.
SELECT COUNT(*) AS NumberOfCountries
FROM [dbo].[Teams]
--2. Determine the number of countries that have become world champions.
SELECT COUNT(*) AS NumberOfChampions
FROM [dbo].[Teams]
WHERE Champion>0 
SELECT * FROM [dbo].[Teams]
--3. Determine the number of countries participating in the World Cup in which Spanish is the official language.
SELECT COUNT(*) AS NumberOfSpanishSpeakingCountries
FROM [dbo].[Teams]
WHERE Language = 'Spanish'
--4. Determine the number of World Cup debutants
SELECT COUNT(*) AS NumberOfDebuts
FROM [dbo].[Teams]
WHERE Debut > 0
--5. Determine the largest territory of all participating countries. (2 options)
SELECT [country], [Territory]
FROM [dbo].[Teams]
WHERE [Territory] = (SELECT MAX([Territory]) FROM [dbo].[Teams])

SELECT TOP 1 [country], [Territory]
FROM [dbo].[Teams]
ORDER BY [Territory] DESC;
--6. Identify the largest territory of all European member states. (2 options)
SELECT [country], [Territory]
FROM [dbo].[Teams]
WHERE [Territory] = (
    SELECT MAX([Territory])
    FROM [dbo].[Teams]
    WHERE [Continent] = N'Europe'
);

SELECT TOP 1 [country], [Territory]
FROM [dbo].[Teams]
WHERE Continent='Europe'
ORDER BY [Territory] DESC;
--7. Determine the total number of championship titles won by the participating countries.
SELECT SUM(Champion) AS NumberOfChampions
FROM [dbo].[Teams]
--8. Determine the total number of championship titles won by the participating European countries.
SELECT SUM(Champion) AS NumberOfChampions
FROM [dbo].[Teams]
WHERE Continent='Europe'
--9. Determine the smallest territory of all U.S. participating countries. (2 options)
SELECT TOP 1 [country], [Territory]
FROM [dbo].[Teams]
WHERE [Continent] Like '%America'
ORDER BY [Territory] ASC;

SELECT TOP 1 [country], [Territory]
FROM [dbo].[Teams]
WHERE [Continent] Like '%America'
ORDER BY [Territory] ASC;
--10. Determine the average value of territory among African countries.
SELECT AVG(Territory) FROM [dbo].[Teams] AS AverageAfricanTerritory
WHERE [Continent] = 'Africa'