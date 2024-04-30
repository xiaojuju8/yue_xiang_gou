/*
SQLyog Ultimate v10.00 Beta1
MySQL - 8.0.34 : Database - db_yue_xiang_gou_houduan
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_yue_xiang_gou_houduan` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `db_yue_xiang_gou_houduan`;

/*Table structure for table `t_admin` */

DROP TABLE IF EXISTS `t_admin`;

CREATE TABLE `t_admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(66) DEFAULT NULL,
  `password` varchar(66) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `t_admin` */

insert  into `t_admin`(`id`,`userName`,`password`) values (1,'admin','123');

/*Table structure for table `t_bigtype` */

DROP TABLE IF EXISTS `t_bigtype`;

CREATE TABLE `t_bigtype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '商品大类的名称',
  `remark` varchar(765) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '商品大类的描述',
  `image` varchar(765) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '商品大类的图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `t_bigtype` */

insert  into `t_bigtype`(`id`,`name`,`remark`,`image`) values (1,'手机','手机描述','1.jpg'),(2,'电脑平板','电脑平板描述','2.jpg'),(3,'智能穿戴','智能穿戴描述','3.jpg'),(4,'电视','电视描述','4.jpg'),(5,'大家电','大家电描述','5.jpg'),(6,'小家电','小家电描述','6.jpg'),(7,'智能家居','智能家居描述','7.jpg'),(8,'户外出行','户外出行描述','8.jpg'),(9,'日用百货','日用百货描述','9.jpg'),(10,'儿童用品','儿童用品描述','10.jpg'),(11,'祖庙','佛山景点1','20240417042201000000074.jpg'),(13,'佛大','佛山第一大专','20240416081349000000310.jpeg'),(14,'羽毛球拍','烧钱运动','20240415083242000000664.jpg'),(15,'羽毛球','红超、尤尼克斯、胜利、李宁','20240415083428000000021.jpg'),(16,'羽毛球鞋','保护自己的脚踝','default.jpg');

/*Table structure for table `t_order` */

DROP TABLE IF EXISTS `t_order`;

CREATE TABLE `t_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderNo` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `userId` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `totalPrice` decimal(8,2) DEFAULT NULL,
  `address` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `consignee` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `telNumber` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `payDate` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `t_order` */

