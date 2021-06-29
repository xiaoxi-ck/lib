/*
Navicat MySQL Data Transfer

Source Server         : 22
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : lrms

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-05-20 01:47:10
*/
DATABASE lrms
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `no` VARCHAR(20) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(11) DEFAULT NULL,
  `pwd` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'a01', 'aaa', '15322626', 'a01');

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `courseName` VARCHAR(50) NOT NULL,
  `roomId` INT(11) NOT NULL,
  `roomName` VARCHAR(50) NOT NULL,
  `teacherId` INT(11) NOT NULL,
  `teacherName` VARCHAR(50) NOT NULL,
  `studentId` INT(11) NOT NULL,
  `studentName` VARCHAR(50) NOT NULL,
  `year` INT(11) NOT NULL,
  `month` INT(11) NOT NULL,
  `day` INT(11) NOT NULL,
  `stuNum` INT(11) NOT NULL,
  `courseNo` INT(11) NOT NULL,
  `equipment` TEXT,
  `remark` TEXT,
  `status` INT(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '数学', '4', '实验室01', '2', '王帅', '1', 's01', '2017', '5', '2', '22', '1', '无', '无', '1');

-- ----------------------------
-- Table structure for `room`
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `location` VARCHAR(500) DEFAULT NULL,
  `remark` TEXT,
  `stuNum` INT(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('2', '华为实验室', '3楼1号', '', '40');
INSERT INTO `room` VALUES ('3', '安卓实验室', '3楼2号', '', '40');
INSERT INTO `room` VALUES ('4', '网络实验室', '3楼3号', '', '40');
INSERT INTO `room` VALUES ('5', '华为实验室2', '3楼4号', '', '40');
INSERT INTO `room` VALUES ('6', '安卓实验室2', '3楼5号', '', '40');
INSERT INTO `room` VALUES ('7', '网络实验室2', '3楼6号', '', '40');
INSERT INTO `room` VALUES ('8', '化学实验室1', '4楼1号', '', '15');
INSERT INTO `room` VALUES ('9', '化学实验室2', '4楼2号', '', '15');
INSERT INTO `room` VALUES ('10', '物理实验室1', '4楼3号', '', '15');
INSERT INTO `room` VALUES ('11', '物理实验室2', '4楼4号', '', '15');
INSERT INTO `room` VALUES ('12', '力学实验室', '4楼4号', '', '22');
INSERT INTO `room` VALUES ('13', '生物实验室', '4楼5号', '', '22');
INSERT INTO `room` VALUES ('14', '光学实验室', '4楼6号', '', '32');
-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `no` VARCHAR(20) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `courseName` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(11) DEFAULT NULL,
  `pwd` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', 's01', 's01', '数学', '1515', 's01');

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `no` VARCHAR(20) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(11) DEFAULT NULL,
  `courseName` VARCHAR(50) NOT NULL,
  `pwd` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('2', 't01', '王帅', '15364548848', '数学', 't01');
