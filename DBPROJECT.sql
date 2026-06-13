-- AI Dataset Management System

Create Database AI_Dataset_Management_System;
Go

Use AI_Dataset_Management_System;
Go


-- Creating all tables

Create Table Categories (
    CategoryID   Int Primary Key Identity(1,1),
    CategoryName Varchar(50),
    Description  Varchar(255)
);
Go

Create Table Datasets (
    DatasetID   Int Primary Key Identity(1,1),
    DatasetName Varchar(100),
    DatasetType Varchar(50),
    Size        Varchar(50),
    DateAdded   Date,
    CategoryID  Int Foreign Key References Categories(CategoryID)
);
Go

Create Table Contributors (
    ContributorID   Int Primary Key Identity(1,1),
    ContributorName Varchar(100),
    Organization    Varchar(100),
    Email           Varchar(100)
);
Go

Create Table Dataset_Contributors (
    DatasetID        Int Foreign Key References Datasets(DatasetID),
    ContributorID    Int Foreign Key References Contributors(ContributorID),
    ContributionDate Date,
    Primary Key (DatasetID, ContributorID)
);
Go

Create Table Annotations (
    AnnotationID   Int Primary Key Identity(1,1),
    DatasetID      Int Foreign Key References Datasets(DatasetID),
    Label          Varchar(100),
    AnnotatedBy    Varchar(100),
    AnnotationDate Date
);
Go

Create Table DatasetSources (
    SourceID   Int Primary Key Identity(1,1),
    SourceName Varchar(100),
    Website    Varchar(200),
    DatasetID  Int Foreign Key References Datasets(DatasetID)
);
Go

-- Table to log any changes made to datasets
Create Table Dataset_Logs (
    LogID      Int Primary Key Identity(1,1),
    DatasetID  Int,
    Action     Varchar(50),
    LogDate    DateTime Default GetDate()
);
Go


-- Inserting category data

Insert Into Categories (CategoryName, Description) Values
('Image', 'Datasets with image files'),
('Text',  'Datasets with text data'),
('Audio', 'Datasets with audio files'),
('Video', 'Datasets with video clips');
Go

Insert Into Datasets (DatasetName, DatasetType, Size, DateAdded, CategoryID) Values
('CIFAR-10',         'Image', '162 MB', '2023-01-15', 1),
('ImageNet',         'Image', '150 GB', '2023-02-10', 1),
('Wikipedia Corpus', 'Text',  '20 GB',  '2023-03-05', 2),
('IMDB Reviews',     'Text',  '80 MB',  '2023-04-20', 2),
('LibriSpeech',      'Audio', '60 GB',  '2023-05-18', 3),
('VoxCeleb',         'Audio', '40 GB',  '2023-06-22', 3),
('Kinetics-400',     'Video', '450 GB', '2023-07-30', 4),
('UCF-101',          'Video', '6.5 GB', '2023-08-14', 4);
Go

Insert Into Contributors (ContributorName, Organization, Email) Values
('Ali Ahmed',    'FAST University', 'ali@fast.edu.pk'),
('Sara Malik',   'FAST University', 'sara.malik@fast.edu.pk'),
('Hassan Raza',  'FAST University', 'hassan@fast.edu.pk'),
('Dr. James Lee','MIT',             'james@mit.edu'),
('Emily Carter', 'Stanford AI Lab', 'emily@stanford.edu');
Go

Insert Into Dataset_Contributors (DatasetID, ContributorID, ContributionDate) Values
(1, 1, '2023-01-20'),
(1, 2, '2023-01-22'),
(2, 3, '2023-02-15'),
(2, 4, '2023-02-18'),
(3, 1, '2023-03-10'),
(3, 5, '2023-03-12'),
(4, 2, '2023-04-25'),
(5, 3, '2023-05-20'),
(6, 4, '2023-06-28'),
(7, 5, '2023-08-01'),
(8, 1, '2023-08-20');
Go

