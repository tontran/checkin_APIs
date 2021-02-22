-- MySQL dump 10.13  Distrib 8.0.18, for macos10.14 (x86_64)
--
-- Host: localhost    Database: vannails_checkin
-- ------------------------------------------------------
-- Server version	5.7.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_customuser'),(22,'Can change user',6,'change_customuser'),(23,'Can delete user',6,'delete_customuser'),(24,'Can view user',6,'view_customuser'),(25,'Can add Token',7,'add_token'),(26,'Can change Token',7,'change_token'),(27,'Can delete Token',7,'delete_token'),(28,'Can view Token',7,'view_token'),(29,'Can add token',8,'add_tokenproxy'),(30,'Can change token',8,'change_tokenproxy'),(31,'Can delete token',8,'delete_tokenproxy'),(32,'Can view token',8,'view_tokenproxy'),(33,'Can add service',9,'add_service'),(34,'Can change service',9,'change_service'),(35,'Can delete service',9,'delete_service'),(36,'Can view service',9,'view_service'),(37,'Can add staff',10,'add_staff'),(38,'Can change staff',10,'change_staff'),(39,'Can delete staff',10,'delete_staff'),(40,'Can view staff',10,'view_staff'),(41,'Can add review',11,'add_review'),(42,'Can change review',11,'change_review'),(43,'Can delete review',11,'delete_review'),(44,'Can view review',11,'view_review'),(45,'Can add location',12,'add_location'),(46,'Can change location',12,'change_location'),(47,'Can delete location',12,'delete_location'),(48,'Can view location',12,'view_location');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_checkin_api_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `checkin_api_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('084d0ef5888f27a2d902bb65a31f967e5aa621f6','2020-11-15 19:20:21.471964',2),('35bfaaa644cb87dbcd63aea008498c32c1c05826','2020-11-15 19:20:18.534421',3),('55a551efefa8f2f67e7eda6121d7156af6c90af1','2020-12-03 08:09:11.542928',13),('63065291047e3187ce249ffe16af0a2968d3c52a','2020-11-25 04:16:35.421158',7),('768dd0446f4cbea948dec5d59628fc8746196b85','2020-12-03 05:13:37.304569',10),('8157aacb51798d246a5c0e34bbbb9a23272eb8cc','2020-11-26 06:31:35.351003',5),('876ced8f7870f5f55f6f6108f95b07773d2e7549','2020-12-01 05:53:32.511462',9),('8ab8b68d95060e96be2d563901796d1ba9d7fd6e','2020-11-15 19:20:14.674393',4),('97cae147ae0967d422f8d7ec65821f80a1912616','2020-12-03 06:58:40.837011',12),('a761a75afe0d1ffde377a9ffe68e865a8f64c9d1','2020-12-03 05:47:58.263600',6),('d97f064dbe5e7f209038a2a85b948ca1efd659e5','2020-11-15 19:20:08.931725',1),('e289f4d86c6a2f9c98c8c1be2c39e79ef9379429','2020-12-01 05:57:10.023339',11);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkin_api_customuser`
--

DROP TABLE IF EXISTS `checkin_api_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkin_api_customuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `phone` varchar(31) COLLATE utf8_unicode_ci,
  `is_staff` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkin_api_customuser`
--

