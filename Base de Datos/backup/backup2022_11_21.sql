CREATE DATABASE  IF NOT EXISTS `springdb` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `springdb`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 34.27.1.147    Database: springdb
-- ------------------------------------------------------
-- Server version	8.0.26-google

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'e5c1ab56-6491-11ed-8b09-42010a800003:1-120800';

--
-- Table structure for table `area_estudio`
--

DROP TABLE IF EXISTS `area_estudio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area_estudio` (
  `area_estudio_id` bigint NOT NULL,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`area_estudio_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_estudio`
--

LOCK TABLES `area_estudio` WRITE;
/*!40000 ALTER TABLE `area_estudio` DISABLE KEYS */;
INSERT INTO `area_estudio` VALUES (21,'Ciencias y Tecnología'),(22,'Ingeniería'),(23,'Informática hardware'),(50,'Informática Software'),(51,'Sin Área de Estudio');
/*!40000 ALTER TABLE `area_estudio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area_trabajo`
--

DROP TABLE IF EXISTS `area_trabajo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area_trabajo` (
  `area_trabajo_id` bigint NOT NULL,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`area_trabajo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_trabajo`
--

LOCK TABLES `area_trabajo` WRITE;
/*!40000 ALTER TABLE `area_trabajo` DISABLE KEYS */;
INSERT INTO `area_trabajo` VALUES (16,'Tecnico'),(17,'Juridico'),(18,'Marketing y Comunicacion'),(19,'Produccion'),(20,'Tecnologías de Información');
/*!40000 ALTER TABLE `area_trabajo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capacitacion`
--

DROP TABLE IF EXISTS `capacitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `capacitacion` (
  `cap_id` bigint NOT NULL,
  `fecha_fin` datetime(6) DEFAULT NULL,
  `fecha_inicio` datetime(6) DEFAULT NULL,
  `institucion` varchar(255) DEFAULT NULL,
  `num_horas` int DEFAULT NULL,
  `tipo_capacitacion` varchar(255) DEFAULT NULL,
  `tipo_certificado` varchar(255) DEFAULT NULL,
  `area_estudio_id` bigint DEFAULT NULL,
  `estudiante_id` bigint DEFAULT NULL,
  `nombre_capacitacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cap_id`),
  KEY `FKkh0sjklvkrryx7x8mt9eoasvd` (`area_estudio_id`),
  KEY `FKfkq0nr2pvahxrai0p5prjmeof` (`estudiante_id`),
  CONSTRAINT `FKfkq0nr2pvahxrai0p5prjmeof` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`estudiante_id`),
  CONSTRAINT `FKkh0sjklvkrryx7x8mt9eoasvd` FOREIGN KEY (`area_estudio_id`) REFERENCES `area_estudio` (`area_estudio_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capacitacion`
--

LOCK TABLES `capacitacion` WRITE;
/*!40000 ALTER TABLE `capacitacion` DISABLE KEYS */;
INSERT INTO `capacitacion` VALUES (46,'2022-11-18 19:00:00.000000','2022-10-18 19:00:00.000000','SECAP',40,'seminario','Aprobacion',21,5,'programacion basica'),(47,'2022-11-18 19:00:00.000000','2022-10-18 19:00:00.000000','Tec Azuay',40,'seminario','Aprobacion',21,5,'Diseño web'),(49,'2022-11-18 19:00:00.000000','2022-10-18 19:00:00.000000','Centro de capacitacion',40,'seminario','Aprobacion',21,5,'Diseño de interfaz');
/*!40000 ALTER TABLE `capacitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudad` (
  `ciu_id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `prov_id` bigint DEFAULT NULL,
  PRIMARY KEY (`ciu_id`),
  KEY `FK2q6e7a97vnh9mkoickj2m4q48` (`prov_id`),
  CONSTRAINT `FK2q6e7a97vnh9mkoickj2m4q48` FOREIGN KEY (`prov_id`) REFERENCES `provincia` (`prov_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (1,'Cuenca',1),(2,'Paute',1),(3,'Gualaceo',1),(4,'Giron',1),(5,'Guaranda',4),(6,'Tulcán',5),(7,'Riobamba',6),(8,'Esmeraldas',9),(9,'Guayaquil',10),(10,'Ibarra',11),(11,'Loja',12),(12,'Babahoyo',13),(13,'Portoviejo',14),(14,'Quito',15);
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacto_empresa`
--

DROP TABLE IF EXISTS `contacto_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacto_empresa` (
  `cont_emp_id` bigint NOT NULL AUTO_INCREMENT,
  `cargo` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `emp_id` bigint DEFAULT NULL,
  PRIMARY KEY (`cont_emp_id`),
  KEY `FK6okyhj2edv9f27d9fuh4wewy9` (`emp_id`),
  CONSTRAINT `FK6okyhj2edv9f27d9fuh4wewy9` FOREIGN KEY (`emp_id`) REFERENCES `empresa` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacto_empresa`
--

LOCK TABLES `contacto_empresa` WRITE;
/*!40000 ALTER TABLE `contacto_empresa` DISABLE KEYS */;
INSERT INTO `contacto_empresa` VALUES (1,'string','melani56@gmail.com','string','string',1);
/*!40000 ALTER TABLE `contacto_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educacion`
--

DROP TABLE IF EXISTS `educacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `educacion` (
  `educacion_id` bigint NOT NULL AUTO_INCREMENT,
  `anio` int NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `area_estudio_id` bigint DEFAULT NULL,
  `estudiante_id` bigint DEFAULT NULL,
  `inst_id` bigint DEFAULT NULL,
  `nivel_id` bigint DEFAULT NULL,
  PRIMARY KEY (`educacion_id`),
  KEY `FK5jinyqhxdojjq8qipgvsr2crn` (`area_estudio_id`),
  KEY `FK96omg9lychcnrowgm5j2g0a9p` (`estudiante_id`),
  KEY `FK5onh5ot692ga69o7ih6xlmjcw` (`inst_id`),
  KEY `FKqb2rlghvcfsgf92rcq914nt0n` (`nivel_id`),
  CONSTRAINT `FK5jinyqhxdojjq8qipgvsr2crn` FOREIGN KEY (`area_estudio_id`) REFERENCES `area_estudio` (`area_estudio_id`),
  CONSTRAINT `FK5onh5ot692ga69o7ih6xlmjcw` FOREIGN KEY (`inst_id`) REFERENCES `institucion_educativa` (`inst_id`),
  CONSTRAINT `FK96omg9lychcnrowgm5j2g0a9p` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`estudiante_id`),
  CONSTRAINT `FKqb2rlghvcfsgf92rcq914nt0n` FOREIGN KEY (`nivel_id`) REFERENCES `nivel` (`nivel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educacion`
--

LOCK TABLES `educacion` WRITE;
/*!40000 ALTER TABLE `educacion` DISABLE KEYS */;
INSERT INTO `educacion` VALUES (1,2018,'Contador',21,14,2,32);
/*!40000 ALTER TABLE `educacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `emp_id` bigint NOT NULL AUTO_INCREMENT,
  `departamento` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `razon_social` varchar(255) DEFAULT NULL,
  `ruc` varchar(255) DEFAULT NULL,
  `sitio_web` varchar(255) DEFAULT NULL,
  `tipo_empresa` varchar(255) DEFAULT NULL,
  `ciu_id` bigint DEFAULT NULL,
  `sec_emp_id` bigint DEFAULT NULL,
  `usuario_id` bigint DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `FKeqv28h36ndej6wmlk6f17saj1` (`ciu_id`),
  KEY `FKbspcck2nq99lu52h73gx8ccdq` (`sec_emp_id`),
  KEY `FKs12udhh8f7taklesp1phv0ikg` (`usuario_id`),
  CONSTRAINT `FKbspcck2nq99lu52h73gx8ccdq` FOREIGN KEY (`sec_emp_id`) REFERENCES `sector_empresarial` (`sec_emp_id`),
  CONSTRAINT `FKeqv28h36ndej6wmlk6f17saj1` FOREIGN KEY (`ciu_id`) REFERENCES `ciudad` (`ciu_id`),
  CONSTRAINT `FKs12udhh8f7taklesp1phv0ikg` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,'cuenca','AV.Americas','Cartopel','sa','0105995377001','www.empresa.gob.ec','cartones',1,2,4),(2,'cuenca','AV.Americas','Continental','sa','0105995376001','www.empresa.gob.ec','cartones',1,2,5);
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiante` (
  `estudiante_id` bigint NOT NULL AUTO_INCREMENT,
  `apellidos` varchar(45) DEFAULT NULL,
  `cedula` varchar(10) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `estado_civil` varchar(255) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `genero` char(1) NOT NULL,
  `nombres` varchar(45) DEFAULT NULL,
  `ruta_imagen` varchar(255) DEFAULT NULL,
  `ciu_id` bigint DEFAULT NULL,
  `usuario_id` bigint DEFAULT NULL,
  PRIMARY KEY (`estudiante_id`),
  KEY `FKqfol0y9odastqfbru2w9l9hu` (`ciu_id`),
  KEY `FKs6tki8rbjso4kwof8pdlfufow` (`usuario_id`),
  CONSTRAINT `FKqfol0y9odastqfbru2w9l9hu` FOREIGN KEY (`ciu_id`) REFERENCES `ciudad` (`ciu_id`),
  CONSTRAINT `FKs6tki8rbjso4kwof8pdlfufow` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante`
--

LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
INSERT INTO `estudiante` VALUES (1,'Quix','0102928475','AV. 10','Casado','2022-11-16','M','Boris',NULL,1,1),(2,'string','019993845','string','string','2002-04-03','F','Melanie','string',1,7),(3,'string','019993846','string','string','2002-04-03','F','Melanie','string',1,2),(4,'string','019993847','string','string','2002-04-03','F','Melanie','string',1,3),(5,'quizhpe','0105995378','cuenca','Soltero','2001-07-12','M','boris',NULL,1,9),(6,'apellidouno apellidodos','0105995379','San Blas','Casado','2002-02-12','M','Gname namedos',NULL,14,10),(7,'Arroba Gmail','0105995376','San Sebastian','Casado','2001-08-09','F','Correo Temporal',NULL,1,12),(8,'quizhpe','0105995373','ciudadelacardenas','Soltero','2022-11-17','M','boris',NULL,1,9),(9,'bortes','0987654321','ciudadela','Soltero','2001-01-20','M','bortes',NULL,1,15),(10,'asd dsad','2345678901','cuenca','Soltero','2001-02-03','M','borsiesas asda',NULL,1,16),(11,'test2 test2','0192384756','cuenca','Soltero','2000-01-01','M','test2 test2',NULL,1,18),(12,'test2 test2','0192384756','cuenca','Soltero','2000-01-01','M','test2 test2',NULL,1,18),(13,'TEST3','5678901234','CAYAMBE','Soltero','2001-01-02','M','TEST3',NULL,1,19),(14,'Peralta Ochoa','0105925929','Avenida de los cerezos','Soltero','2001-10-08','M','Patricio Esteban',NULL,1,20);
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiencias`
--

DROP TABLE IF EXISTS `experiencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experiencias` (
  `experiencia_id` bigint NOT NULL AUTO_INCREMENT,
  `actividad` varchar(255) DEFAULT NULL,
  `cargo` varchar(255) DEFAULT NULL,
  `duracion` varchar(255) DEFAULT NULL,
  `institucion` varchar(255) DEFAULT NULL,
  `area_trabajo_id` bigint DEFAULT NULL,
  `estudiante_id` bigint DEFAULT NULL,
  PRIMARY KEY (`experiencia_id`),
  KEY `FK365h14f9yup2qyl2hxpb5oo9x` (`area_trabajo_id`),
  KEY `FK55mrvplvs8jocoy9c3a10qlvl` (`estudiante_id`),
  CONSTRAINT `FK365h14f9yup2qyl2hxpb5oo9x` FOREIGN KEY (`area_trabajo_id`) REFERENCES `area_trabajo` (`area_trabajo_id`),
  CONSTRAINT `FK55mrvplvs8jocoy9c3a10qlvl` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`estudiante_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiencias`
--

LOCK TABLES `experiencias` WRITE;
/*!40000 ALTER TABLE `experiencias` DISABLE KEYS */;
INSERT INTO `experiencias` VALUES (1,'limpieza','bodega','2 anios','Graiman',19,4);
/*!40000 ALTER TABLE `experiencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (52);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institucion_educativa`
--

DROP TABLE IF EXISTS `institucion_educativa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institucion_educativa` (
  `inst_id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`inst_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institucion_educativa`
--

LOCK TABLES `institucion_educativa` WRITE;
/*!40000 ALTER TABLE `institucion_educativa` DISABLE KEYS */;
INSERT INTO `institucion_educativa` VALUES (1,'SECAP'),(2,'Ministerio del Trabajo'),(3,'Tecnológico del Azuay');
/*!40000 ALTER TABLE `institucion_educativa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logro`
--

DROP TABLE IF EXISTS `logro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logro` (
  `logro_id` bigint NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `tipo_logro` varchar(100) DEFAULT NULL,
  `estudiante_id` bigint DEFAULT NULL,
  PRIMARY KEY (`logro_id`),
  KEY `FK15scaevln4xuftwci20cd23bl` (`estudiante_id`),
  CONSTRAINT `FK15scaevln4xuftwci20cd23bl` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`estudiante_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logro`
--

LOCK TABLES `logro` WRITE;
/*!40000 ALTER TABLE `logro` DISABLE KEYS */;
INSERT INTO `logro` VALUES (42,'Lider de grupos de programacion','Scrum Master',1);
/*!40000 ALTER TABLE `logro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivel`
--

DROP TABLE IF EXISTS `nivel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nivel` (
  `nivel_id` bigint NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nivel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel`
--

LOCK TABLES `nivel` WRITE;
/*!40000 ALTER TABLE `nivel` DISABLE KEYS */;
INSERT INTO `nivel` VALUES (24,'Educación Basica'),(25,'Bachillerato'),(26,'Educación Superior'),(27,'Capacitación'),(31,'Secundaria sin finalizar'),(32,'Egresado'),(33,'Estudiante Universitario'),(34,'Técnico Superior'),(35,'Tecnológico Superior'),(36,'Tercer Nivel'),(37,'Cuarto Nivel - Diplomado'),(38,'Especialidad'),(39,'Maestría'),(40,'PHD - Doctorado');
/*!40000 ALTER TABLE `nivel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofertaslaborales`
--

DROP TABLE IF EXISTS `ofertaslaborales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofertaslaborales` (
  `oferta_id` bigint NOT NULL,
  `area_conocimiento` varchar(255) DEFAULT NULL,
  `cargo` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `experiencia` varchar(255) DEFAULT NULL,
  `fecha_fin` datetime(6) DEFAULT NULL,
  `fecha_inicio` datetime(6) DEFAULT NULL,
  `jornada` varchar(255) DEFAULT NULL,
  `requisitos_academicos` varchar(255) DEFAULT NULL,
  `salario` varchar(255) DEFAULT NULL,
  `ubicacion` varchar(255) DEFAULT NULL,
  `ciu_id` bigint DEFAULT NULL,
  `emp_id` bigint DEFAULT NULL,
  PRIMARY KEY (`oferta_id`),
  KEY `FK551atgt49xfftafr6yl6t8n1n` (`ciu_id`),
  KEY `FK5r3nk98fsqulgq9qqixhwjhb3` (`emp_id`),
  CONSTRAINT `FK551atgt49xfftafr6yl6t8n1n` FOREIGN KEY (`ciu_id`) REFERENCES `ciudad` (`ciu_id`),
  CONSTRAINT `FK5r3nk98fsqulgq9qqixhwjhb3` FOREIGN KEY (`emp_id`) REFERENCES `empresa` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofertaslaborales`
--

LOCK TABLES `ofertaslaborales` WRITE;
/*!40000 ALTER TABLE `ofertaslaborales` DISABLE KEYS */;
INSERT INTO `ofertaslaborales` VALUES (28,'string','string','string','string','2022-11-17 02:03:56.782000','2022-11-17 02:03:56.782000','string','string','string','string',1,1),(29,'string','string','string','string','2022-11-17 02:03:56.782000','2022-11-17 02:03:56.782000','string','string','string','string',1,1),(30,'string','string','string','string','2022-11-17 02:03:56.782000','2022-11-17 02:03:56.782000','string','string','string','string',1,1),(44,'string','Admn','string','string','2022-11-18 20:19:51.254000','2022-11-18 20:19:51.254000','string','string','string','string',1,1),(45,'patooooooo','patooooooo','patooooooo','patooooooo','2022-11-18 20:16:18.097000','2022-11-18 20:16:18.097000','patooooooo','patooooooo','patooooooo','patooooooo',1,1);
/*!40000 ALTER TABLE `ofertaslaborales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfiles_ocupacional`
--

DROP TABLE IF EXISTS `perfiles_ocupacional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfiles_ocupacional` (
  `perfil_oc_id` bigint NOT NULL AUTO_INCREMENT,
  `actitudes` varchar(255) DEFAULT NULL,
  `destrezas` varchar(255) DEFAULT NULL,
  `habilidades` varchar(255) DEFAULT NULL,
  `estudiante_id` bigint NOT NULL,
  PRIMARY KEY (`perfil_oc_id`),
  KEY `FKq1tne268wa881umlmv6xfxpjg` (`estudiante_id`),
  CONSTRAINT `FKq1tne268wa881umlmv6xfxpjg` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`estudiante_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfiles_ocupacional`
--

LOCK TABLES `perfiles_ocupacional` WRITE;
/*!40000 ALTER TABLE `perfiles_ocupacional` DISABLE KEYS */;
INSERT INTO `perfiles_ocupacional` VALUES (1,'malo','string','string',1);
/*!40000 ALTER TABLE `perfiles_ocupacional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postulaciones`
--

DROP TABLE IF EXISTS `postulaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postulaciones` (
  `postulacion_id` bigint NOT NULL AUTO_INCREMENT,
  `estado` varchar(255) DEFAULT NULL,
  `fecha` datetime(6) DEFAULT NULL,
  `estudiante_id` bigint DEFAULT NULL,
  `oferta_id` bigint DEFAULT NULL,
  PRIMARY KEY (`postulacion_id`),
  KEY `FKocge6dd6jeieh2kaf8hmm8hh7` (`estudiante_id`),
  KEY `FKjt75c3luy3dl3g2kgo6rdll3x` (`oferta_id`),
  CONSTRAINT `FKjt75c3luy3dl3g2kgo6rdll3x` FOREIGN KEY (`oferta_id`) REFERENCES `ofertaslaborales` (`oferta_id`),
  CONSTRAINT `FKocge6dd6jeieh2kaf8hmm8hh7` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`estudiante_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postulaciones`
--

LOCK TABLES `postulaciones` WRITE;
/*!40000 ALTER TABLE `postulaciones` DISABLE KEYS */;
INSERT INTO `postulaciones` VALUES (1,'En proceso','2022-11-16 19:00:00.000000',2,30),(6,'En Proceso',NULL,2,30),(7,'En Proceso',NULL,2,44),(8,'En Proceso',NULL,2,45),(10,'En proceso','2022-11-18 17:50:39.556965',3,29),(11,'En proceso','2022-11-18 17:50:58.958403',3,30),(12,'En Proceso','2022-11-18 23:13:01.503000',7,45),(13,'En Proceso','2022-11-18 23:28:56.748000',13,44),(14,'En Proceso','2022-11-19 01:57:33.088000',13,45),(15,'En Proceso','2022-11-20 01:05:17.147000',1,45);
/*!40000 ALTER TABLE `postulaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferencia_empleos`
--

DROP TABLE IF EXISTS `preferencia_empleos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preferencia_empleos` (
  `preferencia_id` bigint NOT NULL AUTO_INCREMENT,
  `salario` double DEFAULT NULL,
  `sector_empresarial` varchar(255) DEFAULT NULL,
  `tiempo` varchar(255) DEFAULT NULL,
  `estudiante_id` bigint NOT NULL,
  PRIMARY KEY (`preferencia_id`),
  KEY `FKi00qrmd1dcyto1g7fwc3u7n56` (`estudiante_id`),
  CONSTRAINT `FKi00qrmd1dcyto1g7fwc3u7n56` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`estudiante_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferencia_empleos`
--

LOCK TABLES `preferencia_empleos` WRITE;
/*!40000 ALTER TABLE `preferencia_empleos` DISABLE KEYS */;
/*!40000 ALTER TABLE `preferencia_empleos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincia` (
  `prov_id` bigint NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `pais` varchar(50) NOT NULL,
  PRIMARY KEY (`prov_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincia`
--

LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
INSERT INTO `provincia` VALUES (1,'Azuay','Ecuador'),(3,'Cañar','Ecuador'),(4,'Bolívar','Ecuador'),(5,'Carchi','Ecuador'),(6,'Chimborazo','Ecuador'),(7,'Cotopaxio','Ecuador'),(8,'El Oro','Ecuador'),(9,'Esmeraldas','Ecuador'),(10,'Guayas','Ecuador'),(11,'Imbabura','Ecuador'),(12,'Loja','Ecuador'),(13,'Los Rios','Ecuador'),(14,'Manabí','Ecuador'),(15,'Pichincha','Ecuador');
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referencia_personal`
--

DROP TABLE IF EXISTS `referencia_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referencia_personal` (
  `referencia_id` bigint NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `estudiante_id` bigint DEFAULT NULL,
  PRIMARY KEY (`referencia_id`),
  KEY `FKia8oytapwem6i2u23g1aivbje` (`estudiante_id`),
  CONSTRAINT `FKia8oytapwem6i2u23g1aivbje` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`estudiante_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referencia_personal`
--

LOCK TABLES `referencia_personal` WRITE;
/*!40000 ALTER TABLE `referencia_personal` DISABLE KEYS */;
INSERT INTO `referencia_personal` VALUES (48,'alguien','0925345738',4);
/*!40000 ALTER TABLE `referencia_personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referencia_profesional`
--

DROP TABLE IF EXISTS `referencia_profesional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referencia_profesional` (
  `referencia_id` bigint NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `institucion` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `estudiante_id` bigint DEFAULT NULL,
  PRIMARY KEY (`referencia_id`),
  KEY `FKlufo5y62s4qkinm8rlvr9v0yy` (`estudiante_id`),
  CONSTRAINT `FKlufo5y62s4qkinm8rlvr9v0yy` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`estudiante_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referencia_profesional`
--

LOCK TABLES `referencia_profesional` WRITE;
/*!40000 ALTER TABLE `referencia_profesional` DISABLE KEYS */;
INSERT INTO `referencia_profesional` VALUES (41,'melanie@gmail.com','string','string','string',1);
/*!40000 ALTER TABLE `referencia_profesional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `rol_id` bigint NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`rol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'ESTUDIANTE','ROLE_ESTUDIANTE'),(2,'Encargados de la administracion del sistema','ROLE_ADMINISTRADOR'),(3,'Empresas asociadas que ofertan oportunidades de empleo','ROLE_EMPRESA');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sector_empresarial`
--

DROP TABLE IF EXISTS `sector_empresarial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sector_empresarial` (
  `sec_emp_id` bigint NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sec_emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sector_empresarial`
--

LOCK TABLES `sector_empresarial` WRITE;
/*!40000 ALTER TABLE `sector_empresarial` DISABLE KEYS */;
INSERT INTO `sector_empresarial` VALUES (2,'Extractivismo mineral','Extractivismo mineral');
/*!40000 ALTER TABLE `sector_empresarial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `usuario_id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `estado` bit(1) NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `rol_id` bigint DEFAULT NULL,
  PRIMARY KEY (`usuario_id`),
  KEY `FKshkwj12wg6vkm6iuwhvcfpct8` (`rol_id`),
  CONSTRAINT `FKshkwj12wg6vkm6iuwhvcfpct8` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`rol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'boxvi@gmail.com',_binary '','2022-11-16','$2a$10$9H95EtZxZa22dtNy2oAdEeEARI9Np7puETrjM0uKryr.V4Q4ooQpm','4074184','boxvi',1),(2,'correodeprueba@gmail.com',_binary '\0','2022-11-16','$2a$10$9x3ervDjKYxTXp9Kiw7oKOdVyLHe7WVoFBmUgubhPHpmXAG7njHkq','0994530353','est1',1),(3,'correodeprueba2@gmail.com',_binary '\0','2022-11-16','$2a$10$Of5j8rvC2/D/xX/gYv5AVex9npcyn0SOzRsi7uTqYcZ1FoNmYU/la','0994530353','est2',1),(4,'correodeprueba2@gmail.com',_binary '\0','2022-11-16','$2a$10$wXOykN0SuTjJQVvCQEcA4O.XPW2Jvu/fDBQ0p63U5xj8Y0IB1FDzS','0994533912','Cartopel',3),(5,'contientalcompany@gmail.com',_binary '','2022-11-16','$2a$10$AyzUuOpi8IhghNHq3mLMhutDgTWAZy9nxLXbYKwxZX.f8YIz3fjZS','0994533912','Continental',3),(6,'test@gmail.com',_binary '','2022-11-16','$2a$10$Ft0oZhSyUt8BolPH6jOXaOuqSVZV5bOdPuMv9iqq529/ARAbQKtjK','1223122','test',1),(7,'melanie@gmail.com',_binary '','2022-11-17','$2a$10$AewRwPOmWsNZhrcQ.81vsu6hgD/KmmaA2JAs/orWR78zDajy04I1i','099234323','melanie22',1),(9,'boris@gmail.com',_binary '\0','2022-11-17','$2a$10$NLtkPe0qfOyOMnVIvGpgeez0sbJUcxDzZyV7i9WzI/.asHt2drs4W','12345','boris2',1),(10,'g@gmail.com',_binary '\0','2022-11-17','$2a$10$91aR1swAOFWHftqKa8fwReNPub99tVcZ9h0MzdC91YZm5YsShMZAO','123456','genu',1),(11,'boris@gmail.com',_binary '','2022-11-17','$2a$10$Dk1CMx7mo7mU3dpF58dGW.R3S0KJkekMvAI7REwuzSUletRWjkFm6','4074183','_BORIS_',2),(12,'correotemporal@gmail.com',_binary '\0','2022-11-17','$2a$10$DYVbrNzCBMnb6JGd59yS8.KJrlszhyHoqPnefleEFucWGTsLLhd9i','4074183','temporal',1),(13,'jose2@gmail.com',_binary '\0','2022-11-17','$2a$10$gzjRMv5ehnEtAq5khhJ2Red4RcmWEOtX6Zfw9TB1YxpO2//pdnyYC','1234','joda2',1),(14,'correo@gmail.com',_binary '\0','2022-11-17','$2a$10$xOQGT1yMfDhkG4Yfd/R8uOkBTtC44BUzZaUHindstIm1JEBtSc5KW','1234','boris',1),(15,'bortes@gmail.com',_binary '\0','2022-11-17','$2a$10$IhEmbM6vhqNQv4utwdmAROhJj9NYXENSNXw5f8EK2yqY6.NpZH.6m','1234','bortes',1),(16,'bortes2@gmail.com',_binary '\0','2022-11-17','$2a$10$QNcQqOGXpYJ47cP3xFqFbeFJahJj.Xg.oFlcgWpCPjJ.j8ge7Ex8u','1234','bortes2',1),(17,'test1@gmail.com',_binary '\0','2022-11-18','$2a$10$A6oqmzcicDwRn.NweSZ3GObvfpAb9E9oiDelnnGY9NDcQjrmZ1aYq','12345678','test1',1),(18,'test2@gmail.com',_binary '\0','2022-11-18','$2a$10$m3OKLcvMbGM9mGrC4L5I3OfgKFy2HLJsE.VRLQdGAa4gGkzEVI586','12345','test2',1),(19,'TEST3@GAMIL.COM',_binary '\0','2022-11-18','$2a$10$x4cD/Z3S00phqujyWlhAy.ODfhAOLvsCyYoFIcFLR4HsSjluuA9.K','1234','TEST3',1),(20,'patricio@gmail.com',_binary '','2022-11-18','$2a$10$nvu8J3W.GofwMltq1v9a8.KEW8EyiwUf/wtwRFNL1tQ.l/ToZ3vr2','1234','pato',1),(21,'fausto@gmail.com',_binary '','2022-11-20','$2a$10$7t5ACNIXt.D1Ydk/jKxfLeLvPmx2I0lcM5woPv1rL0pTtduJ1lGIq','0992343243','fausto',1),(22,'corre@gmail.com',_binary '','2022-11-21','$2a$10$RoqMEys3uWM0lPKQZxu5Ue5V8.5LePdmZPWPrPVsm/pMHPWjpewfu','094537123','matrix',1),(23,'jimmy11@gmail.com',_binary '','2022-11-22','$2a$10$qpE..kaWfhOfjd0hh5nxLuOl49LFxVRx6medOxOFAwGLuGxd9iAxG','0993433232','jimmy',1),(24,'jimmy11@gmail.com',_binary '','2022-11-22','$2a$10$gzmGnC9KBuUKEmEaMerPr.n2ewFl4TSB9QMZoSW84OhOYAxgHV.0e','0993433232','hugo',1),(25,'marco@gmail.com',_binary '','2022-11-22','$2a$10$4sTbpl0Uk/91TuQq5khXaOHY1fdP/LsWuoRlLVHdzoiP38ub1lZb6','0992343221','marco',1),(26,'bruno55@gmail.com',_binary '','2022-11-22','$2a$10$NbFA7Hkir5MvWdQU4nV5seGKKCNv9qItMNvfDIKJ.FzufgWZhccMK','0992343232','Bruno',1),(27,'diegoriva@gmail.com',_binary '','2022-11-22','$2a$10$OIycO00TzFvFMGxjbWBQAOw0kijZT73kPY4XO86rgWJ1rkwn26EvS','099234323','Diego',1),(28,'marco@gmail.com',_binary '','2022-11-22','$2a$10$u6b80zreMpJsK9gwrGCxAOMRY59c7lsCsbYwT45KS3v/f4n92Fi2u','0992343232','admin',1),(29,'fernando@gmail.com',_binary '','2022-11-22','$2a$10$5rLZ9UpkoUpuI5HFH1pmcOZgFMU4Lqp/iBqP5EWbJfhC0tnSYKtGW','0992343232','Fernando',1),(30,'bartolo22@gmail.com',_binary '','2022-11-22','$2a$10$FH/0F1H2rOy6xkp013L52eHj0FN/vKrHZazEPoAf4uDmR1FeQA712','0992343232','Bartolo',1),(31,'corti@gmail.com',_binary '','2022-11-22','$2a$10$cphVPJZZpnlXe8dNhGZDKeBxzVwrz9DtvCDtthWx.yhDhM21t1EOm','0998433234','corti',1),(32,'soniaperez@gmail.com',_binary '','2022-11-22','$2a$10$6QOOhQqeR3D4r4piNj4SLOSLZD1pwgJ1C5Yo.Tp9cWQQTYIlNbsIO','0992343220','Sonia',1),(33,'carbono@gmail.com',_binary '','2022-11-22','$2a$10$u/CNOLQzWaq57X3Bi4U7tOb9c8oJwd7Wz2f0pLxpTKTe4hO/BMgbm','0995434332','Carbono',1),(34,'wilson33@gmail.com',_binary '','2022-11-22','$2a$10$ID/o3mrlS3CUMnNmDOzOFeBLPr/iRgKo6MWs4qVkv06NMbRV/s10O','0993433232','Wilson',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'springdb'
--

--
-- Dumping routines for database 'springdb'
--
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-21 21:27:28
