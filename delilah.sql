/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


/*----------------------------------------------------------------------------------*/
/* LA TABLA DE ROL DEBE SER INSERTADA PRIMERO Y COLOCAR ADMIN Y USER*/
/*----------------------------------------------------------------------------------*/

DROP TABLE IF EXISTS `rols`;
CREATE TABLE `rols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rols` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;


INSERT INTO `rols` (`id`, `rols`) VALUES(1, 'ADMIN');
INSERT INTO `rols` (`id`, `rols`) VALUES(2, 'USER');

/*----------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------*/

/*    TABLA DE PRODUCTOS       */

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picture` varchar(60) DEFAULT NULL,
  `title` varchar(60) NOT NULL,
  `cost` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;


INSERT INTO `products` (`id`, `picture`, `title`, `cost`) VALUES
(1, 'www.imagen.com', 'arepita', 2000);
INSERT INTO `products` (`id`, `picture`, `title`, `cost`) VALUES
(2, 'www.imagen.com', 'buñuelo', 500);
INSERT INTO `products` (`id`, `picture`, `title`, `cost`) VALUES
(3, 'www.imagen.com', 'empanada', 1000);
INSERT INTO `products` (`id`, `picture`, `title`, `cost`) VALUES
(4, 'www.imagen.com', 'patacon', 5000);

/*----------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------*/

/*     TABLA DE USUARIOS      */
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*--------------------------------     CONTRASEÑA ES 1234      --------------------------------------*/

INSERT INTO `users` (`id`, `name`, `lastname`, `email`, `password`, `phone`, `adress`, `rol`) VALUES
(1, 'Augusto', 'Flores', 'augusto@flores.com', '$2a$12$StTOXD7GtoQbjQZprlt8xe/msowYVdBGPWANtvQ.pqksLfhdxn8oS', 2222222, 'carrera 23 # 32- 10', 'USER');
INSERT INTO `users` (`id`, `name`, `lastname`, `email`, `password`, `phone`, `adress`, `rol`) VALUES
(2, 'Esteban', 'jhon', 'esteban@jhon.com', '$2a$12$FM7.aTkLbn9ZFztAVBoquOHEhsgKyyA/9Z8OjrU1Yu.JFITsHYVUG', 2222222, 'carrera 23 # 32- 10', 'ADMIN');
INSERT INTO `users` (`id`, `name`, `lastname`, `email`, `password`, `phone`, `adress`, `rol`) VALUES
(3, 'Joel', 'David', 'joel@david.com', '$2a$12$q.VuL.J6s96XJpqa6MZSi.GEV5pFLiBPvQpRnL2u/jgf3fD7AAJ42', 2222222, 'carrera 23 # 32- 10', 'ADMIN');
INSERT INTO `users` (`id`, `name`, `lastname`, `email`, `password`, `phone`, `adress`, `rol`) VALUES
(4, 'Selena', 'Gomez', 'selena@gomez.com', '$2a$12$Eeef9nQUEVUdNcosiMYhyOyY0lhRj/MBhF7/sRGH45vmZRoR3K/0a', 2222222, 'carrera 23 # 32- 10', 'USER');

/*----------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------*/

/*     TABLA DE PEDIDOS       */

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity_orders` decimal(10,0) NOT NULL,
  `total` varchar(60) DEFAULT NULL,
  `estado` varchar(60) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `productId` (`productId`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

INSERT INTO `orders` (`id`, `quantity_orders`, `total`, `estado`, `userId`, `productId`) VALUES
(1, 2, '10000', 'new', 2, 4);
INSERT INTO `orders` (`id`, `quantity_orders`, `total`, `estado`, `userId`, `productId`) VALUES
(2, 2, '4000', 'new', 2, 1);
INSERT INTO `orders` (`id`, `quantity_orders`, `total`, `estado`, `userId`, `productId`) VALUES
(3, 2, '4000', 'new', 3, 1);
INSERT INTO `orders` (`id`, `quantity_orders`, `total`, `estado`, `userId`, `productId`) VALUES
(4, 4, '4000', 'new', 3, 3),
(5, 1, '500', 'new', 1, 2),
(6, 2, '2000', 'new', 1, 3),
(7, 2, '10000', 'new', 4, 4),
(8, 5, '10000', 'new', 4, 1);

/*----------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------*/

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;