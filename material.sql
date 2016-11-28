-- MySQL dump 10.13  Distrib 5.7.16, for Linux (x86_64)
--
-- Host: localhost    Database: material
-- ------------------------------------------------------
-- Server version	5.7.16-0ubuntu0.16.04.1
DROP DATABASE IF EXISTS  material;
CREATE DATABASE material;
USE material;

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'专职教师'),(1,'实验室教师');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (62,1,22),(63,1,23),(64,1,28),(65,1,29),(66,1,31),(53,1,32),(54,1,34),(55,1,35),(56,1,36),(57,1,37),(58,1,38),(59,1,40),(60,1,41),(61,1,42),(77,2,34),(76,2,35),(79,2,36),(78,2,43);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(22,'Can add 耗材',8,'add_material'),(23,'Can change 耗材',8,'change_material'),(24,'Can delete 耗材',8,'delete_material'),(25,'Can add 实训室',9,'add_classroom'),(26,'Can change 实训室',9,'change_classroom'),(27,'Can delete 实训室',9,'delete_classroom'),(28,'Can add 初始耗材',10,'add_initmaterial'),(29,'Can change 初始耗材',10,'change_initmaterial'),(30,'Can delete 初始耗材',10,'delete_initmaterial'),(31,'Can add 耗材入库',11,'add_addmaterial'),(32,'Can change 耗材入库',11,'change_addmaterial'),(33,'Can delete 耗材入库',11,'delete_addmaterial'),(34,'Can add 耗材使用申请',12,'add_applymaterial'),(35,'Can change 耗材使用申请',12,'change_applymaterial'),(36,'Can delete 耗材使用申请',12,'delete_applymaterial'),(37,'Can add 购买耗材',13,'add_applybuymaterial'),(38,'Can change 购买耗材',13,'change_applybuymaterial'),(39,'Can delete 购买耗材',13,'delete_applybuymaterial'),(40,'Can list 耗材入库',11,'list_add_material'),(41,'能显示初始耗材列表',10,'list_init_material'),(42,'能显示申请购买的耗材列表',13,'list_buy_material'),(43,'能显示申请使用耗材的列表',12,'list_apply_material');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$3a2ax705eikt$Vrl51H3yX6KaSbyJ6TuQlqFZpbXXHb6Ed21DltBGDoQ=','2016-11-26 15:20:39.316603',1,'liang','梁入双','','v@qq.com',1,1,'2016-11-15 14:26:00.000000'),(2,'pbkdf2_sha256$20000$tYDFyTtBgzK3$1Itt77vAaYKiMP71XHQg/FKFywCbnml57dA21o3NnKI=','2016-11-26 15:25:25.976202',0,'010333','梁入双','','',1,1,'2016-11-16 13:30:00.000000'),(3,'pbkdf2_sha256$20000$mJmmCKH4LkXb$+XpK95D2bAFUTwKoWLeiZAQR/2JvTVZbI9pHbA7D60g=','2016-11-26 15:19:31.469422',0,'010330','吴彦祖','','',1,1,'2016-11-16 14:09:00.000000'),(4,'pbkdf2_sha256$20000$FLkb1zL1ZWZ8$cGQqMf4TtiVIMLBlRNKQJOAkEIPwLd5tw/wnqrtliOk=','2016-11-16 14:10:53.873338',0,'010331','','','',1,1,'2016-11-16 14:10:00.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (2,2,1),(4,3,2);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (21,4,28),(22,4,29),(23,4,30),(24,4,31),(19,4,32),(20,4,33);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_697914295151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-11-16 13:29:52.487502','1','网线',1,'',8,1),(2,'2016-11-16 13:30:09.125410','2','010333',1,'',4,1),(4,'2016-11-16 13:30:18.426631','1','C502',1,'',9,1),(5,'2016-11-16 13:30:21.996861','1','C502-网线',1,'',10,1),(6,'2016-11-16 13:30:37.921643','1','C502-网线-10箱',1,'',11,1),(7,'2016-11-16 13:41:13.705507','1','C502-网线',2,'没有字段被修改。',10,1),(8,'2016-11-16 14:06:45.538379','2','C502-网线-10箱',1,'',11,1),(9,'2016-11-16 14:07:28.452123','2','010333',2,'已修改 is_staff 和 user_permissions 。',4,1),(10,'2016-11-16 14:07:59.412981','3','C502-网线-0箱',1,'',11,2),(11,'2016-11-16 14:08:05.877920','3','C502-网线-0箱',3,'',11,2),(12,'2016-11-16 14:09:05.220786','3','010330',1,'',4,1),(13,'2016-11-16 14:09:17.476666','3','010330',2,'已修改 user_permissions 。',4,1),(14,'2016-11-16 14:09:29.115958','3','010330',2,'已修改 is_staff 。',4,1),(15,'2016-11-16 14:09:51.938865','4','C502-网线-10箱',1,'',11,3),(16,'2016-11-16 14:10:07.140084','5','C502-网线-12箱',1,'',11,3),(17,'2016-11-16 14:10:31.610303','4','010331',1,'',4,1),(18,'2016-11-16 14:10:45.568634','4','010331',2,'已修改 is_staff 和 user_permissions 。',4,1),(19,'2016-11-25 11:21:37.551538','1','网线-C502-liang',1,'',12,1),(20,'2016-11-25 11:21:48.856472','2','网线-C502-liang',1,'',12,1),(21,'2016-11-25 11:24:08.483042','1','实验室教师',1,'',3,1),(22,'2016-11-25 11:24:16.770152','2','010333',2,'已修改 groups，user_permissions 和 last_login 。',4,1),(23,'2016-11-25 11:52:17.039062','2','010333',2,'已修改 first_name 和 last_login 。',4,1),(24,'2016-11-25 11:56:52.779974','3','网线-C502-010333',1,'',12,2),(25,'2016-11-25 12:04:30.200013','1','liang',2,'已修改 first_name 和 last_login 。',4,1),(26,'2016-11-25 12:25:05.201032','1','C502',2,'已修改 admin 。',9,1),(27,'2016-11-25 12:25:09.791930','1','C502',2,'已修改 admin 。',9,1),(28,'2016-11-25 12:25:23.838893','1','C502-网线',2,'没有字段被修改。',10,1),(29,'2016-11-26 10:37:14.876634','1','实验室教师',2,'已修改 permissions 。',3,1),(30,'2016-11-26 10:39:45.629612','1','实验室教师',2,'已修改 permissions 。',3,1),(31,'2016-11-26 10:49:28.223384','6','C502-网线-10箱',1,'',11,1),(32,'2016-11-26 12:14:02.723905','1','实验室教师',2,'已修改 permissions 。',3,1),(33,'2016-11-26 12:15:16.380900','1','实验室教师',2,'已修改 permissions 。',3,1),(34,'2016-11-26 12:19:35.920187','1','网线-C502-010333',1,'',13,2),(35,'2016-11-26 12:26:23.118779','1','实验室教师',2,'已修改 permissions 。',3,1),(36,'2016-11-26 13:18:40.768180','2','专职教师',1,'',3,1),(37,'2016-11-26 13:19:55.223402','2','专职教师',2,'已修改 permissions 。',3,1),(38,'2016-11-26 13:20:21.274934','3','010330',2,'已修改 first_name，groups 和 last_login 。',4,1),(39,'2016-11-26 13:23:50.314229','1','C502-网线',2,'没有字段被修改。',10,3),(40,'2016-11-26 13:29:35.028805','3','010330',2,'Changed user_permissions.',4,1),(41,'2016-11-26 14:06:05.673829','2','U盘',1,'',8,2),(42,'2016-11-26 14:23:48.794189','None','U盘-C502-010330',1,'',12,3),(43,'2016-11-26 14:27:12.339831','None','网线-C502-010330',1,'',12,3),(44,'2016-11-26 14:42:46.804378','None','网线-C502-010330',1,'',12,3),(45,'2016-11-26 14:43:31.504407','None','网线-C502-010330',1,'',12,3),(46,'2016-11-26 14:49:32.092218','None','网线-C502-010330',1,'',12,3),(47,'2016-11-26 14:50:39.369906','None','U盘-C502-010330',1,'',12,3),(48,'2016-11-26 14:53:38.530183','None','网线-C502-010330',1,'',12,3),(49,'2016-11-26 15:19:06.258962','2','专职教师',2,'已修改 permissions 。',3,1),(50,'2016-11-26 15:21:36.422070','2','专职教师',2,'Changed permissions.',3,1),(51,'2016-11-26 15:24:33.374194','2','专职教师',2,'Changed permissions.',3,1),(52,'2016-11-26 15:38:25.752589','4','网线-C502-010330',1,'',12,3),(53,'2016-11-27 11:36:03.303738','None','U盘-C502-010330',1,'',12,3),(54,'2016-11-27 11:46:23.508565','None','网线-C502-010330',1,'',12,3),(55,'2016-11-27 12:02:07.381945','5','网线-C502-010330',1,'',12,3);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(11,'flow','addmaterial'),(13,'flow','applybuymaterial'),(12,'flow','applymaterial'),(10,'flow','initmaterial'),(6,'sessions','session'),(9,'work','classroom'),(8,'work','material');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-11-15 14:25:39.744690'),(2,'auth','0001_initial','2016-11-15 14:25:47.551872'),(3,'admin','0001_initial','2016-11-15 14:25:49.580353'),(4,'contenttypes','0002_remove_content_type_name','2016-11-15 14:25:50.729754'),(5,'auth','0002_alter_permission_name_max_length','2016-11-15 14:25:51.533143'),(6,'auth','0003_alter_user_email_max_length','2016-11-15 14:25:52.323329'),(7,'auth','0004_alter_user_username_opts','2016-11-15 14:25:52.366862'),(8,'auth','0005_alter_user_last_login_null','2016-11-15 14:25:53.026852'),(9,'auth','0006_require_contenttypes_0002','2016-11-15 14:25:53.071658'),(10,'work','0001_initial','2016-11-15 14:25:53.384088'),(11,'work','0002_classroom','2016-11-15 14:25:54.419982'),(12,'work','0003_auto_20161106_2145','2016-11-15 14:25:56.416997'),(13,'work','0004_auto_20161107_2215','2016-11-15 14:25:57.054978'),(14,'work','0005_auto_20161107_2256','2016-11-15 14:25:57.088864'),(15,'work','0006_auto_20161109_1737','2016-11-15 14:25:57.123001'),(16,'work','0007_remove_material_now_count','2016-11-15 14:25:57.700138'),(17,'flow','0001_initial','2016-11-15 14:25:59.461724'),(18,'flow','0002_auto_20161109_1737','2016-11-15 14:26:00.467325'),(19,'flow','0003_auto_20161115_1828','2016-11-15 14:26:06.221547'),(20,'sessions','0001_initial','2016-11-15 14:26:06.813511'),(21,'flow','0004_auto_20161117_0956','2016-11-20 11:46:56.172696'),(22,'flow','0005_auto_20161120_2244','2016-11-20 14:46:00.334292'),(23,'flow','0006_auto_20161122_1923','2016-11-25 04:37:01.216012'),(24,'flow','0007_auto_20161122_1950','2016-11-25 04:37:07.916425'),(25,'flow','0008_auto_20161123_0840','2016-11-25 04:37:17.426511'),(26,'flow','0009_auto_20161125_2007','2016-11-25 12:07:30.930477'),(27,'work','0008_auto_20161125_2007','2016-11-25 12:07:33.181280'),(28,'flow','0010_auto_20161126_1833','2016-11-26 10:33:18.832131'),(29,'flow','0011_auto_20161126_1834','2016-11-26 10:34:19.905787');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('vh5rqe5e9fk5nh5k1at73uz1drk5ka1n','ODc4OThmZTQ5Mjg1ZTBlYmJlYzZiMWMxYWVjODc0MjMzYzdhNzcyNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjMDBjN2Q4NWY4MWVkZjc3MjRjMmZlMTAzNTE2OGYwNThkYjA4NjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2016-12-10 15:25:26.021542'),('xrjga47yaypodxhtr5573rsyya45deyq','ZjUyNzNkYzBkMjIyZThhOGYwNjM2ZTJkODJmOGYxYWY3OGYwZDMwODp7Il9hdXRoX3VzZXJfaGFzaCI6ImYyODIzOTMwMmNiOGIwNWNjZDg2NzE3ZjQ2ZGRiYmUzZmJlNGQ2ZWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2016-12-10 15:19:31.504034');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flow_addmaterial`
--

DROP TABLE IF EXISTS `flow_addmaterial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_addmaterial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_number` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `material_info_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `flow_addmaterial_b6473a25` (`material_info_id`),
  CONSTRAINT `flow_a_material_info_id_6d343849910c4b9e_fk_flow_initmaterial_id` FOREIGN KEY (`material_info_id`) REFERENCES `flow_initmaterial` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flow_addmaterial`
--

LOCK TABLES `flow_addmaterial` WRITE;
/*!40000 ALTER TABLE `flow_addmaterial` DISABLE KEYS */;
INSERT INTO `flow_addmaterial` VALUES (1,10,'2016-11-16 13:29:00.000000',1),(2,10,'2016-11-16 14:06:00.000000',1),(4,10,'2016-11-16 14:06:00.000000',1),(5,12,'2016-11-16 14:06:00.000000',1),(6,10,'2016-11-26 10:48:00.000000',1);
/*!40000 ALTER TABLE `flow_addmaterial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flow_applybuymaterial`
--

DROP TABLE IF EXISTS `flow_applybuymaterial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_applybuymaterial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `unit` varchar(32) NOT NULL,
  `is_agree` tinyint(1) NOT NULL,
  `apply_time` datetime(6) NOT NULL,
  `applicant_id` int(11) NOT NULL,
  `class_room_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `flow_applybuymateri_applicant_id_1ec7da790d11fdc_fk_auth_user_id` (`applicant_id`),
  KEY `flow_applybu_class_room_id_74b15f65db37acc3_fk_work_classroom_id` (`class_room_id`),
  KEY `flow_applybuymat_material_id_43210d0faffe264_fk_work_material_id` (`material_id`),
  CONSTRAINT `flow_applybu_class_room_id_74b15f65db37acc3_fk_work_classroom_id` FOREIGN KEY (`class_room_id`) REFERENCES `work_classroom` (`id`),
  CONSTRAINT `flow_applybuymat_material_id_43210d0faffe264_fk_work_material_id` FOREIGN KEY (`material_id`) REFERENCES `work_material` (`id`),
  CONSTRAINT `flow_applybuymateri_applicant_id_1ec7da790d11fdc_fk_auth_user_id` FOREIGN KEY (`applicant_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flow_applybuymaterial`
--

LOCK TABLES `flow_applybuymaterial` WRITE;
/*!40000 ALTER TABLE `flow_applybuymaterial` DISABLE KEYS */;
INSERT INTO `flow_applybuymaterial` VALUES (1,10,'箱',1,'2016-11-26 12:19:35.843266',2,1,1);
/*!40000 ALTER TABLE `flow_applybuymaterial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flow_applymaterial`
--

DROP TABLE IF EXISTS `flow_applymaterial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_applymaterial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `is_agree` tinyint(1) NOT NULL,
  `apply_time` datetime(6) NOT NULL,
  `applicant_id` int(11) NOT NULL,
  `class_room_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `flow_applymaterial_cd74ebc2` (`class_room_id`),
  KEY `flow_applymaterial_eb4b9aaa` (`material_id`),
  KEY `flow_applymaterial_applicant_id_67f3ffbb929a6dc3_fk_auth_user_id` (`applicant_id`),
  CONSTRAINT `flow_applymat_class_room_id_9070c34a33bc89e_fk_work_classroom_id` FOREIGN KEY (`class_room_id`) REFERENCES `work_classroom` (`id`),
  CONSTRAINT `flow_applymater_material_id_475e95d6e0686d03_fk_work_material_id` FOREIGN KEY (`material_id`) REFERENCES `work_material` (`id`),
  CONSTRAINT `flow_applymaterial_applicant_id_67f3ffbb929a6dc3_fk_auth_user_id` FOREIGN KEY (`applicant_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flow_applymaterial`
--

LOCK TABLES `flow_applymaterial` WRITE;
/*!40000 ALTER TABLE `flow_applymaterial` DISABLE KEYS */;
INSERT INTO `flow_applymaterial` VALUES (1,10,1,'2016-11-25 11:21:37.338057',1,1,1),(2,10,1,'2016-11-25 11:21:48.854900',1,1,1),(3,1,1,'2016-11-25 11:56:52.779360',2,1,1),(4,2,0,'2016-11-26 15:38:25.500624',3,1,1),(5,1,0,'2016-11-27 12:02:07.293555',3,1,1);
/*!40000 ALTER TABLE `flow_applymaterial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flow_initmaterial`
--

DROP TABLE IF EXISTS `flow_initmaterial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_initmaterial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stocks` int(11) NOT NULL,
  `class_room_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `flow_initmat_class_room_id_79ec0d074e9b15af_fk_work_classroom_id` (`class_room_id`),
  KEY `flow_initmateri_material_id_5aea0e39021144f6_fk_work_material_id` (`material_id`),
  CONSTRAINT `flow_initmat_class_room_id_79ec0d074e9b15af_fk_work_classroom_id` FOREIGN KEY (`class_room_id`) REFERENCES `work_classroom` (`id`),
  CONSTRAINT `flow_initmateri_material_id_5aea0e39021144f6_fk_work_material_id` FOREIGN KEY (`material_id`) REFERENCES `work_material` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flow_initmaterial`
--

LOCK TABLES `flow_initmaterial` WRITE;
/*!40000 ALTER TABLE `flow_initmaterial` DISABLE KEYS */;
INSERT INTO `flow_initmaterial` VALUES (1,31,1,1);
/*!40000 ALTER TABLE `flow_initmaterial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_classroom`
--

DROP TABLE IF EXISTS `work_classroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_classroom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) NOT NULL,
  `admin_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `work_classroom_admin_id_6245324e61c016cf_fk_auth_user_id` (`admin_id`),
  CONSTRAINT `work_classroom_admin_id_6245324e61c016cf_fk_auth_user_id` FOREIGN KEY (`admin_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_classroom`
--

LOCK TABLES `work_classroom` WRITE;
/*!40000 ALTER TABLE `work_classroom` DISABLE KEYS */;
INSERT INTO `work_classroom` VALUES (1,'C502',2);
/*!40000 ALTER TABLE `work_classroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_material`
--

DROP TABLE IF EXISTS `work_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `unit` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_material`
--

LOCK TABLES `work_material` WRITE;
/*!40000 ALTER TABLE `work_material` DISABLE KEYS */;
INSERT INTO `work_material` VALUES (1,'网线','箱'),(2,'U盘','个');
/*!40000 ALTER TABLE `work_material` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-27 21:53:23
