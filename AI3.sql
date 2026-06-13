CREATE DATABASE DEPARTMENTS;
USE DEPARTMENTS;


CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(20)
);

CREATE TABLE Teacher (
    TeacherID INT PRIMARY KEY,
    Name VARCHAR(50),
    DeptID INT,
    City VARCHAR(50),
    FOREIGN KEY(DeptID) REFERENCES Department(DeptID)
);
INSERT INTO Department VALUES
(1,'CS'),
(2,'IT'),
(3,'EE');

INSERT INTO Teacher VALUES
(1,'Mr. Ali',1,'Lahore'),
(2,'Ms. Sara',2,'Karachi'),
(3,'Mr. Ahmed',3,NULL),
(4,'Ms. Hina',1,'Islamabad'),
(5,'Mr. Salman',2,'Lahore');
Select Name, City
From Teacher
Where DeptID = 1;

Select Name, DeptID
From Teacher
Where City Is Null;

Select Count(*) As TotalIT
From Teacher
Where DeptID = 2;

Select Name, DeptID
From Teacher
Where Name Like 'M%';

Select Name, City
From Teacher
Order By Name Asc;

Select Max(DeptID) As MaxDept
From Teacher;

Select Min(DeptID) As MinDept
From Teacher;

Select Top 1 Name, DeptID
From Teacher
Order By DeptID Desc;

Select Count(*) As NonEE
From Teacher
Where DeptID <> 3;

Select Name As TeacherName, City As Location
From Teacher;
