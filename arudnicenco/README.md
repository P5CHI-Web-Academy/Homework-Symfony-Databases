# Creating tables 

``` sql
CREATE TABLE teachers (
teacher_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
teacher_fname VARCHAR(25) NOT NULL,
teacher_lname VARCHAR(25) NOT NULL
);
```

``` sql
CREATE TABLE students (
student_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
student_fname VARCHAR(25) NOT NULL,
student_lname VARCHAR(25) NOT NULL
);
 ```

``` sql
CREATE TABLE subjects (
subject_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
subject_name VARCHAR(25) NOT NULL,
teacher_id INT NOT NULL,
CONSTRAINT FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);
```

``` sql
CREATE TABLE marks (
subject_id INT NOT NULL,
student_id INT NOT NULL,
mark INT NOT NULL,
CONSTRAINT FOREIGN KEY (subject_id) REFERENCES subjects(subject_id),
CONSTRAINT FOREIGN KEY (student_id) REFERENCES students(student_id)
);
```

``` sql
CREATE TABLE faculties ( 
faculty_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
faculty_name VARCHAR(25) 
);
```
``` sql
CREATE TABLE groups (
group_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
group_name VARCHAR(25) NOT NULL,
student_id INT NOT NULL,
faculty_id INT NOT NULL,
CONSTRAINT FOREIGN KEY(student_id) REFERENCES students(student_id),
CONSTRAINT FOREIGN KEY(faculty_id) REFERENCES faculties(faculty_id)
);
```
# Inserting data
``` sql
 INSERT INTO students(student_fname,student_lname) VALUES ('Johnson','Alex');
 INSERT INTO teachers(teacher_fname,teacher_lname) VALUES ('Parker','Peter');
 INSERT INTO subjects (subject_name,teacher_id) VALUES ('Math', 1);
 INSERT INTO marks(subject_id, student_id, mark) VALUES (1, 1, 8); 
 INSERT INTO faculties(faculty_name) VALUES('Math_and_Informatics');
 INSERT INTO groups(group_name, student_id, faculty_id) VALUES('IA1603', 1, 1);
```
# Updating data

``` sql
UPDATE students 
SET student_fname = 'Griffin' , student_lname = 'Stue';
```

# Top 10 students 

``` sql
    SELECT student_fname AS name, AVG(mark) AS avg_mark 
    FROM `marks` 
    LEFT JOIN students ON marks.student_id = students.student_id
    GROUP BY marks.student_id
    ORDER BY avg_mark DESC
    LIMIT 10
```
# Top students per subject

``` sql
SELECT subjects.subject_name AS subject_name, students.student_fname AS student_fame
	FROM (SELECT student_id,  
		
          @currcount := IF(@subject_id = subject_id, @currcount + 1, 1) AS rank,
    	  @subject_id := subject_id AS subject_id 
        
          FROM (SELECT subject_id, student_id, AVG(`mark`) AS avg_mark 
              FROM marks 
              GROUP BY subject_id, student_id 
              ORDER BY subject_id, avg_mark DESC) AS temp_table
   	    
          CROSS JOIN (SELECT @subject_id := NULL) var_setter
		  HAVING rank = 1) AS temp_result 
          
	LEFT JOIN students ON temp_result.student_id = students.student_id
  LEFT JOIN subjects ON temp_result.subject_id = subjects.subject_id
  ```
  # List of teachers who teach to special students
  
  ``` sql
  SELECT DISTINCT students.student_fname AS student_fname, subjects.teacher_id AS teacher FROM marks
    LEFT JOIN students ON marks.student_id = students.student_id
    LEFT JOIN subjects ON marks.subject_id = marks.mark
    WHERE marks.student_id = 4
  ```
