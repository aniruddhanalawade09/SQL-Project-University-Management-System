CREATE DATABASE University_Management;
USE University_Management;

-- Creating Students Table
CREATE TABLE Students(
StudentID INT primary key auto_increment,
FirstName varchar(50),
LastName varchar(50),
Email varchar(50),
EnrollmentDate DATE
);

-- Inserting Records into Students Table
INSERT INTO Students (FirstName, LastName, Email, EnrollmentDate) VALUES
('Aarav', 'Sharma', 'aarav.sharma@univ.edu', '2022-08-01'),('Isha', 'Patel', 'isha.patel@univ.edu', '2021-07-15'),('Rohan', 'Mehta', 'rohan.mehta@univ.edu', '2023-01-10'),
('Sneha', 'Reddy', 'sneha.reddy@univ.edu', '2022-09-05'),('Kabir', 'Singh', 'kabir.singh@univ.edu', '2021-08-20'),('Neha', 'Kumar', 'neha.kumar@univ.edu', '2023-02-01'),
('Aditya', 'Joshi', 'aditya.joshi@univ.edu', '2022-07-10'),('Meera', 'Desai', 'meera.desai@univ.edu', '2021-09-12'),('Yash', 'Verma', 'yash.verma@univ.edu', '2023-03-15'),
('Tanya', 'Gupta', 'tanya.gupta@univ.edu', '2022-08-22'),('Arjun', 'Nair', 'arjun.nair@univ.edu', '2021-06-30'),('Diya', 'Kapoor', 'diya.kapoor@univ.edu', '2023-01-27'),
('Kunal', 'Bose', 'kunal.bose@univ.edu', '2022-10-05'),('Riya', 'Malhotra', 'riya.malhotra@univ.edu', '2021-11-18'),('Harsh', 'Chopra', 'harsh.chopra@univ.edu', '2023-04-01'),
('Simran', 'Jain', 'simran.jain@univ.edu', '2022-05-20'),('Nikhil', 'Dutta', 'nikhil.dutta@univ.edu', '2021-08-10'),('Ananya', 'Bhatt', 'ananya.bhatt@univ.edu', '2023-02-14'),
('Dev', 'Rastogi', 'dev.rastogi@univ.edu', '2022-09-30'),('Priya', 'Chatterjee', 'priya.chatterjee@univ.edu', '2021-07-27'),('Siddharth', 'Ghosh', 'siddharth.ghosh@univ.edu', '2023-03-05'),
('Avni', 'Sen', 'avni.sen@univ.edu', '2022-06-18'),('Rahul', 'Mishra', 'rahul.mishra@univ.edu', '2021-10-12'),('Pooja', 'Yadav', 'pooja.yadav@univ.edu', '2023-01-08'),
('Manav', 'Tripathi', 'manav.tripathi@univ.edu', '2022-07-28'),('Shruti', 'Aggarwal', 'shruti.aggarwal@univ.edu', '2021-09-03'),('Aman', 'Bhatia', 'aman.bhatia@univ.edu', '2023-02-20'),
('Naina', 'Saxena', 'naina.saxena@univ.edu', '2022-08-15'),('Varun', 'Kohli', 'varun.kohli@univ.edu', '2021-06-22'),('Ishaan', 'Roy', 'ishaan.roy@univ.edu', '2023-03-10');

-- Create a Professors Table
CREATE TABLE Professors(
ProfessorID INT primary key auto_increment,
ProfessorName varchar(50),
Department varchar(50)
);

-- Inseting Records into Professors Table
INSERT INTO Professors (ProfessorName, Department) VALUES
('Dr. Neha Verma', 'Computer Science'),('Dr. Rajiv Nair', 'Information Technology'),('Dr. Anjali Desai', 'Electronics'),('Dr. Vikram Joshi', 'Computer Science'),
('Dr. Meera Kulkarni', 'Mathematics'),('Dr. Suresh Rao', 'Physics'),('Dr. Kavita Menon', 'Biotechnology'),('Dr. Arvind Sharma', 'Mechanical'),('Dr. Poonam Singh', 'Civil'),
('Dr. Rakesh Bhat', 'Architecture'),('Dr. Swati Ghosh', 'Computer Science'),('Dr. Nitin Kapoor', 'Information Technology'),('Dr. Alok Das', 'Electronics'),
('Dr. Shalini Mishra', 'Mathematics'),('Dr. Deepak Jain', 'Physics'),('Dr. Ritu Agarwal', 'Biotechnology'),('Dr. Mohan Iyer', 'Mechanical'),('Dr. Sneha Rao', 'Civil'),
('Dr. Ajay Mehta', 'Architecture'),('Dr. Priya Sen', 'Computer Science'),('Dr. Kiran Patil', 'Information Technology'),('Dr. Tanvi Reddy', 'Electronics'),
('Dr. Abhay Kulkarni', 'Mathematics'),('Dr. Nisha Joshi', 'Physics'),('Dr. Gaurav Saxena', 'Biotechnology'),('Dr. Ramesh Yadav', 'Mechanical'),('Dr. Anju Kapoor', 'Civil'),
('Dr. Sanjay Roy', 'Architecture'),('Dr. Preeti Malhotra', 'Computer Science'),('Dr. Hemant Deshmukh', 'Information Technology');

