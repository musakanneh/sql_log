CREATE DATABASE alu_db;

CREATE TABLE alu_db.Addresses (
    AddressID int NOT NULL PRIMARY KEY,
    Country varchar(50) NOT NULL,
    City varchar(50) NOT NULL,
    StreetNumber varchar(50),
    HouseNumber int
);

CREATE TABLE alu_db.Department (
    DeptID int NOT NULL PRIMARY KEY,
    Name varchar(50),
    NumberOfFaculty int
);

CREATE TABLE alu_db.Staff (
    StaffID int NOT NULL PRIMARY KEY,
    FirstName varchar(50) NOT NULL,
    LastName varchar(50) NOT NULL,
    StaffPosition varchar(100) NOT NULL,
    AddressID int,
    FOREIGN KEY (AddressID) REFERENCES alu_db.Addresses(AddressID)
);

CREATE TABLE alu_db.Facilitators (
    FacilitatorID int NOT NULL PRIMARY KEY,
    FirstName varchar(50) NOT NULL,
    LastName varchar(50) NOT NULL,
    Email varchar(100) NOT NULL,
    Gender varchar(20) NOT NULL,
    Birthdate date NOT NULL,
    AddressID int,
    DeptID int,
    StaffID int,
    FOREIGN KEY (AddressID) REFERENCES alu_db.Addresses(AddressID),
    FOREIGN KEY (DeptID) REFERENCES alu_db.Department(DeptID),
    FOREIGN KEY (StaffID) REFERENCES alu_db.Staff(StaffID)
);

CREATE TABLE alu_db.Clubs (
    ClubID int NOT NULL PRIMARY KEY,
    Name varchar(100),
    NumberOfMembers int,
    FacilitatorID int,
    DeptID int,
    FOREIGN KEY (FacilitatorID) REFERENCES alu_db.Facilitators(FacilitatorID),
    FOREIGN KEY (DeptID) REFERENCES alu_db.Department(DeptID)
);

CREATE TABLE alu_db.DegreePrograms (
    DegreeID int NOT NULL PRIMARY KEY,
    Name varchar(100) NOT NULL,
    Duration int,
    DeptID int,
    FOREIGN KEY (DeptID) REFERENCES alu_db.Department(DeptID)
);

CREATE TABLE alu_db.Courses (
    CourseID int NOT NULL PRIMARY KEY,
    CourseName varchar(100) NOT NULL,
    YearTaught int NOT NULL,
    TermTaught int NOT NULL,
    DegreeID int,
    FacilitatorID int,
    FOREIGN KEY (DegreeID) REFERENCES alu_db.DegreePrograms(DegreeID),
    FOREIGN KEY (FacilitatorID) REFERENCES alu_db.Facilitators(FacilitatorID)
);

CREATE TABLE alu_db.Students (
    StudentID int NOT NULL PRIMARY KEY,
    FirstName varchar(50) NOT NULL,
    LastName varchar(50) NOT NULL,
    Email varchar(100) NOT NULL,
    Gender varchar(20) NOT NULL,
    Birthdate date NOT NULL,
    CourseID int,
    AddressID int,
    FOREIGN KEY (CourseID) REFERENCES alu_db.Courses(CourseID),
    FOREIGN KEY (AddressID) REFERENCES alu_db.Addresses(AddressID)
);

CREATE TABLE alu_db.GradeReports (
    GradeID int NOT NULL PRIMARY KEY,
    GPA int NOT NULL,
    Passed bool,
    StudentID int,
    FOREIGN KEY (StudentID) REFERENCES alu_db.Students(StudentID)
);

INSERT INTO
    alu_db.Addresses
VALUES
    (1, 'Rwanda', 'Kigali', 'KG-1', 1);

INSERT INTO
    alu_db.Addresses
VALUES
    (2, 'Rwanda', 'Kigali', 'KG-2', 2);

INSERT INTO
    alu_db.Addresses
VALUES
    (3, 'Rwanda', 'Kigali', 'KG-3', 3);

INSERT INTO
    alu_db.Addresses
VALUES
    (4, 'Rwanda', 'Kigali', 'KG-4', 4);

INSERT INTO
    alu_db.Addresses
VALUES
    (5, 'Rwanda', 'Kigali', 'KG-5', 5);

INSERT INTO
    alu_db.Addresses
VALUES
    (6, 'Rwanda', 'Kigali', 'KG-6', 6);

INSERT INTO
    alu_db.Addresses
VALUES
    (7, 'Rwanda', 'Kigali', 'KG-7', 7);

INSERT INTO
    alu_db.Addresses
VALUES
    (8, 'Rwanda', 'Kigali', 'KG-8', 8);

INSERT INTO
    alu_db.Addresses
VALUES
    (9, 'Rwanda', 'Kigali', 'KG-9', 9);

INSERT INTO
    alu_db.Addresses
VALUES
    (10, 'Rwanda', 'Kigali', 'KG-10', 10);

INSERT INTO
    alu_db.Department
VALUES
    (1, 'Engineering & Computing', 10);

INSERT INTO
    alu_db.Department
