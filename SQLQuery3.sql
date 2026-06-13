CREATE DATABASE QUIZ;
USE QUIZ;

CREATE TABLE Student (
    StudentID int PRIMARY KEY,
    Name varchar(50),
    Department varchar(50),
    Semester int,
    City varchar(50)
);

INSERT INTO Student (StudentID, Name, Department, Semester, City) VALUES
(1, 'Ali', 'CS', 5, 'Lahore'),
(2, 'Sara', 'CS', 5, 'Karachi'),
(3, 'Ahmed', 'IT', 3, 'Lahore'),
(4, 'Hina', 'IT', 4, 'Islamabad'),
(5, 'Zain', 'EE', 3, 'Karachi');

SELECT * FROM Student;


SELECT Name, City
FROM Student
WHERE Department='CS' AND Semester=5;

SELECT * FROM Student
WHERE Department != 'CS' AND City != 'Lahore';

SELECT DISTINCT City
FROM Student
WHERE Semester=5;

SELECT * FROM Student
WHERE City='Lahore' AND Name LIKE 'A%';