Insert Into Annotations (DatasetID, Label, AnnotatedBy, AnnotationDate) Values
(1, 'Airplane',     'Ali Ahmed',    '2023-02-01'),
(1, 'Automobile',   'Sara Malik',   '2023-02-02'),
(1, 'Bird',         'Hassan Raza',  '2023-02-03'),
(2, 'Cat',          'Ali Ahmed',    '2023-02-20'),
(2, 'Dog',          'Sara Malik',   '2023-02-21'),
(3, 'Politics',     'Hassan Raza',  '2023-03-15'),
(3, 'Science',      'Ali Ahmed',    '2023-03-16'),
(4, 'Positive',     'Sara Malik',   '2023-05-01'),
(4, 'Negative',     'Hassan Raza',  '2023-05-02'),
(5, 'Male Voice',   'Ali Ahmed',    '2023-06-01'),
(6, 'Female Voice', 'Sara Malik',   '2023-07-01'),
(7, 'Running',      'Hassan Raza',  '2023-08-10'),
(8, 'Jumping',      'Ali Ahmed',    '2023-09-01');
Go

Insert Into DatasetSources (SourceName, Website, DatasetID) Values
('Canadian Institute',   'https://www.cs.toronto.edu',  1),
('Stanford Vision Lab',  'https://www.image-net.org',   2),
('Wikimedia Foundation', 'https://dumps.wikimedia.org', 3),
('IMDB Official',        'https://www.imdb.com',        4),
('LibriSpeech Project',  'https://www.openslr.org',     5),
('VGG Oxford',           'https://www.robots.ox.ac.uk', 6),
('DeepMind',             'https://www.deepmind.com',    7),
('UCF CV Lab',           'https://www.crcv.ucf.edu',    8);
Go


-- Basic select queries

Select * From Datasets;
Go
Select * From Contributors;
Go
Select * From Annotations;
Go


-- Selecting distinct values to avoid duplicates

Select Distinct DatasetType  From Datasets;
Go
Select Distinct Organization From Contributors;
Go


-- Filtering rows using where

Select DatasetName, DatasetType From Datasets     Where DatasetType   = 'Image';
Go
Select ContributorName, Organization From Contributors Where Organization = 'MIT';
Go


-- Ordering results alphabetically and by date

Select DatasetName, DateAdded From Datasets Order By DatasetName Asc;
Go
Select DatasetName, DateAdded From Datasets Order By DateAdded   Desc;
Go


-- Using And, Or, Not for multiple conditions

Select DatasetName, DatasetType, DateAdded
From Datasets
Where DatasetType = 'Image' And DateAdded < '2023-02-01';
Go

Select DatasetName, DatasetType
From Datasets
Where DatasetType = 'Audio' Or DatasetType = 'Video';
Go

Select DatasetName, DatasetType
From Datasets
Where Not DatasetType = 'Image';
Go


-- Updating existing records

Update Datasets
Set Size = '170 GB'
Where DatasetName = 'ImageNet';
Go

Update Contributors
Set Organization = 'FAST-NUCES', Email = 'sara.m@fast.edu.pk'
Where ContributorName = 'Sara Malik';
Go


-- Deleting a test record after inserting it

Insert Into Categories (CategoryName, Description) Values ('Tabular', 'CSV format datasets');
Go
Delete From Categories Where CategoryName = 'Tabular';
Go


-- Selecting top rows only

Select Top 3 DatasetName, DateAdded From Datasets    Order By DateAdded Asc;
Go
Select Top 5 *                       From Annotations;
Go


-- Aggregate functions for summary statistics

Select Min(DateAdded) As EarliestDataset  From Datasets;
Go
Select Max(DateAdded) As LatestDataset    From Datasets;
Go
Select Count(*)       As TotalDatasets    From Datasets;
Go
Select Count(*)       As TotalAnnotations From Annotations;
Go

Select Avg(AnnotationCount) As AvgAnnotations, Sum(AnnotationCount) As TotalAnnotations
From (
    Select DatasetID, Count(*) As AnnotationCount
    From Annotations
    Group By DatasetID
) As Counts;
Go


