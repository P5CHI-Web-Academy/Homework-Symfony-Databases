-- phpMyAdmin SQL Dump
-- version 4.7.8
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 13, 2018 at 12:14 AM
-- Server version: 5.7.21-0ubuntu0.16.04.1
-- PHP Version: 7.2.4-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vbruma_university`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `teacher` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `name`, `teacher`) VALUES
(3, 'Algorithms', 'Teacher 3'),
(1, 'Mathematics', 'Teacher 1'),
(2, 'Mathematics', 'Teacher 2');

-- --------------------------------------------------------

--
-- Table structure for table `faculties`
--

CREATE TABLE `faculties` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `faculties`
--

INSERT INTO `faculties` (`id`, `name`, `abbreviation`) VALUES
(1, 'Faculty of Computers, Informatics and Microelectronics', 'FCIM'),
(2, 'Faculty of Electronics and Telecommunications', 'FET'),
(3, 'Faculty of Mechanical Engineering and Transport', 'FMET');

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `id` int(10) UNSIGNED NOT NULL,
  `students_id` int(10) UNSIGNED NOT NULL,
  `courses_id` int(10) UNSIGNED NOT NULL,
  `value` tinyint(3) UNSIGNED NOT NULL,
  `type` enum('course','exam') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'course'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `faculties_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `faculties_id`) VALUES
(1, 'TI-071', 1),
(2, 'TI-072', 1),
(3, 'TI-073', 1);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci,
  `groups_id` int(10) UNSIGNED NOT NULL,
  `faculties_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `bio`, `groups_id`, `faculties_id`) VALUES
(1, 'Student 1', 'Some bio 11', 1, 1),
(2, 'Student 2', 'Some bio 2', 1, 1),
(3, 'Student 3', 'Some bio 3', 1, 1),
(4, 'Student 4', 'Some bio 4', 2, 1),
(5, 'Student 5', 'Some bio 5', 2, 1),
(6, 'Student 6', 'Some bio 6', 2, 1),
(7, 'Student 7', 'Some bio 7', 3, 1),
(8, 'Student 8', 'Some bio 8', 3, 1),
(9, 'Student 9', 'Some bio 9', 3, 1),
(10, 'Student 10', 'Some bio 10', 3, 1);

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`id`, `students_id`, `courses_id`, `value`, `type`) VALUES
(1, 1, 1, 6, 'course'),
(2, 2, 1, 7, 'course'),
(3, 3, 1, 8, 'course'),
(4, 4, 1, 9, 'course'),
(5, 5, 1, 10, 'course'),
(6, 6, 1, 6, 'course'),
(7, 7, 1, 7, 'course'),
(8, 8, 1, 8, 'course'),
(9, 9, 1, 9, 'course'),
(10, 10, 1, 10, 'course'),
(11, 1, 1, 8, 'exam'),
(12, 2, 1, 9, 'exam'),
(13, 4, 3, 6, 'course'),
(14, 3, 1, 7, 'course'),
(15, 4, 1, 7, 'course'),
(16, 4, 3, 8, 'course'),
(17, 6, 3, 10, 'course'),
(18, 6, 3, 6, 'course');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_course` (`name`,`teacher`);

--
-- Indexes for table `faculties`
--
ALTER TABLE `faculties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_grades_students_id` (`students_id`),
  ADD KEY `fk_grades_courses_id` (`courses_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `faculties_id` (`faculties_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `fk_student_groups_id` (`groups_id`),
  ADD KEY `fk_student_faculties_id` (`faculties_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `faculties`
--
ALTER TABLE `faculties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `fk_grades_courses_id` FOREIGN KEY (`courses_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `fk_grades_students_id` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`faculties_id`) REFERENCES `faculties` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `fk_student_faculties_id` FOREIGN KEY (`faculties_id`) REFERENCES `faculties` (`id`),
  ADD CONSTRAINT `fk_student_groups_id` FOREIGN KEY (`groups_id`) REFERENCES `groups` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
