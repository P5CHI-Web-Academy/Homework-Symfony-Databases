# Climov Eduard

## SQL queries

### Insert student
INSERT INTO students(name, email, birth_date, group_id)  
VALUES('Climov Eduard', 'klimovedik88@gmail.com', '1995-07-11', 1)

### Select student's info
SELECT  
&nbsp;&nbsp;&nbsp;&nbsp;students.name,  
&nbsp;&nbsp;&nbsp;&nbsp;students.email,  
&nbsp;&nbsp;&nbsp;&nbsp;students.birth_date,  
&nbsp;&nbsp;&nbsp;&nbsp;groups.name AS group_name  
FROM students  
INNER JOIN groups  
&nbsp;&nbsp;&nbsp;&nbsp;ON students.group_id = groups.id

### Update student
UPDATE students  
SET students.birth_date = '1995-07-12'  
WHERE students.name = 'Climov Eduard'

### Select top 10 students with max average mark
SELECT  
&nbsp;&nbsp;&nbsp;&nbsp;students.name,  
&nbsp;&nbsp;&nbsp;&nbsp;IFNULL(AVG(marks.mark_value),0) AS avg_mark  
FROM students  
LEFT JOIN marks  
&nbsp;&nbsp;&nbsp;&nbsp;ON students.id = marks.student_id  
GROUP BY students.id  
ORDER BY avg_mark DESC  
LIMIT 10

### Select top students grouped by classes
SELECT  
&nbsp;&nbsp;&nbsp;&nbsp;classes.name AS class,  
&nbsp;&nbsp;&nbsp;&nbsp;students.name AS student,  
&nbsp;&nbsp;&nbsp;&nbsp;avg_marks.avg_mark  
FROM (  
&nbsp;&nbsp;&nbsp;&nbsp;SELECT  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MAX(avg_marks.avg_mark) AS max_avg_mark,  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;avg_marks.class_id  
&nbsp;&nbsp;&nbsp;&nbsp;FROM (  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SELECT  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;AVG(mark_value) avg_mark,  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;class_id,  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;student_id  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FROM marks  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;GROUP BY  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;class_id,  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;student_id  
&nbsp;&nbsp;&nbsp;&nbsp;)avg_marks  
&nbsp;&nbsp;&nbsp;&nbsp;GROUP BY  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;avg_marks.class_id  
) max_avg_marks  
INNER JOIN (  
&nbsp;&nbsp;&nbsp;&nbsp;SELECT  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;AVG(mark_value) avg_mark,  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;class_id,  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;student_id  
&nbsp;&nbsp;&nbsp;&nbsp;FROM marks  
&nbsp;&nbsp;&nbsp;&nbsp;GROUP BY  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;class_id,  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;student_id  
) avg_marks  
&nbsp;&nbsp;&nbsp;&nbsp;ON avg_marks.class_id = max_avg_marks.class_id  
&nbsp;&nbsp;&nbsp;&nbsp;AND avg_marks.avg_mark = max_avg_marks.max_avg_mark  
INNER JOIN classes  
&nbsp;&nbsp;&nbsp;&nbsp;ON avg_marks.class_id = classes.id  
INNER JOIN students  
&nbsp;&nbsp;&nbsp;&nbsp;ON avg_marks.student_id = students.id

### Select list of professors for each student
SELECT  
&nbsp;&nbsp;&nbsp;&nbsp;students.name AS student,  
&nbsp;&nbsp;&nbsp;&nbsp;GROUP_CONCAT(DISTINCT professors.name) AS professors  
FROM marks  
INNER JOIN students  
&nbsp;&nbsp;&nbsp;&nbsp;ON marks.student_id = students.id  
INNER JOIN classes  
&nbsp;&nbsp;&nbsp;&nbsp;ON marks.class_id = classes.id  
INNER JOIN professors  
&nbsp;&nbsp;&nbsp;&nbsp;ON classes.professor_id = professors.id  
GROUP BY marks.student_id
