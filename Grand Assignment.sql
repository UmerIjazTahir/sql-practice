Create Database book_store1;
Use book_store1;
Go

-- Question 1: Design a database for an online bookstore that includes
-- storing details of books (title, author, price, genre, publication date),
-- customer information (name, email, address, membership status),
-- orders (order ID, customer ID, date, total amount),
-- and order details (book ID, quantity, price per book).
-- Write SQL queries for the schema with proper data types,
-- primary keys, and foreign keys.

Create Table Books (
    book_id          Int           Primary Key Identity(1,1),
    title            Varchar(255)  Not Null,
    author           Varchar(100),
    price            Decimal(10,2),
    genre            Varchar(50),
    publication_date Date,
    stock_quantity   Int           Default 100
);

Create Table Customers (
    customer_id       Int          Primary Key Identity(1,1),
    name              Varchar(100) Not Null,
    email             Varchar(100) Unique,
    address           Text,
    membership_status Varchar(20)
);

Create Table Orders (
    order_id         Int           Primary Key Identity(1,1),
    customer_id      Int           Foreign Key References Customers(customer_id),
    order_date       Datetime      Default Getdate(),
    total_amount     Decimal(10,2)
);

Create Table OrderDetails (
    order_detail_id  Int           Primary Key Identity(1,1),
    order_id         Int           Foreign Key References Orders(order_id),
    book_id          Int           Foreign Key References Books(book_id),
    quantity         Int,
    price_per_book   Decimal(10,2)
);
Go

-- Insert sample data into Books
Insert Into Books (title, author, price, genre, publication_date, stock_quantity) Values
('The Alchemist',         'Paulo Coelho',    15.99, 'Fiction',     '1988-01-01', 150),
('Clean Code',            'Robert Martin',   35.00, 'Technology',  '2008-08-01', 120),
('1984',                  'George Orwell',   12.99, 'Dystopian',   '1949-06-08', 200),
('Atomic Habits',         'James Clear',     18.00, 'Self-Help',   '2018-10-16', 180),
('The Great Gatsby',      'F. Scott',        10.99, 'Classic',     '1925-04-10', 90),
('Harry Potter 1',        'J.K. Rowling',    22.00, 'Fantasy',     '1997-06-26', 160),
('Rich Dad Poor Dad',     'Robert Kiyosaki', 14.00, 'Finance',     '1997-04-01', 140),
('Deep Work',             'Cal Newport',     25.00, 'Self-Help',   '2016-01-05', 110),
('Sapiens',               'Yuval Harari',    20.00, 'History',     '2011-01-01', 130),
('The Pragmatic Programmer','Andrew Hunt',   40.00, 'Technology',  '1999-10-20', 100);

-- Insert sample data into Customers
Insert Into Customers (name, email, address, membership_status) Values
('Ali Hassan',    'ali@gmail.com',    '12 Main St Lahore',    'premium'),
('Sara Khan',     'sara@gmail.com',   '45 Garden Town Karachi','standard'),
('Ahmed Raza',    'ahmed@gmail.com',  '7 Model Town Lahore',  'vip'),
('Fatima Malik',  'fatima@gmail.com', '33 DHA Islamabad',     'standard'),
('Usman Tariq',   'usman@gmail.com',  '9 Johar Town Lahore',  'premium'),
('Ayesha Noor',   'ayesha@gmail.com', '21 Gulberg Karachi',   'vip'),
('Bilal Sheikh',  'bilal@gmail.com',  '5 Bahria Town Lahore', 'standard'),
('Zara Qadir',    'zara@gmail.com',   '88 Clifton Karachi',   'premium');

-- Insert sample data into Orders
Insert Into Orders (customer_id, order_date, total_amount) Values
(1, Dateadd(Day, -5,  Getdate()), 51.99),
(2, Dateadd(Day, -10, Getdate()), 35.00),
(3, Dateadd(Day, -3,  Getdate()), 72.00),
(4, Dateadd(Day, -20, Getdate()), 22.99),
(5, Dateadd(Day, -7,  Getdate()), 65.00),
(6, Dateadd(Day, -2,  Getdate()), 40.00),
(1, Dateadd(Day, -15, Getdate()), 18.00),
(3, Dateadd(Day, -1,  Getdate()), 55.00),
(7, Dateadd(Day, -8,  Getdate()), 34.99),
(8, Dateadd(Day, -4,  Getdate()), 60.00);

