CREATE DATABASE StudentCourseDB;
USE StudentCourseDB;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    major VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    instructor VARCHAR(100),
    credit_hours INT
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    semester VARCHAR(50),
    grade VARCHAR(2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Students (student_id, student_name, major, email) VALUES
(1, 'Rakan Al-Rasheed', 'Information Systems', 'rakan1@email.com'),
(2, 'Ali Al-Wabari', 'Information Systems', 'ali2@email.com'),
(3, 'Mohammed Al-Amer', 'Computer Science', 'mohammed3@email.com');

INSERT INTO Courses (course_id, course_name, instructor, credit_hours) VALUES
(101, 'Database Systems', 'Dr. Ahmed', 3),
(102, 'Web Development', 'Dr. Sara', 3),
(103, 'Cybersecurity Fundamentals', 'Dr. خالد', 2);

INSERT INTO Enrollments (enrollment_id, student_id, course_id, semester, grade) VALUES
(1, 1, 101, 'First Semester 2025', 'A'),
(2, 1, 102, 'First Semester 2025', 'B+'),
(3, 2, 101, 'First Semester 2025', 'A-'),
(4, 3, 103, 'First Semester 2025', 'B');

SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Enrollments;

SELECT s.student_name, c.course_name, e.semester, e.grade
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id;

SELECT s.student_name, c.course_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE s.student_id = 1;

SELECT c.course_name, COUNT(e.student_id) AS total_students
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;

SELECT student_name, major
FROM Students
WHERE major = 'Information Systems';