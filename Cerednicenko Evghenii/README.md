# SQL queries

## Добавление студента

```sql
Insert  into Students(`id`,`first_name`,`last_name`,`patronymic`,`department_id`,`faculty_id`,`date_admission`) values (1,'fname1','lname1','pname1',2,1,'2017-09-01');
```

## Вывод информации о студенте
```sql
SELECT * FROM Students WHERE id = 1;
```

## Изменение данных о студенте
```sql
UPDATE Students SET first_name='fname5' WHERE id=1;
```

## Вывод 10 лучших учеников с наивысшим средним баллом
```sql
SELECT s.*, AVG(m.value) AS average
FROM Students s
INNER JOIN Marks m
ON s.id = m.student_id
GROUP BY s.id
ORDER BY average DESC LIMIT 10;
```

## Фамилии преподавателей, обучающих конкретного студента
```sql
SELECT DISTINCT s.`last_name` AS s_name, l.`last_name` AS l_name 
FROM Students AS s
LEFT JOIN Marks AS m ON m.student_id = s.id
LEFT JOIN Lectors AS l ON l.`subject_id` = m.id
WHERE s.id = 4;
```