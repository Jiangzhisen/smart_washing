CREATE DATABASE  IF NOT EXISTS `djangomysql` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `djangomysql`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: djangomysql
-- ------------------------------------------------------
-- Server version	8.0.28

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
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add addpur',7,'add_addpur'),(26,'Can change addpur',7,'change_addpur'),(27,'Can delete addpur',7,'delete_addpur'),(28,'Can view addpur',7,'view_addpur'),(29,'Can add bag',8,'add_bag'),(30,'Can change bag',8,'change_bag'),(31,'Can delete bag',8,'delete_bag'),(32,'Can view bag',8,'view_bag'),(33,'Can add delivery',9,'add_delivery'),(34,'Can change delivery',9,'change_delivery'),(35,'Can delete delivery',9,'delete_delivery'),(36,'Can view delivery',9,'view_delivery'),(37,'Can add fmachineinfo',10,'add_fmachineinfo'),(38,'Can change fmachineinfo',10,'change_fmachineinfo'),(39,'Can delete fmachineinfo',10,'delete_fmachineinfo'),(40,'Can view fmachineinfo',10,'view_fmachineinfo'),(41,'Can add hstate',11,'add_hstate'),(42,'Can change hstate',11,'change_hstate'),(43,'Can delete hstate',11,'delete_hstate'),(44,'Can view hstate',11,'view_hstate'),(45,'Can add lockerinfo',12,'add_lockerinfo'),(46,'Can change lockerinfo',12,'change_lockerinfo'),(47,'Can delete lockerinfo',12,'delete_lockerinfo'),(48,'Can view lockerinfo',12,'view_lockerinfo'),(49,'Can add member',13,'add_member'),(50,'Can change member',13,'change_member'),(51,'Can delete member',13,'delete_member'),(52,'Can view member',13,'view_member'),(53,'Can add mode',14,'add_mode'),(54,'Can change mode',14,'change_mode'),(55,'Can delete mode',14,'delete_mode'),(56,'Can view mode',14,'view_mode'),(57,'Can add order',15,'add_order'),(58,'Can change order',15,'change_order'),(59,'Can delete order',15,'delete_order'),(60,'Can view order',15,'view_order'),(61,'Can add store',16,'add_store'),(62,'Can change store',16,'change_store'),(63,'Can delete store',16,'delete_store'),(64,'Can view store',16,'view_store'),(65,'Can add wmachineinfo',17,'add_wmachineinfo'),(66,'Can change wmachineinfo',17,'change_wmachineinfo'),(67,'Can delete wmachineinfo',17,'delete_wmachineinfo'),(68,'Can view wmachineinfo',17,'view_wmachineinfo'),(69,'Can add wlmachin',18,'add_wlmachin'),(70,'Can change wlmachin',18,'change_wlmachin'),(71,'Can delete wlmachin',18,'delete_wlmachin'),(72,'Can view wlmachin',18,'view_wlmachin'),(73,'Can add report',19,'add_report'),(74,'Can change report',19,'change_report'),(75,'Can delete report',19,'delete_report'),(76,'Can view report',19,'view_report'),(77,'Can add lock',20,'add_lock'),(78,'Can change lock',20,'change_lock'),(79,'Can delete lock',20,'delete_lock'),(80,'Can view lock',20,'view_lock'),(81,'Can add flmachin',21,'add_flmachin'),(82,'Can change flmachin',21,'change_flmachin'),(83,'Can delete flmachin',21,'delete_flmachin'),(84,'Can view flmachin',21,'view_flmachin'),(85,'Can add notice',22,'add_notice'),(86,'Can change notice',22,'change_notice'),(87,'Can delete notice',22,'delete_notice'),(88,'Can view notice',22,'view_notice'),(89,'Can add login',23,'add_login'),(90,'Can change login',23,'change_login'),(91,'Can delete login',23,'delete_login'),(92,'Can view login',23,'view_login');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'myapp','addpur'),(8,'myapp','bag'),(9,'myapp','delivery'),(21,'myapp','flmachin'),(10,'myapp','fmachineinfo'),(11,'myapp','hstate'),(20,'myapp','lock'),(12,'myapp','lockerinfo'),(23,'myapp','login'),(13,'myapp','member'),(14,'myapp','mode'),(22,'myapp','notice'),(15,'myapp','order'),(19,'myapp','report'),(16,'myapp','store'),(18,'myapp','wlmachin'),(17,'myapp','wmachineinfo'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-01-06 19:11:46.526829'),(2,'auth','0001_initial','2023-01-06 19:11:46.903705'),(3,'admin','0001_initial','2023-01-06 19:11:47.013390'),(4,'admin','0002_logentry_remove_auto_add','2023-01-06 19:11:47.013390'),(5,'admin','0003_logentry_add_action_flag_choices','2023-01-06 19:11:47.029016'),(6,'contenttypes','0002_remove_content_type_name','2023-01-06 19:11:47.107669'),(7,'auth','0002_alter_permission_name_max_length','2023-01-06 19:11:47.154545'),(8,'auth','0003_alter_user_email_max_length','2023-01-06 19:11:47.186360'),(9,'auth','0004_alter_user_username_opts','2023-01-06 19:11:47.202057'),(10,'auth','0005_alter_user_last_login_null','2023-01-06 19:11:47.233270'),(11,'auth','0006_require_contenttypes_0002','2023-01-06 19:11:47.248947'),(12,'auth','0007_alter_validators_add_error_messages','2023-01-06 19:11:47.248947'),(13,'auth','0008_alter_user_username_max_length','2023-01-06 19:11:47.296292'),(14,'auth','0009_alter_user_last_name_max_length','2023-01-06 19:11:47.343165'),(15,'auth','0010_alter_group_name_max_length','2023-01-06 19:11:47.390623'),(16,'auth','0011_update_proxy_permissions','2023-01-06 19:11:47.390623'),(17,'auth','0012_alter_user_first_name_max_length','2023-01-06 19:11:47.453025'),(18,'myapp','0001_initial','2023-01-06 19:11:47.656937'),(19,'sessions','0001_initial','2023-01-06 19:11:47.672960'),(20,'myapp','0002_delete_hstate','2023-01-07 14:08:54.300772'),(21,'myapp','0003_hstate','2023-01-07 14:09:40.662419'),(22,'myapp','0004_delete_hstate','2023-01-07 21:59:45.342639'),(23,'myapp','0005_hstate','2023-01-07 22:02:58.940327'),(24,'myapp','0006_delete_hstate','2023-01-07 23:42:47.120010'),(25,'myapp','0007_hstate','2023-01-07 23:43:28.969681'),(26,'myapp','0008_delete_hstate','2023-01-08 01:24:54.629118'),(27,'myapp','0009_hstate','2023-01-08 01:25:16.517804'),(28,'myapp','0010_delete_hstate_delete_order','2023-01-08 01:48:34.282115'),(29,'myapp','0011_hstate_order','2023-01-08 01:51:00.432359'),(30,'myapp','0012_delete_lock','2023-01-08 02:17:00.210680'),(31,'myapp','0013_lock','2023-01-08 02:17:50.793077'),(32,'myapp','0014_delete_lock','2023-01-08 03:19:52.548244'),(33,'myapp','0015_lock','2023-01-08 03:21:47.516236'),(34,'myapp','0016_delete_lock','2023-01-08 03:24:34.387577'),(35,'myapp','0017_lock','2023-01-08 03:24:59.460924'),(36,'myapp','0018_delete_flmachin_delete_lock_delete_report_and_more','2023-01-08 03:38:30.159586'),(37,'myapp','0019_flmachin_lock_report_wlmachin','2023-01-08 03:41:03.517404'),(38,'myapp','0020_notice','2023-01-09 19:03:37.579570'),(39,'myapp','0021_delete_notice','2023-01-09 19:05:15.358685'),(40,'myapp','0022_notice','2023-01-09 19:06:13.081288'),(41,'myapp','0023_delete_hstate_delete_order','2023-01-09 23:36:45.904018'),(42,'myapp','0024_hstate_order','2023-01-09 23:37:30.881542'),(43,'myapp','0025_login','2023-01-10 03:56:44.395879'),(44,'myapp','0026_delete_member','2023-01-10 05:10:07.080869'),(45,'myapp','0027_member','2023-01-10 05:11:44.331465'),(46,'myapp','0028_delete_member','2023-01-10 06:37:53.342214'),(47,'myapp','0029_member','2023-01-10 06:39:34.112308'),(48,'myapp','0030_delete_member','2023-01-10 07:15:01.888280'),(49,'myapp','0031_member','2023-01-10 07:16:07.442063'),(50,'myapp','0032_delete_member','2023-01-10 07:58:25.804081'),(51,'myapp','0033_member','2023-01-10 07:59:03.700887'),(52,'myapp','0034_delete_hstate_delete_notice_delete_order_and_more','2023-01-10 20:55:15.114498'),(53,'myapp','0035_hstate_notice_order_report','2023-01-10 20:56:30.375987'),(54,'myapp','0036_delete_report','2023-01-10 22:54:22.093134'),(55,'myapp','0037_report','2023-01-10 22:55:33.058086'),(56,'myapp','0038_delete_member','2023-01-11 00:46:35.821843'),(57,'myapp','0039_member','2023-01-11 00:51:21.072691'),(58,'myapp','0040_delete_member','2023-01-11 02:34:40.043087'),(59,'myapp','0041_member','2023-01-11 02:37:59.361400'),(60,'myapp','0042_delete_hstate','2023-01-11 05:24:14.788000'),(61,'myapp','0043_hstate','2023-01-11 05:25:58.705298'),(62,'myapp','0044_delete_hstate','2023-01-12 06:14:22.989743'),(63,'myapp','0045_hstate','2023-01-12 06:24:42.780890');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('04go5pgvp5u73jcqja4d4azzb9jkzua3','eyJfc2Vzc2lvbl9leHBpcnkiOjE4MDAsInVzZXIiOiJVc2VySUQtMmQyNzU5MDAtYWM0MC00MmUxLWJkZjQtZmQwMWUyZGNhOTI0In0:1pFpZw:RQctY0P2ZggJ1dK_Cy33yEn1iubMr8Q1BcNhR-Z8CPc','2023-01-12 13:22:40.068264'),('130b53rm8bdaq5ihheaw188i33s4h712','eyJfc2Vzc2lvbl9leHBpcnkiOjEyMCwidXNlciI6IlVzZXJJRC0yZDI3NTkwMC1hYzQwLTQyZTEtYmRmNC1mZDAxZTJkY2E5MjQifQ:1pFt03:y1mqVvWYYTRYHQLr1J2yBOgPZhepa1jZa-LZn2VSKxk','2023-01-12 16:33:51.492112'),('18z6yo10ngmzbok9950n9yxdi5rgtxgl','eyJfc2Vzc2lvbl9leHBpcnkiOjEyMCwidXNlciI6IlVzZXJJRC0yZDI3NTkwMC1hYzQwLTQyZTEtYmRmNC1mZDAxZTJkY2E5MjQifQ:1pFtVy:86QvBr5uMCa4IQLr7r8qvOTh7mj3WvCXpP4drWuzPLI','2023-01-12 17:06:50.095088'),('1crqtby3f0adv8x7ij3hs7jc2rgrvq9e','eyJfc2Vzc2lvbl9leHBpcnkiOjE4MDAsInVzZXIiOiJVc2VySUQtMmQyNzU5MDAtYWM0MC00MmUxLWJkZjQtZmQwMWUyZGNhOTI0In0:1pFF5V:bsHNH9_QMYgeIliHmRelKxx4sY0Cm2Ygz2y9yJo_FHU','2023-01-10 22:24:49.194162'),('2fcfjy3b0o4ld41vg1oq3s93mp4mu5dg','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0:1pFq7v:sXKCKGXB3OeVOCVA-393NinQ0mpBdPNNOrrmlN5jt3w','2023-01-12 13:57:47.051988'),('4e1i0mkeg62m3p5dml8gziupa8wfatqx','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTIwfQ:1pFsVT:2lhU3232qXQbLRO9XDlBZFgcIIDFZeTMFCR8J_njNqg','2023-01-12 16:02:15.363450'),('4le2m7r3rfb318ezahfgiz485ilzz7gy','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTIwfQ:1pFsm8:RJcGnhXSFoqbdKCZJhPSM324oa0_kc4xhGG_wrDHNZI','2023-01-12 16:19:28.669116'),('4mw3irzd0lfjjs1mtg39egf883wym51t','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTIwfQ:1pFtYl:jSRd7UHHToiPa5EwRR8iND8EqYXeMTrygszgjkO0eIo','2023-01-12 17:09:43.904143'),('5htftd4q0dbioz6i5r6dkds0zjxp5q8z','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTIwfQ:1pFrfR:RdJ6ERi-5cL-RvmZc47tt1G3go_sRYRD0LQsEKGtgt8','2023-01-12 15:08:29.623908'),('6mn2pqs1zc55qoajfrror0wbs8fcu7b9','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0:1pFgr0:px2kFb7eER0MyML3RoH0eNoFIChsTuEyATRdij1KYVA','2023-01-12 04:03:42.606698'),('7conacb614h5mhj9ga4fhdr5plh6pxar','eyJfc2Vzc2lvbl9leHBpcnkiOjE4MDAsInVzZXIiOiJVc2VySUQtMmQyNzU5MDAtYWM0MC00MmUxLWJkZjQtZmQwMWUyZGNhOTI0In0:1pFYmv:m8hr4Q4IDstIYNWOGyEGMAUIc6B8XIVDot3Cr_qB9Es','2023-01-11 19:26:57.804511'),('88cgym7gi0nmsuqhe17morx2wrmf9dd9','eyJ1c2VyIjoiVXNlcklELTFjYTE4MWYxLWYzNjAtNGUwNS1hODJhLTIwZTE1NTJjZmE4MiIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0:1pFwLc:k0TnBvYcNkeKkJOEAXOlkEAB3E6dc3KaQjfuE2Z63p0','2023-01-12 20:36:20.921428'),('9nwllzcdse5po021dgaqpjsvb9gvh8ol','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTIwfQ:1pFtNT:UhjR8Qh2STOcnPRaKsd74p7ZOQ2Y261ndmEd9cm2l2c','2023-01-12 16:58:03.047950'),('a73nr4homg88q502bud8bpl942gus7aw','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTIwfQ:1pFt38:v_2XmML0tgnTSE47lhwY_CzEEcUirNYKE0k9hGomzOU','2023-01-12 16:37:02.345519'),('b0a6yq5fgog73iflvswta6kokz9g1z58','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0:1pFP2F:-zvQU4fQheD__9l9toNT2VQ6PfZrI02bCj0D6oQdNc0','2023-01-11 09:02:07.433440'),('btbpxwudye9v63dryy974rh7dsu6uoqo','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTIwfQ:1pFrbJ:qV-Xg5Mr6exrEzh3GHRxcPjg7VIYYE5CuGYB6ytWdh0','2023-01-12 15:04:13.748822'),('bvig18x09ekka64r1udboezcl12kps2l','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTIwfQ:1pFsr8:WQ678Qhwhj-5WIGwRvrvDefEO5zwJmpL8t4AbQfZyRc','2023-01-12 16:24:38.295629'),('cfjsrskyvhnxtfvweryr1gvs58qpcr0l','eyJfc2Vzc2lvbl9leHBpcnkiOjE4MDAsInVzZXIiOiJVc2VySUQtMmQyNzU5MDAtYWM0MC00MmUxLWJkZjQtZmQwMWUyZGNhOTI0In0:1pFtgE:slC-APbR2dvSXA0YlvWnOhQf5srVj5t2TY3PnIm1oW8','2023-01-12 17:45:26.750820'),('d0og7b56avni2pu0zoqye2p21egw89c7','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0:1pFhLP:QGgVEooGUTqivN-7DEXXdiYcrsgK9O-feH0QLVRJX5M','2023-01-12 04:35:07.942624'),('davh4nddar6yb6btfagpgtdqmhuu1757','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0:1pFj48:EtQtKda6dWNBlgB9Kb864fPgtx8eiVp0ZSuJiJP1VEo','2023-01-12 06:25:24.544428'),('dv0o01j14u9ydi5kjmc9hovc7irk5ey2','eyJfc2Vzc2lvbl9leHBpcnkiOjE4MDAsInVzZXIiOiJVc2VySUQtMmQyNzU5MDAtYWM0MC00MmUxLWJkZjQtZmQwMWUyZGNhOTI0In0:1pFvJm:R_5fv96qu74anNsbAhlqzEwo7dMxr_i7vllxfBMJwnQ','2023-01-12 19:30:22.271477'),('dx3olwhm0oc5d5t6z0gjudglwut9l5cr','eyJfc2Vzc2lvbl9leHBpcnkiOjE4MDAsInVzZXIiOiJVc2VySUQtMmQyNzU5MDAtYWM0MC00MmUxLWJkZjQtZmQwMWUyZGNhOTI0In0:1pFHr3:cfFQ4Apg8u7M7guxIEQLh07x-hMqk8S8ac7Y7sMbBv0','2023-01-11 01:22:05.485123'),('eb62hknk8hb2vmd3tvgyko2o898yrscd','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0:1pFNcJ:vKtiLJqTT3b-K4tRXdIYN1Pf5-GJnFDtsjlSFmca93k','2023-01-11 07:31:15.446540'),('f25mev8y0694ux6pdy5s4htmc0kp86bo','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0:1pFuFo:_Pk1qUB_HgG4LrdlbfodHm7W4TVGNjVT84uXQ4WZ8oo','2023-01-12 18:22:12.379088'),('f5aixmymol9s7plt9t65jytlpa7scmrl','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0:1pFN3m:mx5Q32UCHhaS4EsWoy5EAcRpOtOMZxjNkDyzxMoegt4','2023-01-11 06:55:34.420939'),('fj0qdw9mn80l5kzif4mkpy56hib4ospv','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0:1pF23F:pjWQ7Tkdt660QOQ8E-B5ASG-6YjyeIYfleNYzuXIJCI','2023-01-10 08:29:37.974536'),('g7b6i2qau1m96y7ci9sdn6rxnmbpjm45','eyJ1c2VyIjoiVXNlcklELTFjYTE4MWYxLWYzNjAtNGUwNS1hODJhLTIwZTE1NTJjZmE4MiIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0:1pFYrN:z7ukg6RUtXwYUtQ0KMwwOfspLeDOxhtEJaE-KDjwIHY','2023-01-11 19:31:33.736556'),('geib0wvzj89o60q3fllb8qzyvqaxk2ji','eyJfc2Vzc2lvbl9leHBpcnkiOjEyMCwidXNlciI6IlVzZXJJRC0yZDI3NTkwMC1hYzQwLTQyZTEtYmRmNC1mZDAxZTJkY2E5MjQifQ:1pFtS7:T2VBejiYE9aiVt6LioQ2LlaxKn-kFdC5sfxoHI8R96k','2023-01-12 17:02:51.694115'),('j8epbrum9zrnltncp35h89387y8twzg7','eyJ1c2VyIjoiVXNlcklELWJjZGUyMTIxLTk4NzctNDdiNi1iMjFlLTE3ODBlMzhhYmU4ZSIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0:1pFtfN:bkq2xNslJj3QaxjuXNACW-sfmbRkjtG80I5tCoswHbc','2023-01-12 17:44:33.484177'),('jdpekrv2uwa1oazqtclrb15stcc8wup0','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0:1pFqlF:-5S16KSvaBc9DUtt_6Wl3Kgenr6D-2_VIMvLlzKXJ6Y','2023-01-12 14:38:25.477253'),('jnamy4ehzcv3cunt9i5zq71l7hv8xh2i','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0:1pFhqP:xk3JH_j3Wo0ehlrKjeGXtS09t4RnZeWx-frQAZVWBnU','2023-01-12 05:07:09.361233'),('k1w639bahezdcpkswtaphsc2gdoesia7','eyJ1c2VyIjoiVXNlcklELWJjZGUyMTIxLTk4NzctNDdiNi1iMjFlLTE3ODBlMzhhYmU4ZSIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0:1pFhzH:HpP8lIozK2SAMy6GHQ2oFeRqaj4Dd0JSBS3xS-qFt3w','2023-01-12 05:16:19.940052'),('krcpxpnaeeku6kvu1reqqds0n1gkddh1','eyJfc2Vzc2lvbl9leHBpcnkiOjEyMCwidXNlciI6IlVzZXJJRC0yZDI3NTkwMC1hYzQwLTQyZTEtYmRmNC1mZDAxZTJkY2E5MjQifQ:1pFswR:pJuA8__pUtnIvmsuh8IohXcYY4XCr101KWnLtmqdFTI','2023-01-12 16:30:07.218029'),('kx4zn2t3nv5c12lk2s8pw9yw447j6bn7','eyJ1c2VyIjoiVXNlcklELWJjZGUyMTIxLTk4NzctNDdiNi1iMjFlLTE3ODBlMzhhYmU4ZSIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0:1pFhS0:6j6ODjIC4o--OSi633QsTBIxhvfj7mwmIjg79vo0HCw','2023-01-12 04:41:56.293765'),('m18zugfs2wfx3nuol5bvlortajeqlkca','eyJfc2Vzc2lvbl9leHBpcnkiOjE4MDAsInVzZXIiOiJVc2VySUQtMmQyNzU5MDAtYWM0MC00MmUxLWJkZjQtZmQwMWUyZGNhOTI0In0:1pFJwK:DoZS23OYWR9V_dgNVBjFayL7XmkBExGlavARF2zGqns','2023-01-11 03:35:40.485895'),('m3wx72gy59fxtjxaijf6su1g7g0rsqfl','eyJ1c2VyIjoiVXNlcklELWJjZGUyMTIxLTk4NzctNDdiNi1iMjFlLTE3ODBlMzhhYmU4ZSIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0:1pFZJf:ygP0Rbwt3mGEEJ5WSItRQ1ADn6lf6EKS-Jzu6HjeGIA','2023-01-11 20:00:47.872181'),('mzlukg6xzm6lspkn3ehqio7h1ar3uvxi','eyJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9:1pFSu8:3WBvFDu7CCkLJ0HX9v6RKzNBNIwKbETCtpuCN2dpkSY','2023-01-11 13:10:00.644812'),('n4gyrqo6v12gm5y6wmgejc4iqouiry29','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTIwfQ:1pFrR0:nSvk35PXqk3_pJkOGZKiXRnh8_PFR4KO9-fBpL1GfFA','2023-01-12 14:53:34.523687'),('n52rhztu007smi0efa3vmhh0lxcbtcl7','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTIwfQ:1pFsaV:RwZOH-oU4zADY9fPea5gCB7wXAhskswjZbbvQakcnN0','2023-01-12 16:07:27.162174'),('n7sog3d9ayn2v5ulgjgf10nwi5rwnrs7','eyJfc2Vzc2lvbl9leHBpcnkiOjE4MDAsInVzZXIiOiJVc2VySUQtMmQyNzU5MDAtYWM0MC00MmUxLWJkZjQtZmQwMWUyZGNhOTI0In0:1pFG5s:y0RlhvDxkdLzz-f5A5oKwTYi0EHN5aIGCu6MRwd3ZMM','2023-01-10 23:29:16.139614'),('n8c2nye9pdyi6vzsi3jf06nfgrzxsor9','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTIwfQ:1pFrVJ:SqyABbIALMz3GnZKx8vn1mhHhH1opDbHc107EkIWUO0','2023-01-12 14:58:01.088170'),('n8hzt0um2z9v82lktr0e32hditgna57x','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0:1pFE1l:HwB0zVJMwCVs7Nla3R5SqpzAiuIxEQD1HOmoJTks1B8','2023-01-10 21:16:53.572115'),('njntek7ni73j46v02eln3af1gnzmhgxp','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTIwfQ:1pFs1B:m67S8XVXqjnUk_ybP3Thf_hhahl6FNx7uascFb52F8c','2023-01-12 15:30:57.983431'),('oj286hd0ktttv2wd0d23hb97q9nbfjmu','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0:1pFLOA:VM5ZJJuK4Uft6rWzewUfXteNlHhs5KhtJ6PpH-t3Snw','2023-01-11 05:08:30.607188'),('pp95gdbgcv5ddpkoo6ki5ervnq7dmnhy','eyJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9:1pFYac:WkY9JVPlBcTEP3IW8I_hCN-prggcjh4PEQebONQ_rzg','2023-01-11 19:14:14.589285'),('px69b4sc5wufm992txb52r47b7a8hlca','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0:1pFlkX:Ben1zHy5vMUXWEo_FKK2f7XVbvvIBbEuR4BVugiXQ4g','2023-01-12 09:17:21.535026'),('qhayg359mz7ck5yiq1oqj52oau7kfjqx','eyJfc2Vzc2lvbl9leHBpcnkiOjE4MDAsInVzZXIiOiJVc2VySUQtMmQyNzU5MDAtYWM0MC00MmUxLWJkZjQtZmQwMWUyZGNhOTI0In0:1pFxeg:jg6EjCOrOs4ktMZ_126rqbx7JDwRV47h692gszS15X8','2023-01-12 22:00:06.398784'),('qit2y5ku5l0jwg3agmmun75hy1talgrr','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTIwfQ:1pFsC8:du1vHHWZBxBStfVwxw1tgpCVabpWxTC3UxTZ8mlrBEY','2023-01-12 15:42:16.096401'),('qkhz6jr91aq1tdivqd5trehssnu3a9ed','eyJfc2Vzc2lvbl9leHBpcnkiOjEyMCwidXNlciI6IlVzZXJJRC0yZDI3NTkwMC1hYzQwLTQyZTEtYmRmNC1mZDAxZTJkY2E5MjQifQ:1pFtFR:NdFAOYYaf36zwgIAAJnoK3iizvVE_5KnjRORFRhbek0','2023-01-12 16:49:45.568066'),('qps1h9f9sgfhleoi2narzu7k3p1499le','eyJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9:1pFv8z:2vXQDcZrJerCDRfZ7_Ps14cOkqoO-7Qc4vHHLg-mkMg','2023-01-12 19:19:13.166466'),('r4oz65gogncqwr1f7ugeemenxtbekmr6','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0:1pFyHX:Ud7oL0-rOgtfPRhnSJuNaRgE6RTldGgCkZ_NoijcPvQ','2023-01-12 22:40:15.552327'),('rtvtm5hax3e0jc00uak3ozqe4z38v9pk','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0:1pFuoh:HMj4HLOjNw4nXCMMCTxJ5vI-tRu16dLojWZwF2USrdQ','2023-01-12 18:58:15.351496'),('sgx9zcr6s0c5y4ad14zykp4zjbzjl4pp','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0:1pFb4Z:TenjuJCVBQgJDGFjQHOefcZmHUl4J3XvJweVPIAIqp4','2023-01-11 21:53:19.265245'),('su1xknofxrlnnzywwae8em5xgoamv92q','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0:1pFRic:SINTGXNKbcfDWjVLT9scdik9LAdb6R6I2yb9LZo68lU','2023-01-11 11:54:02.628684'),('tf3asfjgz8ph4547xc9lr6nip4mnl1nx','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0:1pFYp6:q5T-r3RuRON6RxusdPYaYvGT82B5y9n0Y0Ujdreaa5I','2023-01-11 19:29:12.672940'),('ts1y7tq0y6prvoshhpew38hwm3d08202','eyJ1c2VyIjoiVXNlcklELWJjZGUyMTIxLTk4NzctNDdiNi1iMjFlLTE3ODBlMzhhYmU4ZSIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0:1pFuC1:xjjdDchHdXvdcFysiKUWpwyca5VgqI_LABMJDkat2II','2023-01-12 18:18:17.377245'),('ucl5asqyj46lcl5dsrh92lwv2j1yupj9','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0:1pFZce:l1xJvaIRPk0LWNh-FziCqdox1nTN65a7tJ88ITo20pE','2023-01-11 20:20:24.620667'),('uhim9f9at9f35zzpdxl2a7k3pozqo5av','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTIwfQ:1pFt6n:lae2bAeho16wCoY4n92HLrh2Dk-ST-w4qJ7O8KCtMWk','2023-01-12 16:40:49.302506'),('uxyfft0wpm0attdctvs8j1twfxn1rbxt','eyJ1c2VyIjoiVXNlcklELWJjZGUyMTIxLTk4NzctNDdiNi1iMjFlLTE3ODBlMzhhYmU4ZSIsIl9zZXNzaW9uX2V4cGlyeSI6MTIwfQ:1pFrew:OBiSx0izKK-g9pX75Ur4Cce2yMkYqYKTOZ94UgM9eTo','2023-01-12 15:07:58.385514'),('vs7uewjkwgp76jfi5cp538b2h2dv3mps','eyJ1c2VyIjoiVXNlcklELWJjZGUyMTIxLTk4NzctNDdiNi1iMjFlLTE3ODBlMzhhYmU4ZSIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0:1pFgsC:T6kR91C2jpAk7IXpirbWyRKjSh4UxAj0oAArITjVHrI','2023-01-12 04:04:56.823439'),('vxebqtc0ba6lrq2378wbv9js4cu5crwn','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0:1pFk1i:DoO0rso6vYIFEsjV5HfaOjgDSHnD0udIwjwEKlfM1vo','2023-01-12 07:26:58.359590'),('wms03wrl2ut292tbjz833fw463tg847a','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0:1pFSOQ:P0-VFf4U2WR6d6mcZvca4Vs3gEhimPFypi-3XFIhJFg','2023-01-11 12:37:14.448599'),('xb53anvztihtx1zpmhm302qlg2n513y2','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTIwfQ:1pFshL:v9tQQFxx7XbsvJfc7BmPq-aA_xcwFd0DkUe58HTudyU','2023-01-12 16:14:31.537073'),('xsnajkdsgpehlorhwt7zyg5tb9l7mrw1','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTIwfQ:1pFtIU:OaTuKSC8de928hRvLCi695tvI9rbJ_PAdnrDG-8YkHY','2023-01-12 16:52:54.135681'),('xylz1mfzpb9jyjrahwmli0ogi9x7fkvz','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0:1pFKnc:xekjjPwb8RMiBANT0sJu7FeyXTA5T6Y0_FV9Abmnh5w','2023-01-11 04:30:44.248215'),('ywok6j1w6oxxq0v67f2xsknioblswzqs','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0:1pFjXD:gHb2TW1wV7A8BBDXp2QSxYJQxXRzwKreYXhAuJyCdIQ','2023-01-12 06:55:27.634097'),('z0r92g1ni9tity4vvqua60scssntft9t','eyJfc2Vzc2lvbl9leHBpcnkiOjE4MDAsInVzZXIiOiJVc2VySUQtMmQyNzU5MDAtYWM0MC00MmUxLWJkZjQtZmQwMWUyZGNhOTI0In0:1pFIYD:Eg34k9n0IlfsIwDy12IJJNr7j2Y8Iod5cBKKbgUR6f8','2023-01-11 02:06:41.432760'),('zcspzjxcj02jag9kqd45xn3aapau9hlv','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTIwfQ:1pFrml:bUMuDhRqV6wjF65fWnP3zb_3tpW4PmS3GZ_XpDsy2Oc','2023-01-12 15:16:03.466248'),('zdg1gd014ryu10l5hufesjonq02ivpyw','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0:1pFMTB:bZbOeqUZD4h470cngI5Q3FUDEflnitj_l0H4Huq97ic','2023-01-11 06:17:45.436521'),('zktkpviappp6vzzs378gpev3jgx05uhv','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTIwfQ:1pFsoR:evtnqyrQmDSDLdO9tHVHsQ9QkX5GlzdM0O0UWiar1Nw','2023-01-12 16:21:51.223785'),('zninlfhzqqbli0j5sozfgkg31wsprf2v','eyJ1c2VyIjoiVXNlcklELTJkMjc1OTAwLWFjNDAtNDJlMS1iZGY0LWZkMDFlMmRjYTkyNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTIwfQ:1pFsSp:Q5mSc_y3Eed22qhwHLC94QvKThEra3vvoCeAybYBBlk','2023-01-12 15:59:31.627295');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_addpur`
--

DROP TABLE IF EXISTS `myapp_addpur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_addpur` (
  `APID` varchar(10) NOT NULL,
  `APNAME` varchar(15) NOT NULL,
  `APSIZE` varchar(10) NOT NULL,
  `APCOLOR` varchar(10) NOT NULL,
  `APPRICE` int NOT NULL,
  PRIMARY KEY (`APID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_addpur`
--

LOCK TABLES `myapp_addpur` WRITE;
/*!40000 ALTER TABLE `myapp_addpur` DISABLE KEYS */;
INSERT INTO `myapp_addpur` VALUES ('P00001','低筒襪','S','白',50),('P00002','低筒襪','M','白',50),('P00003','低筒襪','L','白',50),('P00004','低筒襪','S','黑',50),('P00005','低筒襪','M','黑',50),('P00006','低筒襪','L','黑',50),('P00007','中筒襪','S','白',50),('P00008','中筒襪','M','白',50),('P00009','中筒襪','L','白',50),('P00010','中筒襪','S','黑',50),('P00011','中筒襪','M','黑',50),('P00012','中筒襪','L','黑',50),('P00013','高筒襪','S','白',50),('P00014','高筒襪','M','白',50),('P00015','高筒襪','L','白',50),('P00016','高筒襪','S','黑',50),('P00017','高筒襪','M','黑',50),('P00018','高筒襪','L','黑',50);
/*!40000 ALTER TABLE `myapp_addpur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_bag`
--

DROP TABLE IF EXISTS `myapp_bag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_bag` (
  `BID` varchar(10) NOT NULL,
  `STATE` varchar(10) NOT NULL,
  PRIMARY KEY (`BID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_bag`
--

LOCK TABLES `myapp_bag` WRITE;
/*!40000 ALTER TABLE `myapp_bag` DISABLE KEYS */;
INSERT INTO `myapp_bag` VALUES ('B00001','已租借'),('B00002','已租借'),('B00003','已租借'),('B00004','已租借'),('B00005','已租借'),('B00006','未租借'),('B00007','未租借'),('B00008','未租借'),('B00009','未租借'),('B00010','未租借'),('B00011','未租借'),('B00012','未租借'),('B00013','未租借'),('B00014','未租借'),('B00015','未租借'),('B00016','未租借'),('B00017','未租借'),('B00018','未租借'),('B00019','未租借'),('B00020','未租借');
/*!40000 ALTER TABLE `myapp_bag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_delivery`
--

DROP TABLE IF EXISTS `myapp_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_delivery` (
  `ORDID` varchar(10) NOT NULL,
  `SHOPID` varchar(10) NOT NULL,
  `PHONE` varchar(15) NOT NULL,
  `ADDRESS` varchar(25) NOT NULL,
  `GDATE` datetime(6) NOT NULL,
  `S_CODE` varchar(100) NOT NULL,
  `G_CODE` varchar(100) NOT NULL,
  PRIMARY KEY (`ORDID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_delivery`
--

LOCK TABLES `myapp_delivery` WRITE;
/*!40000 ALTER TABLE `myapp_delivery` DISABLE KEYS */;
INSERT INTO `myapp_delivery` VALUES ('1','S000001','0976663252','桃園市中壢區環中東路770號','2023-01-12 12:25:00.000000','',''),('10','S000001','0933739605','彰化縣','2023-01-14 00:33:00.000000','',''),('2','S000001','0976663252','桃園市中壢區環中東路770號','2023-01-12 14:00:00.000000','',''),('3','S000001','0976663252','桃園市中壢區環中東路770號','2023-01-13 17:39:00.000000','',''),('4','S000001','0958110530','環中東路','2023-01-14 20:09:00.000000','',''),('7','S000001','0933739605','彰化縣','2023-01-13 01:46:00.000000','','');
/*!40000 ALTER TABLE `myapp_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_flmachin`
--

DROP TABLE IF EXISTS `myapp_flmachin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_flmachin` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `FMID` varchar(10) NOT NULL,
  `ORDID` varchar(10) NOT NULL,
  `TIME` int NOT NULL,
  `FMODE` varchar(10) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_flmachin`
