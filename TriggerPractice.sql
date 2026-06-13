Create Database TriggerPractice1;
Use TriggerPractice1;

Create Table Students
(
StudentID int Primary Key,
Name varchar(50),
Marks int,
Class varchar(20)
)

Create Table StudentBackup
(
StudentID int,
Name varchar(50),
Marks int,
Class varchar(20),
ActionType varchar(20)
);

Insert Into Students
Values
(1,'Ali',85,'BSCS'),
(2,'Ahmed',78,'BSIT'),
(3,'Hassan',90,'BSSE');

Select * From Students;


Create Trigger StudentInsertTrigger
On Students
After Insert
As
Begin
    Insert Into StudentBackup
    Select StudentID, Name, Marks, Class, 'Inserted'
    From Inserted
End;

Insert Into Students
Values (5,'Bila',8,'BSC');

Select * From StudentBackup;

Create Trigger StudentUpdateTrigger
On Students
After Update
As
Begin
    Insert Into StudentBackup
    Select StudentID, Name, Marks, Class, 'Updated'
    From Inserted
End;

Update Students
Set Marks = 95
Where StudentID = 1;

Select * From StudentBackup;

Create Trigger StudentDeleteTrigger
On Students
After Delete
As
Begin
    Insert Into StudentBackup
    Select StudentID, Name, Marks, Class, 'Deleted'
    From Deleted
End;

Delete From Students
Where StudentID = 1;

Select * From StudentBackup;





begin tran tran1
Update Students
Set Marks = 95
Where StudentID = 1;

Update Students
Set Marks = 95
Where StudentID = 1;
Update Students
Set Marks = 95
Where StudentID = 1;


commit;






