-- Courses
CREATE TABLE Courses(
CourseID INT primary key auto_increment,
CourseName varchar(50),
ProfessorID int,
Credits int,
foreign key(ProfessorID) references professors(ProfessorID)
);

-- Inseting Records into Courses Table
INSERT INTO Courses (CourseName, ProfessorID, Credits) VALUES
('Data Structures', 1, 4),('Database Systems', 4, 3),('Operating Systems', 11, 4),('Machine Learning', 20, 3),('Web Development', 29, 2),
('Computer Networks', 1, 3),('Software Engineering', 4, 3),('Artificial Intelligence', 20, 4),('Cybersecurity', 2, 3),('Cloud Computing', 30, 3),
('Mobile App Development', 21, 2),('Digital Signal Processing', 3, 3),('Embedded Systems', 13, 4),('Linear Algebra', 5, 3),('Calculus', 14, 4),
('Statistics', 23, 3),('Discrete Mathematics', 5, 3),('Big Data Analytics', 12, 4),('Natural Language Processing', 11, 3),('Compiler Design', 1, 4),
('Human-Computer Interaction', 29, 2),('Ethical Hacking', 2, 3),('Blockchain Fundamentals', 21, 2),('Quantum Computing', 20, 4),('Robotics', 3, 3),
('Image Processing', 22, 3),('Game Development', 29, 2),('DevOps', 30, 3),('Data Visualization', 12, 2),('Bioinformatics', 7, 3);

-- Enrollments
CREATE TABLE Enrollments(
EnrollmentID INT primary key auto_increment,
StudentID INT,
CourseID INT,
EnrollmentDate DATE,
GRADE CHAR,
foreign key(StudentID) references Students(StudentID),
foreign key(CourseID) references Courses(CourseID)
);

