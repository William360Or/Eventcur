CREATE DATABASE  IF NOT EXISTS `evencur` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `evencur`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: evencur
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `categoria_servicio`
--

DROP TABLE IF EXISTS `categoria_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_servicio` (
  `id_categoriaServicio` int NOT NULL AUTO_INCREMENT,
  `cat_servicio` varchar(100) NOT NULL,
  PRIMARY KEY (`id_categoriaServicio`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_servicio`
--

LOCK TABLES `categoria_servicio` WRITE;
/*!40000 ALTER TABLE `categoria_servicio` DISABLE KEYS */;
INSERT INTO `categoria_servicio` VALUES (1,'Catering'),(2,'Entretenimiento'),(3,'Decoración'),(4,'Fotografia y Video'),(5,'Invitaciones y recuerdos'),(6,'Tecnologia y audiovisuales'),(7,'Logística y Organización');
/*!40000 ALTER TABLE `categoria_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `cli_nombre` varchar(45) NOT NULL,
  `cli_apellido` varchar(45) NOT NULL,
  `cli_email` varchar(256) NOT NULL,
  `cli_telefono` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentario` (
  `id_comentario` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `id_evento` int NOT NULL,
  `id_tipoEvento` int NOT NULL,
  `com_comentario` varchar(500) DEFAULT NULL,
  `com_fecha` date DEFAULT NULL,
  PRIMARY KEY (`id_comentario`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_evento` (`id_evento`),
  KEY `comentario_ibff_3_idx` (`id_tipoEvento`),
  CONSTRAINT `comentario_ibff_3` FOREIGN KEY (`id_tipoEvento`) REFERENCES `tipo_evento` (`id_tipoEvento`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `comentario_ibfk_2` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evento` (
  `id_evento` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `id_tipoEvento` int NOT NULL,
  `eve_fecha` date NOT NULL,
  `eve_hora` varchar(20) NOT NULL,
  `eve_totalinvitados` int NOT NULL,
  PRIMARY KEY (`id_evento`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_tipoEvento` (`id_tipoEvento`),
  CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `evento_ibfk_2` FOREIGN KEY (`id_tipoEvento`) REFERENCES `tipo_evento` (`id_tipoEvento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento_servicio`
--

DROP TABLE IF EXISTS `evento_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evento_servicio` (
  `id_eventoServicio` int NOT NULL AUTO_INCREMENT,
  `id_evento` int NOT NULL,
  `id_subCategoriaServicio` int NOT NULL,
  `id_opcionSubCategoria` int NOT NULL,
  `eveser_cantidad` int NOT NULL,
  `eveser_precioTotal` double NOT NULL,
  PRIMARY KEY (`id_eventoServicio`),
  KEY `id_evento` (`id_evento`),
  KEY `id_subCategoriaServicio` (`id_subCategoriaServicio`),
  KEY `id_opcionSubCategoria` (`id_opcionSubCategoria`),
  CONSTRAINT `evento_servicio_ibfk_1` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`),
  CONSTRAINT `evento_servicio_ibfk_2` FOREIGN KEY (`id_subCategoriaServicio`) REFERENCES `sub_categoria_servicio` (`id_subCategoriaServicio`),
  CONSTRAINT `evento_servicio_ibfk_3` FOREIGN KEY (`id_opcionSubCategoria`) REFERENCES `opcion_sub_categoria` (`id_opcionSubCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento_servicio`
--

LOCK TABLES `evento_servicio` WRITE;
/*!40000 ALTER TABLE `evento_servicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `evento_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcion_sub_categoria`
--

DROP TABLE IF EXISTS `opcion_sub_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opcion_sub_categoria` (
  `id_opcionSubCategoria` int NOT NULL AUTO_INCREMENT,
  `id_subCategoriaServicio` int NOT NULL,
  `id_tipoEvento` int NOT NULL,
  `opcsubcat_servicio` varchar(100) NOT NULL,
  `opcsubcat_precio` double NOT NULL,
  PRIMARY KEY (`id_opcionSubCategoria`),
  KEY `id_subCategoriaServicio` (`id_subCategoriaServicio`),
  KEY `id_tipoEvento` (`id_tipoEvento`),
  CONSTRAINT `opcion_sub_categoria_ibfk_1` FOREIGN KEY (`id_subCategoriaServicio`) REFERENCES `sub_categoria_servicio` (`id_subCategoriaServicio`),
  CONSTRAINT `opcion_sub_categoria_ibfk_2` FOREIGN KEY (`id_tipoEvento`) REFERENCES `tipo_evento` (`id_tipoEvento`)
) ENGINE=InnoDB AUTO_INCREMENT=666 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcion_sub_categoria`
--

LOCK TABLES `opcion_sub_categoria` WRITE;
/*!40000 ALTER TABLE `opcion_sub_categoria` DISABLE KEYS */;
INSERT INTO `opcion_sub_categoria` VALUES (1,1,1,'Canapés de salmón ahumado con queso',5000),(2,1,1,'Canapés de jamón serrano con melón',4000),(3,1,1,'Canapés de aguacate y camarón en tostada',4500),(4,1,1,'Tartaletas de espinaca y queso brie',5500),(5,1,1,'Mini quiches de champiñones y tocino',5000),(6,1,1,'Ensalada caprese en vaso',4000),(7,1,1,'Ensalada de quinoa con mango y almendras',5500),(8,1,1,'Ensalada griega con pepino, aceitunas y feta',6500),(9,1,1,'Brocheta de frutas con salsa de yogur',6000),(10,1,1,'Brocheta de pollo al limón',5500),(11,1,1,'Crema de espárragos con aceite de trufa',8000),(12,1,1,'Sopa de tomate rostizado con crutones de hierbas',7000),(13,1,1,'Crema de champiñones con un toque de vino blanco',7500),(14,1,1,'Empanadas argentinas de carne o pollo',5500),(15,1,1,'Tartitas de cebolla caramelizada y queso de cabra',8000),(16,1,1,'Raviolis de espinaca en salsa de mantequilla',9000),(17,1,1,'Porción de risotto de hongos',9000),(18,1,1,'Bolitas de cangrejo con salsa tártara',7000),(19,1,1,'Rollitos primavera con salsa agridulce',6000),(20,1,1,'Gyozas de cerdo',5000),(21,1,1,'Gyozas de vegetales',5000),(22,1,1,'Sushi',8500),(23,1,1,'Bruschettas de tomate, albahaca y ajo',5000),(24,1,1,'Tacos miniatura de pescado',6000),(25,1,1,'Tacos miniatura de cerdo desmenuzado',6000),(26,1,1,'Croquetas de mariscos con alioli de limón',5000),(27,1,1,'Ceviche de pescado',8000),(28,1,1,'Ceviche de camarón',9000),(29,1,1,'Panecillos calientes rellenos de queso y hierbas',5000),(30,1,1,'Mini brochetas de carne con chimichurri',4500),(31,1,3,'Mini quiches de jamón y queso',3500),(32,1,3,'Volovanes rellenos de camarones',4000),(33,1,3,'Volovanes rellenos de champiñones',3500),(34,1,3,'Crema de calabaza',5000),(35,1,3,'Crema de espárragos con un toque de almendras',6000),(36,1,3,'Brocheta de Jamón serrano con melón',4500),(37,1,3,'Brocheta Jamón serrano con piña',4000),(38,1,3,'Tarta de salmón ahumado',6000),(39,1,3,'Tarta de espinacas y queso ricota',5000),(40,1,3,'Mini tacos de pollo',4000),(41,1,3,'Guacamole con totopos individuales',4000),(42,1,3,'Croquetas de jamón',3500),(43,1,3,'Tortilla española',4000),(44,1,3,'Hamburguesitas con queso cheddar y salsa BBQ',5000),(45,1,3,'Hamburguesas de pollo',5000),(46,1,3,'Hamburguesas vegetarianas',5500),(47,1,3,'Empanaditas de carne',2500),(48,1,3,'Empanaditas de pollo',2500),(49,1,3,'Ensalada caprese en vasitos',4000),(50,1,3,'Ensalada César con trozos de pollo',5000),(51,1,3,'Rollitos de jamón con queso crema y espárragos',3500),(52,1,3,'Rollitos primavera de vegetales con salsa agridulce',4000),(53,1,3,'Ceviche de pescado',6000),(54,1,3,'Ceviche de camarón',7000),(55,1,3,'Rollos de sushi',6000),(56,1,3,'Temaki en versión mini',6000),(57,1,3,'Brochetas de frutas con chocolate',3500),(58,1,3,'Frutas con miel y yogurt griego',4000),(59,1,3,'Cubos de queso con uvas',4000),(60,1,3,'Tablitas individuales de quesos y frutos secos',6000),(61,6,1,'Dj',1500000),(62,6,1,'Banda en vivo',4000000),(63,6,1,'Grupo de Mariachis',800000),(64,6,1,'Trio de cuerdas',1500000),(65,6,1,'Banda de jazz',3000000),(66,6,1,'Orquesta para baile',6000000),(67,6,1,'Dúo de piano y voz',1800000),(68,6,3,'Dj',1500000),(69,6,3,'Banda juvenil',4000000),(70,6,3,'Grupo de vallenato',3000000),(71,6,3,'Grupo de Mariachis',8000000),(72,6,3,'Cantante solista',800000),(73,6,3,'Orquesta moderna',6000000),(74,6,3,'Banda de rock suave',4000000),(75,7,1,'Pista de baile Iluminada',1500000),(76,7,1,'Karaoke',800000),(77,7,1,'Cabina de video 360',1800000),(78,7,1,'Fuegos artificiales',2500000),(79,7,1,'Proyecciones de video',1000000),(80,7,1,'Drone con grabacion de video',1200000),(81,7,1,'Espejo magico',1500000),(82,7,1,'Show de luces led',1000000),(83,8,1,'Arco de flores para la ceremonia',600000),(84,8,1,'Caminos de flores o pétalos',300000),(85,8,1,'Globos decorativos',300000),(86,8,1,'Rustica',1200000),(87,8,1,'Elegante y clasica',2000000),(88,8,1,'Minimalista y moderna',1500000),(89,8,1,'Vintage',1500000),(90,8,1,'Tropical',1000000),(91,8,1,'Romantica',1800000),(92,9,1,'Clasica y tradicional',3500000),(93,9,1,'Artistica y creativa',5000000),(94,9,1,'Pre-boda y post-boda',3000000),(95,9,1,'Fotografia instantanea',1500000),(96,9,1,'Video HD',2500000),(97,9,1,'Videoclips mensajes en vivo',2000000),(98,9,1,'Album fotografico',800000),(99,10,1,'Invitaciones clasicas y elegantes',8000),(100,10,1,'Invitaciones creativas y modernas',10000),(101,10,1,'Invitaciones tematicas',12000),(102,10,1,'Recuerdos creativos',6000),(103,10,1,'Recuerdos comestibles',8000),(104,10,1,'Recuerdos Tematicos',10000),(105,2,1,'Medallones de res en salsa de vino tinto',50000),(106,2,1,'Filete de res con reducción de pimienta',55000),(107,2,1,'Estofado de cordero con hierbas finas',70000),(108,2,1,'Pechuga de pollo rellena de espinacas y queso',40000),(109,2,1,'Pollo al horno en salsa de mostaza y miel',45000),(110,2,1,'Pollo al curry suave con arroz basmati',50000),(111,2,1,'Salmón en salsa de maracuyá',60000),(112,2,1,'Trucha al ajillo con arroz cremoso y ensalada verde',50000),(113,2,1,'Róbalo en costra de hierbas',55000),(114,2,1,'Ratatouille acompañado de arroz con coco',35000),(115,3,1,'Tiramisú',10000),(116,3,1,'Cheesecake de frutos rojos',12000),(117,3,1,'Crème brulée',10000),(118,3,1,'Brownie con helado de vainilla',10000),(119,3,1,'Mousse de chocolate',8000),(120,3,1,'Mousse de maracuyá',8000),(121,3,1,'Pavlova de frutas frescas',12000),(122,3,1,'Mini tartaletas de limón',8000),(123,3,1,'Mini tartaletas de manzana',8000),(124,3,1,'Profiteroles con crema de vainilla',10000),(125,4,1,'Vino tinto',10000),(126,4,1,'Champaña ',12000),(127,4,1,'Mojito',15000),(128,4,1,'Margarita',15000),(129,4,1,'Piña Colada',15000),(130,4,1,'Whisky',20000),(131,4,1,'Gin tonic con frutas frescas',18000),(132,4,1,'Coctel de vino rosado con frutas',12000),(133,5,1,'Agua saborizada con frutas',5000),(134,5,1,'Limonada de coco',8000),(135,5,1,'Smoothies de frutas',10000),(136,5,1,'Jugos naturales',6000),(137,5,1,'Té frío de durazno',6000),(138,5,1,'Té frío de limón',6000),(139,5,1,'Chocolate caliente',6000),(140,5,1,'Malteadas',10000),(141,5,1,'Sodas italianas',8000),(142,2,3,'Lomo de res en salsa de champiñones',35000),(143,2,3,'Pollo relleno de espinacas y queso',25000),(144,2,3,'Pechuga de pollo en salsa de maracuyá',30000),(145,2,3,'Solomillo de cerdo en salsa de tamarindo',28000),(146,2,3,'Costillas de cerdo BBQ con ensalada fresca',35000),(147,2,3,'Lasagna de carne',20000),(148,2,3,'Ravioles de ricota',22000),(149,2,3,'Risotto de hongos y espárragos',28000),(150,2,3,'Paella vegetariana',30000),(151,2,3,'Paella mariscos',40000),(152,3,3,'Torre de cupcakes temáticos',180000),(153,3,3,'Mini cheesecakes',4500),(154,3,3,'Tarta de tres chocolates',60000),(155,3,3,'Gelatina artística de colores',20000),(156,3,3,'Bar de helados con toppings',15000),(157,3,3,'Brownies con crema batida y frutas',6000),(158,3,3,'Donas glaseadas',2500),(159,4,3,'Mojitos de sabores',8000),(160,4,3,'Margaritas de mango',12000),(161,4,3,'Margaritas de maracuyá',12000),(162,4,3,'Sangría de vino tinto con frutas frescas',15000),(163,4,3,'Coctel de champaña con frutas',18000),(164,5,3,'Mocktails de frutas tropicales',7000),(165,5,3,'Limonada de coco',6000),(166,5,3,'Limonada de hierbabuena',5000),(167,5,3,'Smoothies de fruta',8000),(168,5,3,'Agua infusionada con frutas',4000),(169,5,3,'Malteadas en mini porciones',5000),(170,7,3,'cabina de video 360',800000),(171,7,3,'show de luces LED',600000),(172,7,3,'Concursos de baile',300000),(173,7,3,'Karaoke',400000),(174,7,3,'Zona gamer',800000),(175,7,3,'Pista de baile iluminada',1000000),(176,9,3,'Clasica y tradicional',3500000),(177,9,3,'Artistica y creativa',5000000),(178,9,3,'Fotografia tematica',3000000),(179,9,3,'Fotografia instantanea',1500000),(180,9,3,'Video HD',2500000),(181,9,3,'Videoclips mensajes en vivo',2000000),(182,9,3,'Album fotografico',800000),(183,8,3,'Arco de flores',500000),(184,8,3,'Caminos de flores',200000),(185,8,3,'Globos decorativos',200000),(186,8,3,'Estilo rústico',500000),(187,8,3,'Estilo elegante',550000),(188,10,3,'Invitaciones clasicas y elegantes',8000),(189,10,3,'Invitaciones creativas y modernas',10000),(190,10,3,'Invitaciones tematicas',12000),(191,10,3,'Recuerdos creativos',6000),(192,10,3,'Recuerdos comestibles',8000),(193,10,3,'Recuerdos Tematicos',10000),(194,1,2,'Raviolis de espinaca en salsa de mantequilla',9000),(195,1,2,'Porción de risotto de hongos',9000),(196,1,2,'Bolitas de cangrejo con salsa tártara',7000),(197,1,2,'Rollitos primavera con salsa agridulce',6000),(198,1,2,'Gyozas de cerdo',5000),(199,1,2,'Gyozas de vegetales',5000),(200,1,2,'Sushi',8500),(201,1,2,'Bruschettas de tomate, albahaca y ajo',5000),(202,1,2,'Tacos miniatura de pescado',6000),(203,1,2,'Tacos miniatura de cerdo desmenuzado',6000),(204,1,2,'Croquetas de mariscos con alioli de limón',5000),(205,1,2,'Ceviche de pescado',8000),(206,1,2,'Ceviche de camarón',9000),(207,1,2,'Panecillos calientes rellenos de queso y hierbas',5000),(208,1,2,'Mini brochetas de carne con chimichurri',4500),(209,1,2,'Crema de espárragos con un toque de almendras',6000),(210,1,2,'Brocheta de Jamón serrano con melón',4500),(211,1,2,'Brocheta Jamón serrano con piña',4000),(212,1,2,'Tarta de salmón ahumado',6000),(213,1,2,'Tarta de espinacas y queso ricota',5000),(214,1,2,'Mini tacos de pollo',4000),(215,1,2,'Guacamole con totopos individuales',4000),(216,1,2,'Croquetas de jamón',3500),(217,1,2,'Tortilla española',4000),(218,1,2,'Hamburguesitas con queso cheddar y salsa BBQ',5000),(219,1,2,'Hamburguesas de pollo',5000),(220,1,2,'Hamburguesas vegetarianas',5500),(221,1,2,'Empanaditas de carne',2500),(222,1,2,'Empanaditas de pollo',2500),(223,1,2,'Ensalada caprese en vasitos',4000),(224,1,2,'Ensalada César con trozos de pollo',5000),(225,1,2,'Rollitos de jamón con queso crema y espárragos',3500),(226,1,2,'Rollitos primavera de vegetales con salsa agridulce',4000),(227,1,2,'Ceviche de pescado',6000),(228,1,2,'Ceviche de camarón',7000),(229,1,2,'Rollos de sushi',6000),(230,1,2,'Temaki en versión mini',6000),(231,2,2,'Estofado de cordero con hierbas finas',70000),(232,2,2,'Pechuga de pollo rellena de espinacas y queso',40000),(233,2,2,'Pollo al horno en salsa de mostaza y miel',45000),(234,2,2,'Pollo al curry suave con arroz basmati',50000),(235,2,2,'Salmón en salsa de maracuyá',60000),(236,2,2,'Trucha al ajillo con arroz cremoso y ensalada verde',50000),(237,2,2,'Róbalo en costra de hierbas',55000),(238,2,2,'Pollo relleno de espinacas y queso',25000),(239,2,2,'Pechuga de pollo en salsa de maracuyá',30000),(240,2,2,'Solomillo de cerdo en salsa de tamarindo',28000),(241,2,2,'Costillas de cerdo BBQ con ensalada fresca',35000),(242,2,2,'Lasagna de carne',20000),(243,2,2,'Ravioles de ricota',22000),(244,2,2,'Risotto de hongos y espárragos',28000),(245,2,2,'Paella vegetariana',30000),(246,3,2,'Mini cheesecakes',4500),(247,3,2,'Tarta de tres chocolates',60000),(248,3,2,'Gelatina artística de colores',20000),(249,3,2,'Bar de helados con toppings',15000),(250,3,2,'Brownies con crema batida y frutas',6000),(251,3,2,'Donas glaseadas',2500),(252,3,2,'Mousse de chocolate',8000),(253,3,2,'Mousse de maracuyá',8000),(254,3,2,'Pavlova de frutas frescas',12000),(255,3,2,'Mini tartaletas de limón',8000),(256,3,2,'Mini tartaletas de manzana',8000),(257,3,2,'Profiteroles con crema de vainilla',10000),(258,4,2,'Mojitos de sabores',8000),(259,4,2,'Margaritas de mango',12000),(260,4,2,'Margaritas de maracuyá',12000),(261,4,2,'Sangría de vino tinto con frutas frescas',15000),(262,4,2,'Coctel de champaña con frutas',18000),(263,4,2,'Piña Colada',15000),(264,4,2,'Whisky',20000),(265,4,2,'Gin tonic con frutas frescas',18000),(266,4,2,'Coctel de vino rosado con frutas',12000),(267,5,2,'Limonada de coco',6000),(268,5,2,'Limonada de hierbabuena',5000),(269,5,2,'Smoothies de fruta',8000),(270,5,2,'Agua infusionada con frutas',4000),(271,5,2,'Malteadas en mini porciones',5000),(272,5,2,'Jugos naturales',6000),(273,5,2,'Té frío de durazno',6000),(274,5,2,'Té frío de limón',6000),(275,5,2,'Chocolate caliente',6000),(276,5,2,'Malteadas',10000),(277,6,2,'Dj',1500000),(278,6,2,'Banda juvenil',4000000),(279,6,2,'Grupo de vallenato',3000000),(280,6,2,'Grupo de Mariachis',8000000),(281,6,2,'Cantante solista',800000),(282,6,2,'Orquesta moderna',6000000),(283,6,2,'Banda de música infantil',4000000),(284,7,2,'Pista de baile Iluminada',1500000),(285,7,2,'Karaoke',800000),(286,7,2,'cabina de video 360',1800000),(287,7,2,'fuegos artificiales',2500000),(288,7,2,'Proyecciones de video',1000000),(289,7,2,'Drone con grabacion de video',1200000),(290,7,2,'Espejo magico',1500000),(291,7,2,'Show de luces led',1000000),(292,7,2,'Juegos inflables',400000),(293,7,2,'Show de magia',500000),(294,7,2,'Talleres de pintura y manualidades',300000),(295,8,2,'Globos decorativos',200000),(296,8,2,'Decoración Elegante',300000),(297,8,2,'Decoración Vintage',500000),(298,8,2,'Decoración Temática',500000),(299,8,2,'Decoración Tropical',500000),(300,8,2,'Decoración de Superhéroes',400000),(301,8,2,'Decoración de Princesas',400000),(302,8,2,'Decoración con Temática de Circo',350000),(303,8,2,'Decoración de Animales',300000),(304,9,2,'Artistica y creativa',5000000),(305,9,2,'Clasica y tradicional',3500000),(306,9,2,'Fotografia instantanea',1500000),(307,9,2,'Video HD',2500000),(308,9,2,'Videoclips mensajes en vivo',2000000),(309,9,2,'Album fotografico',800000),(310,10,2,'Invitaciones clasicas y elegantes',8000),(311,10,2,'Invitaciones creativas y modernas',10000),(312,10,2,'Invitaciones tematicas',12000),(313,10,2,'Recuerdos creativos',6000),(314,10,2,'Recuerdos comestibles',8000),(315,10,2,'Recuerdos Tematicos',10000),(316,1,4,'Bolitas de cangrejo con salsa tártara',7000),(317,1,4,'Rollitos primavera con salsa agridulce',6000),(318,1,4,'Gyozas de cerdo',5000),(319,1,4,'Gyozas de vegetales',5000),(320,1,4,'Sushi',8500),(321,1,4,'Bruschettas de tomate, albahaca y ajo',5000),(322,1,4,'Tacos miniatura de pescado',6000),(323,1,4,'Tacos miniatura de cerdo desmenuzado',6000),(324,1,4,'Croquetas de mariscos con alioli de limón',5000),(325,1,4,'Ceviche de pescado',8000),(326,1,4,'Ceviche de camarón',9000),(327,1,4,'Panecillos calientes rellenos de queso y hierbas',5000),(328,1,4,'Mini brochetas de carne con chimichurri',4500),(329,1,4,'Crema de espárragos con un toque de almendras',6000),(330,1,4,'Brocheta de Jamón serrano con melón',4500),(331,1,4,'Brocheta Jamón serrano con piña',4000),(332,1,4,'Tarta de salmón ahumado',6000),(333,1,4,'Tarta de espinacas y queso ricota',5000),(334,1,4,'Mini tacos de pollo',4000),(335,1,4,'Guacamole con totopos individuales',4000),(336,1,4,'Croquetas de jamón',3500),(337,1,4,'Tortilla española',4000),(338,1,4,'Hamburguesitas con queso cheddar y salsa BBQ',5000),(339,1,4,'Hamburguesas de pollo',5000),(340,1,4,'Hamburguesas vegetarianas',5500),(341,1,4,'Empanaditas de carne',2500),(342,1,4,'Empanaditas de pollo',2500),(343,1,4,'Ensalada caprese en vasitos',4000),(344,1,4,'Ensalada César con trozos de pollo',5000),(345,1,4,'Rollitos de jamón con queso crema y espárragos',3500),(346,1,4,'Rollitos primavera de vegetales con salsa agridulce',4000),(347,1,4,'Ceviche de pescado',6000),(348,2,4,'Pollo al horno en salsa de mostaza y miel',45000),(349,2,4,'Pollo al curry suave con arroz basmati',50000),(350,2,4,'Salmón en salsa de maracuyá',60000),(351,2,4,'Trucha al ajillo con arroz cremoso y ensalada verde',50000),(352,2,4,'Róbalo en costra de hierbas',55000),(353,2,4,'Pollo relleno de espinacas y queso',25000),(354,2,4,'Pechuga de pollo en salsa de maracuyá',30000),(355,2,4,'Solomillo de cerdo en salsa de tamarindo',28000),(356,2,4,'Costillas de cerdo BBQ con ensalada fresca',35000),(357,2,4,'Lasagna de carne',20000),(358,2,4,'Ravioles de ricota',22000),(359,3,4,'Mini cheesecakes',4500),(360,3,4,'Tarta de tres chocolates',60000),(361,3,4,'Gelatina artística de colores',20000),(362,3,4,'Bar de helados con toppings',15000),(363,3,4,'Brownies con crema batida y frutas',6000),(364,3,4,'Donas glaseadas',2500),(365,3,4,'Mousse de chocolate',8000),(366,3,4,'Mousse de maracuyá',8000),(367,3,4,'Pavlova de frutas frescas',12000),(368,3,4,'Mini tartaletas de limón',8000),(369,3,4,'Mini tartaletas de manzana',8000),(370,3,4,'Profiteroles con crema de vainilla',10000),(371,4,4,'Mojitos de sabores',8000),(372,4,4,'Margaritas de mango',12000),(373,4,4,'Margaritas de maracuyá',12000),(374,4,4,'Sangría de vino tinto con frutas frescas',15000),(375,4,4,'Coctel de champaña con frutas',18000),(376,4,4,'Piña Colada',15000),(377,4,4,'Whisky',20000),(378,4,4,'Gin tonic con frutas frescas',18000),(379,4,4,'Coctel de vino rosado con frutas',12000),(380,6,4,'Dj',1500000),(381,6,4,'Banda juvenil',4000000),(382,6,4,'Grupo de vallenato',3000000),(383,6,4,'Grupo de Mariachis',8000000),(384,6,4,'Cantante solista',800000),(385,6,4,'Orquesta moderna',6000000),(386,6,4,'Orquesta de salsa',6000000),(387,7,4,'Pista de baile Iluminada',1500000),(388,7,4,'Karaoke',800000),(389,7,4,'cabina de video 360',1800000),(390,7,4,'fuegos artificiales',2500000),(391,7,4,'Proyecciones de video',1000000),(392,7,4,'Drone con grabacion de video',1200000),(393,5,4,'Limonada de coco',6000),(394,5,4,'Limonada de hierbabuena',5000),(395,5,4,'Smoothies de fruta',8000),(396,5,4,'Agua infusionada con frutas',4000),(397,5,4,'Malteadas en mini porciones',5000),(398,5,4,'Jugos naturales',6000),(399,5,4,'Té frío de durazno',6000),(400,5,4,'Té frío de limón',6000),(401,5,4,'Chocolate caliente',6000),(402,5,4,'Malteadas',10000),(403,8,4,'Globos decorativos',200000),(404,8,4,'Decoración Elegante',300000),(405,8,4,'Decoración Vintage',500000),(406,8,4,'Decoración Temática',500000),(407,10,4,'Invitaciones clasicas y elegantes',8000),(408,10,4,'Invitaciones creativas y modernas',10000),(409,10,4,'Invitaciones tematicas',12000),(410,10,4,'Recuerdos creativos',6000),(411,10,4,'Recuerdos comestibles',8000),(412,10,4,'Recuerdos Tematicos',10000),(413,9,4,'Clasica y tradicional',3500000),(414,9,4,'Fotografia instantanea',1500000),(415,9,4,'Video HD',2500000),(416,9,4,'Videoclips mensajes en vivo',2000000),(417,9,4,'Album fotografico',800000),(418,18,5,'Mini croissants, muffins y panes artesanales',7000),(419,18,5,'Frutas frescas en trozos o en brochetas',5000),(420,18,5,'Yogur con granola y miel',6000),(421,18,5,'Huevos revueltos o omelettes',8000),(422,18,5,'Tostadas con mantequilla y mermeladas',5000),(423,18,5,'Tocino y salchichas',7000),(424,18,5,'Pancakes con sirope de maple',8000),(425,18,5,'Smoothies de frutas',7000),(426,18,5,'Ensalada de frutas con frutos secos',8000),(427,18,5,'Pan integral con aguacate y huevo duro',5000),(428,18,5,'Avena con miel y canela',6000),(429,12,5,'Wraps de pollo o vegetales',8000),(430,12,5,'Quinoa con vegetales al vapor',10000),(431,12,5,'Salmón al horno con risotto',30000),(432,12,5,'Filete de pollo  con puré de papas y verduras',15000),(433,12,5,'Lasaña',12000),(434,12,5,'pollo teriyaki',15000),(435,12,5,'Sopa de lentejas',8000),(436,12,5,'gazpacho',10000),(437,12,5,'Curry de garbanzos con arroz basmati',12000),(438,12,5,'Pollo al curry rojo con arroz jazmín',15000),(439,12,5,'Pechuga de pollo al limón con couscous',18000),(440,19,5,'Filete mignon con puré de camote y espárragos',40000),(441,19,5,'Carnes asadas',18000),(442,19,5,'Pastas con diferentes salsas',12000),(443,19,5,'Ensaladas variadas',8000),(444,19,5,'Tacos',8000),(445,19,5,'Salmón a la plancha con salsa de limón',30000),(446,19,5,'Raviolis rellenos de espinaca y ricota',18000),(447,19,5,'Pollo relleno de queso crema y espinaca',20000),(448,19,5,'Cerdo glaseado en salsa de tamarindo',20000),(449,11,5,'Mini croissants, muffins, y galletas',10000),(450,11,5,'Frutas frescas en trozos o en brochetas',10000),(451,11,5,'Smoothies de frutas o jugos naturales',8000),(452,11,5,'Espresso, capuchino y chocolate caliente',15000),(453,11,5,'Mini tartaletas o pastelitos salados',12000),(454,11,5,'Arepitas de choclo con queso',10000),(455,11,5,'Mini buñuelos y pandebonos',10000),(456,11,5,'Mini sándwiches de salmón ahumado y queso crema',15000),(457,13,5,'Mini brownies',8000),(458,13,5,'Brochetas de frutas con cobertura de chocolate',8000),(459,13,5,'Chips de yuca o plátano con guacamole',10000),(460,13,5,'Palitos de queso',10000),(461,13,5,'Empanaditas',10000),(462,13,5,'Mini quiches de vegetales',10000),(463,13,5,'Hummus con bastones de zanahoria y apio',12000),(464,13,5,'Mini wraps',12000),(465,13,5,'Tacos',12000),(466,13,5,'Nachos con queso y pico de gallo',12000),(467,14,5,'Estacion de Aromaticas',25000),(468,14,5,'Estación de café',30000),(469,14,5,'Jugos de frutas frescas',10000),(470,14,5,'moothies combinados con yogurt o leche',10000),(471,14,5,'Limonadas',6000),(472,14,5,'Agua infusionada con frutas y hierbas',6000),(473,14,5,'Mojitos de frutas, sangría sin alcohol',12000),(474,15,5,'Proyector y pantalla',200000),(475,15,5,'Micrófonos inalámbricos',150000),(476,15,5,'Altavoces',250000),(477,15,5,'Pantallas LED grandes',800000),(478,15,5,'Sistema de sonido profesional',600000),(479,15,5,'Cámaras para transmisión en vivo',500000),(480,15,5,'Técnico de sonido o video',150000),(481,15,5,'Asistencia en montaje y desmontaje',200000),(482,15,5,'Streaming en plataformas',500000),(483,16,5,'Mesas y sillas con mantelería estándar',150000),(484,16,5,'Centros de mesa simples',200000),(485,16,5,'Ambientación general',300000),(486,16,5,'Decoración con flores frescas',500000),(487,16,5,'Arcos de globos o estructuras decorativas',200000),(488,17,5,'Coordinador del evento en sitio',400000),(489,17,5,'Transporte de materiales o equipos',300000),(490,17,5,'Personal de carga y montaje',150000),(491,17,5,'Recepcionistas o personal de registro',100000),(492,17,5,'Software para registro y credenciales',500000),(493,17,5,'Moderador o maestro de ceremonias profesional',500000),(494,18,6,'Mini croissants, muffins y panes artesanales',7000),(495,18,6,'Frutas frescas en trozos o en brochetas',6000),(496,18,6,'Yogur con granola y miel',6000),(497,18,6,'Huevos revueltos o omelettes',8000),(498,18,6,'Tostadas con mantequilla y mermeladas',6000),(499,18,6,'Tocino y salchichas',7000),(500,18,6,'Pancakes con sirope de maple',8000),(501,18,6,'Smoothies de frutas',7000),(502,18,6,'Ensalada de frutas con frutos secos',8000),(503,18,6,'Pan integral con aguacate y huevo duro',6000),(504,18,6,'Avena con miel y canela',6000),(505,12,6,'Wraps de pollo o vegetales',8000),(506,12,6,'Quinoa con vegetales al vapor',10000),(507,12,6,'Salmón al horno con risotto',30000),(508,12,6,'Filete de pollo  con puré de papas y verduras',16000),(509,12,6,'Lasaña',12000),(510,12,6,'pollo teriyaki',16000),(511,12,6,'Sopa de lentejas',8000),(512,12,6,'gazpacho',10000),(513,12,6,'Curry de garbanzos con arroz basmati',12000),(514,12,6,'Pollo al curry rojo con arroz jazmín',16000),(515,12,6,'Pechuga de pollo al limón con couscous',18000),(516,19,6,'Filete mignon con puré de camote y espárragos',40000),(517,19,6,'Carnes asadas',18000),(518,19,6,'Pastas con diferentes salsas',12000),(519,19,6,'Ensaladas variadas',8000),(520,19,6,'Tacos',8000),(521,19,6,'Salmón a la plancha con salsa de limón',30000),(522,19,6,'Raviolis rellenos de espinaca y ricota',18000),(523,19,6,'Pollo relleno de queso crema y espinaca',20000),(524,19,6,'Cerdo glaseado en salsa de tamarindo',20000),(525,11,6,'Mini croissants, muffins, y galletas',10000),(526,11,6,'Frutas frescas en trozos o en brochetas',10000),(527,11,6,'Smoothies de frutas o jugos naturales',8000),(528,11,6,'Espresso, capuchino y chocolate caliente',16000),(529,11,6,'Mini tartaletas o pastelitos salados',12000),(530,11,6,'Arepitas de choclo con queso',10000),(531,11,6,'Mini buñuelos y pandebonos',10000),(532,11,6,'Mini sándwiches de salmón ahumado y queso crema',16000),(533,13,6,'Mini brownies',8000),(534,13,6,'Brochetas de frutas con cobertura de chocolate',8000),(535,13,6,'Chips de yuca o plátano con guacamole',10000),(536,13,6,'Palitos de queso',10000),(537,13,6,'Empanaditas',10000),(538,13,6,'Mini quiches de vegetales',10000),(539,13,6,'Hummus con bastones de zanahoria y apio',12000),(540,13,6,'Mini wraps',12000),(541,13,6,'Tacos',12000),(542,13,6,'Nachos con queso y pico de gallo',12000),(543,14,6,'Estacion de Aromaticas',26000),(544,14,6,'Estación de café',30000),(545,14,6,'Jugos de frutas frescas',10000),(546,14,6,'moothies combinados con yogurt o leche',10000),(547,14,6,'Limonadas',6000),(548,14,6,'Agua infusionada con frutas y hierbas',6000),(549,14,6,'Mojitos de frutas, sangría sin alcohol',12000),(550,15,6,'Proyector y pantalla',200000),(551,15,6,'Micrófonos inalámbricos',150000),(552,15,6,'Altavoces',250000),(553,15,6,'Pantallas LED grandes',800000),(554,15,6,'Sistema de sonido profesional',600000),(555,15,6,'Cámaras para transmisión en vivo',500000),(556,15,6,'Técnico de sonido o video',150000),(557,15,6,'Asistencia en montaje y desmontaje',200000),(558,15,6,'Streaming en plataformas',500000),(559,16,6,'Mesas y sillas con mantelería estándar',150000),(560,16,6,'Centros de mesa simples',200000),(561,16,6,'Decoración con flores frescas',500000),(562,16,6,'Arcos de globos o estructuras decorativas',200000),(563,17,6,'Coordinador del evento en sitio',400000),(564,17,6,'Transporte de materiales o equipos',300000),(565,17,6,'Personal de carga y montaje',150000),(566,17,6,'Recepcionistas o personal de registro',100000),(567,17,6,'Software para registro y credenciales',500000),(568,17,6,'Moderador o maestro de ceremonias profesional',500000),(569,1,7,'Tartaletas de espinaca y queso brie',5500),(570,1,7,'Mini quiches de champiñones y tocino',5000),(571,1,7,'Ensalada caprese en vaso',4000),(572,1,7,'Ensalada de quinoa con mango y almendras',5500),(573,1,7,'Ensalada griega con pepino, aceitunas y feta',6500),(574,1,7,'Brocheta de frutas con salsa de yogur',6000),(575,1,7,'Brocheta de pollo al limón',5500),(576,1,7,'Crema de espárragos con aceite de trufa',8000),(577,1,7,'Sopa de tomate rostizado con crutones de hierbas',7000),(578,1,7,'Crema de champiñones con un toque de vino blanco',7500),(579,1,7,'Empanadas argentinas de carne o pollo',5500),(580,1,7,'Tartitas de cebolla caramelizada y queso de cabra',8000),(581,1,7,'Raviolis de espinaca en salsa de mantequilla',9000),(582,1,7,'Porción de risotto de hongos',9000),(583,1,7,'Bolitas de cangrejo con salsa tártara',7000),(584,1,7,'Rollitos primavera con salsa agridulce',6000),(585,1,7,'Gyozas de cerdo',5000),(586,1,7,'Gyozas de vegetales',5000),(587,1,7,'Sushi',8500),(588,1,7,'Bruschettas de tomate, albahaca y ajo',5000),(589,1,7,'Tacos miniatura de pescado',6000),(590,1,7,'Tacos miniatura de cerdo desmenuzado',6000),(591,1,7,'Croquetas de mariscos con alioli de limón',5000),(592,6,7,'dj',1500000),(593,6,7,'Banda en vivo',4000000),(594,6,7,'Conjunto Vallenato',800000),(595,6,7,'Trio de cuerdas',1500000),(596,6,7,'Orquesta de Salsa',3000000),(597,6,7,'Orquesta para baile',6000000),(598,6,7,'Dúo de piano y voz',1800000),(599,7,7,'Pista de baile Iluminada',1500000),(600,7,7,'Karaoke',800000),(601,7,7,'cabina de video 360',1800000),(602,7,7,'fuegos artificiales',2500000),(603,7,7,'Proyecciones de video',1000000),(604,7,7,'Drone con grabacion de video',1200000),(605,7,7,'Espejo magico',1500000),(606,7,7,'Show de luces led',1000000),(607,8,7,'Globos decorativos',300000),(608,8,7,'Navideña',1200000),(609,8,7,'Elegante y clasica',2000000),(610,8,7,'Minimalista y moderna',1500000),(611,8,7,'Vintage',1500000),(612,8,7,'Tropical',1000000),(613,9,7,'Clasica y tradicional',3500000),(614,9,7,'Artistica y creativa',5000000),(615,9,7,'Fotografia instantanea',1500000),(616,9,7,'Video HD',2500000),(617,9,7,'Album fotografico',800000),(618,10,7,'Invitaciones clasicas y elegantes',8000),(619,10,7,'Invitaciones creativas y modernas',10000),(620,10,7,'Invitaciones tematicas',12000),(621,10,7,'Recuerdos Navideños',6000),(622,10,7,'Mini muñeco de año viejo',8000),(623,10,7,'Recuerdos Tematicos',10000),(624,3,7,'Tiramisú',10000),(625,3,7,'Cheesecake de frutos rojos',12000),(626,3,7,'Crème brulée',10000),(627,3,7,'Brownie con helado de vainilla',10000),(628,3,7,'Mousse de chocolate',8000),(629,3,7,'Mousse de maracuyá',8000),(630,3,7,'Pavlova de frutas frescas',12000),(631,3,7,'Mini tartaletas de limón',8000),(632,3,7,'Mini tartaletas de manzana',8000),(633,3,7,'Profiteroles con crema de vainilla',10000),(634,4,7,'Vino tinto',10000),(635,4,7,'Champaña ',12000),(636,4,7,'Mojito',15000),(637,4,7,'Margarita',15000),(638,4,7,'Piña Colada',15000),(639,4,7,'Whisky',20000),(640,4,7,'Gin tonic con frutas frescas',18000),(641,4,7,'Coctel de vino rosado con frutas',12000),(642,5,7,'Agua saborizada con frutas',5000),(643,5,7,'Limonada de coco',8000),(644,5,7,'Smoothies de frutas',10000),(645,5,7,'Jugos naturales',6000),(646,5,7,'Té frío de durazno',6000),(647,5,7,'Té frío de limón',6000),(648,5,7,'Chocolate caliente',6000),(649,5,7,'Malteadas',10000),(650,5,7,'Sodas italianas',8000),(651,2,7,'Estofado de cordero con hierbas finas',70000),(652,2,7,'Pechuga de pollo rellena de espinacas y queso',40000),(653,2,7,'Pollo al horno en salsa de mostaza y miel',45000),(654,2,7,'Pollo al curry suave con arroz basmati',50000),(655,2,7,'Salmón en salsa de maracuyá',60000),(656,2,7,'Trucha al ajillo con arroz cremoso y ensalada verde',50000),(657,2,7,'Róbalo en costra de hierbas',55000),(658,2,7,'Pollo relleno de espinacas y queso',25000),(659,2,7,'Pechuga de pollo en salsa de maracuyá',30000),(660,2,7,'Solomillo de cerdo en salsa de tamarindo',28000),(661,2,7,'Costillas de cerdo BBQ con ensalada fresca',35000),(662,2,7,'Lasagna de carne',20000),(663,2,7,'Ravioles de ricota',22000),(664,2,7,'Risotto de hongos y espárragos',28000),(665,2,7,'Paella vegetariana',30000);
/*!40000 ALTER TABLE `opcion_sub_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_categoria_servicio`
--

DROP TABLE IF EXISTS `sub_categoria_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_categoria_servicio` (
  `id_subCategoriaServicio` int NOT NULL AUTO_INCREMENT,
  `id_categoriaServicio` int NOT NULL,
  `subcat_servicio` varchar(100) NOT NULL,
  PRIMARY KEY (`id_subCategoriaServicio`),
  KEY `id_categoriaServicio` (`id_categoriaServicio`),
  CONSTRAINT `sub_categoria_servicio_ibfk_1` FOREIGN KEY (`id_categoriaServicio`) REFERENCES `categoria_servicio` (`id_categoriaServicio`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_categoria_servicio`
--

LOCK TABLES `sub_categoria_servicio` WRITE;
/*!40000 ALTER TABLE `sub_categoria_servicio` DISABLE KEYS */;
INSERT INTO `sub_categoria_servicio` VALUES (1,1,'Entradas'),(2,1,'Plato principal'),(3,1,'Postres'),(4,1,'Bebidas con alcohol'),(5,1,'Bebidas sin alcohol'),(6,2,'Musical'),(7,2,'Interactivo'),(8,3,'Tipo de decoracion'),(9,4,'Tipo de fotografia y video'),(10,5,'Tipo de invitaciones y recuerdos'),(11,1,'Coffee break'),(12,1,'Almuerzos'),(13,1,'Snacks'),(14,1,'Estaciones de bebidas'),(15,6,'Tipo de Tecnologia audivisual'),(16,3,'Decoracion de espacios'),(17,7,'Tipo de Logistica y Organización'),(18,1,'Desayunos'),(19,1,'Cenas');
/*!40000 ALTER TABLE `sub_categoria_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_evento`
--

DROP TABLE IF EXISTS `tipo_evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_evento` (
  `id_tipoEvento` int NOT NULL AUTO_INCREMENT,
  `tip_evento` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipoEvento`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_evento`
--

LOCK TABLES `tipo_evento` WRITE;
/*!40000 ALTER TABLE `tipo_evento` DISABLE KEYS */;
INSERT INTO `tipo_evento` VALUES (1,'Matrimonio'),(2,'Cumpleaños'),(3,'Quince_años'),(4,'Grado'),(5,'Conferencias'),(6,'Reuniones_Corporativas'),(7,'Fiesta_de_fin_de_año');
/*!40000 ALTER TABLE `tipo_evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'evencur'
--

--
-- Dumping routines for database 'evencur'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-01 17:29:51
