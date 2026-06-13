CREATE DATABASE TESTS;

USE TESTS;

CREATE TABLE Student (
    StudentID int PRIMARY KEY,
    Name varchar(50),
    Department varchar(50),
    Semester varchar(30),
    City varchar(50));

INSERT INTO Student  VALUES
('Ali','CS',5,'Lahore'),
('Sara','CS',5,'Karachi'),
('Ahmed','IT',3,'Lahore'),
('Hina','IT',4,'Islamabad'),
('Zain','EE',3,'Karachi');



SELECT Name, City
FROM Student
WHERE Department='CS' AND Semester=5;

SELECT *FROM Student WHERE Department != 'CS' AND City != 'Lahore';


SELECT DISTINCT City FROM Student WHERE Semester=5;


SELECT * FROM Student WHERE City='Lahore' AND Name LIKE 'A*';
