-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cyworld
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `user_purchase`
--

DROP TABLE IF EXISTS `user_purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_purchase` (
  `number` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(45) NOT NULL,
  `stock_background_file` varchar(45) DEFAULT NULL,
  `stock_background_price` int DEFAULT NULL,
  `stock_background_contents` varchar(45) DEFAULT NULL,
  `stock_background_buy_date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_purchase`
--

LOCK TABLES `user_purchase` WRITE;
/*!40000 ALTER TABLE `user_purchase` DISABLE KEYS */;
INSERT INTO `user_purchase` VALUES (3,'3321','outer/bg2.gif',10,'꽃밭','2023-06-15'),(4,'3321','outer/bg1.gif',10,'꽃창','2023-06-15'),(6,'3321','outer/backgroundouter.png',0,'기본이미지','2023-06-16'),(7,'3321','outer/bg3.gif',10,'녹화','2023-06-16'),(8,'3321','outer/bg5.gif',10,'생일축하해','2023-06-20'),(16,'999','outer/backgroundouter.png',0,'기본이미지','2023-06-21'),(17,'999','outer/bg1.gif',10,'꽃창','2023-06-21'),(18,'999','outer/bg3.gif',10,'녹화','2023-06-21');
/*!40000 ALTER TABLE `user_purchase` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-21 12:35:04
