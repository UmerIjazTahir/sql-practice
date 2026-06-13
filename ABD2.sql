CREATE DATABASE ABD2;

USE ABD2;

CREATE TABLE Hostel (
    RoomID INT PRIMARY KEY,
    StudentID INT,
    Block VARCHAR(10),
    Bed INT,
    FOREIGN KEY(StudentID) REFERENCES Student(StudentID)
);

INSERT INTO Hostel VALUES
(1,1,'A',1),
(2,2,'B',1),
(3,3,'C',2),
(4,4,'A',2),
(5,5,'B',1),
(6,6,'C',2);
Select * From Hostel;

Select Block, Count(*) As TotalStudents
From Hostel
Group By Block;

Select Top 1 * From Hostel
Order By Bed Desc;

Select * From Hostel
Where Bed = 2;

Select * From Hostel
Where Block = 'A';

Select Max(Bed) As MaxBed
From Hostel;

Select Min(Bed) As MinBed
From Hostel;

Select * From Hostel
Where Cast(StudentID As Varchar) Like '1%';

Select StudentID As SID, RoomID As RID
From Hostel;

Select Count(*) As TotalStudents
From Hostel;
