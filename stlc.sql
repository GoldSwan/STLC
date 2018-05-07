-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: stlc
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('root','csedbadmin',1);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auths`
--

DROP TABLE IF EXISTS `auths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auths` (
  `username` varchar(45) NOT NULL,
  `authority` varchar(45) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auths`
--

LOCK TABLES `auths` WRITE;
/*!40000 ALTER TABLE `auths` DISABLE KEYS */;
INSERT INTO `auths` VALUES ('root','ROLE_ADMIN');
/*!40000 ALTER TABLE `auths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `token` varchar(256) NOT NULL,
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('dUaIq9PjpMQ:APA91bGqwg4nmEVgC_dHnjNQrGLDgLxfZwqvvG584bZh0DEx_cm5HokiRxxOVx6aod0EV2z66xtA679rD_MFlHeVD5cmya9PgKFtrp_-bvoaMtkhWT9yhZOHRQqI-yCBBu2tCw8aZo8x'),('dxD34wayJfQ:APA91bGDmKO1zIWPDeqK0LKivOBvjG02pOXKUNqE0d_Bv44DAzZL5zM6gTblcLLoZVFR1Q-NrYE1RCfqHBGxACkQWvdKN5tU0VU1k1fgPvK7BAsS8U9FZj_Dj6f_eaCjTxhpMJunu9Ga'),('dYtv89Jx2H8:APA91bFPJEUrVa7JWMSHfKXh3FCR2GrT7RFdOEGvQrS3lWOs5y68TlKYNZqD-LDo5aEgby8E_1EsmQ9eFdMCRVKqsabgkXMTY0GbyR5g8B0N0Mlnv8xc7MeMLVthKSmkD8dPfXK5uZn2'),('e9Hi5hfvwKc:APA91bGphr6fpAOi1NTViny9VV2xryagValWrsiOVLpjHzDlGuGg3JwoiJRmLY2kQX9IUvdecKBbwVmjdHV0mu87zOfv-vQ2Ev6EpObhdp6m-8knqKKCFJg2s2kv92V4j2fiUaUYZIBb'),('eqUREptXzsk:APA91bGjWjLQZh9_85OAmFPNtLFaYeMuR2wyS7aiLh2GtzhRzyunGru-mzBLLlEXQugyfb9RA9MNWUX6sUyabuFWJpH77PQT1YID5-fMkgRv99y1EFnmQWgciJH04PwgntQi2VxNx2XX'),('f7PtOiP4Ef4:APA91bE-iK-NBWyz4_6yCiepIzHpDd1lvK_jJKXQt3tfKSDO86iHp21zfeja-P_s8bCGDX9yGCTPFRE0Kg2GQudZCBCrrWPDmXzyewTOoWC6E0BFGWq7EGLylEF-vC9w6RBBCpiVe4b_');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-28 13:15:16
