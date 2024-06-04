-- MySQL dump 10.13  Distrib 5.6.25, for osx10.8 (x86_64)
--
-- Host: localhost    Database: material
-- ------------------------------------------------------
-- Server version	5.6.25

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'专职教师'),(2,'实训教师');
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
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (4,1,28),(5,1,29),(6,1,30),(7,1,31),(1,1,32),(2,1,33),(10,2,22),(11,2,23),(12,2,24),(13,2,25),(14,2,26),(15,2,27),(16,2,28),(17,2,29),(18,2,30),(19,2,31),(8,2,32),(9,2,33);
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
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add 实训室',7,'add_classroom'),(20,'Can change 实训室',7,'change_classroom'),(21,'Can delete 实训室',7,'delete_classroom'),(22,'Can add 资产条目',8,'add_materialrecord'),(23,'Can change 资产条目',8,'change_materialrecord'),(24,'Can delete 资产条目',8,'delete_materialrecord'),(25,'Can add 手动耗材入库',9,'add_addmaterial'),(26,'Can change 手动耗材入库',9,'change_addmaterial'),(27,'Can delete 手动耗材入库',9,'delete_addmaterial'),(28,'Can add 耗材领用申请',10,'add_applymaterial'),(29,'Can change 耗材领用申请',10,'change_applymaterial'),(30,'Can delete 耗材领用申请',10,'delete_applymaterial'),(31,'Can add 耗材购买申请',11,'add_applybuymaterialprocess'),(32,'Can change 耗材购买申请',11,'change_applybuymaterialprocess'),(33,'Can delete 耗材购买申请',11,'delete_applybuymaterialprocess');
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
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$30000$DJzcC0PsnA8G$bhL3qvcp/hQ1H6HFyeqMmtZE+WPsjdS7xgSvUuTtjSA=','2024-05-29 08:54:07.588302',1,'guanliyuan1','管理员1','','1@qq.com',1,1,'2024-05-11 12:09:00.000000'),(2,'pbkdf2_sha256$30000$I7PJR467kQEL$ocmZJCSwea54In32NS0EpNa+XUjQwf1o9+kHL8XSeyA=','2024-05-30 01:47:29.587349',0,'zhuanren1','专任1','','',1,1,'2024-05-11 12:10:00.000000'),(3,'pbkdf2_sha256$30000$XP6mVwP7uYrz$ijLdjS65e2KWyywWHz65r3Il/WHIY+nUkg+9el4eA8Q=','2024-05-12 03:57:09.606903',0,'zhuanren2','专任2','','',1,1,'2024-05-11 12:11:00.000000'),(4,'pbkdf2_sha256$30000$5j33iODswgd2$qfnLH4X5LBna7nOV2mHvaRoMoiMN23XqZSaHO04uOvk=','2024-06-02 12:37:48.610474',0,'shixun1','实训1','','',1,1,'2024-05-11 12:11:00.000000'),(5,'pbkdf2_sha256$30000$XK24GL1piDLR$yCVYST+8ZXnpQh9DN8QLNmOG1XThMyNsgOX/VS+bLDA=','2024-05-12 03:57:36.518604',0,'shixun2','实训2','','',1,1,'2024-05-11 12:11:00.000000');
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
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,2,1),(4,3,1),(2,4,2),(3,5,2);
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
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-05-11 12:10:29.743907','1','专职教师',1,'[{\"added\": {}}]',4,1),(2,'2024-05-11 12:10:34.490859','2','实训教师',1,'[{\"added\": {}}]',4,1),(3,'2024-05-11 12:10:59.379419','2','zhuanren1',1,'[{\"added\": {}}]',3,1),(4,'2024-05-11 12:11:24.302264','3','zhuanren2',1,'[{\"added\": {}}]',3,1),(5,'2024-05-11 12:11:31.477622','3','zhuanren2',2,'[]',3,1),(6,'2024-05-11 12:11:41.846038','4','shixun1',1,'[{\"added\": {}}]',3,1),(7,'2024-05-11 12:11:45.887697','4','shixun1',2,'[]',3,1),(8,'2024-05-11 12:11:55.521282','5','shixun2',1,'[{\"added\": {}}]',3,1),(9,'2024-05-11 12:12:12.222447','1','guanliyuan1',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_login\"]}}]',3,1),(10,'2024-05-11 12:12:18.293003','4','shixun1',2,'[{\"changed\": {\"fields\": [\"first_name\"]}}]',3,1),(11,'2024-05-11 12:12:23.575418','5','shixun2',2,'[{\"changed\": {\"fields\": [\"first_name\"]}}]',3,1),(12,'2024-05-11 12:12:30.300011','5','shixun2',2,'[{\"changed\": {\"fields\": [\"first_name\"]}}]',3,1),(13,'2024-05-11 12:12:36.210062','2','zhuanren1',2,'[{\"changed\": {\"fields\": [\"first_name\"]}}]',3,1),(14,'2024-05-11 12:12:41.578126','3','zhuanren2',2,'[{\"changed\": {\"fields\": [\"first_name\"]}}]',3,1),(15,'2024-05-11 12:13:22.065291','1','8A209-测绘实训室',1,'[{\"added\": {}}]',7,1),(16,'2024-05-11 12:13:46.082362','2','8A403-计算机维护机房',1,'[{\"added\": {}}]',7,1),(17,'2024-05-11 12:30:01.503940','1','无线鼠标',1,'[{\"added\": {}}]',8,1),(18,'2024-05-11 12:30:04.022861','1','无线鼠标-8A403-计算机维护机房-管理员1',1,'[{\"added\": {}}]',11,1),(19,'2024-05-11 13:34:55.040612','2','1-8A209-测绘实训室-管理员1',1,'[{\"added\": {}}]',11,1),(20,'2024-05-11 13:36:30.298372','2','-8A209-测绘实训室-管理员1',3,'',11,1),(21,'2024-05-11 13:52:47.090221','3','1-8A403-计算机维护机房-管理员1',1,'[{\"added\": {}}]',11,1),(22,'2024-05-11 13:53:52.874092','4','1-8A403-计算机维护机房-管理员1',1,'[{\"added\": {}}]',11,1),(23,'2024-05-11 14:01:51.677612','5','1-8A209-测绘实训室-管理员1',1,'[{\"added\": {}}]',11,1),(24,'2024-05-11 14:04:22.404212','6','1-8A209-测绘实训室-管理员1',1,'[{\"added\": {}}]',11,1),(25,'2024-05-11 14:05:18.033574','7','1-8A209-测绘实训室-管理员1',1,'[{\"added\": {}}]',11,1),(26,'2024-05-11 16:03:56.329201','8','1-8A403-计算机维护机房-管理员1',1,'[{\"added\": {}}]',11,1),(27,'2024-05-11 16:04:30.919454','9','1-8A209-测绘实训室-管理员1',1,'[{\"added\": {}}]',11,1),(28,'2024-05-11 16:08:05.180977','10','1-8A209-测绘实训室-管理员1',1,'[{\"added\": {}}]',11,1),(29,'2024-05-11 16:15:30.754971','11','1-8A403-计算机维护机房-管理员1',1,'[{\"added\": {}}]',11,1),(30,'2024-05-11 16:17:08.281643','12','1-8A403-计算机维护机房-管理员1',1,'[{\"added\": {}}]',11,1),(31,'2024-05-12 02:45:44.008178','13','1-8A403-计算机维护机房-管理员1',1,'[{\"added\": {}}]',11,1),(32,'2024-05-12 02:54:11.777641','1','无线鼠标-8A403-计算机维护机房-管理员1',1,'[{\"added\": {}}]',10,1),(33,'2024-05-12 03:01:37.902042','2','zhuanren1',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',3,1),(34,'2024-05-12 03:03:29.839070','2','zhuanren1',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',3,1),(35,'2024-05-12 03:05:16.121187','2','zhuanren1',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',3,1),(36,'2024-05-12 03:05:47.057158','2','zhuanren1',2,'[{\"changed\": {\"fields\": [\"is_staff\"]}}]',3,1),(37,'2024-05-12 03:06:54.039822','1','专职教师',2,'[]',4,1),(38,'2024-05-12 03:07:17.538391','2','zhuanren1',2,'[{\"changed\": {\"fields\": [\"last_login\"]}}]',3,1),(39,'2024-05-12 03:08:05.757783','14','无线键盘-8A403-计算机维护机房-专任1',1,'[{\"added\": {}}]',11,2),(40,'2024-05-12 03:45:09.281660','2','无线键盘-8A403-计算机维护机房-专任1',1,'[{\"added\": {}}]',10,2),(41,'2024-05-12 03:47:23.310350','4','shixun1',2,'[{\"changed\": {\"fields\": [\"is_staff\"]}}]',3,1),(42,'2024-05-12 03:47:52.272900','2','实训教师',2,'[]',4,1),(43,'2024-05-12 03:48:10.431862','4','shixun1',2,'[]',3,1),(44,'2024-05-12 03:56:21.669307','5','shixun2',2,'[{\"changed\": {\"fields\": [\"is_staff\"]}}]',3,1),(45,'2024-05-12 03:56:30.727821','3','zhuanren2',2,'[{\"changed\": {\"fields\": [\"is_staff\"]}}]',3,1),(46,'2024-05-12 11:11:24.251167','13','1-8A403-计算机维护机房-管理员1',3,'',11,4),(47,'2024-05-12 11:16:45.631217','1','专职教师',2,'[]',4,1),(48,'2024-05-12 11:17:52.678592','15','扳手-8A403-计算机维护机房-专任1',1,'[{\"added\": {}}]',11,2),(49,'2024-05-12 11:20:57.202341','3','扳手-8A403-计算机维护机房-专任1',1,'[{\"added\": {}}]',10,2),(50,'2024-05-13 01:36:37.743145','16','dis-8A209-测绘实训室-专任1',1,'[{\"added\": {}}]',11,2),(51,'2024-05-13 01:38:34.530149','4','dis-8A209-测绘实训室-专任1',1,'[{\"added\": {}}]',10,2),(52,'2024-05-13 03:05:34.127564','1','8A403-计算机维护机房-千兆网线-10盒',1,'[{\"added\": {}}]',9,4),(53,'2024-05-18 01:13:07.504349','5','无线鼠标-8A403-计算机维护机房-管理员1',1,'[{\"added\": {}}]',10,2),(54,'2024-05-18 01:13:44.014488','6','无线鼠标-8A403-计算机维护机房-管理员1',1,'[{\"added\": {}}]',10,2),(55,'2024-05-18 02:02:32.248202','7','无线键盘-8A403-计算机维护机房-专任1',1,'[{\"added\": {}}]',10,2),(56,'2024-05-18 02:03:20.498495','8','无线键盘-8A403-计算机维护机房-专任1',1,'[{\"added\": {}}]',10,2),(57,'2024-05-18 02:07:20.577848','17','无线键盘-8A403-计算机维护机房-专任1',1,'[{\"added\": {}}]',11,2),(58,'2024-05-18 02:10:12.473757','9','无线键盘-8A403-计算机维护机房-专任1',1,'[{\"added\": {}}]',10,2),(59,'2024-05-18 02:10:23.625904','10','无线键盘-8A403-计算机维护机房-专任1',1,'[{\"added\": {}}]',10,2),(60,'2024-05-18 02:14:51.807348','18','无线键盘',2,'[{\"changed\": {\"fields\": [\"left_number\"]}}]',8,1),(61,'2024-05-18 02:18:25.942012','18','无线键盘',2,'[{\"changed\": {\"fields\": [\"left_number\"]}}]',8,1),(62,'2024-05-23 07:09:40.411556','11','测试数据-8A209-测绘实训室-专任1',1,'[{\"added\": {}}]',10,2),(63,'2024-05-23 07:11:52.885526','12','无线键盘-8A403-计算机维护机房-专任1',1,'[{\"added\": {}}]',10,2),(64,'2024-05-23 07:30:22.284260','13','无线键盘-8A403-计算机维护机房-专任1',1,'[{\"added\": {}}]',10,2),(65,'2024-05-24 09:22:46.655196','14','None',1,'[{\"added\": {}}]',10,2),(66,'2024-05-24 10:51:42.140611','13','1',2,'[{\"changed\": {\"fields\": [\"asset_type\"]}}]',8,4),(67,'2024-05-31 09:04:24.533266','18','无线鼠标-8A403-计算机维护机房-专任1',1,'[{\"added\": {}}]',11,2),(68,'2024-06-01 07:43:47.042870','15','None',1,'[{\"added\": {}}]',10,2),(69,'2024-06-02 12:29:21.849177','16','None',1,'[{\"added\": {}}]',10,2),(70,'2024-06-02 12:56:14.168103','18','无线键盘',1,'[{\"added\": {}}]',10,4);
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
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(4,'auth','group'),(2,'auth','permission'),(3,'auth','user'),(5,'contenttypes','contenttype'),(9,'flow','addmaterial'),(11,'flow','applybuymaterialprocess'),(10,'flow','applymaterial'),(6,'sessions','session'),(7,'work','classroom'),(8,'work','materialrecord');
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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-05-11 12:05:27.019236'),(2,'auth','0001_initial','2024-05-11 12:05:27.707444'),(3,'admin','0001_initial','2024-05-11 12:05:27.846482'),(4,'admin','0002_logentry_remove_auto_add','2024-05-11 12:05:27.914770'),(5,'contenttypes','0002_remove_content_type_name','2024-05-11 12:05:28.040274'),(6,'auth','0002_alter_permission_name_max_length','2024-05-11 12:05:28.094747'),(7,'auth','0003_alter_user_email_max_length','2024-05-11 12:05:28.148438'),(8,'auth','0004_alter_user_username_opts','2024-05-11 12:05:28.169083'),(9,'auth','0005_alter_user_last_login_null','2024-05-11 12:05:28.221329'),(10,'auth','0006_require_contenttypes_0002','2024-05-11 12:05:28.224475'),(11,'auth','0007_alter_validators_add_error_messages','2024-05-11 12:05:28.240760'),(12,'auth','0008_alter_user_username_max_length','2024-05-11 12:05:28.294619'),(13,'work','0001_initial','2024-05-11 12:05:28.339256'),(14,'work','0002_classroom','2024-05-11 12:05:28.429745'),(15,'work','0003_auto_20161106_2145','2024-05-11 12:05:28.614543'),(16,'work','0004_auto_20161107_2215','2024-05-11 12:05:28.767365'),(17,'work','0005_auto_20161107_2256','2024-05-11 12:05:28.774030'),(18,'work','0006_auto_20161109_1737','2024-05-11 12:05:28.780528'),(19,'work','0007_remove_material_now_count','2024-05-11 12:05:28.823272'),(20,'work','0008_auto_20161125_2007','2024-05-11 12:05:29.001036'),(21,'work','0009_auto_20170121_2034','2024-05-11 12:05:29.116304'),(22,'work','0010_auto_20170121_2050','2024-05-11 12:05:29.130249'),(23,'flow','0001_initial','2024-05-11 12:05:29.263346'),(24,'flow','0002_auto_20161109_1737','2024-05-11 12:05:29.350560'),(25,'flow','0003_auto_20161115_1828','2024-05-11 12:05:29.891610'),(26,'flow','0004_auto_20161117_0956','2024-05-11 12:05:30.264738'),(27,'flow','0005_auto_20161120_2244','2024-05-11 12:05:30.865483'),(28,'flow','0006_auto_20161122_1923','2024-05-11 12:05:31.034998'),(29,'flow','0007_auto_20161122_1950','2024-05-11 12:05:31.457296'),(30,'flow','0008_auto_20161123_0840','2024-05-11 12:05:31.889243'),(31,'flow','0009_auto_20161125_2007','2024-05-11 12:05:31.985386'),(32,'flow','0010_auto_20161126_1833','2024-05-11 12:05:32.082682'),(33,'flow','0011_auto_20161126_1834','2024-05-11 12:05:32.157528'),(34,'flow','0012_auto_20161130_2055','2024-05-11 12:05:32.629825'),(35,'flow','0013_auto_20170121_2028','2024-05-11 12:05:32.791199'),(36,'flow','0014_auto_20170121_2029','2024-05-11 12:05:32.866058'),(37,'flow','0015_auto_20170121_2029','2024-05-11 12:05:32.975402'),(38,'flow','0016_auto_20170121_2034','2024-05-11 12:05:33.051095'),(39,'flow','0017_auto_20170121_2050','2024-05-11 12:05:33.302295'),(40,'flow','0018_auto_20170121_2101','2024-05-11 12:05:33.674462'),(41,'flow','0019_auto_20170312_2326','2024-05-11 12:05:33.795657'),(42,'flow','0020_auto_20240502_0022','2024-05-11 12:05:34.689978'),(43,'work','0011_auto_20240502_0022','2024-05-11 12:05:34.821886'),(44,'work','0012_auto_20240502_1802','2024-05-11 12:05:34.908291'),(45,'work','0013_materialrecord_asset_type','2024-05-11 12:05:34.979149'),(46,'flow','0021_addmaterial','2024-05-11 12:05:35.108535'),(47,'flow','0022_auto_20240503_1840','2024-05-11 12:05:35.183328'),(48,'flow','0023_auto_20240503_2024','2024-05-11 12:05:35.547870'),(49,'flow','0024_auto_20240503_2042','2024-05-11 12:05:35.726786'),(50,'flow','0025_auto_20240506_1137','2024-05-11 12:05:36.135149'),(51,'flow','0026_auto_20240506_1147','2024-05-11 12:05:36.266343'),(52,'flow','0027_auto_20240508_1837','2024-05-11 12:05:36.482257'),(53,'flow','0028_auto_20240510_1722','2024-05-11 12:05:36.755477'),(54,'flow','0029_auto_20240510_1750','2024-05-11 12:05:36.861635'),(55,'flow','0030_auto_20240510_1842','2024-05-11 12:05:37.054415'),(56,'flow','0031_auto_20240511_1814','2024-05-11 12:05:37.125200'),(57,'sessions','0001_initial','2024-05-11 12:05:37.198984'),(58,'work','0014_auto_20240510_1750','2024-05-11 12:05:37.321875'),(59,'work','0015_auto_20240510_1842','2024-05-11 12:05:37.364923'),(60,'flow','0032_applymaterial_material_record','2024-05-24 08:58:27.469658'),(61,'flow','0033_auto_20240524_1705','2024-05-24 09:05:13.268560');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('23x9lmlmce80pbbceaflcerv5ghv2zn8','MzliYzI0MjA2NTZjNWQ5M2JjNmZmMWU4NGUxMmRmZWQyZDlhYTQ5ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImJhZDIyZTJmMDczM2U1M2RmMzU0MDVkNzlmMzdlOWM4MGUwNjc0Y2IiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2024-06-06 07:29:05.916062'),('br1fz9a12m60szaepo4vjlogdkiqjevm','YWNjOWViODUzMzllYWM1MGE3YzhkOWVjMjU3NTc3YTRhNjY0ZDllYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImYxMGIwZjY4MTQ0MWViYmQxMjNlOTc2ODUyNWM3MGM4MDI5ODA3MWEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2024-05-26 04:07:01.210429'),('cshj4v5dyjftjjg3m3s59hd0w9n3maqh','YWNjOWViODUzMzllYWM1MGE3YzhkOWVjMjU3NTc3YTRhNjY0ZDllYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImYxMGIwZjY4MTQ0MWViYmQxMjNlOTc2ODUyNWM3MGM4MDI5ODA3MWEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2024-05-26 03:05:54.749166'),('f6a46o475fkn3eji6axrzzsim90xbqyc','YWNjOWViODUzMzllYWM1MGE3YzhkOWVjMjU3NTc3YTRhNjY0ZDllYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImYxMGIwZjY4MTQ0MWViYmQxMjNlOTc2ODUyNWM3MGM4MDI5ODA3MWEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2024-06-13 01:47:29.592588'),('ibj2tpixho0f5md0hndaepj6dlj2sdzr','MzliYzI0MjA2NTZjNWQ5M2JjNmZmMWU4NGUxMmRmZWQyZDlhYTQ5ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImJhZDIyZTJmMDczM2U1M2RmMzU0MDVkNzlmMzdlOWM4MGUwNjc0Y2IiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2024-06-16 12:37:48.614559'),('y0oajv742f7htlvt4n4eob0mmxm4eyzn','YWNjOWViODUzMzllYWM1MGE3YzhkOWVjMjU3NTc3YTRhNjY0ZDllYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImYxMGIwZjY4MTQ0MWViYmQxMjNlOTc2ODUyNWM3MGM4MDI5ODA3MWEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2024-06-05 03:57:28.729511');
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
  `add_time` datetime(6) NOT NULL,
  `class_room_id` int(11) NOT NULL,
  `material_record_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `flow_addma_material_record_id_5a935f99_fk_work_materialrecord_id` (`material_record_id`),
  KEY `flow_addmaterial_class_room_id_484f5a89_fk_work_classroom_id` (`class_room_id`),
  CONSTRAINT `flow_addma_material_record_id_5a935f99_fk_work_materialrecord_id` FOREIGN KEY (`material_record_id`) REFERENCES `work_materialrecord` (`id`),
  CONSTRAINT `flow_addmaterial_class_room_id_484f5a89_fk_work_classroom_id` FOREIGN KEY (`class_room_id`) REFERENCES `work_classroom` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flow_addmaterial`
--

LOCK TABLES `flow_addmaterial` WRITE;
/*!40000 ALTER TABLE `flow_addmaterial` DISABLE KEYS */;
INSERT INTO `flow_addmaterial` VALUES (1,'2024-05-13 03:05:34.118568',2,17);
/*!40000 ALTER TABLE `flow_addmaterial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flow_applybuymaterialprocess`
--

DROP TABLE IF EXISTS `flow_applybuymaterialprocess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_applybuymaterialprocess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_agree` tinyint(1) NOT NULL,
  `is_storage` tinyint(1) NOT NULL,
  `apply_time` datetime(6) NOT NULL,
  `storage_time` datetime(6) DEFAULT NULL,
  `applicant_id` int(11) NOT NULL,
  `class_room_id` int(11) NOT NULL,
  `material_record_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `flow_applybuymaterialprocess_material_record_id_fa4bf937_uniq` (`material_record_id`),
  KEY `flow_applybuymaterialproce_applicant_id_f96f67e1_fk_auth_user_id` (`applicant_id`),
  KEY `flow_applybuymateria_class_room_id_e88430a6_fk_work_classroom_id` (`class_room_id`),
  CONSTRAINT `flow_apply_material_record_id_fa4bf937_fk_work_materialrecord_id` FOREIGN KEY (`material_record_id`) REFERENCES `work_materialrecord` (`id`),
  CONSTRAINT `flow_applybuymateria_class_room_id_e88430a6_fk_work_classroom_id` FOREIGN KEY (`class_room_id`) REFERENCES `work_classroom` (`id`),
  CONSTRAINT `flow_applybuymaterialproce_applicant_id_f96f67e1_fk_auth_user_id` FOREIGN KEY (`applicant_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flow_applybuymaterialprocess`
--

LOCK TABLES `flow_applybuymaterialprocess` WRITE;
/*!40000 ALTER TABLE `flow_applybuymaterialprocess` DISABLE KEYS */;
INSERT INTO `flow_applybuymaterialprocess` VALUES (1,0,0,'2024-05-11 12:30:04.021948',NULL,1,2,1),(3,0,0,'2024-05-11 13:52:47.089089',NULL,1,2,3),(4,0,0,'2024-05-11 13:53:52.866347',NULL,1,2,4),(5,0,0,'2024-05-11 14:01:51.676518',NULL,1,1,5),(6,0,0,'2024-05-11 14:04:22.394102',NULL,1,1,6),(7,0,0,'2024-05-11 14:05:18.032393',NULL,1,1,7),(8,0,0,'2024-05-11 16:03:56.320671',NULL,1,2,8),(9,0,0,'2024-05-11 16:04:30.918547',NULL,1,1,9),(10,0,0,'2024-05-11 16:08:05.180118',NULL,1,1,10),(11,0,0,'2024-05-11 16:15:30.745217',NULL,1,2,11),(12,0,0,'2024-05-11 16:17:08.280659',NULL,1,2,12),(14,0,0,'2024-05-12 03:08:05.756188',NULL,2,2,14),(15,1,1,'2024-05-12 11:17:52.677553','2024-05-12 11:19:59.847813',2,2,15),(16,1,1,'2024-05-13 01:36:37.742244','2024-05-13 01:37:20.937549',2,1,16),(17,1,1,'2024-05-18 02:07:20.576044','2024-05-18 02:09:38.472698',2,2,18),(18,0,1,'2024-05-31 09:04:24.529995','2024-06-02 11:59:48.308027',2,2,19);
/*!40000 ALTER TABLE `flow_applybuymaterialprocess` ENABLE KEYS */;
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
  `agree_time` datetime(6) DEFAULT NULL,
  `apply_time` datetime(6) NOT NULL,
  `applicant_id` int(11) NOT NULL,
  `buy_material_process_id` int(11) DEFAULT NULL,
  `material_record_id` int(11),
  PRIMARY KEY (`id`),
  KEY `flow_applymaterial_applicant_id_d18d6f37_fk_auth_user_id` (`applicant_id`),
  KEY `flow_apply_material_record_id_d5e90cd5_fk_work_materialrecord_id` (`material_record_id`),
  KEY `D36ee66eff4c6fb211c6805bfa4603a8` (`buy_material_process_id`),
  CONSTRAINT `D36ee66eff4c6fb211c6805bfa4603a8` FOREIGN KEY (`buy_material_process_id`) REFERENCES `flow_applybuymaterialprocess` (`id`),
  CONSTRAINT `flow_apply_material_record_id_d5e90cd5_fk_work_materialrecord_id` FOREIGN KEY (`material_record_id`) REFERENCES `work_materialrecord` (`id`),
  CONSTRAINT `flow_applymaterial_applicant_id_d18d6f37_fk_auth_user_id` FOREIGN KEY (`applicant_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flow_applymaterial`
--

LOCK TABLES `flow_applymaterial` WRITE;
/*!40000 ALTER TABLE `flow_applymaterial` DISABLE KEYS */;
INSERT INTO `flow_applymaterial` VALUES (1,1,1,'2024-05-12 02:54:19.050017','2024-05-12 02:54:11.772250',1,1,NULL),(2,1,0,NULL,'2024-05-12 03:45:09.273824',2,14,NULL),(3,10,1,'2024-05-13 01:38:51.919211','2024-05-12 11:20:57.198792',2,15,NULL),(4,10,0,NULL,'2024-05-13 01:38:34.524964',2,16,NULL),(5,10,1,'2024-05-18 01:16:46.701973','2024-05-18 01:13:07.489591',2,1,NULL),(6,10,1,'2024-05-18 01:16:22.066687','2024-05-18 01:13:44.009436',2,1,NULL),(7,10,1,'2024-05-18 02:03:36.082866','2024-05-18 02:02:32.242424',2,14,NULL),(8,10,1,'2024-05-18 02:03:42.628518','2024-05-18 02:03:20.492960',2,14,NULL),(9,10,1,'2024-05-18 02:19:16.974958','2024-05-18 02:10:12.470273',2,17,NULL),(10,10,1,'2024-05-23 07:13:08.017333','2024-05-18 02:10:23.621747',2,17,NULL),(11,1,0,NULL,'2024-05-23 07:09:40.406727',2,16,NULL),(12,1,1,'2024-05-23 07:12:06.125176','2024-05-23 07:11:52.881829',2,14,NULL),(13,1,0,NULL,'2024-05-23 07:30:22.279054',2,14,NULL),(14,1,0,NULL,'2024-05-24 09:22:46.650488',2,NULL,13),(15,1,0,NULL,'2024-06-01 07:43:47.014744',2,NULL,19),(16,1,0,NULL,'2024-06-02 12:29:21.839352',2,NULL,14),(18,1,0,NULL,'2024-06-02 12:56:14.163471',4,NULL,14);
/*!40000 ALTER TABLE `flow_applymaterial` ENABLE KEYS */;
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
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `work_classroom_admin_id_eb2ed494_fk_auth_user_id` (`admin_id`),
  CONSTRAINT `work_classroom_admin_id_eb2ed494_fk_auth_user_id` FOREIGN KEY (`admin_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_classroom`
--

LOCK TABLES `work_classroom` WRITE;
/*!40000 ALTER TABLE `work_classroom` DISABLE KEYS */;
INSERT INTO `work_classroom` VALUES (1,'8A209',5,'测绘实训室'),(2,'8A403',4,'计算机维护机房');
/*!40000 ALTER TABLE `work_classroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_materialrecord`
--

DROP TABLE IF EXISTS `work_materialrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_materialrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` longtext NOT NULL,
  `unit` varchar(20) NOT NULL,
  `number` int(11) NOT NULL,
  `left_number` int(11) NOT NULL,
  `price` double NOT NULL,
  `total_cost` double NOT NULL,
  `asset_type` int(11) NOT NULL,
  `ps` longtext,
  `use_instructions` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_materialrecord`
--

LOCK TABLES `work_materialrecord` WRITE;
/*!40000 ALTER TABLE `work_materialrecord` DISABLE KEYS */;
INSERT INTO `work_materialrecord` VALUES (1,'无线鼠标','2.4G','10',19,-2,19,100,1,'http：///jd','使用说明1'),(2,' ','','',0,0,0,0,1,NULL,NULL),(3,'1','1','1',1,0,1,0,1,'1','1'),(4,'1','1','1',1,0,13,0,1,'1','1'),(5,'1','1','1',1,0,1,0,1,'1','1'),(6,'1','1','1',1,0,2,0,1,'1','1'),(7,'1','1','1',1,0,1,0,1,'1','1'),(8,'1','1','1',1,0,1,0,1,'1','1'),(9,'1','1','1',1,0,1,0,1,'1','1'),(10,'1','1','1',12,0,12,0,1,'1','1'),(11,'1','1','1',10,0,12,120,1,'1','1'),(12,'1','1','1',10,0,10,100,1,'1','1'),(13,'1','1','1',1,1,1,1,2,'1','1'),(14,'无线键盘','100G','套',10,9,50,500,1,'备注备注备注备注备注备注','备注备注备注备注备注备注'),(15,'扳手','10cm*10cm','把',10,-10,10,100,1,'教学用','教学用'),(16,'测试数据','12','12',12,12,12,144,1,'12','12'),(17,'千兆网线','100m','盒',10,10,10,100,1,'教学用','教学用'),(18,'无线键盘','2.4G','套',10,0,10,100,1,'无线键盘','教学使用'),(19,'无线鼠标','2.4G','套',100,100,10,1000,1,'http://jd.com','教学使用');
/*!40000 ALTER TABLE `work_materialrecord` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-04 14:47:48
