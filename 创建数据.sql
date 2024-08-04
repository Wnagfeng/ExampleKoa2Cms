-- 用户相关
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    UserName VARCHAR(50) NOT NULL,
    Password VARCHAR(255) NOT NULL
);
ALTER TABLE `users`
ADD COLUMN `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE `users`
ADD COLUMN `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 部门相关
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` tinyint(1) NULL DEFAULT NULL,
  `leader` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `parentId` int NULL DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parentId`(`parentId` ASC) USING BTREE,
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`parentId`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 CHARACTER SET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=Dynamic;



INSERT INTO `department` VALUES (1, '人事部', NULL, '汪枫', 1, '2023-08-10 22:17:04', '2023-08-10 22:18:31');
INSERT INTO `department` VALUES (2, '总裁办', NULL, 'lily', 2, '2023-08-10 22:17:30', '2023-08-11 20:35:01');
INSERT INTO `department` VALUES (3, '开发部', NULL, '汪枫', 1, '2023-08-10 22:18:08', '2023-08-10 22:18:08');

-- 角色相关
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `intro` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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


DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` tinyint(1) NULL DEFAULT NULL,
  `url` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sort` int NULL DEFAULT 100,
  `parentId` int NULL DEFAULT NULL,
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `url`(`url` ASC) USING BTREE,
  UNIQUE INDEX `icon`(`icon` ASC) USING BTREE,
  INDEX `parentId`(`parentId` ASC) USING BTREE,
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parentId`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- 可视化相关
CREATE TABLE categories (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    goodsCount INT NOT NULL
);

CREATE TABLE inventory (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    goodsCount INT
);

CREATE TABLE favor (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    goodsFavor INT
);

CREATE TABLE sales (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    saleCount INT NOT NULL
);

CREATE TABLE city_sales (
    address VARCHAR(255) PRIMARY KEY,
    count INT NOT NULL
);

CREATE TABLE summary (
    amount VARCHAR(255) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    tips VARCHAR(255) NOT NULL,
    subtitle VARCHAR(255) NOT NULL,
    number1 INT NOT NULL,
    number2 INT NOT NULL
);

INSERT INTO categories (id, name, goodsCount) VALUES
(2, '上衣', 14),
(3, '裤子', 19),
(4, '鞋子', 19),
(5, '厨具', 18),
(6, '家具', 18),
(7, '床上用品', 19),
(8, '女装', 35),
(9, 'Polo', 0),
(1979, '测试', 0),
(1980, '测试26644', 0);

INSERT INTO inventory (id, name, goodsCount) VALUES
(2, '上衣', 49749),
(3, '裤子', 84754),
(4, '鞋子', 58283),
(5, '厨具', 57354),
(6, '家具', 49002),
(7, '床上用品', 98579),
(8, '女装', 112268),
(9, 'Polo', NULL);
INSERT INTO favor (id, name, goodsFavor) VALUES
(2, '上衣', 6091),
(3, '裤子', 4939),
(4, '鞋子', 19647),
(5, '厨具', 13906),
(6, '家具', 15425),
(7, '床上用品', 7307),
(8, '女装', 19911),
(9, 'Polo', NULL);
INSERT INTO sales (id, name, saleCount) VALUES
(7, '秋装女2018新款早秋女装裙子韩版针织连衣裙+衬衫上衣时尚套装', 32070),
(8, '套装女春秋2018新款时尚复古气质个性连帽卫衣两件套', 28990),
(11, '时尚套装两件套2018韩版网红社会宽松连帽卫衣+高腰显瘦开叉半身裙学院风休闲秋装女套装新款', 23765),
(17, '网红同款实拍秋季女装2018新款女初恋复古中长款针织连衣裙半身裙时尚套装两件套', 21355),
(18, '2018秋冬新款ins超火针织时尚两件套小香风套装女', 20288),
(22, 'chic港味秋装女套装新款2018韩版格子西装外套+显瘦高腰破洞小脚裤学院风时尚套装两件套', 19993),
(27, '中长款长袖连衣裙秋装新款2018韩版休闲胖mm大码女装裙子女学生宽松松垮垮中长款卫衣裙外套', 19045),
(28, '2018秋新款韩版时尚简约系带显瘦条纹系带西服套装女', 17587),
(31, '秋季新款套装两件套秋装2018新款韩版chic泡泡袖衬衫上衣+高腰显瘦牛仔裤学院风时尚套装', 17225),
(32, '2018新款时尚百搭黑色宽松机车皮夹克+网纱半身裙套装两件套', 16985);

INSERT INTO city_sales (address, count) VALUES
('上海', 62239),
('南京', 55683),
('郑州', 53716),
('广州', 6364),
('西安', 64976),
('长沙', 4142),
('昆明', 9524),
('武汉', 28212),
('重庆', 60777),
('沈阳', 20900),
('宁波', 66584),
('苏州', 1136),
('青岛', 9021),
('成都', 23378),
('北京', 6107),
('天津', 5096),
('深圳', 12480),
('杭州', 19654);
INSERT INTO summary (amount, title, tips, subtitle, number1, number2) VALUES
('sale', '商品总销量', '所有商品的总销量', '商品总销量', 509989, 509989),
('favor', '商品总收藏', '所有商品的总收藏', '商品总收藏', 87226, 87226),
('inventory', '商品总库存', '所有商品的总库存', '商品总库存', 853667, 853667),
('saleroom', '商品总销售额', '所有商品的总销售额', '商品总销售额', 43118530, 43118530);

CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    oldPrice DECIMAL(10, 2),
    newPrice DECIMAL(10, 2),
    `desc` TEXT,
    status INT,
    imgUrl VARCHAR(255),
    inventoryCount INT,
    saleCount INT,
    favorCount INT,
    address VARCHAR(255),
    categoryId INT,
    createAt DATETIME,
    updateAt DATETIME,
    FOREIGN KEY (categoryId) REFERENCES categories(id)
);

ALTER TABLE products MODIFY id INT AUTO_INCREMENT;

ALTER TABLE categories MODIFY id INT AUTO_INCREMENT;


ALTER TABLE products DROP FOREIGN KEY products_ibfk_1;
ALTER TABLE products ADD CONSTRAINT products_ibfk_1 FOREIGN KEY (categoryId) REFERENCES categories(id);

ALTER TABLE categories MODIFY goodsCount INT DEFAULT 0;

-- menu相关
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

-- 角色和menu
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;