-- Insert sample data into OrderDetails
Insert Into OrderDetails (order_id, book_id, quantity, price_per_book) Values
(1,  1,  2, 15.99),
(1,  3,  1, 12.99),
(2,  2,  1, 35.00),
(3,  6,  2, 22.00),
(3,  4,  1, 18.00),
(4,  5,  1, 10.99),
(4,  7,  1, 14.00),
(5,  8,  1, 25.00),
(5,  9,  2, 20.00),
(6,  10, 1, 40.00),
(7,  4,  1, 18.00),
(8,  2,  1, 35.00),
(8,  1,  1, 15.99),
(9,  3,  2, 12.99),
(10, 6,  1, 22.00),
(10, 5,  2, 10.99);
Go

-- Question 2: Write a SQL query to find the top 5 bestselling books
-- in the last month based on the number of orders.
-- Join the Books, Orders, and OrderDetails tables.
-- Filter results to include only orders from the last month.
-- Order the results by the number of books sold.

Select Top 5
    b.title,
    Sum(od.quantity) As total_sold
From Books        b
Join OrderDetails od On b.book_id   = od.book_id
Join Orders       o  On od.order_id = o.order_id
Where o.order_date >= Dateadd(Month, -1, Getdate())
Group By b.title
Order By total_sold Desc;
Go

-- Question 3: Write a SQL query that returns all customers who have
-- purchased books from more than 3 different genres.
-- Use a subquery to count the distinct genres for each customer
-- based on their purchase history.
-- Only return customers who meet the criteria.

Select name
From Customers
Where customer_id In (
    Select o.customer_id
    From Orders       o
    Join OrderDetails od On o.order_id = od.order_id
    Join Books        b  On od.book_id  = b.book_id
    Group By o.customer_id
    Having Count(Distinct b.genre) > 3
);
Go

-- Question 4: Write a SQL query that calculates the running total
-- of book sales for each month.
-- Include a column showing the running total of sales.
-- Use a PARTITION BY clause to group the running total by book title.
-- Order the data by transaction date.

Select
    b.title,
    o.order_date,
    od.quantity * od.price_per_book As sale_amount,
    Sum(od.quantity * od.price_per_book)
        Over (
            Partition By b.title
            Order By     o.order_date
        ) As running_total
From Books        b
Join OrderDetails od On b.book_id   = od.book_id
Join Orders       o  On od.order_id = o.order_id;
Go

-- Question 5: Write a SQL query to find customers who have purchased
-- books from the same author at least twice.
-- Use an appropriate JOIN to combine the necessary tables.
-- Group the results by customer and author.
-- Filter to show only customers who made at least two purchases
-- of books by the same author.

Select
    c.name,
    b.author
From Customers    c
Join Orders       o  On c.customer_id = o.customer_id
Join OrderDetails od On o.order_id    = od.order_id
Join Books        b  On od.book_id    = b.book_id
Group By c.customer_id, c.name, b.author
Having Count(od.book_id) >= 2;
Go

-- Question 6: Write a SQL query that calculates the average price
-- of books sold per genre, but only for books where price is greater than $20.
-- Use the GROUP BY clause to group by genre.
-- Use HAVING to filter out genres with average prices below $20.

Select
    genre,
    Avg(price) As avg_price
From Books
Where price > 20
Group By genre
Having Avg(price) > 20;
Go

-- Question 7: Write a stored procedure that accepts a customer ID
-- and a date range, then returns a report containing all books
-- purchased by the customer within the specified date range,
-- including the total amount spent.
-- Accept parameters for customer ID, start date, and end date.
-- Return the customer purchase history with book titles,
-- prices, and the total amount spent.

Create Procedure GetCustomerPurchaseReport
    @CustomerID Int,
    @StartDate  Date,
    @EndDate    Date
