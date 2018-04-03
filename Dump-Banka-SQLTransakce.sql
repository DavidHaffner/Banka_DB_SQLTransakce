-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: banka
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
-- Table structure for table `klienti`
--

DROP TABLE IF EXISTS `klienti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `klienti` (
  `idKlienta` int(11) NOT NULL AUTO_INCREMENT,
  `jmeno` varchar(45) NOT NULL,
  `prijmeni` varchar(45) NOT NULL,
  PRIMARY KEY (`idKlienta`),
  UNIQUE KEY `idklienti_UNIQUE` (`idKlienta`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klienti`
--

LOCK TABLES `klienti` WRITE;
/*!40000 ALTER TABLE `klienti` DISABLE KEYS */;
INSERT INTO `klienti` VALUES (1,'Pavel','Novák'),(2,'Jan','Malý'),(3,'Karel','Neužil');
/*!40000 ALTER TABLE `klienti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transakce`
--

DROP TABLE IF EXISTS `transakce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transakce` (
  `idTransakce` int(11) NOT NULL AUTO_INCREMENT,
  `zIdUctu` int(11) NOT NULL,
  `naIdUctu` int(11) NOT NULL,
  `castka` decimal(15,0) NOT NULL,
  PRIMARY KEY (`idTransakce`),
  UNIQUE KEY `idtransakce_UNIQUE` (`idTransakce`),
  KEY `zIdUctu_idx` (`zIdUctu`),
  KEY `naIdUcet_idx` (`naIdUctu`),
  CONSTRAINT `naIdUcet` FOREIGN KEY (`naIdUctu`) REFERENCES `ucty` (`idUctu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `zIdUctu` FOREIGN KEY (`zIdUctu`) REFERENCES `ucty` (`idUctu`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transakce`
--

LOCK TABLES `transakce` WRITE;
/*!40000 ALTER TABLE `transakce` DISABLE KEYS */;
INSERT INTO `transakce` VALUES (1,1,2,5000),(2,1,3,10000);
/*!40000 ALTER TABLE `transakce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ucty`
--

DROP TABLE IF EXISTS `ucty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ucty` (
  `idUctu` int(11) NOT NULL AUTO_INCREMENT,
  `IBAN` varchar(45) NOT NULL,
  `idKlienta` int(11) NOT NULL,
  `aktualniZustatek` decimal(15,0) NOT NULL,
  PRIMARY KEY (`idUctu`),
  UNIQUE KEY `iducty_UNIQUE` (`idUctu`),
  KEY `idKlienta_idx` (`idKlienta`),
  CONSTRAINT `idKlienta` FOREIGN KEY (`idKlienta`) REFERENCES `klienti` (`idKlienta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ucty`
--

LOCK TABLES `ucty` WRITE;
/*!40000 ALTER TABLE `ucty` DISABLE KEYS */;
INSERT INTO `ucty` VALUES (1,'CZ200011',1,10000),(2,'CZ200012',1,20000),(3,'CZ200013',2,35000),(4,'CZ200014',3,15000);
/*!40000 ALTER TABLE `ucty` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-03 20:22:08