VALUES
    (2, 'Global Challenges', 10);

INSERT INTO
    alu_db.Department
VALUES
    (3, 'Governance and Policy', 10);

INSERT INTO
    alu_db.Department
VALUES
    (4, 'Aerospace Engineering', 10);

INSERT INTO
    alu_db.Department
VALUES
    (5, 'Physics', 10);

INSERT INTO
    alu_db.Department
VALUES
    (6, 'Business Studies', 10);

INSERT INTO
    alu_db.Department
VALUES
    (7, 'Political Science', 10);

INSERT INTO
    alu_db.Department
VALUES
    (8, 'Robotics and Automation', 10);

INSERT INTO
    alu_db.Department
VALUES
    (9, 'Agriculture', 10);

INSERT INTO
    alu_db.Department
VALUES
    (10, 'Material Design', 10);

INSERT INTO
    alu_db.Staff
VALUES
    (1, 'Robert', 'Last Name', 'Facilitator', 1);

INSERT INTO
    alu_db.Staff
VALUES
    (2, 'Tatenda', 'Last Name', 'Facilitator', 2);

INSERT INTO
    alu_db.Staff
VALUES
    (3, 'Thadee', 'Last Name', 'Facilitator', 3);

INSERT INTO
    alu_db.Staff
VALUES
    (4, 'Donart', 'Last Name', 'Facilitator', 4);

INSERT INTO
    alu_db.Staff
VALUES
    (5, 'Lucy', 'Last Name', 'Facilitator', 5);

INSERT INTO
    alu_db.Staff
VALUES
    (6, 'Clovis', 'Last Name', 'Facilitator', 6);

INSERT INTO
    alu_db.Staff
VALUES
    (7, 'Obed', 'Last Name', 'Facilitator', 7);

INSERT INTO
    alu_db.Staff
VALUES
    (8, 'Mehdi', 'Last Name', 'Facilitator', 8);

INSERT INTO
    alu_db.Staff
VALUES
    (9, 'Emelyne', 'Last Name', 'Facilitator', 9);

INSERT INTO
    alu_db.Staff
VALUES
    (10, 'Ela', 'Last Name', 'Facilitator', 10);

INSERT INTO
    alu_db.Facilitators
VALUES
    (
        1,
        'Robert',
        'Last Name',
        'remail@alueducation.com',
        'Male',
        '1990-01-01',
        1,
        1,
        1
    );

INSERT INTO
    alu_db.Facilitators
VALUES
    (
        2,
        'Tatenda',
        'Last Name',
        'temail@alueducation.com',
        'Male',
        '1990-02-01',
        2,
        1,
        2
    );

INSERT INTO
    alu_db.Facilitators
VALUES
    (
        3,
        'Thadee',
        'Last Name',
        'themail@alueducation.com',
        'Male',
        '1990-03-01',
        3,
        1,
        3
    );

INSERT INTO
    alu_db.Facilitators
VALUES
    (
        4,
        'Donart',
        'Last Name',
        'demail@alueducation.com',
        'Male',
        '1990-04-01',
        4,
        1,
        4
    );

INSERT INTO
    alu_db.Facilitators
VALUES
    (
        5,
        'Lucy',
        'Last Name',
        'lemail@alueducation.com',
        'Male',
        '1990-05-01',
        5,
        1,
        5
    );

INSERT INTO
    alu_db.Facilitators
VALUES
    (
        6,
        'Clovis',
        'Last Name',
        'cemail@alueducation.com',
        'Male',
        '1990-01-01',
        6,
        1,
        6
    );

INSERT INTO
    alu_db.Facilitators
VALUES
    (
        7,
        'Obed',
        'Last Name',
        'oemail@alueducation.com',
        'Male',
        '1990-07-01',
        7,
        1,
        7
    );

INSERT INTO
    alu_db.Facilitators
VALUES
    (
        8,
        'Mehdi',
        'Last Name',
        'memail@alueducation.com',
        'Male',
        '1990-08-01',
        8,
        1,
        8
    );

INSERT INTO
    alu_db.Facilitators
VALUES
    (
        9,
        'Emelyne',
        'Last Name',
        'eemail@alueducation.com',
        'Male',
        '1990-09-01',
        9,
        1,
        9
    );

INSERT INTO
    alu_db.Facilitators
VALUES
    (
        10,
        'Ela',
        'Last Name',
        'elemail@alueducation.com',
        'Male',
        '1990-01-01',
        10,
        1,
        10
    );

INSERT INTO
    alu_db.Clubs
VALUES
    (1, 'Robotics Club', 10, 1, 1);

INSERT INTO
    alu_db.Clubs
VALUES
    (2, 'IoT', 11, 2, 1);

INSERT INTO
    alu_db.Clubs
VALUES
    (3, 'Data Science Club', 12, 3, 1);

INSERT INTO
    alu_db.Clubs
VALUES
    (4, 'Entreprenuership Club', 13, 4, 2);

INSERT INTO
    alu_db.Clubs
VALUES
    (5, 'Consulting Club', 14, 5, 2);

