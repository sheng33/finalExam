/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : finalexam

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 24/06/2019 10:38:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cartable
-- ----------------------------
DROP TABLE IF EXISTS `cartable`;
CREATE TABLE `cartable`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `carId` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '车辆线路名称',
  `licensePlate` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '车牌',
  `carPath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '车辆线路',
  `startSite` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '起始站',
  `endSite` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '终点站',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cartable
-- ----------------------------
INSERT INTO `cartable` VALUES (1, '2路', '赣D1234', '4-5-8-9-10-11-12-13-14-15-16-17-18-19-20-21-22-23-24-25-26-27-28', '九江职业技术学院', '上海路');
INSERT INTO `cartable` VALUES (2, '3路', '赣D1222', '1-5-9-20-2-1', '北站', '北站');
INSERT INTO `cartable` VALUES (3, '4路', '赣D1233', '8-9-10-11-12-13-14', '花果园停车场（御江一品）', '公交公司');
INSERT INTO `cartable` VALUES (9, '5路', '赣D1002', '1-2-3-4-5-9-20-2-1', '北站', '北站');

-- ----------------------------
-- Table structure for classnav
-- ----------------------------
DROP TABLE IF EXISTS `classnav`;
CREATE TABLE `classnav`  (
  `classId` int(11) NOT NULL AUTO_INCREMENT COMMENT '导航分类id',
  `className` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '导航功能名称',
  `classUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'URl',
  `classQD` int(1) NOT NULL,
  PRIMARY KEY (`classId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classnav
-- ----------------------------
INSERT INTO `classnav` VALUES (1, '站点查询', 'zdcx', 0);
INSERT INTO `classnav` VALUES (2, '线路查询', 'xlcx', 0);
INSERT INTO `classnav` VALUES (3, '换乘查询', 'hccx', 0);
INSERT INTO `classnav` VALUES (4, '后台登录', 'login', 0);
INSERT INTO `classnav` VALUES (5, '新增车次', 'addCarPage', 1);
INSERT INTO `classnav` VALUES (6, '新增站点', 'addSitePage', 1);
INSERT INTO `classnav` VALUES (7, '车次信息查询', 'cxCar', 1);
INSERT INTO `classnav` VALUES (8, '站点信息查询', 'cxSite', 1);
INSERT INTO `classnav` VALUES (9, '退出登录', 'exit', 1);

-- ----------------------------
-- Table structure for sitelist
-- ----------------------------
DROP TABLE IF EXISTS `sitelist`;
CREATE TABLE `sitelist`  (
  `siteId` int(11) NOT NULL AUTO_INCREMENT COMMENT '站点iD',
  `siteName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '站点名称',
  PRIMARY KEY (`siteId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sitelist
-- ----------------------------
INSERT INTO `sitelist` VALUES (1, '北站');
INSERT INTO `sitelist` VALUES (2, '南站');
INSERT INTO `sitelist` VALUES (3, '602所');
INSERT INTO `sitelist` VALUES (4, '九江职业技术学院');
INSERT INTO `sitelist` VALUES (5, '7606站');
INSERT INTO `sitelist` VALUES (6, '7777站');
INSERT INTO `sitelist` VALUES (7, '北京站');
INSERT INTO `sitelist` VALUES (8, '花果园停车场（御江一品）');
INSERT INTO `sitelist` VALUES (9, '一七一医院');
INSERT INTO `sitelist` VALUES (10, '马狮商厦');
INSERT INTO `sitelist` VALUES (11, '公交公司');
INSERT INTO `sitelist` VALUES (12, '五丰宾馆');
INSERT INTO `sitelist` VALUES (13, '烟水亭');
INSERT INTO `sitelist` VALUES (14, '新桥头');
INSERT INTO `sitelist` VALUES (15, '沙子墩');
INSERT INTO `sitelist` VALUES (16, '甘棠公园');
INSERT INTO `sitelist` VALUES (17, '市工商局');
INSERT INTO `sitelist` VALUES (18, '老马渡');
INSERT INTO `sitelist` VALUES (19, '二亩地');
INSERT INTO `sitelist` VALUES (20, '大树下');
INSERT INTO `sitelist` VALUES (21, '国棉四厂');
INSERT INTO `sitelist` VALUES (22, '十里转盘');
INSERT INTO `sitelist` VALUES (23, '713厂');
INSERT INTO `sitelist` VALUES (24, '公交修理厂（慧龙家居）');
INSERT INTO `sitelist` VALUES (25, '仪表厂');
INSERT INTO `sitelist` VALUES (26, '职业技术学院');
INSERT INTO `sitelist` VALUES (27, '十里大楼');
INSERT INTO `sitelist` VALUES (28, '上海路');
INSERT INTO `sitelist` VALUES (29, '昌九路口');
INSERT INTO `sitelist` VALUES (30, '江西轻机');
INSERT INTO `sitelist` VALUES (31, '财兴公司');
INSERT INTO `sitelist` VALUES (32, '美庐乳业');
INSERT INTO `sitelist` VALUES (33, '江西制氧机厂（公交浔南停车场）');
INSERT INTO `sitelist` VALUES (34, '妙智');
INSERT INTO `sitelist` VALUES (35, '莲花乡');
INSERT INTO `sitelist` VALUES (36, '彭家河');
INSERT INTO `sitelist` VALUES (37, '莲花村');
INSERT INTO `sitelist` VALUES (38, '莲花洞');
INSERT INTO `sitelist` VALUES (39, '九江学院');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL,
  `userId` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userpassword` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Permission` int(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'user', '123456', 1);

SET FOREIGN_KEY_CHECKS = 1;
