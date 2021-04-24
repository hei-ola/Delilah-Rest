/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `orderdts`;
CREATE TABLE `orderdts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(11) DEFAULT NULL,
  `quantity_orders` int(11) DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pedido` (`id_pedido`),
  KEY `productId` (`productId`),
  CONSTRAINT `orderdts_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orderdts_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` decimal(10,0) DEFAULT NULL,
  `formpag` varchar(60) DEFAULT NULL,
  `estado` varchar(60) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picture` varchar(60) DEFAULT NULL,
  `title` varchar(60) NOT NULL,
  `cost` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `rols`;
CREATE TABLE `rols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rols` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `lastname` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `phone` int(11) NOT NULL,
  `adress` varchar(60) NOT NULL,
  `rol` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

INSERT INTO `orderdts` (`id`, `id_pedido`, `quantity_orders`, `total`, `productId`) VALUES
(1, 1, 1, 1000, 3);
INSERT INTO `orderdts` (`id`, `id_pedido`, `quantity_orders`, `total`, `productId`) VALUES
(2, 1, 1, 1000, 3);
INSERT INTO `orderdts` (`id`, `id_pedido`, `quantity_orders`, `total`, `productId`) VALUES
(3, 2, 1, 500, 2);
INSERT INTO `orderdts` (`id`, `id_pedido`, `quantity_orders`, `total`, `productId`) VALUES
(4, 2, 1, 5000, 4),
(5, 3, 1, 2000, 1),
(6, 3, 1, 2000, 1),
(7, 4, 1, 5000, 4),
(8, 4, 1, 1000, 3),
(9, 5, 1, 5000, 4),
(10, 5, 1, 1000, 3),
(11, 5, 5, 2000, 1),
(12, 5, 8, 500, 2);

INSERT INTO `orders` (`id`, `total`, `formpag`, `estado`, `userId`) VALUES
(1, 2000, 'efectivo', 'nuevo', 2);
INSERT INTO `orders` (`id`, `total`, `formpag`, `estado`, `userId`) VALUES
(2, 5500, 'efectivo', 'nuevo', 2);
INSERT INTO `orders` (`id`, `total`, `formpag`, `estado`, `userId`) VALUES
(3, 4000, 'efectivo', 'nuevo', 4);
INSERT INTO `orders` (`id`, `total`, `formpag`, `estado`, `userId`) VALUES
(4, 6000, 'efectivo', 'nuevo', 4),
(5, 8500, 'efectivo', 'nuevo', 2);

INSERT INTO `products` (`id`, `picture`, `title`, `cost`) VALUES
(1, 'www.imagen.com', 'arepita', 2000);
INSERT INTO `products` (`id`, `picture`, `title`, `cost`) VALUES
(2, 'www.imagen.com', 'buñuelo', 500);
INSERT INTO `products` (`id`, `picture`, `title`, `cost`) VALUES
(3, 'www.imagen.com', 'empanada', 1000);
INSERT INTO `products` (`id`, `picture`, `title`, `cost`) VALUES
(4, 'www.imagen.com', 'patacon', 5000);

INSERT INTO `rols` (`id`, `rols`) VALUES
(1, 'ADMIN');
INSERT INTO `rols` (`id`, `rols`) VALUES
(2, 'USER');


INSERT INTO `users` (`id`, `name`, `lastname`, `email`, `password`, `phone`, `adress`, `rol`) VALUES
(1, 'Augusto', 'Flores', 'augusto@flores.com', '$2a$12$StTOXD7GtoQbjQZprlt8xe/msowYVdBGPWANtvQ.pqksLfhdxn8oS', 2222222, 'carrera 23 # 32- 10', 'USER');
INSERT INTO `users` (`id`, `name`, `lastname`, `email`, `password`, `phone`, `adress`, `rol`) VALUES
(2, 'Esteban', 'jhon', 'esteban@jhon.com', '$2a$12$FM7.aTkLbn9ZFztAVBoquOHEhsgKyyA/9Z8OjrU1Yu.JFITsHYVUG', 2222222, 'carrera 23 # 32- 10', 'ADMIN');
INSERT INTO `users` (`id`, `name`, `lastname`, `email`, `password`, `phone`, `adress`, `rol`) VALUES
(3, 'Joel', 'David', 'joel@david.com', '$2a$12$q.VuL.J6s96XJpqa6MZSi.GEV5pFLiBPvQpRnL2u/jgf3fD7AAJ42', 2222222, 'carrera 23 # 32- 10', 'ADMIN');
INSERT INTO `users` (`id`, `name`, `lastname`, `email`, `password`, `phone`, `adress`, `rol`) VALUES
(4, 'Selena', 'Gomez', 'selena@gomez.com', '$2a$12$Eeef9nQUEVUdNcosiMYhyOyY0lhRj/MBhF7/sRGH45vmZRoR3K/0a', 2222222, 'carrera 23 # 32- 10', 'USER');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;