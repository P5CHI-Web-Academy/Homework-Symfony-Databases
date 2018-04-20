# Climov Eduard

## SQL queries

### Insert students
<pre>
INSERT INTO `students` (`name`, `email`, `birth_date`, `group_id`) VALUES
('Climov Eduard', 'klimovedik88@gmail.com', '1995-07-11', 1),
('Vasiliev Vasilii', 'vasea@mail.com', '1995-03-12', 2),
('Nicolaev Nicolai', 'nicola@mail.com', '1995-04-13', 2);
</pre>

### Select student's info
<pre>
SELECT
    students.name,
    students.email,
    students.birth_date,
    groups.name AS group_name
FROM students
INNER JOIN groups
    ON students.group_id = groups.id
</pre>

### Update student
<pre>
UPDATE students
SET students.birth_date = '1995-07-12'
WHERE students.name = 'Climov Eduard'
</pre>

### Select top 10 students with max average mark
<pre>
SELECT 
    students.name,
    IFNULL(AVG(students_presence.mark),0) AS avg_mark
FROM students
LEFT JOIN students_presence
    ON students.id = students_presence.student_id
GROUP BY students.id
ORDER BY avg_mark DESC
LIMIT 10
</pre>

### Select top students grouped by objects
<pre>
SELECT 
    objects.name AS object_name,
    IFNULL(max_avg_marks.max_avg_mark, 'N/A') AS avg_mark,
    IFNULL(students.name, 'N/A') AS student
FROM objects
LEFT JOIN (
    SELECT 
        MAX(avg_marks_st_obj.avg_mark) AS max_avg_mark,
        avg_marks_st_obj.object_id
    FROM (
        SELECT 
            AVG(sp.mark) AS avg_mark,
            co.object_id,
            sp.student_id
        FROM students_presence sp
        LEFT JOIN ( 
            SELECT
                classes.id AS class_id,
                classes.object_id
            FROM classes
            INNER JOIN objects
                ON classes.object_id = objects.id
        ) co /*classes & objects*/
            ON co.class_id = sp.class_id
        GROUP BY 
            co.object_id,
            sp.student_id
    ) avg_marks_st_obj /*avg marks for each student of each object*/
    GROUP BY avg_marks_st_obj.object_id
) max_avg_marks
    ON objects.id = max_avg_marks.object_id
LEFT JOIN (
    SELECT 
        AVG(sp.mark) AS avg_mark,
        co.object_id,
        sp.student_id
    FROM students_presence sp
    LEFT JOIN ( 
        SELECT
            classes.id AS class_id,
            classes.object_id
        FROM classes
        INNER JOIN objects
            ON classes.object_id = objects.id
    ) co /*classes & objects*/
        ON co.class_id = sp.class_id
    GROUP BY 
        co.object_id,
        sp.student_id
) avg_marks_st_obj /*avg marks for each student of each object*/
    ON max_avg_marks.object_id = avg_marks_st_obj.object_id
    AND max_avg_marks.max_avg_mark = avg_marks_st_obj.avg_mark
LEFT JOIN students
    ON avg_marks_st_obj.student_id = students.id
</pre>

### Select list of professors for each student
<pre>
SELECT
    students.name AS student,
    GROUP_CONCAT(DISTINCT professors.name) AS professors
FROM
    classes
INNER JOIN professors
    ON classes.professor_id = professors.id
LEFT JOIN students_presence
    ON classes.id = students_presence.class_id
INNER JOIN students
    ON students_presence.student_id = students.id
GROUP BY students.id
</pre>
