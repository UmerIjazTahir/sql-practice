-- =============================================
-- AI DATASET MANAGEMENT SYSTEM
-- Group Members:
--   Umer Ijaz      (Group Leader)
--   Abdur Rehman
--   Taqweem Ahmad
-- =============================================


-- =============================================
-- STEP 1: CREATE DATABASE
-- =============================================

CREATE DATABASE AI_Dataset_Management1;
GO

USE AI_Dataset_Management1;
GO


-- =============================================
-- STEP 2: CREATE TABLES
-- =============================================

-- Stores dataset categories like Image, Text, Audio, Video
CREATE TABLE Categories (
    CategoryID   INT PRIMARY KEY IDENTITY(1,1),
    CategoryName VARCHAR(50),
    Description  VARCHAR(255)
);
GO

-- Stores main dataset information
-- CategoryID links each dataset to a category
CREATE TABLE Datasets (
    DatasetID   INT PRIMARY KEY IDENTITY(1,1),
    DatasetName VARCHAR(100),
    DatasetType VARCHAR(50),
    Size        VARCHAR(50),
    DateAdded   DATE,
    CategoryID  INT FOREIGN KEY REFERENCES Categories(CategoryID)
);
GO

-- Stores people or organizations who contributed datasets
CREATE TABLE Contributors (
    ContributorID   INT PRIMARY KEY IDENTITY(1,1),
    ContributorName VARCHAR(100),
    Organization    VARCHAR(100),
    Email           VARCHAR(100)
);
GO

-- Links datasets and contributors together (many to many)
-- One dataset can have many contributors and vice versa
CREATE TABLE Dataset_Contributors (
    DatasetID        INT FOREIGN KEY REFERENCES Datasets(DatasetID),
    ContributorID    INT FOREIGN KEY REFERENCES Contributors(ContributorID),
    ContributionDate DATE,
    PRIMARY KEY (DatasetID, ContributorID)
);
GO

-- Stores labels/annotations for each dataset
-- Used for AI model training
CREATE TABLE Annotations (
    AnnotationID   INT PRIMARY KEY IDENTITY(1,1),
    DatasetID      INT FOREIGN KEY REFERENCES Datasets(DatasetID),
    Label          VARCHAR(100),
    AnnotatedBy    VARCHAR(100),
    AnnotationDate DATE
);
GO

-- Stores where each dataset was collected from
CREATE TABLE DatasetSources (
    SourceID   INT PRIMARY KEY IDENTITY(1,1),
    SourceName VARCHAR(100),
    Website    VARCHAR(200),
    DatasetID  INT FOREIGN KEY REFERENCES Datasets(DatasetID)
);
GO


-- =============================================
-- STEP 3: INSERT DATA
-- =============================================

-- Adding 4 categories
INSERT INTO Categories (CategoryName, Description) VALUES
('Image', 'Datasets with image files'),
('Text',  'Datasets with text data'),
('Audio', 'Datasets with audio files'),
('Video', 'Datasets with video clips');
GO

-- Adding 8 datasets
INSERT INTO Datasets (DatasetName, DatasetType, Size, DateAdded, CategoryID) VALUES
('CIFAR-10',         'Image', '162 MB', '2023-01-15', 1),
('ImageNet',         'Image', '150 GB', '2023-02-10', 1),
('Wikipedia Corpus', 'Text',  '20 GB',  '2023-03-05', 2),
('IMDB Reviews',     'Text',  '80 MB',  '2023-04-20', 2),
('LibriSpeech',      'Audio', '60 GB',  '2023-05-18', 3),
('VoxCeleb',         'Audio', '40 GB',  '2023-06-22', 3),
('Kinetics-400',     'Video', '450 GB', '2023-07-30', 4),
('UCF-101',          'Video', '6.5 GB', '2023-08-14', 4);
GO

-- Adding 5 contributors (3 group members + 2 others)
INSERT INTO Contributors (ContributorName, Organization, Email) VALUES
('Umer Ijaz',     'FAST University', 'umer@fast.edu.pk'),
('Abdur Rehman',  'FAST University', 'abdur@fast.edu.pk'),
('Taqweem Ahmad', 'FAST University', 'taqweem@fast.edu.pk'),
('Dr. Ali Hassan','MIT',             'ali@mit.edu'),
('Sara Khan',     'Stanford AI Lab', 'sara@stanford.edu');
GO

-- Linking datasets to contributors
INSERT INTO Dataset_Contributors (DatasetID, ContributorID, ContributionDate) VALUES
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
GO

