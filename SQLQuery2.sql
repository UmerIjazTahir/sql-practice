CREATE DATABASE CompanyDataB;

USE CompanyDataB;

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(30),
    City VARCHAR(30),
    Salary INT
);

INSERT INTO Employees VALUES
(1, 'Usman', 'CS', 'Karachi', 65000),
(2, 'Areeba', 'IT', 'Lahore', 55000),
(3, 'Hamza', 'HR', 'Islamabad', 50000),
(4, 'Noor', 'CS', 'Karachi', 72000),
(5, 'Saad', 'Finance', 'Multan', 48000),
(6, 'Iqra', 'IT', 'Lahore', 60000);

SELECT * FROM Employees;

SELECT DISTINCT Department FROM Employees;

SELECT * FROM Employees
WHERE City = 'Lahore';

SELECT * FROM Employees
WHERE Salary > 55000;

INSERT INTO Employees VALUES
(7, 'Bilal', 'CS', 'Peshawar', 70000),
(8, 'Hina', 'HR', 'Quetta', 52000);

SELECT * FROM Employees
WHERE Department = 'CS'
AND City = 'Karachi';

SELECT * FROM Employees
WHERE City = 'Lahore';
