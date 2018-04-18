- Inserarea unui student
```
INSERT INTO students(name, faculty_id, group_id) VALUES ('placeholder', 1, 1)
```

- Afișarea detaliilor despre un student
```
SELECT * FROM students WHERE id = 1
```

- Modificarea unui student
```
UPDATE students SET name = 'placeholder', faculty_id = 1, group_id = 1 WHERE id = 1
```

- Afișarea top 10 studenți cu cea mai bună notă medie
```
SELECT students.name, AVG(mark) as top FROM marks LEFT JOIN students on marks.student_id = students.id GROUP BY marks.student_id ORDER BY top DESC LIMIT 10 ;
```

- Top studenți per materie
```
¯\_(ツ)_/¯
```
- Afișarea listei de profesori care predau unui anumit student
```
SELECT teachers.name AS Teacher, students.name AS Student FROM faculties INNER JOIN students ON students.faculty_id = faculties.id INNER JOIN objects ON objects.faculty_id = faculties.id INNER JOIN teachers ON teachers.object_id = objects.id WHERE students.id = 'student_id';
```