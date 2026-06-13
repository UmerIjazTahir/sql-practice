CREATE DATABASE ABD3;

USE ABD3;

CREATE TABLE Exam (
    ExamID INT PRIMARY KEY,
    StudentID INT,
    Subject VARCHAR(50),
    Marks INT,
    FOREIGN KEY(StudentID) REFERENCES Student(StudentID)
);

INSERT INTO Exam VALUES
(1,1,'Math',85),
(2,2,'Math',72),
(3,3,'Physics',90),
(4,4,'Math',60),
(5,5,'Physics',88),
(6,6,'Chemistry',45),
(7,7,'Math',95),
(8,8,'Physics',55),
(9,9,'Chemistry',78),
(10,10,'Physics',66);

Select Top 3 StudentID, Marks As Score
From Exam
Order By Marks Desc;

Select Top 1 StudentID, Marks As Score
From Exam
Order By Marks Asc;

Select Avg(Marks) As AverageMarks
From Exam;

Select Max(Marks) As HighestScore
From Exam;

Select Min(Marks) As LowestScore
From Exam;

Select Sum(Marks) As TotalMarks
From Exam;

Select Count(*) As Above70
From Exam
Where Marks > 70;

Select * From Exam
Where Marks Between 50 And 90;

Select StudentID, Marks
From Exam
Where StudentID Like '1%';

Select Top 2 StudentID, Marks As Score
From Exam
Where Subject = 'Physics'
Order By Marks Desc;
