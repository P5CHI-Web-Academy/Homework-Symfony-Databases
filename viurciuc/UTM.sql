-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Апр 19 2018 г., 00:59
-- Версия сервера: 5.7.21-0ubuntu0.17.10.1
-- Версия PHP: 7.1.15-0ubuntu0.17.10.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `UTM`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Courses`
--

CREATE TABLE `Courses` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `teacher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Courses`
--

INSERT INTO `Courses` (`id`, `name`, `teacher_id`) VALUES
(1, 'Curs-1', 1),
(2, 'Curs-2', 2),
(3, 'Curs-3', 3),
(4, 'Curs-4', 4),
(5, 'Curs-5', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `Faculties`
--

CREATE TABLE `Faculties` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `abbreviation` varchar(10) NOT NULL,
  `info` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Faculties`
--

INSERT INTO `Faculties` (`id`, `name`, `abbreviation`, `info`) VALUES
(1, 'Facultatea Electronică și Telecomunicații', 'FET', 'info...'),
(2, 'Facultatea Energetică și Inginerie Electrică', 'FEIE', 'info...'),
(3, 'Facultatea Calculatoare, Informatică şi Microelectronică', 'FCIM', 'info...');

-- --------------------------------------------------------

--
-- Структура таблицы `Groups`
--

CREATE TABLE `Groups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `info` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Groups`
--

INSERT INTO `Groups` (`id`, `name`, `faculty_id`, `info`) VALUES
(1, 'ET-16', 1, 'info...'),
(2, 'EIE-16', 2, 'info...'),
(3, 'TI-16', 3, 'info...');

-- --------------------------------------------------------

--
-- Структура таблицы `Marks`
--

CREATE TABLE `Marks` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `type` text NOT NULL,
  `mark` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Marks`
--

INSERT INTO `Marks` (`id`, `student_id`, `course_id`, `type`, `mark`) VALUES
(1, 1, 1, 'course', 6),
(2, 2, 1, 'course', 8),
(3, 3, 1, 'course', 10),
(4, 4, 1, 'course', 9),
(5, 5, 1, 'course', 6),
(6, 6, 2, 'course', 7),
(7, 7, 2, 'course', 8),
(8, 8, 2, 'course', 8),
(9, 9, 2, 'course', 9),
(10, 10, 2, 'course', 6),
(11, 1, 1, 'exam', 7),
(12, 2, 1, 'exam', 7),
(13, 4, 3, 'course', 8),
(14, 3, 3, 'course', 8),
(15, 4, 3, 'course', 9),
(16, 4, 3, 'course', 6),
(17, 6, 3, 'course', 10),
(18, 6, 3, 'course', 6);

-- --------------------------------------------------------

--
-- Структура таблицы `Students`
--

CREATE TABLE `Students` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `info` text NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Students`
--

INSERT INTO `Students` (`id`, `name`, `info`, `faculty_id`, `group_id`) VALUES
(1, 'Vladislav Iurciuc', 'horoshii', 1, 3),
(2, 'Student2', 'info', 1, 2),
(3, 'Student3', 'info', 2, 1),
(4, 'Student4', 'info', 2, 3),
(5, 'Student5', 'info', 3, 2),
(6, 'Student6', 'info', 3, 1),
(7, 'Student7', 'info', 3, 3),
(8, 'Student8', 'info', 1, 1),
(9, 'Student9', 'info', 1, 3),
(10, 'Student10', 'info', 2, 1),
(11, 'Student11', 'info', 3, 1),
(12, 'Student 13', 'info', 1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `Students_courses`
--

CREATE TABLE `Students_courses` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Students_courses`
--

INSERT INTO `Students_courses` (`id`, `student_id`, `course_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `Teachers`
--

CREATE TABLE `Teachers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Teachers`
--

INSERT INTO `Teachers` (`id`, `name`) VALUES
(4, 'Balmus Ion'),
(1, 'Falico Nicolai'),
(5, 'Fedorov Ion'),
(2, 'Melnic Fedor'),
(3, 'Orlov Viktor');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Courses`
--
ALTER TABLE `Courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `un_course` (`name`,`teacher_id`),
  ADD KEY `fk_courses_teacher_id` (`teacher_id`);

--
-- Индексы таблицы `Faculties`
--
ALTER TABLE `Faculties`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `un_faculties` (`name`);

--
-- Индексы таблицы `Groups`
--
ALTER TABLE `Groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `un_groups` (`name`),
  ADD KEY `fk_groups_faculty_id` (`faculty_id`);

--
-- Индексы таблицы `Marks`
--
ALTER TABLE `Marks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `del_marks` (`mark`),
  ADD KEY `fk_marks_student_id` (`student_id`),
  ADD KEY `fk_marks_course_id` (`course_id`);

--
-- Индексы таблицы `Students`
--
ALTER TABLE `Students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `un_students` (`name`),
  ADD KEY `fk_students_faculty_id` (`faculty_id`),
  ADD KEY `fk_students_group_id` (`group_id`);

--
-- Индексы таблицы `Students_courses`
--
ALTER TABLE `Students_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_students_courses_student_id` (`student_id`),
  ADD KEY `fk_students_courses_course_id` (`course_id`);

--
-- Индексы таблицы `Teachers`
--
ALTER TABLE `Teachers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `un_students` (`name`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Courses`
--
ALTER TABLE `Courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `Faculties`
--
ALTER TABLE `Faculties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `Groups`
--
ALTER TABLE `Groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `Marks`
--
ALTER TABLE `Marks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT для таблицы `Students`
--
ALTER TABLE `Students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT для таблицы `Students_courses`
--
ALTER TABLE `Students_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `Teachers`
--
ALTER TABLE `Teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Courses`
--
ALTER TABLE `Courses`
  ADD CONSTRAINT `fk_courses_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `Teachers` (`id`);

--
-- Ограничения внешнего ключа таблицы `Groups`
--
ALTER TABLE `Groups`
  ADD CONSTRAINT `fk_groups_faculty_id` FOREIGN KEY (`faculty_id`) REFERENCES `Faculties` (`id`);

--
-- Ограничения внешнего ключа таблицы `Marks`
--
ALTER TABLE `Marks`
  ADD CONSTRAINT `fk_marks_course_id` FOREIGN KEY (`course_id`) REFERENCES `Courses` (`id`),
  ADD CONSTRAINT `fk_marks_student_id` FOREIGN KEY (`student_id`) REFERENCES `Students` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Students`
--
ALTER TABLE `Students`
  ADD CONSTRAINT `fk_students_faculty_id` FOREIGN KEY (`faculty_id`) REFERENCES `Faculties` (`id`),
  ADD CONSTRAINT `fk_students_group_id` FOREIGN KEY (`group_id`) REFERENCES `Groups` (`id`);

--
-- Ограничения внешнего ключа таблицы `Students_courses`
--
ALTER TABLE `Students_courses`
  ADD CONSTRAINT `fk_students_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `Courses` (`id`),
  ADD CONSTRAINT `fk_students_courses_student_id` FOREIGN KEY (`student_id`) REFERENCES `Students` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
