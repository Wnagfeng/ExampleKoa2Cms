/*
 Navicat Premium Data Transfer

 Source Server         : mydatabase
 Source Server Type    : MySQL
 Source Server Version : 80300 (8.3.0)
 Source Host           : localhost:3306
 Source Schema         : cmsdata

 Target Server Type    : MySQL
 Target Server Version : 80300 (8.3.0)
 File Encoding         : 65001

 Date: 03/08/2024 15:30:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `goodsCount` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (2, '上衣', 14);
INSERT INTO `categories` VALUES (3, '裤子', 19);
INSERT INTO `categories` VALUES (4, '鞋子', 19);
INSERT INTO `categories` VALUES (5, '厨具', 18);
INSERT INTO `categories` VALUES (6, '家具', 18);
INSERT INTO `categories` VALUES (7, '床上用品', 19);
INSERT INTO `categories` VALUES (8, '女装', 35);
INSERT INTO `categories` VALUES (9, 'Polo', 0);
INSERT INTO `categories` VALUES (10, '数码产品', 0);
INSERT INTO `categories` VALUES (11, '保健品', 0);
INSERT INTO `categories` VALUES (12, '电子5', 0);
INSERT INTO `categories` VALUES (16, 'test2', 0);

-- ----------------------------
-- Table structure for city_sales
-- ----------------------------
DROP TABLE IF EXISTS `city_sales`;
CREATE TABLE `city_sales`  (
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `count` int NOT NULL,
  PRIMARY KEY (`address`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of city_sales
-- ----------------------------
INSERT INTO `city_sales` VALUES ('上海', 62239);
INSERT INTO `city_sales` VALUES ('北京', 6107);
INSERT INTO `city_sales` VALUES ('南京', 55683);
INSERT INTO `city_sales` VALUES ('天津', 5096);
INSERT INTO `city_sales` VALUES ('宁波', 66584);
INSERT INTO `city_sales` VALUES ('广州', 6364);
INSERT INTO `city_sales` VALUES ('成都', 23378);
INSERT INTO `city_sales` VALUES ('昆明', 9524);
INSERT INTO `city_sales` VALUES ('杭州', 19654);
INSERT INTO `city_sales` VALUES ('武汉', 28212);
INSERT INTO `city_sales` VALUES ('沈阳', 20900);
INSERT INTO `city_sales` VALUES ('深圳', 12480);
INSERT INTO `city_sales` VALUES ('苏州', 1136);
INSERT INTO `city_sales` VALUES ('西安', 64976);
INSERT INTO `city_sales` VALUES ('郑州', 53716);
INSERT INTO `city_sales` VALUES ('重庆', 60777);
INSERT INTO `city_sales` VALUES ('长沙', 4142);
INSERT INTO `city_sales` VALUES ('青岛', 9021);

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` tinyint(1) NULL DEFAULT NULL,
  `leader` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `parentid` int NULL DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parentId`(`parentid` ASC) USING BTREE,
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '人事部', NULL, '汪枫', 2, '2023-08-10 22:17:04', '2024-07-24 10:11:45');
INSERT INTO `department` VALUES (2, '总裁办', NULL, 'lily', 8, '2023-08-10 22:17:30', '2024-08-02 14:01:50');
INSERT INTO `department` VALUES (3, '开发部', NULL, 'CoderJoon', 1, '2023-08-10 22:18:08', '2024-08-01 15:21:46');
INSERT INTO `department` VALUES (7, '测试部门', NULL, '测试', 8, '2024-08-02 13:52:53', '2024-08-02 14:01:56');
INSERT INTO `department` VALUES (8, '1测试修改', NULL, '1', 8, '2024-08-02 13:53:48', '2024-08-02 14:01:59');
INSERT INTO `department` VALUES (9, '测试2', NULL, '测试2', 8, '2024-08-02 13:54:34', '2024-08-02 13:54:34');
INSERT INTO `department` VALUES (10, '测试', NULL, '1', 1, '2024-08-02 14:02:11', '2024-08-02 14:02:11');
INSERT INTO `department` VALUES (11, '测试111', NULL, '1212', 2, '2024-08-02 14:02:45', '2024-08-02 14:02:45');
INSERT INTO `department` VALUES (12, '分为氛围人', NULL, 'fe威锋网分wfewf', 2, '2024-08-02 14:02:53', '2024-08-02 14:02:53');
INSERT INTO `department` VALUES (14, 'f二位分为', NULL, '分为氛围', 3, '2024-08-02 14:03:04', '2024-08-02 14:03:04');
INSERT INTO `department` VALUES (15, '测啊v额外vvwvwe', NULL, 'v额外v为v', 1, '2024-08-02 14:05:21', '2024-08-02 14:05:21');

-- ----------------------------
-- Table structure for favor
-- ----------------------------
DROP TABLE IF EXISTS `favor`;
CREATE TABLE `favor`  (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `goodsFavor` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of favor
-- ----------------------------
INSERT INTO `favor` VALUES (2, '上衣', 6091);
INSERT INTO `favor` VALUES (3, '裤子', 4939);
INSERT INTO `favor` VALUES (4, '鞋子', 19647);
INSERT INTO `favor` VALUES (5, '厨具', 13906);
INSERT INTO `favor` VALUES (6, '家具', 15425);
INSERT INTO `favor` VALUES (7, '床上用品', 7307);
INSERT INTO `favor` VALUES (8, '女装', 19911);
INSERT INTO `favor` VALUES (9, 'Polo', NULL);

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory`  (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `goodsCount` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inventory
-- ----------------------------
INSERT INTO `inventory` VALUES (2, '上衣', 49749);
INSERT INTO `inventory` VALUES (3, '裤子', 84754);
INSERT INTO `inventory` VALUES (4, '鞋子', 58283);
INSERT INTO `inventory` VALUES (5, '厨具', 57354);
INSERT INTO `inventory` VALUES (6, '家具', 49002);
INSERT INTO `inventory` VALUES (7, '床上用品', 98579);
INSERT INTO `inventory` VALUES (8, '女装', 112268);
INSERT INTO `inventory` VALUES (9, 'Polo', NULL);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` tinyint(1) NULL DEFAULT NULL,
  `url` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sort` int NULL DEFAULT 100,
  `parentid` int NULL DEFAULT NULL,
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `url`(`url` ASC) USING BTREE,
  UNIQUE INDEX `icon`(`icon` ASC) USING BTREE,
  INDEX `parentId`(`parentid` ASC) USING BTREE,
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '系统总览', 1, '/main/analysis', 'el-icon-monitor', 1, NULL, NULL, '2023-08-10 12:58:15', '2023-08-10 12:58:15');
INSERT INTO `menu` VALUES (3, '商品统计', 2, '/main/analysis/dashboard', NULL, 102, 1, NULL, '2023-08-10 13:30:25', '2023-08-10 13:35:30');
INSERT INTO `menu` VALUES (4, '系统管理', 1, '/main/system', 'el-icon-setting', 2, NULL, NULL, '2023-08-10 13:32:06', '2023-08-10 13:36:11');
INSERT INTO `menu` VALUES (9, '用户管理', 2, '/main/system/user', NULL, 103, 4, NULL, '2023-08-10 13:36:29', '2023-08-10 13:36:29');
INSERT INTO `menu` VALUES (10, '部门管理', 2, '/main/system/department', NULL, 104, 4, NULL, '2023-08-10 13:37:40', '2023-08-10 13:37:40');
INSERT INTO `menu` VALUES (11, '菜单管理', 2, '/main/system/menu', NULL, 106, 4, NULL, '2023-08-10 13:38:45', '2023-08-10 13:38:45');
INSERT INTO `menu` VALUES (12, '角色管理', 2, '/main/system/role', NULL, 107, 4, NULL, '2023-08-10 13:39:22', '2023-08-10 13:39:22');
INSERT INTO `menu` VALUES (14, '商品中心', 1, '/main/product', 'el-icon-goods', 3, NULL, NULL, '2023-08-10 13:45:23', '2023-08-10 13:45:23');
INSERT INTO `menu` VALUES (15, '商品类别', 2, '/main/product/category', NULL, 108, 14, NULL, '2023-08-10 13:47:06', '2023-08-10 13:48:10');
INSERT INTO `menu` VALUES (16, '商品信息', 2, '/main/product/goods', NULL, 109, 14, NULL, '2023-08-10 13:48:02', '2023-08-10 13:48:02');
INSERT INTO `menu` VALUES (21, '创建用户', 3, NULL, NULL, 112, 9, 'system:users:create', '2023-08-10 13:54:09', '2023-08-10 14:35:34');
INSERT INTO `menu` VALUES (22, '删除用户', 3, NULL, NULL, 113, 9, 'system:users:delete', '2023-08-10 13:55:43', '2023-08-10 14:35:43');
INSERT INTO `menu` VALUES (23, '修改用户', 3, NULL, NULL, 114, 9, 'system:role:update', '2023-08-10 13:55:54', '2023-08-10 14:37:26');
INSERT INTO `menu` VALUES (24, '查询用户', 3, NULL, NULL, 115, 9, 'system:role:query', '2023-08-10 13:56:10', '2023-08-10 14:37:49');
INSERT INTO `menu` VALUES (25, '创建部门', 3, NULL, NULL, 116, 10, 'system:department:create', '2023-08-10 13:56:52', '2023-08-10 14:37:58');
INSERT INTO `menu` VALUES (26, '删除部门', 3, NULL, NULL, 117, 10, 'system:department:delete', '2023-08-10 13:57:07', '2023-08-10 14:38:00');
INSERT INTO `menu` VALUES (27, '修改部门', 3, NULL, NULL, 118, 10, 'system:department:update', '2023-08-10 13:57:18', '2023-08-10 14:38:14');
INSERT INTO `menu` VALUES (28, '查询部门', 3, NULL, NULL, 119, 10, 'system:department:query', '2023-08-10 13:57:26', '2023-08-10 14:38:16');
INSERT INTO `menu` VALUES (29, '创建菜单', 3, NULL, NULL, 120, 11, 'system:menu:create', '2023-08-10 13:58:18', '2023-08-10 14:38:24');
INSERT INTO `menu` VALUES (30, '删除菜单', 3, NULL, NULL, 121, 11, 'system:menu:delete', '2023-08-10 13:58:31', '2023-08-10 14:38:35');
INSERT INTO `menu` VALUES (31, '修改菜单', 3, NULL, NULL, 122, 11, 'system:menu:update', '2023-08-10 13:58:38', '2023-08-10 14:38:37');
INSERT INTO `menu` VALUES (32, '查询菜单', 3, NULL, NULL, 123, 11, 'system:menu:query', '2023-08-10 13:59:30', '2023-08-10 14:38:47');
INSERT INTO `menu` VALUES (33, '创建角色', 3, NULL, NULL, 124, 12, 'system:role:create', '2023-08-10 14:00:04', '2023-08-10 14:38:57');
INSERT INTO `menu` VALUES (34, '删除角色', 3, NULL, NULL, 125, 12, 'system:role:delete', '2023-08-10 14:00:29', '2023-08-10 14:39:04');
INSERT INTO `menu` VALUES (35, '修改角色', 3, NULL, NULL, 126, 12, 'system:role:update', '2023-08-10 14:00:45', '2023-08-10 14:39:18');
INSERT INTO `menu` VALUES (36, '查询角色', 3, NULL, NULL, 127, 12, 'system:role:query', '2023-08-10 14:00:55', '2023-08-10 14:39:25');
INSERT INTO `menu` VALUES (37, '创建类别', 3, NULL, NULL, 128, 15, 'system:category:create', '2023-08-10 14:02:52', '2023-08-10 14:40:10');
INSERT INTO `menu` VALUES (38, '删除类别', 3, NULL, NULL, 129, 15, 'system:category:delete', '2023-08-10 14:03:22', '2023-08-10 14:40:19');
INSERT INTO `menu` VALUES (39, '修改类别', 3, NULL, NULL, 130, 15, 'system:category:update', '2023-08-10 14:03:36', '2023-08-10 14:40:31');
INSERT INTO `menu` VALUES (40, '查询类别', 3, NULL, NULL, 131, 15, 'system:category:query', '2023-08-10 14:03:44', '2023-08-10 14:40:42');
INSERT INTO `menu` VALUES (41, '创建商品', 3, NULL, NULL, 132, 16, 'system:goods:create', '2023-08-10 14:04:51', '2023-08-10 14:40:43');
INSERT INTO `menu` VALUES (42, '删除商品', 3, NULL, NULL, 133, 16, 'system:goods:delete', '2023-08-10 14:05:01', '2023-08-10 14:40:51');
INSERT INTO `menu` VALUES (43, '修改商品', 3, NULL, NULL, 134, 16, 'system:goods:update', '2023-08-10 14:05:10', '2023-08-10 14:40:58');
INSERT INTO `menu` VALUES (44, '查询商品', 3, NULL, NULL, 135, 16, 'system:goods:query', '2023-08-10 14:05:18', '2023-08-10 14:41:07');
INSERT INTO `menu` VALUES (53, '测试修改', 2, '/product/goods1', NULL, 104, 3, NULL, '2024-07-27 07:13:59', '2024-07-27 07:55:38');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `oldPrice` decimal(10, 2) NULL DEFAULT NULL,
  `newPrice` decimal(10, 2) NULL DEFAULT NULL,
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `status` int NULL DEFAULT NULL,
  `imgUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `inventoryCount` int NULL DEFAULT NULL,
  `saleCount` int NULL DEFAULT NULL,
  `favorCount` int NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `categoryId` int NULL DEFAULT NULL,
  `createAt` datetime NULL DEFAULT NULL,
  `updateAt` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `products_ibfk_1`(`categoryId` ASC) USING BTREE,
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 178 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, '吊带背心女夏2018秋季新款内搭吊带衫短款性感修身针织打底衫上衣显瘦', 43.00, 30.00, '吊带背心女夏2018秋季新款内搭吊带衫短款性感修身针织打底衫上衣显瘦', 1, 'http://s11.mogucdn.com/mlcdn/17f85e/180927_5i77e04lhaalbg3dai0j4588lbahh_640x960.jpg_560x999.jpg', 6285, 2, 3, '天津', 6, '2021-04-30 13:43:16', '2021-04-30 13:43:16');
INSERT INTO `products` VALUES (7, '秋装女2018新款早秋女装裙子韩版针织连衣裙+衬衫上衣时尚套装', 127.00, 89.00, '秋装女2018新款早秋女装裙子韩版针织连衣裙+衬衫上衣时尚套装', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180828_550k23i82cbibh32602fl43jc9aid_800x1200.jpg_560x999.jpg', 4044, 32070, 179, '上海', 7, '2021-04-30 13:40:30', '2021-04-30 13:40:30');
INSERT INTO `products` VALUES (8, '套装女春秋2018新款时尚复古气质个性连帽卫衣两件套', 211.00, 148.00, '套装女春秋2018新款时尚复古气质个性连帽卫衣两件套', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180825_4figj590flej05g556d6ll8ka09a7_640x902.jpg_560x999.jpg', 3703, 28990, 93, '南京', 3, '2021-04-30 13:40:30', '2021-04-30 13:40:30');
INSERT INTO `products` VALUES (11, '时尚套装两件套2018韩版网红社会宽松连帽卫衣+高腰显瘦开叉半身裙学院风休闲秋装女套装新款', 199.00, 98.00, '时尚套装两件套2018韩版网红社会宽松连帽卫衣+高腰显瘦开叉半身裙学院风休闲秋装女套装新款', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180914_3aabiea9jgkj2a7hlgfie4011bljj_640x960.jpg_560x999.jpg', 1092, 23765, 276, '郑州', 6, '2021-04-30 13:40:30', '2021-04-30 13:40:30');
INSERT INTO `products` VALUES (13, '哈伦裤女秋季2018新款韩版学生显瘦雪纺薄款休闲裤女宽松黑色西装西裤九分裤夏小脚萝卜烟管裤', 69.00, 48.00, '哈伦裤女秋季2018新款韩版学生显瘦雪纺薄款休闲裤女宽松黑色西装西裤九分裤夏小脚萝卜烟管裤', 1, 'http://s11.mogucdn.com/mlcdn/17f85e/180902_2cefh0g12jk4i71bg270843d39l8j_640x960.jpg_560x999.jpg', 5825, 2191, 4040, '广州', 2, '2021-04-30 13:40:30', '2021-04-30 13:40:30');
INSERT INTO `products` VALUES (14, '2018春秋季韩版新款条纹外穿内搭上衣打底吊带百搭无袖T恤针织背心女', 41.00, 29.00, '2018春秋季韩版新款条纹外穿内搭上衣打底吊带百搭无袖T恤针织背心女', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180521_5ijdcl888016gfaag2id2e0g8l19j_640x960.jpg_560x999.jpg', 6201, 2150, 10947, '西安', 5, '2021-04-30 13:40:30', '2021-04-30 13:40:30');
INSERT INTO `products` VALUES (15, '雪纺阔腿裤女夏2018新款裤子黑色韩版休闲裤女七分宽松直筒高腰秋冬秋季九分宽腿裤', 69.00, 48.00, '雪纺阔腿裤女夏2018新款裤子黑色韩版休闲裤女七分宽松直筒高腰秋冬秋季九分宽腿裤', 1, 'http://s3.mogucdn.com/mlcdn/17f85e/180902_1gd2jld5b1g6dfl57da4jdj07alac_640x960.jpg_560x999.jpg', 8517, 1984, 5041, '长沙', 6, '2021-04-30 13:40:30', '2021-04-30 13:40:30');
INSERT INTO `products` VALUES (16, '长袖/短袖T恤女2018新款棉质学生宽松韩版夏季可爱卡通猫咪印花纯色百搭打底衫上衣女潮', 52.00, 52.00, '长袖/短袖T恤女2018新款棉质学生宽松韩版夏季可爱卡通猫咪印花纯色百搭打底衫上衣女潮', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180423_54e410ebffkj73cah5e513584b5fb_800x800.jpg_560x999.jpg', 4835, 1856, 3658, '昆明', 4, '2021-04-30 13:40:30', '2021-04-30 13:40:30');
INSERT INTO `products` VALUES (17, '网红同款实拍秋季女装2018新款女初恋复古中长款针织连衣裙半身裙时尚套装两件套', 369.00, 119.00, '网红同款实拍秋季女装2018新款女初恋复古中长款针织连衣裙半身裙时尚套装两件套', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180917_24666f4kgi486191382ikh2lhc8cg_640x862.jpg_560x999.jpg', 7956, 21355, 162, '武汉', 3, '2021-04-30 13:40:30', '2021-04-30 13:40:30');
INSERT INTO `products` VALUES (18, '2018秋冬新款ins超火针织时尚两件套小香风套装女', 154.00, 108.00, '2018秋冬新款ins超火针织时尚两件套小香风套装女', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180815_81dj3id2i70kfeh4eekd94k9ij0k4_640x913.jpg_560x999.jpg', 2729, 20288, 9, '重庆', 8, '2021-04-30 13:40:30', '2021-04-30 13:40:30');
INSERT INTO `products` VALUES (22, 'chic港味秋装女套装新款2018韩版格子西装外套+显瘦高腰破洞小脚裤学院风时尚套装两件套', 79.00, 55.00, 'chic港味秋装女套装新款2018韩版格子西装外套+显瘦高腰破洞小脚裤学院风时尚套装两件套', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180914_4k0k14g1608gc04k3jh1c6jac47fi_640x960.jpg_560x999.jpg', 4106, 19993, 173, '郑州', 7, '2021-04-30 13:40:30', '2021-04-30 13:40:30');
INSERT INTO `products` VALUES (23, '杨幂明星同款2018新款白色ins超火短袖t恤女字母宽松纯棉百搭上衣', 54.00, 37.00, '杨幂明星同款2018新款白色ins超火短袖t恤女字母宽松纯棉百搭上衣', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180624_6jb1g4kg6i1ab4i4g0echaia49i87_640x960.png_560x999.jpg', 7052, 1557, 1561, '沈阳', 8, '2021-04-30 13:40:30', '2021-04-30 13:40:30');
INSERT INTO `products` VALUES (24, '2018春秋季新款韩版原宿风闺蜜装圆领套头短袖t恤女中长款纯色百搭上衣宽松大码学生半袖体恤', 70.00, 49.00, '2018春秋季新款韩版原宿风闺蜜装圆领套头短袖t恤女中长款纯色百搭上衣宽松大码学生半袖体恤', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180514_104a5k2f09808h371j8b3h299e870_640x960.jpg_560x999.jpg', 4621, 1532, 3961, '宁波', 4, '2021-04-30 13:40:30', '2021-04-30 13:40:30');
INSERT INTO `products` VALUES (26, '2018春秋季新款女装韩版宽松短袖t恤女chic半袖打底条纹体恤上衣', 50.00, 35.00, '2018春秋季新款女装韩版宽松短袖t恤女chic半袖打底条纹体恤上衣', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180512_3e1962h3haa801048j1gi21024031_640x960.jpg_560x999.jpg', 3488, 1323, 1785, '宁波', 4, '2021-04-30 13:40:30', '2021-04-30 13:40:30');
INSERT INTO `products` VALUES (27, '中长款长袖连衣裙秋装新款2018韩版休闲胖mm大码女装裙子女学生宽松松垮垮中长款卫衣裙外套', 168.00, 54.00, '中长款长袖连衣裙秋装新款2018韩版休闲胖mm大码女装裙子女学生宽松松垮垮中长款卫衣裙外套', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180916_4di1ek7k3kha3klk02185678b025d_640x960.jpg_560x999.jpg', 7620, 19045, 156, '宁波', 4, '2021-04-30 13:40:30', '2021-04-30 13:40:30');
INSERT INTO `products` VALUES (28, '2018秋新款韩版时尚简约系带显瘦条纹系带西服套装女', 154.00, 108.00, '2018秋新款韩版时尚简约系带显瘦条纹系带西服套装女', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180815_7ff4fbk769cc2d1c2l494ie7j5jke_640x908.jpg_560x999.jpg', 10501, 17587, 22, '宁波', 3, '2021-04-30 13:40:30', '2021-04-30 13:40:30');
INSERT INTO `products` VALUES (29, '送运费险短袖t恤女2018夏季新款女装韩版时尚气质百搭ulzzang学生百搭小心机纯色上衣', 57.00, 40.00, '送运费险短袖t恤女2018夏季新款女装韩版时尚气质百搭ulzzang学生百搭小心机纯色上衣', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180621_00e5i2711h0de8lhe4568kkie9d90_640x960.jpg_560x999.jpg', 10812, 1300, 2017, '郑州', 8, '2021-04-30 13:40:30', '2021-04-30 13:40:30');
INSERT INTO `products` VALUES (30, '【时尚套装】2018秋款新款牛仔背带裙女夏吊带连衣裙搭配T恤新款小清新两件套女', 99.00, 69.00, '【时尚套装】2018秋款新款牛仔背带裙女夏吊带连衣裙搭配T恤新款小清新两件套女', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180821_044abj5e7h2icfgijb053661lle8f_800x800.jpg_560x999.jpg', 4166, 1136, 2517, '苏州', 8, '2021-04-30 13:40:30', '2021-04-30 13:40:30');
INSERT INTO `products` VALUES (31, '秋季新款套装两件套秋装2018新款韩版chic泡泡袖衬衫上衣+高腰显瘦牛仔裤学院风时尚套装', 69.00, 48.00, '秋季新款套装两件套秋装2018新款韩版chic泡泡袖衬衫上衣+高腰显瘦牛仔裤学院风时尚套装', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180910_72kcibhh4i275l73ik681kbed19aj_640x960.jpg_560x999.jpg', 5513, 17225, 2, '西安', 5, '2021-04-30 13:40:30', '2021-04-30 13:40:30');
INSERT INTO `products` VALUES (32, '2018新款时尚百搭黑色宽松机车皮夹克+网纱半身裙套装两件套', 226.00, 158.00, '2018新款时尚百搭黑色宽松机车皮夹克+网纱半身裙套装两件套', 1, 'http://s3.mogucdn.com/mlcdn/55cf19/180917_7e2fdc2d8131698jkg69c9586lkel_640x960.jpg_560x999.jpg', 1589, 16985, 28, '西安', 8, '2021-04-30 13:40:30', '2021-04-30 13:40:30');
INSERT INTO `products` VALUES (33, '2018新款女装秋装简约衬衫女长袖雪纺上衣百搭纯色韩范打底衬衣女', 80.00, 56.00, '2018新款女装秋装简约衬衫女长袖雪纺上衣百搭纯色韩范打底衬衣女', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180411_7ei8d3aabhkkg5b6312gh1ckak8f1_640x960.jpg_560x999.jpg', 2145, 958, 3203, '青岛', 6, '2021-04-30 13:40:30', '2021-04-30 13:40:30');
INSERT INTO `products` VALUES (34, '雪纺阔腿裤女春夏高腰黑色韩版2018新款九分宽松显瘦度假沙滩裤裙', 70.00, 49.00, '雪纺阔腿裤女春夏高腰黑色韩版2018新款九分宽松显瘦度假沙滩裤裙', 1, 'http://s3.mogucdn.com/mlcdn/17f85e/180529_3bfb1bf04i91k9iaaj78ck4k4k814_640x960.jpg_560x999.jpg', 4174, 814, 1941, '成都', 8, '2021-04-30 13:40:30', '2021-04-30 13:40:30');
INSERT INTO `products` VALUES (35, '2018夏装新款韩范v领交叉粉色短袖T恤女装纯色半截袖小心机上衣', 57.00, 40.00, '2018夏装新款韩范v领交叉粉色短袖T恤女装纯色半截袖小心机上衣', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180620_19fk93bjc8adfg9h7ak978409kei9_640x960.jpg_560x999.jpg', 5864, 710, 1255, '北京', 8, '2021-04-30 13:40:30', '2021-04-30 13:40:30');
INSERT INTO `products` VALUES (36, '高领黑白条纹长袖t恤女2018春秋新款韩版宽松百搭学生内搭打底衫', 43.00, 30.00, '高领黑白条纹长袖t恤女2018春秋新款韩版宽松百搭学生内搭打底衫', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180126_39bjhej66kb2l48554kk0ld4d2fdc_640x960.jpg_560x999.jpg', 7708, 657, 4585, '长沙', 8, '2021-04-30 13:40:30', '2021-04-30 13:40:30');
INSERT INTO `products` VALUES (37, '秋装女卫衣套装新款2018韩版印花连帽卫衣上衣+显瘦高腰网纱半身裙学生裙子时尚套装两件套', 70.00, 49.00, '秋装女卫衣套装新款2018韩版印花连帽卫衣上衣+显瘦高腰网纱半身裙学生裙子时尚套装两件套', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180913_00b8bg3cg308c9jhcakhj0c7fhbih_640x960.jpg_560x999.jpg', 5660, 16428, 20, '重庆', 7, '2021-04-30 13:41:05', '2021-04-30 13:41:05');
INSERT INTO `products` VALUES (38, '时尚套装两件套网红同款2018秋装女套装新款显瘦中长款字母印花宽松套头卫衣无敌修身打底长裤', 119.00, 84.00, '时尚套装两件套网红同款2018秋装女套装新款显瘦中长款字母印花宽松套头卫衣无敌修身打底长裤', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180914_1lj3hk5hek8266fdf77elg1h78fg8_640x960.jpg_560x999.jpg', 2507, 15999, 49, '南京', 8, '2021-04-30 13:41:05', '2021-04-30 13:41:05');
INSERT INTO `products` VALUES (39, '2018夏装新款韩范t恤女短袖宽松百搭韩版学生半袖ins超火的上衣体侐潮', 50.00, 50.00, '2018夏装新款韩范t恤女短袖宽松百搭韩版学生半袖ins超火的上衣体侐潮', 1, 'http://s11.mogucdn.com/mlcdn/55cf19/180620_81idi257gjk9kl4i61bel5kak5362_640x960.jpg_560x999.jpg', 2165, 649, 969, '西安', 8, '2021-04-30 13:41:05', '2021-04-30 13:41:05');
INSERT INTO `products` VALUES (40, '2件50元qlz夏季2018情侣装新款宽松女韩版潮学生百搭网红同款短袖T恤上衣小哥哥印花', 40.00, 28.00, '2件50元qlz夏季2018情侣装新款宽松女韩版潮学生百搭网红同款短袖T恤上衣小哥哥印花', 1, 'http://s11.mogucdn.com/mlcdn/17f85e/180607_835hbfgcffaijjil95428cii1k9ef_640x960.jpg_560x999.jpg', 3160, 595, 1115, '天津', 8, '2021-04-30 13:41:05', '2021-04-30 13:41:05');
INSERT INTO `products` VALUES (41, '早秋新款2018韩版ins超火港风条纹长袖雪纺衬衫气质百搭宽松显瘦chic上衣慵懒衬衣女潮', 150.00, 39.00, '早秋新款2018韩版ins超火港风条纹长袖雪纺衬衫气质百搭宽松显瘦chic上衣慵懒衬衣女潮', 1, 'http://s11.mogucdn.com/mlcdn/55cf19/180911_77hkba33lh2k52al9h406j8fl6ead_798x1197.jpg_560x999.jpg', 6708, 15609, 48, '沈阳', 2, '2021-04-30 13:41:05', '2021-04-30 13:41:05');
INSERT INTO `products` VALUES (42, '珊珊2018秋装新款韩版百搭修身显瘦气质甜美荷叶边下摆初恋女裙蕾丝拼接长袖针织连衣裙', 155.00, 79.00, '珊珊2018秋装新款韩版百搭修身显瘦气质甜美荷叶边下摆初恋女裙蕾丝拼接长袖针织连衣裙', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180906_09ce0e8a14l71k3ll34dah14j80kd_640x960.jpg_560x999.jpg', 10766, 11984, 111, '西安', 8, '2021-04-30 13:41:05', '2021-04-30 13:41:05');
INSERT INTO `products` VALUES (43, '宽松白色短袖T恤女韩版半袖上衣印花2018夏季女装新款班服ins时尚百搭学生衣服大码体恤', 43.00, 30.00, '宽松白色短袖T恤女韩版半袖上衣印花2018夏季女装新款班服ins时尚百搭学生衣服大码体恤', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180605_445c0g87j0k130ja2di46cj9403h7_800x1200.jpg_560x999.jpg', 2597, 483, 377, '西安', 6, '2021-04-30 13:41:05', '2021-04-30 13:41:05');
INSERT INTO `products` VALUES (44, '2018春夏新款女装宽松潮V领破洞镂空字母印花短袖T恤', 56.00, 39.00, '2018春夏新款女装宽松潮V领破洞镂空字母印花短袖T恤', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180514_1429jg0febkbdfk1ab3c8clah84cb_640x960.jpg_560x999.jpg', 2824, 443, 810, '天津', 3, '2021-04-30 13:41:05', '2021-04-30 13:41:05');
INSERT INTO `products` VALUES (45, '2018春夏装新款上衣圆领休闲百搭韩版打底衫纯色白色棉t恤女短袖宽松学生半袖tee情侣男', 57.00, 40.00, '2018春夏装新款上衣圆领休闲百搭韩版打底衫纯色白色棉t恤女短袖宽松学生半袖tee情侣男', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180122_5dh2dl7862136dkcfh0haaalc3517_640x960.jpg_560x999.jpg', 10920, 423, 1185, '天津', 7, '2021-04-30 13:41:05', '2021-04-30 13:41:05');
INSERT INTO `products` VALUES (46, '2018春夏新款韩范长袖白色衬衫女百搭宽松中长款棉麻立领韩版打底衬衣', 70.00, 49.00, '2018春夏新款韩范长袖白色衬衫女百搭宽松中长款棉麻立领韩版打底衬衣', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180514_15272difihj7hg63gkakkg00hciaf_640x960.jpg_560x999.jpg', 7991, 377, 1167, '武汉', 2, '2021-04-30 13:41:05', '2021-04-30 13:41:05');
INSERT INTO `products` VALUES (47, '明星同款2018秋季新款韩版女装高腰裙子针织毛线百搭秋冬中长款显瘦A字半身裙', 169.00, 69.00, '明星同款2018秋季新款韩版女装高腰裙子针织毛线百搭秋冬中长款显瘦A字半身裙', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180916_7j0dh9d7a1dlac84bf3jebj39fil0_640x812.jpg_560x999.jpg', 6937, 11717, 232, '宁波', 5, '2021-04-30 13:41:05', '2021-04-30 13:41:05');
INSERT INTO `products` VALUES (48, '2018秋季新款韩范清新套装宽松圆领可爱学生条纹上衣配复古高腰直筒裤子破洞牛仔裤时尚两件套', 79.00, 55.00, '2018秋季新款韩范清新套装宽松圆领可爱学生条纹上衣配复古高腰直筒裤子破洞牛仔裤时尚两件套', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180901_024lb916jjb699j4dg56048e51jj6_640x960.jpg_560x999.jpg', 5298, 10152, 231, '重庆', 4, '2021-04-30 13:41:05', '2021-04-30 13:41:05');
INSERT INTO `products` VALUES (49, '【两件59元】【 降价啦！】2018夏装新款高品质纯棉t恤女短袖白色圆领宽松学生半袖上衣', 56.00, 39.00, '【两件59元】【 降价啦！】2018夏装新款高品质纯棉t恤女短袖白色圆领宽松学生半袖上衣', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180302_58kc4dk5820fj4ihjdh3e4k2b3h4e_640x960.jpg_560x999.jpg', 5642, 350, 5082, '重庆', 6, '2021-04-30 13:41:05', '2021-04-30 13:41:05');
INSERT INTO `products` VALUES (50, '2018新款早春款韩版百搭宽松体恤刺绣字母圆领短袖T恤女学生上衣服洋气小衫', 57.00, 40.00, '2018新款早春款韩版百搭宽松体恤刺绣字母圆领短袖T恤女学生上衣服洋气小衫', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180416_4f73g9612ge2jja058g0gkhia406f_640x960.jpg_560x999.jpg', 4781, 335, 754, '广州', 5, '2021-04-30 13:41:05', '2021-04-30 13:41:05');
INSERT INTO `products` VALUES (51, '实拍韩版2018秋冬新款学院风百搭高腰显瘦PU皮裙伞裙系带防走光显瘦半身裙短裙', 169.00, 59.00, '实拍韩版2018秋冬新款学院风百搭高腰显瘦PU皮裙伞裙系带防走光显瘦半身裙短裙', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180916_196h301k3fje7762dkhi5l6l99099_640x982.jpg_560x999.jpg', 1578, 9714, 9, '上海', 2, '2021-04-30 13:41:05', '2021-04-30 13:41:05');
INSERT INTO `products` VALUES (53, '2018夏装新款修身显瘦性感拼色针织女短款韩版休闲打底衫上衣吊带背心', 43.00, 30.00, '2018夏装新款修身显瘦性感拼色针织女短款韩版休闲打底衫上衣吊带背心', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180605_25ah46f6e61dk43g22i3cf6dckcf6_640x960.jpg_560x999.jpg', 6615, 307, 740, '武汉', 3, '2021-04-30 13:41:05', '2021-04-30 13:41:05');
INSERT INTO `products` VALUES (54, '纯棉白色t恤女夏短袖修身短款半袖2018新款夏装紧身黑色体恤上衣长袖秋冬', 57.00, 40.00, '纯棉白色t恤女夏短袖修身短款半袖2018新款夏装紧身黑色体恤上衣长袖秋冬', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180925_17cd358662ffc9jhah6bf6bl99c75_640x960.jpg_560x999.jpg', 6659, 290, 535, '成都', 4, '2021-04-30 13:41:05', '2021-04-30 13:41:05');
INSERT INTO `products` VALUES (55, '2018夏季新款紫色百搭款套头宽松学生T恤女上衣潮4色', 70.00, 49.00, '2018夏季新款紫色百搭款套头宽松学生T恤女上衣潮4色', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180611_8ahf5d6jh7gb9bjfll1f5bi33gil1_640x960.jpg_560x999.jpg', 3078, 198, 1238, '成都', 8, '2021-04-30 13:41:05', '2021-04-30 13:41:05');
INSERT INTO `products` VALUES (57, '2018秋季新品韩范休闲宽松百搭牛仔外套气质显瘦中长款吊带连衣裙套装', 84.00, 59.00, '2018秋季新品韩范休闲宽松百搭牛仔外套气质显瘦中长款吊带连衣裙套装', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180901_60e7c737k66c4i5f7bj50l38c91ie_640x960.jpg_560x999.jpg', 2856, 8988, 166, '成都', 8, '2021-04-30 13:41:05', '2021-04-30 13:41:05');
INSERT INTO `products` VALUES (59, '2018夏季新款纯色体恤韩版白色短袖T恤女百搭学生黑色宽松圆领上衣显瘦打底衫', 56.00, 39.00, '2018夏季新款纯色体恤韩版白色短袖T恤女百搭学生黑色宽松圆领上衣显瘦打底衫', 1, 'http://s3.mogucdn.com/p2/170310/89187459_176ced5dd1lk16ggeadh7j6i3hg8g_640x960.jpg_560x999.jpg', 4234, 158, 1125, '上海', 3, '2021-04-30 13:41:05', '2021-04-30 13:41:05');
INSERT INTO `products` VALUES (60, '2018秋冬新款网红性感欧根纱蝴蝶领结上衣+高腰显瘦半身皮裙2件套套装', 142.00, 99.00, '2018秋冬新款网红性感欧根纱蝴蝶领结上衣+高腰显瘦半身皮裙2件套套装', 1, 'http://s3.mogucdn.com/mlcdn/55cf19/180827_1l1278e9l144ih07kjdbk58ea0046_640x960.jpg_560x999.jpg', 3738, 135, 457, '郑州', 7, '2021-04-30 13:41:05', '2021-04-30 13:41:05');
INSERT INTO `products` VALUES (61, '2018新款秋装衬衫+收腰马甲+休闲裤名媛超火时尚套装女洋气三件套女J14', 157.00, 110.00, '2018新款秋装衬衫+收腰马甲+休闲裤名媛超火时尚套装女洋气三件套女J14', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180813_587cl37ikbj5ah47lbi0c098eehk4_640x960.jpg_560x999.jpg', 8709, 8079, 255, '上海', 5, '2021-04-30 13:41:05', '2021-04-30 13:41:05');
INSERT INTO `products` VALUES (62, '现货秒发~2018春秋新款套装条纹衬衫不规则拼接V领破马甲烟灰色铅笔小脚牛仔裤套装三件套', 99.00, 69.00, '现货秒发~2018春秋新款套装条纹衬衫不规则拼接V领破马甲烟灰色铅笔小脚牛仔裤套装三件套', 1, 'http://s11.mogucdn.com/mlcdn/c45406/170925_1kjjfb8iae7dcdjgc131l246bki3l_640x960.jpg_560x999.jpg', 1606, 5289, 1987, '成都', 7, '2021-04-30 13:41:05', '2021-04-30 13:41:05');
INSERT INTO `products` VALUES (64, '春秋2018ins超火的新款韩版简约百搭宽松字母印花长袖T恤学生休闲体恤显瘦上衣潮', 40.00, 40.00, '春秋2018ins超火的新款韩版简约百搭宽松字母印花长袖T恤学生休闲体恤显瘦上衣潮', 1, 'http://s11.mogucdn.com/mlcdn/55cf19/180823_65bk4i19ff244if74226eeb4lchdc_640x960.jpg_560x999.jpg', 10261, 120, 320, '南京', 2, '2021-04-30 13:41:05', '2021-04-30 13:41:05');
INSERT INTO `products` VALUES (65, '2018夏季新款韩版丝绸粉色ins超火丝滑德芙束腿九分裤休闲运动裤女潮', 70.00, 49.00, '2018夏季新款韩版丝绸粉色ins超火丝滑德芙束腿九分裤休闲运动裤女潮', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180517_45lgaj2gf08h8egc4820ek82bi18i_640x960.jpg_560x999.jpg', 6077, 104, 430, '深圳', 5, '2021-04-30 13:41:05', '2021-04-30 13:41:05');
INSERT INTO `products` VALUES (66, '2018夏装新款高品质短袖t恤女纯棉圆领宽松显瘦韩版学生女装', 56.00, 39.00, '2018夏装新款高品质短袖t恤女纯棉圆领宽松显瘦韩版学生女装', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180305_2ljefab431fgach9g3b1gl72li11f_640x960.jpg_560x999.jpg', 8522, 93, 661, '沈阳', 4, '2021-04-30 13:41:05', '2021-04-30 13:41:05');
INSERT INTO `products` VALUES (69, '【两件79元】半高领打底衫女2018新款秋冬白色加绒加厚紧身长袖t恤韩版ins超火的上衣', 49.00, 49.00, '【两件79元】半高领打底衫女2018新款秋冬白色加绒加厚紧身长袖t恤韩版ins超火的上衣', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180915_6d523b1i35c6873a212396j3c1652_800x800.jpg_560x999.jpg', 9009, 126, 85, '南京', 5, '2021-04-30 13:41:37', '2021-04-30 13:41:37');
INSERT INTO `products` VALUES (70, '2件50元班服夏季t恤女短袖宽松学生情侣装夏装2018新款韩版ulzzang百搭衣服潮宽松', 40.00, 28.00, '2件50元班服夏季t恤女短袖宽松学生情侣装夏装2018新款韩版ulzzang百搭衣服潮宽松', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180416_359hjeljbc1djcf29db75b11j401c_640x960.jpg_560x999.jpg', 7193, 83, 450, '宁波', 8, '2021-04-30 13:41:37', '2021-04-30 13:41:37');
INSERT INTO `products` VALUES (72, '2018秋季新款韩版百搭格子长袖衬衫+前短后长针织气质开衫外套+高腰直筒九分牛仔裤三件套装', 84.00, 59.00, '2018秋季新款韩版百搭格子长袖衬衫+前短后长针织气质开衫外套+高腰直筒九分牛仔裤三件套装', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180808_600abce0g8dc8i4f6ic7k27i7837l_640x960.jpg_560x999.jpg', 10195, 4886, 49, '杭州', 7, '2021-04-30 13:41:37', '2021-04-30 13:41:37');
INSERT INTO `products` VALUES (74, '【59元2件】条纹纯棉运动短裤女2018春夏新款韩版宽松显瘦休闲裤学生跑步三分裤', 50.00, 35.00, '【59元2件】条纹纯棉运动短裤女2018春夏新款韩版宽松显瘦休闲裤学生跑步三分裤', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180522_21l7lb0acallifbl6d6ael74h45c3_640x960.jpg_560x999.jpg', 3228, 72, 88, '杭州', 5, '2021-04-30 13:41:38', '2021-04-30 13:41:38');
INSERT INTO `products` VALUES (75, '黑色半高领打底衫女修身长袖上衣秋冬百搭中领纯棉秋衣2018春秋新款薄', 85.00, 60.00, '黑色半高领打底衫女修身长袖上衣秋冬百搭中领纯棉秋衣2018春秋新款薄', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180730_697eaeelf9g5e41j5f52b14ggej8f_640x960.jpg_560x999.jpg', 7644, 72, 77, '成都', 7, '2021-04-30 13:41:38', '2021-04-30 13:41:38');
INSERT INTO `products` VALUES (77, '运动套装女春秋韩版2018新款女装春装时髦休闲衣服薄款卫衣两件套', 79.00, 79.00, '运动套装女春秋韩版2018新款女装春装时髦休闲衣服薄款卫衣两件套', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180226_2hb2b3991i5kj050e4c9cfk985ab2_800x800.jpg_560x999.jpg', 2109, 4647, 21, '重庆', 2, '2021-04-30 13:41:38', '2021-04-30 13:41:38');
INSERT INTO `products` VALUES (79, '2018新款秋装女装上衣服原宿风百搭时尚胖妹妹姐妹装体恤衫韩版女学生闺蜜装大码简约印花t恤', 40.00, 40.00, '2018新款秋装女装上衣服原宿风百搭时尚胖妹妹姐妹装体恤衫韩版女学生闺蜜装大码简约印花t恤', 1, 'http://s3.mogucdn.com/mlcdn/55cf19/180823_657b62gkeca17eb91h6j9c8k1h8le_640x960.jpg_560x999.jpg', 8018, 59, 94, '西安', 3, '2021-04-30 13:41:38', '2021-04-30 13:41:38');
INSERT INTO `products` VALUES (81, '2018秋季新款时尚套装宽松海马毛毛衣女学院风百搭黑色牛仔背带裤两件套', 99.00, 69.00, '2018秋季新款时尚套装宽松海马毛毛衣女学院风百搭黑色牛仔背带裤两件套', 1, 'http://s3.mogucdn.com/mlcdn/55cf19/180903_2ahjib119c3433ehidb4lf7k9f9g3_640x960.jpg_560x999.jpg', 8757, 4362, 120, '武汉', 6, '2021-04-30 13:41:38', '2021-04-30 13:41:38');
INSERT INTO `products` VALUES (82, '2018外套女秋季新款女装时尚套装女韩版针织开衫毛衣外套格子衬衫直筒牛仔裤子套装三件套', 77.00, 54.00, '2018外套女秋季新款女装时尚套装女韩版针织开衫毛衣外套格子衬衫直筒牛仔裤子套装三件套', 1, 'http://s3.mogucdn.com/mlcdn/c45406/171224_57ldck1ki0bjh0fc48ac0e2f9i788_640x960.jpg_560x999.jpg', 2547, 4251, 1636, '重庆', 4, '2021-04-30 13:41:38', '2021-04-30 13:41:38');
INSERT INTO `products` VALUES (83, '裤子女阔腿裤春秋2018新款毛呢裤九分裤港味潮女裤甩腿裤女士裤子', 70.00, 70.00, '裤子女阔腿裤春秋2018新款毛呢裤九分裤港味潮女裤甩腿裤女士裤子', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180826_5708i53lg6ifcgd7402ieg99ab77b_640x640.jpg_560x999.jpg', 2414, 48, 134, '宁波', 6, '2021-04-30 13:41:38', '2021-04-30 13:41:38');
INSERT INTO `products` VALUES (84, '2018新款韩版纯棉V领条纹长袖体恤女装上衣服修身显瘦打底衫女式时尚T恤女生潮', 55.00, 38.00, '2018新款韩版纯棉V领条纹长袖体恤女装上衣服修身显瘦打底衫女式时尚T恤女生潮', 1, 'http://s3.mogucdn.com/mlcdn/17f85e/180830_3c8f1g7hka41603lfl25gh32b860i_640x960.jpg_560x999.jpg', 3850, 45, 291, '重庆', 8, '2021-04-30 13:41:38', '2021-04-30 13:41:38');
INSERT INTO `products` VALUES (85, '【2件69元】【新品特惠】短袖t恤女2018夏装新款韩版学生宽松黑色体恤圆领纯棉半袖上衣服', 70.00, 49.00, '【2件69元】【新品特惠】短袖t恤女2018夏装新款韩版学生宽松黑色体恤圆领纯棉半袖上衣服', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180301_784ej0g6c8dca24fa2c8dlfhe0fgc_640x960.jpg_560x999.jpg', 9215, 39, 1079, '宁波', 7, '2021-04-30 13:41:38', '2021-04-30 13:41:38');
INSERT INTO `products` VALUES (86, '2018新款秋装白色长袖t恤女宽松韩版学生体恤百搭长袖上衣服', 57.00, 40.00, '2018新款秋装白色长袖t恤女宽松韩版学生体恤百搭长袖上衣服', 1, 'http://s11.mogucdn.com/mlcdn/55cf19/180809_00j78l8dakkgjkk2a3lgfeae1kgj1_640x960.jpg_560x999.jpg', 3597, 32, 42, '广州', 3, '2021-04-30 13:41:38', '2021-04-30 13:41:38');
INSERT INTO `products` VALUES (87, '2018秋季新款时尚套装学院风V领小清新毛衣针织衫百搭格子衬衫显瘦小脚牛仔裤套装三件套', 84.00, 59.00, '2018秋季新款时尚套装学院风V领小清新毛衣针织衫百搭格子衬衫显瘦小脚牛仔裤套装三件套', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180226_3gg8h809bf7eg08gl0fl40b38e958_640x960.jpg_560x999.jpg', 6582, 4225, 194, '南京', 4, '2021-04-30 13:41:38', '2021-04-30 13:41:38');
INSERT INTO `products` VALUES (88, '秋装女2018新款套装时尚晚晚风气质chic港味女神网红两件套装俏皮', 156.00, 109.00, '秋装女2018新款套装时尚晚晚风气质chic港味女神网红两件套装俏皮', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180827_1590j44g2bk619i6655ji20ihikfb_640x960.jpg_560x999.jpg', 3590, 4173, 167, '上海', 7, '2021-04-30 13:41:38', '2021-04-30 13:41:38');
INSERT INTO `products` VALUES (89, '2018长袖t恤春秋季新款韩版怪味少女学生宽松显瘦嘻哈ins超火女生酷酷的上衣服潮', 40.00, 40.00, '2018长袖t恤春秋季新款韩版怪味少女学生宽松显瘦嘻哈ins超火女生酷酷的上衣服潮', 1, 'http://s11.mogucdn.com/mlcdn/55cf19/180823_4dgk20j7dgb5ef9abij8fd9aaah5a_640x960.jpg_560x999.jpg', 7715, 18, 70, '西安', 7, '2021-04-30 13:41:38', '2021-04-30 13:41:38');
INSERT INTO `products` VALUES (90, '复古黑白格子衬衫2018春季新款女装韩范宽松版百搭上衣软妹格纹衬衣', 71.00, 50.00, '复古黑白格子衬衫2018春季新款女装韩范宽松版百搭上衣软妹格纹衬衣', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180911_550eg3ghe4cgj89jk0lk19la32lf9_640x960.jpg_560x999.jpg', 3487, 17, 33, '青岛', 2, '2021-04-30 13:41:38', '2021-04-30 13:41:38');
INSERT INTO `products` VALUES (91, '2018秋季新款时尚套装韩版菱格针织开衫女宽松学生毛衣外套高腰休闲裤套装两件套', 99.00, 69.00, '2018秋季新款时尚套装韩版菱格针织开衫女宽松学生毛衣外套高腰休闲裤套装两件套', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180225_6i3kjj16b3g4c5fgb9a445l2bj5f0_640x960.jpg_560x999.jpg', 2804, 4141, 164, '上海', 2, '2021-04-30 13:41:38', '2021-04-30 13:41:38');
INSERT INTO `products` VALUES (92, '2018韩版秋季新款学院风猫咪刺绣宽松显瘦牛仔背带裤+宽松织带条纹毛衣时尚衣裤套装女', 99.00, 69.00, '2018韩版秋季新款学院风猫咪刺绣宽松显瘦牛仔背带裤+宽松织带条纹毛衣时尚衣裤套装女', 1, 'http://s11.mogucdn.com/mlcdn/55cf19/180804_4l05750fhlbhhj1g6jb4075cife3l_640x960.jpg_560x999.jpg', 1147, 4058, 15, '西安', 2, '2021-04-30 13:41:38', '2021-04-30 13:41:38');
INSERT INTO `products` VALUES (93, '2018秋新款飞鹰烫金印花字母纯棉潮牌情侣小脚裤男女同款', 226.00, 158.00, '2018秋新款飞鹰烫金印花字母纯棉潮牌情侣小脚裤男女同款', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180922_05jafg8g5k7flkj35icg400b0l4k7_800x1200.jpg_560x999.jpg', 8880, 12, 13, '北京', 4, '2021-04-30 13:41:38', '2021-04-30 13:41:38');
INSERT INTO `products` VALUES (94, '2018新款半高领打底衫女装秋冬中领长袖t恤修身黑色纯棉紧身上衣', 85.00, 85.00, '2018新款半高领打底衫女装秋冬中领长袖t恤修身黑色纯棉紧身上衣', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180830_83cka4ghle20j90i5455j1i7li77k_640x960.jpg_560x999.jpg', 9218, 11, 14, '青岛', 6, '2021-04-30 13:41:38', '2021-04-30 13:41:38');
INSERT INTO `products` VALUES (96, '加绒加厚裤子女秋冬2018新款学生韩版宽松显瘦休闲哈伦运动卫裤秋', 49.00, 49.00, '加绒加厚裤子女秋冬2018新款学生韩版宽松显瘦休闲哈伦运动卫裤秋', 1, 'http://s11.mogucdn.com/mlcdn/55cf19/180925_6bdiibf87e046d836dcjie5l40fk1_641x641.jpg_560x999.jpg', 10524, 1, 1, '沈阳', 6, '2021-04-30 13:41:38', '2021-04-30 13:41:38');
INSERT INTO `products` VALUES (97, '2018春秋季新款韩版百搭连帽卫衣+松紧腰长裤时尚运动套装两件套女学生', 57.00, 57.00, '2018春秋季新款韩版百搭连帽卫衣+松紧腰长裤时尚运动套装两件套女学生', 1, 'http://s3.mogucdn.com/mlcdn/c45406/170823_0d997dch3jkl8ed225ejbba76j2lf_640x832.jpg_560x999.jpg', 9970, 3904, 116, '上海', 8, '2021-04-30 13:41:49', '2021-04-30 13:41:49');
INSERT INTO `products` VALUES (98, '时尚套装女2018秋冬新款百搭毛衣女+时尚宽松显瘦牛仔背带裤', 99.00, 69.00, '时尚套装女2018秋冬新款百搭毛衣女+时尚宽松显瘦牛仔背带裤', 1, 'http://s3.mogucdn.com/mlcdn/55cf19/180822_891ag27iicc1kl0fa93l0iddg45c3_640x960.jpg_560x999.jpg', 1648, 3890, 121, '宁波', 2, '2021-04-30 13:41:49', '2021-04-30 13:41:49');
INSERT INTO `products` VALUES (99, '2018夏季新款女装复古港味性感波点挂脖两穿学生打底抹胸小吊带背心女', 57.00, 57.00, '2018夏季新款女装复古港味性感波点挂脖两穿学生打底抹胸小吊带背心女', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180621_1h968hc9g2if464j0ld1fc0jc3492_640x960.jpg_560x999.jpg', 8964, 5, 27, '青岛', 5, '2021-04-30 13:41:49', '2021-04-30 13:41:49');
INSERT INTO `products` VALUES (101, '秋季网红女时尚两件套2018新款晚晚风气质女神范针织港味套装裙子', 140.00, 98.00, '秋季网红女时尚两件套2018新款晚晚风气质女神范针织港味套装裙子', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180812_7dg023gflle285h71f1kf8gfi588i_640x960.jpg_560x999.jpg', 10366, 3806, 239, '广州', 5, '2021-04-30 13:41:49', '2021-04-30 13:41:49');
INSERT INTO `products` VALUES (102, '2018秋冬新款韩版宽松喇叭袖针织毛衣+时尚潮流黑色显瘦牛仔背带裤套装两件套', 99.00, 69.00, '2018秋冬新款韩版宽松喇叭袖针织毛衣+时尚潮流黑色显瘦牛仔背带裤套装两件套', 1, 'http://s11.mogucdn.com/mlcdn/55cf19/180901_2k0g5i06kcllef7jdehe9jd15kc2i_640x960.jpg_560x999.jpg', 10231, 3734, 91, '青岛', 6, '2021-04-30 13:41:49', '2021-04-30 13:41:49');
INSERT INTO `products` VALUES (103, '夏装2018新款韩版修身小吊带背心女学生显瘦内穿无袖打底衫上衣女', 43.00, 43.00, '夏装2018新款韩版修身小吊带背心女学生显瘦内穿无袖打底衫上衣女', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180927_23414d50hejlg647efd36j6j66jdl_640x960.jpg_560x999.jpg', 1521, 0, 0, '成都', 8, '2021-04-30 13:41:49', '2021-04-30 13:41:49');
INSERT INTO `products` VALUES (104, '带帽运动服2018秋冬新款韩版时尚加厚刺绣金丝绒女士宽松休闲连帽运动服卫衣两件套潮', 129.00, 129.00, '带帽运动服2018秋冬新款韩版时尚加厚刺绣金丝绒女士宽松休闲连帽运动服卫衣两件套潮', 1, 'http://s3.mogucdn.com/mlcdn/55cf19/180923_3jbhe3i9907eii29bl70b07lkdkck_640x960.jpg_560x999.jpg', 2805, 0, 5, '深圳', 5, '2021-04-30 13:41:49', '2021-04-30 13:41:49');
INSERT INTO `products` VALUES (105, '【秋冬加厚】灯芯绒2018新品百搭休闲裤女韩版毛呢裤子高腰显瘦宽松九分哈伦裤条纹大码小脚裤', 99.00, 55.00, '【秋冬加厚】灯芯绒2018新品百搭休闲裤女韩版毛呢裤子高腰显瘦宽松九分哈伦裤条纹大码小脚裤', 1, 'http://s11.mogucdn.com/mlcdn/17f85e/180926_76fee3df733b8h463gaj3lg6592bb_640x960.jpg_560x999.jpg', 7216, 192, 12, '杭州', 8, '2021-04-30 13:41:49', '2021-04-30 13:41:49');
INSERT INTO `products` VALUES (106, '2018春秋新款韩版胖mm加肥加大码200斤刺绣字母打底衫宽松显瘦长袖t恤上衣', 47.00, 47.00, '2018春秋新款韩版胖mm加肥加大码200斤刺绣字母打底衫宽松显瘦长袖t恤上衣', 1, 'http://s11.mogucdn.com/mlcdn/17f85e/180923_7b30c16he2lfdidb6e826kih8eaki_640x960.jpg_560x999.jpg', 6407, 0, 3, '长沙', 6, '2021-04-30 13:41:49', '2021-04-30 13:41:49');
INSERT INTO `products` VALUES (107, '2018秋季新款韩版女装字母印花宽松连帽休闲卫衣搭配松紧腰九分牛仔裤两件套女时尚运动套装潮', 97.00, 68.00, '2018秋季新款韩版女装字母印花宽松连帽休闲卫衣搭配松紧腰九分牛仔裤两件套女时尚运动套装潮', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180811_1k5hfa6d803575df3lkb6j67l5j3c_640x960.jpg_560x999.jpg', 3190, 3681, 76, '宁波', 6, '2021-04-30 13:41:49', '2021-04-30 13:41:49');
INSERT INTO `products` VALUES (109, '万年经典条纹上衣女装秋2018韩版新款宽松百搭显瘦拼色条纹长袖T恤女学生原宿慵懒风', 70.00, 70.00, '万年经典条纹上衣女装秋2018韩版新款宽松百搭显瘦拼色条纹长袖T恤女学生原宿慵懒风', 1, 'http://s11.mogucdn.com/mlcdn/55cf19/180926_7078259k7h0l2ihf67k2hc7ca79ic_640x960.jpg_560x999.jpg', 5224, 0, 0, '宁波', 3, '2021-04-30 13:41:49', '2021-04-30 13:41:49');
INSERT INTO `products` VALUES (110, '秋季2018新款韩版条纹T恤女长袖宽松学生百搭小清新打底衫原宿风慵懒港味上衣服', 68.00, 68.00, '秋季2018新款韩版条纹T恤女长袖宽松学生百搭小清新打底衫原宿风慵懒港味上衣服', 1, 'http://s11.mogucdn.com/mlcdn/55cf19/180926_1j176fab5g21kd3ib9jlgj751dcgh_640x960.jpg_560x999.jpg', 9931, 0, 0, '重庆', 2, '2021-04-30 13:41:49', '2021-04-30 13:41:49');
INSERT INTO `products` VALUES (111, '2018秋季新款宽松中长款印花卫衣女+包臀开叉半身裙套装两件套', 84.00, 59.00, '2018秋季新款宽松中长款印花卫衣女+包臀开叉半身裙套装两件套', 1, 'http://s11.mogucdn.com/mlcdn/55cf19/180901_09l36d4lhdf10if8g5cl877df973j_640x960.jpg_560x999.jpg', 5612, 3575, 18, '天津', 8, '2021-04-30 13:41:49', '2021-04-30 13:41:49');
INSERT INTO `products` VALUES (112, '秋季2018新款韩版宽松开衫连帽长袖卫衣外套吊带裙背心裙显瘦连衣裙子时尚套装秋装两件套女装', 127.00, 89.00, '秋季2018新款韩版宽松开衫连帽长袖卫衣外套吊带裙背心裙显瘦连衣裙子时尚套装秋装两件套女装', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180827_8aa0ajci5142eic7lj870jlhe26gg_640x960.jpg_560x999.jpg', 10596, 3496, 148, '杭州', 8, '2021-04-30 13:41:49', '2021-04-30 13:41:49');
INSERT INTO `products` VALUES (113, '吊带背心女2018夏季新款内穿外穿打底背心裹胸韩版学生吊带打底衫', 43.00, 43.00, '吊带背心女2018夏季新款内穿外穿打底背心裹胸韩版学生吊带打底衫', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180927_245533i8jdjf722f654lee42ae12i_640x960.jpg_560x999.jpg', 9618, 0, 0, '武汉', 4, '2021-04-30 13:41:49', '2021-04-30 13:41:49');
INSERT INTO `products` VALUES (114, '秋季2018新款百搭学生闺蜜装V领长袖条纹打底衫宽松上衣秋冬韩版修身显瘦短款纯棉t恤女小衫', 64.00, 45.00, '秋季2018新款百搭学生闺蜜装V领长袖条纹打底衫宽松上衣秋冬韩版修身显瘦短款纯棉t恤女小衫', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180807_43jj257hd8gd5g04605957la67f6j_640x960.jpg_560x999.jpg', 5007, 58, 95, '天津', 8, '2021-04-30 13:41:49', '2021-04-30 13:41:49');
INSERT INTO `products` VALUES (115, '2018秋装新款ins超火韩版女装微喇叭裤女九分裤高腰显瘦弹力微喇裤黑色薄款修身阔腿休闲裤', 108.00, 108.00, '2018秋装新款ins超火韩版女装微喇叭裤女九分裤高腰显瘦弹力微喇裤黑色薄款修身阔腿休闲裤', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180316_0l422k59b28kf6ef1h5i2j0g25ba8_1000x1498.jpg_560x999.jpg', 7369, 242, 3903, '深圳', 4, '2021-04-30 13:41:49', '2021-04-30 13:41:49');
INSERT INTO `products` VALUES (117, '2018秋季新款格子衬衫女长袖韩版复古灯笼袖学生宽松泡泡袖大码娃娃衫B24', 99.00, 99.00, '2018秋季新款格子衬衫女长袖韩版复古灯笼袖学生宽松泡泡袖大码娃娃衫B24', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180803_7ed1i8bkhlgkdh733j724ed22a0fh_640x960.jpg_560x999.jpg', 5884, 3441, 78, '杭州', 8, '2021-04-30 13:41:49', '2021-04-30 13:41:49');
INSERT INTO `products` VALUES (118, '2018外套女秋季新款女装时尚套装韩版拼色针织开衫中长款毛衣外套小清新格子衬衫牛仔裤三件套', 77.00, 54.00, '2018外套女秋季新款女装时尚套装韩版拼色针织开衫中长款毛衣外套小清新格子衬衫牛仔裤三件套', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180316_16k6dj8ff3ka9ci31djgj9999a985_640x960.jpg_560x999.jpg', 10416, 3254, 197, '深圳', 4, '2021-04-30 13:41:49', '2021-04-30 13:41:49');
INSERT INTO `products` VALUES (119, '秋冬新款V领撞色条纹长袖打底衫宽松短款上衣小衫2018秋季韩版百搭学生闺蜜装显瘦纯棉t恤女', 64.00, 45.00, '秋冬新款V领撞色条纹长袖打底衫宽松短款上衣小衫2018秋季韩版百搭学生闺蜜装显瘦纯棉t恤女', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180808_830ji849kbjbci113j19e11igkf44_640x960.jpg_560x999.jpg', 4156, 6, 9, '深圳', 6, '2021-04-30 13:41:49', '2021-04-30 13:41:49');
INSERT INTO `products` VALUES (120, '秋季新款百搭学生闺蜜装V领长袖竹节棉t恤女2018秋冬韩版宽松显瘦纯色打底衫短款上衣服体恤', 64.00, 45.00, '秋季新款百搭学生闺蜜装V领长袖竹节棉t恤女2018秋冬韩版宽松显瘦纯色打底衫短款上衣服体恤', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180822_5d29k4j5g79jg043f591f6igbcdg6_640x960.jpg_560x999.jpg', 1885, 14, 12, '深圳', 8, '2021-04-30 13:41:49', '2021-04-30 13:41:49');
INSERT INTO `products` VALUES (121, '网红同款2018秋冬新款女装韩版气质时髦秋季chic风毛衣套装裙两件套时尚潮', 185.00, 130.00, '网红同款2018秋冬新款女装韩版气质时髦秋季chic风毛衣套装裙两件套时尚潮', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180802_1ec122l9ii2gj8l2fjck6f5f00eke_640x960.jpg_560x999.jpg', 3216, 3157, 21, '重庆', 6, '2021-04-30 13:41:49', '2021-04-30 13:41:49');
INSERT INTO `products` VALUES (122, '休闲运动服套装女春秋季2018新款韩版时尚大码宽松长袖卫衣三件套', 138.00, 138.00, '休闲运动服套装女春秋季2018新款韩版时尚大码宽松长袖卫衣三件套', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180807_3e09gg2fl5456hh9chli29d66j9ji_640x960.jpg_560x999.jpg', 10405, 3070, 8, '成都', 5, '2021-04-30 13:41:49', '2021-04-30 13:41:49');
INSERT INTO `products` VALUES (123, '韩风chic上衣2018新款秋季韩版学院风日系软妹小清新拼色V领百搭长袖t恤卫衣女学生', 60.00, 60.00, '韩风chic上衣2018新款秋季韩版学院风日系软妹小清新拼色V领百搭长袖t恤卫衣女学生', 1, 'http://s3.mogucdn.com/mlcdn/55cf19/180923_8870522k681i85d2gfi1k6le1382e_640x960.jpg_560x999.jpg', 3264, 30, 1, '南京', 3, '2021-04-30 13:41:49', '2021-04-30 13:41:49');
INSERT INTO `products` VALUES (124, '2018早秋季韩版百搭学生修身显瘦长袖t恤女秋冬新款原宿风圆领卡通刺绣纯棉打底衫上衣服体恤', 64.00, 45.00, '2018早秋季韩版百搭学生修身显瘦长袖t恤女秋冬新款原宿风圆领卡通刺绣纯棉打底衫上衣服体恤', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180821_2a6ek98i3jj902h50i7h7ekf0agj3_640x960.jpg_560x999.jpg', 3965, 3, 0, '杭州', 8, '2021-04-30 13:41:49', '2021-04-30 13:41:49');
INSERT INTO `products` VALUES (125, '纯棉撞色条纹V领纯棉t恤女2018秋季新款韩版学生闺蜜装百搭修身显瘦长袖打底衫宽松上衣小衫', 64.00, 45.00, '纯棉撞色条纹V领纯棉t恤女2018秋季新款韩版学生闺蜜装百搭修身显瘦长袖打底衫宽松上衣小衫', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180808_61dc0ici7c6bbe65cii22c31513i6_640x960.jpg_560x999.jpg', 8355, 10, 14, '成都', 8, '2021-04-30 13:41:49', '2021-04-30 13:41:49');
INSERT INTO `products` VALUES (127, '2018外套女秋季新款女装时尚套装女韩版中长款卫衣开衫外套高腰显瘦开叉小脚裤子套装两件套', 86.00, 60.00, '2018外套女秋季新款女装时尚套装女韩版中长款卫衣开衫外套高腰显瘦开叉小脚裤子套装两件套', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180109_85ee34ae6197i5k44ig69c1gd22ak_640x960.jpg_560x999.jpg', 7624, 3010, 1433, '郑州', 7, '2021-04-30 13:42:01', '2021-04-30 13:42:01');
INSERT INTO `products` VALUES (128, '2018秋季新款时尚套装半透明雪纺衫V领破洞针织马甲呢子休闲裤套装三件套', 84.00, 59.00, '2018秋季新款时尚套装半透明雪纺衫V领破洞针织马甲呢子休闲裤套装三件套', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180120_1dl4a4dljdg8eclkef40kl1ke8g7k_640x960.jpg_560x999.jpg', 7483, 2520, 171, '深圳', 4, '2021-04-30 13:42:01', '2021-04-30 13:42:01');
INSERT INTO `products` VALUES (129, '2018秋季新款韩版学院风长袖条纹上衣女高腰直筒牛仔背带裤衣裤时尚套装两件套', 70.00, 49.00, '2018秋季新款韩版学院风长袖条纹上衣女高腰直筒牛仔背带裤衣裤时尚套装两件套', 1, 'http://s3.mogucdn.com/mlcdn/55cf19/180902_77hklal614d182bl9725ad5gbfil2_640x960.jpg_560x999.jpg', 6003, 2515, 5, '昆明', 3, '2021-04-30 13:42:02', '2021-04-30 13:42:02');
INSERT INTO `products` VALUES (130, '2018秋季新款时尚套装连帽卫衣女休闲针织运动裤套装两件套女', 99.00, 69.00, '2018秋季新款时尚套装连帽卫衣女休闲针织运动裤套装两件套女', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180103_6h04c282hf39913aje7434e1ie9c6_640x960.jpg_560x999.jpg', 6264, 2508, 836, '成都', 6, '2021-04-30 13:42:02', '2021-04-30 13:42:02');
INSERT INTO `products` VALUES (131, '套装两件套2018初秋秋季新款长款薄款卫衣外套+高腰格子半身裙中长款打底裙网红套装', 86.00, 60.00, '套装两件套2018初秋秋季新款长款薄款卫衣外套+高腰格子半身裙中长款打底裙网红套装', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180729_02fl1g7c873825e5fhc76ba3h2505_640x960.jpg_560x999.jpg', 8330, 2448, 51, '杭州', 5, '2021-04-30 13:42:02', '2021-04-30 13:42:02');
INSERT INTO `products` VALUES (132, '2018秋装女装韩版新款套装两件套时尚性感时尚套装上衣女+运动裤子套装女潮显瘦宽松', 198.00, 198.00, '2018秋装女装韩版新款套装两件套时尚性感时尚套装上衣女+运动裤子套装女潮显瘦宽松', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180826_5cf0l1745i7hl39dgeb3di3hc3af1_640x960.jpg_560x999.jpg', 6037, 2439, 27, '西安', 8, '2021-04-30 13:42:02', '2021-04-30 13:42:02');
INSERT INTO `products` VALUES (133, '晚晚风黑色连衣裙2018秋装新款女装韩版显瘦中长款V领A字裙赫本小黑裙气质百搭中长款连衣裙', 179.00, 69.00, '晚晚风黑色连衣裙2018秋装新款女装韩版显瘦中长款V领A字裙赫本小黑裙气质百搭中长款连衣裙', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180903_61lihh46bg9k4ej5ddia841338284_640x960.jpg_560x999.jpg', 10677, 2353, 113, '西安', 6, '2021-04-30 13:42:02', '2021-04-30 13:42:02');
INSERT INTO `products` VALUES (134, '2018秋季新款时尚套装韩范宽松BF字母学院风工装风衣外套修身显瘦小脚裤套装两件套女', 71.00, 50.00, '2018秋季新款时尚套装韩范宽松BF字母学院风工装风衣外套修身显瘦小脚裤套装两件套女', 1, 'http://s3.mogucdn.com/p2/170210/176681490_7hac00i68kadaed0i6ba8l3le5dd3_640x960.jpg_560x999.jpg', 5449, 2280, 348, '沈阳', 8, '2021-04-30 13:42:02', '2021-04-30 13:42:02');
INSERT INTO `products` VALUES (135, '2018秋季新款三件套韩版拼色针织开衫中长款毛衣外套+小清新格子衬衫+显瘦牛仔裤时尚套装', 84.00, 59.00, '2018秋季新款三件套韩版拼色针织开衫中长款毛衣外套+小清新格子衬衫+显瘦牛仔裤时尚套装', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180801_8filh47j1lh24a8a6500dj46ie597_640x854.jpg_560x999.jpg', 6126, 2194, 260, '宁波', 4, '2021-04-30 13:42:02', '2021-04-30 13:42:02');
INSERT INTO `products` VALUES (136, '2018秋装新款时尚高领收腰显瘦针织连衣裙中长款毛衣裙长款', 414.00, 414.00, '2018秋装新款时尚高领收腰显瘦针织连衣裙中长款毛衣裙长款', 1, 'http://s11.mogucdn.com/mlcdn/55cf19/180816_3905kfkkfg63ja251869ljll7j93h_640x960.jpg_560x999.jpg', 9551, 2155, 10, '郑州', 7, '2021-04-30 13:42:02', '2021-04-30 13:42:02');
INSERT INTO `products` VALUES (137, '时尚套装2018春季新款牛仔短款外套时尚外套气质上衣女+高腰显瘦直筒大口袋牛仔裤两件套', 70.00, 49.00, '时尚套装2018春季新款牛仔短款外套时尚外套气质上衣女+高腰显瘦直筒大口袋牛仔裤两件套', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180302_5e2jjb9cfkkfbkcb2hd8j02eef478_640x960.jpg_560x999.jpg', 8587, 2139, 477, '成都', 4, '2021-04-30 13:42:02', '2021-04-30 13:42:02');
INSERT INTO `products` VALUES (138, '秋季2018新款韩版毛边剪裁单排扣洗水牛仔外套抽绳连帽显瘦卫衣裙子秋装时尚套装两件套女装', 127.00, 89.00, '秋季2018新款韩版毛边剪裁单排扣洗水牛仔外套抽绳连帽显瘦卫衣裙子秋装时尚套装两件套女装', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180823_5ifd9g28613bi7c10jjk866ki2l32_640x960.jpg_560x999.jpg', 3241, 1972, 135, '西安', 8, '2021-04-30 13:42:02', '2021-04-30 13:42:02');
INSERT INTO `products` VALUES (139, '2018秋季新款韩版加肥加大码休闲服运动套装女胖mm两件套套装', 69.00, 69.00, '2018秋季新款韩版加肥加大码休闲服运动套装女胖mm两件套套装', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180810_17b3h5lg77ijc21680f7gkl6ffd25_640x960.jpg_560x999.jpg', 5272, 1968, 3, '昆明', 3, '2021-04-30 13:42:20', '2021-04-30 13:42:20');
INSERT INTO `products` VALUES (140, '2018早秋新款时尚套装女甜美韩版长袖子镂空拼接纯色衬衫+宽松显瘦割破牛仔背带裤两件套女', 99.00, 69.00, '2018早秋新款时尚套装女甜美韩版长袖子镂空拼接纯色衬衫+宽松显瘦割破牛仔背带裤两件套女', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180714_3gca7b9e5bc5ab4ldd76bh3712f07_640x960.jpg_560x999.jpg', 3231, 1963, 24, '宁波', 7, '2021-04-30 13:42:20', '2021-04-30 13:42:20');
INSERT INTO `products` VALUES (141, '2018秋装新款韩版时尚套装chic暗红显白BF宽松显瘦冲锋衣外套+条杠休闲运动裤女两件套', 108.00, 76.00, '2018秋装新款韩版时尚套装chic暗红显白BF宽松显瘦冲锋衣外套+条杠休闲运动裤女两件套', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180819_2791931dhhb5h5bgik2cd6f4cc2ih_640x960.jpg_560x999.jpg', 4263, 1924, 44, '南京', 3, '2021-04-30 13:42:20', '2021-04-30 13:42:20');
INSERT INTO `products` VALUES (142, '定制2018秋季欧洲新款雪纺复古挂脖V领长袖衬衫中长款港味半身裙时尚套装女装', 101.00, 71.00, '定制2018秋季欧洲新款雪纺复古挂脖V领长袖衬衫中长款港味半身裙时尚套装女装', 1, 'http://s11.mogucdn.com/mlcdn/c45406/170907_2efhlkeke21efd84lf20e4kac70f1_1200x1800.jpg_560x999.jpg', 6530, 1914, 1617, '北京', 4, '2021-04-30 13:42:20', '2021-04-30 13:42:20');
INSERT INTO `products` VALUES (143, '2018秋季新款韩版时尚套装红格子长袖衬衫+百搭显瘦吊带针织连衣裙两件套女', 168.00, 79.00, '2018秋季新款韩版时尚套装红格子长袖衬衫+百搭显瘦吊带针织连衣裙两件套女', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180307_6c7j5el2b184dgcf244k8253cik56_640x832.jpg_560x999.jpg', 5297, 1881, 594, '北京', 3, '2021-04-30 13:42:20', '2021-04-30 13:42:20');
INSERT INTO `products` VALUES (144, '2018秋季新款韩版BF宽松百搭显瘦开衫女+短款吊带小背心+高腰A字半身裙三件套时尚套装', 184.00, 129.00, '2018秋季新款韩版BF宽松百搭显瘦开衫女+短款吊带小背心+高腰A字半身裙三件套时尚套装', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180831_2dch37fcaak900247525i548lh393_640x960.jpg_560x999.jpg', 7416, 1811, 22, '武汉', 5, '2021-04-30 13:42:20', '2021-04-30 13:42:20');
INSERT INTO `products` VALUES (145, '2018秋季新款时尚套装韩版百搭个性拼色格纹套头连帽卫衣高腰显瘦休闲裤两件套', 99.00, 69.00, '2018秋季新款时尚套装韩版百搭个性拼色格纹套头连帽卫衣高腰显瘦休闲裤两件套', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180906_3d610k09hge16h62gg2h5h4fg2ali_640x960.jpg_560x999.jpg', 1607, 1810, 182, '宁波', 7, '2021-04-30 13:42:20', '2021-04-30 13:42:20');
INSERT INTO `products` VALUES (146, '偏大大码秋装女套装新款2018中长款连帽卫衣+牛仔马甲洋气套装胖mm遮肉显瘦两件套省心搭配', 70.00, 49.00, '偏大大码秋装女套装新款2018中长款连帽卫衣+牛仔马甲洋气套装胖mm遮肉显瘦两件套省心搭配', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180821_7gccd889f8f88hde1kd4l99dj0h3e_640x960.jpg_560x999.jpg', 9978, 1801, 121, '西安', 2, '2021-04-30 13:42:20', '2021-04-30 13:42:20');
INSERT INTO `products` VALUES (147, '2018秋季新款韩版时尚套装百搭宽松连帽印花卫衣+高腰显瘦九分哈伦裤牛仔裤两件套潮', 99.00, 69.00, '2018秋季新款韩版时尚套装百搭宽松连帽印花卫衣+高腰显瘦九分哈伦裤牛仔裤两件套潮', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180819_036kb000jg39i651jbgf4kg5df084_640x960.jpg_560x999.jpg', 5285, 1778, 246, '杭州', 5, '2021-04-30 13:42:20', '2021-04-30 13:42:20');
INSERT INTO `products` VALUES (148, '格姬2018秋装新款高腰连衣裙女七分袖复古超仙少女冷淡风收腰纯色系带中长裙6990', 180.00, 126.00, '格姬2018秋装新款高腰连衣裙女七分袖复古超仙少女冷淡风收腰纯色系带中长裙6990', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180816_5ddih74k67e17k63ji6d621cc363h_640x960.jpg_560x999.jpg', 4873, 1759, 44, '郑州', 7, '2021-04-30 13:42:20', '2021-04-30 13:42:20');
INSERT INTO `products` VALUES (149, '时尚OL女神套装2018秋季新款新款简约百搭衬衫高腰时髦条纹哈伦裤两件套女', 140.00, 98.00, '时尚OL女神套装2018秋季新款新款简约百搭衬衫高腰时髦条纹哈伦裤两件套女', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180829_2kkjklb37965g608kk717ab0i7579_640x960.jpg_560x999.jpg', 9417, 1753, 61, '昆明', 5, '2021-04-30 13:42:20', '2021-04-30 13:42:20');
INSERT INTO `products` VALUES (151, '2018初秋新款BF港风网红学生复古小心机两件套装时尚女果绿宽松卫衣+休闲运动束脚裤子', 113.00, 79.00, '2018初秋新款BF港风网红学生复古小心机两件套装时尚女果绿宽松卫衣+休闲运动束脚裤子', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180802_686lie5edj192kc33ki737hle7d05_640x960.jpg_560x999.jpg', 8809, 1734, 18, '深圳', 3, '2021-04-30 13:42:32', '2021-04-30 13:42:32');
INSERT INTO `products` VALUES (152, '2018秋季新款时尚套装宽松BF风学生格子长袖衬衫女上衣+韩版百搭学院风牛仔背带裤女两件套', 99.00, 69.00, '2018秋季新款时尚套装宽松BF风学生格子长袖衬衫女上衣+韩版百搭学院风牛仔背带裤女两件套', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180812_5ejaf15h8i9182c1765lbf6464d8h_640x960.jpg_560x999.jpg', 10060, 1673, 7, '杭州', 2, '2021-04-30 13:42:32', '2021-04-30 13:42:32');
INSERT INTO `products` VALUES (153, '2018秋冬装新款韩版宽松学生过膝ulzzang鱼尾裙长裙潮卫衣连衣裙女', 140.00, 98.00, '2018秋冬装新款韩版宽松学生过膝ulzzang鱼尾裙长裙潮卫衣连衣裙女', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180801_4jjj34129ai4a0fd062iibj8ig5il_640x960.jpg_560x999.jpg', 9439, 1672, 31, '宁波', 4, '2021-04-30 13:42:32', '2021-04-30 13:42:32');
INSERT INTO `products` VALUES (154, '2018秋季新款百搭短款针织衫+宽松显瘦哈伦牛仔裤时尚两件套', 70.00, 49.00, '2018秋季新款百搭短款针织衫+宽松显瘦哈伦牛仔裤时尚两件套', 1, 'http://s3.mogucdn.com/mlcdn/55cf19/180828_4l2e9729iabakghcd44dkbe560h5b_640x960.jpg_560x999.jpg', 4999, 1665, 2, '杭州', 8, '2021-04-30 13:42:32', '2021-04-30 13:42:32');
INSERT INTO `products` VALUES (156, '2018春秋新款韩版灯芯绒小脚哈伦裤女学生宽松萝卜裤显瘦九分裤休闲裤', 70.00, 49.00, '2018春秋新款韩版灯芯绒小脚哈伦裤女学生宽松萝卜裤显瘦九分裤休闲裤', 1, 'http://s11.mogucdn.com/mlcdn/c45406/171210_0a0kc9igaaf74jgcf1j150874daa3_640x960.jpg_560x999.jpg', 9430, 1599, 25, '郑州', 6, '2021-04-30 13:42:32', '2021-04-30 13:42:32');
INSERT INTO `products` VALUES (157, '港风少女短款牛仔外套女2018新款韩版牛仔衣夹克潮+高腰流苏蛋糕裙半身裙女蕾丝短裙两件套装', 113.00, 79.00, '港风少女短款牛仔外套女2018新款韩版牛仔衣夹克潮+高腰流苏蛋糕裙半身裙女蕾丝短裙两件套装', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180723_827dgd0bdj5i4egcleje6j35eebbc_640x960.jpg_560x999.jpg', 10392, 1590, 71, '北京', 8, '2021-04-30 13:42:32', '2021-04-30 13:42:32');
INSERT INTO `products` VALUES (158, '2018秋装新款韩版宽松针织开衫毛衣外套上衣女修身显瘦吊带连衣裙两件套学生裙子时尚套装', 99.00, 69.00, '2018秋装新款韩版宽松针织开衫毛衣外套上衣女修身显瘦吊带连衣裙两件套学生裙子时尚套装', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180901_4lc505f9hgb86106k8cjcljj25294_640x960.jpg_560x999.jpg', 9382, 1569, 161, '深圳', 4, '2021-04-30 13:42:33', '2021-04-30 13:42:33');
INSERT INTO `products` VALUES (159, '格姬2018秋季新款港风休闲小西装套装女时尚OL两件套九分裤简约纯色休闲西服外套女6970', 256.00, 179.00, '格姬2018秋季新款港风休闲小西装套装女时尚OL两件套九分裤简约纯色休闲西服外套女6970', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180813_71b8h486f66358dal3hg12f90ba58_640x960.jpg_560x999.jpg', 1562, 1536, 34, '青岛', 7, '2021-04-30 13:42:33', '2021-04-30 13:42:33');
INSERT INTO `products` VALUES (160, '2018秋季新款韩版女装喇叭袖V领套头打底针织衫上衣+显瘦a字黑色半身裙皮裙两件套时尚套装', 84.00, 59.00, '2018秋季新款韩版女装喇叭袖V领套头打底针织衫上衣+显瘦a字黑色半身裙皮裙两件套时尚套装', 1, 'http://s3.mogucdn.com/mlcdn/c45406/170928_4hk375c1c1ldgl7bhi08e1hk23ji1_640x960.jpg_560x999.jpg', 6835, 1526, 807, '深圳', 3, '2021-04-30 13:42:33', '2021-04-30 13:42:33');
INSERT INTO `products` VALUES (161, '2018秋季新款韩版小清新学生短款港味露脐长袖上衣女+百搭高腰束脚休闲长裤时尚套装两件套潮', 141.00, 99.00, '2018秋季新款韩版小清新学生短款港味露脐长袖上衣女+百搭高腰束脚休闲长裤时尚套装两件套潮', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180828_6g8gg6740942163ddi6hgeacj4983_640x960.jpg_560x999.jpg', 7445, 1511, 25, '深圳', 2, '2021-04-30 13:42:33', '2021-04-30 13:42:33');
INSERT INTO `products` VALUES (162, '2018早秋新款港风时尚套装复古Polo领长袖衬衫温柔风无袖小个子吊带连衣裙两件套', 70.00, 49.00, '2018早秋新款港风时尚套装复古Polo领长袖衬衫温柔风无袖小个子吊带连衣裙两件套', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180820_2a2fja7ef28g254ki63cg6b3jkhgl_640x960.jpg_560x999.jpg', 8565, 1501, 13, '长沙', 3, '2021-04-30 13:42:33', '2021-04-30 13:42:33');
INSERT INTO `products` VALUES (164, '2018秋装新款韩版宽松针织开衫毛衣外套中长气质v领针织连衣裙打底吊带裙两件套时尚裙子套装', 99.00, 69.00, '2018秋装新款韩版宽松针织开衫毛衣外套中长气质v领针织连衣裙打底吊带裙两件套时尚裙子套装', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180816_8gb546fel3dic1i6d44fj217l49eg_640x960.jpg_560x999.jpg', 8759, 1471, 64, '南京', 8, '2021-04-30 13:42:54', '2021-04-30 13:42:54');
INSERT INTO `products` VALUES (165, '2018秋装女装韩版新款休闲时尚套装女圆领条纹薄款上衣+高腰束脚灯笼裤两件套女潮', 198.00, 198.00, '2018秋装女装韩版新款休闲时尚套装女圆领条纹薄款上衣+高腰束脚灯笼裤两件套女潮', 1, 'http://s11.mogucdn.com/mlcdn/55cf19/180803_44ec95haiehdddjk126fgidfg52le_640x960.jpg_560x999.jpg', 1582, 1459, 13, '重庆', 5, '2021-04-30 13:42:54', '2021-04-30 13:42:54');
INSERT INTO `products` VALUES (166, '秋装2018新款牛仔外套女韩版宽松短款针织背心高腰半身裙中长裙小个子显高时尚套装裙子三件套', 39.00, 27.00, '秋装2018新款牛仔外套女韩版宽松短款针织背心高腰半身裙中长裙小个子显高时尚套装裙子三件套', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180731_5be6jhh7ggj68d4063gkca4egh02i_750x1000.jpg_560x999.jpg', 7012, 1432, 103, '昆明', 8, '2021-04-30 13:42:54', '2021-04-30 13:42:54');
INSERT INTO `products` VALUES (167, '格姬2018秋装新款两件套圆领灯笼袖连衣裙春装新款韩版名媛大裙摆套装裙时尚套装女6254', 285.00, 199.00, '格姬2018秋装新款两件套圆领灯笼袖连衣裙春装新款韩版名媛大裙摆套装裙时尚套装女6254', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180302_4ji3hab7c3kdhfdg4i0lc86a1287h_640x960.jpg_560x999.jpg', 2455, 1416, 62, '南京', 7, '2021-04-30 13:42:54', '2021-04-30 13:42:54');
INSERT INTO `products` VALUES (168, '连衣裙女新款2018秋款韩版小碎花裙子长袖文艺学生百搭小黑裙', 97.00, 68.00, '连衣裙女新款2018秋款韩版小碎花裙子长袖文艺学生百搭小黑裙', 1, 'http://s11.mogucdn.com/mlcdn/c45406/170402_06ehihjk325cjc7jc4653k1bkek2b_640x960.jpg_560x999.jpg', 7702, 1416, 441, '西安', 5, '2021-04-30 13:42:54', '2021-04-30 13:42:54');
INSERT INTO `products` VALUES (169, '时尚套装两件套网红同款2018秋装女套装新款学生牛仔外套配内搭温柔风小黑裙黑色v领吊带裙潮', 100.00, 70.00, '时尚套装两件套网红同款2018秋装女套装新款学生牛仔外套配内搭温柔风小黑裙黑色v领吊带裙潮', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180819_44ee3hf251agika4lji8958i46e6d_640x960.jpg_560x999.jpg', 1281, 1404, 75, '青岛', 7, '2021-04-30 13:42:54', '2021-04-30 13:42:54');
INSERT INTO `products` VALUES (170, '2018秋装套装新款韩版百搭显瘦长袖条纹雪纺衬衫女宽松直筒背带裤套装两件套', 84.00, 59.00, '2018秋装套装新款韩版百搭显瘦长袖条纹雪纺衬衫女宽松直筒背带裤套装两件套', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180312_5ebi8i8k389leic0g487h3l611kek_640x960.jpg_560x999.jpg', 7966, 1384, 80, '西安', 3, '2021-04-30 13:42:54', '2021-04-30 13:42:54');
INSERT INTO `products` VALUES (171, '2018秋冬新款时尚韩范百搭显瘦背带裤套装灯芯绒裤子+毛衣两件套女', 99.00, 69.00, '2018秋冬新款时尚韩范百搭显瘦背带裤套装灯芯绒裤子+毛衣两件套女', 1, 'http://s11.mogucdn.com/mlcdn/55cf19/180831_3lccd4912aec0lb8fga9ji7ah6bkd_640x960.jpg_560x999.jpg', 4339, 1382, 55, '南京', 8, '2021-04-30 13:42:54', '2021-04-30 13:42:54');
INSERT INTO `products` VALUES (173, '时尚套装韩版气质甜美镂空灯笼袖针织衫百搭显瘦毛衣女2018秋季新款连衣裙套装', 70.00, 70.00, '时尚套装韩版气质甜美镂空灯笼袖针织衫百搭显瘦毛衣女2018秋季新款连衣裙套装', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180822_5bl46cl4g934133a6cbhkk8l37hl0_640x960.jpg_560x999.jpg', 1615, 1360, 286, '沈阳', 3, '2021-04-30 13:42:54', '2021-04-30 13:42:54');
INSERT INTO `products` VALUES (174, '2018秋季新款时尚套装蝴蝶结波点衬衫圆领麻花毛衣无袖马甲百褶半身裙中长款A字裙套装三件套', 86.00, 60.00, '2018秋季新款时尚套装蝴蝶结波点衬衫圆领麻花毛衣无袖马甲百褶半身裙中长款A字裙套装三件套', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180131_1kgh02j1j4lbb74g0427ljk976612_640x960.jpg_560x999.jpg', 4118, 1356, 311, '青岛', 8, '2021-04-30 13:42:55', '2021-04-30 13:42:55');
INSERT INTO `products` VALUES (175, 'aaa', 100.00, 88.00, 'cba', 1, 'www.itsiyuan.com/abc.png', 100, 100, 199, '北京', NULL, NULL, NULL);
INSERT INTO `products` VALUES (177, 'aaa', 100.00, 88.00, 'cba', 1, 'www.itsiyuan.com/abc.png', 100, 100, 199, '北京', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `intro` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '管理员', '管理部门', '2023-08-10 20:30:33', '2023-08-11 20:17:53');
INSERT INTO `role` VALUES (2, '软件工程师', '开发部门', '2023-08-10 20:30:39', '2023-08-10 20:30:39');
INSERT INTO `role` VALUES (3, '硬件工程师', '开发部门', '2023-08-10 20:39:36', '2023-08-10 20:39:36');
INSERT INTO `role` VALUES (4, '测试工程师', '开发部门', '2023-08-10 20:41:05', '2023-08-10 20:41:05');
INSERT INTO `role` VALUES (5, '运维工程师', '开发部门', '2023-08-10 20:44:49', '2023-08-10 20:44:49');
INSERT INTO `role` VALUES (6, '产品经理', '开发部门', '2023-08-10 20:47:26', '2023-08-10 20:47:26');
INSERT INTO `role` VALUES (7, 'UI设计师', '开发部门', '2023-08-10 20:48:17', '2023-08-10 20:48:17');
INSERT INTO `role` VALUES (8, '前端开发', '开发部门', '2023-08-10 20:52:11', '2023-08-10 20:52:11');
INSERT INTO `role` VALUES (9, '后端开发', '开发部门', '2023-08-10 20:52:27', '2023-08-10 20:52:27');
INSERT INTO `role` VALUES (10, '客服员工', '客服部门', '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role` VALUES (11, '客服经理', '客服部门', '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role` VALUES (12, '客服主管', '客服部门', '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role` VALUES (16, '运营2', '日常管理2', '2024-07-27 10:46:43', '2024-07-27 10:46:43');
INSERT INTO `role` VALUES (17, '运营3', '日常管理2', '2024-07-27 10:46:58', '2024-07-27 10:46:58');
INSERT INTO `role` VALUES (18, '运营4', '日常管理2', '2024-07-27 10:47:32', '2024-07-27 10:47:32');
INSERT INTO `role` VALUES (19, '运营5', '日常管理2', '2024-07-28 09:21:08', '2024-07-28 09:21:08');
INSERT INTO `role` VALUES (22, '测试1', '日常管理2', '2024-07-28 09:26:32', '2024-07-28 09:26:32');
INSERT INTO `role` VALUES (23, '测试2', '日常管理2', '2024-07-28 09:27:42', '2024-07-28 09:27:42');
INSERT INTO `role` VALUES (24, '测试66', '日常管理2', '2024-07-28 09:37:49', '2024-07-28 09:37:49');
INSERT INTO `role` VALUES (26, '1', '1', '2024-08-01 13:43:57', '2024-08-01 13:43:57');
INSERT INTO `role` VALUES (27, '测试创建', '111', '2024-08-01 13:48:51', '2024-08-01 13:52:41');

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu`  (
  `roleId` int NOT NULL,
  `menuId` int NOT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`roleId`, `menuId`) USING BTREE,
  INDEX `menuId`(`menuId` ASC) USING BTREE,
  CONSTRAINT `role_menu_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_menu_ibfk_2` FOREIGN KEY (`menuId`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES (1, 1, '2024-08-02 14:10:26', '2024-08-02 14:10:26');
INSERT INTO `role_menu` VALUES (1, 3, '2024-08-02 14:10:26', '2024-08-02 14:10:26');
INSERT INTO `role_menu` VALUES (1, 53, '2024-08-02 14:10:26', '2024-08-02 14:10:26');
INSERT INTO `role_menu` VALUES (2, 1, '2024-08-02 14:10:32', '2024-08-02 14:10:32');
INSERT INTO `role_menu` VALUES (2, 3, '2024-08-02 14:10:32', '2024-08-02 14:10:32');
INSERT INTO `role_menu` VALUES (2, 53, '2024-08-02 14:10:32', '2024-08-02 14:10:32');
INSERT INTO `role_menu` VALUES (4, 1, '2024-08-02 14:10:39', '2024-08-02 14:10:39');
INSERT INTO `role_menu` VALUES (4, 3, '2024-08-02 14:10:39', '2024-08-02 14:10:39');
INSERT INTO `role_menu` VALUES (4, 4, '2024-08-02 14:10:39', '2024-08-02 14:10:39');
INSERT INTO `role_menu` VALUES (4, 9, '2024-08-02 14:10:39', '2024-08-02 14:10:39');
INSERT INTO `role_menu` VALUES (4, 10, '2024-08-02 14:10:39', '2024-08-02 14:10:39');
INSERT INTO `role_menu` VALUES (4, 11, '2024-08-02 14:10:39', '2024-08-02 14:10:39');
INSERT INTO `role_menu` VALUES (4, 12, '2024-08-02 14:10:39', '2024-08-02 14:10:39');
INSERT INTO `role_menu` VALUES (4, 21, '2024-08-02 14:10:39', '2024-08-02 14:10:39');
INSERT INTO `role_menu` VALUES (4, 22, '2024-08-02 14:10:39', '2024-08-02 14:10:39');
INSERT INTO `role_menu` VALUES (4, 23, '2024-08-02 14:10:39', '2024-08-02 14:10:39');
INSERT INTO `role_menu` VALUES (4, 24, '2024-08-02 14:10:39', '2024-08-02 14:10:39');
INSERT INTO `role_menu` VALUES (4, 25, '2024-08-02 14:10:39', '2024-08-02 14:10:39');
INSERT INTO `role_menu` VALUES (4, 26, '2024-08-02 14:10:39', '2024-08-02 14:10:39');
INSERT INTO `role_menu` VALUES (4, 27, '2024-08-02 14:10:39', '2024-08-02 14:10:39');
INSERT INTO `role_menu` VALUES (4, 28, '2024-08-02 14:10:39', '2024-08-02 14:10:39');
INSERT INTO `role_menu` VALUES (4, 29, '2024-08-02 14:10:39', '2024-08-02 14:10:39');
INSERT INTO `role_menu` VALUES (4, 30, '2024-08-02 14:10:39', '2024-08-02 14:10:39');
INSERT INTO `role_menu` VALUES (4, 31, '2024-08-02 14:10:39', '2024-08-02 14:10:39');
INSERT INTO `role_menu` VALUES (4, 32, '2024-08-02 14:10:39', '2024-08-02 14:10:39');
INSERT INTO `role_menu` VALUES (4, 33, '2024-08-02 14:10:39', '2024-08-02 14:10:39');
INSERT INTO `role_menu` VALUES (4, 34, '2024-08-02 14:10:39', '2024-08-02 14:10:39');
INSERT INTO `role_menu` VALUES (4, 35, '2024-08-02 14:10:39', '2024-08-02 14:10:39');
INSERT INTO `role_menu` VALUES (4, 36, '2024-08-02 14:10:39', '2024-08-02 14:10:39');
INSERT INTO `role_menu` VALUES (4, 53, '2024-08-02 14:10:39', '2024-08-02 14:10:39');
INSERT INTO `role_menu` VALUES (22, 1, '2024-07-28 09:26:32', '2024-07-28 09:26:32');
INSERT INTO `role_menu` VALUES (22, 4, '2024-07-28 09:26:32', '2024-07-28 09:26:32');
INSERT INTO `role_menu` VALUES (23, 1, '2024-07-28 09:33:17', '2024-07-28 09:33:17');
INSERT INTO `role_menu` VALUES (23, 4, '2024-07-28 09:33:17', '2024-07-28 09:33:17');
INSERT INTO `role_menu` VALUES (24, 1, '2024-08-01 10:57:06', '2024-08-01 10:57:06');
INSERT INTO `role_menu` VALUES (24, 3, '2024-08-01 10:57:06', '2024-08-01 10:57:06');
INSERT INTO `role_menu` VALUES (24, 4, '2024-08-01 10:57:06', '2024-08-01 10:57:06');
INSERT INTO `role_menu` VALUES (24, 9, '2024-08-01 10:57:06', '2024-08-01 10:57:06');
INSERT INTO `role_menu` VALUES (24, 10, '2024-08-01 10:57:06', '2024-08-01 10:57:06');
INSERT INTO `role_menu` VALUES (24, 11, '2024-08-01 10:57:06', '2024-08-01 10:57:06');
INSERT INTO `role_menu` VALUES (24, 12, '2024-08-01 10:57:06', '2024-08-01 10:57:06');
INSERT INTO `role_menu` VALUES (24, 14, '2024-08-01 10:57:06', '2024-08-01 10:57:06');
INSERT INTO `role_menu` VALUES (24, 15, '2024-08-01 10:57:06', '2024-08-01 10:57:06');
INSERT INTO `role_menu` VALUES (24, 16, '2024-08-01 10:57:06', '2024-08-01 10:57:06');
INSERT INTO `role_menu` VALUES (24, 21, '2024-08-01 10:57:06', '2024-08-01 10:57:06');
INSERT INTO `role_menu` VALUES (24, 22, '2024-08-01 10:57:06', '2024-08-01 10:57:06');
INSERT INTO `role_menu` VALUES (24, 23, '2024-08-01 10:57:06', '2024-08-01 10:57:06');
INSERT INTO `role_menu` VALUES (24, 24, '2024-08-01 10:57:06', '2024-08-01 10:57:06');
INSERT INTO `role_menu` VALUES (24, 25, '2024-08-01 10:57:06', '2024-08-01 10:57:06');
INSERT INTO `role_menu` VALUES (24, 26, '2024-08-01 10:57:06', '2024-08-01 10:57:06');
INSERT INTO `role_menu` VALUES (24, 27, '2024-08-01 10:57:06', '2024-08-01 10:57:06');
INSERT INTO `role_menu` VALUES (24, 28, '2024-08-01 10:57:06', '2024-08-01 10:57:06');
INSERT INTO `role_menu` VALUES (24, 29, '2024-08-01 10:57:06', '2024-08-01 10:57:06');
INSERT INTO `role_menu` VALUES (24, 30, '2024-08-01 10:57:06', '2024-08-01 10:57:06');
INSERT INTO `role_menu` VALUES (24, 31, '2024-08-01 10:57:06', '2024-08-01 10:57:06');
INSERT INTO `role_menu` VALUES (24, 32, '2024-08-01 10:57:06', '2024-08-01 10:57:06');
INSERT INTO `role_menu` VALUES (24, 33, '2024-08-01 10:57:06', '2024-08-01 10:57:06');
INSERT INTO `role_menu` VALUES (24, 34, '2024-08-01 10:57:06', '2024-08-01 10:57:06');
INSERT INTO `role_menu` VALUES (24, 35, '2024-08-01 10:57:06', '2024-08-01 10:57:06');
INSERT INTO `role_menu` VALUES (24, 36, '2024-08-01 10:57:06', '2024-08-01 10:57:06');
INSERT INTO `role_menu` VALUES (24, 37, '2024-08-01 10:57:06', '2024-08-01 10:57:06');
INSERT INTO `role_menu` VALUES (24, 38, '2024-08-01 10:57:06', '2024-08-01 10:57:06');
INSERT INTO `role_menu` VALUES (24, 39, '2024-08-01 10:57:06', '2024-08-01 10:57:06');
INSERT INTO `role_menu` VALUES (24, 40, '2024-08-01 10:57:06', '2024-08-01 10:57:06');
INSERT INTO `role_menu` VALUES (24, 41, '2024-08-01 10:57:06', '2024-08-01 10:57:06');
INSERT INTO `role_menu` VALUES (24, 42, '2024-08-01 10:57:06', '2024-08-01 10:57:06');
INSERT INTO `role_menu` VALUES (24, 43, '2024-08-01 10:57:06', '2024-08-01 10:57:06');
INSERT INTO `role_menu` VALUES (24, 44, '2024-08-01 10:57:06', '2024-08-01 10:57:06');
INSERT INTO `role_menu` VALUES (24, 53, '2024-08-01 10:57:06', '2024-08-01 10:57:06');
INSERT INTO `role_menu` VALUES (27, 1, '2024-08-01 14:18:40', '2024-08-01 14:18:40');
INSERT INTO `role_menu` VALUES (27, 3, '2024-08-01 14:18:40', '2024-08-01 14:18:40');
INSERT INTO `role_menu` VALUES (27, 4, '2024-08-01 14:18:40', '2024-08-01 14:18:40');
INSERT INTO `role_menu` VALUES (27, 9, '2024-08-01 14:18:40', '2024-08-01 14:18:40');
INSERT INTO `role_menu` VALUES (27, 10, '2024-08-01 14:18:40', '2024-08-01 14:18:40');
INSERT INTO `role_menu` VALUES (27, 11, '2024-08-01 14:18:40', '2024-08-01 14:18:40');
INSERT INTO `role_menu` VALUES (27, 12, '2024-08-01 14:18:40', '2024-08-01 14:18:40');
INSERT INTO `role_menu` VALUES (27, 14, '2024-08-01 14:18:40', '2024-08-01 14:18:40');
INSERT INTO `role_menu` VALUES (27, 15, '2024-08-01 14:18:40', '2024-08-01 14:18:40');
INSERT INTO `role_menu` VALUES (27, 16, '2024-08-01 14:18:40', '2024-08-01 14:18:40');
INSERT INTO `role_menu` VALUES (27, 21, '2024-08-01 14:18:40', '2024-08-01 14:18:40');
INSERT INTO `role_menu` VALUES (27, 22, '2024-08-01 14:18:40', '2024-08-01 14:18:40');
INSERT INTO `role_menu` VALUES (27, 23, '2024-08-01 14:18:40', '2024-08-01 14:18:40');
INSERT INTO `role_menu` VALUES (27, 24, '2024-08-01 14:18:40', '2024-08-01 14:18:40');
INSERT INTO `role_menu` VALUES (27, 25, '2024-08-01 14:18:40', '2024-08-01 14:18:40');
INSERT INTO `role_menu` VALUES (27, 26, '2024-08-01 14:18:40', '2024-08-01 14:18:40');
INSERT INTO `role_menu` VALUES (27, 27, '2024-08-01 14:18:40', '2024-08-01 14:18:40');
INSERT INTO `role_menu` VALUES (27, 28, '2024-08-01 14:18:40', '2024-08-01 14:18:40');
INSERT INTO `role_menu` VALUES (27, 29, '2024-08-01 14:18:40', '2024-08-01 14:18:40');
INSERT INTO `role_menu` VALUES (27, 30, '2024-08-01 14:18:40', '2024-08-01 14:18:40');
INSERT INTO `role_menu` VALUES (27, 31, '2024-08-01 14:18:40', '2024-08-01 14:18:40');
INSERT INTO `role_menu` VALUES (27, 32, '2024-08-01 14:18:40', '2024-08-01 14:18:40');
INSERT INTO `role_menu` VALUES (27, 33, '2024-08-01 14:18:40', '2024-08-01 14:18:40');
INSERT INTO `role_menu` VALUES (27, 34, '2024-08-01 14:18:40', '2024-08-01 14:18:40');
INSERT INTO `role_menu` VALUES (27, 35, '2024-08-01 14:18:40', '2024-08-01 14:18:40');
INSERT INTO `role_menu` VALUES (27, 36, '2024-08-01 14:18:40', '2024-08-01 14:18:40');
INSERT INTO `role_menu` VALUES (27, 37, '2024-08-01 14:18:40', '2024-08-01 14:18:40');
INSERT INTO `role_menu` VALUES (27, 38, '2024-08-01 14:18:40', '2024-08-01 14:18:40');
INSERT INTO `role_menu` VALUES (27, 39, '2024-08-01 14:18:40', '2024-08-01 14:18:40');
INSERT INTO `role_menu` VALUES (27, 40, '2024-08-01 14:18:40', '2024-08-01 14:18:40');
INSERT INTO `role_menu` VALUES (27, 41, '2024-08-01 14:18:40', '2024-08-01 14:18:40');
INSERT INTO `role_menu` VALUES (27, 42, '2024-08-01 14:18:40', '2024-08-01 14:18:40');
INSERT INTO `role_menu` VALUES (27, 43, '2024-08-01 14:18:40', '2024-08-01 14:18:40');
INSERT INTO `role_menu` VALUES (27, 44, '2024-08-01 14:18:40', '2024-08-01 14:18:40');
INSERT INTO `role_menu` VALUES (27, 53, '2024-08-01 14:18:40', '2024-08-01 14:18:40');

-- ----------------------------
-- Table structure for sales
-- ----------------------------
DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales`  (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `saleCount` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sales
-- ----------------------------
INSERT INTO `sales` VALUES (7, '秋装女2018新款早秋女装裙子韩版针织连衣裙+衬衫上衣时尚套装', 32070);
INSERT INTO `sales` VALUES (8, '套装女春秋2018新款时尚复古气质个性连帽卫衣两件套', 28990);
INSERT INTO `sales` VALUES (11, '时尚套装两件套2018韩版网红社会宽松连帽卫衣+高腰显瘦开叉半身裙学院风休闲秋装女套装新款', 23765);
INSERT INTO `sales` VALUES (17, '网红同款实拍秋季女装2018新款女初恋复古中长款针织连衣裙半身裙时尚套装两件套', 21355);
INSERT INTO `sales` VALUES (18, '2018秋冬新款ins超火针织时尚两件套小香风套装女', 20288);
INSERT INTO `sales` VALUES (22, 'chic港味秋装女套装新款2018韩版格子西装外套+显瘦高腰破洞小脚裤学院风时尚套装两件套', 19993);
INSERT INTO `sales` VALUES (27, '中长款长袖连衣裙秋装新款2018韩版休闲胖mm大码女装裙子女学生宽松松垮垮中长款卫衣裙外套', 19045);
INSERT INTO `sales` VALUES (28, '2018秋新款韩版时尚简约系带显瘦条纹系带西服套装女', 17587);
INSERT INTO `sales` VALUES (31, '秋季新款套装两件套秋装2018新款韩版chic泡泡袖衬衫上衣+高腰显瘦牛仔裤学院风时尚套装', 17225);
INSERT INTO `sales` VALUES (32, '2018新款时尚百搭黑色宽松机车皮夹克+网纱半身裙套装两件套', 16985);

-- ----------------------------
-- Table structure for summary
-- ----------------------------
DROP TABLE IF EXISTS `summary`;
CREATE TABLE `summary`  (
  `amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tips` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `number1` int NOT NULL,
  `number2` int NOT NULL,
  PRIMARY KEY (`amount`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of summary
-- ----------------------------
INSERT INTO `summary` VALUES ('favor', '商品总收藏', '所有商品的总收藏', '商品总收藏', 87226, 87226);
INSERT INTO `summary` VALUES ('inventory', '商品总库存', '所有商品的总库存', '商品总库存', 853667, 853667);
INSERT INTO `summary` VALUES ('sale', '商品总销量', '所有商品的总销量', '商品总销量', 509989, 509989);
INSERT INTO `summary` VALUES ('saleroom', '商品总销售额', '所有商品的总销售额', '商品总销售额', 43118530, 43118530);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `userid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `roleid` int NULL DEFAULT NULL,
  `cellphone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `state` int NULL DEFAULT NULL,
  `departmentid` int NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `realname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (16, 'CoderTon', '91b95d4dc02db2adafece6462ef842fa', '2f0f71cbce91aeb9e3765ab954638151', 1, '13344556677', 1, 1, '2024-07-23 07:58:26', '2024-07-31 17:04:03', '汪枫');
INSERT INTO `users` VALUES (47, 'Coder1', '06b729800fa6bd1c4e174b62f8dafc69', '4870d17d022dac3b15c0c3d8fd7ed959', 1, '14455667788', 1, 1, '2024-07-30 08:37:51', '2024-07-31 12:27:49', 'TestPatch');
INSERT INTO `users` VALUES (48, '测序修改211', 'cc802710ba31b7f18c5aaecf87e893e1', '4bc26b9466b68d8f60df94fdcd8538d5', 6, '12', NULL, 2, '2024-07-31 10:33:15', '2024-07-31 17:02:36', 'q');
INSERT INTO `users` VALUES (49, '1111', '416fc93837fbd2e92ee9c88c80ec7ff0', '8fa3abd753148536df0926bdb9cd3b4b', 6, '1', 0, 2, '2024-07-31 10:34:41', '2024-07-31 17:13:59', '1');
INSERT INTO `users` VALUES (50, 'q1', '3eeb945dbc4b98050cfbbaa4968f037d', 'be72034d93c674f5d3ccaf92e8ba1d8e', 4, '12', 0, 1, '2024-07-31 10:36:11', '2024-07-31 11:24:54', 'q1');
INSERT INTO `users` VALUES (51, '测试去', 'da82d901e6977691930975b73d17d43d', '92d4ac4709d4394dae69df4531558478', 4, '12344556677', 0, 1, '2024-07-31 10:37:04', '2024-07-31 17:07:11', '测试');
INSERT INTO `users` VALUES (52, '1321', '', 'a618e94c4b7fa8d8b1cef576e78abef5', 3, '3312', NULL, 2, '2024-07-31 10:39:27', '2024-07-31 17:02:05', '313');
INSERT INTO `users` VALUES (53, 'test1', 'e6ea145d7ba413620e6f0ccf55fa5b14', '8625f33deea359d5c990014f3a9ae81e', 6, '1234567890', 0, 1, '2024-07-31 11:14:08', '2024-07-31 11:24:56', '123');
INSERT INTO `users` VALUES (54, 'TestOne', 'a0e8da73291f28565d61edbaad598672', '7c79bba5fe00cedd9ccf3bccb32e0065', 6, '12344556677', 0, 1, '2024-07-31 11:15:49', '2024-07-31 11:24:56', 'Test');
INSERT INTO `users` VALUES (55, '测试三', '59e1bc788bacc51b26379bf3204502dd', '1da7c86d1ac3330eae91d3a903ba3f47', 2, '123', 0, 1, '2024-07-31 11:22:15', '2024-07-31 11:24:57', '123');
INSERT INTO `users` VALUES (56, '12', '26e28037a8bbdc042309fc3eaf0dbbc1', 'f1bb65341c80742671af3de10357f6fa', 7, '12', NULL, 1, '2024-07-31 11:27:12', '2024-07-31 11:27:12', '12');
INSERT INTO `users` VALUES (57, 'cefehio', '2c00810106e0704129805b8d6ad97ef5', 'dd49e74fa388959245a9f98fe40035a7', 6, 'fe', NULL, 1, '2024-07-31 11:27:42', '2024-08-01 14:23:49', 'fewqfwq1·');
INSERT INTO `users` VALUES (58, 'Code1r', '3d2c9fc88145f2960a7dabb0532a7369', 'ab446b4fba4f5d8b4bbabe2cb936e8aa', 1, '14455667788', NULL, 1, '2024-07-31 12:09:45', '2024-07-31 12:09:45', '小明');
INSERT INTO `users` VALUES (59, 'Code111r', '8b9a63197dc4d104153e756d0eee8722', '4a9f6b724234e1ca199f6956122f23be', 1, '14455667788', NULL, 1, '2024-07-31 12:10:06', '2024-07-31 12:10:06', '小明');
INSERT INTO `users` VALUES (60, 'vaevafe', '602c3db8214cb670c073ed7cac65a65c', '1f4e1c5779d827e585f276a70086beb6', 1, '14455667788', NULL, 1, '2024-07-31 12:10:21', '2024-07-31 12:10:21', '小明11');
INSERT INTO `users` VALUES (61, '111测啊v测', 'b236847d1fc3e35f2794206dc5e025bd', '133b1c4a4c0a4e59a029c95369ac66d3', 1, '14455667788', NULL, 1, '2024-07-31 12:11:01', '2024-07-31 12:11:01', '小明11');
INSERT INTO `users` VALUES (62, '测试三1221', '45b21a3177a17179c7457e48b810db60', 'ec15960aaf9302d2436f3ff599f59b16', 2, '123', NULL, 1, '2024-07-31 12:19:26', '2024-07-31 12:19:26', '123');
INSERT INTO `users` VALUES (65, 'CoderJoon', 'e5fd36af8443fa7e6d47c7a8ceab3b52', '3e3bcf582c52c4a86c619c85af7e513c', NULL, NULL, NULL, NULL, '2024-08-02 13:40:41', '2024-08-02 13:40:41', NULL);

SET FOREIGN_KEY_CHECKS = 1;