-- Inseting Records into Enrollments Table
INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate, Grade) VALUES
(1, 1, '2022-08-10', 'A'), (1, 2, '2022-08-10', 'B'),(1, 5, '2023-01-09', 'B'),
(2, 3, '2021-07-20', 'C'), (2, 4, '2021-07-20', 'B'),(2, 1, '2023-02-09', 'C'), (2, 10, '2023-03-10', 'A'), (2, 5, '2023-01-10', 'A'),
(3, 5, '2023-01-15', 'A'), (3, 6, '2023-01-15', 'B'),(3, 1, '2023-04-09', 'A'), 
(4, 7, '2022-09-10', 'A'), (4, 8, '2022-09-10', 'A'),(4, 1, '2023-05-09', 'C'), (4, 10, '2023-07-10', 'D'),
(5, 9, '2021-08-27', 'D'), (5, 10, '2021-08-27', 'C'),(5, 1, '2021-08-27', 'A'), (5, 4, '2021-08-27', 'C'),
(6, 11, '2023-02-05', 'B'), (6, 12, '2023-02-05', 'A'),
(7, 13, '2022-07-15', 'C'), (7, 14, '2022-07-15', 'B'),
(8, 15, '2021-09-20', 'A'), (8, 16, '2021-09-20', 'B'),
(9, 17, '2023-03-20', 'A'), (9, 18, '2023-03-20', 'A'),
(10, 19, '2022-08-27', 'B'), (10, 20, '2022-08-27', 'C'),
(11, 21, '2021-06-30', 'A'), (11, 22, '2021-06-30', 'B'),
(12, 23, '2023-01-30', 'C'), (12, 24, '2023-01-30', 'D'),
(13, 27, '2022-10-10', 'B'), (13, 26, '2022-10-10', 'A'),
(14, 27, '2021-11-27', 'A'), (14, 28, '2021-11-27', 'B'),
(15, 29, '2023-04-05', 'C'), (15, 30, '2023-04-05', 'B'),
(16, 1, '2022-05-27', 'A'), (16, 2, '2022-05-27', 'A'),
(17, 3, '2021-08-15', 'B'), (17, 4, '2021-08-15', 'C'),
(18, 5, '2023-02-20', 'A'), (18, 6, '2023-02-20', 'B'),
(19, 7, '2022-09-30', 'C'), (19, 8, '2022-09-30', 'D'),
(20, 9, '2021-07-30', 'B'), (20, 10, '2021-07-30', 'A'),
(21, 11, '2023-03-10', 'A'), (21, 12, '2023-03-10', 'B'),
(22, 13, '2022-06-27', 'C'), (22, 14, '2022-06-27', 'A'),
(23, 15, '2021-10-20', 'B'), (23, 16, '2021-10-20', 'C'),(23, 7, '2023-03-22', 'D'),
(24, 17, '2023-01-10', 'A'), (24, 18, '2023-01-10', 'A'),(24, 7, '2023-03-22', 'D'),
(25, 17, '2023-01-11', 'D'), (25, 15, '2023-01-16', 'D'), (25, 1, '2023-01-09', 'D'),
(26, 2, '2023-01-02', 'D'), (26, 4, '2023-02-14', 'D'), (26, 6, '2023-01-21', 'D'),
(27, 3, '2023-01-19', 'D'), (27, 6, '2023-01-26', 'D'), (27, 9, '2023-01-24', 'D'),
(28, 5, '2023-01-18', 'D'), (28, 10, '2023-01-19', 'D'), (28, 15, '2023-01-14', 'D'), (28, 9, '2023-02-13', 'D'),
(29, 6, '2023-03-09', 'D'), (29, 12, '2023-03-11', 'D'), (29, 18, '2023-03-11', 'D'), (29, 11, '2023-03-14', 'D'),
(30, 17, '2023-05-05', 'D'), (30, 15, '2023-05-11', 'D'), (30, 1, '2023-05-10', 'D'), (30, 13, '2023-05-15', 'D');

-- Departments
CREATE TABLE Departments(
DepartmentID INT primary key auto_increment,
DepartmentName VARCHAR(50),
Building VARCHAR(50)
);

-- Inseting Records into Departments Table
INSERT INTO Departments (DepartmentName, Building) VALUES
('Computer Science', 'A Block'),('Information Technology', 'B Block'),('Electronics', 'C Block'),('Mathematics', 'D Block'),('Physics', 'E Block'),
('Biotechnology', 'F Block'),('Mechanical', 'G Block'),('Civil', 'H Block'),('Architecture', 'I Block'),('Environmental Science', 'J Block'),
('Economics', 'K Block'),('Psychology', 'L Block'),('Political Science', 'M Block'),('History', 'N Block'),('Geography', 'O Block'),
('Philosophy', 'P Block'),('Sociology', 'Q Block'),('English Literature', 'R Block'),('Linguistics', 'S Block'),('Law', 'T Block'),
('Business Administration', 'U Block'),('Finance', 'V Block'),('Marketing', 'W Block'),('Human Resources', 'X Block'),('Journalism', 'Y Block'),
('Mass Communication', 'Z Block'),('Education', 'AA Block'),('Library Science', 'AB Block'),('Fine Arts', 'AC Block'),('Music', 'AD Block');

-- ProfessorDepartments
CREATE TABLE ProfessorDepartments(
ProfessorID INT NOT NULL,
DepartmentID INT NOT NULL,
foreign key(ProfessorID) references Professors(ProfessorID),
foreign key(DepartmentID) references Departments(DepartmentID)
);

-- Inseting Records into ProfessorDepartments Table
INSERT INTO ProfessorDepartments (ProfessorID, DepartmentID) VALUES
(1, 1), (2, 2), (3, 3), (4, 1), (5, 4),(6, 5), (7, 6), (8, 7), (9, 8), (10, 9),
(11, 1), (12, 2), (13, 3), (14, 4), (15, 5),(16, 6), (17, 7), (18, 8), (19, 9), (20, 1),
(21, 2), (22, 3), (23, 4), (24, 5), (25, 6),(26, 7), (27, 8), (28, 9), (29, 1), (30, 2);