USE university_management;
-- Student Analysis
-- 1.Students enrolled in the highest number of courses
SELECT s.StudentID, s.FirstName, s.LastName, COUNT(e.CourseID) AS CourseCount
FROM Students s
JOIN Enrollments e
USING(StudentID)
GROUP BY s.StudentID
ORDER BY 4 DESC
limit 5;
-- Insights: - Students taking the most courses show strong academic engagement and possibly aim for faster graduation or broader skill development.

-- 2.Students with consistently high grades (A or B)
SELECT s.StudentID, s.FirstName, s.LastName
FROM Students s JOIN Enrollments e 
USING(StudentID)
GROUP BY s.StudentID
HAVING MIN(e.Grade) IN ('A', 'B') AND MAX(e.Grade) IN ('A', 'B')
LIMIT 5;
-- Insights: - These students demonstrate academic excellence and consistency, making them strong candidates for merit-based scholarships.

-- 3.Average grade per student
SELECT s.StudentID, s.FirstName, s.LastName,
round(AVG(CASE e.Grade
	WHEN 'A' THEN 4
	WHEN 'B' THEN 3
    WHEN 'C' THEN 2
    WHEN 'D' THEN 1
    ELSE 0 END),2) AS GPA
FROM Students s JOIN Enrollments e 
USING(StudentID)
GROUP BY s.StudentID
ORDER BY GPA;
-- Insights: - Helps identify top performers and struggling students, enabling targeted academic counseling and mentoring.

-- Course & Enrollment Analysis
-- 1.Top 5 most enrolled courses
SELECT c.CourseID, c.CourseName, COUNT(e.StudentID) AS EnrollmentCount
FROM Courses c
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseID
ORDER BY EnrollmentCount DESC
LIMIT 5;
-- Insights: - Popular courses likely offer high career value, easier scoring, or are core requirements.

-- 2.Courses with low enrollment
SELECT c.CourseID, c.CourseName, COUNT(e.StudentID) AS EnrollmentCount
FROM Courses c
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseID
HAVING EnrollmentCount < 5;
-- Insights: - May indicate lack of awareness, difficulty level, or low perceived value → need promotion or curriculum revision.

-- 3.Average credits per student
SELECT s.StudentID, s.FirstName, s.LastName, AVG(c.Credits) AS AvgCredits
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
GROUP BY s.StudentID;
-- Insights: - Balanced credits indicate manageable workload, while higher averages may lead to student stress or burnout.

-- Professor & Department Insights
-- 1.Professors teaching the most courses
SELECT p.ProfessorName, COUNT(c.CourseID) AS total_courses
FROM professors p
JOIN courses c ON p.ProfessorID = c.ProfessorID
GROUP BY p.ProfessorID, p.ProfessorName
ORDER BY total_courses DESC;
-- Insights: - Indicates high workload or strong demand/popularity among students.

-- 2.Departments with most active professors
SELECT d.DepartmentID, d.DepartmentName, COUNT(pd.ProfessorID) AS ProfessorCount
FROM Departments d
JOIN ProfessorDepartments pd ON d.DepartmentID = pd.DepartmentID
GROUP BY d.DepartmentID
ORDER BY ProfessorCount DESC;
-- Insights: - Reflects department size and resource allocation; should align with student enrollment demand.

-- 3.Professors whose courses have highest average grades
SELECT p.ProfessorName, 
AVG(CASE e.grade
		   WHEN 'A' THEN 4
           WHEN 'B' THEN 3
           WHEN 'C' THEN 2
           WHEN 'D' THEN 1
           ELSE 0 END) AS avg_grade
FROM Enrollments e
JOIN Courses c ON e.CourseID = c.CourseID
JOIN Professors p ON c.ProfessorID = p.ProfessorID
GROUP BY p.ProfessorID, p.ProfessorName
ORDER BY avg_grade DESC
LIMIT 5;
-- Insights: - Could indicate effective teaching methods OR lenient grading policies—needs deeper evaluation.