LOCK TABLES `checkin_api_customuser` WRITE;
/*!40000 ALTER TABLE `checkin_api_customuser` DISABLE KEYS */;
INSERT INTO `checkin_api_customuser` VALUES (1,'pbkdf2_sha256$216000$nQDkSPeTXTtB$Md2QeU/XmIvusbbKqXDYp6Z4X75IbRhhu9TnJrnozas=','2021-02-14 19:54:31.094125',1,'Admin','Admin',1,'2020-11-06 08:18:57.650860','admin@gmail.com','2001-08-03','+14160981234',1),(2,'pbkdf2_sha256$216000$QEYxpq7ZcQSf$Zwyf6Ow4bjwjDEJeqRdpo6YLBZccVstKUShPqlOGp4s=',NULL,0,'Test','Tester',1,'2020-11-06 13:38:09.442123','test@gmail.com','1987-11-10','+16478921287',0),(3,'pbkdf2_sha256$216000$YBOQZVR2CLBe$1vRfM8XPPjqaeF4+7GLFze01BFfxBaoMrb5M4L8IH3U=','2020-11-06 16:07:39.568094',1,'Haha','Hehe',1,'2020-11-06 16:06:50.794597','haha@gmail.com','1990-01-20','+16419871234',1),(4,'pbkdf2_sha256$216000$XFAvBg3HbweL$DuSVZffKPl5I3Z9j9oWl0h+lFBnCq+FmMNryNFzyhDA=','2021-02-15 19:00:51.753722',0,'Customer 1','Huhu',1,'2020-11-12 05:01:07.978257','cust1@gmail.com','1976-11-12','+16478987711',1),(5,'pbkdf2_sha256$216000$aXCvo0oGcWsg$vPdEhnWvsGpv+luKd2MpHUtX3HH0oQ7yHjACpfwmDjA=',NULL,0,'Hihi','Hihi',1,'2020-11-23 04:21:09.230748','hihi@gmail.com','1989-10-02','+14169998877',0),(6,'pbkdf2_sha256$216000$C5i3kOYMx5hp$6rUP02/cooPfTXOpGpnrOVE825hC0LeRtk32IP0jWaY=',NULL,0,'Huhu','Huhu',1,'2020-11-23 04:32:11.386212','huhu@gmail.com','1990-09-17','+14167779999',0),(7,'pbkdf2_sha256$216000$2dicZ3cBezNq$ULhE68wGS0T5R/U/dXoL2qROYCgXxtbObr1cb/ibYJg=',NULL,0,'Hichic','Hichic',1,'2020-11-25 04:02:07.634857','hichic@gmail.com','1988-01-12','+16473334444',0),(8,'user123456',NULL,0,'','',0,'2020-11-27 06:41:09.613068','testuser@gmail.com',NULL,'',0),(9,'pbkdf2_sha256$216000$zmAnLxhu1CjR$Pus9I9EnQXSEBk351tR6Y3xcGZLJUIljnGzvTIzmWgM=',NULL,0,'Tester 1','Tester',1,'2020-11-29 17:40:33.385906','testing1@gmail.com','1986-03-22','+14167890987',0),(10,'pbkdf2_sha256$216000$SoKA5jdb9T4C$od9RXBamUsm4MinxYtXW/TZfyteHk0pmLwVP/LvJIvU=',NULL,0,'Tester 2','Tester',1,'2020-11-29 17:45:09.399816','testing2@gmail.com','1982-09-12','+14167884322',0),(11,'pbkdf2_sha256$216000$lrIfPybKvtJ1$lZbNVAaTZvy7O9kv6jq8WMGEs+rFLVcQ2UKNo4PYVk4=',NULL,0,'Tester 3','Tester 3',1,'2020-12-01 05:57:09.891301','testing3@gmail.com','1980-02-16','+14378127653',0),(12,'pbkdf2_sha256$216000$dTjsKlo5V7bb$GXa5+ra1Id2Lgk5EugAs5wqQ5P61gCW+rW2/tM01ons=','2020-12-11 20:30:12.383165',0,'Customer','A',1,'2020-12-03 06:58:40.713893','customer_a@gmail.com','1985-06-12','+14167899812',1),(13,'pbkdf2_sha256$216000$7vSqbjvLNL7L$W3AcNjsIu55TjAdLvnCEeIXSrNdkvVNHXDe5ggq9vAU=',NULL,0,'Customer','B',1,'2020-12-03 08:09:11.417929','customer_b@gmail.com','1970-07-21','+14162349123',0);
/*!40000 ALTER TABLE `checkin_api_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkin_api_customuser_groups`
--

DROP TABLE IF EXISTS `checkin_api_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkin_api_customuser_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customuser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `checkin_api_customuser_g_customuser_id_group_id_579c4940_uniq` (`customuser_id`,`group_id`),
  KEY `checkin_api_customuser_groups_group_id_cca884a6_fk_auth_group_id` (`group_id`),
  CONSTRAINT `checkin_api_customus_customuser_id_da456e1e_fk_checkin_a` FOREIGN KEY (`customuser_id`) REFERENCES `checkin_api_customuser` (`id`),
  CONSTRAINT `checkin_api_customuser_groups_group_id_cca884a6_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkin_api_customuser_groups`
--

LOCK TABLES `checkin_api_customuser_groups` WRITE;
/*!40000 ALTER TABLE `checkin_api_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkin_api_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkin_api_customuser_user_permissions`
--

DROP TABLE IF EXISTS `checkin_api_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkin_api_customuser_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customuser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `checkin_api_customuser_u_customuser_id_permission_51c7d23b_uniq` (`customuser_id`,`permission_id`),
  KEY `checkin_api_customus_permission_id_774eb843_fk_auth_perm` (`permission_id`),
  CONSTRAINT `checkin_api_customus_customuser_id_9f8372c8_fk_checkin_a` FOREIGN KEY (`customuser_id`) REFERENCES `checkin_api_customuser` (`id`),
  CONSTRAINT `checkin_api_customus_permission_id_774eb843_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkin_api_customuser_user_permissions`
--

LOCK TABLES `checkin_api_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `checkin_api_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkin_api_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkin_api_location`
--

DROP TABLE IF EXISTS `checkin_api_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkin_api_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(31) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkin_api_location`
--

LOCK TABLES `checkin_api_location` WRITE;
/*!40000 ALTER TABLE `checkin_api_location` DISABLE KEYS */;
INSERT INTO `checkin_api_location` VALUES (1,'Van Nails Jane/Finch','1911 Finch Ave W #31b, North York, ON M3N 2V2','+14166369639','2020-11-12 04:35:35.608661','2020-11-12 04:35:35.608698'),(2,'Van Nails Jane/Sheppard','1943 Sheppard Ave W, North York, ON M3L 1Y8','+14167476245','2020-11-12 04:36:49.136322','2020-11-12 04:36:49.136346'),(3,'Van Nails Keele/Sheppard','3342 Keele St, North York, ON M3J 1L5','+14167928466','2020-11-12 04:38:47.800149','2020-11-12 04:38:47.800174'),(4,'Nails For You Jane/Wilson','2202 Jane St, North York, ON M3M 1A4','+14169011856','2020-11-12 04:43:55.539809','2020-11-12 04:43:55.539835');
/*!40000 ALTER TABLE `checkin_api_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkin_api_review`
--

DROP TABLE IF EXISTS `checkin_api_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkin_api_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `rating` double NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `checkin_api_review_customer_id_83fb0edc_fk_checkin_a` (`customer_id`),
  KEY `checkin_api_review_location_id_4b2d4129_fk_checkin_a` (`location_id`),
  KEY `checkin_api_review_staff_id_46eb5de2_fk_checkin_api_staff_id` (`staff_id`),
  CONSTRAINT `checkin_api_review_customer_id_83fb0edc_fk_checkin_a` FOREIGN KEY (`customer_id`) REFERENCES `checkin_api_customuser` (`id`),
  CONSTRAINT `checkin_api_review_location_id_4b2d4129_fk_checkin_a` FOREIGN KEY (`location_id`) REFERENCES `checkin_api_location` (`id`),
  CONSTRAINT `checkin_api_review_staff_id_46eb5de2_fk_checkin_api_staff_id` FOREIGN KEY (`staff_id`) REFERENCES `checkin_api_staff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkin_api_review`
--

LOCK TABLES `checkin_api_review` WRITE;
/*!40000 ALTER TABLE `checkin_api_review` DISABLE KEYS */;
INSERT INTO `checkin_api_review` VALUES (1,'This is a testing content',4.5,'2020-11-12 04:59:06.044786','2020-11-12 04:59:06.044816',2,1,2),(2,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',4,'2020-12-04 19:46:28.201429','2020-12-04 19:47:08.688630',4,2,2),(3,'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',4.6,'2020-12-04 19:47:36.242855','2020-12-04 19:47:36.242886',7,3,2),(4,'Hihi finally it\'s here',4.9,'2020-12-04 22:17:51.287559','2020-12-04 22:17:51.287638',13,3,2),(5,'Changing review again',4.9,'2020-12-05 04:12:30.471591','2020-12-05 04:17:30.313198',11,4,3),(6,'Hihi finally it\'s here',4.9,'2020-12-16 03:51:11.973807','2020-12-16 03:51:11.973902',13,3,2),(7,'Testing again\r\nThere are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',3.5,'2020-12-16 04:31:29.116632','2020-12-16 04:31:29.116665',3,2,3),(8,'Testing again\r\nThere are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',3.5,'2020-12-16 04:31:36.978002','2020-12-16 04:31:36.978045',3,2,3),(9,'Dummy text: Its function as a filler or as a tool for comparing the visual impression of different typefaces\r\nDummy text is text that is used in the publishing industry or by web designers to occupy the space which will later be filled with \'real\' content. This is required when, for example, the final text is not yet available. Dummy text is also known as \'fill text\'. It is said that song composers of the past used dummy texts as lyrics when writing melodies in order to have a \'ready-made\' text to sing with the melody. Dummy texts have been in use by typesetters since the 16th century.',4,'2020-12-19 04:51:23.354408','2020-12-19 04:51:23.354436',6,4,4),(10,'The usefulness of nonsensical content\r\nDummy text is also used to demonstrate the appearance of different typefaces and layouts, and in general the content of dummy text is nonsensical. Due to its widespread use as filler text for layouts, non-readability is of great importance: human perception is tuned to recognize certain patterns and repetitions in texts. If the distribution of letters and \'words\' is random, the reader will not be distracted from making a neutral judgement on the visual impact and readability of the typefaces (typography), or the distribution of text on the page (layout or type area). For this reason, dummy text usually consists of a more or less random series of words or syllables. This prevents repetitive patterns from impairing the overall visual impression and facilitates the comparison of different typefaces. Furthermore, it is advantageous when the dummy text is relatively realistic so that the layout impression of the final publication is not compromised.',4.3,'2020-12-19 04:52:33.901473','2020-12-19 04:52:33.901518',2,3,2),(11,'front test',3.7,'2021-02-15 18:50:08.663544','2021-02-15 18:50:08.663581',4,2,2),(12,'front test',3.7,'2021-02-15 18:50:14.005570','2021-02-15 18:50:14.005650',4,2,2),(13,'front test',3.7,'2021-02-15 18:50:30.536626','2021-02-15 18:50:30.536669',4,2,2),(14,'front 3',3.8,'2021-02-15 18:51:04.234764','2021-02-15 18:51:04.234794',12,3,2),(15,'front 3',3.8,'2021-02-15 18:52:00.928106','2021-02-15 18:52:00.928137',12,3,2),(16,'front 3',3.8,'2021-02-15 18:54:22.355320','2021-02-15 18:54:22.355350',12,3,2),(17,'front 3',3.8,'2021-02-15 18:59:11.080984','2021-02-15 18:59:11.081016',12,3,2),(18,'front 4',5,'2021-02-15 19:00:05.920858','2021-02-15 19:00:05.920934',5,4,3),(19,'front 3',4.9,'2021-02-15 19:00:29.793801','2021-02-15 19:00:29.793830',2,3,2);
/*!40000 ALTER TABLE `checkin_api_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkin_api_service`
--

DROP TABLE IF EXISTS `checkin_api_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkin_api_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkin_api_service`
--

LOCK TABLES `checkin_api_service` WRITE;
/*!40000 ALTER TABLE `checkin_api_service` DISABLE KEYS */;
INSERT INTO `checkin_api_service` VALUES (1,'Manicure','2020-11-12 04:55:16.089841','2020-11-12 04:55:16.089865'),(2,'Pedicure','2020-11-12 04:55:21.024059','2020-11-12 04:55:21.024083'),(3,'Shellac','2020-11-12 04:55:28.132684','2020-11-12 04:55:28.132708'),(4,'Facial Waxing','2020-11-12 04:55:36.738424','2020-11-12 04:55:36.738448'),(5,'Body Waxing','2020-11-12 04:55:44.972436','2020-11-12 04:55:44.972460');
/*!40000 ALTER TABLE `checkin_api_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkin_api_staff`
--

DROP TABLE IF EXISTS `checkin_api_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkin_api_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `phone` varchar(31) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `staff_location_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `checkin_api_staff_staff_location_id_d149b4ce_fk_checkin_a` (`staff_location_id`),
  CONSTRAINT `checkin_api_staff_staff_location_id_d149b4ce_fk_checkin_a` FOREIGN KEY (`staff_location_id`) REFERENCES `checkin_api_location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkin_api_staff`
--

LOCK TABLES `checkin_api_staff` WRITE;
/*!40000 ALTER TABLE `checkin_api_staff` DISABLE KEYS */;
INSERT INTO `checkin_api_staff` VALUES (2,'Staff 1','Hehe','st1@gmail.com','1987-08-01','+14162998766',1,'2018-11-01',NULL,'2020-11-12 04:53:32.810811','2020-11-12 04:53:32.810833',1),(3,'Jenny','Hihi','jn@gmail.com','1998-01-11','+16470988198',1,'2019-06-11',NULL,'2020-11-12 04:54:59.983313','2020-11-12 04:54:59.983336',1),(4,'Tester','Staff 2','sta2@gmail.com','1985-10-23','+14165321452',1,'2020-12-05',NULL,'2020-12-19 04:50:37.634673','2020-12-19 04:50:37.634699',1),(5,'Staff','3','s3@gmail.com','1991-02-28','+16479127364',1,'2009-11-13',NULL,'2021-02-13 22:18:30.743320','2021-02-13 22:18:30.743345',3);
/*!40000 ALTER TABLE `checkin_api_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_checkin_api_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_checkin_api_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `checkin_api_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-11-06 13:38:09.566876','2','test@gmail.com',1,'[{\"added\": {}}]',6,1),(2,'2020-11-06 16:08:23.447158','1','admin@gmail.com',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Date of birth\", \"Phone\", \"Staff status\"]}}]',6,3),(3,'2020-11-06 16:08:47.422954','2','test@gmail.com',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Date of birth\", \"Phone\"]}}]',6,3),(4,'2020-11-07 16:47:33.073381','1','765c7fdee662fa491a623424d5832299dc8d9648',1,'[{\"added\": {}}]',8,3),(5,'2020-11-07 16:47:37.440820','3','a49367b95e4b084cd814b7d862c379d89feb74a8',1,'[{\"added\": {}}]',8,3),(6,'2020-11-07 16:47:39.720358','2','622d6033cfd88b37b2aea44e2da11669b5955bb3',1,'[{\"added\": {}}]',8,3),(7,'2020-11-07 16:47:57.822357','3','a49367b95e4b084cd814b7d862c379d89feb74a8',3,'',8,3),(8,'2020-11-07 16:48:00.853670','1','765c7fdee662fa491a623424d5832299dc8d9648',3,'',8,3),(9,'2020-11-07 16:48:04.114472','2','622d6033cfd88b37b2aea44e2da11669b5955bb3',3,'',8,3),(10,'2020-11-12 04:35:35.609961','1','Van Nails Jane/Finch',1,'[{\"added\": {}}]',12,1),(11,'2020-11-12 04:36:49.143448','2','Van Nails Jane/Sheppard',1,'[{\"added\": {}}]',12,1),(12,'2020-11-12 04:38:47.801184','3','Van Nails Keele/Sheppard',1,'[{\"added\": {}}]',12,1),(13,'2020-11-12 04:43:55.540745','4','Nails For You Jane/Wilson',1,'[{\"added\": {}}]',12,1),(14,'2020-11-12 04:53:32.813031','2','Staff 1 | Hehe',1,'[{\"added\": {}}]',10,1),(15,'2020-11-12 04:54:59.984240','3','Jenny Hihi',1,'[{\"added\": {}}]',10,1),(16,'2020-11-12 04:55:16.090369','1','Manicure',1,'[{\"added\": {}}]',9,1),(17,'2020-11-12 04:55:21.024630','2','Pedicure',1,'[{\"added\": {}}]',9,1),(18,'2020-11-12 04:55:28.133231','3','Shellac',1,'[{\"added\": {}}]',9,1),(19,'2020-11-12 04:55:36.739054','4','Facial Waxing',1,'[{\"added\": {}}]',9,1),(20,'2020-11-12 04:55:44.972969','5','Body Waxing',1,'[{\"added\": {}}]',9,1),(21,'2020-11-12 04:59:06.048270','1','1',1,'[{\"added\": {}}]',11,1),(22,'2020-11-12 04:59:55.147644','2','test@gmail.com',2,'[{\"changed\": {\"fields\": [\"Last name\"]}}]',6,1),(23,'2020-11-12 05:01:08.089571','4','cust1@gmail.com',1,'[{\"added\": {}}]',6,1),(24,'2020-11-15 19:20:08.932465','1','d97f064dbe5e7f209038a2a85b948ca1efd659e5',1,'[{\"added\": {}}]',8,1),(25,'2020-11-15 19:20:14.675105','4','8ab8b68d95060e96be2d563901796d1ba9d7fd6e',1,'[{\"added\": {}}]',8,1),(26,'2020-11-15 19:20:18.535809','3','35bfaaa644cb87dbcd63aea008498c32c1c05826',1,'[{\"added\": {}}]',8,1),(27,'2020-11-15 19:20:21.472735','2','084d0ef5888f27a2d902bb65a31f967e5aa621f6',1,'[{\"added\": {}}]',8,1),(28,'2020-11-23 03:47:42.502315','3','haha@gmail.com',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',6,1),(29,'2020-11-25 03:57:14.270334','5','hihi@gmail.com',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',6,1),(30,'2020-11-25 04:16:35.422685','7','63065291047e3187ce249ffe16af0a2968d3c52a',1,'[{\"added\": {}}]',8,1),(31,'2020-11-25 04:17:44.776718','7','hichic@gmail.com',2,'[{\"changed\": {\"fields\": [\"Phone\"]}}]',6,1),(32,'2020-11-26 06:31:35.353208','5','8157aacb51798d246a5c0e34bbbb9a23272eb8cc',1,'[{\"added\": {}}]',8,1),(33,'2020-12-03 07:25:46.945409','12','customer_a@gmail.com',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',6,1),(34,'2020-12-04 19:46:28.234214','2','Huhu',1,'[{\"added\": {}}]',11,1),(35,'2020-12-04 19:47:08.707666','2','Huhu',2,'[]',11,1),(36,'2020-12-04 19:47:36.243519','3','Hichic',1,'[{\"added\": {}}]',11,1),(37,'2020-12-09 05:24:09.523532','4','cust1@gmail.com',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',6,1),(38,'2020-12-16 04:31:29.139383','7','Hehe',1,'[{\"added\": {}}]',11,1),(39,'2020-12-16 04:31:36.980403','8','Hehe',1,'[{\"added\": {}}]',11,1),(40,'2020-12-19 04:50:37.657192','4','Tester Staff 2',1,'[{\"added\": {}}]',10,1),(41,'2020-12-19 04:51:23.360930','9','Huhu',1,'[{\"added\": {}}]',11,1),(42,'2020-12-19 04:52:33.945692','10','Tester',1,'[{\"added\": {}}]',11,1),(43,'2020-12-19 05:03:59.585242','13','customer_b@gmail.com',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',6,1),(44,'2021-02-13 22:18:30.745126','5','Staff 3',1,'[{\"added\": {}}]',10,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(7,'authtoken','token'),(8,'authtoken','tokenproxy'),(6,'checkin_api','customuser'),(12,'checkin_api','location'),(11,'checkin_api','review'),(9,'checkin_api','service'),(10,'checkin_api','staff'),(4,'contenttypes','contenttype'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-11-06 08:17:24.883172'),(2,'contenttypes','0002_remove_content_type_name','2020-11-06 08:17:24.946171'),(3,'auth','0001_initial','2020-11-06 08:17:25.021235'),(4,'auth','0002_alter_permission_name_max_length','2020-11-06 08:17:25.169171'),(5,'auth','0003_alter_user_email_max_length','2020-11-06 08:17:25.174839'),(6,'auth','0004_alter_user_username_opts','2020-11-06 08:17:25.183131'),(7,'auth','0005_alter_user_last_login_null','2020-11-06 08:17:25.188820'),(8,'auth','0006_require_contenttypes_0002','2020-11-06 08:17:25.190522'),(9,'auth','0007_alter_validators_add_error_messages','2020-11-06 08:17:25.196281'),(10,'auth','0008_alter_user_username_max_length','2020-11-06 08:17:25.202634'),(11,'auth','0009_alter_user_last_name_max_length','2020-11-06 08:17:25.208415'),(12,'auth','0010_alter_group_name_max_length','2020-11-06 08:17:25.237399'),(13,'auth','0011_update_proxy_permissions','2020-11-06 08:17:25.243867'),(14,'auth','0012_alter_user_first_name_max_length','2020-11-06 08:17:25.248933'),(15,'checkin_api','0001_initial','2020-11-06 08:17:25.336488'),(16,'admin','0001_initial','2020-11-06 08:17:25.515412'),(17,'admin','0002_logentry_remove_auto_add','2020-11-06 08:17:25.576827'),(18,'admin','0003_logentry_add_action_flag_choices','2020-11-06 08:17:25.585034'),(19,'authtoken','0001_initial','2020-11-06 08:17:25.615405'),(20,'authtoken','0002_auto_20160226_1747','2020-11-06 08:17:25.710239'),(21,'authtoken','0003_tokenproxy','2020-11-06 08:17:25.713869'),(22,'sessions','0001_initial','2020-11-06 08:17:25.746134'),(23,'checkin_api','0002_auto_20201106_1059','2020-11-06 16:00:50.170207'),(24,'checkin_api','0003_customuser_is_staff','2020-11-06 16:03:26.534280'),(25,'checkin_api','0004_location_review_service_staff','2020-11-08 04:54:11.125362'),(26,'checkin_api','0005_remove_staff_name','2020-11-12 04:45:11.331428'),(27,'checkin_api','0006_auto_20201111_2347','2020-11-12 04:48:00.588844'),(28,'checkin_api','0007_auto_20201111_2350','2020-11-12 04:50:20.021239'),(29,'checkin_api','0008_auto_20201111_2351','2020-11-12 04:51:18.250497'),(30,'checkin_api','0009_auto_20201111_2358','2020-11-12 04:58:22.256413'),(31,'checkin_api','0010_auto_20210208_1416','2021-02-13 22:16:50.906183'),(32,'checkin_api','0011_auto_20210208_1417','2021-02-13 22:16:50.915998'),(33,'checkin_api','0012_staff_staff_location','2021-02-13 22:16:51.029275'),(34,'checkin_api','0013_auto_20210208_2355','2021-02-13 22:16:51.102989'),(35,'checkin_api','0014_auto_20210210_2325','2021-02-13 22:16:51.109333'),(36,'checkin_api','0015_auto_20210213_1716','2021-02-13 22:16:51.171786');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('2e1v177xjb7vjrn8tfiqmdu10efi8t5p','.eJxVjMsOwiAQRf-FtSEgb5fu-w1kmAGpGkhKuzL-uzbpQrf3nHNfLMK21riNvMSZ2IVJdvrdEuAjtx3QHdqtc-xtXebEd4UfdPCpU35eD_fvoMKo3xpVyFaXDC45l0L2UhqhAilRAlhM6IHOIkhrSGlZikcgacEjovG6IHt_APOaOJ0:1khmU4:vO9jv3gZOuLXoLiS9aN1oCA47FMZO4vPBS45VImva3o','2020-12-09 04:32:48.869319'),('5kjj76gja81cb575cafx2pz8t1ax8g5b','.eJxVjMsOwiAQRf-FtSEgb5fu-w1kmAGpGkhKuzL-uzbpQrf3nHNfLMK21riNvMSZ2IVJdvrdEuAjtx3QHdqtc-xtXebEd4UfdPCpU35eD_fvoMKo3xpVyFaXDC45l0L2UhqhAilRAlhM6IHOIkhrSGlZikcgacEjovG6IHt_APOaOJ0:1ki9pb:R3_cGNcJ1caF_UUVqMpcMm9LrDK5vqAgsuu0cmRJBK4','2020-12-10 05:28:35.893023'),('bgfkmunb4w7pun26l1ftp6ehej54oihg','.eJxVjMsOwiAQRf-FtSEgb5fu-w1kmAGpGkhKuzL-uzbpQrf3nHNfLMK21riNvMSZ2IVJdvrdEuAjtx3QHdqtc-xtXebEd4UfdPCpU35eD_fvoMKo3xpVyFaXDC45l0L2UhqhAilRAlhM6IHOIkhrSGlZikcgacEjovG6IHt_APOaOJ0:1kqUPP:LODsynaxjf3-eAs7TgBGlJ9bNzqQQDSX1dxvv_-N3vk','2021-01-02 05:03:59.614694'),('h5mfpie95sqyouxfykhk5ya441wp33it','.eJxVjEEOgjAQRe_StWloZZjWpXvOQGY6U4saSCisjHdXEha6_e-9_zIDbWsZtqrLMIq5GOfN6XdkSg-ddiJ3mm6zTfO0LiPbXbEHrbafRZ_Xw_07KFTLt1bs1IlD4OghUgaXBFoMOQsnQtIUG3INchsCOo_M58576QBaUa9i3h8W4Dhr:1knp3M:Rd3gim-_RD0EI9vR1JBbG6J4STkmm-W9FXxew-7lJoU','2020-12-25 20:30:12.387537'),('nfqd4q23gexv3293hlsio6a7ced1fud8','.eJxVjMsOwiAQRf-FtSEgb5fu-w1kmAGpGkhKuzL-uzbpQrf3nHNfLMK21riNvMSZ2IVJdvrdEuAjtx3QHdqtc-xtXebEd4UfdPCpU35eD_fvoMKo3xpVyFaXDC45l0L2UhqhAilRAlhM6IHOIkhrSGlZikcgacEjovG6IHt_APOaOJ0:1kbRO3:uN48ztz7KHPsTrx8ka3Ex4gt9_aM5t8tPpvMz2WMaPs','2020-11-21 16:48:23.167600'),('nshsfpc1qd6jko2uwvscfwvzzq9s0tcm','.eJxVjMsOwiAQRf-FtSEgb5fu-w1kmAGpGkhKuzL-uzbpQrf3nHNfLMK21riNvMSZ2IVJdvrdEuAjtx3QHdqtc-xtXebEd4UfdPCpU35eD_fvoMKo3xpVyFaXDC45l0L2UhqhAilRAlhM6IHOIkhrSGlZikcgacEjovG6IHt_APOaOJ0:1ksh5b:RPshqYmp5y3vbfbv8r4RlTSxcgeq0glv1utorfTU9DE','2021-01-08 07:00:39.570940'),('tlvuym1nf7ezaj0vtoiedz0rj2isd2w1','.eJxVjMsOgjAUBf-la9O0eEupS_d8Q3NfFdRAQmFl_HclYaHbMzPnZTJu65C3qksexVwMmNPvRsgPnXYgd5xus-V5WpeR7K7Yg1bbz6LP6-H-HQxYh28dhV1pUusCUyytklfh4lFcUUitQOiUusKpnIESAgcAx03qPIFLMZj3BxDsOHU:1kmrxf:0byjIbDGMDl6jnVXlbCgUiHGnGrOcp98bzgEOfRs2M8','2020-12-23 05:24:23.877283'),('wmstpulfsrku2eqjbqvt4bprto6njlfi','.eJxVjMsOgjAUBf-la9O0eEupS_d8Q3NfFdRAQmFl_HclYaHbMzPnZTJu65C3qksexVwMmNPvRsgPnXYgd5xus-V5WpeR7K7Yg1bbz6LP6-H-HQxYh28dhV1pUusCUyytklfh4lFcUUitQOiUusKpnIESAgcAx03qPIFLMZj3BxDsOHU:1lBj75:gkutKAeMHNYUYH_4on8cP35xu8A1hzP4ZdH_1_8tIFg','2021-03-01 19:00:51.755460');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-22 11:18:37
