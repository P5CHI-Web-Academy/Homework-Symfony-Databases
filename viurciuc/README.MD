*Inserarea unui student
INSERT INTO Students(`id`, `name`, `info`, `faculty_id`, `group_id`) 
VALUES (1, 'Student 1', 'info', 1, 2);

*Afișarea detaliilor despre un student
SELECT Students.id AS id, Students.name AS name, Students.info, Groups.name AS group_name, 						Faculties.abbreviation AS faculty 
FROM Students 
LEFT JOIN Groups ON Students.group_id = Groups.id 
LEFT JOIN Faculties ON Students.faculty_id = Faculties.id WHERE Students.id = 1;

*Modificarea unui student
UPDATE Students 
SET group_id=3 WHERE id=1;

*Afișarea top 10 studenți cu cea mai bună notă medie
SELECT Students.name AS name, AVG(mark) AS avg_mark 
FROM Marks 
LEFT JOIN Students ON Marks.student_id = Students.id 
GROUP BY Marks.student_id 
ORDER BY avg_mark DESC LIMIT 10;

*Top studenți per materie
SELECT Courses.name AS course_name, Students.name AS student_name, avg_mark AS mark 
	FROM (SELECT student_id, avg_mark, 
		@currcount := IF(@courses_id = course_id, @currcount + 1, 1) AS rank,
    	@courses_id := course_id AS course_id 
        FROM (SELECT course_id, student_id, AVG(`mark`) AS avg_mark 
              FROM Marks 
              GROUP BY course_id, student_id 
              ORDER BY course_id, avg_mark DESC) AS temp_table
   	    INNER JOIN (SELECT @courses_id := NULL) var_setter
		HAVING rank = 1) AS temp_result 
	LEFT JOIN Students ON temp_result.student_id = Students.id
    LEFT JOIN Courses ON temp_result.course_id = Courses.id

*Afișarea listei de profesori care predau unui anumit student
SELECT DISTINCT Students.name AS student_name, Teachers.name AS teacher 
	FROM Marks
    LEFT JOIN Students ON Marks.student_id = Students.id
    LEFT JOIN Courses ON Marks.course_id = Courses.id
    LEFT JOIN Teachers ON Courses.teacher_id = Teachers.id
    WHERE Marks.student_id = 4