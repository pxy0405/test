/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50018
Source Host           : 127.0.0.1:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50018
File Encoding         : 65001

Date: 2017-01-17 15:54:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cid` int(11) NOT NULL auto_increment,
  `cname` varchar(255) character set utf8 default NULL,
  PRIMARY KEY  (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '各地名优茶');
INSERT INTO `category` VALUES ('2', '茶饮机专用茶');
INSERT INTO `category` VALUES ('3', '花草保健茶');
INSERT INTO `category` VALUES ('4', '精选茶具');
INSERT INTO `category` VALUES ('5', '可口茶食');

-- ----------------------------
-- Table structure for categorysecond
-- ----------------------------
DROP TABLE IF EXISTS `categorysecond`;
CREATE TABLE `categorysecond` (
  `csid` int(11) NOT NULL auto_increment,
  `csname` varchar(255) character set utf8 default NULL,
  `cid` int(11) default NULL,
  PRIMARY KEY  (`csid`),
  KEY `FK_ikn7l2qj5rowv8j5exvg12ye6` (`cid`),
  CONSTRAINT `FK_ikn7l2qj5rowv8j5exvg12ye6` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of categorysecond
-- ----------------------------
INSERT INTO `categorysecond` VALUES ('1', '金骏眉', '1');
INSERT INTO `categorysecond` VALUES ('2', '专用茶单品', '2');
INSERT INTO `categorysecond` VALUES ('3', '玫瑰花茶', '3');
INSERT INTO `categorysecond` VALUES ('4', '功夫茶具', '4');
INSERT INTO `categorysecond` VALUES ('5', '蜜饯', '5');
INSERT INTO `categorysecond` VALUES ('6', '茶宠', '4');
INSERT INTO `categorysecond` VALUES ('7', '雪菊', '3');
INSERT INTO `categorysecond` VALUES ('8', '铁观音', '1');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `itemid` int(11) NOT NULL auto_increment,
  `count` int(11) default NULL,
  `subtotal` double default NULL,
  `pid` int(11) default NULL,
  `oid` int(11) default NULL,
  PRIMARY KEY  (`itemid`),
  KEY `FK_fesqehk2fei30hu4isqgmm36f` (`pid`),
  KEY `FK_j20ulwn7395herx5fobexsp9r` (`oid`),
  CONSTRAINT `FK_fesqehk2fei30hu4isqgmm36f` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`),
  CONSTRAINT `FK_j20ulwn7395herx5fobexsp9r` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('28', '1', '79', '1', '22');
INSERT INTO `orderitem` VALUES ('29', '1', '100', '13', '22');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `oid` int(11) NOT NULL auto_increment,
  `total` double default NULL,
  `ordertime` datetime default NULL,
  `state` int(11) default NULL,
  `addr` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `username` varchar(255) default NULL,
  `id` int(11) default NULL,
  PRIMARY KEY  (`oid`),
  KEY `FK_prhsdqkhfjc5m3q4jkkxk3ojf` (`id`),
  CONSTRAINT `FK_prhsdqkhfjc5m3q4jkkxk3ojf` FOREIGN KEY (`id`) REFERENCES `userinfo` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('22', '179', '2017-01-12 21:04:58', '1', null, null, null, '18');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pid` int(11) NOT NULL auto_increment,
  `pname` varchar(255) character set utf8 default NULL,
  `market_price` double default NULL,
  `shop_price` double default NULL,
  `image` varchar(255) character set utf8 default NULL,
  `pdesc` varchar(255) character set utf8 default NULL,
  `is_hot` int(11) default NULL,
  `pdate` datetime default NULL,
  `material` varchar(255) character set utf8 default NULL,
  `brand` varchar(255) character set utf8 default NULL,
  `csid` int(11) default NULL,
  PRIMARY KEY  (`pid`),
  KEY `FK_2a7f08kkrgphvawvppjq0j225` (`csid`),
  CONSTRAINT `FK_2a7f08kkrgphvawvppjq0j225` FOREIGN KEY (`csid`) REFERENCES `categorysecond` (`csid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '滋恩正宗特级金骏眉红茶', '197', '79', 'products/1/003.png', '', '1', null, '', '滋恩', '1');
