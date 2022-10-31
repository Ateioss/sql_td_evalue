/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `collection` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `product_collection` (
  `product_id` int NOT NULL,
  `collection_id` int NOT NULL,
  KEY `product_id` (`product_id`),
  KEY `collection_id` (`collection_id`),
  CONSTRAINT `product_collection_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `product_collection_ibfk_2` FOREIGN KEY (`collection_id`) REFERENCES `collection` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `product_tag` (
  `product_id` int NOT NULL,
  `tag_id` int NOT NULL,
  KEY `product_id` (`product_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `product_tag_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `product_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `adresse1` varchar(255) NOT NULL,
  `adresse2` varchar(255) DEFAULT NULL,
  `zip` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `collection` (`id`, `title`, `description`) VALUES
(1, 'Apple', 'Apple c\'est cool');
INSERT INTO `collection` (`id`, `title`, `description`) VALUES
(2, 'iPhone', 'L\'iPhone c\'est cool. Donc on devrait l\'appeler iCool');


INSERT INTO `order` (`id`, `product_id`, `user_id`, `date`) VALUES
(1, 2, 1, '2020-09-09 20:00:00');


INSERT INTO `product` (`id`, `title`, `sku`, `description`, `price`, `quantity`) VALUES
(1, 'iPhone 14', 'iphone-14', 'Un super iphone 14', 1000.99, 100);
INSERT INTO `product` (`id`, `title`, `sku`, `description`, `price`, `quantity`) VALUES
(2, 'iPhone 14 Pro', 'iphone-14-pro', 'Un super iphone 14 pro', 1349.99, 200);
INSERT INTO `product` (`id`, `title`, `sku`, `description`, `price`, `quantity`) VALUES
(3, 'iPhone 14 Pro Max', 'iphone-14-pro-max', 'Un super iphone 14 pro', 1600, 150);

INSERT INTO `product_collection` (`product_id`, `collection_id`) VALUES
(1, 1);
INSERT INTO `product_collection` (`product_id`, `collection_id`) VALUES
(1, 2);
INSERT INTO `product_collection` (`product_id`, `collection_id`) VALUES
(2, 1);
INSERT INTO `product_collection` (`product_id`, `collection_id`) VALUES
(2, 2),
(3, 1),
(3, 2);

INSERT INTO `product_tag` (`product_id`, `tag_id`) VALUES
(1, 1);
INSERT INTO `product_tag` (`product_id`, `tag_id`) VALUES
(2, 1);
INSERT INTO `product_tag` (`product_id`, `tag_id`) VALUES
(2, 2);
INSERT INTO `product_tag` (`product_id`, `tag_id`) VALUES
(3, 1),
(3, 2),
(3, 3);

INSERT INTO `tag` (`id`, `title`) VALUES
(1, 'smartphone');
INSERT INTO `tag` (`id`, `title`) VALUES
(2, 'pro');
INSERT INTO `tag` (`id`, `title`) VALUES
(3, 'max');

INSERT INTO `user` (`id`, `firstname`, `lastname`, `adresse1`, `adresse2`, `zip`, `city`, `country`) VALUES
(1, 'Pierre', 'Grimaud', '1 rue du Paradis', 'Boite 30', '75001', 'PARIS', 'FRANCE');
INSERT INTO `user` (`id`, `firstname`, `lastname`, `adresse1`, `adresse2`, `zip`, `city`, `country`) VALUES
(2, 'John', 'Doe', '1 place de la republique', NULL, '75010', 'PARIS', 'FRANCE');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;