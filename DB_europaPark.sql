-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour europapark
CREATE DATABASE IF NOT EXISTS `europapark` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `europapark`;

-- Listage de la structure de table europapark. attraction
CREATE TABLE IF NOT EXISTS `attraction` (
  `id_attraction` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text,
  `capacity` int NOT NULL,
  `duration` int NOT NULL,
  `id_intensity` int NOT NULL,
  `id_category` int NOT NULL,
  PRIMARY KEY (`id_attraction`),
  KEY `id_intensity` (`id_intensity`),
  KEY `id_category` (`id_category`),
  CONSTRAINT `attraction_ibfk_1` FOREIGN KEY (`id_intensity`) REFERENCES `intensity` (`id_intensity`),
  CONSTRAINT `attraction_ibfk_2` FOREIGN KEY (`id_category`) REFERENCES `category` (`id_category`),
  CONSTRAINT `attraction_chk_1` CHECK ((`capacity` > 0)),
  CONSTRAINT `attraction_chk_2` CHECK ((`duration` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table europapark.attraction : ~3 rows (environ)
INSERT INTO `attraction` (`id_attraction`, `name`, `description`, `capacity`, `duration`, `id_intensity`, `id_category`) VALUES
	(1, 'Roller Coaster', 'A thrilling ride for adrenaline seekers.', 20, 5, 3, 2),
	(2, 'Ferris Wheel', 'Enjoy the view from above.', 40, 15, 1, 1),
	(3, 'Water Slide', 'A refreshing splash on a hot day.', 15, 2, 2, 3);

-- Listage de la structure de table europapark. category
CREATE TABLE IF NOT EXISTS `category` (
  `id_category` int NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id_category`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table europapark.category : ~3 rows (environ)
INSERT INTO `category` (`id_category`, `name`) VALUES
	(1, 'Family'),
	(2, 'Thrill'),
	(3, 'Water');

-- Listage de la structure de table europapark. employee
CREATE TABLE IF NOT EXISTS `employee` (
  `id_employee` int NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `id_job` int NOT NULL,
  PRIMARY KEY (`id_employee`),
  KEY `id_job` (`id_job`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`id_job`) REFERENCES `job` (`id_job`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table europapark.employee : ~3 rows (environ)
INSERT INTO `employee` (`id_employee`, `firstname`, `name`, `id_job`) VALUES
	(1, 'Brenda', 'Doe', 1),
	(2, 'Bryan', 'Bloup', 2),
	(3, 'John', 'Typo', 3);

-- Listage de la structure de table europapark. experience
CREATE TABLE IF NOT EXISTS `experience` (
  `id_experience` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `duration` int NOT NULL,
  PRIMARY KEY (`id_experience`),
  CONSTRAINT `experience_chk_1` CHECK ((`price` >= 0)),
  CONSTRAINT `experience_chk_2` CHECK ((`duration` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table europapark.experience : ~3 rows (environ)
INSERT INTO `experience` (`id_experience`, `name`, `price`, `duration`) VALUES
	(1, 'VIP Tour', 50.00, 120),
	(2, 'Fast Pass', 30.00, 1),
	(3, 'Photography Package', 15.00, 30);

-- Listage de la structure de table europapark. intensity
CREATE TABLE IF NOT EXISTS `intensity` (
  `id_intensity` int NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id_intensity`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table europapark.intensity : ~3 rows (environ)
INSERT INTO `intensity` (`id_intensity`, `name`) VALUES
	(3, 'High'),
	(1, 'Low'),
	(2, 'Medium');

-- Listage de la structure de table europapark. job
CREATE TABLE IF NOT EXISTS `job` (
  `id_job` int NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id_job`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table europapark.job : ~3 rows (environ)
INSERT INTO `job` (`id_job`, `name`) VALUES
	(3, 'Manager'),
	(1, 'Operator'),
	(2, 'Technician');

-- Listage de la structure de table europapark. package
CREATE TABLE IF NOT EXISTS `package` (
  `id_package` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id_package`),
  CONSTRAINT `package_chk_1` CHECK ((`price` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table europapark.package : ~3 rows (environ)
INSERT INTO `package` (`id_package`, `name`, `price`) VALUES
	(1, 'Family Pack', 100.00),
	(2, 'Couple Pack', 75.00),
	(3, 'Solo Pack', 50.00);

-- Listage de la structure de table europapark. reservation
CREATE TABLE IF NOT EXISTS `reservation` (
  `id_reservation` int NOT NULL,
  `reservationTime` datetime NOT NULL,
  `place` int NOT NULL,
  `id_status` int NOT NULL,
  PRIMARY KEY (`id_reservation`),
  KEY `id_status` (`id_status`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`),
  CONSTRAINT `reservation_chk_1` CHECK ((`place` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table europapark.reservation : ~3 rows (environ)
INSERT INTO `reservation` (`id_reservation`, `reservationTime`, `place`, `id_status`) VALUES
	(1, '2025-01-02 10:00:00', 2, 1),
	(2, '2025-01-03 14:30:00', 4, 2),
	(3, '2025-01-04 16:00:00', 1, 3);

-- Listage de la structure de table europapark. review
CREATE TABLE IF NOT EXISTS `review` (
  `id_review` int NOT NULL,
  `score` int NOT NULL,
  `comment` text,
  `reviewDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_attraction` int NOT NULL,
  `id_visitor` int NOT NULL,
  PRIMARY KEY (`id_review`),
  KEY `id_attraction` (`id_attraction`),
  KEY `id_visitor` (`id_visitor`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`id_attraction`) REFERENCES `attraction` (`id_attraction`),
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`id_visitor`) REFERENCES `visitor` (`id_visitor`),
  CONSTRAINT `review_chk_1` CHECK ((`score` between 1 and 5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table europapark.review : ~3 rows (environ)
INSERT INTO `review` (`id_review`, `score`, `comment`, `id_attraction`, `id_visitor`) VALUES
	(1, 5, 'Amazing experience!', 1, 1),
	(2, 3, 'Good but too crowded.', 2, 2),
	(3, 4, 'Fun and refreshing.', 3, 3);

-- Listage de la structure de table europapark. status
CREATE TABLE IF NOT EXISTS `status` (
  `id_status` int NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id_status`),
  UNIQUE KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table europapark.status : ~3 rows (environ)
INSERT INTO `status` (`id_status`, `status`) VALUES
	(3, 'Cancelled'),
	(2, 'Confirmed'),
	(1, 'Pending');

-- Listage de la structure de table europapark. visitor
CREATE TABLE IF NOT EXISTS `visitor` (
  `id_visitor` int NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_visitor`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table europapark.visitor : ~3 rows (environ)
INSERT INTO `visitor` (`id_visitor`, `firstname`, `name`, `email`, `phone`) VALUES
	(1, 'Alice', 'Smith', 'alice.smith@example.com', '1234567890'),
	(2, 'Bob', 'Johnson', 'bob.johnson@example.com', '0987654321'),
	(3, 'Charlie', 'Brown', 'charlie.brown@example.com', '1122334455');

-- Listage de la structure de table europapark. visitor_reservation
CREATE TABLE IF NOT EXISTS `visitor_reservation` (
  `id_visitor` int NOT NULL,
  `id_reservation` int NOT NULL,
  PRIMARY KEY (`id_visitor`,`id_reservation`),
  KEY `id_reservation` (`id_reservation`),
  CONSTRAINT `visitor_reservation_ibfk_1` FOREIGN KEY (`id_visitor`) REFERENCES `visitor` (`id_visitor`),
  CONSTRAINT `visitor_reservation_ibfk_2` FOREIGN KEY (`id_reservation`) REFERENCES `reservation` (`id_reservation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table europapark.visitor_reservation : ~3 rows (environ)
INSERT INTO `visitor_reservation` (`id_visitor`, `id_reservation`) VALUES
	(1, 1),
	(2, 2),
	(3, 3);

-- Listage de la structure de table europapark. work
CREATE TABLE IF NOT EXISTS `work` (
  `id_attraction` int NOT NULL,
  `id_employee` int NOT NULL,
  PRIMARY KEY (`id_attraction`,`id_employee`),
  KEY `id_employee` (`id_employee`),
  CONSTRAINT `work_ibfk_1` FOREIGN KEY (`id_attraction`) REFERENCES `attraction` (`id_attraction`),
  CONSTRAINT `work_ibfk_2` FOREIGN KEY (`id_employee`) REFERENCES `employee` (`id_employee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table europapark.work : ~3 rows (environ)
INSERT INTO `work` (`id_attraction`, `id_employee`) VALUES
	(1, 1),
	(2, 2),
	(3, 3);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
