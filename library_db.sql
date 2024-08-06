CREATE DATABASE [Library]
GO
USE [Library]
GO
CREATE TABLE [dbo].[Authors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](15) NOT NULL,
	[LastName] [nvarchar](25) NOT NULL
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Pages] [int] NOT NULL,
	[YearPress] [int] NOT NULL,
	[Id_Themes] [int] NOT NULL,
	[Id_Category] [int] NOT NULL,
	[Id_Author] [int] NOT NULL,
	[Id_Press] [int] NOT NULL,
	[Comment] [nvarchar](50) NULL,
	[Quantity] [int] NOT NULL
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[Departments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](40) NOT NULL
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Faculties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[Groups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
	[Id_Faculty] [int] NOT NULL
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[Libs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](15) NOT NULL,
	[LastName] [nvarchar](25) NOT NULL
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[Press](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[S_Cards](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Student] [int] NOT NULL,
	[Id_Book] [int] NOT NULL,
	[DateOut] [datetime] NOT NULL,
	[DateIn] [datetime] NULL,
	[Id_Lib] [int] NOT NULL
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](15) NOT NULL,
	[LastName] [nvarchar](25) NOT NULL,
	[Id_Group] [int] NOT NULL,
	[Term] [int] NOT NULL
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[T_Cards](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Teacher] [int] NOT NULL,
	[Id_Book] [int] NOT NULL,
	[DateOut] [datetime] NOT NULL,
	[DateIn] [datetime] NULL,
	[Id_Lib] [int] NOT NULL
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Teachers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](15) NOT NULL,
	[LastName] [nvarchar](25) NOT NULL,
	[Id_Dep] [int] NOT NULL
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Themes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Authors] ON 
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (1, N'James R.', N'Groff')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (2, N'Sergey', N'Nikolskiy')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (3, N'Mikhail', N'Marov')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (4, N'Boris', N'Karpov')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (5, N'Aleksey', N'Arkhangelskiy')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (6, N'Vladimir', N'Korol')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (7, N'Evangelos', N'Petrusos')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (8, N'Markus', N'Herhager')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (9, N'Pavel', N'Garbar')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (10, N'Aleksandr', N'Matrosov')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (11, N'Lyudmila', N'Omelchenko')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (12, N'Kevin', N'Reichard')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (13, N'Olga', N'Kokoreva')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (14, N'Mark', N'Brown')
SET IDENTITY_INSERT [dbo].[Authors] OFF

SET IDENTITY_INSERT [dbo].[Books] ON 
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (1, N'SQL', 816, 2001, 1, 1, 1, 2, N'2nd Edition', 2)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (2, N'3D Studio Max 3', 640, 2000, 3, 6, 3, 3, N'Course', 3)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (3, N'100 Common Components Library for Delphi 5', 272, 1999, 2, 4, 5, 4, N'Components', 1)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (4, N'Visual Basic 6', 416, 2000, 2, 5, 4, 3, N'Special Guide', 1)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (5, N'Course of Mathematical Analysis', 328, 1990, 4, 2, 2, 5, N'Volume 1', 1)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (6, N'C++ Builder 5 Library: 70 I/O Components', 288, 2000, 2, 3, 5, 4, N'Components', 1)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (7, N'Integrated Development Environment', 272, 2000, 2, 3, 5, 4, N'Development Environment', 2)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (8, N'Russian Help for Delphi 5 and Object Pascal', 32, 2000, 2, 4, 5, 4, N'Reference', 1)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (9, N'Visual Basic 6.0 for Application', 488, 2000, 2, 5, 6, 6, N'Reference with Examples', 3)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (10, N'Visual Basic 6', 576, 2000, 2, 5, 7, 2, N'Developer Guide Volume 1', 1)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (11, N'Mathcad 2000', 416, 2000, 5, 7, 8, 2, N'Complete Guide', 1)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (12, N'Novell GroupWise 5.5 Email and Collaboration System', 480, 2000, 6, 8, 9, 2, N'Network Packages', 2)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (13, N'Windows 2000 Registry', 352, 2000, 9, 12, 13, 2, N'Professional Guide', 4)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (14, N'Unix Guide', 384, 1999, 9, 13, 12, 3, N'Reference Guide', 1)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (15, N'Self-Study Visual FoxPro 6.0', 512, 1999, 1, 11, 11, 2, N'Self-Study', 1)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (16, N'Self-Study FrontPage 2000', 512, 1999, 7, 10, 11, 2, N'Self-Study', 1)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (17, N'Self-Study Perl', 432, 2000, 2, 9, 10, 2, N'Self-Study', 2)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (18, N'HTML 3.2', 1040, 2000, 7, 14, 14, 2, N'Guide', 5)
SET IDENTITY_INSERT [dbo].[Books] OFF