insert  into `t_order`(`id`,`orderNo`,`userId`,`totalPrice`,`address`,`consignee`,`telNumber`,`createDate`,`payDate`,`status`) values (162,'yuexianggou20240408125222000000576','oin6769kRmBeF_R_R-KzrHdYwMUk','2599.00','广东省广州市海珠区新港中路397号','张三','020-81167888','2024-04-08 12:52:23',NULL,1),(163,'yuexianggou20240408040222000000894','oin6769kRmBeF_R_R-KzrHdYwMUk','2599.00','广东省广州市海珠区新港中路397号','张三','020-81167888','2024-04-08 16:02:23',NULL,1),(164,'yuexianggou20240408040937000000554','oin6769kRmBeF_R_R-KzrHdYwMUk','13597.00','广东省广州市海珠区新港中路397号','张三','020-81167888','2024-04-08 16:09:38',NULL,2),(165,'yuexianggou20240408041028000000659','oin6769kRmBeF_R_R-KzrHdYwMUk','13597.00','广东省广州市海珠区新港中路397号','张三','020-81167888','2024-04-08 16:10:29',NULL,3),(166,'yuexianggou20240408041334000000994','oin6769kRmBeF_R_R-KzrHdYwMUk','2599.00','广东省广州市海珠区新港中路397号','张三','020-81167888','2024-04-08 16:13:35',NULL,1),(167,'yuexianggou20240408041434000000491','oin6769kRmBeF_R_R-KzrHdYwMUk','2599.00','广东省广州市海珠区新港中路397号','张三','020-81167888','2024-04-08 16:14:34',NULL,2),(168,'yuexianggou20240408041458000000347','oin6769kRmBeF_R_R-KzrHdYwMUk','2599.00','广东省广州市海珠区新港中路397号','张三','020-81167888','2024-04-08 16:14:58',NULL,1),(169,'yuexianggou20240408041501000000032','oin6769kRmBeF_R_R-KzrHdYwMUk','2599.00','广东省广州市海珠区新港中路397号','张三','020-81167888','2024-04-08 16:15:01',NULL,3),(170,'yuexianggou20240408041628000000611','oin6769kRmBeF_R_R-KzrHdYwMUk','2599.00','广东省广州市海珠区新港中路397号','张三','020-81167888','2024-04-08 16:16:29',NULL,2),(171,'yuexianggou20240408095620000000209','oin6769kRmBeF_R_R-KzrHdYwMUk','11397.00','广东省广州市海珠区新港中路397号','张三','020-81167888','2024-04-08 21:56:20',NULL,1),(172,'yuexianggou20240408095629000000545','oin6769kRmBeF_R_R-KzrHdYwMUk','2499.00','广东省广州市海珠区新港中路397号','张三','020-81167888','2024-04-08 21:56:30',NULL,1),(173,'yuexianggou20240408095637000000179','oin6769kRmBeF_R_R-KzrHdYwMUk','1199.00','广东省广州市海珠区新港中路397号','张三','020-81167888','2024-04-08 21:56:37',NULL,1),(174,'yuexianggou20240408095645000000278','oin6769kRmBeF_R_R-KzrHdYwMUk','1399.00','广东省广州市海珠区新港中路397号','张三','020-81167888','2024-04-08 21:56:45',NULL,3),(175,'yuexianggou20240408095651000000795','oin6769kRmBeF_R_R-KzrHdYwMUk','10998.00','广东省广州市海珠区新港中路397号','张三','020-81167888','2024-04-08 21:56:52',NULL,2),(176,'yuexianggou20240417044752000000790','oin6769kRmBeF_R_R-KzrHdYwMUk','3454.00','广东省广州市海珠区新港中路397号','张三','020-81167888','2024-04-17 16:47:53',NULL,1),(177,'yuexianggou20240417044808000000473','oin6769kRmBeF_R_R-KzrHdYwMUk','999.00','广东省广州市海珠区新港中路397号','张三','020-81167888','2024-04-17 16:48:08',NULL,1);

/*Table structure for table `t_order_detail` */

DROP TABLE IF EXISTS `t_order_detail`;

CREATE TABLE `t_order_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mId` int DEFAULT NULL,
  `goodsId` int DEFAULT NULL,
  `goodsNumber` int DEFAULT NULL,
  `goodsPrice` decimal(10,0) DEFAULT NULL,
  `goodsName` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `goodsPic` varchar(765) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `t_order_detail` */

insert  into `t_order_detail`(`id`,`mId`,`goodsId`,`goodsNumber`,`goodsPrice`,`goodsName`,`goodsPic`) values (217,162,14,1,'2599','Xiaomi Civi','9.png'),(218,163,14,1,'2599','Xiaomi Civi','9.png'),(219,164,24,2,'5499','小米笔记本 Pro 14 增强版','20.png'),(220,164,14,1,'2599','Xiaomi Civi','9.png'),(221,165,24,2,'5499','小米笔记本 Pro 14 增强版','20.png'),(222,165,14,1,'2599','Xiaomi Civi','9.png'),(223,166,14,1,'2599','Xiaomi Civi','9.png'),(224,167,14,1,'2599','Xiaomi Civi','9.png'),(225,168,14,1,'2599','Xiaomi Civi','9.png'),(226,169,14,1,'2599','Xiaomi Civi','9.png'),(227,170,14,1,'2599','Xiaomi Civi','9.png'),(228,171,4,3,'3799','Xiaomi 11','6.png'),(229,172,12,1,'2499','Redmi  K40 Pro 系列','8.png'),(230,173,8,1,'1199','Note 9 5G','3.png'),(231,174,10,1,'1399','Note 9 Pro 5G','5.png'),(232,175,24,2,'5499','小米笔记本 Pro 14 增强版','20.png'),(233,176,30,1,'1588','100zz','20240416092505000000292.jpg'),(234,176,33,1,'1866','天斧77PRO','20240417044523000000321.jpg'),(235,177,32,1,'999','雷霆80','20240417044424000000515.jpg');