As
Begin
    Select
        b.title,
        od.price_per_book,
        od.quantity,
        (od.quantity * od.price_per_book) As spent
    From Orders       o
    Join OrderDetails od On o.order_id = od.order_id
    Join Books        b  On od.book_id  = b.book_id
    Where o.customer_id = @CustomerID
      And o.order_date  Between @StartDate And @EndDate;
End;
Go

Exec GetCustomerPurchaseReport 1, '2024-01-01', '2025-12-31';
Go

-- Question 8: Write a trigger that automatically updates the stock
-- quantity of books in the Books table every time a new order is
-- placed in the Orders table.
-- Ensure that the stock quantity is reduced by the quantity purchased.
-- Prevent the order from being placed if there is insufficient stock.

Create Trigger trg_UpdateStock
On OrderDetails
After Insert
As
Begin
    If Exists (
        Select 1
        From Books    b
        Join inserted i On b.book_id = i.book_id
        Where b.stock_quantity < i.quantity
    )
    Begin
        Raiserror('Insufficient stock.', 16, 1);
        Rollback Transaction;
    End
    Else
    Begin
        Update Books
        Set    stock_quantity = stock_quantity - i.quantity
        From   Books    b
        Join   inserted i On b.book_id = i.book_id;
    End
End;
Go

-- Question 9: Propose optimization strategies to improve performance
-- of the query:
-- SELECT * FROM Transactions WHERE transaction_date BETWEEN '2021-01-01' AND '2021-12-31'
-- Include the use of indexing and query modifications.

Create Table Transactions (
    transaction_id   Int           Primary Key Identity(1,1),
    customer_id      Int,
    amount           Decimal(10,2),
    transaction_date Date
);

Insert Into Transactions (customer_id, amount, transaction_date) Values
(1, 150.00, '2021-03-15'),
(2, 200.00, '2021-06-20'),
(3, 75.50,  '2021-09-10'),
(4, 300.00, '2021-11-25'),
(5, 120.00, '2022-01-05');

Create Index idx_transaction_date On Transactions(transaction_date);

Select transaction_id, customer_id, amount, transaction_date
From   Transactions
Where  transaction_date Between '2021-01-01' And '2021-12-31';

Explain Select transaction_id, customer_id, amount, transaction_date
From    Transactions
Where   transaction_date Between '2021-01-01' And '2021-12-31';
Go

-- Question 10: Explain what SQL injection is and how it can be prevented.
-- Write a vulnerable SQL query that can be exploited by SQL injection,
-- and demonstrate how to rewrite it using parameterized queries
-- or stored procedures to prevent SQL injection.

Create Table Users (
    user_id  Int          Primary Key Identity(1,1),
    email    Varchar(150) Not Null Unique,
    password Varchar(255) Not Null,
    name     Varchar(100)
);

Insert Into Users (email, password, name) Values
('ali@gmail.com',    'pass123',  'Ali Hassan'),
('sara@gmail.com',   'pass456',  'Sara Khan'),
('ahmed@gmail.com',  'pass789',  'Ahmed Raza');

