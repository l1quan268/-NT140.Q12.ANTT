-- MySQL dump 10.13  Distrib 8.0.44, for Linux (x86_64)
--
-- Host: localhost    Database: booking_db
-- ------------------------------------------------------
-- Server version	8.0.44-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `booking_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `homestay_id` bigint NOT NULL,
  `room_type_id` bigint NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `booking_date` date NOT NULL,
  `check_in_date` date NOT NULL,
  `check_out_date` date NOT NULL,
  `adults` int NOT NULL,
  `children` int NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` enum('pending','rejected','canceled','completed') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'pending',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `payment_status` varchar(50) COLLATE utf8mb4_general_ci DEFAULT 'pending',
  `order_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `guest_email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `guest_phone` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `guest_address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_general_ci,
  `payment_method` varchar(50) COLLATE utf8mb4_general_ci DEFAULT 'COD',
  `transaction_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `paid_at` datetime DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `bookings_user_id` (`user_id`),
  KEY `bookings_homestay_id` (`homestay_id`),
  KEY `bookings_room_type_id` (`room_type_id`),
  KEY `bookings_status` (`status`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`homestay_id`) REFERENCES `homestays` (`homestay_id`) ON UPDATE CASCADE,
  CONSTRAINT `bookings_ibfk_3` FOREIGN KEY (`room_type_id`) REFERENCES `roomtypes` (`room_type_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homestays`
--

DROP TABLE IF EXISTS `homestays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `homestays` (
  `homestay_id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `thumbnail_url` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`homestay_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homestays`
--

LOCK TABLES `homestays` WRITE;
/*!40000 ALTER TABLE `homestays` DISABLE KEYS */;
INSERT INTO `homestays` VALUES (1,'Sunny Villa','Mô tả cho Sunny Villa','12 Trần Phú, Phường 1, Vũng Tàu','','2025-05-20 12:09:44'),(2,'Mountain View','Mô tả cho Mountain View','45A Hạ Long, Phường 2, Vũng Tàu','','2025-05-20 12:09:44'),(3,'Beach Paradise','Mô tả cho Beach Paradise','97 Thùy Vân, Phường Thắng Tam, Vũng Tàu','','2025-05-20 12:09:44'),(4,'Ocean Breeze','Mô tả cho Ocean Breeze','18/5 Nguyễn Bỉnh Khiêm, Phường 5, Vũng Tàu','','2025-05-20 12:09:44'),(5,'Cozy Nest','Mô tả cho Cozy Nest','22 Hoàng Hoa Thám, Phường 2, Vũng Tàu','','2025-05-20 12:09:44'),(6,'Luxury Retreat','Mô tả cho Luxury Retreat','60/7 Trần Hưng Đạo, Phường 1, Vũng Tàu','','2025-05-20 12:09:44'),(7,'Nature Haven','Mô tả cho Nature Haven','81 Võ Thị Sáu, Phường Thắng Tam, Vũng Tàu','','2025-05-20 12:09:44'),(8,'Urban Chic','Mô tả cho Urban Chic','04/3 Lê Hồng Phong, Phường 7, Vũng Tàu','','2025-05-20 12:09:44'),(9,'Sunset House','Mô tả cho Sunset House','116 Trương Công Định, Phường 2, Vũng Tàu','','2025-05-20 12:09:44'),(10,'Blue Lagoon','Mô tả cho Blue Lagoon','233A Phan Chu Trinh, Phường Thắng Tam, Vũng Tàu','','2025-05-20 12:09:44'),(11,'Tropical Stay','Mô tả cho Tropical Stay','12/9 Bình Giã, Phường Rạch Dừa, Vũng Tàu','','2025-05-20 12:09:44'),(12,'Palm Garden','Mô tả cho Palm Garden','78 Trần Phú, Phường 5, Vũng Tàu','','2025-05-20 12:09:44'),(13,'Zen Home','Mô tả cho Zen Home','101 Lê Lai, Phường 1, Vũng Tàu','','2025-05-20 12:09:44'),(14,'Villa Aurora','Mô tả cho Villa Aurora','15A Nam Kỳ Khởi Nghĩa, Phường 3, Vũng Tàu','','2025-05-20 12:09:44'),(15,'Peaceful Corner','Mô tả cho Peaceful Corner','69 Nguyễn An Ninh, Phường Thắng Tam, Vũng Tàu','','2025-05-20 12:09:44'),(16,'Lake Berkley','Mô tả cho Lake Berkley','28 Lê Lai, Phường 1, Vũng Tàu','','2025-05-20 12:09:44'),(17,'Tranquility Hut','Mô tả cho Tranquility Hut','64/3 Bình Giã, Phường Rạch Dừa, Vũng Tàu','','2025-05-20 12:09:44'),(18,'New Beautiful 7','Mô tả cho New Beautiful 7','190 Bacu, Phường 1, Vũng Tàu','','2025-05-20 12:09:44');
/*!40000 ALTER TABLE `homestays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` bigint NOT NULL AUTO_INCREMENT,
  `booking_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` enum('pending','completed','failed','refunded') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'pending',
  `transaction_id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `paid_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  UNIQUE KEY `booking_id` (`booking_id`),
  UNIQUE KEY `payments_booking_id` (`booking_id`),
  KEY `payments_user_id` (`user_id`),
  KEY `payments_transaction_id` (`transaction_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`) ON UPDATE CASCADE,
  CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `review_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `room_type_id` bigint NOT NULL,
  `rating` int NOT NULL,
  `comment` text COLLATE utf8mb4_general_ci,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_id`),
  KEY `reviews_user_id` (`user_id`),
  KEY `reviews_room_type_id` (`room_type_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`room_type_id`) REFERENCES `roomtypes` (`room_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,3,1,4,'Vị trí tuyệt vời, gần trung tâm.','2025-05-24 10:43:05'),(2,4,1,5,'Wifi mạnh, thích hợp làm việc.','2025-05-24 10:43:05'),(3,4,1,5,'Giá hợp lý, đáng tiền.','2025-05-24 10:43:05'),(4,6,1,4,'Wifi mạnh, thích hợp làm việc.','2025-05-24 10:43:05'),(5,1,1,4,'Chủ nhà thân thiện, dễ thương.','2025-05-24 10:43:05'),(6,5,2,5,'Chủ nhà thân thiện, dễ thương.','2025-05-24 10:43:05'),(7,5,2,5,'Thiết kế đẹp, hiện đại.','2025-05-24 10:43:05'),(8,2,2,4,'Thiết kế đẹp, hiện đại.','2025-05-24 10:43:05'),(9,6,3,5,'Phòng hơi nhỏ nhưng đầy đủ tiện nghi.','2025-05-24 10:43:05'),(10,3,3,5,'Giá hợp lý, đáng tiền.','2025-05-24 10:43:05'),(11,2,3,3,'Wifi mạnh, thích hợp làm việc.','2025-05-24 10:43:05'),(12,4,4,4,'Thiết kế đẹp, hiện đại.','2025-05-24 10:43:05'),(13,3,4,3,'Wifi mạnh, thích hợp làm việc.','2025-05-24 10:43:05'),(14,6,4,4,'Mình rất hài lòng, sẽ quay lại.','2025-05-24 10:43:05'),(15,4,5,3,'Wifi mạnh, thích hợp làm việc.','2025-05-24 10:43:05'),(16,5,5,5,'Chủ nhà thân thiện, dễ thương.','2025-05-24 10:43:05'),(17,5,5,3,'Phòng hơi nhỏ nhưng đầy đủ tiện nghi.','2025-05-24 10:43:05'),(18,2,5,4,'Phòng sạch sẽ và thoáng mát.','2025-05-24 10:43:05'),(19,5,5,4,'Thiết kế đẹp, hiện đại.','2025-05-24 10:43:05'),(20,5,5,5,'Thiết kế đẹp, hiện đại.','2025-05-24 10:43:05'),(21,5,6,3,'Mình rất hài lòng, sẽ quay lại.','2025-05-24 10:43:05'),(22,5,6,4,'Thiết kế đẹp, hiện đại.','2025-05-24 10:43:05'),(23,3,6,5,'Không gian yên tĩnh, thư giãn.','2025-05-24 10:43:05'),(24,6,6,4,'Mình rất hài lòng, sẽ quay lại.','2025-05-24 10:43:05'),(25,3,6,5,'Thiết kế đẹp, hiện đại.','2025-05-24 10:43:05'),(26,5,6,4,'Phòng hơi nhỏ nhưng đầy đủ tiện nghi.','2025-05-24 10:43:05'),(27,6,7,5,'Không gian yên tĩnh, thư giãn.','2025-05-24 10:43:05'),(28,4,7,4,'Vị trí tuyệt vời, gần trung tâm.','2025-05-24 10:43:05'),(29,2,8,4,'Phòng hơi cũ nhưng vẫn ổn.','2025-05-24 10:43:05'),(30,1,8,4,'Vị trí tuyệt vời, gần trung tâm.','2025-05-24 10:43:05'),(31,4,8,4,'Không gian yên tĩnh, thư giãn.','2025-05-24 10:43:05'),(32,5,8,4,'Giá hợp lý, đáng tiền.','2025-05-24 10:43:05'),(33,4,8,4,'Wifi mạnh, thích hợp làm việc.','2025-05-24 10:43:05'),(34,3,9,5,'Phòng sạch sẽ và thoáng mát.','2025-05-24 10:43:05'),(35,3,9,4,'Thiết kế đẹp, hiện đại.','2025-05-24 10:43:05'),(36,3,9,4,'Giá hợp lý, đáng tiền.','2025-05-24 10:43:05'),(37,2,9,3,'Chủ nhà thân thiện, dễ thương.','2025-05-24 10:43:05'),(38,5,9,4,'Giá hợp lý, đáng tiền.','2025-05-24 10:43:05'),(39,1,9,4,'Vị trí tuyệt vời, gần trung tâm.','2025-05-24 10:43:05'),(40,3,10,4,'Không gian yên tĩnh, thư giãn.','2025-05-24 10:43:05'),(41,3,10,4,'Phòng sạch sẽ và thoáng mát.','2025-05-24 10:43:05'),(42,5,10,4,'Vị trí tuyệt vời, gần trung tâm.','2025-05-24 10:43:05'),(43,6,11,4,'Wifi mạnh, thích hợp làm việc.','2025-05-24 10:43:05'),(44,2,11,4,'Wifi mạnh, thích hợp làm việc.','2025-05-24 10:43:05'),(45,1,11,4,'Mình rất hài lòng, sẽ quay lại.','2025-05-24 10:43:05'),(46,1,11,3,'Giá hợp lý, đáng tiền.','2025-05-24 10:43:05'),(47,2,11,4,'Phòng hơi cũ nhưng vẫn ổn.','2025-05-24 10:43:05'),(48,2,11,5,'Phòng sạch sẽ và thoáng mát.','2025-05-24 10:43:05'),(49,1,12,5,'Phòng hơi cũ nhưng vẫn ổn.','2025-05-24 10:43:05'),(50,6,12,5,'Không gian yên tĩnh, thư giãn.','2025-05-24 10:43:05'),(51,1,12,5,'Phòng hơi cũ nhưng vẫn ổn.','2025-05-24 10:43:05'),(52,4,13,4,'Mình rất hài lòng, sẽ quay lại.','2025-05-24 10:43:05'),(53,3,13,4,'Thiết kế đẹp, hiện đại.','2025-05-24 10:43:05'),(54,3,14,5,'Không gian yên tĩnh, thư giãn.','2025-05-24 10:43:05'),(55,1,14,4,'Wifi mạnh, thích hợp làm việc.','2025-05-24 10:43:05'),(56,2,14,3,'Phòng sạch sẽ và thoáng mát.','2025-05-24 10:43:05'),(57,5,14,3,'Phòng hơi nhỏ nhưng đầy đủ tiện nghi.','2025-05-24 10:43:05'),(58,3,15,5,'Thiết kế đẹp, hiện đại.','2025-05-24 10:43:05'),(59,1,15,4,'Wifi mạnh, thích hợp làm việc.','2025-05-24 10:43:05'),(60,5,15,4,'Giá hợp lý, đáng tiền.','2025-05-24 10:43:05'),(61,6,15,4,'Thiết kế đẹp, hiện đại.','2025-05-24 10:43:05'),(62,1,16,5,'Giá hợp lý, đáng tiền.','2025-05-24 10:43:05'),(63,2,16,3,'Thiết kế đẹp, hiện đại.','2025-05-24 10:43:05'),(64,1,16,5,'Chủ nhà thân thiện, dễ thương.','2025-05-24 10:43:05'),(65,1,16,4,'Phòng hơi cũ nhưng vẫn ổn.','2025-05-24 10:43:05'),(66,1,17,4,'Mình rất hài lòng, sẽ quay lại.','2025-05-24 10:43:05'),(67,3,17,4,'Chủ nhà thân thiện, dễ thương.','2025-05-24 10:43:05'),(68,4,17,5,'Phòng hơi cũ nhưng vẫn ổn.','2025-05-24 10:43:05'),(69,6,17,4,'Giá hợp lý, đáng tiền.','2025-05-24 10:43:05'),(70,4,18,5,'Phòng sạch sẽ và thoáng mát.','2025-05-24 10:43:05'),(71,3,18,5,'Phòng hơi cũ nhưng vẫn ổn.','2025-05-24 10:43:05'),(72,6,18,4,'Wifi mạnh, thích hợp làm việc.','2025-05-24 10:43:05'),(73,4,19,3,'Mình rất hài lòng, sẽ quay lại.','2025-05-24 10:43:05'),(74,5,19,4,'Mình rất hài lòng, sẽ quay lại.','2025-05-24 10:43:05'),(75,4,19,5,'Mình rất hài lòng, sẽ quay lại.','2025-05-24 10:43:05'),(76,4,20,4,'Không gian yên tĩnh, thư giãn.','2025-05-24 10:43:05'),(77,4,20,5,'Thiết kế đẹp, hiện đại.','2025-05-24 10:43:05'),(78,4,21,5,'Chủ nhà thân thiện, dễ thương.','2025-05-24 10:43:05'),(79,2,21,4,'Thiết kế đẹp, hiện đại.','2025-05-24 10:43:05'),(80,3,21,5,'Mình rất hài lòng, sẽ quay lại.','2025-05-24 10:43:05'),(81,4,21,4,'Không gian yên tĩnh, thư giãn.','2025-05-24 10:43:05'),(82,4,21,4,'Chủ nhà thân thiện, dễ thương.','2025-05-24 10:43:05');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roomtypeimages`
--

DROP TABLE IF EXISTS `roomtypeimages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roomtypeimages` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `room_type_id` bigint NOT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `alt_text` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_thumbnail` tinyint(1) NOT NULL DEFAULT '0',
  `position` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`image_id`),
  KEY `room_type_images_room_type_id` (`room_type_id`),
  CONSTRAINT `roomtypeimages_ibfk_1` FOREIGN KEY (`room_type_id`) REFERENCES `roomtypes` (`room_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomtypeimages`
--

LOCK TABLES `roomtypeimages` WRITE;
/*!40000 ALTER TABLE `roomtypeimages` DISABLE KEYS */;
INSERT INTO `roomtypeimages` VALUES (1,1,'https://i.postimg.cc/rpGRkJhr/pic1.jpg',NULL,1,NULL,'2025-05-20 12:46:45'),(2,1,'https://i.postimg.cc/HL6GTzyf/pic2.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(3,1,'https://i.postimg.cc/Kzj6jT74/pic3.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(4,1,'https://i.postimg.cc/sXLth2Km/pic4.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(5,1,'https://i.postimg.cc/L5ZGBMbp/pic5.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(6,1,'https://i.postimg.cc/W3bzPPFB/pic6.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(7,2,'https://i.postimg.cc/zDsfmD5T/pic1.jpg',NULL,1,NULL,'2025-05-20 12:46:45'),(8,2,'https://i.postimg.cc/hPVtKFP6/pic2.webp',NULL,0,NULL,'2025-05-20 12:46:45'),(9,2,'https://i.postimg.cc/k4fVV5PM/pic3.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(10,2,'https://i.postimg.cc/SRPJrtKw/pic4.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(11,2,'https://i.postimg.cc/FKnzmBy1/pic5.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(12,3,'https://i.postimg.cc/T24RVdhZ/pic1.jpg',NULL,1,NULL,'2025-05-20 12:46:45'),(13,3,'https://i.postimg.cc/QdphZcS3/pic2.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(14,3,'https://i.postimg.cc/c1fx5Hbv/pic3.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(15,3,'https://i.postimg.cc/pLtMCpv1/pic4.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(16,3,'https://i.postimg.cc/JzcV2M47/pic5.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(17,3,'https://i.postimg.cc/wM59tfmX/pic6.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(18,4,'https://i.postimg.cc/sXt3RKF3/pic1.jpg',NULL,1,NULL,'2025-05-20 12:46:45'),(19,4,'https://i.postimg.cc/0NX8VPcM/pic2.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(20,4,'https://i.postimg.cc/htScgfYQ/pic3.webp',NULL,0,NULL,'2025-05-20 12:46:45'),(21,4,'https://i.postimg.cc/ncKp6v3t/pic4.webp',NULL,0,NULL,'2025-05-20 12:46:45'),(22,4,'https://i.postimg.cc/5tfLjTQ3/pic5.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(23,5,'https://i.postimg.cc/FHs58wfj/pic1.jpg',NULL,1,NULL,'2025-05-20 12:46:45'),(24,5,'https://i.postimg.cc/sg6drKSb/pic2.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(25,5,'https://i.postimg.cc/YqxBXtSr/pic3.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(26,5,'https://i.postimg.cc/MT2TvjL8/pic4.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(27,5,'https://i.postimg.cc/HxwL5kG8/pic5.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(28,6,'https://i.postimg.cc/BvrzSzv7/pic1.jpg',NULL,1,NULL,'2025-05-20 12:46:45'),(29,6,'https://i.postimg.cc/13YTTX1Q/pic2.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(30,6,'https://i.postimg.cc/vmgjdyG6/pic3.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(31,6,'https://i.postimg.cc/2SgjKZrB/pic4.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(32,6,'https://i.postimg.cc/3wpr5xxf/pic5.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(33,7,'https://i.postimg.cc/RVgb6hFH/pic1.jpg',NULL,1,NULL,'2025-05-20 12:46:45'),(34,7,'https://i.postimg.cc/MGQsFYY7/pic2.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(35,7,'https://i.postimg.cc/RF1gMVyq/pic3.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(36,7,'https://i.postimg.cc/MGQsFYY7/pic4.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(37,7,'https://i.postimg.cc/MGkxDJm7/pic5.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(38,7,'https://i.postimg.cc/0QnsPMRn/pic6.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(39,7,'https://i.postimg.cc/50bVh5Gj/pic7.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(40,7,'https://i.postimg.cc/Rh0zFSvB/pic8.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(41,8,'https://i.postimg.cc/ZK5wSmcK/pic1.jpg',NULL,1,NULL,'2025-05-20 12:46:45'),(42,8,'https://i.postimg.cc/9fNkpdhv/pic2.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(43,8,'https://i.postimg.cc/fWK8pyYr/pic3.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(44,8,'https://i.postimg.cc/nhsTX1gy/pic4.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(45,8,'https://i.postimg.cc/jjPXXSsv/pic5.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(46,8,'https://i.postimg.cc/tTbzmGJb/pic6.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(47,8,'https://i.postimg.cc/NMxk3C2H/pic7.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(48,8,'https://i.postimg.cc/prXJRQK1/pic8.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(49,9,'https://i.postimg.cc/3JqFQvNn/pic1.jpg',NULL,1,NULL,'2025-05-20 12:46:45'),(50,9,'https://i.postimg.cc/X7qkP8jr/pic2.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(51,9,'https://i.postimg.cc/jj06LYzf/pic3.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(52,9,'https://i.postimg.cc/wjscqjsH/pic4.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(53,9,'https://i.postimg.cc/Y9t1zNDq/pic5.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(54,9,'https://i.postimg.cc/XqJdTj0R/pic6.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(55,9,'https://i.postimg.cc/rsPxTBVK/pic7.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(56,9,'https://i.postimg.cc/QMV4HFTS/pic8.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(57,9,'https://i.postimg.cc/9QLgmdrr/pic9.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(58,10,'https://i.postimg.cc/FFBLYQvK/pic1.jpg',NULL,1,NULL,'2025-05-20 12:46:45'),(59,10,'https://i.postimg.cc/PJ9p91yD/pic2.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(60,10,'https://i.postimg.cc/B6h15r1M/pic3.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(61,10,'https://i.postimg.cc/BQP1DwZB/pic4.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(62,10,'https://i.postimg.cc/qvf6GXzV/pic5.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(63,10,'https://i.postimg.cc/hPg2VymX/pic6.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(64,10,'https://i.postimg.cc/L4jyYKJd/pic7.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(65,11,'https://i.postimg.cc/wB2tHCFg/pic1.jpg',NULL,1,NULL,'2025-05-20 12:46:45'),(66,11,'https://i.postimg.cc/sX0vG5tL/pic2.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(67,11,'https://i.postimg.cc/wvB1BwbJ/pic3.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(68,11,'https://i.postimg.cc/90Rzdr2Q/pic4.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(69,11,'https://i.postimg.cc/wMCM0gxc/pic5.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(70,11,'https://i.postimg.cc/2jM1zFdb/pic6.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(71,11,'https://i.postimg.cc/CKfG3kDy/pic7.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(72,12,'https://i.postimg.cc/Ss5xxk9F/pic1.jpg',NULL,1,NULL,'2025-05-20 12:46:45'),(73,12,'https://i.postimg.cc/B6tv3XXB/pic2.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(74,12,'https://i.postimg.cc/tgBg8hCg/pic3.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(75,12,'https://i.postimg.cc/N0sMNNtV/pic4.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(76,12,'https://i.postimg.cc/zvgXL6wL/pic5.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(77,12,'https://i.postimg.cc/K4hctfQ0/pic6.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(78,12,'https://i.postimg.cc/Wph83vK9/pic7.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(79,12,'https://i.postimg.cc/y6tP3GC7/pic8.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(80,12,'https://i.postimg.cc/X75gfgnd/pic9.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(81,13,'https://i.postimg.cc/d05RsH9P/pic1.jpg',NULL,1,NULL,'2025-05-20 12:46:45'),(82,13,'https://i.postimg.cc/mgNNq2zr/pic2.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(83,13,'https://i.postimg.cc/zG1F0RfM/pic3.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(84,13,'https://i.postimg.cc/KYGrySBD/pic4.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(85,13,'https://i.postimg.cc/Y9V1gvVd/pic5.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(86,13,'https://i.postimg.cc/zB3CVCdL/pic6.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(87,13,'https://i.postimg.cc/nrDq1Hfp/pic7.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(88,13,'https://i.postimg.cc/FsFRB8pv/pic8.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(89,14,'https://i.postimg.cc/3x72g5SQ/pic1.jpg',NULL,1,NULL,'2025-05-20 12:46:45'),(90,14,'https://i.postimg.cc/wxCXjsDv/pic2.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(91,14,'https://i.postimg.cc/YqQ1Gqxx/pic3.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(92,14,'https://i.postimg.cc/05MGvCMF/pic4.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(93,14,'https://i.postimg.cc/SxrCdT32/pic5.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(94,14,'https://i.postimg.cc/KY8LH7h9/pic6.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(95,14,'https://i.postimg.cc/PqVZsLtd/pic7.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(96,14,'https://i.postimg.cc/26qWzz6h/pic8.jpg',NULL,0,NULL,'2025-05-20 12:46:45'),(97,15,'https://i.postimg.cc/jd67q3sg/pic1.jpg',NULL,1,NULL,'2025-05-20 12:46:46'),(98,15,'https://i.postimg.cc/mZH9J2KG/pic2.jpg',NULL,0,NULL,'2025-05-20 12:46:46'),(99,15,'https://i.postimg.cc/x8MbztLd/pic3.jpg',NULL,0,NULL,'2025-05-20 12:46:46'),(100,15,'https://i.postimg.cc/28NWDNfL/pic4.jpg',NULL,0,NULL,'2025-05-20 12:46:46'),(101,15,'https://i.postimg.cc/8ztfMFfL/pic5.jpg',NULL,0,NULL,'2025-05-20 12:46:46'),(102,15,'https://i.postimg.cc/bwz2Z0rz/pic6.jpg',NULL,0,NULL,'2025-05-20 12:46:46'),(103,15,'https://i.postimg.cc/ZqQ9s1cR/pic7.jpg',NULL,0,NULL,'2025-05-20 12:46:46'),(104,16,'https://i.postimg.cc/hGGnjTTf/pic2.jpg',NULL,1,NULL,'2025-05-20 12:46:46'),(105,16,'https://i.postimg.cc/SKthzRfV/pic3.jpg',NULL,0,NULL,'2025-05-20 12:46:46'),(106,16,'https://i.postimg.cc/XYL34QZR/pic4.jpg',NULL,0,NULL,'2025-05-20 12:46:46'),(107,16,'https://i.postimg.cc/3RsQnq6v/pic5.jpg',NULL,0,NULL,'2025-05-20 12:46:46'),(108,16,'https://i.postimg.cc/PfCmD7TM/pic6.jpg',NULL,0,NULL,'2025-05-20 12:46:46'),(109,17,'https://i.postimg.cc/bvLvVqH2/pic2.jpg',NULL,1,NULL,'2025-05-20 12:46:46'),(110,17,'https://i.postimg.cc/GmFtYF4K/pic3.jpg',NULL,0,NULL,'2025-05-20 12:46:46'),(111,17,'https://i.postimg.cc/TPTwcKm6/pic4.jpg',NULL,0,NULL,'2025-05-20 12:46:46'),(112,17,'https://i.postimg.cc/PxR5hK7X/pic5.jpg',NULL,0,NULL,'2025-05-20 12:46:46'),(113,17,'https://i.postimg.cc/ZnvKqpkr/pic6.jpg',NULL,0,NULL,'2025-05-20 12:46:46'),(114,18,'https://i.postimg.cc/QMgfRyH7/pic2.jpg',NULL,1,NULL,'2025-05-20 12:46:46'),(115,18,'https://i.postimg.cc/Y9pdkzWs/pic3.jpg',NULL,0,NULL,'2025-05-20 12:46:46'),(116,18,'https://i.postimg.cc/hjppGQ8P/pic4.jpg',NULL,0,NULL,'2025-05-20 12:46:46'),(117,18,'https://i.postimg.cc/x8Z5vrFw/pic5.jpg',NULL,0,NULL,'2025-05-20 12:46:46'),(118,18,'https://i.postimg.cc/HWv6D5s6/pic6.jpg',NULL,0,NULL,'2025-05-20 12:46:46'),(119,19,'https://i.postimg.cc/sX64zdyM/pic2.jpg',NULL,1,NULL,'2025-05-20 12:46:46'),(120,19,'https://i.postimg.cc/cCvM494X/pic3.jpg',NULL,0,NULL,'2025-05-20 12:46:46'),(121,19,'https://i.postimg.cc/KzvDCvXX/pic4.jpg',NULL,0,NULL,'2025-05-20 12:46:46'),(122,19,'https://i.postimg.cc/fWPfgNBF/pic5.jpg',NULL,0,NULL,'2025-05-20 12:46:46'),(123,20,'https://i.postimg.cc/Dzmqcp1F/pic2.jpg',NULL,1,NULL,'2025-05-20 12:46:46'),(124,20,'https://i.postimg.cc/FHrbYHRY/pic3.jpg',NULL,0,NULL,'2025-05-20 12:46:46'),(125,20,'https://i.postimg.cc/gkqqcZY9/pic4.jpg',NULL,0,NULL,'2025-05-20 12:46:46'),(126,20,'https://i.postimg.cc/N0VRC8xX/pic5.jpg',NULL,0,NULL,'2025-05-20 12:46:46'),(127,20,'https://i.postimg.cc/V6CnxS7V/pic6.jpg',NULL,0,NULL,'2025-05-20 12:46:46'),(128,21,'https://i.postimg.cc/XYYFV1HF/pic2.jpg',NULL,1,NULL,'2025-05-20 12:46:46'),(129,21,'https://i.postimg.cc/fTKmQQKD/pic3.jpg',NULL,0,NULL,'2025-05-20 12:46:46'),(130,21,'https://i.postimg.cc/5988pCQH/pic4.jpg',NULL,0,NULL,'2025-05-20 12:46:46'),(131,21,'https://i.postimg.cc/N0yHX9wj/pic5.jpg',NULL,0,NULL,'2025-05-20 12:46:46'),(132,21,'https://i.postimg.cc/htZmh86Y/pic6.jpg',NULL,0,NULL,'2025-05-20 12:46:46');
/*!40000 ALTER TABLE `roomtypeimages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roomtypes`
--

DROP TABLE IF EXISTS `roomtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roomtypes` (
  `room_type_id` bigint NOT NULL AUTO_INCREMENT,
  `homestay_id` bigint NOT NULL,
  `type_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  `bedroom_count` int NOT NULL,
  `toilet_count` int NOT NULL,
  `max_adults` int NOT NULL,
  `max_children` int NOT NULL,
  `max_guests` int NOT NULL,
  `min_adults` int NOT NULL DEFAULT '1',
  `price_per_night` decimal(10,2) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `slug` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`room_type_id`),
  KEY `room_types_homestay_id` (`homestay_id`),
  CONSTRAINT `roomtypes_ibfk_1` FOREIGN KEY (`homestay_id`) REFERENCES `homestays` (`homestay_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomtypes`
--

LOCK TABLES `roomtypes` WRITE;
/*!40000 ALTER TABLE `roomtypes` DISABLE KEYS */;
INSERT INTO `roomtypes` VALUES (1,1,'Sunny Villa','Sunny Villa là nhà nguyên căn với 2 phòng ngủ và 1 phòng tắm riêng biệt. Phù hợp cho nhóm lên đến 6 người (gồm 4 người lớn và 2 trẻ em). Mức giá chỉ từ 300,000 VND/đêm, rất lý tưởng cho kỳ nghỉ trọn vẹn bên gia đình hoặc bạn bè.',2,1,4,2,6,1,300000.00,'2025-05-20 12:13:54','sunny-villa'),(2,2,'Mountain View','Mountain View là nhà nguyên căn với 1 phòng ngủ và 1 phòng tắm riêng biệt. Phù hợp cho nhóm lên đến 4 người (gồm 2 người lớn và 2 trẻ em). Mức giá chỉ từ 300,000 VND/đêm, rất lý tưởng cho kỳ nghỉ trọn vẹn bên gia đình hoặc bạn bè.',1,1,2,2,4,1,300000.00,'2025-05-20 12:13:54','mountain-view'),(3,3,'Beach Paradise','Beach Paradise là nhà nguyên căn với 2 phòng ngủ và 1 phòng tắm riêng biệt. Phù hợp cho nhóm lên đến 6 người (gồm 4 người lớn và 2 trẻ em). Mức giá chỉ từ 500,000 VND/đêm, rất lý tưởng cho kỳ nghỉ trọn vẹn bên gia đình hoặc bạn bè.',2,1,4,2,6,1,500000.00,'2025-05-20 12:13:54','beach-paradise'),(4,4,'Ocean Breeze','Ocean Breeze là nhà nguyên căn với 2 phòng ngủ và 2 phòng tắm riêng biệt. Phù hợp cho nhóm lên đến 6 người (gồm 4 người lớn và 2 trẻ em). Mức giá chỉ từ 500,000 VND/đêm, rất lý tưởng cho kỳ nghỉ trọn vẹn bên gia đình hoặc bạn bè.',2,1,4,2,6,1,500000.00,'2025-05-20 12:13:54','ocean-breeze'),(5,5,'Cozy Nest','Cozy Nest là nhà nguyên căn với 1 phòng ngủ và 1 phòng tắm riêng biệt. Phù hợp cho nhóm lên đến 4 người (gồm 2 người lớn và 2 trẻ em). Mức giá chỉ từ 300,000 VND/đêm, rất lý tưởng cho kỳ nghỉ trọn vẹn bên gia đình hoặc bạn bè.',1,1,2,2,4,1,300000.00,'2025-05-20 12:13:54','cozy-nest'),(6,6,'Luxury Retreat','Luxury Retreat là nhà nguyên căn với 2 phòng ngủ và 2 phòng tắm riêng biệt. Phù hợp cho nhóm lên đến 8 người (gồm 6 người lớn và 3 trẻ em). Mức giá chỉ từ 1,200,000 VND/đêm, rất lý tưởng cho kỳ nghỉ trọn vẹn bên gia đình hoặc bạn bè.',1,1,2,2,4,1,300000.00,'2025-05-20 12:13:54','luxury-retreat'),(7,7,'Nature Haven','Nature Haven là nhà nguyên căn với 2 phòng ngủ và 2 phòng tắm riêng biệt. Phù hợp cho nhóm lên đến 8 người (gồm 6 người lớn và 3 trẻ em). Mức giá chỉ từ 1,200,000 VND/đêm, rất lý tưởng cho kỳ nghỉ trọn vẹn bên gia đình hoặc bạn bè.',2,2,6,3,8,2,1200000.00,'2025-05-20 12:13:54','nature-haven'),(8,8,'Urban Chic','Urban Chic là nhà nguyên căn với 3 phòng ngủ và 2 phòng tắm riêng biệt. Phù hợp cho nhóm lên đến 10 người (gồm 6 người lớn và 3 trẻ em). Mức giá chỉ từ 1,200,000 VND/đêm, rất lý tưởng cho kỳ nghỉ trọn vẹn bên gia đình hoặc bạn bè.',2,2,6,3,8,2,1200000.00,'2025-05-20 12:13:54','urban-chic'),(9,9,'Sunset House','Sunset House là nhà nguyên căn với 3 phòng ngủ và 2 phòng tắm riêng biệt. Phù hợp cho nhóm lên đến 10 người (gồm 6 người lớn và 3 trẻ em). Mức giá chỉ từ 1,200,000 VND/đêm, rất lý tưởng cho kỳ nghỉ trọn vẹn bên gia đình hoặc bạn bè.',3,3,9,3,10,4,1200000.00,'2025-05-20 12:13:54','sunset-house'),(10,10,'Blue Lagoon','Blue Lagoon là nhà nguyên căn với 2 phòng ngủ và 1 phòng tắm riêng biệt. Phù hợp cho nhóm lên đến 6 người (gồm 4 người lớn và 2 trẻ em). Mức giá chỉ từ 500,000 VND/đêm, rất lý tưởng cho kỳ nghỉ trọn vẹn bên gia đình hoặc bạn bè.',2,2,4,2,6,1,800000.00,'2025-05-20 12:13:54','blue-lagoon'),(11,11,'Tropical Stay','Tropical Stay là nhà nguyên căn với 2 phòng ngủ và 1 phòng tắm riêng biệt. Phù hợp cho nhóm lên đến 6 người (gồm 4 người lớn và 2 trẻ em). Mức giá chỉ từ 500,000 VND/đêm, rất lý tưởng cho kỳ nghỉ trọn vẹn bên gia đình hoặc bạn bè.',2,2,4,2,6,1,500000.00,'2025-05-20 12:13:54','tropical-stay'),(12,12,'Palm Garden','Tropical Stay là nhà nguyên căn với 2 phòng ngủ và 1 phòng tắm riêng biệt. Phù hợp cho nhóm lên đến 6 người (gồm 4 người lớn và 2 trẻ em). Mức giá chỉ từ 500,000 VND/đêm, rất lý tưởng cho kỳ nghỉ trọn vẹn bên gia đình hoặc bạn bè.',2,2,4,2,6,1,800000.00,'2025-05-20 12:13:54','palm-garden'),(13,13,'Zen Home','Zen Home là nhà nguyên căn với 1 phòng ngủ và 1 phòng tắm riêng biệt. Phù hợp cho nhóm lên đến 3 người (gồm 2 người lớn và 1 trẻ em). Mức giá chỉ từ 300,000 VND/đêm, rất lý tưởng cho kỳ nghỉ trọn vẹn bên gia đình hoặc bạn bè.',1,1,2,2,4,1,300000.00,'2025-05-20 12:13:54','zen-home'),(14,14,'Villa Aurora','Villa Aurora là nhà nguyên căn với 2 phòng ngủ và 1 phòng tắm riêng biệt. Phù hợp cho nhóm lên đến 6 người (gồm 4 người lớn và 2 trẻ em). Mức giá chỉ từ 800,000 VND/đêm, rất lý tưởng cho kỳ nghỉ trọn vẹn bên gia đình hoặc bạn bè.',2,2,4,2,6,1,800000.00,'2025-05-20 12:13:54','villa-aurora'),(15,15,'Peaceful Corner','Peaceful Corner là nhà nguyên căn với 1 phòng ngủ và 1 phòng tắm riêng biệt. Phù hợp cho nhóm lên đến 3 người (gồm 2 người lớn và 1 trẻ em). Mức giá chỉ từ 300,000 VND/đêm, rất lý tưởng cho kỳ nghỉ trọn vẹn bên gia đình hoặc bạn bè.',1,1,2,1,4,1,300000.00,'2025-05-20 12:13:54','peaceful-corner'),(16,16,'Lake Berkley','Phòng riêng trong căn hộ Lake Berkley hiện đại, gồm 1 phòng ngủ và 1 phòng tắm. Phòng có sức chứa tối đa 3 người, phù hợp cho 2 người lớn và 1 trẻ em. Giá thuê mỗi đêm chỉ từ 300,000 VND – lựa chọn tuyệt vời cho chuyến đi tiết kiệm và tiện nghi.',2,1,4,2,6,1,800000.00,'2025-05-20 12:13:54','lake-berkley'),(17,16,'Lake Berkley','Phòng riêng trong căn hộ Lake Berkley hiện đại, gồm 2 phòng ngủ và 1 phòng tắm. Phòng có sức chứa tối đa 5 người, phù hợp cho 4 người lớn và 1 trẻ em. Giá thuê mỗi đêm chỉ từ 300,000 VND – lựa chọn tuyệt vời cho chuyến đi tiết kiệm và tiện nghi.',1,1,2,1,4,1,300000.00,'2025-05-20 12:13:54','lake-berkley'),(18,17,'Tranquility Hut','Phòng riêng trong căn hộ Tranquility Hut hiện đại, gồm 1 phòng ngủ và 1 phòng tắm. Phòng có sức chứa tối đa 3 người, phù hợp cho 2 người lớn và 1 trẻ em. Giá thuê mỗi đêm chỉ từ 800,000 VND – lựa chọn tuyệt vời cho chuyến đi tiết kiệm và tiện nghi.',1,1,2,1,4,1,300000.00,'2025-05-20 12:13:54','tranquility-hut'),(19,17,'Tranquility Hut','Phòng riêng trong căn hộ Tranquility Hut hiện đại, gồm 2 phòng ngủ và 1 phòng tắm. Phòng có sức chứa tối đa 5 người, phù hợp cho 4 người lớn và 1 trẻ em. Giá thuê mỗi đêm chỉ từ 800,000 VND – lựa chọn tuyệt vời cho chuyến đi tiết kiệm và tiện nghi.',2,1,4,2,6,1,800000.00,'2025-05-20 12:13:54','tranquility-hut'),(20,18,'New Beautiful 7','Phòng riêng trong căn hộ New Beautiful 7 hiện đại, gồm 1 phòng ngủ và 1 phòng tắm. Phòng có sức chứa tối đa 4 người, phù hợp cho 2 người lớn và 1 trẻ em. Giá thuê mỗi đêm chỉ từ 300,000 VND – lựa chọn tuyệt vời cho chuyến đi tiết kiệm và tiện nghi.',1,1,2,1,4,1,300000.00,'2025-05-20 12:13:54','new-beautiful-7'),(21,18,'New Beautiful 7','Phòng riêng trong căn hộ New Beautiful 7 hiện đại, gồm 2 phòng ngủ và 1 phòng tắm. Phòng có sức chứa tối đa 4 người, phù hợp cho 4 người lớn và 1 trẻ em. Giá thuê mỗi đêm chỉ từ 300,000 VND – lựa chọn tuyệt vời cho chuyến đi tiết kiệm và tiện nghi.',1,1,2,1,4,1,300000.00,'2025-05-20 12:13:54','new-beautiful-7');
/*!40000 ALTER TABLE `roomtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roomtypeservices`
--

DROP TABLE IF EXISTS `roomtypeservices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roomtypeservices` (
  `room_type_id` bigint NOT NULL,
  `service_id` bigint NOT NULL,
  PRIMARY KEY (`room_type_id`,`service_id`),
  KEY `room_type_services_service_id` (`service_id`),
  CONSTRAINT `roomtypeservices_ibfk_1` FOREIGN KEY (`room_type_id`) REFERENCES `roomtypes` (`room_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roomtypeservices_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomtypeservices`
--

LOCK TABLES `roomtypeservices` WRITE;
/*!40000 ALTER TABLE `roomtypeservices` DISABLE KEYS */;
INSERT INTO `roomtypeservices` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(21,1),(1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2),(8,2),(9,2),(10,2),(11,2),(12,2),(13,2),(14,2),(15,2),(16,2),(18,2),(20,2),(21,2),(2,3),(3,3),(6,3),(10,3),(14,3),(18,3),(21,3),(3,4),(8,4),(12,4),(17,4),(19,4),(2,5),(3,5),(5,5),(9,5),(13,5),(16,5),(20,5),(1,6),(5,6),(7,6),(9,6),(11,6),(13,6),(15,6),(17,6),(6,7),(10,7),(14,7),(18,7),(20,8),(7,9),(11,9),(15,9),(21,9),(8,10),(12,10),(18,10);
/*!40000 ALTER TABLE `roomtypeservices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequelizemeta`
--

DROP TABLE IF EXISTS `sequelizemeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequelizemeta`
--

LOCK TABLES `sequelizemeta` WRITE;
/*!40000 ALTER TABLE `sequelizemeta` DISABLE KEYS */;
INSERT INTO `sequelizemeta` VALUES ('20250412093404-create-user.js'),('migration-create-booking.js'),('migration-create-homestay.js'),('migration-create-payment.js'),('migration-create-review.js'),('migration-create-roomtype.js'),('migration-create-roomtypeimages.js'),('migration-create-roomtypeservice.js'),('migration-create-service.js');
/*!40000 ALTER TABLE `sequelizemeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `service_id` bigint NOT NULL AUTO_INCREMENT,
  `service_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Wi-Fi miễn phí'),(2,'Điều hòa'),(3,'Hồ bơi'),(4,'Bãi đỗ xe'),(5,'Bữa sáng miễn phí'),(6,'TV màn hình phẳng'),(7,'Máy nước nóng'),(8,'Giặt ủi'),(9,'Phòng Gym'),(10,'Dịch vụ đưa đón sân bay');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `role` enum('user','admin') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'user',
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reset_token_hash` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reset_token_expires_at` datetime DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gender` enum('male','female') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dob` date DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `users_email` (`email`),
  KEY `users_phone` (`phone`),
  KEY `reset_token_hash` (`reset_token_hash`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','admin@sweethome.com','$2b$10$yuix4hmthjI8lkJUoiTg5uFS3zuIHolbjUi0Z.frml/SLwYfGfE5i',NULL,NULL,'','male','2025-04-23 16:15:12','2025-11-21 09:21:58',NULL),(2,'user','Tèo Em','eteo784@gmail.com','$2b$10$0o99tAayphj15oYhdE36fOKlVwNsdtyaq1NgGRGJFo6mMZZdacq.G',NULL,NULL,NULL,'male','2025-04-23 16:16:36','2025-11-21 09:22:07',NULL),(3,'user','Tài Nguyễn','ngtai2004vl@gmail.com','$2b$10$0o99tAayphj15oYhdE36fOKlVwNsdtyaq1NgGRGJFo6mMZZdacq.G',NULL,NULL,NULL,'male','2025-04-23 16:21:10','2025-11-21 09:22:07',NULL),(4,'user','xinchao','xinchao@gm','$2b$10$0o99tAayphj15oYhdE36fOKlVwNsdtyaq1NgGRGJFo6mMZZdacq.G','69cab2ea7e7f7f6c4e5ba2b2879cea2a796bbc1d1ac7905eec831b8531b70537','2025-04-24 01:50:40','','male','2025-04-23 17:24:29','2025-11-21 09:22:07',NULL),(5,'user','minhquan','23521265@gm.uit.edu.vn','$2b$10$0o99tAayphj15oYhdE36fOKlVwNsdtyaq1NgGRGJFo6mMZZdacq.G',NULL,NULL,'','male','2025-04-24 00:51:25','2025-11-21 09:22:07',NULL),(6,'user','Sang','SantrongSang@gm','$2b$10$0o99tAayphj15oYhdE36fOKlVwNsdtyaq1NgGRGJFo6mMZZdacq.G',NULL,NULL,'','male','2025-04-28 04:10:42','2025-11-21 09:22:07',NULL);
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

-- Dump completed on 2025-11-21 10:16:40
