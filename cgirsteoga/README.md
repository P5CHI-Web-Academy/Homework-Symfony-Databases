# Homework-Symfony-Databases

## Homework
#### Cereri
- Inserarea unui student
```sql
INSERT INTO `stundent` (`first_name`, `last_name`, `email`, `address`, `birth_day`, `start_year`, `end_year`, `class_id`, `gender`)
  VALUES ('John', 'Doe', 'john@mail.com', 'bd. Stefan cel Mare  1, Chisinau', '1995-01-01', 2015, 2018, 1, 'Male');
```
- Afișarea detaliilor despre un student
```sql
SELECT `id`, `first_name`, `last_name`, `email`, `address`, `birth_day`, `start_year`, `end_year`, `class_id`, `gender`, `date_created`, `date_changed` FROM `stundent`;
```
- Modificarea unui student
```sql
UPDATE `stundent` SET `address` = 'new address' WHERE `id` = 1;
```
- Afișarea top 10 studenți cu cea mai bună notă medie
```sql
SELECT
  s.*,
  AVG(m.value) AS average
FROM stundent s
  INNER JOIN mark m
    ON s.id = m.stundent_id
GROUP BY s.id
ORDER BY average DESC LIMIT 10;
```
- Top studenți per materie
```sql

```
- Afișarea listei de profesori care predau unui anumit student
```sql
SELECT
  t.*
FROM stundent s
  INNER JOIN stundent_has_course shc
    ON s.id = shc.stundent_id
  INNER JOIN course c
    ON shc.course_id = c.id
  INNER JOIN teacher t
    ON c.teacher_id = t.id
WHERE s.id = 1;
```