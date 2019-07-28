/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.7.23 : Database - tomas
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tomas` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `tomas`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `realname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`username`,`password`,`realname`) values ('admin','123','小明');

/*Table structure for table `answer` */

DROP TABLE IF EXISTS `answer`;

CREATE TABLE `answer` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(200) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  PRIMARY KEY (`aid`),
  KEY `FK_message` (`mid`),
  CONSTRAINT `FK_message` FOREIGN KEY (`mid`) REFERENCES `message` (`mid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `answer` */

insert  into `answer`(`aid`,`content`,`date`,`mid`) values (6,'fdjskfjskljfsdjf','2018-12-31 21:23:30',9),(8,'fdsakfjdsjaf','2019-01-02 10:41:47',10);

/*Table structure for table `authority` */

DROP TABLE IF EXISTS `authority`;

CREATE TABLE `authority` (
  `suname` varchar(20) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  KEY `FK_stu` (`suname`),
  KEY `FK_cour` (`cid`),
  CONSTRAINT `FK_cour` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_stu` FOREIGN KEY (`suname`) REFERENCES `student` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `authority` */

insert  into `authority`(`suname`,`cid`) values ('qinkai',50001),('qinkai',50002),('xiaoming',50001),('xiaoming',50002),('qinkai',50005),('qinkai',50006),('xiaoming',50005),('qinkai',50003),('xiaogang',50001);

/*Table structure for table `college` */

DROP TABLE IF EXISTS `college`;

CREATE TABLE `college` (
  `coid` int(11) NOT NULL AUTO_INCREMENT,
  `coname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`coid`)
) ENGINE=InnoDB AUTO_INCREMENT=10006 DEFAULT CHARSET=utf8;

/*Data for the table `college` */

insert  into `college`(`coid`,`coname`) values (10001,'光电信息与计算机工程学院'),(10002,'出版印刷与艺术设计'),(10003,'材料'),(10004,'数学'),(10005,'英语');

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(20) DEFAULT NULL,
  `introduction` varchar(1000) DEFAULT NULL,
  `tuname` varchar(20) DEFAULT NULL,
  `coid` int(11) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `FK_teacher` (`tuname`),
  KEY `FK_col` (`coid`),
  CONSTRAINT `FK_col` FOREIGN KEY (`coid`) REFERENCES `college` (`coid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_teacher` FOREIGN KEY (`tuname`) REFERENCES `teacher` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50007 DEFAULT CHARSET=utf8;

/*Data for the table `course` */

insert  into `course`(`cid`,`cname`,`introduction`,`tuname`,`coid`) values (50001,'Web应用开发','掌握Web开发和运行平台的搭建，熟悉HTML、JavaScript和CSS等静态网页开发技术和以JSP2.0为主的动态网页的开发技术。掌握Java Web开发和运行平台的搭建、静态网页的制作、编写满足要求的JSP页面、开发基于Model 1的简单Web应用，能够连接数据库实现较为复杂的业务逻辑开发基于MVC模式的Web应用，能够连接数据库实现较为复杂的业务逻辑。培养良好的学习态度和学习习惯，培养互帮互助的合作精神。。。。','zhangsan',10001),(50002,'java','afdsjasfjdlsajfs','zhangsan',10001),(50003,'数据库','fdhsafjdsaf','zhao1',10001),(50004,'软件工程','fdhsahkfjsajfsafhsafsa','zhao1',10001),(50005,'综合英语','fdhsafkjsfsa','li4',10005),(50006,'交互英语','','li4',10005);

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `suname` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`mid`),
  KEY `FK_course` (`cid`),
  KEY `FK_student` (`suname`),
  CONSTRAINT `FK_course` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_student` FOREIGN KEY (`suname`) REFERENCES `student` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `message` */

insert  into `message`(`mid`,`title`,`content`,`date`,`cid`,`suname`,`status`) values (3,'javaWeb该怎么学啊','javaWeb该怎么学啊','2018-12-30 19:21:16',50001,'qinkai',0),(4,'什么是session','javaWeb该怎么学啊','2018-12-30 19:21:44',50001,'qinkai',1),(5,'英语该怎么学','英语该怎么学','2018-12-30 19:22:18',50005,'qinkai',0),(6,'英语听力怎么办？','英语听力怎么办？???\r\n','2018-12-30 19:23:06',50006,'qinkai',0),(7,'java有什么优点','java有什么优点','2018-12-30 19:30:48',50002,'xiaoming',0),(9,'java？？？','java？？？？？\r\n','2018-12-31 20:56:04',50002,'qinkai',1),(10,'java？？？？','java？？？？java？？？？','2018-12-31 21:18:14',50002,'qinkai',1),(11,'fjdsajffdsajfjds','sfdjkajsfsajfds','2018-12-31 21:18:35',50001,'qinkai',0),(13,'fdjasifh','hdfahfhdsajhfhsdah','2019-01-02 10:36:03',50001,'qinkai',0);

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `username` varchar(10) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `realname` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`username`,`password`,`realname`) values ('qinkai','123','秦凯'),('xiaogang','123','小刚'),('xiaohong','123','小红'),('xiaoming','123','小明'),('xiaowang','123','小王');

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `realname` varchar(10) DEFAULT NULL,
  `position` varchar(20) DEFAULT NULL,
  `introduction` varchar(200) DEFAULT NULL,
  `coid` int(11) DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `FK_college` (`coid`),
  CONSTRAINT `FK_college` FOREIGN KEY (`coid`) REFERENCES `college` (`coid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `teacher` */

insert  into `teacher`(`username`,`password`,`realname`,`position`,`introduction`,`coid`) values ('li4','123','李四','教授','flkjsfjsajfsja',10005),('zhang1','123','张一 ','副教授','fjajfsafjsaj',10001),('zhang2','123','张二','副教授','fafdsdfjsjfs',10002),('zhangsan','123','张三','副教授','fdaskfhasfhdshaf',10001),('zhao1','123','赵一','教授','lfadjslfdsfjdlaksjfdasjfdals',10001),('zhao2','123','赵二','副教授','fisdjfdjaskfjas',10002),('zhao3','123','赵三','教授','fasdfdjsalfdsajf',10002);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
