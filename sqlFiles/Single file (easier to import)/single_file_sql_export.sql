CREATE DATABASE  IF NOT EXISTS `z_db` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `z_db`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: z_db
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `z_clients207`
--

DROP TABLE IF EXISTS `z_clients207`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `z_clients207` (
  `clientId207` int NOT NULL,
  `clientName207` varchar(45) DEFAULT NULL,
  `clientCity207` varchar(45) DEFAULT NULL,
  `clientPassword207` varchar(45) DEFAULT NULL,
  `moneyOwned207` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`clientId207`),
  UNIQUE KEY `clientId207_UNIQUE` (`clientId207`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_clients207`
--

LOCK TABLES `z_clients207` WRITE;
/*!40000 ALTER TABLE `z_clients207` DISABLE KEYS */;
INSERT INTO `z_clients207` VALUES (1,'First Client','City A','745632','0'),(2,'Second Client','City B','786541','50'),(3,'Third Client ','City C','652341','100'),(4,'Fourth Client','City D','754123','150'),(5,'Fifth Client','City E','762145','30');
/*!40000 ALTER TABLE `z_clients207` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_lines207`
--

DROP TABLE IF EXISTS `z_lines207`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `z_lines207` (
  `lineNo207` int NOT NULL AUTO_INCREMENT,
  `POs207_poNo207` int NOT NULL,
  `Parts207_partNo007` varchar(10) NOT NULL,
  `qty207` int DEFAULT NULL,
  `priceOrdered207` decimal(10,0) DEFAULT NULL,
  `company_207` varchar(45) NOT NULL,
  PRIMARY KEY (`lineNo207`,`POs207_poNo207`,`Parts207_partNo007`),
  KEY `fk_POs207_has_Parts207_POs207_idx` (`POs207_poNo207`),
  CONSTRAINT `fk_POs207_has_Parts207_POs207` FOREIGN KEY (`POs207_poNo207`) REFERENCES `z_pos207` (`poNo207`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_lines207`
--

LOCK TABLES `z_lines207` WRITE;
/*!40000 ALTER TABLE `z_lines207` DISABLE KEYS */;
INSERT INTO `z_lines207` VALUES (1,2,'P2-1',10,10,'X'),(2,4,'P2-2',50,12,'Y');
/*!40000 ALTER TABLE `z_lines207` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_pos207`
--

DROP TABLE IF EXISTS `z_pos207`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `z_pos207` (
  `poNo207` int NOT NULL AUTO_INCREMENT,
  `clientCompID207` varchar(45) DEFAULT NULL,
  `dataOfPO207` date DEFAULT NULL,
  `status207` varchar(45) DEFAULT NULL,
  `Clients207_clientId207` int NOT NULL,
  PRIMARY KEY (`poNo207`,`Clients207_clientId207`),
  UNIQUE KEY `poNo207_UNIQUE` (`poNo207`),
  KEY `fk_POs207_Clients2071_idx` (`Clients207_clientId207`),
  CONSTRAINT `fk_POs207_Clients2071` FOREIGN KEY (`Clients207_clientId207`) REFERENCES `z_clients207` (`clientId207`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_pos207`
--

LOCK TABLES `z_pos207` WRITE;
/*!40000 ALTER TABLE `z_pos207` DISABLE KEYS */;
INSERT INTO `z_pos207` VALUES (1,'123','2022-11-14','Pending',3),(2,'113','2022-11-14','Pending',1),(3,'113','2022-11-14','Pending',1),(4,'215','2022-11-15','Pending',5);
/*!40000 ALTER TABLE `z_pos207` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-15 21:11:44
CREATE DATABASE  IF NOT EXISTS `y_db` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `y_db`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: y_db
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `y_clients207`
--

DROP TABLE IF EXISTS `y_clients207`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `y_clients207` (
  `clientId207` int NOT NULL,
  `clientName207` varchar(45) DEFAULT NULL,
  `clientCity207` varchar(45) DEFAULT NULL,
  `clientPassword207` varchar(45) DEFAULT NULL,
  `moneyOwned207` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`clientId207`),
  UNIQUE KEY `clientId207_UNIQUE` (`clientId207`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `y_clients207`
--

LOCK TABLES `y_clients207` WRITE;
/*!40000 ALTER TABLE `y_clients207` DISABLE KEYS */;
/*!40000 ALTER TABLE `y_clients207` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `y_lines207`
--

DROP TABLE IF EXISTS `y_lines207`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `y_lines207` (
  `POs207_poNo207` int NOT NULL AUTO_INCREMENT,
  `Parts207_partNo007` varchar(10) NOT NULL,
  `lineNo207` int NOT NULL,
  `qty207` int DEFAULT NULL,
  `priceOrdered207` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`POs207_poNo207`,`Parts207_partNo007`,`lineNo207`),
  KEY `fk_POs207_has_Parts207_Parts2071_idx` (`Parts207_partNo007`),
  KEY `fk_POs207_has_Parts207_POs207_idx` (`POs207_poNo207`),
  CONSTRAINT `Parts207_partNo007` FOREIGN KEY (`Parts207_partNo007`) REFERENCES `y_parts207` (`partNo007`),
  CONSTRAINT `POs207_poNo207` FOREIGN KEY (`POs207_poNo207`) REFERENCES `y_pos207` (`poNo207`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `y_lines207`
--

LOCK TABLES `y_lines207` WRITE;
/*!40000 ALTER TABLE `y_lines207` DISABLE KEYS */;
/*!40000 ALTER TABLE `y_lines207` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `y_parts207`
--

DROP TABLE IF EXISTS `y_parts207`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `y_parts207` (
  `partNo007` varchar(10) NOT NULL,
  `partName207` varchar(45) DEFAULT NULL,
  `currentPrice207` decimal(10,0) DEFAULT NULL,
  `qoh207` int DEFAULT NULL,
  PRIMARY KEY (`partNo007`),
  UNIQUE KEY `idParts007_207_UNIQUE` (`partNo007`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `y_parts207`
--

LOCK TABLES `y_parts207` WRITE;
/*!40000 ALTER TABLE `y_parts207` DISABLE KEYS */;
INSERT INTO `y_parts207` VALUES ('P2-1','Part E',10,60),('P2-2','Part A',12,100),('P2-3','Part F',21,100),('P2-4','Part G',25,49),('P2-5','Part B',45,50),('P2-6','Part H',63,69);
/*!40000 ALTER TABLE `y_parts207` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `y_pos207`
--

DROP TABLE IF EXISTS `y_pos207`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `y_pos207` (
  `poNo207` int NOT NULL AUTO_INCREMENT,
  `clientCompID207` varchar(45) DEFAULT NULL,
  `dataOfPO207` date DEFAULT NULL,
  `status207` varchar(45) DEFAULT NULL,
  `Clients207_clientId207` int NOT NULL,
  PRIMARY KEY (`poNo207`,`Clients207_clientId207`),
  UNIQUE KEY `poNo207_UNIQUE` (`poNo207`),
  KEY `fk_POs207_Clients2071_idx` (`Clients207_clientId207`),
  CONSTRAINT `fk_POs207_Clients2071` FOREIGN KEY (`Clients207_clientId207`) REFERENCES `y_clients207` (`clientId207`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `y_pos207`
--

LOCK TABLES `y_pos207` WRITE;
/*!40000 ALTER TABLE `y_pos207` DISABLE KEYS */;
/*!40000 ALTER TABLE `y_pos207` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-15 21:11:44
CREATE DATABASE  IF NOT EXISTS `x_db` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `x_db`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: x_db
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `x_clients207`
--

DROP TABLE IF EXISTS `x_clients207`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `x_clients207` (
  `clientId207` int NOT NULL,
  `clientName207` varchar(45) DEFAULT NULL,
  `clientCity207` varchar(45) DEFAULT NULL,
  `clientPassword207` varchar(45) DEFAULT NULL,
  `moneyOwned207` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`clientId207`),
  UNIQUE KEY `clientId207_UNIQUE` (`clientId207`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `x_clients207`
--

LOCK TABLES `x_clients207` WRITE;
/*!40000 ALTER TABLE `x_clients207` DISABLE KEYS */;
INSERT INTO `x_clients207` VALUES (2,'Josh','Sackville','586452','300'),(15,'Nathan','Halifax','123456','35.65'),(18,'Bob','Bedford','159147','0'),(21,'John','Darthmouth','126845','120');
/*!40000 ALTER TABLE `x_clients207` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `x_lines207`
--

DROP TABLE IF EXISTS `x_lines207`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `x_lines207` (
  `lineNo207` int NOT NULL AUTO_INCREMENT,
  `POs207_poNo207` int NOT NULL,
  `Parts207_partNo007` varchar(10) NOT NULL,
  `qty207` int DEFAULT NULL,
  `priceOrdered207` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`lineNo207`,`Parts207_partNo007`,`POs207_poNo207`),
  KEY `POs207_poNo207_idx` (`POs207_poNo207`),
  KEY `Parts207_partNo007_idx` (`Parts207_partNo007`),
  CONSTRAINT `Parts207_partNo007` FOREIGN KEY (`Parts207_partNo007`) REFERENCES `x_parts207` (`partNo007`),
  CONSTRAINT `POs207_poNo207` FOREIGN KEY (`POs207_poNo207`) REFERENCES `x_pos207` (`poNo207`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `x_lines207`
--

LOCK TABLES `x_lines207` WRITE;
/*!40000 ALTER TABLE `x_lines207` DISABLE KEYS */;
/*!40000 ALTER TABLE `x_lines207` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `x_parts207`
--

DROP TABLE IF EXISTS `x_parts207`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `x_parts207` (
  `partNo007` varchar(10) NOT NULL,
  `partName207` varchar(45) DEFAULT NULL,
  `currentPrice207` decimal(10,0) DEFAULT NULL,
  `qoh207` int DEFAULT NULL,
  PRIMARY KEY (`partNo007`),
  UNIQUE KEY `idParts007_207_UNIQUE` (`partNo007`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `x_parts207`
--

LOCK TABLES `x_parts207` WRITE;
/*!40000 ALTER TABLE `x_parts207` DISABLE KEYS */;
INSERT INTO `x_parts207` VALUES ('P2-1','Part E',10,30),('P2-2','Part A',13,100),('P2-5','Part B',50,30),('P2-7','Part C',15,61),('P2-8','Part D',129,200);
/*!40000 ALTER TABLE `x_parts207` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `x_pos207`
--

DROP TABLE IF EXISTS `x_pos207`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `x_pos207` (
  `poNo207` int NOT NULL AUTO_INCREMENT,
  `clientCompID207` varchar(45) DEFAULT NULL,
  `dataOfPO207` date DEFAULT NULL,
  `status207` varchar(45) DEFAULT NULL,
  `Clients207_clientId207` int NOT NULL,
  PRIMARY KEY (`poNo207`,`Clients207_clientId207`),
  UNIQUE KEY `poNo207_UNIQUE` (`poNo207`),
  KEY `Clients207_clientId207_idx` (`Clients207_clientId207`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `x_pos207`
--

LOCK TABLES `x_pos207` WRITE;
/*!40000 ALTER TABLE `x_pos207` DISABLE KEYS */;
INSERT INTO `x_pos207` VALUES (1,'123','2022-01-01','Pending',2),(2,'456','2022-02-02','Completed',15),(3,'789','2022-03-03','Hold',18),(6,'259','2022-11-13','Pending',15),(7,'259','2022-11-13','Pending',15),(8,'753','2022-11-13','Pending',2),(9,'18','2022-11-13','Pending',2),(10,'751','2022-11-14','Hold',0);
/*!40000 ALTER TABLE `x_pos207` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-15 21:11:44
