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
-- Table structure for table `diary`
--

DROP TABLE IF EXISTS `diary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diary` (
  `diary_number` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(45) NOT NULL,
  `diary_content` varchar(1000) NOT NULL,
  `diary_date` varchar(45) NOT NULL,
  PRIMARY KEY (`diary_number`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diary`
--

LOCK TABLES `diary` WRITE;
/*!40000 ALTER TABLE `diary` DISABLE KEYS */;
INSERT INTO `diary` VALUES (4,'3321','								\r\n		ㅇㅇㄹㅇㄴㄹㄹㅇㄹㅇㄹ	ㅇㄹㅇㄹㅇㄹㅇㄹ					','2023-03-04'),(5,'3321','								\r\n						ㅇㄴㄹㅇㄴㄹㅇㄴㄹㅇㄴ		','2021-04-03'),(6,'3321','								\r\n				ㄴㅇㄹㅇㄴㄹㅇㄴㄹㅇㄴㄹㅇㄴ				','2023-11-18'),(7,'3321','								\r\n		ㅇㄹㅇㄹㅇ						','2023-07-08'),(8,'3321','								\r\n								','2023-01-01'),(9,'3321','								\r\n								','2023-01-01'),(10,'3321','								\r\n								','2023-01-01'),(11,'3321','ㅇㄴㄹㅇㄴㄹㅇㄴㄹㅇㄴㄹㅇㄴㄹㅇㄴㄹㅇㄴㄹㅇㄴㄹㅇㄴㄹ								\r\n								','2023-01-01'),(12,'3321','								\r\n			fdfdsfdsfdsfds					','2021-04-05'),(13,'3321','		fdfsffs	','2023-04-05'),(14,'3321','								\r\n				kjhlkjlkjlkljl				','2023-01-01'),(15,'3321','rwrferwerwerwer			','2023-01-05'),(16,'3321','1월7일 입니다		','2023-01-07'),(17,'3321','			ㄹㅇㄴㄹㅇㄴㄹ					\r\n								','2023-04-01'),(18,'3321','								\r\n						호ㅓ쇼ㅕ쇼ㅕ		','2023-06-09'),(19,'3321','3월2일								\r\n								','2023-03-02'),(20,'3321','								\r\n		2022년 10월 9일						','2022-10-09'),(21,'3321','								\r\n			dfgvdsfgdsfdsfdsf		qwewqe			','2023-06-13');
/*!40000 ALTER TABLE `diary` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-14 17:27:20
