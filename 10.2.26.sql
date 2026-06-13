CREATE DATABASE PRACT1;

USE PRACT1;



CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    RollNo INT UNIQUE,
    Name VARCHAR(50),
    City VARCHAR(50),
    Semester INT
);

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    DepartmentID INT,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

INSERT INTO Department VALUES
(1, 'CS'),
(2, 'IT'),
(3, 'EE');

INSERT INTO Student VALUES
(1, 101, 'Ali', 'Lahore', 3),
(2, 102, 'Sara', 'Karachi', 4),
(3, 103, 'Ahmed', NULL, 5),
(4, 104, 'Hina', 'Islamabad', 6),
(5, 105, 'Zain', NULL, 2),
(6, 106, 'Ayesha', 'Lahore', 7),
(7, 107, 'Bilal', 'Karachi', 5);

INSERT INTO Enrollment VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 3),
(5, 5, 2),
(6, 6, 1),
(7, 7, 3);

Select * from Student 
where City is NUll And (Semester = 5 or Semester > 5 );

Select Name, RollNo from Student 
Where (City = 'Lahore' OR City = 'Karachi') And (Semester = 3 or Semester = 4);

Select Name from Student 
Where City is not NULL And Semester > 4;

Update Student 
Set City = 'Islamabad'
Where Semester = 5 And City is NULL;

Delete from Student 
Where Semester < 3 And City is NULL;