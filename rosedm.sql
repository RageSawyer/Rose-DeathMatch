/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : rosedm

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2022-02-13 12:02:37
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `bans`
-- ----------------------------
DROP TABLE IF EXISTS `bans`;
CREATE TABLE `bans` (
  `Ad` varchar(24) NOT NULL DEFAULT 'Yok',
  `IP` varchar(30) NOT NULL DEFAULT '0.0.0.0',
  `hddserial` varchar(75) NOT NULL,
  `BanlanmaTarihi` varchar(30) NOT NULL,
  `Banlayan` varchar(24) NOT NULL,
  `Sure` int(12) NOT NULL,
  `Sebep` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin5 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bans
-- ----------------------------

-- ----------------------------
-- Table structure for `oyuncular`
-- ----------------------------
DROP TABLE IF EXISTS `oyuncular`;
CREATE TABLE `oyuncular` (
  `ID` int(12) NOT NULL AUTO_INCREMENT,
  `Isim` varchar(24) NOT NULL,
  `Sifre` varchar(140) NOT NULL,
  `SifreSakla` varchar(129) NOT NULL,
  `IP` varchar(17) NOT NULL,
  `Skin` int(11) NOT NULL DEFAULT 0,
  `Para` int(32) NOT NULL DEFAULT 0,
  `Admin` int(11) NOT NULL DEFAULT 0,
  `Seviye` int(11) NOT NULL DEFAULT 0,
  `OynamaSaati` int(11) NOT NULL DEFAULT 0,
  `EXP` int(11) NOT NULL DEFAULT 0,
  `Dakika` int(11) NOT NULL DEFAULT 0,
  `Mute` int(11) NOT NULL,
  `Olme` int(11) NOT NULL DEFAULT 0,
  `Oldurme` int(11) NOT NULL DEFAULT 0,
  `VIP` int(11) NOT NULL,
  `VipSure` int(11) NOT NULL,
  `Sniper` int(11) NOT NULL,
  `SandikHakki` int(11) NOT NULL,
  `Jail` int(11) NOT NULL,
  `RCoin` int(11) NOT NULL DEFAULT 0,
  `LevelExp` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin5 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of oyuncular
-- ----------------------------
INSERT INTO `oyuncular` VALUES ('1', 'Bojna', '8C2169A8016E7B6308BEAD966D1E0129BB6D5B500B73245BC95F568AB89CFAD7', 'i', '', '60', '33500', '2', '0', '0', '1', '0', '0', '6', '350', '0', '0', '1', '0', '0', '329451', '0');
INSERT INTO `oyuncular` VALUES ('2', 'Sawyer', '8C2169A8016E7B6308BEAD966D1E0129BB6D5B500B73245BC95F568AB89CFAD7', 'i', '', '0', '0', '0', '0', '0', '31', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `oyuncular` VALUES ('3', 'Sawyer_Ford', '20216F21142F919D683F5DBA0374802CE421BFFA22871454D522635164D81C6F', 'b', '', '60', '2000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
