CREATE DATABASE Testing_System_Assignment_2;
DROP DATABASE IF exists Testing_System_Assignment_2;
USE Testing_System_Assignment_2;
DROP TABLE if exists Position;
CREATE TABLE Department (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName NVARCHAR(50)
);
CREATE TABLE Position (
	PositionID INT AUTO_INCREMENT PRIMARY KEY,
-- 	Id INT AUTO_INCREMENT PRIMARY KEY,
    PositionName NVARCHAR(50)
);
CREATE TABLE Account (
    AccountID INT AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(50),
    UserName NVARCHAR(50),
    FullName NVARCHAR(50),
    DepartmentID INT,
    PositionID INT,
    CreateDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Department (DepartmentID),
    FOREIGN KEY (PositionID) REFERENCES Position (PositionID)
);
CREATE TABLE GroupTable (
    GroupID INT AUTO_INCREMENT PRIMARY KEY,
    GroupName NVARCHAR(50),
    CreatorID INT,
    CreateDate DATE
);

CREATE TABLE GroupAccount (
    GroupID INT,
    AccountID INT,
    JoinDate DATE,
    FOREIGN KEY (GroupID) REFERENCES GroupTable (GroupID),
    FOREIGN KEY (AccountID) REFERENCES Account (AccountID)
);
CREATE TABLE TypeQuestion (
    TypeID INT AUTO_INCREMENT PRIMARY KEY,
    TypeName NVARCHAR(50)
);
CREATE TABLE CategoryQuestion (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName NVARCHAR(50)
);
CREATE TABLE Question (
    QuestionID INT AUTO_INCREMENT PRIMARY KEY,
    Content NVARCHAR(50),
    CategoryID INT,
    TypeID INT,
    CreatorID INT,
    CreateDate DATE,
	FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion (CategoryID),
    FOREIGN KEY (TypeID) REFERENCES TypeQuestion (TypeID)
);
CREATE TABLE Answer (
    AnswerID INT AUTO_INCREMENT PRIMARY KEY,
    Content NVARCHAR(50),
    QuestionID INT,
    FOREIGN KEY (QuestionID) REFERENCES Question (QuestionID),
    isCorrect BOOLEAN
);
CREATE TABLE Exam (
    ExamID INT AUTO_INCREMENT PRIMARY KEY,
    CodeID NVARCHAR(5),
    Title NVARCHAR(50),
    CategoryID INT,
    Duration INT,
    CreatorID INT,
    CreateDate DATE
);
CREATE TABLE ExamQuestion (
    ExamID INT,
    QuestionID INT,
    FOREIGN KEY (QuestionID) REFERENCES Question (QuestionID),
    FOREIGN KEY (ExamID) REFERENCES Exam (ExamID)
);

INSERT INTO Department
VALUES (null, 'An Thinh');

INSERT INTO Position
VALUES (null, 'Kỹ sư');

INSERT INTO Account
VALUES (null, 'lethihong3@gmail.com','nhunglth3','Le Thi Hong Nhung3',2,3,'20231010');

INSERT INTO GroupTable
VALUES (NULL, 'Khu vuc 5',4,'20231212');

INSERT INTO GroupAccount
VALUES (null, '22','20231012');


INSERT INTO TypeQuestion
VALUES (null, 'Những người có nhân phẩm loại 11');

INSERT INTO CategoryQuestion
VALUES (null, 'Topic15');

INSERT INTO Question
VALUES (null, 'Làm sao có vàng?','6','6','10','20231010');

INSERT INTO Answer
VALUES (null, 'Mua vietllot','6','3');

INSERT INTO Exam
VALUES (null, 'AE5','Đời sống và hôn nhấn5','1005','5','5','20231010');

INSERT INTO ExamQuestion
VALUES (null, "8");

SELECT *
FROM Account
    