# Cereri

* Inserarea unui student
```sql
INSERT INTO `students`(`name`, `bio`, `groups_id`, `faculties_id`) VALUES ("Student 11","Some bio 11", 1, 1)
```

* Afișarea detaliilor despre un student
```sql
SELECT students.id AS id, students.`name` AS name, `bio`, groups.name AS group_name, faculties.abbreviation AS faculty 
	FROM `students` 
    LEFT JOIN groups ON students.groups_id = groups.id
    LEFT JOIN faculties ON students.faculties_id = faculties.id
	WHERE students.id = 1
```

* Modificarea unui student
```sql
UPDATE `students` SET bio = "Some bio 11" WHERE id = 1
```

* Afișarea top 10 studenți cu cea mai bună notă medie
```sql
SELECT students.name AS name, AVG(value) AS avg_grade 
	FROM `grades` 
    LEFT JOIN students ON grades.students_id = students.id
    GROUP BY grades.students_id
    ORDER BY avg_grade DESC
    LIMIT 10
```

* Top studenți per materie
```sql
SELECT courses.name AS course_name, students.name AS student_name, avg_grade AS max_grade 
	FROM (SELECT students_id, avg_grade, 
		@currcount := IF(@courses_id = courses_id, @currcount + 1, 1) AS rank,
    	@courses_id := courses_id AS courses_id 
        FROM (SELECT courses_id, students_id, AVG(`value`) AS avg_grade 
              FROM grades 
              GROUP BY courses_id, students_id 
              ORDER BY courses_id, avg_grade DESC) AS temp_table
   	    CROSS JOIN (SELECT @courses_id := NULL) var_setter
		HAVING rank = 1) AS temp_result 
	LEFT JOIN students ON temp_result.students_id = students.id
    LEFT JOIN courses ON temp_result.courses_id = courses.id
```

* Afișarea listei de profesori care predau unui anumit student
```sql
SELECT DISTINCT students.name AS student_name, courses.teacher AS teacher 
	FROM grades
    LEFT JOIN students ON grades.students_id = students.id
    LEFT JOIN courses ON grades.courses_id = courses.id
    WHERE grades.students_id = 4
```

```sql
SELECT DISTINCT students.name AS student_name, GROUP_CONCAT(DISTINCT courses.teacher SEPARATOR ',') AS teachers
	FROM grades
    LEFT JOIN students ON grades.students_id = students.id
    LEFT JOIN courses ON grades.courses_id = courses.id
    GROUP BY student_name
```

