/*
SQLyog Ultimate v10.42 
MySQL - 5.7.17-0ubuntu0.16.04.2 : Database - Homework
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`Homework` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `Homework`;

/*Table structure for table `Departments` */

DROP TABLE IF EXISTS `Departments`;

CREATE TABLE `Departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `faculty_id` (`faculty_id`),
  CONSTRAINT `faculty_id` FOREIGN KEY (`faculty_id`) REFERENCES `Faculties` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `Departments` */

insert  into `Departments`(`id`,`name`,`faculty_id`) values (1,'Informatics',1),(2,'Applied informatics',1),(3,'Mathematics',1);

/*Table structure for table `Faculties` */

DROP TABLE IF EXISTS `Faculties`;

CREATE TABLE `Faculties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `Faculties` */

insert  into `Faculties`(`id`,`name`) values (1,'Faculty of Mathematics and Computer Science');

/*Table structure for table `Lectors` */

DROP TABLE IF EXISTS `Lectors`;

CREATE TABLE `Lectors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(128) NOT NULL,
  `last_name` varchar(128) NOT NULL,
  `patronymic` varchar(128) NOT NULL,
  `faculty_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lectors_faculty_id` (`faculty_id`),
  KEY `lectors_subject_id` (`subject_id`),
  CONSTRAINT `lectors_faculty_id` FOREIGN KEY (`faculty_id`) REFERENCES `Faculties` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `lectors_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `Subjects` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `Lectors` */

insert  into `Lectors`(`id`,`first_name`,`last_name`,`patronymic`,`faculty_id`,`subject_id`) values (1,'fname1','lname1','pname1',1,1),(2,'fname2','lname2','pname2',1,3),(3,'fname3','lname3','pname3',1,3);

/*Table structure for table `Marks` */

DROP TABLE IF EXISTS `Marks`;

CREATE TABLE `Marks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `value` int(2) unsigned NOT NULL,
  `is_exam` tinyint(1) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `certificates_student_id` (`student_id`),
  KEY `certificates_subject_id` (`subject_id`),
  CONSTRAINT `certificates_student_id` FOREIGN KEY (`student_id`) REFERENCES `Students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `certificates_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `Subjects` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `Marks` */

insert  into `Marks`(`id`,`date`,`value`,`is_exam`,`student_id`,`subject_id`) values (1,'2018-03-30',8,0,1,1),(2,'2018-03-28',9,0,1,2),(3,'2018-03-23',10,0,1,3);

/*Table structure for table `Students` */

DROP TABLE IF EXISTS `Students`;

CREATE TABLE `Students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `patronymic` varchar(64) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `faculty_id` int(11) DEFAULT NULL,
  `date_admission` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `students_department_id` (`department_id`),
  KEY `students_faculty_id` (`faculty_id`),
  CONSTRAINT `students_department_id` FOREIGN KEY (`department_id`) REFERENCES `Departments` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `students_faculty_id` FOREIGN KEY (`faculty_id`) REFERENCES `Faculties` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `Students` */

insert  into `Students`(`id`,`first_name`,`last_name`,`patronymic`,`department_id`,`faculty_id`,`date_admission`) values (1,'fname1','lname1','pname1',2,1,'2017-09-01'),(2,'fname2','lname2','pname2',1,1,'2016-09-01'),(3,'fname3','lname3','pname3',3,1,'2017-09-01'),(4,'fname4','lname4','pname4',2,1,'2009-09-01');

/*Table structure for table `Subjects` */

DROP TABLE IF EXISTS `Subjects`;

CREATE TABLE `Subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `Subjects` */

insert  into `Subjects`(`id`,`name`) values (1,'Computer architecture and assembler languages'),(2,'Software Development'),(3,'Parallel algorthms');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