INSERT INTO
    alu_db.Clubs
VALUES
    (6, 'AI Lab', 15, 6, 1);

INSERT INTO
    alu_db.Clubs
VALUES
    (7, 'Problem-Solving Lab', 16, 7, 3);

INSERT INTO
    alu_db.Clubs
VALUES
    (8, 'Club-123', 17, 8, 4);

INSERT INTO
    alu_db.Clubs
VALUES
    (9, 'Club-124', 18, 9, 4);

INSERT INTO
    alu_db.Clubs
VALUES
    (10, 'Club-125', 19, 10, 4);

INSERT INTO
    alu_db.DegreePrograms
VALUES
    (1, 'Computer Science', 4, 1);

INSERT INTO
    alu_db.DegreePrograms
VALUES
    (2, 'Global Challenges', 4, 2);

INSERT INTO
    alu_db.DegreePrograms
VALUES
    (3, 'International Business & Trade', 6, 1);

INSERT INTO
    alu_db.DegreePrograms
VALUES
    (4, 'Entreprenuership', 6, 1);

INSERT INTO
    alu_db.DegreePrograms
VALUES
    (5, 'Physics', 1, 1);

INSERT INTO
    alu_db.DegreePrograms
VALUES
    (6, 'Chemistry', 1, 1);

INSERT INTO
    alu_db.DegreePrograms
VALUES
    (7, 'Mathematics', 1, 1);

INSERT INTO
    alu_db.DegreePrograms
VALUES
    (8, 'Mechanical Engineering', 1, 1);

INSERT INTO
    alu_db.DegreePrograms
VALUES
    (9, 'Political Science', 3, 1);

INSERT INTO
    alu_db.DegreePrograms
VALUES
    (10, 'Engineering Science', 1, 1);

INSERT INTO
    alu_db.Courses
VALUES
    (1, 'Advanced Databases', 4, 2, 1, 1);

INSERT INTO
    alu_db.Courses
VALUES
    (2, 'Databases Systems', 2, 1, 1, 9);

INSERT INTO
    alu_db.Courses
VALUES
    (3, 'Programming I - Python', 2, 1, 1, 8);

INSERT INTO
    alu_db.Courses
VALUES
    (4, 'Programming II - Java', 2, 2, 1, 8);

INSERT INTO
    alu_db.Courses
VALUES
    (5, 'Macro Economics', 3, 2, 3, 10);

INSERT INTO
    alu_db.Courses
VALUES
    (6, 'Micro Economics', 3, 1, 3, 10);

INSERT INTO
    alu_db.Courses
VALUES
    (7, 'Design Thinking', 2, 1, 6, 10);

INSERT INTO
    alu_db.Courses
VALUES
    (8, 'Mobile Development', 3, 1, 1, 5);

INSERT INTO
    alu_db.Courses
VALUES
    (9, 'Machine Learning', 4, 1, 1, 2);

INSERT INTO
    alu_db.Courses
VALUES
    (10, 'Data Mining', 4, 2, 1, 2);

INSERT INTO
    alu_db.Students
VALUES
    (
        1,
        'Mwiza',
        'Last Name',
        'mstudent@email.com',
        'Male',
        '1999-01-01',
        1,
        1
    );

INSERT INTO
    alu_db.Students
VALUES
    (
        2,
        'Jorja',
        'Last Name',
        'jjstudent@email.com',
        'Female',
        '1999-02-01',
        1,
        1
    );

INSERT INTO
    alu_db.Students
VALUES
    (
        3,
        'John',
        'Last Name',
        'jstudent@email.com',
        'Male',
        '1999-03-01',
        1,
        1
    );

INSERT INTO
    alu_db.Students
VALUES
    (
        4,
        'Kevin',
        'Last Name',
        'kstudent@email.com',
        'Male',
        '1999-04-01',
        2,
        1
    );

INSERT INTO
    alu_db.Students
VALUES
    (
        5,
        'Patrick',
        'Last Name',
        'j2student@email.com',
        'Male',
        '1999-05-01',
        2,
        1
    );

INSERT INTO
    alu_db.Students
VALUES
    (
        6,
        'Sam',
        'Last Name',
        'sstudent@email.com',
        'Male',
        '1999-06-01',
        2,
        2
    );

INSERT INTO
    alu_db.Students
VALUES
    (
        7,
        'Jane',
        'Last Name',
        'jastudent@email.com',
        'Female',
        '1999-07-01',
        3,
        2
    );

INSERT INTO
    alu_db.Students
VALUES
    (
        8,
        'Philip',
        'Last Name',
        'pstudent@email.com',
        'Male',
        '1999-08-01',
        3,
        3
    );

INSERT INTO
    alu_db.Students
VALUES
    (
        9,
        'Mary',
        'Last Name',
        'mystudent@email.com',
        'Female',
        '1999-09-01',
        3,
        3
    );

INSERT INTO
    alu_db.Students
VALUES
    (
        10,
        'Judith',
        'Last Name',
        'jdstudent@email.com',
        'Female',
        '1999-10-01',
        4,
        3
    );