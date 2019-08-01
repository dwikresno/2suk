/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.6.20 : Database - db_seniku
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_seniku` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_seniku`;

/*Table structure for table `tb_auth` */

DROP TABLE IF EXISTS `tb_auth`;

CREATE TABLE `tb_auth` (
  `id_user` int(11) DEFAULT NULL,
  `level` enum('Admin','User') DEFAULT NULL,
  `token` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_auth` */

/*Table structure for table `tb_content` */

DROP TABLE IF EXISTS `tb_content`;

CREATE TABLE `tb_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) DEFAULT NULL,
  `body` text,
  `time` datetime DEFAULT NULL,
  `id_author` int(11) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `tb_content` */

insert  into `tb_content`(`id`,`title`,`body`,`time`,`id_author`,`image`) values (1,'ASD','sdasdasas','2019-07-22 10:50:22',0,'https://storage.googleapis.com/lari-2/run/190425_444756e675d3e62094fdade1713f7941.jpg'),(2,'ASE','sdasddasdsadsa','2019-07-22 10:50:24',0,'https://storage.googleapis.com/lari-2/run/190425_444756e675d3e62094fdade1713f7941.jpg'),(3,'ASC','sdsadasdasdsa','2019-07-22 10:50:25',0,'https://storage.googleapis.com/lari-2/run/190425_444756e675d3e62094fdade1713f7941.jpg'),(4,'SAF','dasdasdasdsad','2019-07-22 10:50:27',0,'https://storage.googleapis.com/lari-2/run/190425_444756e675d3e62094fdade1713f7941.jpg');

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `foto` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_user` */

/*Table structure for table `tb_version` */

DROP TABLE IF EXISTS `tb_version`;

CREATE TABLE `tb_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(30) NOT NULL,
  `OS` enum('Android','iOS') NOT NULL,
  `app_version` varchar(30) NOT NULL,
  `release_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `tb_version` */

insert  into `tb_version`(`id`,`app_name`,`OS`,`app_version`,`release_date`) values (1,'2SUK','Android','1.0.0','2019-08-01 10:37:53'),(2,'2SUK','iOS','1.0.0','2019-08-01 10:42:56');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
