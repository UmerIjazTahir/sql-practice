Create Database QL;
Use QL;


Create Table Teams(
TeamID Int Primary Key,
TeamName Varchar(50)
);

Create Table Workers(
WorkerID Int Primary Key,
WorkerName Varchar(50),
Age Int,
Salary Int,
TeamID Int,
LeadID Int,
Status Varchar(20),
Foreign Key (TeamID) References Teams(TeamID)
);

Insert Into Teams Values
(1,'Engineering'),
(2,'HR'),
(3,'Finance'),
(4,'Marketing'),
(5,'Customer Service');

Insert Into Workers Values
(1,'Asad',32,57000,1,NULL,'Active'),
(2,'Hira',29,46000,2,1,'Active'),
(3,'Bilal',37,64000,1,1,'Active'),
(4,'Sara',43,72000,3,NULL,'Active'),
(5,'Zara',28,47000,2,2,'Active'),
(6,'Omar',34,54000,1,1,'Active'),
(7,'Fahad',47,82000,3,NULL,'Active'),
(8,'Nadia',31,49000,4,4,'Active'),
(9,'Rashid',35,53000,5,4,'Active'),
(10,'Ayaan',26,41000,2,2,'Active'),
(11,'Tariq',40,67000,1,1,'Active'),
(12,'Amna',43,74000,3,4,'Active'),
(13,'Rehan',38,60000,5,4,'Active'),
(14,'Sami',33,51000,4,4,'Active'),
(15,'Iqra',29,45000,2,2,'Active'),
(16,'Farhan',36,62000,1,1,'Active'),
(17,'Anas',41,69000,3,4,'Active'),
(18,'Saad',25,37000,5,4,'Active'),
(19,'Imran',44,77000,3,NULL,'Active'),
(20,'Taimoor',39,63000,1,1,'Active'),
(21,'Ayesha',32,54000,2,2,'Resigned'),
(22,'Kiran',28,43000,4,4,'Active'),
(23,'Adil',30,48000,5,4,'Active'),
(24,'Salman',46,75000,3,NULL,'Active'),
(25,'Arsalan',35,56000,1,1,'Active');

Select * From Workers;
Select Distinct TeamName From Teams;
Select * From Workers Where Salary > 50000;
Select * From Workers Where Age Between 25 And 40;
Select * From Workers Where WorkerName Like 'A%';
Insert Into Workers Values (26,'Umer',24,42000,1,1,'Active');
Update Workers Set Salary = 62000 Where WorkerName = 'Asad';
Delete From Workers Where Status = 'Resigned';
Select * From Workers Order By Salary Desc Limit 5;
Select * From Workers Where LeadID Is Null;
Select Count(*) As TotalWorkers From Workers;
Select Avg(Salary) As AverageSalary From Workers;
Select Max(Salary) As MaxSalary, Min(Salary) As MinSalary From Workers;
Select TeamID, Sum(Salary) As TotalSalary From Workers Group By TeamID;
Select TeamID, Avg(Salary) From Workers Group By TeamID Having Avg(Salary) > 50000;
Select * From Workers Where TeamID In (1,2);
Select * From Workers Where WorkerName Like '%an%';
Select * From Workers Where Salary Not Between 30000 And 60000;
Select Workers.WorkerName, Teams.TeamName From Workers Inner Join Teams On Workers.TeamID = Teams.TeamID;
Select W1.WorkerName As StaffMember, W2.WorkerName As Supervisor From Workers W1 Left Join Workers W2 On W1.LeadID = W2.WorkerID;