/*Table structure for table `t_product` */

DROP TABLE IF EXISTS `t_product`;

CREATE TABLE `t_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `price` decimal(20,0) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `proPic` varchar(765) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `isHot` bit(1) DEFAULT NULL,
  `isSwiper` bit(1) DEFAULT NULL,
  `swiperPic` varchar(765) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `swiperSort` int DEFAULT NULL,
  `typeId` int DEFAULT NULL,
  `hotDateTime` datetime DEFAULT NULL,
  `productIntroImgs` varchar(4500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `productParaImgs` varchar(4500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description` varchar(4500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `t_product` */

insert  into `t_product`(`id`,`name`,`price`,`stock`,`proPic`,`isHot`,`isSwiper`,`swiperPic`,`swiperSort`,`typeId`,`hotDateTime`,`productIntroImgs`,`productParaImgs`,`description`) values (1,'小米电视大师 82英寸','10999',3451,'21.png','\0','\0','2.jpg',3,14,NULL,'\"\"','\"\"','\"\"'),(4,'Xiaomi 11','3799',3232,'6.png','\0','\0','default.jpg',0,2,NULL,'<img width=\'100%\' src=\'http://127.0.0.1:8080/image/productIntroImgs/11.jpg\'></img>','<img width=\'100%\' src=\'http://127.0.0.1:8080/image/productParaImgs/11.jpg\'></img>','「全版本领券立减200元，券后价3299元起；享至高24期免息；赠手机保护壳*1;【全款支付套装】赠果冻包」'),(5,'Redmi K40 游戏增强版','2299',2005,'11.png','\0','\0','1.jpg',1,39,NULL,'\"\"','\"\"','\"\"'),(6,'Xiaomi 11 Pro','4499',2343,'1.png','\0','\0','default.jpg',0,2,NULL,'\"\"',NULL,NULL),(7,'Xiaomi MIX FOLD折叠屏手机','7999',2222,'2.png','\0','\0','default.jpg',0,3,NULL,'\"\"',NULL,NULL),(8,'Note 9 5G','1199',1111,'3.png','\0','\0','default.jpg',0,40,NULL,'\"\"',NULL,NULL),(9,'Xiaomi 10S','2999',1111,'4.png','\0','\0','default.jpg',0,2,NULL,'\"\"',NULL,NULL),(10,'Note 9 Pro 5G','1399',2222,'5.png','\0','\0','default.jpg',0,40,NULL,'\"\"',NULL,NULL),(11,'黑鲨4','2499',3322,'7.png','\0','\0','default.jpg',0,41,NULL,'\"\"',NULL,NULL),(12,'Redmi  K40 Pro 系列','2499',3244,'8.png','\0','\0','default.jpg',0,39,NULL,NULL,NULL,NULL),(14,'Xiaomi Civi','2599',4444,'9.png','\0','\0','default.jpg',0,1,NULL,'<img width=\'100%\' src=\'http://127.0.0.1:8080/image/productIntroImgs/1.jpg\'></img><img width=\'100%\' src=\'http://127.0.0.1:8080/image/productIntroImgs/2.jpg\'></img><img width=\'100%\' src=\'http://127.0.0.1:8080/image/productIntroImgs/3.jpg\'></img>','<img width=\'100%\' src=\'http://127.0.0.1:8080/image/productParaImgs/1.jpg\'></img><img width=\'100%\' src=\'http://127.0.0.1:8080/image/productParaImgs/2.jpg\'></img>','「购机至高享24期免息；赠Redmi AirDots 2真无线蓝牙耳机；赠Keep会员7天体验卡；+110元得Air2 SE蓝牙耳机」'),(15,'Xiaomi 11 Ultra','5499',4444,'10.png','\0','\0','default.jpg',0,2,NULL,NULL,NULL,NULL),(16,'小米平板5','1999',444,'13.png','\0','\0','default.jpg',0,5,NULL,'<img src=\'http://127.0.0.1:8080/image/productIntroImgs/111.jpg\'></img><img width=\'100%\' src=\'http://127.0.0.1:8080/image/productIntroImgs/222.jpg\'></img><img width=\'100%\' src=\'http://127.0.0.1:8080/image/productIntroImgs/333.jpg\'></img>','<img width=\'100%\' src=\'http://127.0.0.1:8080/image/productParaImgs/111.jpg\'></img>','11英寸大屏 2.5K超清显示 120Hz高刷新率'),(17,'小米平板5 Pro','2499',444,'14.png','\0','\0','default.jpg',0,5,NULL,NULL,NULL,NULL),(19,'RedmiBook Pro 15 增强版','5299',444,'15.png','\0','\0','default.jpg',0,6,NULL,NULL,NULL,NULL),(20,'Redmi G 2021','6499',1999,'16.png','\0','\0','3.jpg',2,6,NULL,NULL,NULL,NULL),(21,'Redmi G 2021 锐龙版','7499',2000,'17.png','\0','\0','default.jpg',0,6,NULL,NULL,NULL,NULL),(22,'RedmiBook Pro 14 增强版','4999',777,'18.png','\0','\0','default.jpg',0,6,NULL,NULL,NULL,NULL),(23,'小米笔记本 Pro 14 锐龙版','5499',666,'19.png','\0','\0','default.jpg',0,7,NULL,NULL,NULL,NULL),(24,'小米笔记本 Pro 14 增强版','5499',666,'20.png','\0','\0','default.jpg',0,7,NULL,NULL,NULL,NULL),(26,'1','1',1,'default.jpg','\0','\0','default.jpg',0,6,NULL,'1','1',NULL),(27,'1','2',3,'default.jpg','\0','\0','default.jpg',0,6,NULL,'5','6','4'),(28,'2','3',4,'default.jpg','\0','\0','default.jpg',0,6,NULL,'6','7','5'),(30,'100zz','1588',10,'20240416092505000000292.jpg','','','20240417044352000000117.jpg',0,51,'2024-04-17 17:03:42',NULL,NULL,'YONEX 天斧国羽明星同款全碳素进攻拍，天斧100zz藏青4u。\n安赛龙、石宇奇同款战拍'),(31,'龙牙之刃一代','888',100,'20240417044407000000562.jpg','','','20240417044416000000133.jpg',0,52,'2024-04-17 17:05:51',NULL,NULL,'胜利全碳素高端进攻拍，李梓嘉同款战拍。'),(32,'雷霆80','999',8,'20240417044424000000515.jpg','','','20240417044431000000216.jpg',1,53,'2024-04-17 17:02:32',NULL,NULL,'有3U、4U规格，李宁最畅销的一款，好上手的高端拍，奥运冠军谌龙代言。'),(33,'天斧77PRO','1866',1,'20240417044523000000321.jpg','\0','\0','20240417044535000000396.jpg',1,51,NULL,NULL,NULL,'尤尼克斯中国必胜2024国羽限定签名款天斧AX77PRO单拍，4U规格，数量有限'),(34,'黑金隼','1050',3,'20240417044541000000922.jpg','\0','\0','20240417044608000000313.jpg',0,52,NULL,NULL,NULL,'VICTOR胜利羽毛球拍威克多进攻型TK-F隼黑金隼亨德拉签名黑金隼HS'),(35,'雷霆60','555',20,'20240417044616000000966.jpg','','\0','20240417044623000000470.jpg',0,53,'2024-04-17 17:05:54',NULL,NULL,'李宁雷霆60/50羽毛球拍全碳素超轻单拍4u/5U雷霆系列王适娴同款'),(36,'AS05','128',88,'20240417045135000000093.jpg','\0','\0','20240417045143000000432.jpg',0,54,NULL,NULL,NULL,'YONEX尤尼克斯羽毛球yy正品鹅毛鸭毛训练球12只装AS9比赛用球AS05'),(37,'F90羽毛球','500',9,'20240417045422000000595.jpg','\0','\0','20240417045442000000133.jpg',0,54,NULL,NULL,NULL,'正品YONEX尤尼克斯鹅毛球F90羽毛球'),(38,'大师ACE','199',58,'20240417045723000000889.jpg','','\0','20240417045729000000367.jpg',0,55,'2024-04-17 17:06:01',NULL,NULL,'胜利VICTOR威克多羽毛球MASTER大师级ACE'),(39,'金黄1号','80',22,'20240417045743000000228.jpg','','\0','20240417045748000000399.jpg',0,55,'2024-04-17 17:06:02',NULL,NULL,'威克多VICTOR胜利金黄1号金胜利羽毛球GOLD鸭毛耐打稳定复合软木'),(40,'G900','200',188,'20240417050047000000225.jpg','','\0','20240417050052000000286.jpg',0,56,'2024-04-17 17:06:03',NULL,NULL,'李宁LINING国际比赛用球G900 原型号A+600 BWF认证高端比赛鹅毛球'),(41,'D8羽毛球','100',1,'20240417050103000000475.jpg','\0','\0','20240417050111000000182.jpg',0,56,NULL,NULL,NULL,'官方旗舰正品李宁羽毛球球D8飞行稳定专业比赛用球12只鸭毛球耐打'),(42,'65z3','666',666,'20240417050850000000637.jpg','\0','\0','20240417050900000000960.jpg',1,57,NULL,NULL,NULL,'新款正品YONEX 尤尼克斯专业减震国家队同款新色男女羽毛球鞋65Z3'),(43,'A970ACE','666',11,'20240417051043000000011.jpg','\0','\0','20240417051047000000864.jpg',0,58,NULL,NULL,NULL,'威克多VICTOR 胜利新款李梓嘉战靴A970ACE羽毛球鞋减震防滑包裹性'),(44,'无敌号','400',1000,'20240417051234000000020.jpg','','','20240417051249000000084.jpg',3,59,'2024-04-17 17:13:17',NULL,NULL,'李宁无敌号ACE雪地迷彩专业羽毛球鞋男鞋缓震透气AYAR015运动鞋');

/*Table structure for table `t_product_swiper_image` */

DROP TABLE IF EXISTS `t_product_swiper_image`;

CREATE TABLE `t_product_swiper_image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(765) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `productId` int DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `t_product_swiper_image` */

insert  into `t_product_swiper_image`(`id`,`image`,`sort`,`productId`) values (1,'1.jpg',1,14),(2,'2.jpg',2,14),(3,'3.jpg',3,14),(4,'4.jpg',4,14),(5,'5.jpg',5,14),(6,'6.jpg',6,14),(7,'7.jpg',7,14),(8,'11.jpg',1,4),(9,'22.jpg',2,4),(10,'33.jpg',3,4),(11,'44.jpg',4,4),(12,'111.jpg',1,16),(13,'222.jpg',2,16),(14,'333.jpg',3,16),(31,'20240416073001000000362.jpg',1,1),(34,'20240416092558000000482.jpg',1,29),(35,'20240417044458000000981.jpg',1,30),(36,'20240417044507000000709.jpg',2,30),(37,'20240417045157000000351.jpg',1,31),(38,'20240417045206000000127.jpg',1,32),(39,'20240417045217000000895.jpg',1,33),(40,'20240417045225000000791.jpg',1,34),(41,'20240417045236000000756.jpg',1,35),(42,'20240417045244000000781.jpg',1,36),(43,'20240417045432000000625.jpg',1,37),(44,'20240417045734000000622.jpg',0,38),(45,'20240417045756000000427.jpg',0,39),(46,'20240417050057000000086.jpg',0,40),(47,'20240417050116000000871.jpg',0,41),(48,'20240417050922000000240.jpg',0,42),(49,'20240417051054000000494.jpg',0,43),(50,'20240417051256000000405.jpg',0,44);

/*Table structure for table `t_smalltype` */

DROP TABLE IF EXISTS `t_smalltype`;

CREATE TABLE `t_smalltype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `bigTypeId` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `t_smalltype` */

insert  into `t_smalltype`(`id`,`name`,`remark`,`bigTypeId`) values (1,'Xiaomi Civi','Xiaomi Civi',1),(2,'Xiaomi 数字系列','Xiaomi 数字系列',1),(3,'Xiaomi MIX系列','Xiaomi MIX系列',1),(5,'小米平板','小米平板',2),(6,'RedmiBook','RedmiBook',2),(7,'小米笔记本','小米笔记本',2),(10,'耳机','耳机',3),(11,'手表','手表',3),(12,'手环','手环',3),(13,'电视','电视',4),(14,'小米电视大师','小米电视大师',4),(15,'电视配件','电视配件',4),(16,'空调','空调',5),(17,'洗衣机','洗衣机',5),(18,'冰箱','冰箱',5),(19,'厨房大电','厨房大电',5),(20,'厨房小电','厨房小电',6),(21,'清洁电器','清洁电器',6),(22,'环境电器','环境电器',6),(23,'生活电器','生活电器',6),(24,'小爱音箱','小爱音箱',7),(25,'路由器','路由器',7),(26,'智能安防','智能安防',7),(27,'智能控制','智能控制',7),(28,'户外出行','户外出行',8),(29,'箱包','箱包',8),(30,'家具日用','家具日用',9),(31,'防护清洁','防护清洁',9),(32,'会员定制','会员定制',9),(33,'个人护理','个人护理',9),(34,'健康','健康',9),(35,'鞋服配饰','鞋服配饰',9),(36,'床品家居','床品家居',9),(37,'礼品周边','礼品周边',9),(38,'儿童用品','儿童用品',10),(39,'Redmi K系列','K系列',1),(40,'Redmi Note系列','Note系列',1),(41,'游戏手机','游戏手机',1),(44,'22','22',3),(45,'是','3 是',2),(46,'ewew','ew',3),(47,'rrr','rrr',2),(48,'43','4343',2),(49,'5','55',4),(51,'尤尼克斯','三大厂——绿厂',14),(52,'胜利','三大厂——蓝厂',14),(53,'李宁','三大厂——红厂',14),(54,'尤尼克斯','yy05、yy09、yy50等等',15),(55,'胜利','大师系列、金黄系列',15),(56,'李宁','G系列、D系列',15),(57,'尤尼克斯','65z3、88D2等等',16),(58,'胜利','970ACE、P8500等',16),(59,'李宁','无敌号、贴地飞行等等',16);

/*Table structure for table `t_wxuserinfo` */

DROP TABLE IF EXISTS `t_wxuserinfo`;

CREATE TABLE `t_wxuserinfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `openid` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nickName` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `avatarUrl` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `registerDate` datetime DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `t_wxuserinfo` */

insert  into `t_wxuserinfo`(`id`,`openid`,`nickName`,`avatarUrl`,`registerDate`,`lastLoginDate`) values (1,'oin6769kRmBeF_R_R-KzrHdYwMUk','但愿','https://thirdwx.qlogo.cn/mmopen/vi_32/PiajxSqBRaELKQ2gvVjBNL0kvG9bHVTUibe3y9uhcslVaP48U8uTlTk3HV4WVMO3KWq2Ue4wWBEsujcrTeQS91VanodBUa2EMjkNP0Y4dWmVE0Ln8N4ibLXrA/132','2024-04-07 21:55:38','2024-04-10 22:46:48'),(2,NULL,NULL,'https://thirdwx.qlogo.cn/mmopen/vi_32/PiajxSqBRaELKQ2gvVjBNL0kvG9bHVTUibe3y9uhcslVaP48U8uTlTk3HV4WVMO3KWq2Ue4wWBEsujcrTeQS91VanodBUa2EMjkNP0Y4dWmVE0Ln8N4ibLXrA/132',NULL,NULL),(3,NULL,NULL,'https://thirdwx.qlogo.cn/mmopen/vi_32/PiajxSqBRaELKQ2gvVjBNL0kvG9bHVTUibe3y9uhcslVaP48U8uTlTk3HV4WVMO3KWq2Ue4wWBEsujcrTeQS91VanodBUa2EMjkNP0Y4dWmVE0Ln8N4ibLXrA/132',NULL,NULL),(4,NULL,NULL,'https://thirdwx.qlogo.cn/mmopen/vi_32/PiajxSqBRaELKQ2gvVjBNL0kvG9bHVTUibe3y9uhcslVaP48U8uTlTk3HV4WVMO3KWq2Ue4wWBEsujcrTeQS91VanodBUa2EMjkNP0Y4dWmVE0Ln8N4ibLXrA/132',NULL,NULL),(5,NULL,NULL,'https://thirdwx.qlogo.cn/mmopen/vi_32/PiajxSqBRaELKQ2gvVjBNL0kvG9bHVTUibe3y9uhcslVaP48U8uTlTk3HV4WVMO3KWq2Ue4wWBEsujcrTeQS91VanodBUa2EMjkNP0Y4dWmVE0Ln8N4ibLXrA/132',NULL,NULL),(6,NULL,NULL,'https://thirdwx.qlogo.cn/mmopen/vi_32/PiajxSqBRaELKQ2gvVjBNL0kvG9bHVTUibe3y9uhcslVaP48U8uTlTk3HV4WVMO3KWq2Ue4wWBEsujcrTeQS91VanodBUa2EMjkNP0Y4dWmVE0Ln8N4ibLXrA/132',NULL,NULL),(7,NULL,NULL,'https://thirdwx.qlogo.cn/mmopen/vi_32/PiajxSqBRaELKQ2gvVjBNL0kvG9bHVTUibe3y9uhcslVaP48U8uTlTk3HV4WVMO3KWq2Ue4wWBEsujcrTeQS91VanodBUa2EMjkNP0Y4dWmVE0Ln8N4ibLXrA/132',NULL,NULL),(8,NULL,NULL,'https://thirdwx.qlogo.cn/mmopen/vi_32/PiajxSqBRaELKQ2gvVjBNL0kvG9bHVTUibe3y9uhcslVaP48U8uTlTk3HV4WVMO3KWq2Ue4wWBEsujcrTeQS91VanodBUa2EMjkNP0Y4dWmVE0Ln8N4ibLXrA/132',NULL,NULL),(9,NULL,NULL,'https://thirdwx.qlogo.cn/mmopen/vi_32/PiajxSqBRaELKQ2gvVjBNL0kvG9bHVTUibe3y9uhcslVaP48U8uTlTk3HV4WVMO3KWq2Ue4wWBEsujcrTeQS91VanodBUa2EMjkNP0Y4dWmVE0Ln8N4ibLXrA/132',NULL,NULL),(10,NULL,NULL,'https://thirdwx.qlogo.cn/mmopen/vi_32/PiajxSqBRaELKQ2gvVjBNL0kvG9bHVTUibe3y9uhcslVaP48U8uTlTk3HV4WVMO3KWq2Ue4wWBEsujcrTeQS91VanodBUa2EMjkNP0Y4dWmVE0Ln8N4ibLXrA/132',NULL,NULL),(11,NULL,NULL,'https://thirdwx.qlogo.cn/mmopen/vi_32/PiajxSqBRaELKQ2gvVjBNL0kvG9bHVTUibe3y9uhcslVaP48U8uTlTk3HV4WVMO3KWq2Ue4wWBEsujcrTeQS91VanodBUa2EMjkNP0Y4dWmVE0Ln8N4ibLXrA/132',NULL,NULL),(12,NULL,NULL,'https://thirdwx.qlogo.cn/mmopen/vi_32/PiajxSqBRaELKQ2gvVjBNL0kvG9bHVTUibe3y9uhcslVaP48U8uTlTk3HV4WVMO3KWq2Ue4wWBEsujcrTeQS91VanodBUa2EMjkNP0Y4dWmVE0Ln8N4ibLXrA/132',NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
