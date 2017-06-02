-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: microbusiness
-- ------------------------------------------------------
-- Server version	5.6.17-log

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
-- Table structure for table `ws_agent`
--

DROP TABLE IF EXISTS `ws_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_agent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `alias` int(10) DEFAULT NULL,
  `brand_id` int(10) DEFAULT NULL,
  `own_userid` int(10) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_agent`
--

LOCK TABLES `ws_agent` WRITE;
/*!40000 ALTER TABLE `ws_agent` DISABLE KEYS */;
/*!40000 ALTER TABLE `ws_agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_auth`
--

DROP TABLE IF EXISTS `ws_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `source` varchar(255) NOT NULL,
  `source_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_auth`
--

LOCK TABLES `ws_auth` WRITE;
/*!40000 ALTER TABLE `ws_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `ws_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_auth_assignment`
--

DROP TABLE IF EXISTS `ws_auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `ws_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `ws_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_auth_assignment`
--

LOCK TABLES `ws_auth_assignment` WRITE;
/*!40000 ALTER TABLE `ws_auth_assignment` DISABLE KEYS */;
INSERT INTO `ws_auth_assignment` VALUES ('管理员','1',1496373242),('管理员','2',1496375557);
/*!40000 ALTER TABLE `ws_auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_auth_item`
--

DROP TABLE IF EXISTS `ws_auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `ws_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `ws_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_auth_item`
--

LOCK TABLES `ws_auth_item` WRITE;
/*!40000 ALTER TABLE `ws_auth_item` DISABLE KEYS */;
INSERT INTO `ws_auth_item` VALUES ('/*',2,NULL,NULL,NULL,1496373824,1496373824),('/admin/*',2,NULL,NULL,NULL,1496373823,1496373823),('/admin/assignment/*',2,NULL,NULL,NULL,1496373821,1496373821),('/admin/assignment/assign',2,NULL,NULL,NULL,1496373821,1496373821),('/admin/assignment/index',2,NULL,NULL,NULL,1496373821,1496373821),('/admin/assignment/revoke',2,NULL,NULL,NULL,1496373821,1496373821),('/admin/assignment/view',2,NULL,NULL,NULL,1496373821,1496373821),('/admin/default/*',2,NULL,NULL,NULL,1496373821,1496373821),('/admin/default/index',2,NULL,NULL,NULL,1496373821,1496373821),('/admin/menu/*',2,NULL,NULL,NULL,1496373822,1496373822),('/admin/menu/create',2,NULL,NULL,NULL,1496373822,1496373822),('/admin/menu/delete',2,NULL,NULL,NULL,1496373822,1496373822),('/admin/menu/index',2,NULL,NULL,NULL,1496373821,1496373821),('/admin/menu/update',2,NULL,NULL,NULL,1496373822,1496373822),('/admin/menu/view',2,NULL,NULL,NULL,1496373821,1496373821),('/admin/permission/*',2,NULL,NULL,NULL,1496373822,1496373822),('/admin/permission/assign',2,NULL,NULL,NULL,1496373822,1496373822),('/admin/permission/create',2,NULL,NULL,NULL,1496373822,1496373822),('/admin/permission/delete',2,NULL,NULL,NULL,1496373822,1496373822),('/admin/permission/index',2,NULL,NULL,NULL,1496373822,1496373822),('/admin/permission/remove',2,NULL,NULL,NULL,1496373822,1496373822),('/admin/permission/update',2,NULL,NULL,NULL,1496373822,1496373822),('/admin/permission/view',2,NULL,NULL,NULL,1496373822,1496373822),('/admin/role/*',2,NULL,NULL,NULL,1496373822,1496373822),('/admin/role/assign',2,NULL,NULL,NULL,1496373822,1496373822),('/admin/role/create',2,NULL,NULL,NULL,1496373822,1496373822),('/admin/role/delete',2,NULL,NULL,NULL,1496373822,1496373822),('/admin/role/index',2,NULL,NULL,NULL,1496373822,1496373822),('/admin/role/remove',2,NULL,NULL,NULL,1496373822,1496373822),('/admin/role/update',2,NULL,NULL,NULL,1496373822,1496373822),('/admin/role/view',2,NULL,NULL,NULL,1496373822,1496373822),('/admin/route/*',2,NULL,NULL,NULL,1496373823,1496373823),('/admin/route/assign',2,NULL,NULL,NULL,1496373822,1496373822),('/admin/route/create',2,NULL,NULL,NULL,1496373822,1496373822),('/admin/route/index',2,NULL,NULL,NULL,1496373822,1496373822),('/admin/route/refresh',2,NULL,NULL,NULL,1496373823,1496373823),('/admin/route/remove',2,NULL,NULL,NULL,1496373822,1496373822),('/admin/rule/*',2,NULL,NULL,NULL,1496373823,1496373823),('/admin/rule/create',2,NULL,NULL,NULL,1496373823,1496373823),('/admin/rule/delete',2,NULL,NULL,NULL,1496373823,1496373823),('/admin/rule/index',2,NULL,NULL,NULL,1496373823,1496373823),('/admin/rule/update',2,NULL,NULL,NULL,1496373823,1496373823),('/admin/rule/view',2,NULL,NULL,NULL,1496373823,1496373823),('/admin/user/*',2,NULL,NULL,NULL,1496373823,1496373823),('/admin/user/activate',2,NULL,NULL,NULL,1496373823,1496373823),('/admin/user/change-password',2,NULL,NULL,NULL,1496373823,1496373823),('/admin/user/delete',2,NULL,NULL,NULL,1496373823,1496373823),('/admin/user/index',2,NULL,NULL,NULL,1496373823,1496373823),('/admin/user/login',2,NULL,NULL,NULL,1496373823,1496373823),('/admin/user/logout',2,NULL,NULL,NULL,1496373823,1496373823),('/admin/user/request-password-reset',2,NULL,NULL,NULL,1496373823,1496373823),('/admin/user/reset-password',2,NULL,NULL,NULL,1496373823,1496373823),('/admin/user/signup',2,NULL,NULL,NULL,1496373823,1496373823),('/admin/user/view',2,NULL,NULL,NULL,1496373823,1496373823),('/debug/*',2,NULL,NULL,NULL,1496373824,1496373824),('/debug/default/*',2,NULL,NULL,NULL,1496373824,1496373824),('/debug/default/db-explain',2,NULL,NULL,NULL,1496373823,1496373823),('/debug/default/download-mail',2,NULL,NULL,NULL,1496373824,1496373824),('/debug/default/index',2,NULL,NULL,NULL,1496373823,1496373823),('/debug/default/toolbar',2,NULL,NULL,NULL,1496373824,1496373824),('/debug/default/view',2,NULL,NULL,NULL,1496373823,1496373823),('/gii/*',2,NULL,NULL,NULL,1496373165,1496373165),('/gii/default/*',2,NULL,NULL,NULL,1496373165,1496373165),('/gii/default/action',2,NULL,NULL,NULL,1496373165,1496373165),('/gii/default/diff',2,NULL,NULL,NULL,1496373165,1496373165),('/gii/default/index',2,NULL,NULL,NULL,1496373164,1496373164),('/gii/default/preview',2,NULL,NULL,NULL,1496373165,1496373165),('/gii/default/view',2,NULL,NULL,NULL,1496373164,1496373164),('/goods/*',2,NULL,NULL,NULL,1496375801,1496375801),('/goods/create',2,NULL,NULL,NULL,1496383668,1496383668),('/goods/index',2,NULL,NULL,NULL,1496375801,1496375801),('/goods/view',2,NULL,NULL,NULL,1496375801,1496375801),('/order/*',2,NULL,NULL,NULL,1496394342,1496394342),('/order/index',2,NULL,NULL,NULL,1496394342,1496394342),('/order/view',2,NULL,NULL,NULL,1496394342,1496394342),('/site/*',2,NULL,NULL,NULL,1496373824,1496373824),('/site/captcha',2,NULL,NULL,NULL,1496373824,1496373824),('/site/error',2,NULL,NULL,NULL,1496373824,1496373824),('/site/index',2,NULL,NULL,NULL,1496373824,1496373824),('/site/login',2,NULL,NULL,NULL,1496373824,1496373824),('/site/logout',2,NULL,NULL,NULL,1496373824,1496373824),('/site/request-password-reset',2,NULL,NULL,NULL,1496373824,1496373824),('/site/reset-password',2,NULL,NULL,NULL,1496373824,1496373824),('/site/signup',2,NULL,NULL,NULL,1496373824,1496373824),('商品管理',2,'Goods',NULL,NULL,1496375833,1496389184),('权限管理',2,'权限管理',NULL,NULL,1496391370,1496391370),('测试管理',2,'测试管理',NULL,NULL,1496392466,1496392466),('用户管理',2,'用户管理',NULL,NULL,1496393200,1496393200),('管理员',1,'管理员',NULL,NULL,1496373088,1496391308),('订单管理',2,'订单管理',NULL,NULL,1496394387,1496394387);
/*!40000 ALTER TABLE `ws_auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_auth_item_child`
--

DROP TABLE IF EXISTS `ws_auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `ws_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `ws_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ws_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `ws_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_auth_item_child`
--

LOCK TABLES `ws_auth_item_child` WRITE;
/*!40000 ALTER TABLE `ws_auth_item_child` DISABLE KEYS */;
INSERT INTO `ws_auth_item_child` VALUES ('权限管理','/admin/*'),('权限管理','/admin/assignment/*'),('权限管理','/admin/assignment/assign'),('权限管理','/admin/assignment/index'),('权限管理','/admin/assignment/revoke'),('权限管理','/admin/assignment/view'),('权限管理','/admin/default/*'),('权限管理','/admin/default/index'),('权限管理','/admin/menu/*'),('权限管理','/admin/menu/create'),('权限管理','/admin/menu/delete'),('权限管理','/admin/menu/index'),('权限管理','/admin/menu/update'),('权限管理','/admin/menu/view'),('权限管理','/admin/permission/*'),('权限管理','/admin/permission/assign'),('权限管理','/admin/permission/create'),('权限管理','/admin/permission/delete'),('权限管理','/admin/permission/index'),('权限管理','/admin/permission/remove'),('权限管理','/admin/permission/update'),('权限管理','/admin/permission/view'),('权限管理','/admin/role/*'),('权限管理','/admin/role/assign'),('权限管理','/admin/role/create'),('权限管理','/admin/role/delete'),('权限管理','/admin/role/index'),('权限管理','/admin/role/remove'),('权限管理','/admin/role/update'),('权限管理','/admin/role/view'),('权限管理','/admin/route/*'),('权限管理','/admin/route/assign'),('权限管理','/admin/route/create'),('权限管理','/admin/route/index'),('权限管理','/admin/route/refresh'),('权限管理','/admin/route/remove'),('权限管理','/admin/rule/*'),('权限管理','/admin/rule/create'),('权限管理','/admin/rule/delete'),('权限管理','/admin/rule/index'),('权限管理','/admin/rule/update'),('权限管理','/admin/rule/view'),('用户管理','/admin/user/activate'),('用户管理','/admin/user/change-password'),('用户管理','/admin/user/delete'),('用户管理','/admin/user/index'),('用户管理','/admin/user/request-password-reset'),('用户管理','/admin/user/reset-password'),('用户管理','/admin/user/signup'),('用户管理','/admin/user/view'),('测试管理','/debug/*'),('测试管理','/debug/default/*'),('测试管理','/debug/default/db-explain'),('测试管理','/debug/default/download-mail'),('测试管理','/debug/default/index'),('测试管理','/debug/default/toolbar'),('测试管理','/debug/default/view'),('测试管理','/gii/*'),('测试管理','/gii/default/*'),('测试管理','/gii/default/action'),('测试管理','/gii/default/diff'),('测试管理','/gii/default/index'),('测试管理','/gii/default/preview'),('测试管理','/gii/default/view'),('商品管理','/goods/*'),('商品管理','/goods/index'),('商品管理','/goods/view'),('订单管理','/order/*'),('订单管理','/order/index'),('订单管理','/order/view'),('用户管理','/site/request-password-reset'),('用户管理','/site/reset-password'),('用户管理','/site/signup'),('管理员','商品管理'),('管理员','权限管理'),('管理员','测试管理'),('管理员','用户管理'),('管理员','订单管理');
/*!40000 ALTER TABLE `ws_auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_auth_rule`
--

DROP TABLE IF EXISTS `ws_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_auth_rule`
--

LOCK TABLES `ws_auth_rule` WRITE;
/*!40000 ALTER TABLE `ws_auth_rule` DISABLE KEYS */;
INSERT INTO `ws_auth_rule` VALUES ('UserGroup','O:26:\"backend\\rbac\\UserGroupRule\":3:{s:4:\"name\";s:9:\"UserGroup\";s:9:\"createdAt\";i:1496375404;s:9:\"updatedAt\";i:1496375404;}',1496375404,1496375404);
/*!40000 ALTER TABLE `ws_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_brand`
--

DROP TABLE IF EXISTS `ws_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `own_userid` int(10) DEFAULT NULL,
  `appid` varchar(150) DEFAULT NULL,
  `appsecret` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_brand`
--

LOCK TABLES `ws_brand` WRITE;
/*!40000 ALTER TABLE `ws_brand` DISABLE KEYS */;
/*!40000 ALTER TABLE `ws_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_brand_agent`
--

DROP TABLE IF EXISTS `ws_brand_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_brand_agent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `alias` int(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_brand_agent`
--

LOCK TABLES `ws_brand_agent` WRITE;
/*!40000 ALTER TABLE `ws_brand_agent` DISABLE KEYS */;
/*!40000 ALTER TABLE `ws_brand_agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_dictionary`
--

DROP TABLE IF EXISTS `ws_dictionary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_dictionary` (
  `dictionaryid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `mark` varchar(200) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `openid` varchar(128) DEFAULT '',
  `type` int(11) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`dictionaryid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_dictionary`
--

LOCK TABLES `ws_dictionary` WRITE;
/*!40000 ALTER TABLE `ws_dictionary` DISABLE KEYS */;
INSERT INTO `ws_dictionary` VALUES (1,'日历类型','日历类型',1,'',1,'2017-05-18 17:27:08','2017-05-18 17:27:08'),(2,'价格范围','价格范围',1,'',1,'2017-05-18 17:33:49','2017-05-18 17:33:49');
/*!40000 ALTER TABLE `ws_dictionary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_dictionary_item`
--

DROP TABLE IF EXISTS `ws_dictionary_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_dictionary_item` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT,
  `dictionaryid` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `mark` varchar(200) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `type` int(11) DEFAULT '1',
  `ctype` int(11) NOT NULL DEFAULT '0',
  `openid` varchar(128) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_dictionary_item`
--

LOCK TABLES `ws_dictionary_item` WRITE;
/*!40000 ALTER TABLE `ws_dictionary_item` DISABLE KEYS */;
INSERT INTO `ws_dictionary_item` VALUES (1,1,'摇滚','摇滚',1,1,0,'','2017-05-18 17:48:40','2017-05-18 17:48:40'),(2,1,'音乐','音乐',1,1,0,'','2017-05-18 17:48:40','2017-05-18 17:48:40'),(3,1,'亲子','亲子',1,1,0,'','2017-05-18 17:48:40','2017-05-18 17:48:40'),(4,1,'老年','老年',1,1,0,'','2017-05-18 17:48:40','2017-05-18 17:48:40'),(5,1,'曲艺','曲艺',1,1,0,'','2017-05-18 17:48:40','2017-05-18 17:48:40'),(6,1,'戏曲','戏曲',1,1,0,'','2017-05-18 17:48:40','2017-05-18 17:48:40'),(7,1,'舞蹈','舞蹈',1,1,0,'','2017-05-18 17:48:40','2017-05-18 17:48:40'),(8,1,'体育','体育',1,1,0,'','2017-05-18 17:48:40','2017-05-18 17:48:40'),(9,1,'其他','其他',1,1,0,'','2017-05-18 17:48:40','2017-05-18 17:48:40');
/*!40000 ALTER TABLE `ws_dictionary_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_goods`
--

DROP TABLE IF EXISTS `ws_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(10) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `number` int(10) DEFAULT NULL,
  `price` float(10,2) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `lock_version` int(10) DEFAULT '0' COMMENT '锁版本',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_goods`
--

LOCK TABLES `ws_goods` WRITE;
/*!40000 ALTER TABLE `ws_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `ws_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_menu`
--

DROP TABLE IF EXISTS `ws_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` blob,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `ws_menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `ws_menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_menu`
--

LOCK TABLES `ws_menu` WRITE;
/*!40000 ALTER TABLE `ws_menu` DISABLE KEYS */;
INSERT INTO `ws_menu` VALUES (1,'商品管理',NULL,NULL,1,'{\"icon\": \"shopping-cart\", \"visible\": true}'),(2,'商品列表',1,'/goods/index',NULL,NULL),(3,'上架商品',1,'/goods/create',NULL,NULL),(4,'权限管理',NULL,NULL,98,'{\"icon\": \"cog\", \"visible\": true}'),(5,'菜单',4,'/admin/menu/index',7,NULL),(6,'路由',4,'/admin/route/index',2,NULL),(7,'权限',4,'/admin/permission/index',3,NULL),(8,'角色',4,'/admin/role/index',4,NULL),(9,'规则',4,'/admin/rule/index',5,NULL),(10,'分配',4,'/admin/assignment/index',6,NULL),(11,'用户管理',NULL,NULL,96,'{\"icon\": \"user\", \"visible\": true}'),(12,'测试管理',NULL,NULL,99,'{\"icon\": \"bug\", \"visible\": true}'),(13,'Gii',12,'/gii/default/index',1,NULL),(14,'Debug',12,'/debug/default/index',2,NULL),(15,'用户列表',11,'/admin/user/index',1,NULL),(16,' 添加用户',11,'/admin/user/signup',2,NULL),(17,'订单管理',NULL,NULL,3,'{\"icon\": \"reorder\", \"visible\": true}'),(18,'订单列表',17,'/order/index',3,NULL),(19,'订单详情',17,'/order/view',3,NULL);
/*!40000 ALTER TABLE `ws_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_migration`
--

DROP TABLE IF EXISTS `ws_migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_migration`
--

LOCK TABLES `ws_migration` WRITE;
/*!40000 ALTER TABLE `ws_migration` DISABLE KEYS */;
INSERT INTO `ws_migration` VALUES ('m000000_000000_base',1494317263),('m130524_201442_init',1494317266),('m170509_075945_create_ws_brand_table',1494317265),('m170509_075957_create_ws_goods_table',1494317265),('m170509_080002_create_ws_order_table',1494317266),('m170509_080013_create_ws_agent_table',1494317266),('m170509_080019_create_ws_user_agent_table',1494317266),('m170509_080025_create_ws_brand_agent_table',1494317266),('m170518_092145_create_ac_calendar_table',1495099315),('m170518_095843_create_ac_art_table',1495101533),('m170518_102211_create_ac_remind_table',1495102936);
/*!40000 ALTER TABLE `ws_migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_order`
--

DROP TABLE IF EXISTS `ws_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(10) DEFAULT NULL,
  `order_num` varchar(20) DEFAULT NULL,
  `userid` int(10) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `goods_id` int(10) DEFAULT NULL,
  `goods_name` varchar(50) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `number` int(5) DEFAULT NULL,
  `money` float(10,2) DEFAULT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `agent_userid` int(10) DEFAULT '0',
  `agent_username` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_order`
--

LOCK TABLES `ws_order` WRITE;
/*!40000 ALTER TABLE `ws_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `ws_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_remind`
--

DROP TABLE IF EXISTS `ws_remind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_remind` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `artid` int(10) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `remind_time` datetime DEFAULT NULL,
  `openids` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_remind`
--

LOCK TABLES `ws_remind` WRITE;
/*!40000 ALTER TABLE `ws_remind` DISABLE KEYS */;
/*!40000 ALTER TABLE `ws_remind` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_user`
--

DROP TABLE IF EXISTS `ws_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_user`
--

LOCK TABLES `ws_user` WRITE;
/*!40000 ALTER TABLE `ws_user` DISABLE KEYS */;
INSERT INTO `ws_user` VALUES (1,'admin','xUU9ZNnTcGtk6PYzK6k36xAHf2K8sxWY','$2y$13$T1I8AJUSBZJIhWHEc0cnUOtWWMFXYXvnmSkpNNiDBXkyXwS/iibeO','pxZtaoz6di-9yiirH94soSbtYVxY5KGj_1496306348','changyuanyuan@yaolan.com',10,1494829008,1496373635),(2,'demo','QDzk4a-J5lf8YFdHWuawiZ8POQuQmGOw','$2y$13$fhpMkqCWKOW19mc5X79rPuoolPPDhvOZi.ydes/x4461amAhrKb2m',NULL,'demo@yaolan.com',10,1496373417,1496373417);
/*!40000 ALTER TABLE `ws_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_user_agent`
--

DROP TABLE IF EXISTS `ws_user_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_user_agent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_user_agent`
--

LOCK TABLES `ws_user_agent` WRITE;
/*!40000 ALTER TABLE `ws_user_agent` DISABLE KEYS */;
/*!40000 ALTER TABLE `ws_user_agent` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-02 17:22:47
