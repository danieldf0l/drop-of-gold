CREATE DATABASE  IF NOT EXISTS `adega2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `adega2`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: adega2
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `id_registro` int NOT NULL AUTO_INCREMENT,
  `fk_id_produto` int NOT NULL,
  `quantidade` int NOT NULL,
  `data_validade` varchar(10) NOT NULL,
  `numero_lote` varchar(100) NOT NULL,
  PRIMARY KEY (`id_registro`),
  KEY `fk_produto_estoque_idx` (`fk_id_produto`),
  CONSTRAINT `fk_produto_estoque` FOREIGN KEY (`fk_id_produto`) REFERENCES `produto` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,3,150,'2023-02-01','abc345'),(2,2,200,'2024-05-15','abc534'),(3,1,100,'2023-12-23','abc231'),(4,4,300,'2023-11-30','abc325'),(5,4,230,'2023-12-01','abc093'),(6,5,14,'2024-09-15','bhj234f');
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cargo` varchar(25) NOT NULL,
  `horario_entrada` time NOT NULL,
  `horario_saida` time NOT NULL,
  `nome` varchar(100) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,'Gerente','09:00:00','18:00:00','Caio'),(2,'Caixa','12:01:00','18:00:00','Ana'),(3,'Caixa','09:00:00','12:00:00','Pedro'),(4,'Atendente','12:01:00','18:00:00','Victor'),(5,'Atendente','09:00:00','12:00:00','Luiza'),(6,'caixa','09:00:00','19:00:00','Marcelo'),(7,'Faxineiro','07:00:00','17:00:00','Cleber Machado');
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `id_produto` int NOT NULL,
  `nome_produto` varchar(45) NOT NULL,
  `valor_produto` float NOT NULL,
  `tipo` enum('Destilada','Fermentada','Refrigerante','comidas') NOT NULL,
  PRIMARY KEY (`id_produto`),
  UNIQUE KEY `nome_produto_UNIQUE` (`nome_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Fanta Laranja 1L',5.5,'Refrigerante'),(2,'Tequila Gold 1L',90,'Destilada'),(3,'Coca-Cola 1L',7,'Refrigerante'),(4,'Brahma Duplo malte 600ml',8.6,'Fermentada'),(5,'Smirnoff ice 275ml',9,'Destilada');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos_venda`
--

DROP TABLE IF EXISTS `produtos_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos_venda` (
  `id_produto_venda` int NOT NULL,
  `fk_id_venda` int NOT NULL,
  `fk_id_produto` int NOT NULL,
  `quantidade` int NOT NULL,
  PRIMARY KEY (`id_produto_venda`),
  KEY `fk_venda_produtos_venda_idx` (`fk_id_venda`),
  KEY `fk_produto_produtos_venda_idx` (`fk_id_produto`),
  CONSTRAINT `fk_produto_produtos_venda` FOREIGN KEY (`fk_id_produto`) REFERENCES `produto` (`id_produto`),
  CONSTRAINT `fk_venda_produtos_venda` FOREIGN KEY (`fk_id_venda`) REFERENCES `venda` (`id_venda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos_venda`
--

LOCK TABLES `produtos_venda` WRITE;
/*!40000 ALTER TABLE `produtos_venda` DISABLE KEYS */;
INSERT INTO `produtos_venda` VALUES (1,4,2,1),(2,4,4,1),(3,2,1,1),(4,2,3,2),(5,2,5,2);
/*!40000 ALTER TABLE `produtos_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venda` (
  `id_venda` int NOT NULL AUTO_INCREMENT,
  `valor` double NOT NULL,
  `valor_final` double NOT NULL,
  `forma_pagamento` enum('Dinheiro','Pix','Crédito','Débito') NOT NULL,
  `data_venda` datetime NOT NULL,
  PRIMARY KEY (`id_venda`),
  UNIQUE KEY `id_venda` (`id_venda`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` VALUES (1,34.54,34.54,'Crédito','2023-01-11 15:34:25'),(2,51.25,37.5,'Dinheiro','2023-01-11 15:37:54'),(3,43.12,43.12,'Crédito','2023-01-11 16:12:24'),(4,98.54,98.6,'Débito','2023-01-12 16:47:14'),(5,81.35,81.35,'Pix','2023-01-12 16:34:10');
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-29 12:46:50