SET IDENTITY_INSERT [dbo].[Categories] ON 
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'Databases')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'Classics')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3, N'Professional')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (4, N'Reference')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (5, N'Programming Languages')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (6, N'Graphics')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (7, N'Mathematical Software')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (8, N'Office')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (9, N'System Administration')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (10, N'Web Development')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (11, N'Self-Study')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (12, N'Operating Systems')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (13, N'Guides')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (14, N'HTML')
SET IDENTITY_INSERT [dbo].[Categories] OFF

SET IDENTITY_INSERT [dbo].[Departments] ON 
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (1, N'Programming')
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (2, N'Graphics and Design')
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (3, N'Hardware and Administration')
SET IDENTITY_INSERT [dbo].[Departments] OFF

SET IDENTITY_INSERT [dbo].[Faculties] ON 
INSERT [dbo].[Faculties] ([Id], [Name]) VALUES (1, N'Programming')
INSERT [dbo].[Faculties] ([Id], [Name]) VALUES (2, N'Web Design')
INSERT [dbo].[Faculties] ([Id], [Name]) VALUES (3, N'Administration')
SET IDENTITY_INSERT [dbo].[Faculties] OFF

SET IDENTITY_INSERT [dbo].[Groups] ON 
INSERT [dbo].[Groups] ([Id], [Name], [Id_Faculty]) VALUES (2, N'9P1', 1)
INSERT [dbo].[Groups] ([Id], [Name], [Id_Faculty]) VALUES (3, N'9P2', 1)
INSERT [dbo].[Groups] ([Id], [Name], [Id_Faculty]) VALUES (4, N'9A', 3)
INSERT [dbo].[Groups] ([Id], [Name], [Id_Faculty]) VALUES (5, N'9D', 2)
INSERT [dbo].[Groups] ([Id], [Name], [Id_Faculty]) VALUES (6, N'14A', 3)
INSERT [dbo].[Groups] ([Id], [Name], [Id_Faculty]) VALUES (7, N'19P1', 1)
INSERT [dbo].[Groups] ([Id], [Name], [Id_Faculty]) VALUES (8, N'18P2', 1)
INSERT [dbo].[Groups] ([Id], [Name], [Id_Faculty]) VALUES (9, N'18A', 3)
INSERT [dbo].[Groups] ([Id], [Name], [Id_Faculty]) VALUES (10, N'19D', 2)
SET IDENTITY_INSERT [dbo].[Groups] OFF

SET IDENTITY_INSERT [dbo].[Libs] ON 
INSERT [dbo].[Libs] ([Id], [FirstName], [LastName]) VALUES (1, N'Sergey', N'Maksimenko')
INSERT [dbo].[Libs] ([Id], [FirstName], [LastName]) VALUES (2, N'Dmitry', N'Chebotarev')
SET IDENTITY_INSERT [dbo].[Libs] OFF

SET IDENTITY_INSERT [dbo].[Press] ON 
INSERT [dbo].[Press] ([Id], [Name]) VALUES (1, N'DiaSoft')
INSERT [dbo].[Press] ([Id], [Name]) VALUES (2, N'BHV')
INSERT [dbo].[Press] ([Id], [Name]) VALUES (3, N'Piter')
INSERT [dbo].[Press] ([Id], [Name]) VALUES (4, N'Binom')
INSERT [dbo].[Press] ([Id], [Name]) VALUES (5, N'Science')
INSERT [dbo].[Press] ([Id], [Name]) VALUES (6, N'Kudits-Image')
INSERT [dbo].[Press] ([Id], [Name]) VALUES (7, N'Dialectics')
SET IDENTITY_INSERT [dbo].[Press] OFF