-- Pattern matching using Like and wildcards

Select DatasetName From Datasets    Where DatasetName Like 'C%';
Go
Select DatasetName From Datasets    Where DatasetName Like '%Net';
Go
Select Label       From Annotations Where Label       Like '_at';
Go
Select ContributorName, Email From Contributors Where Email Like '%.pk';
Go


-- Filtering using In for multiple values

Select DatasetName, DatasetType From Datasets
Where DatasetType In ('Audio', 'Video');
Go

Select ContributorName, Organization From Contributors
Where Organization In ('MIT', 'Stanford AI Lab');
Go


-- Filtering records within a date range

Select DatasetName, DateAdded From Datasets
Where DateAdded Between '2023-03-01' And '2023-06-30';
Go

Select Label, AnnotationDate From Annotations
Where AnnotationDate Between '2023-02-01' And '2023-02-28';
Go


-- Giving columns readable aliases

Select DatasetName As [Dataset Name], DatasetType As [Type],
       Size As [File Size], DateAdded As [Date Added]
From Datasets;
Go

Select ContributorName + ' - ' + Organization As ContributorInfo
From Contributors;
Go


-- Joining datasets with their category names

Select Datasets.DatasetName, Datasets.DatasetType, Categories.CategoryName
From Datasets
Inner Join Categories On Datasets.CategoryID = Categories.CategoryID;
Go

-- Joining datasets with contributor details

Select Datasets.DatasetName, Contributors.ContributorName, Contributors.Organization
From Datasets
Inner Join Dataset_Contributors On Datasets.DatasetID             = Dataset_Contributors.DatasetID
Inner Join Contributors         On Dataset_Contributors.ContributorID = Contributors.ContributorID;
Go

-- Joining datasets with their source websites

Select Datasets.DatasetName, DatasetSources.SourceName, DatasetSources.Website
From Datasets
Inner Join DatasetSources On Datasets.DatasetID = DatasetSources.DatasetID;
Go


-- Left join to include datasets even without annotations

Select Datasets.DatasetName, Annotations.Label, Annotations.AnnotatedBy
From Datasets
Left Join Annotations On Datasets.DatasetID = Annotations.DatasetID;
Go

Select Categories.CategoryName, Datasets.DatasetName
From Categories
Left Join Datasets On Categories.CategoryID = Datasets.CategoryID;
Go


-- Right join to include all contributors even if not linked to a dataset

Select Datasets.DatasetName, Contributors.ContributorName
From Datasets
Right Join Dataset_Contributors On Datasets.DatasetID             = Dataset_Contributors.DatasetID
Right Join Contributors         On Dataset_Contributors.ContributorID = Contributors.ContributorID;
Go


-- Union to combine contributors and annotators into one list

Select ContributorName As PersonName, 'Contributor' As Role From Contributors
Union
Select AnnotatedBy, 'Annotator' From Annotations;
Go


-- Union All keeps duplicate names from both lists

Select ContributorName As PersonName From Contributors
Union All
Select AnnotatedBy From Annotations;
Go


-- Counting datasets and annotations per group

Select Categories.CategoryName, Count(Datasets.DatasetID) As TotalDatasets
From Categories
Left Join Datasets On Categories.CategoryID = Datasets.CategoryID
Group By Categories.CategoryName;
Go

Select Datasets.DatasetName, Count(Annotations.AnnotationID) As TotalAnnotations
From Datasets
Left Join Annotations On Datasets.DatasetID = Annotations.DatasetID
Group By Datasets.DatasetName;
Go

Select Contributors.ContributorName, Count(Dataset_Contributors.DatasetID) As DatasetsContributed
From Contributors
Left Join Dataset_Contributors On Contributors.ContributorID = Dataset_Contributors.ContributorID
Group By Contributors.ContributorName;
Go


-- Having filters groups after aggregation