-- Academic Performance & Trends
-- 1.Average grade distribution by department
SELECT d.DepartmentName,
       AVG(CASE e.Grade
           WHEN 'A' THEN 4
           WHEN 'B' THEN 3
           WHEN 'C' THEN 2
           WHEN 'D' THEN 1
           ELSE 0 END) AS AvgGrade
FROM Departments d
JOIN ProfessorDepartments pd ON d.DepartmentID = pd.DepartmentID
JOIN Professors p ON pd.ProfessorID = p.ProfessorID
JOIN Courses c ON p.ProfessorID = c.ProfessorID
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY d.DepartmentName;
-- Insights: - Departments with higher averages show better academic performance or easier evaluation systems.

-- 2.Most difficult courses (lowest average grades)
SELECT c.CourseID, c.CourseName,
       AVG(CASE e.Grade
           WHEN 'A' THEN 4
           WHEN 'B' THEN 3
           WHEN 'C' THEN 2
           WHEN 'D' THEN 1
           ELSE 0 END) AS AvgGrade
FROM Courses c
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseID
ORDER BY AvgGrade ASC
LIMIT 5;
-- Insights: - Courses with low grades may require curriculum redesign, better teaching methods, or additional support.

-- 3.Grade trends over time
SELECT YEAR(e.EnrollmentDate) AS Year,
       MONTH(e.EnrollmentDate) AS Month,
       AVG(CASE e.Grade
           WHEN 'A' THEN 4
           WHEN 'B' THEN 3
           WHEN 'C' THEN 2
           WHEN 'D' THEN 1
           ELSE 0 END) AS AvgGrade
FROM Enrollments e
GROUP BY YEAR(e.EnrollmentDate), MONTH(e.EnrollmentDate)
ORDER BY Year, Month;
-- Insights: - Improvement suggests better teaching or student adaptation, while decline may indicate increasing difficulty or gaps in learning.

-- Comparative & Predictive Analysis
-- 1.Enrollment growth by department over 3 years
SELECT d.DepartmentName, YEAR(e.EnrollmentDate) AS Year, COUNT(e.EnrollmentID) AS Enrollments
FROM Departments d
JOIN ProfessorDepartments pd ON d.DepartmentID = pd.DepartmentID
JOIN Professors p ON pd.ProfessorID = p.ProfessorID
JOIN Courses c ON p.ProfessorID = c.ProfessorID
JOIN Enrollments e ON c.CourseID = e.CourseID
WHERE e.EnrollmentDate >= DATE_SUB(CURDATE(), INTERVAL 3 YEAR)
GROUP BY d.DepartmentName, YEAR(e.EnrollmentDate)
ORDER BY d.DepartmentName, Year;
-- Insights: - Fast-growing departments reflect market demand and student interest trends.

-- 2.Predict students at risk of failing
SELECT s.StudentID, s.FirstName, s.LastName,
       COUNT(e.CourseID) AS TotalCourses,
       AVG(CASE e.Grade
           WHEN 'A' THEN 4
           WHEN 'B' THEN 3
           WHEN 'C' THEN 2
           WHEN 'D' THEN 1
           ELSE 0 END) AS GPA
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
GROUP BY s.StudentID
HAVING GPA < 2.0 AND TotalCourses > 3;
-- Insights: - Students with low grades + high course load are more likely to fail → early intervention needed.

-- 3.Do higher-credit courses yield better grades?
SELECT c.Credits,
       round(AVG(CASE e.Grade
           WHEN 'A' THEN 4
           WHEN 'B' THEN 3
           WHEN 'C' THEN 2
           WHEN 'D' THEN 1
           ELSE 0 END),2) AS AvgGrade
FROM Courses c
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.Credits
ORDER BY c.Credits;
-- Insights: - If higher credits correlate with good grades → strong students handle workload well. If not → overloading negatively impacts performance.