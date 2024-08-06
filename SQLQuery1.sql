-- Create a new database
create database StudentsData
-- Execute the command
go
-- Using the current database
use StudentsData
-- Execute the command
go
-- Create a new table inside the current database with the appropriate column names, data type and whether or not "null" is possible
create table StudentMarks
(
	-- Create a unique id with an initial value of "1" and subsequent increase also by "1"
	Id int identity (1,1),
	Firstname nvarchar(100) not null,
	Middlename nvarchar(100) not null,
	Secondname nvarchar(100) not null,
	City nvarchar(50) not null,
	BirthDate Date null,
	Email nvarchar(100) not null,
	Phone varchar (12) not null,
	Groupname nvarchar(50) not null,
	AverageMark decimal not null,
	SubjectNameWithMinMark nvarchar(50) not null,
	SubjectNameWithMaxMark nvarchar(50) not null,
)
-- Execute the command
go
-- Add values to the created columns
insert into StudentMarks (Firstname, Middlename, Secondname, City, BirthDate, Email, Phone, Groupname, AverageMark, SubjectNameWithMinMark, SubjectNameWithMaxMark)
values
('Alexander', 'Andreyevich', 'Kukhar', 'Kharkiv', '1993-05-06', 'alexander443@gmail.com', '+1234567890', 'M-20', 10, 'Painting', 'Math'),
('Igor', 'Andreyevich', 'Fedorov', 'Kyiv', '1995-07-08', 'igor445@gmail.com', '+1379086542', 'M-20', 11, 'Chemistry', 'Physics')
-- In this case, output all values of the table
select * from StudentMarks
-- Output the first, middle and last name of each of the students
SELECT Firstname, Middlename, Secondname FROM StudentMarks