Select Categories.CategoryName, Count(Datasets.DatasetID) As TotalDatasets
From Categories
Left Join Datasets On Categories.CategoryID = Datasets.CategoryID
Group By Categories.CategoryName
Having Count(Datasets.DatasetID) > 1;
Go

Select Datasets.DatasetName, Count(Annotations.AnnotationID) As TotalAnnotations
From Datasets
Left Join Annotations On Datasets.DatasetID = Annotations.DatasetID
Group By Datasets.DatasetName
Having Count(Annotations.AnnotationID) > 2;
Go


-- Copying all dataset records into a backup table

Create Table Datasets_Backup (
    DatasetID   Int,
    DatasetName Varchar(100),
    DatasetType Varchar(50),
    Size        Varchar(50),
    DateAdded   Date,
    CategoryID  Int
);
Go

Insert Into Datasets_Backup (DatasetID, DatasetName, DatasetType, Size, DateAdded, CategoryID)
Select DatasetID, DatasetName, DatasetType, Size, DateAdded, CategoryID
From Datasets;
Go

Select * From Datasets_Backup;
Go


-- Case to label each dataset type with a readable category

Select DatasetName, DatasetType,
    Case
        When DatasetType = 'Image' Then 'Visual Data'
        When DatasetType = 'Text'  Then 'Language Data'
        When DatasetType = 'Audio' Then 'Sound Data'
        When DatasetType = 'Video' Then 'Motion Data'
        Else 'Unknown'
    End As DataCategory
From Datasets;
Go

Select Label, AnnotatedBy,
    Case
        When AnnotatedBy In ('Ali Ahmed', 'Sara Malik', 'Hassan Raza') Then 'Group Member'
        Else 'External Annotator'
    End As AnnotatorType
From Annotations;
Go


-- Replacing null values with default text

Select ContributorName, Isnull(Email, 'No Email')     As Email From Contributors;
Go
Select DatasetID,        Isnull(Label, 'Not Labelled') As Label From Annotations;
Go


-- Basic comparison operators on category and date

Select DatasetName From Datasets Where CategoryID  = 1;
Go
Select DatasetName From Datasets Where CategoryID <> 1;
Go
Select DatasetName From Datasets Where CategoryID >= 3;
Go
Select DatasetName, DateAdded From Datasets Where DateAdded < '2023-04-01';
Go


-- Stored procedure to add a new dataset

Create Procedure AddDataset
    @DatasetName Varchar(100),
    @DatasetType Varchar(50),
    @Size        Varchar(50),
    @DateAdded   Date,
    @CategoryID  Int
As
Begin
    Insert Into Datasets (DatasetName, DatasetType, Size, DateAdded, CategoryID)
    Values (@DatasetName, @DatasetType, @Size, @DateAdded, @CategoryID);
End;
Go

Exec AddDataset 'Common Voice', 'Audio', '75 GB', '2024-01-10', 3;
Go


-- Stored procedure to get all datasets under a given category

Create Procedure GetDatasetsByCategory
    @CategoryName Varchar(50)
As
Begin
    Select Datasets.DatasetID, Datasets.DatasetName, Datasets.DatasetType, Datasets.Size, Datasets.DateAdded
    From Datasets
    Inner Join Categories On Datasets.CategoryID = Categories.CategoryID
    Where Categories.CategoryName = @CategoryName;
End;
Go

Exec GetDatasetsByCategory 'Image';
Go


-- Stored procedure to view full details of a single dataset

Create Procedure ViewDatasetDetails
    @DatasetID Int
As
Begin
    Select Datasets.DatasetName, Datasets.DatasetType, Datasets.Size, Datasets.DateAdded,
           Categories.CategoryName,
           Contributors.ContributorName, Contributors.Organization,
           Annotations.Label, Annotations.AnnotatedBy,
           DatasetSources.SourceName, DatasetSources.Website
    From Datasets
    Left Join Categories           On Datasets.CategoryID                = Categories.CategoryID
    Left Join Dataset_Contributors On Datasets.DatasetID                 = Dataset_Contributors.DatasetID
    Left Join Contributors         On Dataset_Contributors.ContributorID = Contributors.ContributorID
    Left Join Annotations          On Datasets.DatasetID                 = Annotations.DatasetID
    Left Join DatasetSources       On Datasets.DatasetID                 = DatasetSources.DatasetID
    Where Datasets.DatasetID = @DatasetID;
