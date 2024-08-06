-- Triggers

CREATE DATABASE [Library2]
GO
USE [Library2]
GO

CREATE TABLE library_books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    available_copies INT NOT NULL
);

CREATE TABLE book_borrows (
    borrow_id INT PRIMARY KEY,
    book_id INT,
    borrow_date DATE,
    FOREIGN KEY (book_id) REFERENCES library_books(book_id)
);

--1. So that when taking a certain book, its number decreases by 1.

CREATE TRIGGER reduce_library_book_copies
ON book_borrows
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE library_books
    SET available_copies = available_copies - 1
    FROM library_books lb
    JOIN inserted i ON lb.book_id = i.book_id;
END;

INSERT INTO library_books (book_id, title, available_copies) VALUES (1, 'SQL for Beginners', 5);
INSERT INTO library_books (book_id, title, available_copies) VALUES (2, 'Advanced SQL', 3);

SELECT * FROM library_books;

INSERT INTO book_borrows (borrow_id, book_id, borrow_date) VALUES (1, 1, GETDATE());

SELECT * FROM library_books WHERE book_id = 1;

--2. So that when a certain book is returned, its number is increased by 1.

CREATE TRIGGER increase_library_book_copies
ON book_borrows
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE library_books
    SET available_copies = available_copies + 1
    FROM library_books lb
    JOIN deleted d ON lb.book_id = d.book_id;
END;

INSERT INTO book_borrows (borrow_id, book_id, borrow_date) VALUES (2, 1, GETDATE());

SELECT * FROM library_books WHERE book_id = 1;

DELETE FROM book_borrows WHERE borrow_id = 2;

SELECT * FROM library_books WHERE book_id = 1;

--3. It should not be possible to give out a book that is no longer in the library (in terms of quantity).

CREATE TRIGGER check_book_availability
ON book_borrows
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

-- Check the availability of a book in the library
    IF EXISTS (
        SELECT 1
        FROM library_books lb
        JOIN inserted i ON lb.book_id = i.book_id
        WHERE lb.available_copies > 0
    )
    BEGIN
-- If the book is sufficient, it is allowed to insert a record
        INSERT INTO book_borrows (borrow_id, book_id, borrow_date)
        SELECT borrow_id, book_id, borrow_date
        FROM inserted;

-- Update the number of copies of the book
        UPDATE library_books
        SET available_copies = available_copies - 1
        FROM library_books lb
        JOIN inserted i ON lb.book_id = i.book_id;
    END
    ELSE
    BEGIN

-- If there is no book, display an error message
        RAISERROR ('The book is not available for borrowing.', 16, 1);
    END
END;

INSERT INTO book_borrows (borrow_id, book_id, borrow_date) VALUES (5, 1, GETDATE());

SELECT * FROM library_books WHERE book_id = 1;

INSERT INTO book_borrows (borrow_id, book_id, borrow_date) VALUES (6, 1, GETDATE());

-- 4. That no more than three books can be given to one student.

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Creating a books_inventory table
CREATE TABLE books_inventory (
    book_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    available_copies INT NOT NULL
);