-- Adding labels/annotations for datasets
INSERT INTO Annotations (DatasetID, Label, AnnotatedBy, AnnotationDate) VALUES
(1, 'Airplane',    'Umer Ijaz',     '2023-02-01'),
(1, 'Automobile',  'Abdur Rehman',  '2023-02-02'),
(1, 'Bird',        'Taqweem Ahmad', '2023-02-03'),
(2, 'Cat',         'Umer Ijaz',     '2023-02-20'),
(2, 'Dog',         'Abdur Rehman',  '2023-02-21'),
(3, 'Politics',    'Taqweem Ahmad', '2023-03-15'),
(3, 'Science',     'Umer Ijaz',     '2023-03-16'),
(4, 'Positive',    'Abdur Rehman',  '2023-05-01'),
(4, 'Negative',    'Taqweem Ahmad', '2023-05-02'),
(5, 'Male Voice',  'Umer Ijaz',     '2023-06-01'),
(6, 'Female Voice','Abdur Rehman',  '2023-07-01'),
(7, 'Running',     'Taqweem Ahmad', '2023-08-10'),
(8, 'Jumping',     'Umer Ijaz',     '2023-09-01');
GO

-- Adding sources for each dataset
INSERT INTO DatasetSources (SourceName, Website, DatasetID) VALUES
('Canadian Institute',    'https://www.cs.toronto.edu',  1),
('Stanford Vision Lab',   'https://www.image-net.org',   2),
('Wikimedia Foundation',  'https://dumps.wikimedia.org', 3),
('IMDB Official',         'https://www.imdb.com',        4),
('LibriSpeech Project',   'https://www.openslr.org',     5),
('VGG Oxford',            'https://www.robots.ox.ac.uk', 6),
('DeepMind',              'https://www.deepmind.com',    7),
('UCF CV Lab',            'https://www.crcv.ucf.edu',    8);
GO


-- =============================================
-- STEP 4: VIEW ALL TABLE DATA
-- =============================================

-- View all categories
SELECT * FROM Categories;
GO

-- View all datasets
SELECT * FROM Datasets;
GO

-- View all contributors
SELECT * FROM Contributors;
GO

-- View all annotations
SELECT * FROM Annotations;
GO

-- View all dataset sources
SELECT * FROM DatasetSources;
GO


-- =============================================
-- STEP 5: JOIN QUERIES
-- =============================================

-- Show each dataset with its category name (INNER JOIN)
SELECT d.DatasetName, d.DatasetType, d.Size, c.CategoryName
FROM Datasets d
INNER JOIN Categories c ON d.CategoryID = c.CategoryID;
GO

-- Show each dataset with who contributed to it (INNER JOIN x2)
SELECT d.DatasetName, con.ContributorName, con.Organization
FROM Datasets d
INNER JOIN Dataset_Contributors dc ON d.DatasetID = dc.DatasetID
INNER JOIN Contributors con ON dc.ContributorID = con.ContributorID;
GO

-- Show all datasets with their annotations
-- Datasets with no annotation still appear with NULL (LEFT JOIN)
SELECT d.DatasetName, a.Label, a.AnnotatedBy
FROM Datasets d
LEFT JOIN Annotations a ON d.DatasetID = a.DatasetID;
GO

-- Count how many datasets are in each category
SELECT c.CategoryName, COUNT(d.DatasetID) AS TotalDatasets
FROM Categories c
LEFT JOIN Datasets d ON c.CategoryID = d.CategoryID
GROUP BY c.CategoryName;
GO

-- Count how many annotations each dataset has
SELECT d.DatasetName, COUNT(a.AnnotationID) AS TotalAnnotations
FROM Datasets d
LEFT JOIN Annotations a ON d.DatasetID = a.DatasetID
GROUP BY d.DatasetName;
GO


-- =============================================
-- STEP 6: STORED PROCEDURES
-- =============================================

-- Procedure 1: Add a new dataset to the Datasets table
CREATE PROCEDURE AddDataset
    @DatasetName VARCHAR(100),
    @DatasetType VARCHAR(50),
    @Size        VARCHAR(50),
    @DateAdded   DATE,
    @CategoryID  INT
AS
BEGIN
    INSERT INTO Datasets (DatasetName, DatasetType, Size, DateAdded, CategoryID)
    VALUES (@DatasetName, @DatasetType, @Size, @DateAdded, @CategoryID);
END;
GO

-- Execute: Adding a new audio dataset called Common Voice
EXEC AddDataset 'Common Voice', 'Audio', '75 GB', '2024-01-10', 3;
GO


-- Procedure 2: Get all datasets that belong to a specific category
CREATE PROCEDURE GetDatasetsByCategory
    @CategoryName VARCHAR(50)
AS
BEGIN
    SELECT d.DatasetID, d.DatasetName, d.DatasetType, d.Size, d.DateAdded
    FROM Datasets d
    INNER JOIN Categories c ON d.CategoryID = c.CategoryID
    WHERE c.CategoryName = @CategoryName;
END;
GO

-- Execute: Get all Image datasets
EXEC GetDatasetsByCategory 'Image';
GO


-- Procedure 3: Link a contributor to a dataset
CREATE PROCEDURE AssignContributorToDataset
    @DatasetID     INT,
    @ContributorID INT,
    @Date          DATE
AS
BEGIN
    INSERT INTO Dataset_Contributors (DatasetID, ContributorID, ContributionDate)
    VALUES (@DatasetID, @ContributorID, @Date);
END;
GO

-- Execute: Assign contributor 2 (Abdur Rehman) to dataset 5 (LibriSpeech)
EXEC AssignContributorToDataset 5, 2, '2024-01-15';
GO


