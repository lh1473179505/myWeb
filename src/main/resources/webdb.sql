/*
Navicat MySQL Data Transfer

Source Server         : myDB
Source Server Version : 50513
Source Host           : localhost:3306
Source Database       : webdb

Target Server Type    : MYSQL
Target Server Version : 50513
File Encoding         : 65001

Date: 2016-12-21 13:09:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------

CREATE TABLE admin (
  AdminID int(11) NOT NULL AUTO_INCREMENT,
  AdminName varchar(32) DEFAULT NULL,
  AdminPwd varchar(64) DEFAULT NULL,
  AdminType smallint(6) DEFAULT NULL,
  LastLoginTime varchar(50) DEFAULT NULL,
  PRIMARY KEY (AdminID)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO admin VALUES ('1', 'mr', 'mrsoft', '1', '2016-01-01');

-- ----------------------------
-- Table structure for `news`
-- ----------------------------

CREATE TABLE news (
  NewsID int(11) NOT NULL AUTO_INCREMENT,
  NewsTitle varchar(60) DEFAULT NULL,
  NewsContent longtext,
  NewsTime varchar(50) DEFAULT NULL,
  AdminName varchar(32) DEFAULT NULL,
  PRIMARY KEY (NewsID)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO news VALUES ('1', '新书上市', '《开发实战1200例》已更名为《开发实例大全》（基础卷 提高卷）现已全面上市，各平台有售。', '2016-01-01', '管理员');
INSERT INTO news VALUES ('2', '标题', '内容neirong', '2016-02-01', '主管');

INSERT INTO news VALUES ('3', 'biaoti3', 'aaaaaaaaaaaaaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaneirong', '2016-02-01', 'zhuguan');
