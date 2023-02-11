create database if not exists testing_system;
use testing_system;

-- table 1 --

create table department(
departmentID tinyint primary key auto_increment,
departmentname varchar(50) unique
);

-- table 2 --

create table `position` (
positionid tinyint primary key auto_increment,
positionname enum('dev','pm','test','scrum master')
);

-- table 3 --

create table `account` (
accountID int primary key auto_increment,
usename varchar(50) not null unique,
fullname varchar(100),
email varchar(50) not null unique,
departmentID tinyint,
positionid tinyint,
createdate date,
constraint account_department_fk foreign key(departmentID) references department(departmentID),
constraint account_position_fk foreign key(positionid) references `position`(positionid)
);

-- table 4 --

create table `group` (
groupid tinyint primary key auto_increment,
groupname varchar(100) not null unique,
createdate date,
createrid int,
constraint group_account_fk foreign key(createrid) references `account`(accountID)
);

-- table 5 --

create table groupaccount(
groupid tinyint,
accountID int,
joindate date,
foreign key(groupid) references `group`(groupid),
foreign key(accountID) references `account`(accountID)
);

-- table 6 --

create table typequestion(
TypeID int primary key auto_increment,
Typename enum('Essey','Multiple-choice')
);

-- table 7 --

create table CategoryQuestion(
CategoryID tinyint primary key auto_increment,
CategoryName Varchar(50)
);

-- table 8 --

create table Question(
QuestionID int primary key auto_increment,
Content Varchar(500),
CategoryID tinyint,
TypeID int,
CreatorID int,
Createdate date,
constraint Question_CategoryQuestion_fk foreign key(CategoryID) references CategoryQuestion(CategoryID),
constraint Question_typequestion_fk foreign key(TypeID) references typequestion(TypeID),
constraint Question_account_fk foreign key(CreatorID) references `account`(accountID)
);

-- table 9 --
create table answer(
AnswerID int primary key auto_increment,
Content varchar(1000),
QuestionID int,
iscorect enum('true','false'),
constraint answer_Question_fk foreign key(QuestionID) references Question(QuestionID)
);

-- table10 --

create table exam(
ExamID tinyint primary key auto_increment,
`Code` char(5) not null,
Title varchar(50),
CategoryID tinyint,
Duration time,
CreatorID int,
createdate date,
constraint exam_account_fk foreign key(CreatorID) references `account`(accountID)
);

-- table11 --
create table Examquestion(
ExamID tinyint,
QuestionID int,
constraint exam_Examquestion_fk foreign key(ExamID) references exam(ExamID),
constraint exam_Question_fk foreign key(QuestionID) references Question(QuestionID)
);