--

LOCK TABLES `myapp_flmachin` WRITE;
/*!40000 ALTER TABLE `myapp_flmachin` DISABLE KEYS */;
INSERT INTO `myapp_flmachin` VALUES (1,'F000001','1',0,'不折'),(2,'F000002','2',0,'不折'),(3,'F000003','3',0,'不折'),(4,'F000001','4',20,'機器人'),(5,'F000001','5',0,'不折'),(6,'F000002','6',20,'機器人'),(7,'F000002','7',20,'機器人'),(8,'F000003','8',20,'機器人'),(9,'F000004','9',20,'機器人'),(10,'F000005','10',0,'不折');
/*!40000 ALTER TABLE `myapp_flmachin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_fmachineinfo`
--

DROP TABLE IF EXISTS `myapp_fmachineinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_fmachineinfo` (
  `FMID` varchar(15) NOT NULL,
  `STATE` varchar(10) NOT NULL,
  PRIMARY KEY (`FMID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_fmachineinfo`
--

LOCK TABLES `myapp_fmachineinfo` WRITE;
/*!40000 ALTER TABLE `myapp_fmachineinfo` DISABLE KEYS */;
INSERT INTO `myapp_fmachineinfo` VALUES ('F000001','已使用'),('F000002','已使用'),('F000003','已使用'),('F000004','已使用'),('F000005','已使用'),('F000006','未使用'),('F000007','未使用'),('F000008','未使用'),('F000009','未使用'),('F000010','未使用'),('F000011','未使用'),('F000012','未使用'),('F000013','未使用'),('F000014','未使用'),('F000015','未使用'),('F000016','未使用'),('F000017','未使用'),('F000018','未使用'),('F000019','未使用'),('F000020','未使用');
/*!40000 ALTER TABLE `myapp_fmachineinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_hstate`
--

DROP TABLE IF EXISTS `myapp_hstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_hstate` (
  `ORDID1` int NOT NULL AUTO_INCREMENT,
  `MEMID1` varchar(43) NOT NULL,
  `APPID1` int NOT NULL,
  `C_AMOUNT1` int NOT NULL,
  `GPOINT1` int NOT NULL,
  `AMOUNT1` int NOT NULL,
  `CDATE1` datetime(6) NOT NULL,
  `WMODE1` varchar(10) NOT NULL,
  `LMODE1` varchar(10) NOT NULL,
  `FMODE1` varchar(10) NOT NULL,
  `GIVE1` varchar(15) NOT NULL,
  `COLLAR1` varchar(15) NOT NULL,
  `ADDITION1` varchar(100) NOT NULL,
  `HDATE1` int NOT NULL,
  `SHOPID1` varchar(10) NOT NULL,
  `WMID1` varchar(10) NOT NULL,
  `FMID1` varchar(10) NOT NULL,
  `LOCKID1` varchar(10) NOT NULL,
  `BAGID1` varchar(10) NOT NULL,
  `PFTIME1` datetime(6) NOT NULL,
  `CLTIME1` datetime(6) NOT NULL,
  `CLOTH1` varchar(15) NOT NULL,
  `COLSTATE1` varchar(15) NOT NULL,
  `PAYSTATE1` varchar(15) NOT NULL,
  `JS1` varchar(15) NOT NULL,
  `JS2` varchar(15) NOT NULL,
  `JS3` varchar(15) NOT NULL,
  `JS4` varchar(15) NOT NULL,
  `JS5` varchar(15) NOT NULL,
  `JS6` varchar(15) NOT NULL,
  `JS7` varchar(15) NOT NULL,
  `QRCODE` varchar(50) NOT NULL,
  `ACTIVATE` varchar(15) NOT NULL,
  PRIMARY KEY (`ORDID1`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_hstate`
--

LOCK TABLES `myapp_hstate` WRITE;
/*!40000 ALTER TABLE `myapp_hstate` DISABLE KEYS */;
INSERT INTO `myapp_hstate` VALUES (5,'UserID-2d275900-ac40-42e1-bdf4-fd01e2dca924',5,3,35,103,'2023-01-12 18:17:00.000000','標準','日曬','不折','自行送洗','自取','黑低筒襪Mx1,',1470,'S000001','W000001','F000001','L000001','B00001','2023-01-12 18:20:00.000000','2023-01-13 22:47:00.000000','已完成','可領取','未付款','#QR5','#QR_show5','#close5','QR5','QR_show5','close5','btn5','../../static/img/qrcode/qrcode5.png','active'),(7,'UserID-1ca181f1-f360-4e05-a82a-20e1552cfa82',5,18,25,178,'2023-01-12 20:07:00.000000','快洗','高溫烘乾','機器人','外送服務','外送服務','黑中筒襪Sx1,黑高筒襪Mx1,',100,'S000001','W000002','F000002','L000002','B00002','2023-01-12 21:50:00.000000','2023-01-13 01:46:00.000000','處理中','尚未能領取','未付款','#QR7','#QR_show7','#close7','QR7','QR_show7','close7','btn7','../../static/img/qrcode/qrcode7.png','active'),(8,'UserID-1ca181f1-f360-4e05-a82a-20e1552cfa82',5,9,30,114,'2023-01-12 20:07:00.000000','快洗','日曬','機器人','自行送洗','自取','黑低筒襪Mx1,',1480,'S000001','W000003','F000003','L000003','B00003','2023-01-12 22:00:00.000000','2023-01-14 00:47:00.000000','處理中','尚未能領取','未付款','#QR8','#QR_show8','#close8','QR8','QR_show8','close8','btn8','../../static/img/qrcode/qrcode8.png',''),(9,'UserID-1ca181f1-f360-4e05-a82a-20e1552cfa82',5,6,30,311,'2023-01-12 20:13:00.000000','標準','日曬','機器人','自行送洗','自取','白中筒襪Sx4,白高筒襪Sx1,',1490,'S000001','W000004','F000004','L000004','B00004','2023-01-12 22:10:00.000000','2023-01-14 01:02:00.000000','處理中','尚未能領取','未付款','#QR9','#QR_show9','#close9','QR9','QR_show9','close9','btn9','../../static/img/qrcode/qrcode9.png',''),(10,'UserID-1ca181f1-f360-4e05-a82a-20e1552cfa82',5,6,35,106,'2023-01-12 20:14:00.000000','快洗','日曬','不折','自行送洗','外送服務','白低筒襪Sx1,',1460,'S000001','W000005','F000005','L000005','B00005','2023-01-12 22:15:00.000000','2023-01-14 00:33:00.000000','處理中','尚未能領取','未付款','#QR10','#QR_show10','#close10','QR10','QR_show10','close10','btn10','../../static/img/qrcode/qrcode10.png','');
/*!40000 ALTER TABLE `myapp_hstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_lock`
--

DROP TABLE IF EXISTS `myapp_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_lock` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `LOCKID` varchar(10) NOT NULL,
  `ORDID` varchar(10) NOT NULL,
  `INDATE` varchar(50) NOT NULL,
  `OUTDATE` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_lock`
--

LOCK TABLES `myapp_lock` WRITE;
/*!40000 ALTER TABLE `myapp_lock` DISABLE KEYS */;
INSERT INTO `myapp_lock` VALUES (1,'L000001','1','2023-01-12 10:25','2023-01-12 12:25:00'),(2,'L000002','2','2023-01-12 12:00','2023-01-12 14:00:00'),(3,'L000003','3','2023-01-13 15:39','2023-01-13 17:39:00'),(4,'L000001','4','2023-01-13 20:10','2023-01-14 20:09:00'),(5,'L000001','5','2023-01-13 20:47',''),(6,'L000002','6','2023-01-13 21:32','2023-01-13 23:31:00'),(7,'L000002','7','2023-01-12 23:47',''),(8,'L000003','8','2023-01-13 22:47',''),(9,'L000004','9','2023-01-13 23:03',''),(10,'L000005','10','2023-01-13 22:34','');
/*!40000 ALTER TABLE `myapp_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_lockerinfo`
--

DROP TABLE IF EXISTS `myapp_lockerinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_lockerinfo` (
  `LOCKID` varchar(15) NOT NULL,
  `STATE` varchar(10) NOT NULL,
  PRIMARY KEY (`LOCKID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_lockerinfo`
--

LOCK TABLES `myapp_lockerinfo` WRITE;
/*!40000 ALTER TABLE `myapp_lockerinfo` DISABLE KEYS */;
INSERT INTO `myapp_lockerinfo` VALUES ('L000001','已使用'),('L000002','已使用'),('L000003','已使用'),('L000004','已使用'),('L000005','已使用'),('L000006','未使用'),('L000007','未使用'),('L000008','未使用'),('L000009','未使用'),('L000010','未使用'),('L000011','未使用'),('L000012','未使用'),('L000013','未使用'),('L000014','未使用'),('L000015','未使用'),('L000016','未使用'),('L000017','未使用'),('L000018','未使用'),('L000019','未使用'),('L000020','未使用'),('L000021','未使用'),('L000022','未使用'),('L000023','未使用'),('L000024','未使用'),('L000025','未使用'),('L000026','未使用'),('L000027','未使用'),('L000028','未使用'),('L000029','未使用'),('L000030','未使用');
/*!40000 ALTER TABLE `myapp_lockerinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_login`
--

DROP TABLE IF EXISTS `myapp_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_login` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `FKcheck` varchar(36) NOT NULL,
  `Rstate` varchar(42) NOT NULL,
  `Raccesscode` varchar(43) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_login`
--

LOCK TABLES `myapp_login` WRITE;
/*!40000 ALTER TABLE `myapp_login` DISABLE KEYS */;
INSERT INTO `myapp_login` VALUES (1,'e50afb90-eef6-48f6-a330-2239d7c7776b','State-0e6ec9d0-929f-4c04-8eff-a06999a842cc',''),(2,'3fb441ab-c39c-4ad5-937d-79b9df1c3c56','State-26fadf68-fb20-4f04-9adc-edeb35e3b934',''),(3,'b0e6a2b9-bf78-44af-9308-5bfe6d503334','State-7cf7ee36-fc5a-4e78-bae4-56719075364e',''),(4,'30b5737b-3737-4278-8daf-facbd418448a','State-6318c284-581d-4b67-9d55-21397c58b2ac',''),(5,'70ce2e8d-967d-426a-b97b-f6fd788eea11','State-84899de5-8c1a-440e-8735-40876337ee81',''),(6,'caf0694d-4be0-4494-98b6-37a6c76ce1ec','State-fa85c114-78da-4c64-8e10-7542c603de8f',''),(7,'5f292166-1e18-4e80-853a-83bcad1bad62','State-12c9e2f6-26ce-4d8b-976a-dc483756bce8',''),(8,'b0a1c10f-9c8e-4daa-96f5-4a36598ccb1c','State-b21dc570-7d0e-4a12-9aa1-96c355f2de7f',''),(9,'d8ca4503-1a8e-4b0d-9af3-03a24a62cf2b','State-d0fd30da-789c-4a96-b3ca-af0203faeb1a',''),(10,'dcd3655b-af6c-4676-adca-2416b9429aa1','State-a74139a6-edad-454c-952d-b0d6374a34ea',''),(11,'b27c9a8b-aec5-4ddc-959e-f91fb746418e','State-ddc0cd48-bfde-4020-87eb-fa24e4e4a7b2',''),(12,'aac58e89-5144-4d31-853f-9bc0b90c424b','State-f39e3896-d308-4324-bc98-956ce503b563',''),(13,'2783a7b3-bb0f-4469-9903-436b07634a45','State-56d907ba-8723-4218-bd45-35aa18aa5446',''),(14,'f21baff9-00c1-4d2d-9a20-45b2f625d5f8','State-ecbbdefd-e9cb-41b9-a860-4aa8b797a0d1',''),(15,'b2725694-9082-460b-9375-01ea031cfe93','State-d846620e-f090-472a-981c-5d947f62d233',''),(16,'13359f4a-d1f2-4e2f-93fd-b39f29fcd72f','State-b89a9238-005e-42f6-b40f-3e271f762f57',''),(17,'11af10fc-5aef-43c1-bb34-06869c26ae23','State-a05a2f0d-775a-4c3f-8278-9352cec2be94',''),(18,'8567b465-7c30-401a-a97c-5050abac678f','State-26c6c009-aa13-43f7-84cc-9333d5888635',''),(19,'ca09050f-bdf0-4a34-b9f4-11443cc778fc','State-88cbef77-afa3-4ccc-b189-2bd9405c9dd1',''),(20,'f82d4bca-5cea-4f0b-9ac3-c936a3158b53','State-60656cf8-3376-42d2-823e-fb50d9df2ea6',''),(21,'8261e7f1-2221-4d85-8fb9-5315d6900ca3','State-1c182b28-f88d-455b-9413-f114086762f8',''),(22,'0a8dfee0-0719-4f19-ab25-eba41edd4071','State-a269ac5c-0ea8-4f46-b2a3-f506337a1c58',''),(23,'332ec71a-ae18-4729-8ced-7f6a63ea1c0e','State-fca9fbd6-8992-44e9-8643-fe47a63eb53e',''),(24,'73073e84-0648-45f9-86af-d59e97dd805e','State-9553f500-a2c8-4c19-b709-a64d0ac3495e',''),(25,'00a0e9a3-fee5-4a37-b370-78500919fe60','State-d515e964-e63c-4090-a998-8d0a10eae1ea',''),(26,'3d26dbdc-6f76-4e00-844d-e938081a0eec','State-7dc65d57-e5bf-4db6-b6c2-0a671b687d89',''),(27,'4b032697-1ba3-4356-bac6-d783a721cea7','State-4478eebc-4652-43b5-ae23-7b0feb184c29',''),(28,'fc5c65dc-286c-46bc-a33d-ee7ca05834a0','State-f58b2348-1787-4012-9c48-9fbc05ccd6ab',''),(29,'b259205e-3f7f-4432-a1ed-1644efbaa71c','State-375cc704-a53b-4aae-b4d1-b2365f0a705b',''),(30,'5086265b-881c-46b2-ab6f-df13b45a78f4','State-80ac8abc-4d90-4c50-9266-9701faee6c1e',''),(31,'60162727-3f32-4f81-8f22-034b014bc86b','State-c747c63b-e7a5-42de-a61a-1a1bf5bafaf8',''),(32,'91eb21df-8a9a-47dc-bf21-8f4335466dba','State-c4d2131c-ac8f-411e-a1f2-9ac16948eacf',''),(33,'61cf5c69-cc92-41fd-b751-b18f95370156','State-4d2936fd-a55d-4ece-9152-fd6e3e825308',''),(34,'15a04af6-4a25-4345-ad1f-ae9879f01cb9','State-5d0e5322-5272-4fc4-b06c-72b15b1f3922',''),(35,'c7d67a11-aaf0-4cc6-8ee9-d40e021494bf','State-51810322-1d3f-4cd1-84fd-75c567ced90a',''),(36,'b351aba0-8c93-4991-af9d-1d2577e0f759','State-6ab2fa29-2b68-4535-8d41-0af0214cf7a4',''),(37,'317660a3-4f0f-4282-814e-69d6121a2056','State-52683bdf-e91a-4db8-b523-9c42438e1ff6',''),(38,'62bbc084-e841-458d-b310-c17a5745a14e','State-39c773d9-affa-489b-913e-4889480b1ae9',''),(39,'d9ae177b-1d98-4d14-918b-88e45e9d58c9','State-c808b0da-628a-4b11-80cf-f56cc3096b80',''),(40,'5fa20d90-bdd9-4d8c-9b16-c2e611b72d8c','State-836a438e-bbd8-429f-b1e7-ab81f94b19b4',''),(41,'dd960915-9d06-4ec5-8142-3f20dcc1abde','State-9ae7cd22-17fe-482a-8986-7ca1aecc6e00',''),(42,'0029ab7d-e0f8-48c2-a722-983cb73c6f91','State-c5085e1c-9143-4aab-a762-79d77e457859',''),(43,'82bf9190-e169-4ec3-ad2c-6ed19f8247e8','State-74f78a3c-f07a-4bec-9dec-881cf7e63129',''),(44,'f7cbf913-696c-4c3f-8fdf-71fc7285c4df','State-e516d10a-a406-41b3-b63a-2c607b595209',''),(45,'349fb705-8488-4c10-8409-1ee601761e46','State-af8cbcaf-32de-4581-a27b-db6ba591cf3f',''),(46,'495e2bb4-cf53-4ca2-a1b5-240d1791d35f','State-deaca953-4767-4b66-8933-929203c25ec2',''),(47,'a99358cb-e9f9-47bd-a3ca-8328d88692d8','State-20674e31-c78e-41d9-a245-a081581d5a83',''),(48,'6e7b2859-fc53-4f76-bb53-ff2d3c9815b4','State-e6a862a6-d710-4ce2-8758-44643a945484',''),(49,'083264d1-a405-43c4-9d32-b4376e27b683','State-b68a18fe-68e8-4d61-96b3-5166fe053a0a',''),(50,'ad36c019-dffe-4ba7-a552-2953fe51e038','State-e1b714e0-1466-4269-ad9b-ec8310f32b82',''),(51,'76074e1c-7f2e-404a-9c2a-d1ee73ea906c','State-8be515dd-3081-4995-a221-b8e340a4316d',''),(52,'734a292b-2429-4e2d-8a2e-6a14d9362193','State-4590ad9d-c004-477e-b7f2-d300c7ff06b3',''),(53,'cd2f0d24-58f9-4c3e-9ec5-ce2589ac06ac','State-5c0747b5-9853-465d-b195-f47a7e384564',''),(54,'da8de4f2-9c6e-4bd0-b343-2178fb018444','State-80d30d22-d721-44d9-bff7-1121dc866a79',''),(55,'7857705e-2f4b-4026-b650-1c6cbf3a574d','State-ad192425-99b1-4779-86bf-6fba81d2e15c',''),(56,'50ec1e0d-59a6-4858-9c15-99bb7f06e5a2','State-1a55af49-1343-4948-beb5-96c69056639f',''),(57,'66772e14-b6fb-459d-883b-bd35eafd9ab0','State-705dc6f1-17d4-4fff-9164-cd204843dc16',''),(58,'95de3012-cc9e-4833-afc9-637a26481e74','State-3bc7cfb1-1d84-4417-94b1-1fce38a5fb0e',''),(59,'b96161f0-4253-46f6-92c1-12c0e01a99bf','State-cc085072-d44b-4cbb-9ad1-7666586a81e8',''),(60,'1db95adc-959f-4957-ab55-de49a1c3bf9e','State-7bccc5a3-887e-4320-bb2c-be73729a02bf',''),(61,'dd3d7f84-4ba9-4437-8364-ed60d9e2a78f','State-97848dc3-12a2-4548-9431-75f15287674a',''),(62,'4bb7e20d-05c0-4aac-b53e-5d7001e2ec89','State-6833874f-7659-4f44-835b-259167c11ba8',''),(63,'79415e78-4674-4607-b225-100daf43a332','State-2a9bfb39-4d18-4020-8823-bdf20fde987c',''),(64,'09b211b7-2140-416f-b319-b2ac929ef159','State-e966bdd1-6239-4cc2-a52b-71f6f111fa73',''),(65,'7edd4f2f-d4cd-4ba2-8f56-695c120dd82a','State-4e9cd36f-aeaa-40ab-8be9-a65e87fc2249',''),(66,'241d8cbc-e0bd-4b24-b5b7-c70c759fe76c','State-6d35499e-5a10-464a-9150-cd2e1d7de681',''),(67,'fd41b1cd-880a-482a-a96b-e3186a28f515','State-fa182599-7d3c-4a6c-a556-ea575c6eecd6',''),(68,'9509e2fa-84f0-46bb-8deb-4bba0c15dfb5','State-8c1f3d76-8032-41ad-b30c-01dbcac74d8a',''),(69,'a7bba87e-a90f-4853-b9cc-2410cba00167','State-2845b03a-0db2-4240-800f-e46621524d33',''),(70,'709b8b05-6d07-4f94-b0ff-cc0a898943ee','State-f1fc4b21-5541-47f1-b288-9cb8ca478163',''),(71,'fc5ee4fe-47bc-46ed-96f7-9416d70ed373','State-d2298915-e5f8-4861-9af7-dd4fa527baaf',''),(72,'7a59f69a-a690-4a00-8d22-73f6771fecb1','State-9cabc134-6022-418f-b4b9-b8b84da822e1',''),(73,'30cbb55f-37fd-497f-8b3b-cfd5a92883ef','State-a90ff624-0610-4d89-be7b-84f93661629c',''),(74,'9cc27f2b-e484-4a6e-9d90-6ffa2d0e808a','State-1a09d677-e255-4612-bb8c-486d4a8935d5',''),(75,'91fa73f7-d377-40c1-81c8-54cf7c10375b','State-1672ffa1-feee-4ab8-bdb8-92c2f550de8d',''),(76,'e8c557ba-0bef-44c7-b7bd-265738ed75de','State-09738ccf-25f7-4997-9daf-931c1a2baa8f',''),(77,'453b44e3-9d02-486b-8f2c-bac17ae2380b','State-7f5afed4-f04a-4513-986a-8c7d2802fc27',''),(78,'9e004e4d-4924-47e0-baf0-31878707a889','State-c322f4a2-eaed-46e5-892a-e7adf2138697',''),(79,'49169888-309a-4d0c-87ee-682fa467d101','State-90413a71-8ee5-4e10-a2f6-a65ff8793470',''),(80,'d69f7c96-ee31-4e88-ad7b-97815a4cd5b8','State-889508b7-bea1-4fd0-a316-549a8e9e7cda',''),(81,'6d850f86-8fa6-4ac2-bad1-5ce7d9bd221b','State-4e56a545-fc84-4bb9-96c8-8369cf3787d4',''),(82,'c20657aa-e942-404d-9b83-8c943ab6a00d','State-bf252e5b-87ce-4b1f-9849-8b7458b77b07',''),(83,'89ab0638-7b0d-4fd6-8700-36043e7e4a69','State-7262f749-a3e3-48fb-a6cb-ba2ef239c75f',''),(84,'6a2e5fc5-0efb-492f-9799-c2f37093bfe4','State-0a5acc36-1b44-442d-84df-cbcd0280af42',''),(85,'0bb26530-3155-4fdd-9374-f5b0559caf7c','State-c42e8783-79c4-43ae-bec4-1b1a1a317223',''),(86,'fbb8bc3f-6c86-4497-bdd8-0debdf96ce29','State-4e1b2c74-0225-41ca-9259-33c9ab7a1281',''),(87,'b1e88f35-c85c-4a05-bce0-c3ce7ce27013','State-0c86d64c-160a-44e4-b64b-4044b5740ee1',''),(88,'757a74a5-ad95-4eb3-9541-729fcf661891','State-6c90e2d2-84a1-47ca-b99d-71c76cf3df13',''),(89,'699837d8-4da8-4ec5-ada5-f290eaf91275','State-84abd35a-e00b-46bf-b352-e10225a11696',''),(90,'1d319a31-f933-4fe6-b4f6-1641c4a187fb','State-c0afd630-b4fa-46d8-bab6-0b81007921af',''),(91,'64d9bbb0-929b-49a8-9431-6e71fe86d106','State-7419bdf9-6f6a-400e-971f-7beaab324443',''),(92,'8bcbc0a5-4808-492b-ae98-6783692c8f64','State-fb4586e4-2225-480a-bc4b-8eb461434777',''),(93,'ff3dd836-5079-4568-88eb-2577c48d37ec','State-54ec9a20-125e-4764-8655-0c6277c43906',''),(94,'605df6a9-431d-48fc-b19a-cd8680b45d81','State-e1dbc811-07c3-4061-9229-022c4f3ab5f7',''),(95,'eda8a416-7ba8-45b8-a298-97c21bdc3035','State-9b3b2076-011b-4691-bd37-d0da1debbba0',''),(96,'ac90ee8d-66ca-4c3d-9dd8-59c96c658504','State-2400dc42-2b4c-4005-85fc-54135a57cbd3',''),(97,'8d103257-eda5-4bb0-a6f8-d463eca7a511','State-5f24c873-89c3-4d40-9ed8-db5cf44b05d2',''),(98,'ef985d3a-709d-4aac-a9e9-2566a8738471','State-b2db1123-42ce-47ef-af85-054fccf285c8',''),(99,'f569c71f-129d-477e-908b-af9e8c4f472a','State-c967c0dd-467f-41c8-b2c8-86f4fb29839f',''),(100,'24376de1-f732-4233-96fe-4f80499b64f0','State-e7c48ecf-9f4c-404d-b3c7-c54007fdd343',''),(101,'634955f4-3557-4d2e-8b3d-5644d28cd3d5','State-afe80c32-7b18-49ff-acba-2e89d5c3775d',''),(102,'dda97c94-d958-4e45-877a-e30013885e23','State-35535047-6b64-4245-be09-9ca9cbc60cfa',''),(103,'08d9cc2b-6888-4b63-9651-342ecfe3658c','State-2741e3ca-2152-40e6-930f-facba3bd16a2',''),(104,'040f14c4-fd3b-4f06-a094-649d311594d5','State-7ca3cdf8-05b2-41ee-8f97-245b1aa3fd00',''),(105,'97933fcc-c57b-4bcf-99bf-281cc7f3ea28','State-df02b0f2-fa28-46d1-ae9a-e0ed017e0fdc',''),(106,'f6b462a5-9590-4559-9ddd-a97d2c0c25d9','State-460b92b8-8183-4669-b23d-68c1d60bef14',''),(107,'33caa452-a989-4a52-97c8-101ed087425c','State-af00a9a1-1e6d-43e8-a8b3-cae743e7af02',''),(108,'46c17d0b-7ff3-466e-8374-766dc6527278','State-1de10393-9312-4496-8d36-c3b3dc5e3936',''),(109,'6f29ab0d-b194-4d57-a490-8339d06a5374','State-ddaa444c-874e-4d5d-bcf4-085db1185ba3',''),(110,'a4560feb-ff60-4a1b-b2eb-57b7e953934b','State-4b7330cf-b3bc-4729-8393-8f1dabc114d8',''),(111,'c7f58b9f-5191-4605-a214-e8f813eb6b84','State-dd730124-9fbe-48d9-9f0f-bfb934b03040',''),(112,'735a08e0-d7e8-46b8-a642-af1423759e19','State-117d0c20-0c73-4adc-ad62-501511def6f8',''),(113,'28f139a5-9a8e-47c4-af53-d77f379a843f','State-51d88aed-9320-45d4-a838-0d123f55e311',''),(114,'6fe04f24-0ef5-4954-8039-3489da782382','State-dce8e12c-aea5-4f83-8bdb-c6b52c4d9234',''),(115,'3dfd8d07-1a70-434d-85a2-9714725f08f3','State-7d39da7a-d77f-4305-90ea-9dd868eef968',''),(116,'c4b76356-7d24-41ed-8197-61adef9ccc0b','State-d678b424-282c-4f7c-83e0-5737a8bd0e7c',''),(117,'6399e482-5c1d-49b6-98e5-e2698aa8c30b','State-808c0bdd-a972-4b37-88b2-ee644fce6717',''),(118,'65471f1a-a0af-4a49-9c07-a20fff03e994','State-2715dade-f0c7-4eb3-9d54-578b9bc4c9e4',''),(119,'1dca0e8e-2fff-4fe1-9994-ae0a48242034','State-52f7f7b8-de0b-46d5-9ce4-c669a8cb4e9e',''),(120,'b3a8ca17-65c8-4903-b45e-a5b1cbc94d75','State-ac6c6d26-f73b-4fe6-8fc7-a1539fdba978',''),(121,'c1ecda2f-4b31-4b14-9fd0-fc1b953daaa5','State-6ff5dd55-da38-4f14-8548-1e484a3409c1',''),(122,'1a961cff-9a6d-4543-bcef-c964eaeab453','State-9bc2d06a-4d0f-4f52-9038-e51b15eb2ae9',''),(123,'3339e734-33d1-460f-aa83-3c8b5de32dfa','State-61cd88ae-0824-41f0-b907-184653a2cbc5',''),(124,'d3cccbfb-af91-4cc0-8bd2-3bff81f68ea8','State-207912d1-cf42-4265-ae56-300ff02bd5f1',''),(125,'5c930e1f-d9b9-4b75-8e9b-2795549813ac','State-ed343d40-693f-4cfa-be12-60099cad5a47',''),(126,'3e445d7c-e94c-4ce9-9ef6-ab6d2dfcc987','State-eb4abb9e-7459-4692-abdd-5c27904a9b9f',''),(127,'a7d16587-559f-4c35-bc40-4b53c8214d97','State-8057bf78-1c59-4f9f-bbcb-f98224c12dad',''),(128,'a9190114-d372-41a3-8995-f0dbad3175cc','State-13564740-a79e-48b6-acb7-f388685485c9',''),(129,'4c909ab7-0048-4cf2-ba1a-168600615056','State-d5aee3c2-c4ff-4a4e-959c-9fd34ea20634',''),(130,'32e22265-1b15-4a0c-8264-10bd5e5bd2bb','State-e75b06f8-0ff1-4dfd-8bc4-3e6c3d401949',''),(131,'c99d858b-d941-4004-a7cc-c767aba94bd9','State-8ecf65ea-1754-494c-9000-34a8971ad6db',''),(132,'62c14609-0d6d-4914-9eb4-8682d9fa9108','State-ab415f64-11fe-4b69-949f-6c8204970a0a',''),(133,'7794ad92-9a3f-42d7-895a-cfefbd507930','State-4f739431-8fc8-49ae-b0f5-da10efea62f3',''),(134,'9e4a5ee1-ae95-429b-9fc9-883bbc83df54','State-9d08973f-ba73-43a7-bddc-e097be1d3e44',''),(135,'704f5e39-92a7-4701-95bc-dfd205d4812f','State-9c19cd4b-5286-4425-a40c-5be04a890d30',''),(136,'68acdce5-9cd0-4a77-bc5a-24df5ae6f0db','State-eaa8b693-f8f7-46b3-bc2c-36be2169221a',''),(137,'5ed4c62a-35b5-462b-bdde-25cde6b60c98','State-fbad8985-d960-45bd-94ff-a550230afee2',''),(138,'22264c45-97fb-4655-a578-9cadbd434ebb','State-74564b8b-e6f7-4044-a618-7d0f3731e3eb',''),(139,'3905b6f4-fd79-4e56-b3c7-7a8f1ac149ef','State-d2553931-65f5-4eae-8bcb-478a309bbba6',''),(140,'88bac47d-17b9-4ae0-a9d6-f4f3873d20ad','State-baa371db-172e-4786-8033-f2d44322583f',''),(141,'0e2aacaa-a982-4b47-bf38-dae80f576de0','State-c715c759-5d04-40fe-afc8-7a567a7db1de',''),(142,'a4db27c5-ea2f-4a78-ac6f-2d2c0d6b25fa','State-6b2be261-6e75-4145-833b-d4f88b880c8f',''),(143,'098cf8ae-7b5e-490e-bb85-3e073b150dcd','State-b74ccad2-4765-47a6-9e85-87d22eac62eb','');
/*!40000 ALTER TABLE `myapp_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_member`
--

DROP TABLE IF EXISTS `myapp_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_member` (
  `MEMID` varchar(43) NOT NULL,
  `PHONE` varchar(10) NOT NULL,
  `ADDRESS` varchar(25) NOT NULL,
  `AUTHORIZATION` varchar(1) NOT NULL,
  `CARD1` varchar(16) NOT NULL,
  `CARD2` varchar(16) NOT NULL,
  `CARD3` varchar(16) NOT NULL,
  `CARD4` varchar(16) NOT NULL,
  `CARD5` varchar(16) NOT NULL,
  `AC_CODE` varchar(43) NOT NULL,
  `WPRE` varchar(15) NOT NULL,
  `DPRE` varchar(15) NOT NULL,
  `FPRE` varchar(15) NOT NULL,
  `GPRE` varchar(15) NOT NULL,
  `CPRE` varchar(15) NOT NULL,
  PRIMARY KEY (`MEMID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_member`
--

LOCK TABLES `myapp_member` WRITE;
/*!40000 ALTER TABLE `myapp_member` DISABLE KEYS */;
INSERT INTO `myapp_member` VALUES ('UserID-1ca181f1-f360-4e05-a82a-20e1552cfa82','0933739605','彰化縣','1','1233874865489748','5599123788459551','無','無','無','Access-5fcd1ca5-154f-48fa-bdef-99ef61e1e008','標準','高溫烘乾','不折','自行送洗','外送服務'),('UserID-2d275900-ac40-42e1-bdf4-fd01e2dca924','0976663252','桃園市中壢區環中東路770號','1','7686557686663453','5465876834538908','無','無','無','Access-daf75beb-5903-4333-a389-c0951700da00','標準','日曬','不折','自行送洗','自取'),('UserID-bcde2121-9877-47b6-b21e-1780e38abe8e','0958110530','環中東路','1','1311515151154684','無','無','無','無','Access-b480a2e1-ed97-484e-a61c-4fed44eb3cf5','快洗','日曬','機器人','自行送洗','外送服務'),('UserID-eac21a6e-9c62-4be4-85ff-282cbae85197','0987449120','你媽的家','1','8888888877777777','無','無','無','無','Access-f1c5db3d-654a-4a21-ace4-519e773d59ea','標準','日曬','不折','自行送洗','自取');
/*!40000 ALTER TABLE `myapp_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_mode`
--

DROP TABLE IF EXISTS `myapp_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_mode` (
  `MODE` varchar(10) NOT NULL,
  `TIME` int NOT NULL,
  `MONEY` int NOT NULL,
  `TAX` int NOT NULL,
  `POINTS` int NOT NULL,
  PRIMARY KEY (`MODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_mode`
--

LOCK TABLES `myapp_mode` WRITE;
/*!40000 ALTER TABLE `myapp_mode` DISABLE KEYS */;
INSERT INTO `myapp_mode` VALUES ('不折',0,0,0,5),('中溫烘乾',120,5,9,0),('低溫烘乾',180,5,9,0),('快洗',20,0,6,5),('日曬',1440,0,0,5),('柔洗',40,5,6,0),('標準',30,0,3,5),('機器人',20,5,3,0),('精緻',50,5,6,0),('高溫烘乾',60,5,9,0);
/*!40000 ALTER TABLE `myapp_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_notice`
--

DROP TABLE IF EXISTS `myapp_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_notice` (
  `NID` int NOT NULL AUTO_INCREMENT,
  `MEMID` varchar(43) NOT NULL,
  `NCONTENT` varchar(100) NOT NULL,
  `NLINK` varchar(100) NOT NULL,
  `NTIME` datetime(6) NOT NULL,
  PRIMARY KEY (`NID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_notice`
--

LOCK TABLES `myapp_notice` WRITE;
/*!40000 ALTER TABLE `myapp_notice` DISABLE KEYS */;
INSERT INTO `myapp_notice` VALUES (1,'UserID-2d275900-ac40-42e1-bdf4-fd01e2dca924','我們在處理您的衣物時，發現襪子和內衣褲有破損狀況!','點我至加購商品頁面','2023-01-10 21:49:00.000000'),(2,'UserID-2d275900-ac40-42e1-bdf4-fd01e2dca924','由於店內設備故障問題，因此您的訂單進度將會延遲!!','','2023-01-10 21:49:00.000000');
/*!40000 ALTER TABLE `myapp_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_order`
--

DROP TABLE IF EXISTS `myapp_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_order` (
  `ORDID` varchar(15) NOT NULL,
  `MEMID` varchar(43) NOT NULL,
  `APPID` int NOT NULL,
  `C_AMOUNT` int NOT NULL,
  `GPOINT` int NOT NULL,
  `AMOUNT` int NOT NULL,
  `CDATE` datetime(6) NOT NULL,
  `WMODE` varchar(10) NOT NULL,
  `LMODE` varchar(10) NOT NULL,
  `FMODE` varchar(10) NOT NULL,
  `GIVE` varchar(15) NOT NULL,
  `COLLAR` varchar(15) NOT NULL,
  `ADDITION` varchar(100) NOT NULL,
  `HDATE` int NOT NULL,
  `SHOPID` varchar(10) NOT NULL,
  `WMID` varchar(10) NOT NULL,
  `FMID` varchar(10) NOT NULL,
  `LOCKID` varchar(10) NOT NULL,
  `BAGID` varchar(10) NOT NULL,
  `CLTIME` datetime(6) NOT NULL,
  PRIMARY KEY (`ORDID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_order`
--

LOCK TABLES `myapp_order` WRITE;
/*!40000 ALTER TABLE `myapp_order` DISABLE KEYS */;
INSERT INTO `myapp_order` VALUES ('1','UserID-2d275900-ac40-42e1-bdf4-fd01e2dca924',5,15,30,70,'2023-01-12 07:05:00.000000','快洗','高溫烘乾','不折','外送服務','自取','無',80,'S000001','W000001','F000001','L000001','B00001','2023-01-12 12:25:00.000000'),('2','UserID-2d275900-ac40-42e1-bdf4-fd01e2dca924',5,15,25,75,'2023-01-12 07:10:00.000000','精緻','中溫烘乾','不折','外送服務','自取','無',170,'S000001','W000002','F000002','L000002','B00002','2023-01-12 14:00:00.000000'),('3','UserID-2d275900-ac40-42e1-bdf4-fd01e2dca924',5,6,30,111,'2023-01-12 12:49:00.000000','精緻','日曬','不折','外送服務','自取','黑低筒襪Sx1,',1490,'S000001','W000003','F000003','L000003','B00003','2023-01-13 17:39:00.000000'),('4','UserID-bcde2121-9877-47b6-b21e-1780e38abe8e',5,9,30,64,'2023-01-12 17:30:00.000000','快洗','日曬','機器人','自行送洗','外送服務','無',1480,'S000001','W000001','F000001','L000001','B00001','2023-01-14 20:09:00.000000'),('6','UserID-eac21a6e-9c62-4be4-85ff-282cbae85197',5,6,30,211,'2023-01-12 18:42:00.000000','標準','日曬','機器人','自行送洗','自取','白低筒襪Sx2,白中筒襪Sx1,',1490,'S000001','W000002','F000002','L000002','B00002','2023-01-13 23:31:00.000000');
/*!40000 ALTER TABLE `myapp_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_report`
--

DROP TABLE IF EXISTS `myapp_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_report` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `MEMID` varchar(43) NOT NULL,
  `RDATE` datetime(6) NOT NULL,
  `TITLE` varchar(50) NOT NULL,
  `DISC` varchar(500) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_report`
--

LOCK TABLES `myapp_report` WRITE;
/*!40000 ALTER TABLE `myapp_report` DISABLE KEYS */;
INSERT INTO `myapp_report` VALUES (1,'UserID-2d275900-ac40-42e1-bdf4-fd01e2dca924','2023-01-10 23:00:00.000000','123','123'),(2,'UserID-bcde2121-9877-47b6-b21e-1780e38abe8e','2023-01-12 17:15:00.000000','ohohohohoh','ohohohohoh');
/*!40000 ALTER TABLE `myapp_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_store`
--

DROP TABLE IF EXISTS `myapp_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_store` (
  `SHOPID` varchar(10) NOT NULL,
  `ADDRESS` varchar(25) NOT NULL,
  `WMAMOUNT` int NOT NULL,
  `FMAMOUNT` int NOT NULL,
  PRIMARY KEY (`SHOPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_store`
--

LOCK TABLES `myapp_store` WRITE;
/*!40000 ALTER TABLE `myapp_store` DISABLE KEYS */;
INSERT INTO `myapp_store` VALUES ('S00001','臺北市萬華區大理街8號',50,50),('S00002','桃園市八德區忠誠街16號',60,60),('S00003','新竹縣竹北市嘉豐五路35號',55,55),('S00004','臺中市大甲區東安路10號',75,75),('S00005','高雄市大寮區內坑路32號',70,70);
/*!40000 ALTER TABLE `myapp_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_wlmachin`
--

DROP TABLE IF EXISTS `myapp_wlmachin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_wlmachin` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `WMID` varchar(10) NOT NULL,
  `ORDID` varchar(10) NOT NULL,
  `TIME` int NOT NULL,
  `WMODE` varchar(10) NOT NULL,
  `LMODE` varchar(10) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_wlmachin`
--

LOCK TABLES `myapp_wlmachin` WRITE;
/*!40000 ALTER TABLE `myapp_wlmachin` DISABLE KEYS */;
INSERT INTO `myapp_wlmachin` VALUES (1,'W000001','1',80,'快洗','高溫烘乾'),(2,'W000002','2',170,'精緻','中溫烘乾'),(3,'W000003','3',1490,'精緻','日曬'),(4,'W000001','4',1460,'快洗','日曬'),(5,'W000001','5',1470,'標準','日曬'),(6,'W000002','6',1470,'標準','日曬'),(7,'W000002','7',80,'快洗','高溫烘乾'),(8,'W000003','8',1460,'快洗','日曬'),(9,'W000004','9',1470,'標準','日曬'),(10,'W000005','10',1460,'快洗','日曬');
/*!40000 ALTER TABLE `myapp_wlmachin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_wmachineinfo`
--

DROP TABLE IF EXISTS `myapp_wmachineinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_wmachineinfo` (
  `WMID` varchar(15) NOT NULL,
  `STATE` varchar(10) NOT NULL,
  PRIMARY KEY (`WMID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_wmachineinfo`
--

LOCK TABLES `myapp_wmachineinfo` WRITE;
/*!40000 ALTER TABLE `myapp_wmachineinfo` DISABLE KEYS */;
INSERT INTO `myapp_wmachineinfo` VALUES ('W000001','已使用'),('W000002','已使用'),('W000003','已使用'),('W000004','已使用'),('W000005','已使用'),('W000006','未使用'),('W000007','未使用'),('W000008','未使用'),('W000009','未使用'),('W000010','未使用'),('W000011','未使用'),('W000012','未使用'),('W000013','未使用'),('W000014','未使用'),('W000015','未使用'),('W000016','未使用'),('W000017','未使用'),('W000018','未使用'),('W000019','未使用'),('W000020','未使用');
/*!40000 ALTER TABLE `myapp_wmachineinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-13 12:17:22
