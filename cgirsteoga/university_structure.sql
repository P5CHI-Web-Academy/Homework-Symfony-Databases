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
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_changed` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_group_faculty1_idx` (`faculty_id`),
  CONSTRAINT `fk_group_faculty1` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,'IA',1,'2018-04-17 16:37:25',NULL),(2,'IM',1,'2018-04-17 16:37:47',NULL);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_changed` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_course_faculty1_idx` (`faculty_id`),
  KEY `fk_course_teacher1_idx` (`teacher_id`),
  CONSTRAINT `fk_course_faculty1` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_course_teacher1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'Math',1,1,'2018-04-11 18:29:06',NULL),(2,'Programing',1,2,'2018-04-11 18:29:14',NULL),(3,'Project Management',1,3,'2018-04-17 16:44:28',NULL);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `exam_date` datetime NOT NULL,
  `course_id` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_changed` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_exam_course1_idx` (`course_id`),
  CONSTRAINT `fk_exam_course1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_changed` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (1,'Computer science','2018-04-17 16:35:48',NULL);
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mark`
--

DROP TABLE IF EXISTS `mark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(4,2) NOT NULL,
  `stundent_id` int(11) NOT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_mark_stundent1_idx` (`stundent_id`),
  KEY `fk_mark_exam1_idx` (`exam_id`),
  KEY `fk_mark_course1_idx` (`course_id`),
  CONSTRAINT `fk_mark_course1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mark_exam1` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mark_stundent` FOREIGN KEY (`stundent_id`) REFERENCES `stundent` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mark`
--

LOCK TABLES `mark` WRITE;
/*!40000 ALTER TABLE `mark` DISABLE KEYS */;
INSERT INTO `mark` VALUES (1,5.00,1,NULL,1,'2018-04-11 18:31:28'),(2,10.00,1,NULL,1,'2018-04-11 18:32:46'),(3,8.00,1,NULL,1,'2018-04-11 18:32:46'),(4,9.00,1,NULL,1,'2018-04-11 18:32:46'),(5,9.00,2,NULL,1,'2018-04-11 18:33:27'),(6,5.00,2,NULL,1,'2018-04-11 18:33:27'),(7,6.00,2,NULL,1,'2018-04-11 18:33:27'),(8,9.00,3,NULL,2,'2018-04-17 17:03:31'),(9,6.00,3,NULL,2,'2018-04-17 17:03:31'),(10,7.00,3,NULL,2,'2018-04-17 17:03:31'),(11,5.00,3,NULL,2,'2018-04-17 17:03:31'),(12,6.00,4,NULL,2,'2018-04-17 17:03:31'),(13,7.00,4,NULL,2,'2018-04-17 17:03:31'),(14,5.00,4,NULL,2,'2018-04-17 17:03:31'),(15,9.00,4,NULL,2,'2018-04-17 17:03:31'),(16,5.00,4,NULL,2,'2018-04-17 17:03:31'),(17,6.00,4,NULL,2,'2018-04-17 17:03:31'),(18,6.00,1,NULL,3,'2018-04-17 17:15:28'),(19,7.00,2,NULL,3,'2018-04-17 17:15:28'),(20,5.00,3,NULL,3,'2018-04-17 17:15:28'),(21,8.00,4,NULL,3,'2018-04-17 17:15:28');
/*!40000 ALTER TABLE `mark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stundent`
--

DROP TABLE IF EXISTS `stundent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stundent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(60) DEFAULT NULL,
  `last_name` varchar(60) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `birth_day` date DEFAULT NULL,
  `start_year` int(11) DEFAULT NULL,
  `end_year` int(11) DEFAULT NULL,
  `class_id` int(11) NOT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_changed` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stundent_class1_idx` (`class_id`),
  CONSTRAINT `fk_stundent_class1` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stundent`
--

LOCK TABLES `stundent` WRITE;
/*!40000 ALTER TABLE `stundent` DISABLE KEYS */;
INSERT INTO `stundent` VALUES (1,'John','Doe','john@mail.com','bd. Stefan cel Mare  1, Chisinau','1995-01-01',2015,2018,1,'Male','2018-04-11 18:27:53',NULL),(2,'John 1','Doe 1','john1@mail.com','bd. Stefan cel Mare  1, Chisinau','1995-01-01',2015,2018,1,'Male','2018-04-11 18:28:04',NULL),(3,'John 2','Doe 2','john2@mail.com','bd. Stefan cel Mare  1, Chisinau','1995-01-01',2015,2018,2,'Male','2018-04-11 18:28:14',NULL),(4,'John 3','Doe 3','john3@mail.com','bd. Stefan cel Mare  1, Chisinau','1995-01-01',2015,2018,2,'Male','2018-04-17 16:58:21',NULL);
/*!40000 ALTER TABLE `stundent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stundent_has_course`
--

DROP TABLE IF EXISTS `stundent_has_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stundent_has_course` (
  `stundent_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`stundent_id`,`course_id`),
  KEY `fk_stundent_has_course_course1_idx` (`course_id`),
  KEY `fk_stundent_has_course_stundent1_idx` (`stundent_id`),
  CONSTRAINT `fk_stundent_has_course_course1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stundent_has_course_stundent1` FOREIGN KEY (`stundent_id`) REFERENCES `stundent` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stundent_has_course`
--

LOCK TABLES `stundent_has_course` WRITE;
/*!40000 ALTER TABLE `stundent_has_course` DISABLE KEYS */;
INSERT INTO `stundent_has_course` VALUES (1,1),(1,2),(1,3),(2,1),(2,2),(2,3),(3,1),(3,2),(3,3),(4,1),(4,2),(4,3);
/*!40000 ALTER TABLE `stundent_has_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(60) DEFAULT NULL,
  `last_name` varchar(60) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_changed` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1,'Teacher','One','one@mail.com','2018-04-17 16:55:49',NULL),(2,'Teacher','Two','two@mail.com','2018-04-17 16:55:49',NULL),(3,'Teacher','Three','three@mail.com','2018-04-17 16:56:51',NULL);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'university'
--

--
-- Dumping routines for database 'university'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
