CREATE DATABASE UniversityDB;
USE UniversityDB;

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(20),
    Semester INT,
    City VARCHAR(50)
);

CREATE TABLE Result (
    StudentID INT,
    Marks INT,
    FOREIGN KEY(StudentID) REFERENCES Student(StudentID)
);

INSERT INTO Student VALUES
(1,'Ali','CS',3,'Lahore'),
(2,'Ahmed','IT',4,'Karachi'),
(3,'Sana','EE',2,NULL),
(4,'Sara','CS',5,'Islamabad'),
(5,'Hina','IT',3,'Lahore'),
(6,'Salman','EE',6,'Karachi'),
(7,'Adeel','CS',2,NULL),
(8,'Amna','IT',5,'Islamabad'),
(9,'Asad','CS',4,'Lahore'),
(10,'Sara','EE',3,NULL);


INSERT INTO Result VALUES
(1,85),
(2,72),
(3,90),
(4,60),
(5,88),
(6,45),
(7,95),
(8,55),
(9,78),
(10,66);

Select Top 3 Marks As TopScore, StudentID
From Result
Order By Marks Desc;

Select Top 2 Marks As LowestScore, StudentID
From Result
Order By Marks Asc;

Select StudentID, Marks As Score
From Result
Where Marks > 70
Order By Marks Desc;

Select StudentID, Marks
From Result
Where Marks Between 60 And 85
Order By Marks Desc;

Select Max(Marks) As HighestMarks
From Result;

Select Min(Marks) As LowestMarks
From Result;

Select Avg(Marks) As AverageMarks
From Result;

Select Sum(Marks) As TotalMarks
From Result;

Select Count(*) As Above50
From Result
Where Marks > 50;

Select Top 1 StudentID As SID, Marks As Score
From Result
Order By Marks Desc;
