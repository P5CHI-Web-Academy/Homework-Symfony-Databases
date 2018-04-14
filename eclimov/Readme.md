# Climov Eduard

## SQL queries

### Insert student
INSERT INTO students(name, email, birth_date, group_id)
VALUES('Climov Eduard', 'klimovedik88@gmail.com', '1995-07-11', 1)

### Select student's info
SELECT 
    students.name, 
    students.email, 
    students.birth_date, 
    groups.name AS group_name
FROM students 
INNER JOIN groups 
    ON students.group_id = groups.id

### Update student
UPDATE students
SET students.birth_date = '1995-07-12'
WHERE students.name = 'Climov Eduard'

### Select top 10 students with max average mark
SELECT 
    students.name, 
    IFNULL(AVG(marks.mark_value),0) AS avg_mark
FROM students
LEFT JOIN marks 
    ON students.id = marks.student_id
GROUP BY students.id
ORDER BY avg_mark DESC
LIMIT 10

### Select top students grouped by classes
SELECT 
    classes.name AS class,
    students.name AS student,
    avg_marks.avg_mark
FROM (
    SELECT 
        MAX(avg_marks.avg_mark) AS max_avg_mark,
        avg_marks.class_id
    FROM (
        SELECT 
            AVG(mark_value) avg_mark, 
            class_id,
            student_id
        FROM marks 
        GROUP BY 
            class_id,
            student_id    
    )avg_marks
    GROUP BY
        avg_marks.class_id
) max_avg_marks
INNER JOIN (
    SELECT 
        AVG(mark_value) avg_mark, 
        class_id,
        student_id
    FROM marks 
    GROUP BY 
        class_id,
        student_id    
) avg_marks
    ON avg_marks.class_id = max_avg_marks.class_id
    AND avg_marks.avg_mark = max_avg_marks.max_avg_mark
INNER JOIN classes
    ON avg_marks.class_id = classes.id
INNER JOIN students
    ON avg_marks.student_id = students.id

### Select list of professors for each student
SELECT 
    students.name AS student,
    GROUP_CONCAT(DISTINCT professors.name) AS professors
FROM marks
INNER JOIN students
    ON marks.student_id = students.id
INNER JOIN classes
    ON marks.class_id = classes.id
INNER JOIN professors
    ON classes.professor_id = professors.id
GROUP BY marks.student_id
