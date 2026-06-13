iCREATE DATABASE OFFICE1;

USE OFFICE1;

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(30),
    City VARCHAR(30),
    Salary INT
);

INSERT INTO Employees VALUES
(1, 'Ali', 'CS', 'Lahore', 50000),
(2, 'Ahmed', 'IT', 'Karachi', 60000),
(3, 'Sara', 'CS', 'Karachi', 65000),
(4, 'Ayesha', 'HR', 'Lahore', 55000);

SELECT * FROM Employees;

SELECT DISTINCT Department FROM Employees;

SELECT * FROM Employees
WHERE City = 'Lahore';

SELECT * FROM Employees
WHERE Salary > 55000;

INSERT INTO Employees VALUES
(5, 'Bilal', 'CS', 'Islamabad', 70000),
(6, 'Hina', 'Finance', 'Multan', 48000);

SELECT * FROM Employees
WHERE Department = 'CS'
AND City = 'Karachi';

SELECT * FROM Employees
WHERE City <> 'Lahore';