-- Vulnerable query (SQL Injection risk — never use in production)
-- If attacker enters: ' OR '1'='1 — it returns all rows
Declare @email    Varchar(150) = 'ali@gmail.com';
Declare @password Varchar(255) = 'pass123';
Declare @sql      Nvarchar(500);
Set @sql = 'Select * From Users Where email = ''' + @email +
           ''' And password = ''' + @password + '''';
Exec sp_executesql @sql;

-- Secure version using parameterized stored procedure
Create Procedure AuthenticateUser
    @Email    Varchar(150),
    @Password Varchar(255)
As
Begin
    Select user_id, name
    From   Users
    Where  email    = @Email
      And  password = @Password;
End;
Go

Exec AuthenticateUser 'ali@gmail.com', 'pass123';
Go

-- Question 11: Create a view called BookSalesSummary that provides
-- the total number of copies sold, the total sales revenue,
-- and the average price at which the book was sold.
-- Filter the view to show only books that have sold more than 50 copies.

Create View BookSalesSummary As
Select
    b.title,
    Sum(od.quantity)                     As total_sold,
    Sum(od.quantity * od.price_per_book) As revenue,
    Avg(od.price_per_book)               As avg_price
From Books        b
Join OrderDetails od On b.book_id = od.book_id
Group By b.title
Having Sum(od.quantity) > 50;
Go

Select * From BookSalesSummary;
Go

-- Question 12: Develop a strategy for backing up a transactional database.
-- Include details about full, incremental, and differential backups.
-- Provide SQL commands for backing up and restoring the database.

-- Full backup
Backup Database book_store
    To Disk = 'C:\Backups\book_store_full.bak'
    With Init, Compression, Stats = 10;

-- Differential backup (changes since last full)
Backup Database book_store
    To Disk = 'C:\Backups\book_store_diff.bak'
    With Differential, Compression, Stats = 10;

-- Transaction log backup (incremental)
Backup Log book_store
    To Disk = 'C:\Backups\book_store_log.trn'
    With Stats = 10;

-- Restore full then differential
Restore Database book_store
    From Disk = 'C:\Backups\book_store_full.bak'
    With Norecovery;

Restore Database book_store
    From Disk = 'C:\Backups\book_store_diff.bak'
    With Recovery;
Go

-- Question 13: Write a SQL transaction that transfers money from
-- one bank account to another by updating the Accounts table.
-- Ensure the transaction is atomic and uses appropriate locking
-- mechanisms to avoid race conditions.

Create Table Accounts (
    account_id Int           Primary Key Identity(1,1),
    name       Varchar(100),
    balance    Decimal(10,2)
);

Insert Into Accounts (name, balance) Values
('Ali Hassan',  5000.00),
('Sara Khan',   3000.00),
('Ahmed Raza', 10000.00);

Begin Transaction;
    Update Accounts
    Set    balance = balance - 500.00
    Where  account_id = 1
      And  balance   >= 500.00;

    If @@Rowcount = 0
    Begin
        Rollback Transaction;
        Raiserror('Insufficient funds.', 16, 1);
    End
    Else
    Begin
        Update Accounts
        Set    balance = balance + 500.00
        Where  account_id = 2;

        Commit Transaction;
    End
Go

Select * From Accounts;
Go

-- Question 14: Explain the different types of constraints in SQL
-- such as NOT NULL, CHECK, UNIQUE.
-- Provide examples of how to implement these constraints
-- in a Customers table with fields for customer_id,
-- name, email, and birthdate.

Create Table CustomersDemo (
    customer_id  Int          Primary Key Identity(1,1),
    name         Varchar(150) Not Null,
    email        Varchar(150) Not Null Unique,
    birthdate    Date         Check (birthdate < Cast(Getdate() As Date)),
    membership   Varchar(20)  Not Null Default 'standard',
    Constraint chk_membership Check (membership In ('standard', 'premium', 'vip'))
);

Insert Into CustomersDemo (name, email, birthdate, membership) Values
('Ali Hassan',   'ali2@gmail.com',   '1995-05-10', 'premium'),
('Sara Khan',    'sara2@gmail.com',  '1990-08-22', 'standard'),
('Ahmed Raza',   'ahmed2@gmail.com', '1988-03-15', 'vip');

Select * From CustomersDemo;
Go

-- =============================================
-- PART B
-- =============================================

Create Table employees (
    id     Int,
    name   Varchar(50),
    salary Int
);

Insert Into employees Values
(1, 'Rahul', 50000),
(2, 'Priya', 70000),
(3, 'Amit',  60000),
(4, 'Neha',  70000);

-- Part B Problem 1: Find the second highest distinct salary
-- from the employees table.

Select Max(salary) As second_highest_salary
From employees
Where salary < (Select Max(salary) From employees);
Go

-- Part B Problem 2: Find all duplicate names
-- in the employees table.

Insert Into employees Values (5, 'Rahul', 55000);

Select name, Count(*) As occurrences
From employees
Group By name
Having Count(*) > 1;
Go

-- Part B Problem 3: Delete duplicate records
-- but keep one unique record per name.

With CTE As (
    Select
        id,
        Row_number() Over (Partition By name Order By id) As row_num
    From employees
)
Delete From employees
Where id In (
    Select id From CTE Where row_num > 1
);

Select * From employees;
Go