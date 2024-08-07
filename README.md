# SQL_Tasks

# SQLQuery1.sql

  Queries
  
    Retrieve all records: SELECT * FROM StudentMarks
    Retrieve names: SELECT Firstname, Middlename, Secondname FROM StudentMarks

# SQLQuery2.sql

  Queries
  
    All records: SELECT * FROM StudentMarks
    Names: SELECT Firstname, Middlename, Secondname FROM StudentMarks
    Average marks: SELECT Firstname, Middlename, Secondname, AverageMark FROM StudentMarks
    Unique countries: SELECT DISTINCT Country FROM StudentMarks
    Unique cities: SELECT DISTINCT City FROM StudentMarks
    Unique group names: SELECT DISTINCT Groupname FROM StudentMarks

# Aggregate_functions.sql

  Queries with aggregate functions
  
    Counting total participating countries.
    Counting countries that have won the championship.
    Counting Spanish-speaking countries.
    Counting debutant countries.
    Finding the country with the largest territory.
    Finding the European country with the largest territory.
    Summing total championship titles won by all countries.
    Summming total championship titles won by European countries.
    Finding the country with the smallest territory in the Americas.
    Calculating the average territory of African countries.

# SQLQuery4.sql

  Here were used aggregate functions and some another SQL queries like:
  
    WHERE for filtering results based on specified conditions.
    GROUP BY for grouping rows sharing a property so aggregate functions can be applied.
    ORDER BY for sorting the result set.
    JOIN for combining rows from two or more tables (though not explicitly used here, implied in some subqueries).
    
# library_db.sql

  Queries

    INNER JOIN:

      Joining Books with Press to find books published by each press.
      Joining Books with S_Cards and Students to list books borrowed by students.
    
    GROUP BY:
    
      Grouping by Press.Name to calculate average page count or total pages.
      Grouping by Authors.ID to find the most popular authors among students or teachers.
    
    HAVING:
    
      Filtering authors with an average book length over a certain number of pages.
      Finding publishers with total pages greater than a specific amount.
      
    UNION ALL:
    
      Combining lists of borrowed books by students and teachers.
      
    ORDER BY:
    
      Sorting by the number of pages or popularity of books/authors.
      
    TOP 1:
    
      Finding the most popular author or book.
      
    DISTINCT:
    
      Listing distinct students who have borrowed books within a certain period.

# functions_and_procedures.sql

  Functions

    dbo.GreetUser - returns a greeting message with the given name.
    dbo.GetCurrentMinutes - returns the current minute of the hour.
    dbo.GetCurrentYear - returns the current year.
    dbo.IsCurrentYearEvenOrOdd - indicates if the current year is even or odd.
    dbo.IsPrime - checks if a given number is prime.
    dbo.SumMinMax - returns the sum of the minimum and maximum values from five numbers.
    dbo.GetNumbersInRange - returns even or odd numbers within a specified range.

  Stored Procedures

    dbo.HelloWorld - prints "Hello, world!".
    dbo.GetCurrentTime - returns the current date and time.
    dbo.GetCurrentDate - returns the current date.
    dbo.SumThreeNumbers - calculates and returns the sum of three numbers.
    dbo.AverageOfThreeNumbers - calculates and returns the average of three numbers.
    dbo.GetMaxOfThreeNumbers - returns the maximum of three numbers.
    dbo.GetMinOfThreeNumbers - returns the minimum of three numbers.
    dbo.DrawLine - prints a line of a specified length using a specified symbol.
    dbo.CalculateFactorial - calculates and returns the factorial of a given number.
    dbo.Power - calculates and returns a base number raised to a specified exponent.

# triggers.sql

  Triggers

    reduce_library_book_copies - automatically decreases the number of available copies in library_books by 1 when a new record is inserted into book_borrows.

    increase_library_book_copies - automatically increases the number of available copies in library_books by 1 when a record is deleted from book_borrows.
    
    check_book_availability - prevents insertion into book_borrows if the book is not available (i.e., no copies left). If the book is available, it allows the   
    insert and updates the available copies.
    
    limit_books_per_user - restricts users to borrowing no more than three books. If a user already has three or more books, it raises an error.
    
    trg_after_delete_books1 - copies information about deleted books from books_inventory1 to deleted_books when a book is deleted.
    
    trg_after_insert_books - removes a book from deleted_books when it is re-added to library_books.
