CREATE DATABASE PRACT3;

 USE PRACT3;


CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    CreditHours INT
);

CREATE TABLE Result (
    ResultID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Marks INT,
    Grade VARCHAR(5),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);
INSERT INTO Course VALUES
(1, 'Database Systems', 3),
(2, 'Data Structures', 4),
(3, 'Operating Systems', 3);

INSERT INTO Result VALUES
(1, 1, 1, 78, 'B'),
(2, 1, 2, 85, 'A'),
(3, 2, 1, 65, 'C'),
(4, 3, 3, 90, 'A'),
(5, 4, 2, 72, 'B'),
(6, 5, 1, 55, 'D'),
(7, 6, 3, 88, 'A');

SELECT *
FROM Result
WHERE Marks > 70;

SELECT StudentID, Marks
FROM Result
WHERE Grade = 'A';

SELECT CourseID, Grade
FROM Result
WHERE (Grade = 'A' OR Grade = 'B')
AND Marks < 80;

UPDATE Result
SET Grade = 'B'
WHERE Marks >= 70 AND Marks <= 79;

UPDATE Result
SET Marks = 60,
    Grade = 'C'
WHERE ResultID = 6;
