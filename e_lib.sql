-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: e_lib
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `A_ID` int NOT NULL,
  `Name` varchar(40) NOT NULL,
  PRIMARY KEY (`A_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Jim Marion'),(2,'Nicolo Cesa-Bianchi'),(3,'Joseph O\'Rourke'),(4,'William Shakespeare'),(5,'Glen E.Rodgers'),(6,'C. E Capes'),(7,'Priyamvada Gopal');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `ISBN` bigint NOT NULL,
  `Category` varchar(50) NOT NULL,
  `Book_Title` varchar(255) NOT NULL,
  `Page_Count` varchar(255) DEFAULT NULL,
  `Review` varchar(255) DEFAULT NULL,
  `A_ID` int NOT NULL,
  `P_ID` int NOT NULL,
  PRIMARY KEY (`ISBN`),
  KEY `A_ID` (`A_ID`),
  KEY `P_ID` (`P_ID`),
  CONSTRAINT `Book_ibfk_1` FOREIGN KEY (`A_ID`) REFERENCES `author` (`A_ID`),
  CONSTRAINT `Book_ibfk_2` FOREIGN KEY (`P_ID`) REFERENCES `publisher` (`P_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (9780071664936,'Psychology','PeopleSoft PeopleTolls Tips and Techiques','641',NULL,1,1),(9780195039658,'Education','Art gallery theorems and algorithms ','296',NULL,3,4),(9780199544386,'History ','The Indian English Novel: Nation,History and Narration','192',NULL,7,4),(9780444418425,'Technology','Particle, learning, and games','205',NULL,6,6),(9780511191787,'History','Prediction, Learning, and Games','407',NULL,2,2),(9780521649766,'Education','Computational geometry in C','358',NULL,3,2),(9781562546342,'Novel','The Merchant of Venice','50',NULL,4,3),(9781562549220,'Novel','A Midsummer Night\'s Dream','65',NULL,4,3),(9783540001706,'Education ','Algorithmic Learning Theory ','420 ',NULL,2,5),(9788448116231,'Education','Quimica Inorganica','669',NULL,5,1);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edition`
--

DROP TABLE IF EXISTS `edition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `edition` (
  `Edition_No` int NOT NULL,
  `ISBN` bigint NOT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Language` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ISBN`,`Edition_No`),
  CONSTRAINT `Edition_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edition`
--

LOCK TABLES `edition` WRITE;
/*!40000 ALTER TABLE `edition` DISABLE KEYS */;
INSERT INTO `edition` VALUES (1,9780071664936,'Standard','English'),(2,9780195039658,'Premium','English'),(1,9780199544386,'Limited','Hindi'),(1,9780444418425,'Standard','English'),(1,9780511191787,'Deluxe','English'),(2,9780521649766,'Standard','English'),(1,9781562546342,'Premium','English'),(1,9781562549220,'Standard','English'),(5,9783540001706,'Premium','English'),(1,9788448116231,'Standard','Spanish');
/*!40000 ALTER TABLE `edition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_record`
--

DROP TABLE IF EXISTS `log_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_record` (
  `USER_ID` int NOT NULL,
  `ACTION` varchar(255) DEFAULT NULL,
  `Date_Time` datetime DEFAULT NULL,
  `log_number` bigint NOT NULL,
  PRIMARY KEY (`log_number`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `Log_Record_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `registration_user` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_record`
--

LOCK TABLES `log_record` WRITE;
/*!40000 ALTER TABLE `log_record` DISABLE KEYS */;
INSERT INTO `log_record` VALUES (101,'Registered Sucessfully','2019-12-31 00:00:00',1000),(102,'Registered Sucessfully','2020-12-13 19:00:00',1001),(103,'Registered Sucessfully','2021-09-10 18:00:00',1002),(104,'Registered Sucessfully','2021-09-11 18:00:00',1003),(105,'Registered Sucessfully','2021-09-12 18:00:00',1004),(106,'Registered Sucessfully','2021-09-13 18:00:00',1005),(107,'Registered Sucessfully','2021-09-14 18:00:00',1006),(108,'Registered Sucessfully','2021-09-15 18:00:00',1007),(109,'Registered Sucessfully','2021-09-16 18:00:00',1008),(110,'Registered Sucessfully','2021-09-17 18:00:00',1009),(101,'Downloaded a book','2021-09-20 18:00:00',1111),(102,'Downloaded a book','2021-09-21 18:00:00',1112),(103,'Downloaded a book','2021-09-22 18:00:00',1113),(104,'Downloaded a book','2021-09-22 18:00:00',1114),(105,'Downloaded a book','2021-09-22 18:00:00',1115);
/*!40000 ALTER TABLE `log_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail`
--

DROP TABLE IF EXISTS `mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mail` (
  `E_Mail` varchar(25) NOT NULL,
  `Alt_Mail` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`E_Mail`),
  CONSTRAINT `Mail_ibfk_1` FOREIGN KEY (`E_Mail`) REFERENCES `registration_user` (`E_Mail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail`
--

LOCK TABLES `mail` WRITE;
/*!40000 ALTER TABLE `mail` DISABLE KEYS */;
INSERT INTO `mail` VALUES ('afk@gmail.com','ak4@gmail.com'),('ap@gmail.com','ecom@gmail.com'),('ip@gmail.com','ea@gmail.com'),('kb@gmail.com','kru@gmail.com'),('kc@gmail.com','kyc@gmail.com'),('mb@gmail.com','mbc@gmail.com'),('sb@gmail.com','skk@gmail.com'),('sc@gmail.com','ego@gmail.com'),('sv@gmail.com','shiro@gmail.com'),('ys@gmail.com','ceo@gmail.com');
/*!40000 ALTER TABLE `mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_number`
--

DROP TABLE IF EXISTS `phone_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phone_number` (
  `Code` varchar(5) NOT NULL,
  `Contact_Number` int NOT NULL,
  `Number` int NOT NULL,
  PRIMARY KEY (`Contact_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_number`
--

LOCK TABLES `phone_number` WRITE;
/*!40000 ALTER TABLE `phone_number` DISABLE KEYS */;
INSERT INTO `phone_number` VALUES ('+91',23783,1123),('+91',34993,2367),('+91',37587,5489),('+91',76247,7381),('+91',85682,7853),('+91',88890,1232),('+91',90905,9000),('+91',98765,8765),('+91',98790,6572),('+91',98922,2788);
/*!40000 ALTER TABLE `phone_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publisher` (
  `P_ID` int NOT NULL,
  `Name` varchar(65) NOT NULL,
  `Address` varchar(120) DEFAULT NULL,
  `Book_Published` int NOT NULL,
  PRIMARY KEY (`P_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (1,'McGraw Hill','New York, United States',100000),(2,'Cambridge University Press ','Cambridge, United Kingdom',50000),(3,'Saddleback Educational Publishing ','Costa Mesa, CA',44000),(4,'Oxford University Press','Oxford, United Kingdom',60000),(5,'Springer-Verlag Berlin Heidelberg','Berlin, Germany',30000),(6,'Elsevier','Amsterdam, Netherlands',48300);
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_user`
--

DROP TABLE IF EXISTS `registration_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration_user` (
  `User_ID` int NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `E_Mail` varchar(25) DEFAULT NULL,
  `Contact_Number` int NOT NULL,
  PRIMARY KEY (`User_ID`),
  KEY `Contact_Number` (`Contact_Number`),
  KEY `E_Mail` (`E_Mail`),
  CONSTRAINT `Registration_USER_ibfk_1` FOREIGN KEY (`Contact_Number`) REFERENCES `phone_number` (`Contact_Number`),
  CONSTRAINT `Registration_USER_ibfk_2` FOREIGN KEY (`E_Mail`) REFERENCES `mail` (`E_Mail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_user`
--

LOCK TABLES `registration_user` WRITE;
/*!40000 ALTER TABLE `registration_user` DISABLE KEYS */;
INSERT INTO `registration_user` VALUES (101,'Yash Shinde','ys@gmail.com',23783),(102,'Shivam Vadalia','sv@gmail.com',34993),(103,'Siddharth Chavan','sc@gmail.com',37587),(104,'Akash Patil','ap@gmail.com',76247),(105,'Krunal Bhere','kb@gmail.com',85682),(106,'Ishaan Pandita','ip@gmail.com',88890),(107,'Mohan Bangur','mb@gmail.com',90905),(108,'Kiran Chandani','kc@gmail.com',98765),(109,'Aishwarya Faungauskar','afk@gmail.com',98790),(110,'Shrikant Tiwari','sb@gmail.com',98922);
/*!40000 ALTER TABLE `registration_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `ISBN` bigint DEFAULT NULL,
  `User_ID` int DEFAULT NULL,
  KEY `ISBN` (`ISBN`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `Users_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`),
  CONSTRAINT `Users_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `registration_user` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2021-09-28  9:36:36