-- Creating the loaned_books table after creating users
CREATE TABLE loaned_books (
    loan_id INT PRIMARY KEY,
    book_id INT,
    user_id INT,
    loan_date DATE,
    FOREIGN KEY (book_id) REFERENCES books_inventory(book_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TRIGGER limit_books_per_user
ON loaned_books
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Check the number of books already given to the user
    IF EXISTS (
        SELECT i.user_id
        FROM inserted i
        JOIN loaned_books lb ON i.user_id = lb.user_id
        GROUP BY i.user_id
        HAVING COUNT(*) >= 3
    )
    BEGIN
        -- If the user already has 3 or more books, display an error message
        RAISERROR ('The user has already borrowed 3 books.', 16, 1);
    END
    ELSE
    BEGIN
        -- If the user has less than 3 books, allow inserting records
        INSERT INTO loaned_books (loan_id, book_id, user_id, loan_date)
        SELECT loan_id, book_id, user_id, loan_date
        FROM inserted;

        -- Update the number of available copies of the book
        UPDATE books_inventory
        SET available_copies = available_copies - 1
        FROM books_inventory bi
        JOIN inserted i ON bi.book_id = i.book_id;
    END
END;

INSERT INTO users (user_id, name) VALUES (101, 'John Doe');
INSERT INTO users (user_id, name) VALUES (102, 'Jane Smith');

INSERT INTO books_inventory (book_id, title, available_copies) VALUES (1, 'Book One', 5);
INSERT INTO books_inventory (book_id, title, available_copies) VALUES (2, 'Book Two', 3);
INSERT INTO books_inventory (book_id, title, available_copies) VALUES (3, 'Book Three', 4);
INSERT INTO books_inventory (book_id, title, available_copies) VALUES (4, 'Book Four', 2);

-- Checking data in the users table
SELECT * FROM users;

-- Checking data in the books_inventory table
SELECT * FROM books_inventory;

-- Inserting records into the loaned_books table
-- User 101 borrows the first book
INSERT INTO loaned_books (loan_id, book_id, user_id, loan_date) VALUES (1, 1, 101, GETDATE());

-- User 101 takes the second book
INSERT INTO loaned_books (loan_id, book_id, user_id, loan_date) VALUES (2, 2, 101, GETDATE());

-- User 101 takes the third book
INSERT INTO loaned_books (loan_id, book_id, user_id, loan_date) VALUES (3, 3, 101, GETDATE());

-- Checking the results after three successful books given
SELECT * FROM loaned_books;
SELECT * FROM books_inventory;

-- Attempting to insert a fourth record for user 101 who already has 3 books
-- An error is expected because user 101 already has 3 books
INSERT INTO loaned_books (loan_id, book_id, user_id, loan_date) VALUES (4, 4, 101, GETDATE());

--5. So that when deleting a book, its data is copied to the Deleted table. 

CREATE TABLE deleted_books (
    book_id INT,
    title VARCHAR(255),
    available_copies INT,
    deletion_date DATETIME,
    PRIMARY KEY (book_id)
);

-- Deleting the books_inventory table, if it exists
IF OBJECT_ID('dbo.books_inventory', 'U') IS NOT NULL
    DROP TABLE dbo.books_inventory;

-- Re-create the books_inventory table
CREATE TABLE books_inventory1 (
    book_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    available_copies INT NOT NULL
);

CREATE TRIGGER trg_after_delete_books1
ON books_inventory1
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Inserting data about deleted books into the deleted_books table
    INSERT INTO deleted_books (book_id, title, available_copies, deletion_date)
    SELECT d.book_id, d.title, d.available_copies, GETDATE()
    FROM deleted d;
END;

-- Inserting test books
INSERT INTO books_inventory1 (book_id, title, available_copies) VALUES (1, 'Book One', 5);
INSERT INTO books_inventory1 (book_id, title, available_copies) VALUES (2, 'Book Two', 3);

-- Deleting a book from the books_inventory table
DELETE FROM books_inventory1 WHERE book_id = 1;

-- Check the data in the library_books table
SELECT * FROM library_books;

-- ÏChecking the data in the deleted_books table
SELECT * FROM deleted_books;

--6. If a book is added to the database, it must be deleted from the Deleted table.

-- Creating a trigger to automatically copy data about deleted books from library_books
CREATE TRIGGER trg_after_delete_books2
ON library_books
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Inserting data about deleted books into the deleted_books table
    INSERT INTO deleted_books (book_id, title, available_copies, deletion_date)
    SELECT d.book_id, d.title, d.available_copies, GETDATE()
    FROM deleted d;
END;

-- Creating a trigger to remove a book from the deleted_books table when it is added to library_books
CREATE TRIGGER trg_after_insert_books
ON library_books
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Deleting data about a new book from the deleted_books table if it is already there
    DELETE FROM deleted_books
    WHERE book_id IN (SELECT book_id FROM inserted);
END;

INSERT INTO library_books (book_id, title, available_copies) VALUES (3, 'Book One', 5);
INSERT INTO library_books (book_id, title, available_copies) VALUES (4, 'Book Two', 3);

DELETE FROM library_books WHERE book_id = 3;

-- Checking data in library_books
SELECT * FROM library_books;

-- Checking data in deleted_books
SELECT * FROM deleted_books;

-- Inserting a book that was already in deleted_books
INSERT INTO library_books (book_id, title, available_copies) VALUES (3, 'Book One', 5);

-- Checking data in deleted_books
SELECT * FROM deleted_books;