SET IDENTITY_INSERT [dbo].[S_Cards] ON 
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (1, 2, 1, CAST(N'2001-05-17 00:00:00.000' AS DateTime), CAST(N'2001-06-12 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (2, 17, 18, CAST(N'2000-05-18 00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (3, 6, 3, CAST(N'2001-04-21 00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (4, 21, 4, CAST(N'2001-03-26 00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (5, 3, 1, CAST(N'2000-05-07 00:00:00.000' AS DateTime), CAST(N'2001-04-12 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (6, 7, 11, CAST(N'2001-06-02 00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (7, 16, 14, CAST(N'2001-04-05 00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (8, 11, 6, CAST(N'2001-05-05 00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (9, 17, 2, CAST(N'2001-10-01 00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (10, 10, 13, CAST(N'2001-05-05 00:00:00.000' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[S_Cards] OFF

SET IDENTITY_INSERT [dbo].[Students] ON 
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (2, N'Vyacheslav', N'Zezik', 8, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (3, N'Olga', N'Mantulyak', 8, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (4, N'Olga', N'Khrenova', 8, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (5, N'Olga', N'Medvedeva', 8, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (6, N'Galina', N'Inashchenko', 8, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (7, N'Yuri', N'Minaev', 8, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (8, N'Yuri', N'Domovesov', 8, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (9, N'Ruslan', N'Yarmolovich', 8, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (10, N'Igor', N'Udovik', 8, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (11, N'Petr', N'Katsevich', 8, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (12, N'Evgeny', N'Burtsov', 3, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (13, N'Flora', N'Pobirskaya', 3, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (14, N'Natalia', N'Gridina', 3, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (15, N'Elena', N'Akusova', 3, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (16, N'Svetlana', N'Gorshkova', 9, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (17, N'Alexander', N'Lyubenko', 10, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (18, N'Evgenia', N'Tsimbaljuk', 10, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (19, N'Olga', N'Bolyaevskaya', 5, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (20, N'Stanislav', N'Pleshakov', 7, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (21, N'Elena', N'Taran', 4, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (22, N'Denis', N'Rogachevsky', 6, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (23, N'Oksana', N'Tikhonova', 6, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (24, N'Petr', N'Maksimov', 3, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (25, N'Irina', N'Stogneyeva', 5, 2)
SET IDENTITY_INSERT [dbo].[Students] OFF

SET IDENTITY_INSERT [dbo].[T_Cards] ON 
INSERT [dbo].[T_Cards] ([Id], [Id_Teacher], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (1, 2, 13, CAST(N'2000-01-01 00:00:00.000' AS DateTime), CAST(N'2001-07-04 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[T_Cards] ([Id], [Id_Teacher], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (2, 10, 2, CAST(N'2000-03-03 00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[T_Cards] ([Id], [Id_Teacher], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (3, 6, 12, CAST(N'2000-06-04 00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[T_Cards] ([Id], [Id_Teacher], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (4, 3, 1, CAST(N'2000-09-05 00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[T_Cards] ([Id], [Id_Teacher], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (5, 8, 8, CAST(N'2000-05-05 00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[T_Cards] ([Id], [Id_Teacher], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (6, 5, 18, CAST(N'2001-02-02 00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[T_Cards] ([Id], [Id_Teacher], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (7, 12, 17, CAST(N'2001-03-04 00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[T_Cards] ([Id], [Id_Teacher], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (8, 4, 18, CAST(N'2000-07-02 00:00:00.000' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[T_Cards] OFF

SET IDENTITY_INSERT [dbo].[Teachers] ON 
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (1, N'Grigory', N'Yashchuk', 1)
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (2, N'Alex', N'Tumanov', 1)
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (3, N'Sergey', N'Maksimenko', 2)
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (4, N'Dmitry', N'Borovsky', 2)
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (5, N'Viktor', N'Brovar', 2)
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (6, N'Vadim', N'Tkachenko', 3)
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (7, N'Vyacheslav', N'Kalashnikov', 3)
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (8, N'Ruslan', N'Kucherenko', 1)
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (9, N'Andrey', N'Tendyuk', 1)
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (10, N'Anatoly', N'Vyklyuk', 2)
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (11, N'Oleg', N'Reznichenko', 3)
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (12, N'Alexander', N'Artemov', 1)
SET IDENTITY_INSERT [dbo].[Teachers] OFF

SET IDENTITY_INSERT [dbo].[Themes] ON 
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (1, N'Databases')
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (2, N'Programming')
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (3, N'Graphics Packages')
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (4, N'Advanced Mathematics')
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (5, N'Mathematical Packages')
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (6, N'Networks')
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (7, N'Web Design')
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (8, N'Windows 2000')
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (9, N'Operating Systems')
SET IDENTITY_INSERT [dbo].[Themes] OFF

ALTER TABLE [dbo].[Authors] ADD  CONSTRAINT [aaaaaAuthors_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Books] ADD  CONSTRAINT [aaaaaBooks_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [AuthorsBooks] ON [dbo].[Books]
(
	[Id_Author] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [CategoriesBooks] ON [dbo].[Books]
(
	[Id_Category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PressBooks] ON [dbo].[Books]
(
	[Id_Press] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ThemesBooks] ON [dbo].[Books]
(
	[Id_Themes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Categories] ADD  CONSTRAINT [aaaaaCategories_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Departments] ADD  CONSTRAINT [aaaaaDepartments_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Faculties] ADD  CONSTRAINT [aaaaaFaculties_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Groups] ADD  CONSTRAINT [aaaaaGroups_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [FacultiesGroups] ON [dbo].[Groups]
(
	[Id_Faculty] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Libs] ADD  CONSTRAINT [aaaaaLibs_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Press] ADD  CONSTRAINT [aaaaaPress_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[S_Cards] ADD  CONSTRAINT [aaaaaS_Cards_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BooksCards] ON [dbo].[S_Cards]
(
	[Id_Book] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [LibsCards] ON [dbo].[S_Cards]
(
	[Id_Lib] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [StudentsCards] ON [dbo].[S_Cards]
(
	[Id_Student] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Students] ADD  CONSTRAINT [aaaaaStudents_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GroupsStudents] ON [dbo].[Students]
(
	[Id_Group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[T_Cards] ADD  CONSTRAINT [aaaaaT_Cards_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BooksT_Cards] ON [dbo].[T_Cards]
(
	[Id_Book] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [LibsT_Cards] ON [dbo].[T_Cards]
(
	[Id_Lib] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [TeachersT_Cards] ON [dbo].[T_Cards]
(
	[Id_Teacher] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Teachers] ADD  CONSTRAINT [aaaaaTeachers_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [DepartmentsTeachers] ON [dbo].[Teachers]
(
	[Id_Dep] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Themes] ADD  CONSTRAINT [aaaaaThemes_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [Books_FK00] FOREIGN KEY([Id_Author])
REFERENCES [dbo].[Authors] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [Books_FK00]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [Books_FK01] FOREIGN KEY([Id_Category])
REFERENCES [dbo].[Categories] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [Books_FK01]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [Books_FK02] FOREIGN KEY([Id_Press])
REFERENCES [dbo].[Press] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [Books_FK02]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [Books_FK03] FOREIGN KEY([Id_Themes])
REFERENCES [dbo].[Themes] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [Books_FK03]
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [Groups_FK00] FOREIGN KEY([Id_Faculty])
REFERENCES [dbo].[Faculties] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [Groups_FK00]
GO
ALTER TABLE [dbo].[S_Cards]  WITH CHECK ADD  CONSTRAINT [S_Cards_FK00] FOREIGN KEY([Id_Book])
REFERENCES [dbo].[Books] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[S_Cards] CHECK CONSTRAINT [S_Cards_FK00]
GO
ALTER TABLE [dbo].[S_Cards]  WITH CHECK ADD  CONSTRAINT [S_Cards_FK01] FOREIGN KEY([Id_Lib])
REFERENCES [dbo].[Libs] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[S_Cards] CHECK CONSTRAINT [S_Cards_FK01]
GO
ALTER TABLE [dbo].[S_Cards]  WITH CHECK ADD  CONSTRAINT [S_Cards_FK02] FOREIGN KEY([Id_Student])
REFERENCES [dbo].[Students] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[S_Cards] CHECK CONSTRAINT [S_Cards_FK02]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [Students_FK00] FOREIGN KEY([Id_Group])
REFERENCES [dbo].[Groups] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [Students_FK00]
GO
ALTER TABLE [dbo].[T_Cards]  WITH CHECK ADD  CONSTRAINT [T_Cards_FK00] FOREIGN KEY([Id_Book])
REFERENCES [dbo].[Books] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[T_Cards] CHECK CONSTRAINT [T_Cards_FK00]
GO
ALTER TABLE [dbo].[T_Cards]  WITH CHECK ADD  CONSTRAINT [T_Cards_FK01] FOREIGN KEY([Id_Lib])
REFERENCES [dbo].[Libs] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[T_Cards] CHECK CONSTRAINT [T_Cards_FK01]
GO
ALTER TABLE [dbo].[T_Cards]  WITH CHECK ADD  CONSTRAINT [T_Cards_FK02] FOREIGN KEY([Id_Teacher])
REFERENCES [dbo].[Teachers] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[T_Cards] CHECK CONSTRAINT [T_Cards_FK02]
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD  CONSTRAINT [Teachers_FK00] FOREIGN KEY([Id_Dep])
REFERENCES [dbo].[Departments] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Teachers] CHECK CONSTRAINT [Teachers_FK00]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [CK Books Pages] CHECK  (([Pages]>(0)))
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [CK Books Pages]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [CK Books Quantity] CHECK  (([Quantity]>=(0)))
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [CK Books Quantity]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [CK Books YearPress] CHECK  (([YearPress]>=(1445)))
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [CK Books YearPress]
GO
ALTER TABLE [dbo].[S_Cards]  WITH CHECK ADD  CONSTRAINT [CK S_Cards DateIn] CHECK  (([DateIn]>='1/1/2000'))
GO
ALTER TABLE [dbo].[S_Cards] CHECK CONSTRAINT [CK S_Cards DateIn]
GO
ALTER TABLE [dbo].[S_Cards]  WITH CHECK ADD  CONSTRAINT [CK S_Cards DateOut] CHECK  (([DateOut]>='1/1/2000'))
GO
ALTER TABLE [dbo].[S_Cards] CHECK CONSTRAINT [CK S_Cards DateOut]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [CK Students Term] CHECK  (([Term]>(0) AND [Term]<=(12)))
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [CK Students Term]
GO
ALTER TABLE [dbo].[T_Cards]  WITH CHECK ADD  CONSTRAINT [CK T_Cards DateIn] CHECK  (([DateIn]>='1/1/2000'))
GO
ALTER TABLE [dbo].[T_Cards] CHECK CONSTRAINT [CK T_Cards DateIn]
GO
ALTER TABLE [dbo].[T_Cards]  WITH CHECK ADD  CONSTRAINT [CK T_Cards DateOut] CHECK  (([DateOut]>='1/1/2000'))
GO
ALTER TABLE [dbo].[T_Cards] CHECK CONSTRAINT [CK T_Cards DateOut]
GO

--1. Display books with the minimum number of pages published by a particular publisher.

SELECT 
    Books.Name AS BookName,
    Books.Pages,
    Press.Name AS PublisherName
FROM 
    [dbo].[Books]
JOIN 
    [dbo].[Press] ON Press.Id = Books.Id_Press
WHERE 
    Books.Pages = (
        SELECT 
            MIN([Pages])
        FROM 
            [dbo].[Books]
        WHERE 
            Books.Id_Press = Press.Id
    )
ORDER BY 
    Press.Name;

--2. Display the names of publishers that have published books with an average page count of more than 100 pages.

SELECT 
    Press.Name AS PublisherName
FROM 
    [dbo].[Press]
JOIN 
    [dbo].[Books] ON Press.Id = Books.Id_Press
GROUP BY 
    Press.Name
HAVING 
    AVG(Books.Pages) > 100;

--3. Output the total sum of pages of all books in the library published by BHV and BINOM publishers.

SELECT 
    SUM(Books.Pages) AS TotalPages
FROM 
    [dbo].[Books]
JOIN 
    [dbo].[Press] ON Books.Id_Press = Press.Id
WHERE 
    Press.Name IN ('BHV', 'BINOM');

--4. Select the names of all students who have borrowed books between 1 January 2001 and the current date.

SELECT DISTINCT Students.FirstName, Students.LastName
FROM [dbo].[Students]
JOIN [dbo].[S_Cards] ON Students.Id = S_Cards.Id_Student
WHERE S_Cards.DateIn >= '2001-01-01' AND S_Cards.DateOut <= GETDATE();

--5. Find all students who are currently working with the book "Windows 2000 Registry" by author Olga Kokoreva.

SELECT Students.FirstName, Students.LastName
FROM [dbo].[Students]
JOIN [dbo].[S_Cards] ON Students.Id = S_Cards.Id_Student
JOIN [dbo].[Books] ON S_Cards.Id_Book = Books.Id
JOIN [dbo].[Authors] ON Id_Author = Books.Id_Author
WHERE 
(Books.Name = 'Windows 2000 Registry' 
AND Authors.FirstName = 'Olga' 
AND Authors.LastName = 'Kokoreva');

--6. Display information about authors whose average book length (in pages) is more than 600 pages.

SELECT Authors.ID, Authors.FirstName, Authors.LastName 
FROM [dbo].[Authors]
JOIN [dbo].[Books] ON Authors.ID = Books.Id_Author
GROUP BY Authors.ID, Authors.FirstName, Authors.LastName
HAVING AVG(Books.Pages) > 600;

--7. Display information about publishers whose total number of pages of their published books is greater than 700.

SELECT Press.ID, Press.Name, SUM(Books.Pages) AS TotalPages
FROM [dbo].[Press]
JOIN [dbo].[Books] ON Press.Id = Books.Id_Press
GROUP BY Press.ID, Press.Name
HAVING SUM(Books.Pages) > 700;

--8. Display all library visitors (both students and teachers) and the books they borrowed.

SELECT 
    Libs.ID AS LibraryID, 
    Libs.FirstName AS LibFirstName, 
    Libs.LastName AS LibLastName,
    'Student' AS VisitorType,
    Students.FirstName AS VisitorFirstName,
    Students.LastName AS VisitorLastName,
    Books.ID,
    Books.Name,
    Books.Id_Author
FROM [dbo].[Libs]
JOIN [dbo].[S_Cards] ON Libs.ID = S_Cards.Id_Lib
JOIN [dbo].[Students] ON S_Cards.Id_Student = Students.Id
JOIN [dbo].[Books] ON S_Cards.Id_Book = Books.ID

UNION ALL

SELECT 
    Libs.ID AS LibraryID, 
    Libs.FirstName AS LibFirstName, 
    Libs.LastName AS LibLastName,
    'Teacher' AS VisitorType,
    Teachers.FirstName AS VisitorFirstName,
    Teachers.LastName AS VisitorLastName,
    Books.ID,
    Books.Name,
    Books.Id_Author
FROM [dbo].[Libs]
JOIN [dbo].[T_Cards] ON Libs.ID = T_Cards.Id_Lib
JOIN [dbo].[Teachers] ON T_Cards.Id_Teacher = Teachers.Id
JOIN [dbo].[Books] ON T_Cards.Id_Book = Books.ID

ORDER BY LibraryID, VisitorType, VisitorLastName, VisitorFirstName, Books.Name;

--9. Output the most popular author(s) among students and the number of books by that author borrowed from the library.

SELECT TOP 1 
    Authors.ID,
    Authors.FirstName,
    Authors.LastName,
    COUNT(Books.ID) AS BooksBorrowed
FROM [dbo].[S_Cards]
JOIN [dbo].[Books] ON S_Cards.Id_Book = Books.ID
JOIN [dbo].[Authors] ON Books.Id_Author = Authors.ID
GROUP BY Authors.ID, Authors.FirstName, Authors.LastName
ORDER BY BooksBorrowed DESC;

--10. Output the most popular author(s) among teachers and the number of books by that author borrowed from the library.

SELECT TOP 1 
    Authors.ID,
    Authors.FirstName,
    Authors.LastName,
    COUNT(Books.ID) AS BooksBorrowed
FROM [dbo].[T_Cards]
JOIN [dbo].[Books] ON T_Cards.Id_Book = Books.ID
JOIN [dbo].[Authors] ON Books.Id_Author = Authors.ID
GROUP BY Authors.ID, Authors.FirstName, Authors.LastName
ORDER BY BooksBorrowed DESC;

-- 11. Bring out the most popular topic(s) among students and teachers.

-- Students

SELECT 
    Categories.Name,
    COUNT(*) AS BookCount
FROM [dbo].[S_Cards]
JOIN [dbo].[Books] ON S_Cards.Id_Book = Books.ID
JOIN [dbo].[Categories] ON Books.Id_Category = Categories.ID
GROUP BY Categories.Name
HAVING COUNT(*) = (
    SELECT MAX(BookCount)
    FROM (
        SELECT 
            Categories.Name,
            COUNT(*) AS BookCount
        FROM [dbo].[S_Cards]
        JOIN [dbo].[Books] ON S_Cards.Id_Book = Books.ID
        JOIN [dbo].[Categories] ON Books.Id_Category = Categories.ID
        GROUP BY Categories.Name
    ) AS SubQuery
);

-- Teachers

SELECT 
    Categories.Name,
    COUNT(*) AS BookCount
FROM [dbo].[T_Cards]
JOIN [dbo].[Books] ON T_Cards.Id_Book = Books.ID
JOIN [dbo].[Categories] ON Books.Id_Category = Categories.ID
GROUP BY Categories.Name
HAVING COUNT(*) = (
    SELECT MAX(BookCount)
    FROM (
        SELECT 
            Categories.Name,
            COUNT(*) AS BookCount
        FROM [dbo].[T_Cards]
        JOIN [dbo].[Books] ON T_Cards.Id_Book = Books.ID
        JOIN [dbo].[Categories] ON Books.Id_Category = Categories.ID
        GROUP BY Categories.Name
    ) AS SubQuery
);

--12. Display the number of faculty and students who have visited the library.

SELECT 'Students' AS VisitorType, COUNT(DISTINCT S_Cards.Id_Lib) AS VisitorCount
FROM [dbo].[S_Cards]
UNION ALL
SELECT 'Teachers' AS VisitorType, COUNT(DISTINCT T_Cards.Id_Lib) AS VisitorCount
FROM [dbo].[T_Cards];

--13. If the total number of books in the library is taken as 100 per cent, then it is necessary to calculate how many books (as a percentage) were borrowed by each faculty.

SELECT 
    Faculties.Name,
    COUNT(Books.ID) AS FacultyCount,
    (COUNT(Books.ID) * 100.0 / TotalBooks.TotalCount) AS Percentage
FROM [dbo].[Books]
JOIN [dbo].[S_Cards] ON Books.ID = S_Cards.Id_Book
JOIN [dbo].[Students] ON S_Cards.Id_Student = Students.ID
JOIN [dbo].[Groups] ON Students.Id_Group = Groups.ID
JOIN [dbo].[Faculties] ON Groups.Id_Faculty = Faculties.ID,
    (SELECT COUNT(*) AS TotalCount FROM [dbo].[Books]) AS TotalBooks
GROUP BY Faculties.Name, TotalBooks.TotalCount
ORDER BY Percentage DESC;

--14. Display the most reading faculty and the most reading department.

-- Faculty

SELECT TOP 1 
    Faculties.Name,
    COUNT(Books.ID) AS BooksTaken
FROM [dbo].[Books]
JOIN [dbo].[S_Cards] ON Books.ID = S_Cards.Id_Book
JOIN [dbo].[Students] ON S_Cards.Id_Student = Students.Id
JOIN [dbo].[Groups] ON Students.Id_Group = Groups.Id
JOIN [dbo].[Faculties] ON Groups.Id_Faculty = Faculties.Id
GROUP BY Faculties.Name
ORDER BY BooksTaken DESC

-- Department

SELECT TOP 1
    Departments.Name,
    COUNT(Books.ID) AS BooksTaken
FROM [dbo].[Books]
JOIN [dbo].[T_Cards] ON Books.ID = T_Cards.Id_Book
JOIN [dbo].[Teachers] ON T_Cards.Id_Teacher = Teachers.Id
JOIN [dbo].[Departments] ON Teachers.Id_Dep = Departments.Id
GROUP BY Departments.Name
ORDER BY BooksTaken DESC;

--15. Display the author(s) of the most popular books among teachers and students.

SELECT 
    Authors.ID,
    Authors.FirstName,
    Authors.LastName,
    COUNT(*) AS BooksTaken
FROM [dbo].[Books]
JOIN [dbo].[S_Cards] ON Books.ID = S_Cards.Id_Book
JOIN [dbo].[Students] ON S_Cards.Id_Student = Students.ID
JOIN [dbo].[Authors] ON Books.Id_Author = Authors.Id
GROUP BY 
    Authors.ID,
    Authors.FirstName,
    Authors.LastName
HAVING COUNT(*) = (
    SELECT MAX(BooksTaken)
    FROM (
        SELECT COUNT(*) AS BooksTaken
        FROM [dbo].[Books]
        JOIN [dbo].[S_Cards] ON Books.ID = S_Cards.Id_Book
        JOIN [dbo].[Students] ON S_Cards.Id_Student = Students.ID
        JOIN [dbo].[Authors] ON Books.Id_Author = Authors.ID
        GROUP BY 
            Authors.ID
    ) AS MaxBooksTaken
)

UNION ALL

SELECT 
    Authors.ID,
    Authors.FirstName,
    Authors.LastName,
    COUNT(*) AS BooksTaken
FROM [dbo].[Books]
JOIN [dbo].[T_Cards] ON Books.ID = T_Cards.Id_Book
JOIN [dbo].[Teachers] ON T_Cards.Id_Teacher = Teachers.ID
JOIN [dbo].[Authors] ON Books.Id_Author = Authors.ID
GROUP BY 
    Authors.ID,
    Authors.FirstName,
    Authors.LastName
HAVING COUNT(*) = (
    SELECT MAX(BooksTaken)
    FROM (
        SELECT COUNT(*) AS BooksTaken
        FROM [dbo].[Books]
        JOIN [dbo].[T_Cards] ON Books.ID = T_Cards.Id_Book
        JOIN [dbo].[Teachers] ON T_Cards.Id_Teacher = Teachers.ID
        JOIN [dbo].[Authors] ON Books.Id_Author = Authors.ID
        GROUP BY 
            Authors.ID
    ) AS MaxBooksTaken
);

--16. Display the names of the most popular books among teachers and students.

SELECT 
    Books.ID,
    Books.Name,
    COUNT(*) AS TimesTaken
FROM 
    [dbo].[Books]
JOIN 
    [dbo].[S_Cards] ON Books.ID = S_Cards.Id_Book
GROUP BY 
    Books.ID,
    Books.Name
HAVING COUNT(*) = (
    SELECT MAX(TimesTaken)
    FROM (
        SELECT COUNT(*) AS TimesTaken
        FROM 
            [dbo].[Books]
        JOIN 
            [dbo].[S_Cards] ON Books.ID = S_Cards.Id_Book
        GROUP BY 
            Books.ID
    ) AS MaxTimesTaken
)

UNION ALL

SELECT 
    Books.ID,
    Books.Name,
    COUNT(*) AS TimesTaken
FROM [dbo].[Books]
JOIN [dbo].[T_Cards] ON Books.ID = T_Cards.Id_Book
GROUP BY 
    Books.ID,
    Books.Name
HAVING COUNT(*) = (
    SELECT MAX(TimesTaken)
    FROM (
        SELECT COUNT(*) AS TimesTaken
        FROM [dbo].[Books]
        JOIN [dbo].[T_Cards] ON Books.ID = T_Cards.Id_Book
        GROUP BY 
            Books.ID
    ) AS MaxTimesTaken
);