INSERT INTO `product` VALUES ('2', '功夫云南滇红罐装', '115', '93', 'products/1/006.png', '', '0', null, '', '一品堂', '2');
INSERT INTO `product` VALUES ('3', '粉红摇滚玫瑰水果茶', '138', '58', 'products/1/004.png', '', '0', null, '', '萃崋香', '3');
INSERT INTO `product` VALUES ('4', '德化活瓷莲花瓣茶具10件套', '378', '289', 'products/1/005.png', '', '1', null, '陶瓷', '宏远达', '4');
INSERT INTO `product` VALUES ('5', '宠月白#招财+进宝', '184', '99', 'products/1/002.png', '', '0', null, '陶瓷', '恒越', '6');
INSERT INTO `product` VALUES ('6', '水润如初礼盒', '289', '149', 'products/1/012.png', '', '1', null, '', '雅丽百花缘', '5');
INSERT INTO `product` VALUES ('7', '雪菊圆罐装', '216', '69', 'products/1/014.png', '', '1', null, '', '雅丽百花缘', '7');
INSERT INTO `product` VALUES ('8', '特级知足清香铁观音圆罐装', '105', '32', 'products/1/011.png', '', '1', null, '', '远荣', '8');
INSERT INTO `product` VALUES ('9', '特级清雅香铁观音礼罐装', '356', '56', 'products/1/001.png', '', '1', null, '', '远荣', '8');
INSERT INTO `product` VALUES ('10', '冻干柠檬片圆罐装', '108', '27', 'products/1/010.png', '', '1', null, '', '雅丽百花缘', '5');
INSERT INTO `product` VALUES ('11', '汝窑三个和尚茶宠#呆#怒#思', '204', '99', 'products/1/013.png', '', '1', null, '', '恒越', '6');
INSERT INTO `product` VALUES ('13', '悠香金骏眉铁罐装120g', '328', '100', 'products/1/015.png', '', '1', null, '', '滋恩', '1');
INSERT INTO `product` VALUES ('14', '特级尔雅金骏眉圆罐装50g', '158', '39', 'products/1/016.png', '', '1', null, '', '滋恩', '1');
INSERT INTO `product` VALUES ('15', '悠香金骏眉一片叶子系列铁罐装120*2', '656', '198', 'products/1/017.png', '', '1', null, '', '滋恩', '1');
INSERT INTO `product` VALUES ('16', '特级铁观音礼盒250g*2', '328', '179', 'products/1/018.png', '', '1', null, '', '滋恩', '8');
INSERT INTO `product` VALUES ('17', '特级醇雅碳焙铁观音礼罐装250g*2-菊', '336', '108', 'products/1/019.png', '', '1', null, '', '远荣', '8');
INSERT INTO `product` VALUES ('18', '憧憬特级浓香+特级知足清香铁观音70g*2', '223', '59', 'products/1/020.png', '', '1', null, '', '远荣', '8');
INSERT INTO `product` VALUES ('19', '清馨特级清香铁观音礼罐装250g*2-梅', '316', '108', 'products/1/021.png', '', '1', null, '', '远荣', '8');
INSERT INTO `product` VALUES ('20', '特级印象清香铁观音盒装70g', '88', '39', 'products/1/022.png', '', '1', null, '', '远荣', '8');

-- ----------------------------
-- Table structure for tempindex
-- ----------------------------
DROP TABLE IF EXISTS `tempindex`;
CREATE TABLE `tempindex` (
  `id` int(11) NOT NULL auto_increment,
  `objId` int(11) default NULL,
  `type` varchar(255) default NULL,
  `operator` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tempindex
-- ----------------------------

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `ID` int(11) NOT NULL auto_increment,
  `USERNAME` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `STATUS` varchar(255) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('1', 'aaa', '123', '1');
INSERT INTO `userinfo` VALUES ('2', 'admin', '123', '0');
INSERT INTO `userinfo` VALUES ('16', 'eee', '123', '1');
INSERT INTO `userinfo` VALUES ('18', 'aaa', '123', '1');
