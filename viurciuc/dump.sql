-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Апр 14 2018 г., 01:57
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
CREATE DATABASE IF NOT EXISTS `UTM` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `UTM`;

-- --------------------------------------------------------

--
-- Структура таблицы `Courses`
--

CREATE TABLE IF NOT EXISTS `Courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `un_course` (`name`,`teacher_id`),
  KEY `fk_courses_teacher_id` (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Courses`
--

INSERT INTO `Courses` VALUES(1, 'Curs-1', 1);
INSERT INTO `Courses` VALUES(2, 'Curs-2', 2);
INSERT INTO `Courses` VALUES(3, 'Curs-3', 3);
INSERT INTO `Courses` VALUES(4, 'Curs-4', 4);
INSERT INTO `Courses` VALUES(5, 'Curs-5', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `Faculties`
--

CREATE TABLE IF NOT EXISTS `Faculties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `abbreviation` varchar(10) NOT NULL,
  `info` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `un_faculties` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Faculties`
--

INSERT INTO `Faculties` VALUES(1, 'Facultatea Electronică și Telecomunicații', 'FET', 'info...');
INSERT INTO `Faculties` VALUES(2, 'Facultatea Energetică și Inginerie Electrică', 'FEIE', 'info...');
INSERT INTO `Faculties` VALUES(3, 'Facultatea Calculatoare, Informatică şi Microelectronică', 'FCIM', 'info...');

-- --------------------------------------------------------

--
-- Структура таблицы `Groups`
--

CREATE TABLE IF NOT EXISTS `Groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `info` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `un_groups` (`name`),
  KEY `fk_groups_faculty_id` (`faculty_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Groups`
--

INSERT INTO `Groups` VALUES(1, 'ET-16', 1, 'info...');
INSERT INTO `Groups` VALUES(2, 'EIE-16', 2, 'info...');
INSERT INTO `Groups` VALUES(3, 'TI-16', 3, 'info...');

-- --------------------------------------------------------

--
-- Структура таблицы `Marks`
--

CREATE TABLE IF NOT EXISTS `Marks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `type` text NOT NULL,
  `mark` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `del_marks` (`mark`),
  KEY `fk_marks_student_id` (`student_id`),
  KEY `fk_marks_course_id` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Marks`
--

INSERT INTO `Marks` VALUES(1, 1, 1, 'course', 6);
INSERT INTO `Marks` VALUES(2, 2, 1, 'course', 8);
INSERT INTO `Marks` VALUES(3, 3, 1, 'course', 10);
INSERT INTO `Marks` VALUES(4, 4, 1, 'course', 9);
INSERT INTO `Marks` VALUES(5, 5, 1, 'course', 6);
INSERT INTO `Marks` VALUES(6, 6, 2, 'course', 7);
INSERT INTO `Marks` VALUES(7, 7, 2, 'course', 8);
INSERT INTO `Marks` VALUES(8, 8, 2, 'course', 8);
INSERT INTO `Marks` VALUES(9, 9, 2, 'course', 9);
INSERT INTO `Marks` VALUES(10, 10, 2, 'course', 6);
INSERT INTO `Marks` VALUES(11, 1, 1, 'exam', 7);
INSERT INTO `Marks` VALUES(12, 2, 1, 'exam', 7);
INSERT INTO `Marks` VALUES(13, 4, 3, 'course', 8);
INSERT INTO `Marks` VALUES(14, 3, 3, 'course', 8);
INSERT INTO `Marks` VALUES(15, 4, 3, 'course', 9);
INSERT INTO `Marks` VALUES(16, 4, 3, 'course', 6);
INSERT INTO `Marks` VALUES(17, 6, 3, 'course', 10);
INSERT INTO `Marks` VALUES(18, 6, 3, 'course', 6);

-- --------------------------------------------------------

--
-- Структура таблицы `Students`
--

CREATE TABLE IF NOT EXISTS `Students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `info` text NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `un_students` (`name`),
  KEY `fk_students_faculty_id` (`faculty_id`),
  KEY `fk_students_group_id` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Students`
--

INSERT INTO `Students` VALUES(1, 'Vladislav Iurciuc', 'horoshii', 1, 3);
INSERT INTO `Students` VALUES(2, 'Student2', 'info', 1, 2);
INSERT INTO `Students` VALUES(3, 'Student3', 'info', 2, 1);
INSERT INTO `Students` VALUES(4, 'Student4', 'info', 2, 3);
INSERT INTO `Students` VALUES(5, 'Student5', 'info', 3, 2);
INSERT INTO `Students` VALUES(6, 'Student6', 'info', 3, 1);
INSERT INTO `Students` VALUES(7, 'Student7', 'info', 3, 3);
INSERT INTO `Students` VALUES(8, 'Student8', 'info', 1, 1);
INSERT INTO `Students` VALUES(9, 'Student9', 'info', 1, 3);
INSERT INTO `Students` VALUES(10, 'Student10', 'info', 2, 1);
INSERT INTO `Students` VALUES(11, 'Student11', 'info', 3, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `Teachers`
--

CREATE TABLE IF NOT EXISTS `Teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `un_students` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Teachers`
--

INSERT INTO `Teachers` VALUES(4, 'Balmus Ion');
INSERT INTO `Teachers` VALUES(1, 'Falico Nicolai');
INSERT INTO `Teachers` VALUES(5, 'Fedorov Ion');
INSERT INTO `Teachers` VALUES(2, 'Melnic Fedor');
INSERT INTO `Teachers` VALUES(3, 'Orlov Viktor');

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