End;
Go

Exec ViewDatasetDetails 1;
Go


-- Stored procedure to delete a dataset and its related records

Create Procedure DeleteDataset
    @DatasetID Int
As
Begin
    Delete From Annotations          Where DatasetID = @DatasetID;
    Delete From Dataset_Contributors Where DatasetID = @DatasetID;
    Delete From DatasetSources       Where DatasetID = @DatasetID;
    Delete From Datasets             Where DatasetID = @DatasetID;
End;
Go

Exec DeleteDataset 9;
Go


-- Function to count how many datasets exist in a category

Create Function CountDatasetsByCategory(@CategoryID Int)
Returns Int
As
Begin
    Declare @total Int;
    Select @total = Count(*) From Datasets Where CategoryID = @CategoryID;
    Return @total;
End;
Go

Select dbo.CountDatasetsByCategory(1) As ImageDatasetsCount;
Go


-- Function to count annotations linked to a dataset

Create Function CountAnnotationsForDataset(@DatasetID Int)
Returns Int
As
Begin
    Declare @total Int;
    Select @total = Count(*) From Annotations Where DatasetID = @DatasetID;
    Return @total;
End;
Go

Select dbo.CountAnnotationsForDataset(1) As CIFAR10_AnnotationCount;
Go


-- Function to count contributors linked to a dataset

Create Function CountContributorsForDataset(@DatasetID Int)
Returns Int
As
Begin
    Declare @total Int;
    Select @total = Count(*) From Dataset_Contributors Where DatasetID = @DatasetID;
    Return @total;
End;
Go

Select dbo.CountContributorsForDataset(2) As ImageNet_ContributorsCount;
Go


-- Function to check if a dataset is large (over 100 GB)

Create Function IsLargeDataset(@DatasetID Int)
Returns Varchar(10)
As
Begin
    Declare @size Varchar(50);
    Declare @result Varchar(10);
    Select @size = Size From Datasets Where DatasetID = @DatasetID;
    If @size Like '%GB%' And Cast(Left(@size, PatIndex('%[^0-9.]%', @size) - 1) As Float) > 100
        Set @result = 'Yes';
    Else
        Set @result = 'No';
    Return @result;
End;
Go

Select dbo.IsLargeDataset(2) As IsImageNetLarge;
Go


-- Trigger that logs every new dataset inserted

Create Trigger trg_AfterInsertDataset
On Datasets
After Insert
As
Begin
    Insert Into Dataset_Logs (DatasetID, Action)
    Select DatasetID, 'Inserted' From Inserted;
End;
Go


-- Trigger that logs every dataset that gets deleted

Create Trigger trg_AfterDeleteDataset
On Datasets
After Delete
As
Begin
    Insert Into Dataset_Logs (DatasetID, Action)
    Select DatasetID, 'Deleted' From Deleted;
End;
Go


-- Trigger that logs every dataset update

Create Trigger trg_AfterUpdateDataset
On Datasets
After Update
As
Begin
    Insert Into Dataset_Logs (DatasetID, Action)
    Select DatasetID, 'Updated' From Inserted;
End;
Go


-- Trigger that prevents inserting a dataset with an empty name

Create Trigger trg_PreventEmptyDatasetName
On Datasets
Instead Of Insert
As
Begin
    If Exists (Select 1 From Inserted Where DatasetName Is Null Or DatasetName = '')
    Begin
        Raiserror('Dataset name cannot be empty.', 16, 1);
        Return;
    End
    Insert Into Datasets (DatasetName, DatasetType, Size, DateAdded, CategoryID)
    Select DatasetName, DatasetType, Size, DateAdded, CategoryID From Inserted;
End;
Go