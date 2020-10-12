-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: exercici6
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `brand_id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `Supplier_supplier_id` int NOT NULL,
  PRIMARY KEY (`brand_id`),
  KEY `fk_Brand_Supplier1_idx` (`Supplier_supplier_id`),
  CONSTRAINT `fk_Brand_Supplier1` FOREIGN KEY (`Supplier_supplier_id`) REFERENCES `supplier` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Etnia',2),(2,'POC',3),(3,'Oakley',3),(4,'Rayban',1);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `postal_code` varchar(12) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(45) NOT NULL,
  `registration_date` date NOT NULL,
  `recommendation_id` int DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customer_id_UNIQUE` (`customer_id`),
  KEY `fk_Customer_Customer1_idx` (`recommendation_id`),
  CONSTRAINT `fk_Customer_Customer1` FOREIGN KEY (`recommendation_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'John','Jackson','08024','685478541','johnjackson@gmail.com','2020-10-12',NULL),(2,'Andreu','Martí','08018','696548524','andreumarti_3@gmail.com','2020-08-30',1),(3,'Anna','Van der Poel','08041','654154785','annavdp@gmail.com','2020-06-02',NULL),(4,'Chloe','Kuss','08024','636963696','ck94@gmail.com','2020-10-10',3);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `employee_id_UNIQUE` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Maria','Andreu'),(2,'Anna','Galicia'),(3,'Marc','Ibars');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glasses`
--

DROP TABLE IF EXISTS `glasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glasses` (
  `glasses_id` int NOT NULL,
  `Brand_brand_id` int NOT NULL,
  `graduation_right_glass` float NOT NULL,
  `graduation_left_glass` float NOT NULL,
  `frame_type` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `frame_color` varchar(45) NOT NULL,
  `color_right_glass` varchar(45) DEFAULT NULL,
  `color_left_glass` varchar(45) DEFAULT NULL,
  `price` decimal(10,0) NOT NULL,
  PRIMARY KEY (`glasses_id`),
  UNIQUE KEY `glasses_id_UNIQUE` (`glasses_id`),
  KEY `fk_Glasses_Brand1_idx` (`Brand_brand_id`),
  CONSTRAINT `fk_Glasses_Brand1` FOREIGN KEY (`Brand_brand_id`) REFERENCES `brand` (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glasses`
--

LOCK TABLES `glasses` WRITE;
/*!40000 ALTER TABLE `glasses` DISABLE KEYS */;
INSERT INTO `glasses` VALUES (1,2,1.25,1.25,'plastic','green',NULL,NULL,121),(2,1,0.5,0.75,'metal','black','orange','orange',109),(3,3,4,3.5,'rimless','white','green','green',156),(4,2,0.25,0,'plastic','black',NULL,NULL,76),(5,4,2.25,2.75,'metal','grey','brown','brown',130);
/*!40000 ALTER TABLE `glasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale` (
  `sale_id` int NOT NULL,
  `Employee_employee_id` int NOT NULL,
  `Glasses_glasses_id` int NOT NULL,
  `Customer_customer_id` int NOT NULL,
  PRIMARY KEY (`sale_id`),
  UNIQUE KEY `sale_id_UNIQUE` (`sale_id`),
  KEY `fk_Sale_Employee1_idx` (`Employee_employee_id`),
  KEY `fk_Sale_Glasses1_idx` (`Glasses_glasses_id`),
  KEY `fk_Sale_Customer1_idx` (`Customer_customer_id`),
  CONSTRAINT `fk_Sale_Customer1` FOREIGN KEY (`Customer_customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `fk_Sale_Employee1` FOREIGN KEY (`Employee_employee_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `fk_Sale_Glasses1` FOREIGN KEY (`Glasses_glasses_id`) REFERENCES `glasses` (`glasses_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
INSERT INTO `sale` VALUES (1,2,1,2),(2,3,3,1),(3,1,2,2),(4,1,2,4),(5,2,5,3);
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `supplier_id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `street` varchar(45) NOT NULL,
  `street_number` smallint NOT NULL,
  `floor` tinyint DEFAULT NULL,
  `door` tinyint DEFAULT NULL,
  `city` varchar(45) NOT NULL,
  `postal_code` varchar(12) NOT NULL,
  `country` varchar(45) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `fax` varchar(20) NOT NULL,
  `tax_id` varchar(15) NOT NULL,
  PRIMARY KEY (`supplier_id`),
  UNIQUE KEY `supplier_id_UNIQUE` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Smith Glasses','Carrer Gran de Gràcia',42,1,1,'Barcelona','08012','Spain','666999555','8888777555','L58695872X'),(2,'Ulleres Domingo','Paisseig de Sant Joan',166,NULL,NULL,'Barcelona','08037','Spain','666888444','8888666444','L28566475Z'),(3,'Eyewear Supplies','Dean Street',82,NULL,NULL,'Newcastle upon Tyne','NE13HE','United Kingdom','666222555','8888444222','V74258962G');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-12 20:25:59
