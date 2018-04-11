# Creating tables 

> CREATE TABLE teachers (
teacher_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
teacher_fname VARCHAR(25) NOT NULL,
teacher_lname VARCHAR(25) NOT NULL
);

> CREATE TABLE students (
student_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
student_fname VARCHAR(25) NOT NULL,
student_lname VARCHAR(25) NOT NULL
);

> CREATE TABLE subjects (
subject_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
subject_name VARCHAR(25) NOT NULL,
teacher_id INT NOT NULL,
CONSTRAINT FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);

> CREATE TABLE marks (
subject_id INT NOT NULL,
student_id INT NOT NULL,
mark INT NOT NULL,
CONSTRAINT FOREIGN KEY (subject_id) REFERENCES subjects(subject_id),
CONSTRAINT FOREIGN KEY (student_id) REFERENCES students(student_id)
);

> CREATE TABLE faculties ( 
faculty_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
faculty_name VARCHAR(25) 
);

> CREATE TABLE groups (
group_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
group_name VARCHAR(25) NOT NULL,
student_id INT NOT NULL,
faculty_id INT NOT NULL,
CONSTRAINT FOREIGN KEY(student_id) REFERENCES students(student_id),
CONSTRAINT FOREIGN KEY(faculty_id) REFERENCES faculties(faculty_id)
);

# Inserting data

+ INSERT INTO students(student_fname,student_lname) VALUES ('Johnson','Alex');
+ INSERT INTO teachers(teacher_fname,teacher_lname) VALUES ('Parker','Peter');
+ INSERT INTO subjects (subject_name,teacher_id) VALUES ('Math', 1);
+ INSERT INTO marks(subject_id, student_id, mark) VALUES (1, 1, 8); 
+ INSERT INTO faculties(faculty_name) VALUES('Math_and_Informatics');
+ INSERT INTO groups(group_name, student_id, faculty_id) VALUES('IA1603', 1, 1);

# Updating data

UPDATE students 
SET student_fname = 'Griffin' , student_lname = 'Stue';