-- Procedure 4: View full details of one dataset (all tables joined)
CREATE PROCEDURE ViewDatasetDetails
    @DatasetID INT
AS
BEGIN
    SELECT d.DatasetName, d.DatasetType, d.Size, d.DateAdded,
           c.CategoryName,
           con.ContributorName, con.Organization,
           a.Label, a.AnnotatedBy,
           ds.SourceName, ds.Website
    FROM Datasets d
    LEFT JOIN Categories c            ON d.CategoryID     = c.CategoryID
    LEFT JOIN Dataset_Contributors dc ON d.DatasetID      = dc.DatasetID
    LEFT JOIN Contributors con        ON dc.ContributorID = con.ContributorID
    LEFT JOIN Annotations a           ON d.DatasetID      = a.DatasetID
    LEFT JOIN DatasetSources ds       ON d.DatasetID      = ds.DatasetID
    WHERE d.DatasetID = @DatasetID;
END;
GO

-- Execute: View full details of dataset 1 (CIFAR-10)
EXEC ViewDatasetDetails 1;
GO


-- Procedure 5: Add a new annotation/label to a dataset
CREATE PROCEDURE AddAnnotation
    @DatasetID      INT,
    @Label          VARCHAR(100),
    @AnnotatedBy    VARCHAR(100),
    @AnnotationDate DATE
AS
BEGIN
    INSERT INTO Annotations (DatasetID, Label, AnnotatedBy, AnnotationDate)
    VALUES (@DatasetID, @Label, @AnnotatedBy, @AnnotationDate);
END;
GO

-- Execute: Add label 'Car' to dataset 2 (ImageNet)
EXEC AddAnnotation 2, 'Car', 'Umer Ijaz', '2024-02-01';
GO


-- Procedure 6: Move a dataset to a different category
CREATE PROCEDURE UpdateDatasetCategory
    @DatasetID     INT,
    @NewCategoryID INT
AS
BEGIN
    UPDATE Datasets
    SET CategoryID = @NewCategoryID
    WHERE DatasetID = @DatasetID;
END;
GO

-- Execute: Move dataset 4 (IMDB Reviews) to category 3 (Audio) as an example
EXEC UpdateDatasetCategory 4, 3;
GO


-- =============================================
-- STEP 7: FUNCTIONS
-- =============================================

-- Function 1 (Umer Ijaz):
-- Takes a CategoryID and returns how many datasets are in that category
CREATE FUNCTION CountDatasetsByCategory(@CategoryID INT)
RETURNS INT
AS
BEGIN
    DECLARE @total INT;
    SELECT @total = COUNT(*) FROM Datasets WHERE CategoryID = @CategoryID;
    RETURN @total;
END;
GO

-- Execute: Count datasets in Category 1 (Image)
SELECT dbo.CountDatasetsByCategory(1) AS ImageDatasetsCount;
GO


-- Function 2 (Abdur Rehman):
-- Takes a DatasetID and returns how many annotations that dataset has
CREATE FUNCTION CountAnnotationsForDataset(@DatasetID INT)
RETURNS INT
AS
BEGIN
    DECLARE @total INT;
    SELECT @total = COUNT(*) FROM Annotations WHERE DatasetID = @DatasetID;
    RETURN @total;
END;
GO

-- Execute: Count annotations for dataset 1 (CIFAR-10)
SELECT dbo.CountAnnotationsForDataset(1) AS CIFAR10_AnnotationCount;
GO


-- Function 3 (Taqweem Ahmad):
-- Takes a DatasetID and returns how many contributors that dataset has
CREATE FUNCTION CountContributorsForDataset(@DatasetID INT)
RETURNS INT
AS
BEGIN
    DECLARE @total INT;
    SELECT @total = COUNT(*) FROM Dataset_Contributors WHERE DatasetID = @DatasetID;
    RETURN @total;
END;
GO

-- Execute: Count contributors for dataset 2 (ImageNet)
SELECT dbo.CountContributorsForDataset(2) AS ImageNet_ContributorsCount;
GO


-- Function 4 (Extra):
-- Takes a DatasetID and returns how many years ago it was added
CREATE FUNCTION DatasetAge(@DatasetID INT)
RETURNS INT
AS
BEGIN
    DECLARE @years INT;
    SELECT @years = DATEDIFF(YEAR, DateAdded, GETDATE())
    FROM Datasets
    WHERE DatasetID = @DatasetID;
    RETURN @years;
END;
GO

-- Execute: Get the age in years of dataset 1 (CIFAR-10)
SELECT dbo.DatasetAge(1) AS DatasetAgeInYears;
GO


-- =============================================
-- STEP 8: UPDATE EXISTING DATA
-- =============================================

-- Update the size of ImageNet to a new value
UPDATE Datasets
SET Size = '170 GB'
WHERE DatasetName = 'ImageNet';
GO

-- Update Umer's email address
UPDATE Contributors
SET Email = 'umer.new@fast.edu.pk'
WHERE ContributorName = 'Umer Ijaz';
GO

