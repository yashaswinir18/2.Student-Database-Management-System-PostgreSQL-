-- Create the database
CREATE DATABASE student_database;

-- Connect to the database
\c student_database;

-- Create the student_table
CREATE TABLE student_table (
    Student_id SERIAL PRIMARY KEY,
    Stu_name VARCHAR(100) NOT NULL,
    Department VARCHAR(100) NOT NULL,
    Email_id VARCHAR(255) UNIQUE NOT NULL,
    Phone_no NUMERIC(10),
    Address TEXT,
    Date_of_birth DATE NOT NULL,
    Gender VARCHAR(6) CHECK (Gender IN ('Male', 'Female')),
    Major VARCHAR(100) NOT NULL,
    GPA NUMERIC(3, 2),
    Grade VARCHAR(1) CHECK (Grade IN ('A', 'B', 'C', 'D', 'F'))
);


-- Insert 10 sample records
INSERT INTO student_table 
    (Stu_name, Department, Email_id, Phone_no, Address, Date_of_birth, Gender, Major, GPA, Grade)
VALUES
    ('Alice Smith', 'Computer Science', 'alice.smith@example.com', 9876543210, '123 Elm St', '2000-05-14', 'Female', 'AI', 9.2, 'A'),
    ('Bob Johnson', 'Mathematics', 'bob.johnson@example.com', 9876543211, '456 Oak St', '1999-09-23', 'Male', 'Statistics', 7.8, 'B'),
    ('Cathy Brown', 'Physics', 'cathy.brown@example.com', 9876543212, '789 Pine St', '2001-03-10', 'Female', 'Astrophysics', 8.5, 'A'),
    ('David Lee', 'Biology', 'david.lee@example.com', 9876543213, '321 Maple St', '1998-11-30', 'Male', 'Genetics', 6.4, 'C'),
    ('Emma Davis', 'Chemistry', 'emma.davis@example.com', 9876543214, '654 Birch St', '2002-01-15', 'Female', 'Organic Chemistry', 4.9, 'D'),
    ('Frank Miller', 'Engineering', 'frank.miller@example.com', 9876543215, '987 Cedar St', '1997-06-20', 'Male', 'Mechanical', 5.2, 'B'),
    ('Grace Wilson', 'Philosophy', 'grace.wilson@example.com', 9876543216, '345 Aspen St', '2000-08-08', 'Female', 'Ethics', 7.1, 'B'),
    ('Henry Martin', 'Economics', 'henry.martin@example.com', 9876543217, '567 Walnut St', '1999-12-18', 'Male', 'Finance', 8.8, 'A'),
    ('Isabel Clark', 'Computer Science', 'isabel.clark@example.com', 9876543218, '789 Cypress St', '2001-02-25', 'Female', 'AI', 6.9, 'C'),
    ('Jack Turner', 'Mathematics', 'jack.turner@example.com', 9876543219, '123 Redwood St', '1998-04-05', 'Male', 'Algebra', 3.5, 'F');


-- Retrieve all students' information sorted by Grade in descending order
SELECT * 
FROM student_table
ORDER BY Grade DESC;


-- Retrieve information about all male students
SELECT * 
FROM student_table
WHERE Gender = 'Male';


-- Fetch details of students with GPA less than 5.0
SELECT * 
FROM student_table
WHERE GPA < 5.0;


-- Update email and grade of a student with specific ID (e.g., ID = 2)
UPDATE student_table
SET Email_id = 'new.email@example.com', Grade = 'A'
WHERE Student_id = 2;


-- Retrieve names and ages of students with grade "B"
SELECT 
    Stu_name, 
    TIMESTAMPDIFF(YEAR, Date_of_birth, CURDATE()) AS Age
FROM student_table
WHERE Grade = 'B';


-- Group by Department and Gender and calculate average GPA
SELECT Department, Gender, AVG(GPA) AS Avg_GPA
FROM student_table
GROUP BY Department, Gender;


-- Rename the table to "student_info"
ALTER TABLE student_table RENAME TO student_info;


-- Retrieve the name of the student with the highest GPA
SELECT Stu_name
FROM student_info
WHERE GPA = (SELECT MAX(GPA) FROM student_info);
