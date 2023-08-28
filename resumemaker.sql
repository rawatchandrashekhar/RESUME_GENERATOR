-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: honda
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `admininfo`
--

DROP TABLE IF EXISTS `admininfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admininfo` (
  `emailid` varchar(100) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `adminname` varchar(100) DEFAULT NULL,
  `adminpicture` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`emailid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admininfo`
--

LOCK TABLES `admininfo` WRITE;
/*!40000 ALTER TABLE `admininfo` DISABLE KEYS */;
INSERT INTO `admininfo` VALUES ('chandrashekharrawat@gmail.com','12345','Chandra Shekhar Rawat','user1.jpg'),('nishantrajput@gmail.com','12345','Nishant Rajput','user2.jpg');
/*!40000 ALTER TABLE `admininfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminregistration`
--

DROP TABLE IF EXISTS `adminregistration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminregistration` (
  `emailid` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `picture` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`emailid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminregistration`
--

LOCK TABLES `adminregistration` WRITE;
/*!40000 ALTER TABLE `adminregistration` DISABLE KEYS */;
INSERT INTO `adminregistration` VALUES ('amardeepsen@gmail.com','Amardeep Sen','123456','WhatsApp Image 2021-09-18 at 8.21.41 PM.jpeg'),('animeshsharma7806@gmail.com','Animesh Sharma','12345','Untitled (1).jpg'),('chandrashekharrawat@gmail.com','Chandra Shekhar Rawat','12345','user1.jpg'),('chandu23@gmail.com','Chandra Shekhar Rawat','12345','realme-3-1-amp-original-imafvgcgvp3hngsq.jpeg'),('dheerendrasingh@gmail.com','Dheerendra Singh','12345','WhatsApp Image 2021-12-06 at 9.01.38 AM.jpeg'),('jaysingh23@gmail.com','Jay Singh','12345','realme-3-1-amp-original-imafvgcgvp3hngsq.jpeg'),('jeetendrasingh42@gmail.com','Jeetendra Singh','12345','WhatsApp Image 2021-12-06 at 9.01.38 AM.jpeg'),('rambhuvansingh42@gmail.com','Rambhuvan Singh','12345','rma2007-realme-original-imag6zdn8gezjky5.jpeg');
/*!40000 ALTER TABLE `adminregistration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `stateid` int NOT NULL,
  `boardid` int NOT NULL,
  `boardname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`boardid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (100,1,'M.P.'),(100,2,'CBSE'),(200,3,'U.P.'),(200,4,'CBSE'),(300,5,'HBSE'),(300,6,'CBSE'),(400,7,'GSEB'),(400,8,'CBSE'),(500,9,'PSEB'),(500,10,'CBSE');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `stateid` int NOT NULL,
  `cityid` int NOT NULL,
  `cityname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (100,1,'Bhopal'),(100,2,'Gwalior'),(100,3,'Indore'),(100,4,'Datia'),(200,5,'Lucknow'),(200,6,'Noida'),(200,7,'Ghaziabad'),(300,8,'Gurugram'),(300,9,'Faridabad'),(300,10,'Rohtak'),(400,11,'Ahemdabad'),(400,12,'Surat'),(400,13,'Vadodra'),(500,14,'Amritsar'),(500,15,'Chandigarh'),(500,16,'Jalandhar');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colleges`
--

DROP TABLE IF EXISTS `colleges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colleges` (
  `universityid` int NOT NULL,
  `collegeid` int NOT NULL,
  `collegename` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`collegeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colleges`
--

LOCK TABLES `colleges` WRITE;
/*!40000 ALTER TABLE `colleges` DISABLE KEYS */;
INSERT INTO `colleges` VALUES (101,1,'Science College'),(101,2,'Prestige College'),(101,3,'Madhav Shiksha Mahavidyalaya'),(102,4,'Sagar Institute of Research and Technology'),(102,5,'SGSITS'),(103,6,'Institute of Engineering and Technology'),(104,7,'Amity School of Engineering and Technology'),(105,8,'Institute of Mass Communication and Media Technology'),(105,9,'Adarsh College of Education'),(106,10,'College of Pure Majors'),(107,11,'Institute of pharmacy'),(108,12,'Medical College'),(109,13,'Mittal School of Business LPU'),(110,14,'Thapar School of Liberal Arts and Science');
/*!40000 ALTER TABLE `colleges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeebranches`
--

DROP TABLE IF EXISTS `employeebranches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeebranches` (
  `ebid` int NOT NULL,
  `eid` int DEFAULT NULL,
  PRIMARY KEY (`ebid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeebranches`
--

LOCK TABLES `employeebranches` WRITE;
/*!40000 ALTER TABLE `employeebranches` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeebranches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `eid` int NOT NULL,
  `ename` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'chandu'),(2,'chandu');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resumedata`
--

DROP TABLE IF EXISTS `resumedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resumedata` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `fathername` varchar(100) DEFAULT NULL,
  `dateofbirth` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `stateid` int DEFAULT NULL,
  `cityid` int DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobilenumber` varchar(45) DEFAULT NULL,
  `fulladdress` varchar(500) DEFAULT NULL,
  `highschoolpercentage` varchar(45) DEFAULT NULL,
  `highschoolboard` varchar(45) DEFAULT NULL,
  `highschoolpassingyear` varchar(45) DEFAULT NULL,
  `highersecondarypercentage` varchar(45) DEFAULT NULL,
  `highersecondaryboard` varchar(45) DEFAULT NULL,
  `highersecondarypassingyear` varchar(45) DEFAULT NULL,
  `graduationpercentage` varchar(45) DEFAULT NULL,
  `graduationpassingyear` varchar(45) DEFAULT NULL,
  `universityid` int DEFAULT NULL,
  `collegeid` int DEFAULT NULL,
  `skills` text,
  `otheractivities` text,
  `picture` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resumedata`
--

LOCK TABLES `resumedata` WRITE;
/*!40000 ALTER TABLE `resumedata` DISABLE KEYS */;
INSERT INTO `resumedata` VALUES (7,'Rambhuvan Singh Rawat','Raj Singh','2022-01-13','Male',100,2,'rambhuvansingh42@gmail.com','8789876567','Phoolbagh','63%','','2014','70%','','2016','65%','2019',101,1,'C, C++','','rma2007-realme-original-imag6zdn8gezjky5.jpeg'),(8,'Chandra Shekhar Rawat','Veerendra Singh Rawat','2022-01-05','Male',100,2,'chandu23@gmail.com','8789876567','Phoolbagh','63%','M.P.','2014','70%','CBSE','2016','63%','2019',101,1,'C, C++','Playing Cricket','rma207-android-realme-original-imafy2fxtuzghm5m.jpeg');
/*!40000 ALTER TABLE `resumedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `stateid` int NOT NULL,
  `statename` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`stateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (100,'Madhya Pradesh'),(200,'Uttar Pradesh'),(300,'Haryana'),(400,'Gujrat'),(500,'Punjab');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `supplierid` int NOT NULL AUTO_INCREMENT,
  `suppliername` varchar(100) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `dateofbirth` varchar(45) DEFAULT NULL,
  `stateid` int DEFAULT NULL,
  `cityid` int DEFAULT NULL,
  `mobileno` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `amountdue` varchar(100) DEFAULT NULL,
  `amountpaid` varchar(100) DEFAULT NULL,
  `currencytype` varchar(100) DEFAULT NULL,
  `gst` int DEFAULT NULL,
  `picture` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`supplierid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Chandra Shekhar Rawat','Male','1998-12-27',100,2,'8789876567','chandrashekharrawat@gmail.com','2000','100000','Dollar',9,'IMG_20171204_224221_789.jpg'),(2,'Amardeep Sen','Male','1998-10-12',100,2,'9000987678','amardeep@gmail.com','4000','200000','Dollar',8,'img1.jpg');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `universities`
--

DROP TABLE IF EXISTS `universities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `universities` (
  `stateid` int NOT NULL,
  `universityid` int NOT NULL,
  `universityname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`universityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `universities`
--

LOCK TABLES `universities` WRITE;
/*!40000 ALTER TABLE `universities` DISABLE KEYS */;
INSERT INTO `universities` VALUES (100,101,'Jiwaji University'),(100,102,'RGPV'),(200,103,'Dr. APJ Abdul Kalam Technical University'),(200,104,'Amity University'),(300,105,'Kurushetra University'),(300,106,'Ashoka University'),(400,107,'Nirma University'),(400,108,'The Maharaja Sayajirao University of Baroda'),(500,109,'Lovely Professional University'),(500,110,'Thapar Institute of Engineering and Technology');
/*!40000 ALTER TABLE `universities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-14 21:59:23
