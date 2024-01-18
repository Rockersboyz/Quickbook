-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: quickbook
-- ------------------------------------------------------
-- Server version	8.0.34

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
create database if not exists quickbook;
use quickbook;
--
-- Table structure for table `booking_detail`
--

DROP TABLE IF EXISTS `booking_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_detail` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `timing_id` int NOT NULL,
  `user_id` int NOT NULL,
  `no_of_tickets` int NOT NULL,
  `ticket_amount` int NOT NULL,
  `seat_no` varchar(45) NOT NULL,
  PRIMARY KEY (`booking_id`),
  UNIQUE KEY `booking_id_UNIQUE` (`booking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_detail`
--

LOCK TABLES `booking_detail` WRITE;
/*!40000 ALTER TABLE `booking_detail` DISABLE KEYS */;
INSERT INTO `booking_detail` VALUES (2,2,1,0,0,'[]'),(3,17,1,3,1050,'[\'H3\', \'H3\', \'H3\']'),(4,30,1,2,800,'[\'D8\', \'D9\']'),(5,21,1,3,1050,'[\'M4\', \'M5\', \'M6\']'),(6,16,1,3,1050,'[\'L5\', \'L6\', \'L7\']'),(7,113,1,2,600,'[\'N3\', \'N4\']'),(8,138,1,2,500,'[\'N1\', \'N2\']'),(9,81,1,2,300,'[\'L4\', \'L5\']');
/*!40000 ALTER TABLE `booking_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city_detail`
--

DROP TABLE IF EXISTS `city_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city_detail` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `city_name` varchar(45) NOT NULL,
  PRIMARY KEY (`city_id`),
  UNIQUE KEY `city_id_UNIQUE` (`city_id`),
  UNIQUE KEY `city_name_UNIQUE` (`city_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city_detail`
--

LOCK TABLES `city_detail` WRITE;
/*!40000 ALTER TABLE `city_detail` DISABLE KEYS */;
INSERT INTO `city_detail` VALUES (6,'Bengaluru'),(3,'Chennai'),(4,'Delhi'),(2,'Mumbai'),(1,'Navi Mumbai'),(5,'Pune');
/*!40000 ALTER TABLE `city_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cost_detail`
--

DROP TABLE IF EXISTS `cost_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cost_detail` (
  `cost_id` int NOT NULL AUTO_INCREMENT,
  `timing_id` int NOT NULL,
  `ticket_amount` int NOT NULL,
  PRIMARY KEY (`cost_id`),
  UNIQUE KEY `cost_id_UNIQUE` (`cost_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cost_detail`
--

LOCK TABLES `cost_detail` WRITE;
/*!40000 ALTER TABLE `cost_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `cost_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_detail`
--

DROP TABLE IF EXISTS `movie_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_detail` (
  `theatre_id` int NOT NULL,
  `movie_id` int NOT NULL AUTO_INCREMENT,
  `movie_name` varchar(45) NOT NULL,
  `ticket_amount` float(6,2) DEFAULT NULL,
  PRIMARY KEY (`movie_id`),
  UNIQUE KEY `movie_id_UNIQUE` (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_detail`
--

LOCK TABLES `movie_detail` WRITE;
/*!40000 ALTER TABLE `movie_detail` DISABLE KEYS */;
INSERT INTO `movie_detail` VALUES (1,1,'Captain America: Brave New World',400.00),(1,2,'Spider-Man: Beyond the Spider-Verse',300.00),(1,3,'Tiger 3',350.00),(1,4,'Dunki',350.00),(1,5,'Salaar: Part 1 - Ceasefire',400.00),(2,6,'Deadpool 3 ',250.00),(2,7,'Godzilla x Kong: The New Empire',200.00),(2,8,'Kalki 2898 AD',250.00),(2,9,'Fighter',150.00),(2,10,'Animal ',200.00),(3,11,'Mission: Impossible - Dead Reckoning Part Two',200.00),(3,12,'Kung Fu Panda 4',150.00),(3,13,'Merry Christmas ',200.00),(3,14,'Sam Bahadur',150.00),(3,15,'Bade Miyan Chote Miyan',250.00),(4,16,'Wonka',150.00),(4,17,'Despicable Me 4',150.00),(4,18,'Dunki',250.00),(4,19,'Salaar: Part 1 - Ceasefire',300.00),(4,20,'Singham Again',200.00),(5,21,'Spider-Man: Beyond the Spider-Verse',250.00),(5,22,'Godzilla x Kong: The New Empire',150.00),(5,23,'Leo',250.00),(5,24,'Sam Bahadur',300.00),(5,25,'Animal',200.00),(6,26,'Mission: Impossible - Dead Reckoning Part Two',300.00),(6,27,'Captain America: Brave New World',250.00),(6,28,'Dunki',350.00),(6,29,'Bade Miyan Chote Miyan',200.00),(6,30,'Fighter',300.00),(7,31,'Spider-Man: Beyond the Spider-Verse',250.00),(7,32,'Godzilla x Kong: The New Empire',200.00),(7,33,'Merry Christmas',150.00),(7,34,'Yodha',250.00),(7,35,'Kalki 2898 AD',300.00),(8,36,'Thunderbolts',200.00),(8,37,'Deadpool 3 ',150.00),(8,38,'Salaar: Part 1 - Ceasefire',250.00),(8,39,'Leo',300.00),(8,40,'Animal',150.00),(9,41,'Aquaman and the Lost Kingdom',250.00),(9,42,'Despicable Me 4',200.00),(9,43,'Dunki',300.00),(9,44,'Salaar: Part 1 - Ceasefire',350.00),(9,45,'Yodha',200.00),(10,46,'Sonic the Hedgehog 3',200.00),(10,47,'Kung Fu Panda 4',100.00),(10,48,'Tiger3',250.00),(10,49,'Animal',200.00),(10,50,'Fighter',150.00),(11,51,'Deadpool 3',200.00),(11,52,'Dunki',250.00),(11,53,'Leo',250.00),(11,54,'Vidamuyarchi',200.00),(11,55,'Guntur Kaaram',150.00),(13,56,'Spider-Man: Beyond the Spider-Verse',250.00),(13,57,'Tiger 3',200.00),(13,58,'Leo',300.00),(13,59,'Ustaad Bhagat Singh',250.00),(13,60,'Double iSmart',150.00),(14,61,'Wonka',150.00),(14,62,'Animal',200.00),(14,63,'Leo',300.00),(14,64,'Devara',150.00),(14,65,'Bilal',200.00),(15,66,'Despicable Me 4',150.00),(15,67,'Merry Christmas',200.00),(15,68,'Leo',250.00),(15,69,'Vidamuyarchi',200.00),(15,70,'Guntur Kaaram',150.00),(16,71,'Aquaman and the Lost Kingdom',100.00),(16,72,'Captain America: Brave New World',150.00),(16,73,'Salaar: Part 1 - Ceasefire',300.00),(16,74,'Yodha',200.00),(16,75,'Fighter',250.00),(17,76,'Thunderbolts',150.00),(17,77,'Kung Fu Panda 4',200.00),(17,78,'Leo',250.00),(17,79,'Kalki 2898 AD',300.00),(17,80,'Dunki',200.00),(18,81,'Godzilla x Kong: The New Empire',250.00),(18,82,'Sonic the Hedgehog 3',150.00),(18,83,'Sam Bahadur',200.00),(18,84,'Animal',250.00),(18,85,'Double iSmart',300.00),(19,86,'Mission: Impossible - Dead Reckoning Part Two',200.00),(19,87,'Spider-Man: Beyond the Spider-Verse',250.00),(19,88,'Merry Christmas',150.00),(19,89,'Fighter',300.00),(19,90,'Bade Miyan Chote Miyan',250.00),(20,91,'Despicable Me 4',100.00),(20,92,'Aquaman and the Lost Kingdom',250.00),(20,93,'Yodha',200.00),(20,94,'Tiger 3',300.00),(20,95,'Ustaad Bhagat Singh',200.00);
/*!40000 ALTER TABLE `movie_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screen_detail`
--

DROP TABLE IF EXISTS `screen_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `screen_detail` (
  `theatre_id` int NOT NULL,
  `screen_id` int NOT NULL AUTO_INCREMENT,
  `screen_name` varchar(45) NOT NULL,
  PRIMARY KEY (`screen_id`),
  UNIQUE KEY `screen_id_UNIQUE` (`screen_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screen_detail`
--

LOCK TABLES `screen_detail` WRITE;
/*!40000 ALTER TABLE `screen_detail` DISABLE KEYS */;
INSERT INTO `screen_detail` VALUES (1,1,'SCREEN 1'),(1,2,'SCREEN 2'),(1,3,'SCREEN 3'),(2,4,'SCREEN 1'),(2,5,'SCREEN 2'),(2,6,'SCREEN 3'),(3,7,'SCREEN 1'),(3,8,'SCREEN 2'),(3,9,'SCREEN 3'),(4,10,'SCREEN 1'),(4,11,'SCREEN 2'),(4,12,'SCREEN 3'),(5,13,'SCREEN 1'),(5,14,'SCREEN 2'),(5,15,'SCREEN 3'),(6,16,'SCREEN 1'),(6,17,'SCREEN 2'),(6,18,'SCREEN 3'),(7,19,'SCREEN 1'),(7,20,'SCREEN 2'),(7,21,'SCREEN 3'),(8,22,'SCREEN 1'),(8,23,'SCREEN 2'),(8,24,'SCREEN 3'),(9,25,'SCREEN 1'),(9,26,'SCREEN 2'),(9,27,'SCREEN 3'),(10,28,'SCREEN 1'),(10,29,'SCREEN 2'),(10,30,'SCREEN 3'),(11,31,'SCREEN 1'),(11,32,'SCREEN 2'),(11,33,'SCREEN 3'),(12,34,'SCREEN 1'),(12,35,'SCREEN 2'),(12,36,'SCREEN 3'),(13,37,'SCREEN 1'),(13,38,'SCREEN 2'),(13,39,'SCREEN 3'),(14,40,'SCREEN 1'),(14,41,'SCREEN 2'),(14,42,'SCREEN 3'),(15,43,'SCREEN 1'),(15,44,'SCREEN 2'),(15,45,'SCREEN 3'),(16,46,'SCREEN 1'),(16,47,'SCREEN 2'),(16,48,'SCREEN 3'),(17,49,'SCREEN 1'),(17,50,'SCREEN 2'),(17,51,'SCREEN 3'),(18,52,'SCREEN 1'),(18,53,'SCREEN 2'),(18,54,'SCREEN 3'),(19,55,'SCREEN 1'),(19,56,'SCREEN 2'),(19,57,'SCREEN 3'),(20,58,'SCREEN 1'),(20,59,'SCREEN 2'),(20,60,'SCREEN 3'),(21,61,'SCREEN 1'),(21,62,'SCREEN 2'),(21,63,'SCREEN 3'),(22,64,'SCREEN 1'),(22,65,'SCREEN 2'),(22,66,'SCREEN 3'),(23,67,'SCREEN 1'),(23,68,'SCREEN 2'),(23,69,'SCREEN 3'),(24,70,'SCREEN 1'),(24,71,'SCREEN 2'),(24,72,'SCREEN 3'),(25,73,'SCREEN 1'),(25,74,'SCREEN 2'),(25,75,'SCREEN 3'),(26,76,'SCREEN 1'),(26,77,'SCREEN 2'),(26,78,'SCREEN 3'),(27,79,'SCREEN 1'),(27,80,'SCREEN 2'),(27,81,'SCREEN 3'),(28,82,'SCREEN 1'),(28,83,'SCREEN 2'),(28,84,'SCREEN 3'),(29,85,'SCREEN 1'),(29,86,'SCREEN 2'),(29,87,'SCREEN 3'),(30,88,'SCREEN 1'),(30,89,'SCREEN 2'),(30,90,'SCREEN 3');
/*!40000 ALTER TABLE `screen_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theatre_detail`
--

DROP TABLE IF EXISTS `theatre_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theatre_detail` (
  `city_id` int NOT NULL,
  `theatre_id` int NOT NULL AUTO_INCREMENT,
  `theatre_name` varchar(45) NOT NULL,
  PRIMARY KEY (`theatre_id`),
  UNIQUE KEY `theatre_id_UNIQUE` (`theatre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theatre_detail`
--

LOCK TABLES `theatre_detail` WRITE;
/*!40000 ALTER TABLE `theatre_detail` DISABLE KEYS */;
INSERT INTO `theatre_detail` VALUES (1,1,'Cinepolis: Nexus Seawoods, Navi Mumbai'),(1,2,'INOX: Palm Beach Galleria Mall, Navi Mumbai'),(1,3,'INOX: Raghuleela Mall, Vashi'),(1,4,'PVR: Orion Mall, Panvel '),(1,5,'Balaji Movieplex: Kopar Khairane'),(2,6,'PVR: Jio Drive-In Theatre, Jio World Drive'),(2,7,'Cinepolis: Fun Republic Mall, Andheri'),(2,8,'INOX: Raghuleela Mall, Kandivali'),(2,9,'PVR: Infiniti, Malad Mumbai'),(2,10,'Carnival: Annex Mall, Borivali'),(3,11,'SPI Palazzo: Nexus Vijaya Mall, Vadapalani'),(3,12,'Cinepolis: BSR Mall, OMR, Thoraipakkam'),(3,13,'PVR: Grand Mall, Velachery'),(3,14,'AGS Cinemas: T. Nagar'),(3,15,'INOX: Chennai Citi Centre, Dr. RK Salai'),(4,16,'Cinepolis: Cross River Mall, Shahdara'),(4,17,'Cinepolis: V3S Mall, Laxmi Nagar'),(4,18,'INOX: Nehru Place'),(4,19,'PVR: Ansal Plaza, Greater Noida'),(4,20,'PVR: Pacific, Subhash Nagar, Delhi'),(5,21,'INOX: Elpro City Square, Chinchwad'),(5,22,'Cinepolis: Seasons Mall, Pune'),(5,23,'Cinepolis: Nexus WESTEND Mall Aundh, Pune'),(5,24,'City Pride: Kothrud'),(5,25,'PVR: Phoenix Market City, Pune'),(6,26,'Urvashi Cinema: Bengaluru'),(6,27,'Cinepolis: Lulu Mall, Bengaluru'),(6,28,'PVR: Soul Spirit Central Mall, Bellandur'),(6,29,'INOX: Mantri Square, Malleshwaram'),(6,30,'PVR: Superplex Forum Mall, Kanakapura Road');
/*!40000 ALTER TABLE `theatre_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timing_detail`
--

DROP TABLE IF EXISTS `timing_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timing_detail` (
  `screen_id` int NOT NULL,
  `timing_id` int NOT NULL AUTO_INCREMENT,
  `timing` varchar(45) NOT NULL,
  `movie_id` int NOT NULL,
  PRIMARY KEY (`timing_id`),
  UNIQUE KEY `timing_id_UNIQUE` (`timing_id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timing_detail`
--

LOCK TABLES `timing_detail` WRITE;
/*!40000 ALTER TABLE `timing_detail` DISABLE KEYS */;
INSERT INTO `timing_detail` VALUES (1,1,'9:30 AM',1),(1,2,'12:25 PM',1),(1,3,'5:35 PM',1),(3,4,'11:40 AM',1),(3,5,'3:45 PM',1),(3,6,'8:15 PM ',1),(1,7,'11:15 AM',2),(1,8,'4:20 PM',2),(1,9,'8:40 PM',2),(2,10,'9:10 AM',2),(2,11,'12:05 PM',2),(2,12,'6:00 PM',2),(2,13,'10:25 AM',3),(2,14,'3:20 PM',3),(2,15,'5:55 PM',3),(3,16,'9:35 AM',3),(3,17,'1:05 PM',3),(3,18,'8:00 PM',3),(1,19,'12:15 PM',4),(1,20,'4:20 PM',4),(1,21,'6:05 PM',4),(3,22,'9:25 AM',4),(3,23,'2:05 PM',4),(3,24,'8:05 PM',4),(1,25,'9:15 AM',5),(1,26,'2:00 PM',5),(1,27,'8:20 PM',5),(2,28,'11:55 AM',5),(2,29,'2:40 PM',5),(2,30,'4:25 PM',5),(1,31,'9:15 AM',6),(1,32,'3:45 PM',6),(1,33,'6:30 PM',6),(3,34,'11:45 AM',6),(3,35,'2:30 PM',6),(3,36,'8:05 PM',6),(1,37,'9:20 AM',7),(1,38,'1:00 PM',7),(1,39,'8:10 PM',7),(2,40,'11:45 AM',7),(2,41,'5:15 PM',7),(2,42,'7:00 PM',7),(2,43,'10:35 AM',8),(2,44,'4:20 PM',8),(2,45,'6:00 PM',8),(3,46,'9:10 AM',8),(3,47,'12:15 PM',8),(3,48,'8:05 PM',8),(1,49,'9:05 AM',9),(1,50,'12:30 PM',9),(1,51,'5:25 PM',9),(3,52,'11:10 AM',9),(3,53,'3:45 PM',9),(3,54,'8:25 PM',9),(1,55,'10:55 AM',10),(1,56,'3:00 PM',10),(1,57,'5:10 PM',10),(2,58,'9:30 AM',10),(2,59,'2:25 PM',10),(2,60,'8:05 PM',10),(1,61,'12:10 PM',11),(1,62,'4:50 PM',11),(1,63,'6:25 PM',11),(3,64,'9:20 AM',11),(3,65,'3:05 PM',11),(3,66,'8:15 PM',11),(1,67,'9:05 AM',12),(1,68,'2:45 PM',12),(1,69,'8:20 PM',12),(2,70,'12:25 PM',12),(2,71,'4:05 PM',12),(2,72,'6:10 PM',12),(2,73,'11:50 AM',13),(2,74,'5:00 PM',13),(2,75,'7:25 PM',13),(3,76,'9:35 AM',13),(3,77,'3:05 PM',13),(3,78,'8:15 PM',13),(1,79,'9:15 AM',14),(1,80,'3:55 PM',14),(1,81,'8:00 PM',14),(3,82,'11:35 AM',14),(3,83,'5:00 PM',14),(3,84,'7:25 PM',14),(1,85,'11:00 AM',15),(1,86,'4:35 PM',15),(1,87,'6:45 PM',15),(2,88,'9:25 AM',15),(2,89,'2:40 PM',15),(2,90,'8:15 PM',15),(1,91,'9:25 AM',16),(1,92,'2:05 PM',16),(1,93,'8:10 PM',16),(3,94,'12:25 PM',16),(3,95,'4:30 PM',16),(3,96,'6:40 PM',16),(1,97,'11:00 AM',17),(1,98,'4:55 PM',17),(1,99,'7:20 PM',17),(2,100,'9:10 AM',17),(2,101,'1:35 PM',17),(2,102,'8:45 PM',17),(2,103,'11:35 AM',18),(2,104,'5:20 PM',18),(2,105,'7:00 PM',18),(3,106,'9:25 AM',18),(3,107,'3:50 PM',18),(3,108,'8:40 PM',18),(1,109,'9:25 AM',19),(1,110,'2:55 PM',19),(1,111,'7:00 PM',19),(3,112,'11:35 AM',19),(3,113,'4:00 PM',19),(3,114,'8:25 PM',19),(1,115,'11:05 AM',20),(1,116,'4:20 PM',20),(1,117,'7:35 PM',20),(2,118,'9:10 AM',20),(2,119,'2:45 PM',20),(2,120,'8:30 PM',20),(1,121,'11:30 AM',21),(1,122,'4:35 PM',21),(1,123,'8:10 PM',21),(3,124,'9:15 AM',21),(3,125,'2:35 PM',21),(3,126,'6:00 PM',21),(1,127,'9:35 AM',22),(1,128,'1:00 PM',22),(1,129,'6:05 PM',22),(2,130,'10:55 AM',22),(2,131,'3:25 PM',22),(2,132,'8:40 PM',22),(2,133,'11:05 AM',23),(2,134,'5:25 PM',23),(2,135,'8:50 PM',23),(3,136,'9:20 AM',23),(3,137,'2:00 PM',23),(3,138,'6:45 PM',23),(1,139,'9:05 AM',24),(1,140,'1:30 PM',24),(1,141,'7:55 PM',24),(3,142,'10:35 AM',24),(3,143,'3:20 PM',24),(3,144,'8:30 PM',24),(1,145,'11:10 AM',25),(1,146,'3:35 PM',25),(1,147,'5:55 PM',25),(2,148,'9:25 AM',25),(2,149,'2:00 PM',25),(2,150,'8:10 PM',25);
/*!40000 ALTER TABLE `timing_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_detail`
--

DROP TABLE IF EXISTS `user_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_detail` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email_id` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `userid_UNIQUE` (`userid`),
  UNIQUE KEY `email_id_UNIQUE` (`email_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `password_UNIQUE` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_detail`
--

LOCK TABLES `user_detail` WRITE;
/*!40000 ALTER TABLE `user_detail` DISABLE KEYS */;
INSERT INTO `user_detail` VALUES (1,'Vishal','Khanna','vkrock769@gmail.com','Rockersboyz','DarKKing4'),(4,'prema','khanna','ramdossjr.prem@gmail.com','premakhanna','vishal81'),(5,'Ruhini','Singh','ruhini@gmail.com','Ruhinin','Abcdef123'),(6,'Pranav','Gadaginavar','pranav@gmail.com','Pranav7','Singhini');
/*!40000 ALTER TABLE `user_detail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-04 13:17:53