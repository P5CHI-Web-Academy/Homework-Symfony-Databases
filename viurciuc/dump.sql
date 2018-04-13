-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: UTM
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.17.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Courses`
--

DROP TABLE IF EXISTS `Courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_courses_teacher_id` (`teacher_id`),
  CONSTRAINT `fk_courses_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `Teachers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Courses`
--

LOCK TABLES `Courses` WRITE;
/*!40000 ALTER TABLE `Courses` DISABLE KEYS */;
INSERT INTO `Courses` VALUES (1,'Curs-1',1),(2,'Curs-2',2),(3,'Curs-3',3),(4,'Curs-4',4),(5,'Curs-5',5);
/*!40000 ALTER TABLE `Courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Faculties`
--

DROP TABLE IF EXISTS `Faculties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Faculties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `abbreviation` text NOT NULL,
  `info` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Faculties`
--

LOCK TABLES `Faculties` WRITE;
/*!40000 ALTER TABLE `Faculties` DISABLE KEYS */;
INSERT INTO `Faculties` VALUES (1,'Facultatea Electronică și Telecomunicații','FET','info...'),(2,'Facultatea Energetică și Inginerie Electrică','FEIE','info...'),(3,'Facultatea Calculatoare, Informatică şi Microelectronică','FCIM','info...');
/*!40000 ALTER TABLE `Faculties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Groups`
--

DROP TABLE IF EXISTS `Groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `info` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_groups_faculty_id` (`faculty_id`),
  CONSTRAINT `fk_groups_faculty_id` FOREIGN KEY (`faculty_id`) REFERENCES `Faculties` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Groups`
--

LOCK TABLES `Groups` WRITE;
/*!40000 ALTER TABLE `Groups` DISABLE KEYS */;
INSERT INTO `Groups` VALUES (1,'ET-16',1,'info...'),(2,'EIE-16',2,'info...'),(3,'TI-16',3,'info...');
/*!40000 ALTER TABLE `Groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Marks`
--

DROP TABLE IF EXISTS `Marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Marks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `type` text NOT NULL,
  `mark` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `del_marks` (`mark`),
  KEY `fk_marks_student_id` (`student_id`),
  KEY `fk_marks_course_id` (`course_id`),
  CONSTRAINT `fk_marks_course_id` FOREIGN KEY (`course_id`) REFERENCES `Courses` (`id`),
  CONSTRAINT `fk_marks_student_id` FOREIGN KEY (`student_id`) REFERENCES `Students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Marks`
--

LOCK TABLES `Marks` WRITE;
/*!40000 ALTER TABLE `Marks` DISABLE KEYS */;
INSERT INTO `Marks` VALUES (1,1,1,'course',6),(2,2,1,'course',8),(3,3,1,'course',10),(4,4,1,'course',9),(5,5,1,'course',6),(6,6,2,'course',7),(7,7,2,'course',8),(8,8,2,'course',8),(9,9,2,'course',9),(10,10,2,'course',6),(11,1,1,'exam',7),(12,2,1,'exam',7),(13,4,3,'course',8),(14,3,3,'course',8),(15,4,3,'course',9),(16,4,3,'course',6),(17,6,3,'course',10),(18,6,3,'course',6);
/*!40000 ALTER TABLE `Marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Students`
--

DROP TABLE IF EXISTS `Students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `info` text NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_students_faculty_id` (`faculty_id`),
  KEY `fk_students_group_id` (`group_id`),
  CONSTRAINT `fk_students_faculty_id` FOREIGN KEY (`faculty_id`) REFERENCES `Faculties` (`id`),
  CONSTRAINT `fk_students_group_id` FOREIGN KEY (`group_id`) REFERENCES `Groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Students`
--

LOCK TABLES `Students` WRITE;
/*!40000 ALTER TABLE `Students` DISABLE KEYS */;
INSERT INTO `Students` VALUES (1,'Vladislav Iurciuc','horoshii',1,3),(2,'Student2','info',1,2),(3,'Student3','info',2,1),(4,'Student4','info',2,3),(5,'Student5','info',3,2),(6,'Student6','info',3,1),(7,'Student7','info',3,3),(8,'Student8','info',1,1),(9,'Student9','info',1,3),(10,'Student10','info',2,1),(11,'Student11','info',3,1);
/*!40000 ALTER TABLE `Students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Teachers`
--

DROP TABLE IF EXISTS `Teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teachers`
--

LOCK TABLES `Teachers` WRITE;
/*!40000 ALTER TABLE `Teachers` DISABLE KEYS */;
INSERT INTO `Teachers` VALUES (1,'Falico Nicolai'),(2,'Melnic Fedor'),(3,'Orlov Viktor'),(4,'Balmus Ion'),(5,'Fedorov Ion');
/*!40000 ALTER TABLE `Teachers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-14  1:26:04
