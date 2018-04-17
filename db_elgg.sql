-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: elggdb
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `elgg_access_collection_membership`
--

DROP TABLE IF EXISTS `elgg_access_collection_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elgg_access_collection_membership` (
  `user_guid` bigint(20) unsigned NOT NULL,
  `access_collection_id` int(11) NOT NULL,
  PRIMARY KEY (`user_guid`,`access_collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elgg_access_collection_membership`
--

LOCK TABLES `elgg_access_collection_membership` WRITE;
/*!40000 ALTER TABLE `elgg_access_collection_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `elgg_access_collection_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elgg_access_collections`
--

DROP TABLE IF EXISTS `elgg_access_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elgg_access_collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `owner_guid` bigint(20) unsigned NOT NULL,
  `subtype` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `owner_guid` (`owner_guid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elgg_access_collections`
--

LOCK TABLES `elgg_access_collections` WRITE;
/*!40000 ALTER TABLE `elgg_access_collections` DISABLE KEYS */;
INSERT INTO `elgg_access_collections` VALUES (3,'friends',35,'friends');
/*!40000 ALTER TABLE `elgg_access_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elgg_annotations`
--

DROP TABLE IF EXISTS `elgg_annotations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elgg_annotations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_guid` bigint(20) unsigned NOT NULL,
  `name` text NOT NULL,
  `value` longtext NOT NULL,
  `value_type` enum('integer','text') NOT NULL,
  `owner_guid` bigint(20) unsigned NOT NULL,
  `access_id` int(11) NOT NULL,
  `time_created` int(11) NOT NULL,
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `entity_guid` (`entity_guid`),
  KEY `name` (`name`(50)),
  KEY `value` (`value`(50)),
  KEY `owner_guid` (`owner_guid`),
  KEY `access_id` (`access_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elgg_annotations`
--

LOCK TABLES `elgg_annotations` WRITE;
/*!40000 ALTER TABLE `elgg_annotations` DISABLE KEYS */;
/*!40000 ALTER TABLE `elgg_annotations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elgg_api_users`
--

DROP TABLE IF EXISTS `elgg_api_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elgg_api_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `api_key` varchar(40) DEFAULT NULL,
  `secret` varchar(40) NOT NULL,
  `active` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_key` (`api_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elgg_api_users`
--

LOCK TABLES `elgg_api_users` WRITE;
/*!40000 ALTER TABLE `elgg_api_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `elgg_api_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elgg_config`
--

DROP TABLE IF EXISTS `elgg_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elgg_config` (
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elgg_config`
--

LOCK TABLES `elgg_config` WRITE;
/*!40000 ALTER TABLE `elgg_config` DISABLE KEYS */;
INSERT INTO `elgg_config` VALUES ('admin_registered','i:1;'),('allow_registration','b:0;'),('allow_user_default_access','s:0:\"\";'),('default_access','s:1:\"2\";'),('default_limit','i:10;'),('installed','i:1523989534;'),('language','s:2:\"en\";'),('processed_upgrades','a:0:{}'),('security_email_require_password','b:1;'),('security_notify_admins','b:1;'),('security_notify_user_password','b:1;'),('security_protect_upgrade','b:1;'),('simplecache_enabled','i:1;'),('simplecache_lastupdate','i:1523989534;'),('system_cache_enabled','i:1;'),('version','i:2017041200;'),('walled_garden','b:0;'),('__site_secret__','s:32:\"zEqEY98Em3eH_d7OsIBgSSPnuQItElrB\";');
/*!40000 ALTER TABLE `elgg_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elgg_entities`
--

DROP TABLE IF EXISTS `elgg_entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elgg_entities` (
  `guid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('object','user','group','site') NOT NULL,
  `subtype` varchar(252) CHARACTER SET utf8 NOT NULL,
  `owner_guid` bigint(20) unsigned NOT NULL,
  `container_guid` bigint(20) unsigned NOT NULL,
  `access_id` int(11) NOT NULL,
  `time_created` int(11) NOT NULL,
  `time_updated` int(11) NOT NULL,
  `last_action` int(11) NOT NULL DEFAULT '0',
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`guid`),
  KEY `type` (`type`),
  KEY `owner_guid` (`owner_guid`),
  KEY `container_guid` (`container_guid`),
  KEY `access_id` (`access_id`),
  KEY `time_created` (`time_created`),
  KEY `time_updated` (`time_updated`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elgg_entities`
--

LOCK TABLES `elgg_entities` WRITE;
/*!40000 ALTER TABLE `elgg_entities` DISABLE KEYS */;
INSERT INTO `elgg_entities` VALUES (1,'site','site',0,0,2,1523989534,1523989534,1523989534,'yes'),(2,'object','plugin',1,1,2,1523989534,1523989534,1523989534,'yes'),(3,'object','plugin',1,1,2,1523989534,1523989534,1523989534,'yes'),(4,'object','plugin',1,1,2,1523989534,1523989534,1523989534,'yes'),(5,'object','plugin',1,1,2,1523989534,1523989534,1523989534,'yes'),(6,'object','plugin',1,1,2,1523989534,1523989534,1523989534,'yes'),(7,'object','plugin',1,1,2,1523989534,1523989534,1523989534,'yes'),(8,'object','plugin',1,1,2,1523989534,1523989534,1523989534,'yes'),(9,'object','plugin',1,1,2,1523989534,1523989534,1523989534,'yes'),(10,'object','plugin',1,1,2,1523989534,1523989534,1523989534,'yes'),(11,'object','plugin',1,1,2,1523989534,1523989534,1523989534,'yes'),(12,'object','plugin',1,1,2,1523989534,1523989534,1523989534,'yes'),(13,'object','plugin',1,1,2,1523989534,1523989534,1523989534,'yes'),(14,'object','plugin',1,1,2,1523989534,1523989534,1523989534,'yes'),(15,'object','plugin',1,1,2,1523989535,1523989535,1523989535,'yes'),(16,'object','plugin',1,1,2,1523989535,1523989535,1523989535,'yes'),(17,'object','plugin',1,1,2,1523989535,1523989535,1523989535,'yes'),(18,'object','plugin',1,1,2,1523989535,1523989535,1523989535,'yes'),(19,'object','plugin',1,1,2,1523989535,1523989535,1523989535,'yes'),(20,'object','plugin',1,1,2,1523989535,1523989535,1523989535,'yes'),(21,'object','plugin',1,1,2,1523989535,1523989535,1523989535,'yes'),(22,'object','plugin',1,1,2,1523989535,1523989535,1523989535,'yes'),(23,'object','plugin',1,1,2,1523989535,1523989535,1523989535,'yes'),(24,'object','plugin',1,1,2,1523989535,1523989535,1523989535,'yes'),(25,'object','plugin',1,1,2,1523989535,1523989535,1523989535,'yes'),(26,'object','plugin',1,1,2,1523989535,1523989535,1523989535,'yes'),(27,'object','plugin',1,1,2,1523989535,1523989535,1523989535,'yes'),(28,'object','plugin',1,1,2,1523989535,1523989535,1523989535,'yes'),(29,'object','plugin',1,1,2,1523989535,1523989535,1523989535,'yes'),(30,'object','plugin',1,1,2,1523989535,1523989535,1523989535,'yes'),(31,'object','plugin',1,1,2,1523989535,1523989535,1523989535,'yes'),(32,'object','plugin',1,1,2,1523989535,1523989535,1523989535,'yes'),(33,'object','plugin',1,1,2,1523989535,1523989535,1523989535,'yes'),(34,'object','plugin',1,1,2,1523989535,1523989535,1523989535,'yes'),(35,'user','user',0,0,2,1523989554,1523989554,1523989554,'yes'),(36,'object','widget',35,35,2,1523989555,1523989555,1523989555,'yes'),(37,'object','widget',35,35,2,1523989555,1523989555,1523989555,'yes'),(38,'object','widget',35,35,2,1523989555,1523989555,1523989555,'yes'),(39,'object','widget',35,35,2,1523989555,1523989555,1523989555,'yes'),(40,'object','widget',35,35,2,1523989555,1523989555,1523989555,'yes'),(41,'object','admin_notice',0,0,0,1523989555,1523989555,1523989555,'yes');
/*!40000 ALTER TABLE `elgg_entities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elgg_entity_relationships`
--

DROP TABLE IF EXISTS `elgg_entity_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elgg_entity_relationships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid_one` bigint(20) unsigned NOT NULL,
  `relationship` varchar(50) NOT NULL,
  `guid_two` bigint(20) unsigned NOT NULL,
  `time_created` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `guid_one` (`guid_one`,`relationship`,`guid_two`),
  KEY `relationship` (`relationship`),
  KEY `guid_two` (`guid_two`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elgg_entity_relationships`
--

LOCK TABLES `elgg_entity_relationships` WRITE;
/*!40000 ALTER TABLE `elgg_entity_relationships` DISABLE KEYS */;
/*!40000 ALTER TABLE `elgg_entity_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elgg_hmac_cache`
--

DROP TABLE IF EXISTS `elgg_hmac_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elgg_hmac_cache` (
  `hmac` varchar(255) CHARACTER SET utf8 NOT NULL,
  `ts` int(11) NOT NULL,
  PRIMARY KEY (`hmac`),
  KEY `ts` (`ts`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elgg_hmac_cache`
--

LOCK TABLES `elgg_hmac_cache` WRITE;
/*!40000 ALTER TABLE `elgg_hmac_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `elgg_hmac_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elgg_metadata`
--

DROP TABLE IF EXISTS `elgg_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elgg_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_guid` bigint(20) unsigned NOT NULL,
  `name` text NOT NULL,
  `value` longtext NOT NULL,
  `value_type` enum('integer','text') NOT NULL,
  `owner_guid` int(11) DEFAULT NULL,
  `access_id` int(11) DEFAULT NULL,
  `time_created` int(11) NOT NULL,
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `entity_guid` (`entity_guid`),
  KEY `name` (`name`(50)),
  KEY `value` (`value`(50))
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elgg_metadata`
--

LOCK TABLES `elgg_metadata` WRITE;
/*!40000 ALTER TABLE `elgg_metadata` DISABLE KEYS */;
INSERT INTO `elgg_metadata` VALUES (1,1,'name','My New Community','text',NULL,NULL,1523989534,'yes'),(2,1,'email','internalfire5@live.com','text',NULL,NULL,1523989534,'yes'),(3,2,'title','activity','text',NULL,NULL,1523989534,'yes'),(4,3,'title','blog','text',NULL,NULL,1523989534,'yes'),(5,4,'title','bookmarks','text',NULL,NULL,1523989534,'yes'),(6,5,'title','ckeditor','text',NULL,NULL,1523989534,'yes'),(7,6,'title','custom_index','text',NULL,NULL,1523989534,'yes'),(8,7,'title','dashboard','text',NULL,NULL,1523989534,'yes'),(9,8,'title','developers','text',NULL,NULL,1523989534,'yes'),(10,9,'title','diagnostics','text',NULL,NULL,1523989534,'yes'),(11,10,'title','discussions','text',NULL,NULL,1523989534,'yes'),(12,11,'title','embed','text',NULL,NULL,1523989534,'yes'),(13,12,'title','externalpages','text',NULL,NULL,1523989534,'yes'),(14,13,'title','file','text',NULL,NULL,1523989534,'yes'),(15,14,'title','friends','text',NULL,NULL,1523989535,'yes'),(16,15,'title','friends_collections','text',NULL,NULL,1523989535,'yes'),(17,16,'title','garbagecollector','text',NULL,NULL,1523989535,'yes'),(18,17,'title','groups','text',NULL,NULL,1523989535,'yes'),(19,18,'title','invitefriends','text',NULL,NULL,1523989535,'yes'),(20,19,'title','likes','text',NULL,NULL,1523989535,'yes'),(21,20,'title','login_as','text',NULL,NULL,1523989535,'yes'),(22,21,'title','members','text',NULL,NULL,1523989535,'yes'),(23,22,'title','messageboard','text',NULL,NULL,1523989535,'yes'),(24,23,'title','messages','text',NULL,NULL,1523989535,'yes'),(25,24,'title','notifications','text',NULL,NULL,1523989535,'yes'),(26,25,'title','pages','text',NULL,NULL,1523989535,'yes'),(27,26,'title','profile','text',NULL,NULL,1523989535,'yes'),(28,27,'title','reportedcontent','text',NULL,NULL,1523989535,'yes'),(29,28,'title','search','text',NULL,NULL,1523989535,'yes'),(30,29,'title','site_notifications','text',NULL,NULL,1523989535,'yes'),(31,30,'title','system_log','text',NULL,NULL,1523989535,'yes'),(32,31,'title','tagcloud','text',NULL,NULL,1523989535,'yes'),(33,32,'title','thewire','text',NULL,NULL,1523989535,'yes'),(34,33,'title','uservalidationbyemail','text',NULL,NULL,1523989535,'yes'),(35,34,'title','web_services','text',NULL,NULL,1523989535,'yes'),(36,35,'username','christine.yu','text',NULL,NULL,1523989554,'yes'),(37,35,'email','internalfire5@live.com','text',NULL,NULL,1523989554,'yes'),(38,35,'name','Christine','text',NULL,NULL,1523989554,'yes'),(39,35,'language','en','text',NULL,NULL,1523989554,'yes'),(40,35,'password_hash','$2y$10$6ePg.OsqGc90/VBBFYbYPuH0cfcrVMl5917.SlC7o7vEMA0.LKD/q','text',NULL,NULL,1523989554,'yes'),(41,35,'notification:method:email','1','integer',NULL,NULL,1523989554,'yes'),(42,35,'admin','yes','text',NULL,NULL,1523989555,'yes'),(43,35,'validated','1','integer',NULL,NULL,1523989555,'yes'),(44,35,'validated_method','admin_user','text',NULL,NULL,1523989555,'yes'),(45,35,'last_login','1523989555','integer',NULL,NULL,1523989555,'yes'),(46,41,'admin_notice_id','fresh_install','text',NULL,NULL,1523989555,'yes'),(47,41,'description','Welcome to your Elgg site! For more options, see the <a href=\"http://192.168.1.49:32769/elgg/admin/settings/basic\">settings pages</a>.','text',NULL,NULL,1523989555,'yes');
/*!40000 ALTER TABLE `elgg_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elgg_migrations`
--

DROP TABLE IF EXISTS `elgg_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elgg_migrations` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elgg_migrations`
--

LOCK TABLES `elgg_migrations` WRITE;
/*!40000 ALTER TABLE `elgg_migrations` DISABLE KEYS */;
INSERT INTO `elgg_migrations` VALUES (20170728010000,'RemoveSiteGuid','2018-04-17 18:25:22','2018-04-17 18:25:22',0),(20170728020000,'MigrateDatalistsToConfig','2018-04-17 18:25:22','2018-04-17 18:25:22',0),(20170728030000,'DenormalizeMetastrings','2018-04-17 18:25:22','2018-04-17 18:25:22',0),(20170728040000,'ChangeTableEngine','2018-04-17 18:25:22','2018-04-17 18:25:22',0),(20170728050000,'ExpandTextColumnsToLongtext','2018-04-17 18:25:22','2018-04-17 18:25:22',0),(20170728060000,'RemoveLegacyPasswordHashes','2018-04-17 18:25:22','2018-04-17 18:25:22',0),(20170728072548,'CreateAccessCollectionsTable','2018-04-17 18:25:22','2018-04-17 18:25:22',0),(20170728073540,'CreateAccessCollectionMembershipTable','2018-04-17 18:25:22','2018-04-17 18:25:22',0),(20170728073706,'CreateAnnotationsTable','2018-04-17 18:25:22','2018-04-17 18:25:22',0),(20170728074504,'CreateApiUsersTable','2018-04-17 18:25:22','2018-04-17 18:25:22',0),(20170728074600,'CreateEntitiesTable','2018-04-17 18:25:22','2018-04-17 18:25:22',0),(20170728074645,'CreateEntityRelationshipsTable','2018-04-17 18:25:22','2018-04-17 18:25:22',0),(20170728074729,'CreateEntitySubtypesTable','2018-04-17 18:25:22','2018-04-17 18:25:22',0),(20170728074757,'CreateGeoCacheTable','2018-04-17 18:25:22','2018-04-17 18:25:22',0),(20170728074828,'CreateGroupsEntityTable','2018-04-17 18:25:22','2018-04-17 18:25:22',0),(20170728074857,'CreateHmacCacheTable','2018-04-17 18:25:22','2018-04-17 18:25:22',0),(20170728074925,'CreateMetadataTable','2018-04-17 18:25:22','2018-04-17 18:25:23',0),(20170728074959,'CreateObjectsEntityTable','2018-04-17 18:25:23','2018-04-17 18:25:23',0),(20170728075027,'CreatePrivateSettingsTable','2018-04-17 18:25:23','2018-04-17 18:25:23',0),(20170728075056,'CreateQueueTable','2018-04-17 18:25:23','2018-04-17 18:25:23',0),(20170728075129,'CreateRiverTable','2018-04-17 18:25:23','2018-04-17 18:25:23',0),(20170728075155,'CreateSitesEntityTable','2018-04-17 18:25:23','2018-04-17 18:25:23',0),(20170728075232,'CreateSystemLogTable','2018-04-17 18:25:23','2018-04-17 18:25:23',0),(20170728075306,'CreateUsersApiSessionsTable','2018-04-17 18:25:23','2018-04-17 18:25:23',0),(20170728075337,'CreateUsersEntityTable','2018-04-17 18:25:23','2018-04-17 18:25:23',0),(20170728075418,'CreateUsersRememberMeCookiesTable','2018-04-17 18:25:23','2018-04-17 18:25:23',0),(20170728075454,'CreateUsersSessionsTable','2018-04-17 18:25:23','2018-04-17 18:25:23',0),(20170728075716,'CreateConfigTable','2018-04-17 18:25:23','2018-04-17 18:25:23',0),(20170808084728,'DropGeocodeCache','2018-04-17 18:25:23','2018-04-17 18:25:23',0),(20171006111953,'DropSitesEntityTable','2018-04-17 18:25:23','2018-04-17 18:25:23',0),(20171006131622,'DropGroupsEntityTable','2018-04-17 18:25:23','2018-04-17 18:25:23',0),(20171009115032,'DropObjectsEntityTable','2018-04-17 18:25:23','2018-04-17 18:25:23',0),(20171010095648,'DropUsersEntityTable','2018-04-17 18:25:23','2018-04-17 18:25:23',0),(20171016113827,'UpdateMetadataColumns','2018-04-17 18:25:23','2018-04-17 18:25:23',0),(20171021111005,'AddSubtypeIndexToRiverTable','2018-04-17 18:25:23','2018-04-17 18:25:23',0),(20171021111059,'DenormalizeEntitySubtypes','2018-04-17 18:25:23','2018-04-17 18:25:23',0),(20171021111132,'AlignSubtypeColumns','2018-04-17 18:25:23','2018-04-17 18:25:24',0),(20171106100916,'AddAclSubtype','2018-04-17 18:25:24','2018-04-17 18:25:24',0),(20180109135052,'DropTypeSubtypeFromRiverTable','2018-04-17 18:25:24','2018-04-17 18:25:24',0);
/*!40000 ALTER TABLE `elgg_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elgg_private_settings`
--

DROP TABLE IF EXISTS `elgg_private_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elgg_private_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_guid` bigint(20) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entity_guid` (`entity_guid`,`name`),
  KEY `name` (`name`),
  KEY `value` (`value`(50))
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elgg_private_settings`
--

LOCK TABLES `elgg_private_settings` WRITE;
/*!40000 ALTER TABLE `elgg_private_settings` DISABLE KEYS */;
INSERT INTO `elgg_private_settings` VALUES (1,2,'elgg:internal:priority','0'),(2,3,'elgg:internal:priority','0'),(3,4,'elgg:internal:priority','0'),(4,5,'elgg:internal:priority','0'),(5,6,'elgg:internal:priority','0'),(6,7,'elgg:internal:priority','0'),(7,8,'elgg:internal:priority','0'),(8,9,'elgg:internal:priority','0'),(9,10,'elgg:internal:priority','0'),(10,11,'elgg:internal:priority','0'),(11,12,'elgg:internal:priority','0'),(12,13,'elgg:internal:priority','0'),(13,14,'elgg:internal:priority','0'),(14,15,'elgg:internal:priority','0'),(15,16,'elgg:internal:priority','0'),(16,17,'elgg:internal:priority','0'),(17,18,'elgg:internal:priority','2'),(18,19,'elgg:internal:priority','4'),(19,20,'elgg:internal:priority','6'),(20,21,'elgg:internal:priority','8'),(21,22,'elgg:internal:priority','10'),(22,23,'elgg:internal:priority','12'),(23,24,'elgg:internal:priority','14'),(24,25,'elgg:internal:priority','16'),(25,26,'elgg:internal:priority','18'),(26,27,'elgg:internal:priority','20'),(27,28,'elgg:internal:priority','22'),(28,29,'elgg:internal:priority','24'),(29,30,'elgg:internal:priority','26'),(30,31,'elgg:internal:priority','28'),(31,32,'elgg:internal:priority','30'),(32,33,'elgg:internal:priority','32'),(33,34,'elgg:internal:priority','34'),(34,36,'handler','control_panel'),(35,36,'context','admin'),(36,36,'column','1'),(37,36,'order','0'),(38,37,'handler','admin_welcome'),(39,37,'context','admin'),(40,37,'order','10'),(41,37,'column','1'),(42,38,'handler','online_users'),(43,38,'context','admin'),(44,38,'column','2'),(45,38,'order','0'),(46,39,'handler','new_users'),(47,39,'context','admin'),(48,39,'order','10'),(49,39,'column','2'),(50,40,'handler','content_stats'),(51,40,'context','admin'),(52,40,'order','20'),(53,40,'column','2');
/*!40000 ALTER TABLE `elgg_private_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elgg_queue`
--

DROP TABLE IF EXISTS `elgg_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elgg_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `data` mediumblob NOT NULL,
  `timestamp` int(11) NOT NULL,
  `worker` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `retrieve` (`timestamp`,`worker`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elgg_queue`
--

LOCK TABLES `elgg_queue` WRITE;
/*!40000 ALTER TABLE `elgg_queue` DISABLE KEYS */;
INSERT INTO `elgg_queue` VALUES (1,'notifications','C:48:\"Elgg\\Notifications\\SubscriptionNotificationEvent\":134:{O:8:\"stdClass\":4:{s:6:\"action\";s:10:\"make_admin\";s:9:\"object_id\";i:35;s:11:\"object_type\";s:4:\"user\";s:14:\"object_subtype\";s:4:\"user\";}}',1523989555,NULL);
/*!40000 ALTER TABLE `elgg_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elgg_river`
--

DROP TABLE IF EXISTS `elgg_river`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elgg_river` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_type` varchar(32) NOT NULL,
  `view` text NOT NULL,
  `subject_guid` bigint(20) unsigned NOT NULL,
  `object_guid` bigint(20) unsigned NOT NULL,
  `target_guid` bigint(20) unsigned NOT NULL,
  `annotation_id` int(11) NOT NULL,
  `posted` int(11) NOT NULL,
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `action_type` (`action_type`),
  KEY `subject_guid` (`subject_guid`),
  KEY `object_guid` (`object_guid`),
  KEY `target_guid` (`target_guid`),
  KEY `annotation_id` (`annotation_id`),
  KEY `posted` (`posted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elgg_river`
--

LOCK TABLES `elgg_river` WRITE;
/*!40000 ALTER TABLE `elgg_river` DISABLE KEYS */;
/*!40000 ALTER TABLE `elgg_river` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elgg_system_log`
--

DROP TABLE IF EXISTS `elgg_system_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elgg_system_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `object_class` varchar(50) NOT NULL,
  `object_type` varchar(50) NOT NULL,
  `object_subtype` varchar(252) CHARACTER SET utf8 NOT NULL,
  `event` varchar(50) NOT NULL,
  `performed_by_guid` bigint(20) unsigned NOT NULL,
  `owner_guid` bigint(20) unsigned NOT NULL,
  `access_id` int(11) NOT NULL,
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  `time_created` int(11) NOT NULL,
  `ip_address` varchar(46) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`),
  KEY `object_class` (`object_class`),
  KEY `object_type` (`object_type`),
  KEY `object_subtype` (`object_subtype`),
  KEY `event` (`event`),
  KEY `performed_by_guid` (`performed_by_guid`),
  KEY `access_id` (`access_id`),
  KEY `time_created` (`time_created`),
  KEY `river_key` (`object_type`,`object_subtype`,`event`(25))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elgg_system_log`
--

LOCK TABLES `elgg_system_log` WRITE;
/*!40000 ALTER TABLE `elgg_system_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `elgg_system_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elgg_users_apisessions`
--

DROP TABLE IF EXISTS `elgg_users_apisessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elgg_users_apisessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_guid` bigint(20) unsigned NOT NULL,
  `token` varchar(40) DEFAULT NULL,
  `expires` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_guid` (`user_guid`),
  KEY `token` (`token`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elgg_users_apisessions`
--

LOCK TABLES `elgg_users_apisessions` WRITE;
/*!40000 ALTER TABLE `elgg_users_apisessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `elgg_users_apisessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elgg_users_remember_me_cookies`
--

DROP TABLE IF EXISTS `elgg_users_remember_me_cookies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elgg_users_remember_me_cookies` (
  `code` varchar(32) NOT NULL,
  `guid` bigint(20) unsigned NOT NULL,
  `timestamp` int(11) unsigned NOT NULL,
  PRIMARY KEY (`code`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elgg_users_remember_me_cookies`
--

LOCK TABLES `elgg_users_remember_me_cookies` WRITE;
/*!40000 ALTER TABLE `elgg_users_remember_me_cookies` DISABLE KEYS */;
/*!40000 ALTER TABLE `elgg_users_remember_me_cookies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elgg_users_sessions`
--

DROP TABLE IF EXISTS `elgg_users_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elgg_users_sessions` (
  `session` varchar(255) CHARACTER SET utf8 NOT NULL,
  `ts` int(11) unsigned NOT NULL DEFAULT '0',
  `data` mediumblob,
  PRIMARY KEY (`session`),
  KEY `ts` (`ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elgg_users_sessions`
--

LOCK TABLES `elgg_users_sessions` WRITE;
/*!40000 ALTER TABLE `elgg_users_sessions` DISABLE KEYS */;
INSERT INTO `elgg_users_sessions` VALUES ('kkgmgoga2a3to59pckb2h34b25',1523989559,'_sf2_attributes|a:1:{s:14:\"__elgg_session\";s:22:\"dhsxWBUPlSHrx6BOGDVIna\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1523989559;s:1:\"c\";i:1523989555;s:1:\"l\";s:1:\"0\";}');
/*!40000 ALTER TABLE `elgg_users_sessions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-17 18:43:04
