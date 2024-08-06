CREATE DATABASE [Teams]
GO
USE [Teams]
GO

CREATE TABLE [dbo].[Continent](
    [Id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
      [Name] [nvarchar](50) NULL,
);

CREATE TABLE [dbo].[Currency](
    [Id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
      [Name] [nvarchar](50) NULL,
);

CREATE TABLE [dbo].[Country](
    [Id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
      [Name] [nvarchar](50) NULL,
      [Capital] [nvarchar](50) NULL,
    [Territory] [float] NULL,
    [ContinentId] [int] NULL,
    [CurrencyId] [int] NULL,
      [Language] [nvarchar](50) NULL,
    [Debut] [bit] NULL,
    [Champion] [int] NULL,
    FOREIGN KEY (ContinentId) REFERENCES Continent(Id),
    FOREIGN KEY (CurrencyId) REFERENCES Currency(Id)
);

CREATE TABLE [dbo].[Language](
    [Id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
      [Name] [nvarchar](50) NULL,
);

CREATE TABLE [dbo].[CountryLanguage](
    [Id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
    [CountryId] [int] NOT NULL,
    [LanguageId] [int] NOT NULL,
    FOREIGN KEY (CountryId) REFERENCES Country(Id),
    FOREIGN KEY (LanguageId) REFERENCES Language(Id)
);

-- Data for [dbo].[Continent]
INSERT [dbo].[Continent] ([Name]) VALUES
(N'Europe'),
(N'Africa'),
(N'Asia'),
(N'South America'),
(N'Central America'),
(N'North America'),
(N'Australia')

-- Data for [dbo].[Currency]
INSERT [dbo].[Currency] ([Name]) VALUES 
(N'euro'),
(N'Costa Rican colón'),
(N'zloty'),
(N'US dollar'),
(N'pound sterling'),
(N'guarani'),
(N'Trinidad and Tobago dollar'),
(N'Swedish krona'),
(N'Argentine peso'),
(N'franc'),
(N'dinar'),
(N'Mexican peso'),
(N'rial'),
(N'kwanza'),
(N'cedi'),
(N'Czech koruna'),
(N'Brazilian real'),
(N'Swiss franc'),
(N'kuna'),
(N'Australian dollar'),
(N'yen'),
(N'won'),
(N'hryvnia'),
(N'Tunisian dinar'),
(N'Saudi riyal')

-- Data for [dbo].[Country]
INSERT [dbo].[Country] ([Name], [ContinentId], [Capital], [Territory], [CurrencyId], [Debut], [Champion]) VALUES 
(N'Ukraine', 1, N'Kyiv', 603.7, 23, 1, 0),
(N'France', 1, N'Paris', 545.63, 1, 0, 1),
(N'Tunisia', 2, N'Tunis', 155.36, 24, 0, 0),
(N'Angola', 2, N'Luanda', 1246.7, 14, 1, 0),
(N'Japan', 3, N'Tokyo', 374.744, 21, 0, 0),
(N'Brazil', 4, N'Brasília', 8456.51, 17, 0, 5),
(N'Spain', 1, N'Madrid', 499.542, 1, 0, 0),
(N'Italy', 1, N'Rome', 294.02, 1, 0, 4),
(N'Trinidad and Tobago', 5, N'Port of Spain', 5.1, 7, 1, 0),
(N'Germany', 1, N'Berlin', 349.223, 1, 0, 3),
(N'Argentina', 4, N'Buenos Aires', 2736.69, 9, 0, 2),
(N'Paraguay', 4, N'Asunción', 397.3, 6, 0, 0),
(N'South Korea', 3, N'Seoul', 98.19, 22, 0, 0),
(N'Costa Rica', 5, N'San José', 50.66, 2, 0, 0),
(N'Poland', 1, N'Warsaw', 304.465, 3, 0, 0),
(N'USA', 6, N'Washington', 9158.96, 4, 0, 0),
(N'Portugal', 1, N'Lisbon', 91.951, 1, 0, 0),
(N'Saudi Arabia', 3, N'Riyadh', 1960.582, 25, 0, 0),
(N'England', 1, N'London', 129.634, 5, 0, 1),
(N'Sweden', 1, N'Stockholm', 410.934, 8, 0, 0),
(N'Ecuador', 4, N'Quito', 276.84, 4, 0, 0),
(N'Croatia', 1, N'Zagreb', 56.414, 19, 0, 0),
(N'Mexico', 5, N'Mexico City', 1923.04, 12, 0, 0),
(N'Ivory Coast', 2, N'Yamoussoukro', 322.5, 10, 1, 0),
(N'Netherlands', 1, N'Amsterdam', 41.5, 1, 0, 0),
(N'Switzerland', 1, N'Bern', 41.3, 18, 0, 0),
(N'Togo', 2, N'Lomé', 56.6, 10, 1, 0),
(N'Iran', 3, N'Tehran', 1650, 13, 0, 0),
(N'Australia', 7, N'Canberra', 7700, 20, 0, 0),
(N'Serbia and Montenegro', 1, N'Belgrade', 102.2, 11, 0, 0),
(N'Ghana', 2, N'Accra', 238.5, 15, 1, 0),
(N'Czech Republic', 1, N'Prague', 78.9, 16, 0, 0)

-- Data for [dbo].[Language]
INSERT [dbo].[Language] ([Name]) VALUES
(N'Ukrainian'),
(N'French'),
(N'Arabic'),
(N'English'),
(N'German'),
(N'Portuguese'),
(N'Japanese'),
(N'Spanish'),
(N'Italian'),
(N'Korean'),
(N'Polish'),
(N'Swedish'),
(N'Serbian'),
(N'Dutch'),
(N'Persian'),
(N'Czech'),
(N'Croatian')

-- Data for [dbo].[CountryLanguage]
INSERT [dbo].[CountryLanguage] ([CountryId], [LanguageId]) VALUES 
(29, 4),
(19, 4),
(4, 6),
(11, 8),
(6, 6),
(31, 4),
(10, 5),
(28, 15),
(7, 8),
(8, 9),
(14, 8),
(24, 2),
(23, 8),
(25, 14),
(12, 8),
(15, 11),
(17, 6),
(18, 3),
(30, 13),
(16, 4),
(27, 2),
(9, 4),
(3, 2),
(3, 3),
(1, 1),
(2, 2),
(22, 17),
(32, 16),
(26, 9),
(26, 5),
(26, 2),
(20, 12),
(21, 8),
(13, 10),
(5, 7)

--1. Display the country that has won the world championship more often than any other.
SELECT [Name], [Champion]
FROM [dbo].[Country]
WHERE [Champion] = (
    SELECT MAX([Champion])
    FROM [dbo].[Country]
);


--2. Display the number of countries represented by each continent at the World Cup.
SELECT 
    (SELECT [Name] FROM [dbo].[Continent] WHERE [Id] = [Country].[ContinentId]) AS Continent,
    COUNT([Id]) AS NumberOfCountries
FROM 
    [dbo].[Country]
GROUP BY 
    [ContinentId]
ORDER BY 
    NumberOfCountries DESC;


--3. Display the European country that has won the world championship more often than any other.
SELECT 
    [Name] AS Country,
    [Champion]
FROM 
    [dbo].[Country]
WHERE 
    [ContinentId] = (SELECT [Id] FROM [dbo].[Continent] WHERE [Name] = N'Europe')
    AND [Champion] = (
        SELECT MAX([Champion])
        FROM [dbo].[Country]
        WHERE [ContinentId] = (SELECT [Id] FROM [dbo].[Continent] WHERE [Name] = N'Europe')
    );


--4. Display the country with the largest territory.
SELECT 
    [Name] AS Country,
    [Territory]
FROM 
    [dbo].[Country]
WHERE 
    [Territory] = (
        SELECT MAX([Territory])
        FROM [dbo].[Country]
    );


--5. Display the European country with the largest territory.
SELECT 
    [Name] AS Country,
    [Territory]
FROM 
    [dbo].[Country]
WHERE 
    [ContinentId] = (SELECT [Id] FROM [dbo].[Continent] WHERE [Name] = N'Europe')
    AND [Territory] = (
        SELECT MAX([Territory])
        FROM [dbo].[Country]
        WHERE [ContinentId] = (SELECT [Id] FROM [dbo].[Continent] WHERE [Name] = N'Europe')
    );


--6. Display for each continent the number of countries that have become world champions.
SELECT 
    (SELECT [Name] FROM [dbo].[Continent] WHERE [Id] = [Country].[ContinentId]) AS Continent,
    COUNT([Id]) AS NumberOfChampionCountries
FROM 
    [dbo].[Country]
WHERE 
    [Champion] > 0
GROUP BY 
    [ContinentId]
ORDER BY 
    NumberOfChampionCountries DESC;


--7. Display for each continent the total number of championship titles.
SELECT 
    (SELECT [Name] 
     FROM [dbo].[Continent] 
     WHERE [Id] = [Country].[ContinentId]) AS Continent,
    SUM([Champion]) AS TotalChampionshipTitles
FROM 
    [dbo].[Country]
GROUP BY 
    [ContinentId]
ORDER BY 
    TotalChampionshipTitles DESC;


--8. Determine, for each continent, the average territory value for the countries that make up that continent.
SELECT 
    (SELECT [Name] 
     FROM [dbo].[Continent] 
     WHERE [Id] = [Country].[ContinentId]) AS Continent,
    AVG([Territory]) AS AverageTerritory
FROM 
    [dbo].[Country]
GROUP BY 
    [ContinentId]
ORDER BY 
    AverageTerritory DESC;


--9. Display the number of debutant countries for each continent.
SELECT 
    (SELECT [Name] 
     FROM [dbo].[Continent] 
     WHERE [Id] = [Country].[ContinentId]) AS Continent,
    COUNT([Id]) AS NumberOfDebutCountries
FROM 
    [dbo].[Country]
WHERE 
    [Debut] = 1
GROUP BY 
    [ContinentId]
ORDER BY 
    NumberOfDebutCountries DESC;


--10. Display, for each language, the number of countries in which the language is official.
SELECT 
    [Name] AS Language,
    (SELECT COUNT([CountryId]) 
     FROM [dbo].[CountryLanguage] 
     WHERE [LanguageId] = [Language].[Id]) AS NumberOfCountries
FROM 
    [dbo].[Language]
GROUP BY 
    [Name], 
    [Id]
ORDER BY 
    NumberOfCountries DESC;


--11. Display the African country with the smallest territory.
SELECT TOP 1
    [Name] AS Country,
    [Territory]
FROM 
    [dbo].[Country]
WHERE 
    [ContinentId] = (SELECT [Id] FROM [dbo].[Continent] WHERE [Name] = N'Africa')
ORDER BY 
    [Territory] ASC;


--12. Display, for each currency, the number of countries in which that currency is the national currency.
SELECT 
    [Name] AS Currency,
    (SELECT COUNT([Id]) 
     FROM [dbo].[Country] 
     WHERE [CurrencyId] = [Currency].[Id]) AS NumberOfCountries
FROM 
    [dbo].[Currency]
GROUP BY 
    [Name], 
    [Id]
ORDER BY 
    NumberOfCountries DESC;


--13. Display the most common language and indicate the number of countries in which it is the official language.
SELECT TOP 1
    [Name] AS Language,
    (SELECT COUNT([CountryId]) 
     FROM [dbo].[CountryLanguage] 
     WHERE [LanguageId] = [Language].[Id]) AS NumberOfCountries
FROM 
    [dbo].[Language]
GROUP BY 
    [Name], 
    [Id]
ORDER BY 
    NumberOfCountries DESC;


--14. Display the continent with the highest cumulative total of championship titles.
SELECT 
    (SELECT [Name] FROM [dbo].[Continent] WHERE [Id] = [Country].[ContinentId]) AS Continent,
    SUM([Country].[Champion]) AS TotalChampionshipTitles
FROM 
    [dbo].[Country]
GROUP BY 
    [Country].[ContinentId]
ORDER BY 
    TotalChampionshipTitles DESC;


--15. Display the most common language among countries on the European and African continents.
SELECT TOP 1
    [Language].[Name] AS Language,
    (
        SELECT COUNT(*)
        FROM [dbo].[Country]
        WHERE [Country].[Id] IN (
            SELECT [CountryId]
            FROM [dbo].[CountryLanguage]
            WHERE [CountryLanguage].[LanguageId] = [Language].[Id]
        )
        AND [ContinentId] IN (
            SELECT [Id]
            FROM [dbo].[Continent]
            WHERE [Continent].[Name] IN ('Europe', 'Africa')
        )
    ) AS NumberOfCountries
FROM 
    [dbo].[Language] AS [Language]
ORDER BY 
    NumberOfCountries DESC;