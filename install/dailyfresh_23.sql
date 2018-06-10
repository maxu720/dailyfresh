/*
Navicat MySQL Data Transfer

Source Server         : 192.168.159.131_3306
Source Server Version : 50722
Source Host           : 192.168.159.131:3306
Source Database       : dailyfresh_23

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-05-27 11:47:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_326202911ab1e00f_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_326202911ab1e00f_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_37891b0a01347652_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_4abdd6debb149ff2_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('11', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('13', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('14', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('16', 'Can add 商品类别', '6', 'add_goodscategory');
INSERT INTO `auth_permission` VALUES ('17', 'Can change 商品类别', '6', 'change_goodscategory');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete 商品类别', '6', 'delete_goodscategory');
INSERT INTO `auth_permission` VALUES ('19', 'Can add 商品', '7', 'add_goods');
INSERT INTO `auth_permission` VALUES ('20', 'Can change 商品', '7', 'change_goods');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete 商品', '7', 'delete_goods');
INSERT INTO `auth_permission` VALUES ('22', 'Can add 商品SKU', '8', 'add_goodssku');
INSERT INTO `auth_permission` VALUES ('23', 'Can change 商品SKU', '8', 'change_goodssku');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete 商品SKU', '8', 'delete_goodssku');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 商品图片', '9', 'add_goodsimage');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 商品图片', '9', 'change_goodsimage');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 商品图片', '9', 'delete_goodsimage');
INSERT INTO `auth_permission` VALUES ('28', 'Can add 主页轮播商品', '10', 'add_indexgoodsbanner');
INSERT INTO `auth_permission` VALUES ('29', 'Can change 主页轮播商品', '10', 'change_indexgoodsbanner');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete 主页轮播商品', '10', 'delete_indexgoodsbanner');
INSERT INTO `auth_permission` VALUES ('31', 'Can add 主页分类展示商品', '11', 'add_indexcategorygoodsbanner');
INSERT INTO `auth_permission` VALUES ('32', 'Can change 主页分类展示商品', '11', 'change_indexcategorygoodsbanner');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete 主页分类展示商品', '11', 'delete_indexcategorygoodsbanner');
INSERT INTO `auth_permission` VALUES ('34', 'Can add 主页促销活动', '12', 'add_indexpromotionbanner');
INSERT INTO `auth_permission` VALUES ('35', 'Can change 主页促销活动', '12', 'change_indexpromotionbanner');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete 主页促销活动', '12', 'delete_indexpromotionbanner');
INSERT INTO `auth_permission` VALUES ('37', 'Can add order info', '13', 'add_orderinfo');
INSERT INTO `auth_permission` VALUES ('38', 'Can change order info', '13', 'change_orderinfo');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete order info', '13', 'delete_orderinfo');
INSERT INTO `auth_permission` VALUES ('40', 'Can add order goods', '14', 'add_ordergoods');
INSERT INTO `auth_permission` VALUES ('41', 'Can change order goods', '14', 'change_ordergoods');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete order goods', '14', 'delete_ordergoods');
INSERT INTO `auth_permission` VALUES ('43', 'Can add user', '15', 'add_user');
INSERT INTO `auth_permission` VALUES ('44', 'Can change user', '15', 'change_user');
INSERT INTO `auth_permission` VALUES ('45', 'Can delete user', '15', 'delete_user');
INSERT INTO `auth_permission` VALUES ('46', 'Can add address', '16', 'add_address');
INSERT INTO `auth_permission` VALUES ('47', 'Can change address', '16', 'change_address');
INSERT INTO `auth_permission` VALUES ('48', 'Can delete address', '16', 'delete_address');

-- ----------------------------
-- Table structure for df_address
-- ----------------------------
DROP TABLE IF EXISTS `df_address`;
CREATE TABLE `df_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `receiver_name` varchar(20) NOT NULL,
  `receiver_mobile` varchar(11) NOT NULL,
  `detail_addr` varchar(256) NOT NULL,
  `zip_code` varchar(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_address_user_id_6808dac90744f824_fk_df_users_id` (`user_id`),
  CONSTRAINT `df_address_user_id_6808dac90744f824_fk_df_users_id` FOREIGN KEY (`user_id`) REFERENCES `df_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_address
-- ----------------------------
INSERT INTO `df_address` VALUES ('1', '2018-03-05 13:49:01.999170', '2018-03-05 13:49:01.999247', 'hgvj', ';/', 'kjnblknl', '.m;l/', '7');
INSERT INTO `df_address` VALUES ('2', '2018-03-07 06:32:15.201340', '2018-03-07 06:32:15.201395', 'aaaa', 'aaaa', 'aaaaa', 'aaa', '7');

-- ----------------------------
-- Table structure for df_goods
-- ----------------------------
DROP TABLE IF EXISTS `df_goods`;
CREATE TABLE `df_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `desc` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_goods
-- ----------------------------
INSERT INTO `df_goods` VALUES ('1', '2017-10-16 03:03:05.257969', '2017-10-16 03:03:05.258130', '草莓', '<p><strong>很不错的草莓</strong></p>');
INSERT INTO `df_goods` VALUES ('2', '2017-10-16 03:05:36.964951', '2017-10-16 03:05:36.965129', '葡萄', '');
INSERT INTO `df_goods` VALUES ('3', '2017-10-16 03:05:52.323866', '2017-10-16 03:05:52.323949', '柠檬', '');
INSERT INTO `df_goods` VALUES ('4', '2017-10-16 03:06:01.267481', '2017-10-16 03:06:01.267615', '奇异果', '');
INSERT INTO `df_goods` VALUES ('5', '2017-10-16 03:06:30.418683', '2017-10-16 03:06:30.418789', '大青虾', '');
INSERT INTO `df_goods` VALUES ('6', '2017-10-16 03:06:35.994464', '2017-10-16 03:06:35.994567', '秋刀鱼', '');
INSERT INTO `df_goods` VALUES ('7', '2017-10-16 03:06:48.115318', '2017-10-16 03:06:48.115410', '扇贝', '');
INSERT INTO `df_goods` VALUES ('8', '2017-10-16 03:07:03.057514', '2017-10-16 03:07:03.057601', '基围虾', '');
INSERT INTO `df_goods` VALUES ('9', '2017-10-16 03:07:36.306725', '2017-10-16 03:07:36.306926', '猪肉', '');
INSERT INTO `df_goods` VALUES ('10', '2017-10-16 03:07:39.056064', '2017-10-16 03:07:39.056145', '牛肉', '');
INSERT INTO `df_goods` VALUES ('11', '2017-10-16 03:07:41.955755', '2017-10-16 03:07:41.955833', '羊肉', '');
INSERT INTO `df_goods` VALUES ('12', '2017-10-16 03:07:44.741474', '2017-10-16 03:07:44.741574', '牛排', '');
INSERT INTO `df_goods` VALUES ('13', '2017-10-16 03:07:51.748699', '2017-10-16 03:07:51.748828', '鸡蛋', '');
INSERT INTO `df_goods` VALUES ('14', '2017-10-16 03:07:56.413773', '2017-10-16 03:07:56.413853', '鸡肉', '');
INSERT INTO `df_goods` VALUES ('15', '2017-10-16 03:07:59.568405', '2017-10-16 03:07:59.568554', '鸭蛋', '');
INSERT INTO `df_goods` VALUES ('16', '2017-10-16 03:08:03.020608', '2017-10-16 03:08:03.020764', '鸡腿', '');
INSERT INTO `df_goods` VALUES ('17', '2017-10-16 03:08:10.063820', '2017-10-16 03:08:10.063898', '白菜', '');
INSERT INTO `df_goods` VALUES ('18', '2017-10-16 03:08:13.315906', '2017-10-16 03:08:13.316025', '芹菜', '');
INSERT INTO `df_goods` VALUES ('19', '2017-10-16 03:08:16.351445', '2017-10-16 03:08:16.351526', '香菜', '');
INSERT INTO `df_goods` VALUES ('20', '2017-10-16 03:08:24.232660', '2017-10-16 03:08:24.232743', '冬瓜', '');
INSERT INTO `df_goods` VALUES ('21', '2017-10-16 03:08:36.939678', '2017-10-16 03:08:36.940113', '鱼丸', '');
INSERT INTO `df_goods` VALUES ('22', '2017-10-16 03:08:43.194862', '2017-10-16 03:08:43.194985', '蟹棒', '');
INSERT INTO `df_goods` VALUES ('23', '2017-10-16 03:08:50.771785', '2017-10-16 03:08:50.771931', '虾丸', '');
INSERT INTO `df_goods` VALUES ('24', '2017-10-16 03:09:01.546052', '2017-10-16 03:09:01.546152', '速冻水饺', '');

-- ----------------------------
-- Table structure for df_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `df_goods_category`;
CREATE TABLE `df_goods_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `name` varchar(20) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_goods_category
-- ----------------------------
INSERT INTO `df_goods_category` VALUES ('1', '2017-10-16 03:00:01.655105', '2017-10-16 03:00:01.655201', '新鲜水果', 'fruit', 'group1/M00/00/00/CtM3BVnkILGACHh0AAAmv27pX4k2790330');
INSERT INTO `df_goods_category` VALUES ('2', '2017-10-16 03:00:26.853310', '2017-10-16 03:00:26.853397', '海鲜水产', 'seafood', 'group1/M00/00/00/CtM3BVnkIMqAW9MwAABHr3RQqFs8076962');
INSERT INTO `df_goods_category` VALUES ('3', '2017-10-16 03:00:41.396890', '2017-10-16 03:00:41.397121', '猪牛羊肉', 'meet', 'group1/M00/00/00/CtM3BVnkINmAEIKKAAAy1Tlm9So4047150');
INSERT INTO `df_goods_category` VALUES ('4', '2017-10-16 03:00:55.190135', '2017-10-16 03:00:55.190223', '禽类蛋品', 'egg', 'group1/M00/00/00/CtM3BVnkIOeAG0B6AAAqR4DoSUg1061194');
INSERT INTO `df_goods_category` VALUES ('5', '2017-10-16 03:01:24.116307', '2017-10-16 03:01:24.116640', '新鲜蔬菜', 'vegetables', 'group1/M00/00/00/CtM3BVnkIQSARC1UAAA-0ZoYkpM7754350');
INSERT INTO `df_goods_category` VALUES ('6', '2017-10-16 03:01:54.662968', '2017-10-16 03:01:54.663066', '速冻食品', 'ice', 'group1/M00/00/00/CtM3BVnkISKAJwJqAAA3sZPrVzQ4838643');

-- ----------------------------
-- Table structure for df_goods_image
-- ----------------------------
DROP TABLE IF EXISTS `df_goods_image`;
CREATE TABLE `df_goods_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `image` varchar(100) NOT NULL,
  `sku_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_goods_image_22ad5bca` (`sku_id`),
  CONSTRAINT `df_goods_image_sku_id_75ce8a33cdb24519_fk_df_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `df_goods_sku` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_goods_image
-- ----------------------------
INSERT INTO `df_goods_image` VALUES ('1', '2017-10-16 03:26:50.235040', '2017-10-16 03:26:50.235119', 'group1/M00/00/01/CtM3BVnkJvqARg4OAAAm3lfXL-Q4989750', '1');
INSERT INTO `df_goods_image` VALUES ('2', '2017-10-16 03:26:58.043760', '2017-10-16 03:26:58.043856', 'group1/M00/00/01/CtM3BVnkJwKAMbGgAAAm3lfXL-Q2310134', '2');

-- ----------------------------
-- Table structure for df_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `df_goods_sku`;
CREATE TABLE `df_goods_sku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `title` varchar(200) NOT NULL,
  `unit` varchar(10) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `sales` int(11) NOT NULL,
  `default_image` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `category_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_goods_sku_category_id_c87ff048768edce_fk_df_goods_category_id` (`category_id`),
  KEY `df_goods_sku_goods_id_65edd041dfc86646_fk_df_goods_id` (`goods_id`),
  CONSTRAINT `df_goods_sku_category_id_c87ff048768edce_fk_df_goods_category_id` FOREIGN KEY (`category_id`) REFERENCES `df_goods_category` (`id`),
  CONSTRAINT `df_goods_sku_goods_id_65edd041dfc86646_fk_df_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `df_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_goods_sku
-- ----------------------------
INSERT INTO `df_goods_sku` VALUES ('1', '2017-10-16 03:10:14.045538', '2017-10-16 03:10:14.045649', '草莓 500g', '草莓简介', '500g', '10.00', '98', '0', 'group1/M00/00/00/CtM3BVnkIxaAR7GHAAAljHPuXJg5431541', '1', '1', '1');
INSERT INTO `df_goods_sku` VALUES ('2', '2017-10-16 03:11:04.490384', '2017-10-16 03:11:04.490462', '盒装草莓', '草莓简介', '盒', '20.00', '10', '0', 'group1/M00/00/00/CtM3BVnkI0iAUprjAAAljHPuXJg5371806', '1', '1', '1');
INSERT INTO `df_goods_sku` VALUES ('3', '2017-10-16 03:12:32.165020', '2017-10-16 03:12:32.165114', '葡萄', '葡萄简介', '500g', '20.00', '7', '0', 'group1/M00/00/00/CtM3BVnkI6CAURm4AAAjjiYTEkw1194059', '1', '1', '2');
INSERT INTO `df_goods_sku` VALUES ('4', '2017-10-16 03:13:16.457844', '2017-10-16 03:13:16.457926', '柠檬', '简介', '500g', '32.00', '12', '0', 'group1/M00/00/00/CtM3BVnkI8yAHR3YAAAgnaeGwNQ6779834', '1', '1', '3');
INSERT INTO `df_goods_sku` VALUES ('5', '2017-10-16 03:14:05.799352', '2017-10-16 03:14:05.799588', '奇异果', '简介', '500g', '12.12', '12', '0', 'group1/M00/00/00/CtM3BVnkI_2AToqyAAAeuLYy0pU9946037', '1', '1', '4');
INSERT INTO `df_goods_sku` VALUES ('6', '2017-10-16 03:15:09.971968', '2017-10-16 03:15:09.972047', '大青虾', '简介', '500g', '34.00', '12', '0', 'group1/M00/00/00/CtM3BVnkJD2AQx9zAAAk0DN4-yE8467862', '1', '2', '5');
INSERT INTO `df_goods_sku` VALUES ('7', '2017-10-16 03:15:53.812181', '2017-10-16 03:15:53.812292', '北海道秋刀鱼', '简介', '500g', '50.00', '15', '0', 'group1/M00/00/00/CtM3BVnkJGmAecHxAAAkaP_7_181619603', '1', '2', '6');
INSERT INTO `df_goods_sku` VALUES ('8', '2017-10-16 03:16:24.763232', '2017-10-16 03:16:24.763324', '扇贝', '简介', '500g', '56.60', '13', '0', 'group1/M00/00/00/CtM3BVnkJIiAd8kxAAAk8WCqqmI1965678', '1', '2', '7');
INSERT INTO `df_goods_sku` VALUES ('9', '2017-10-16 03:17:13.426611', '2017-10-16 03:17:13.426790', '基围虾', '简介', '500g', '100.90', '14', '0', 'group1/M00/00/00/CtM3BVnkJLmAI1K-AAAkaP_7_189355042', '1', '2', '8');
INSERT INTO `df_goods_sku` VALUES ('10', '2017-10-16 03:17:47.656066', '2017-10-16 03:17:47.656152', '猪肉', '简介', '500g', '23.99', '100', '0', 'group1/M00/00/00/CtM3BVnkJNuADLYAAAAWnwO6wpU7499459', '1', '3', '9');
INSERT INTO `df_goods_sku` VALUES ('11', '2017-10-16 03:18:15.497630', '2017-10-16 03:18:15.497764', '牛肉', '简介', '500g', '34.99', '100', '0', 'group1/M00/00/00/CtM3BVnkJPeAc2aGAAAcLRyfMSc4681259', '1', '3', '10');
INSERT INTO `df_goods_sku` VALUES ('12', '2017-10-16 03:18:44.453933', '2017-10-16 03:18:44.454010', '羊肉', '简介', '500g', '56.99', '100', '0', 'group1/M00/00/00/CtM3BVnkJRSAXMuGAAAgbU6nbaA2977481', '1', '3', '11');
INSERT INTO `df_goods_sku` VALUES ('13', '2017-10-16 03:19:10.209472', '2017-10-16 03:19:10.209556', '牛排', '简介', '500g', '99.99', '100', '0', 'group1/M00/00/00/CtM3BVnkJS6AVSDWAAAgrKNKuOg9088924', '1', '3', '12');
INSERT INTO `df_goods_sku` VALUES ('14', '2017-10-16 03:19:44.020204', '2017-10-16 03:19:44.020284', '盒装鸡蛋', '简介', '500g', '23.00', '100', '0', 'group1/M00/00/00/CtM3BVnkJVCAFDKSAAAk8WCqqmI8466582', '1', '4', '13');
INSERT INTO `df_goods_sku` VALUES ('15', '2017-10-16 03:20:20.962831', '2017-10-16 03:20:20.963038', '鸡肉', '简介', '500g', '32.00', '100', '0', 'group1/M00/00/00/CtM3BVnkJXSAXbesAAAiQjDS7wA8116965', '1', '4', '14');
INSERT INTO `df_goods_sku` VALUES ('16', '2017-10-16 03:20:53.724305', '2017-10-16 03:20:53.724397', '鸭蛋', '简介', '盒', '45.00', '121', '0', 'group1/M00/00/00/CtM3BVnkJZWAIwBOAAAiQjDS7wA4382174', '1', '4', '15');
INSERT INTO `df_goods_sku` VALUES ('17', '2017-10-16 03:21:22.965398', '2017-10-16 03:21:22.965474', '鸡腿', '简介', '500g', '45.00', '12', '0', 'group1/M00/00/00/CtM3BVnkJbKADk2yAAAWnwO6wpU5481130', '1', '4', '16');
INSERT INTO `df_goods_sku` VALUES ('18', '2017-10-16 03:22:04.462490', '2017-10-16 03:22:04.462571', '白菜', '简介', '500g', '4.50', '100', '0', 'group1/M00/00/00/CtM3BVnkJdyAKycGAAAaabPqzqc6717404', '1', '5', '17');
INSERT INTO `df_goods_sku` VALUES ('19', '2017-10-16 03:22:31.745392', '2017-10-16 03:22:31.745499', '芹菜', '简介', '500g', '3.50', '12', '0', 'group1/M00/00/00/CtM3BVnkJfeAVv-jAAAjjiYTEkw8506724', '1', '5', '18');
INSERT INTO `df_goods_sku` VALUES ('20', '2017-10-16 03:23:21.161526', '2017-10-16 03:23:21.162070', '香菜', '简介', '500g', '7.90', '100', '0', 'group1/M00/00/00/CtM3BVnkJimAEK7MAAAcLRyfMSc6464688', '1', '5', '19');
INSERT INTO `df_goods_sku` VALUES ('21', '2017-10-16 03:23:46.986158', '2017-10-16 03:23:46.986234', '冬瓜', '简介', '500g', '12.99', '100', '0', 'group1/M00/00/00/CtM3BVnkJkKAQdJrAAAhst2hSFQ6848699', '1', '5', '20');
INSERT INTO `df_goods_sku` VALUES ('22', '2017-10-16 03:24:10.445214', '2017-10-16 03:24:10.445291', '鱼丸', '简介', '500g', '66.00', '12', '0', 'group1/M00/00/01/CtM3BVnkJlqAePKjAAAcLRyfMSc8759431', '1', '6', '21');
INSERT INTO `df_goods_sku` VALUES ('23', '2017-10-16 03:24:37.927158', '2017-10-16 03:24:37.927235', '蟹棒', '简介', '500g', '68.00', '100', '0', 'group1/M00/00/01/CtM3BVnkJnWAUV_LAAAljHPuXJg1247606', '1', '6', '22');
INSERT INTO `df_goods_sku` VALUES ('24', '2017-10-16 03:25:18.235816', '2017-10-16 03:25:18.235901', '虾丸', '简介', '500g', '89.99', '100', '0', 'group1/M00/00/01/CtM3BVnkJp6AHVPPAAAZxC0XRLc2377246', '1', '6', '23');
INSERT INTO `df_goods_sku` VALUES ('25', '2017-10-16 03:25:56.170531', '2017-10-16 03:25:56.170611', '速冻水饺', '简介', '袋', '20.00', '100', '0', 'group1/M00/00/01/CtM3BVnkJsSAYntSAAAcLRyfMSc1347281', '1', '6', '24');

-- ----------------------------
-- Table structure for df_index_category_goods
-- ----------------------------
DROP TABLE IF EXISTS `df_index_category_goods`;
CREATE TABLE `df_index_category_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `display_type` smallint(6) NOT NULL,
  `index` smallint(6) NOT NULL,
  `category_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_index_cat_category_id_19bdee5083c88d5_fk_df_goods_category_id` (`category_id`),
  KEY `df_index_category_goo_sku_id_5a1bd13e4d7c3156_fk_df_goods_sku_id` (`sku_id`),
  CONSTRAINT `df_index_cat_category_id_19bdee5083c88d5_fk_df_goods_category_id` FOREIGN KEY (`category_id`) REFERENCES `df_goods_category` (`id`),
  CONSTRAINT `df_index_category_goo_sku_id_5a1bd13e4d7c3156_fk_df_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `df_goods_sku` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_index_category_goods
-- ----------------------------
INSERT INTO `df_index_category_goods` VALUES ('1', '2017-10-16 03:33:46.743381', '2017-10-16 03:33:46.743473', '1', '0', '1', '1');
INSERT INTO `df_index_category_goods` VALUES ('2', '2017-10-16 03:33:57.241666', '2017-10-16 03:33:57.241795', '1', '1', '1', '3');
INSERT INTO `df_index_category_goods` VALUES ('3', '2017-10-16 03:34:09.716055', '2017-10-16 03:34:09.716135', '1', '3', '1', '4');
INSERT INTO `df_index_category_goods` VALUES ('4', '2017-10-16 03:34:49.901895', '2017-10-16 03:34:49.902017', '1', '2', '1', '5');
INSERT INTO `df_index_category_goods` VALUES ('5', '2017-10-16 03:35:07.990622', '2017-10-16 03:35:07.990702', '0', '0', '1', '3');
INSERT INTO `df_index_category_goods` VALUES ('6', '2017-10-16 03:35:18.892346', '2017-10-16 03:35:18.892427', '0', '1', '1', '2');
INSERT INTO `df_index_category_goods` VALUES ('7', '2017-10-16 03:35:28.860398', '2017-10-16 03:35:28.860473', '1', '0', '2', '6');
INSERT INTO `df_index_category_goods` VALUES ('8', '2017-10-16 03:35:45.966738', '2017-10-16 03:35:45.966841', '1', '1', '2', '7');
INSERT INTO `df_index_category_goods` VALUES ('9', '2017-10-16 03:35:55.209654', '2017-10-16 03:35:55.209735', '1', '2', '2', '7');
INSERT INTO `df_index_category_goods` VALUES ('10', '2017-10-16 03:36:05.106142', '2017-10-16 03:36:05.106274', '1', '2', '2', '8');
INSERT INTO `df_index_category_goods` VALUES ('11', '2017-10-16 03:36:15.971654', '2017-10-16 03:36:15.971736', '1', '3', '2', '9');
INSERT INTO `df_index_category_goods` VALUES ('12', '2017-10-16 03:36:24.626355', '2017-10-16 03:36:24.626430', '0', '0', '2', '8');
INSERT INTO `df_index_category_goods` VALUES ('13', '2017-10-16 03:36:40.897798', '2017-10-16 03:36:40.897887', '0', '1', '2', '9');
INSERT INTO `df_index_category_goods` VALUES ('14', '2017-10-16 03:37:11.911978', '2017-10-16 03:37:11.912057', '1', '0', '3', '10');
INSERT INTO `df_index_category_goods` VALUES ('15', '2017-10-16 03:37:24.784141', '2017-10-16 03:37:24.784249', '1', '1', '3', '11');
INSERT INTO `df_index_category_goods` VALUES ('16', '2017-10-16 03:37:33.887044', '2017-10-16 03:37:33.887126', '1', '2', '3', '12');
INSERT INTO `df_index_category_goods` VALUES ('17', '2017-10-16 04:06:16.091371', '2017-10-16 04:06:16.091567', '1', '3', '3', '13');
INSERT INTO `df_index_category_goods` VALUES ('18', '2017-10-16 04:06:57.562512', '2017-10-16 04:06:57.562601', '0', '0', '3', '12');
INSERT INTO `df_index_category_goods` VALUES ('19', '2017-10-16 04:07:05.412979', '2017-10-16 04:07:05.413066', '0', '1', '3', '11');
INSERT INTO `df_index_category_goods` VALUES ('20', '2017-10-16 04:07:17.042627', '2017-10-16 04:07:17.042708', '1', '0', '4', '14');
INSERT INTO `df_index_category_goods` VALUES ('21', '2017-10-16 04:07:25.607347', '2017-10-16 04:07:25.607439', '1', '1', '4', '15');
INSERT INTO `df_index_category_goods` VALUES ('22', '2017-10-16 04:07:37.327826', '2017-10-16 04:07:37.327903', '1', '2', '4', '16');
INSERT INTO `df_index_category_goods` VALUES ('23', '2017-10-16 04:07:46.115468', '2017-10-16 04:07:46.115679', '1', '3', '4', '17');
INSERT INTO `df_index_category_goods` VALUES ('24', '2017-10-16 04:07:58.518953', '2017-10-16 04:07:58.519085', '0', '0', '4', '15');
INSERT INTO `df_index_category_goods` VALUES ('25', '2017-10-16 04:08:08.603445', '2017-10-16 04:08:08.603576', '1', '0', '5', '18');
INSERT INTO `df_index_category_goods` VALUES ('26', '2017-10-16 04:08:20.212045', '2017-10-16 04:08:20.212207', '1', '1', '5', '19');
INSERT INTO `df_index_category_goods` VALUES ('27', '2017-10-16 04:08:27.535621', '2017-10-16 04:08:27.535700', '1', '2', '5', '20');
INSERT INTO `df_index_category_goods` VALUES ('28', '2017-10-16 04:08:41.184969', '2017-10-16 04:08:41.185046', '1', '3', '5', '21');
INSERT INTO `df_index_category_goods` VALUES ('29', '2017-10-16 04:08:48.173697', '2017-10-16 04:08:48.174095', '0', '0', '5', '21');
INSERT INTO `df_index_category_goods` VALUES ('30', '2017-10-16 04:08:57.442308', '2017-10-16 04:08:57.442389', '1', '0', '6', '22');
INSERT INTO `df_index_category_goods` VALUES ('31', '2017-10-16 04:09:06.721210', '2017-10-16 04:09:06.721292', '1', '1', '6', '23');
INSERT INTO `df_index_category_goods` VALUES ('32', '2017-10-16 04:09:16.107585', '2017-10-16 04:09:16.108236', '1', '2', '6', '24');
INSERT INTO `df_index_category_goods` VALUES ('33', '2017-10-16 04:09:23.550951', '2017-10-16 04:09:23.551031', '1', '3', '6', '25');
INSERT INTO `df_index_category_goods` VALUES ('34', '2017-10-16 04:09:30.560733', '2017-10-16 04:09:30.560816', '0', '0', '6', '23');
INSERT INTO `df_index_category_goods` VALUES ('35', '2017-10-16 04:09:38.751619', '2017-10-16 04:09:38.751712', '0', '1', '6', '22');

-- ----------------------------
-- Table structure for df_index_goods
-- ----------------------------
DROP TABLE IF EXISTS `df_index_goods`;
CREATE TABLE `df_index_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `image` varchar(100) NOT NULL,
  `index` smallint(6) NOT NULL,
  `sku_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_index_goods_sku_id_59fb549b9bbac669_fk_df_goods_sku_id` (`sku_id`),
  CONSTRAINT `df_index_goods_sku_id_59fb549b9bbac669_fk_df_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `df_goods_sku` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_index_goods
-- ----------------------------
INSERT INTO `df_index_goods` VALUES ('1', '2017-10-16 03:27:56.534441', '2017-10-16 03:27:56.534522', 'group1/M00/00/01/CtM3BVnkJzyASv1nAACpB-LsCdE4728457', '0', '3');
INSERT INTO `df_index_goods` VALUES ('2', '2017-10-16 03:28:10.145716', '2017-10-16 03:28:10.145795', 'group1/M00/00/01/CtM3BVnkJ0qARP2PAAC3B-z8J2c2451336', '1', '5');
INSERT INTO `df_index_goods` VALUES ('3', '2017-10-16 03:28:30.520445', '2017-10-16 03:28:30.520521', 'group1/M00/00/01/CtM3BVnkJ16AWegCAAETwXb_pso1012026', '2', '10');
INSERT INTO `df_index_goods` VALUES ('4', '2017-10-16 03:32:40.934947', '2017-10-16 03:32:40.935037', 'group1/M00/00/01/CtM3BVnkKFiAXsNcAAD0akkXmFo4487232', '3', '6');

-- ----------------------------
-- Table structure for df_index_promotion
-- ----------------------------
DROP TABLE IF EXISTS `df_index_promotion`;
CREATE TABLE `df_index_promotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `url` varchar(200) NOT NULL,
  `image` varchar(100) NOT NULL,
  `index` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_index_promotion
-- ----------------------------
INSERT INTO `df_index_promotion` VALUES ('1', '2017-10-16 02:57:52.707965', '2017-10-16 06:16:43.461496', '吃货暑假趴', 'http://www.itcast.cn', 'group1/M00/00/00/CtM3BVnkIDGATx4aAAA2pLUeB600278858', '1');
INSERT INTO `df_index_promotion` VALUES ('2', '2017-10-16 02:58:21.916410', '2017-10-16 06:16:32.600365', '盛夏尝鲜季', 'http://www.itheima.com', 'group1/M00/00/00/CtM3BVnkIE6AA2o8AAA98yvCs1I9520126', '0');

-- ----------------------------
-- Table structure for df_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `df_order_goods`;
CREATE TABLE `df_order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `count` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `comment` longtext NOT NULL,
  `order_id` varchar(64) NOT NULL,
  `sku_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_order_goods_69dfcb07` (`order_id`),
  KEY `df_order_goods_22ad5bca` (`sku_id`),
  CONSTRAINT `df_order_goo_order_id_690e6e8dd6c2931a_fk_df_order_info_order_id` FOREIGN KEY (`order_id`) REFERENCES `df_order_info` (`order_id`),
  CONSTRAINT `df_order_goods_sku_id_7ecd3cc2ead92921_fk_df_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `df_goods_sku` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_order_goods
-- ----------------------------

-- ----------------------------
-- Table structure for df_order_info
-- ----------------------------
DROP TABLE IF EXISTS `df_order_info`;
CREATE TABLE `df_order_info` (
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `order_id` varchar(64) NOT NULL,
  `total_count` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `trans_cost` decimal(10,2) NOT NULL,
  `pay_method` smallint(6) NOT NULL,
  `status` smallint(6) NOT NULL,
  `trade_id` varchar(100) DEFAULT NULL,
  `address_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `trade_id` (`trade_id`),
  KEY `df_order_info_ea8e5d12` (`address_id`),
  KEY `df_order_info_e8701ad4` (`user_id`),
  CONSTRAINT `df_order_info_address_id_213cad3b1a078505_fk_df_address_id` FOREIGN KEY (`address_id`) REFERENCES `df_address` (`id`),
  CONSTRAINT `df_order_info_user_id_4d48e7022c8db90_fk_df_users_id` FOREIGN KEY (`user_id`) REFERENCES `df_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_order_info
-- ----------------------------

-- ----------------------------
-- Table structure for df_users
-- ----------------------------
DROP TABLE IF EXISTS `df_users`;
CREATE TABLE `df_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_users
-- ----------------------------
INSERT INTO `df_users` VALUES ('1', 'pbkdf2_sha256$20000$aAZTQ1ANLRPw$VIlnUBiQ/tfAM9Mmwncem+5OSyTU6cotXii37q6uw6U=', null, '0', '250977745', '', '', '250977745@qq.com', '0', '0', '2018-02-25 08:11:17.274630', '2018-02-25 08:11:17.319678', '2018-02-25 08:11:17.326165');
INSERT INTO `df_users` VALUES ('3', 'pbkdf2_sha256$20000$mNAQjFAZw7Py$4T0XpRnM9iDt8YSaVNYaOV16N/vfH4lHPjP+uydGFmc=', null, '0', '250977744', '', '', '250977745@qq.com', '0', '0', '2018-02-25 08:24:22.445540', '2018-02-25 08:24:22.494085', '2018-02-25 08:24:22.498984');
INSERT INTO `df_users` VALUES ('5', 'pbkdf2_sha256$20000$cPuLjhR1GtEN$UjP06YetOv+6caKTvPMZQMEMxMh7VbIJOHhG5XQlXPM=', null, '0', '250977743', '', '', '250977745@qq.com', '0', '0', '2018-02-25 08:38:55.392169', '2018-02-25 08:38:55.441432', '2018-02-25 08:38:55.445087');
INSERT INTO `df_users` VALUES ('6', 'pbkdf2_sha256$20000$dy4ZWsS5YLan$3qcFmoXJSD0Uhk2htKT/d7YNXew6mzmNm83jBbkvlTI=', null, '0', 'aaaaaaaa', '', '', '250977745@qq.com', '0', '0', '2018-02-25 08:49:55.347470', '2018-02-25 08:49:55.396016', '2018-02-25 08:49:55.405161');
INSERT INTO `df_users` VALUES ('7', 'pbkdf2_sha256$20000$bIeuvMHv4Qnc$qs5/8ZJ/oApMYnmPABzaLrxD/3L2g/uihetfpVOuDUQ=', '2018-03-14 08:57:41.457595', '0', '444444444444', '', '', '250977745@qq.com', '0', '1', '2018-02-25 09:25:31.834776', '2018-02-25 09:25:31.882598', '2018-02-25 10:04:44.909413');
INSERT INTO `df_users` VALUES ('8', 'pbkdf2_sha256$20000$gV2mOhRyTkk3$xJYXXuA3PdWZuBQYTEHyMgep6FAwZp6pGhx3B9UdTvs=', '2018-03-02 09:31:30.122765', '1', '12345', '', '', '250977745@qq.com', '1', '1', '2018-02-27 12:34:45.893422', '2018-02-27 12:34:45.922522', '2018-02-27 12:34:45.922547');
INSERT INTO `df_users` VALUES ('9', 'pbkdf2_sha256$20000$rxMtnLb4Z0j0$e4i6+JrzxZ/KtLi3oTUgjG6l5JknsF/r0gvCn0+4fm0=', '2018-05-20 09:04:37.316767', '1', 'admin123', '', '', '', '1', '1', '2018-03-09 12:08:40.026383', '2018-03-09 12:08:40.078487', '2018-03-09 12:08:40.078516');

-- ----------------------------
-- Table structure for df_users_groups
-- ----------------------------
DROP TABLE IF EXISTS `df_users_groups`;
CREATE TABLE `df_users_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `df_users_groups_group_id_224629aab5340e5b_fk_auth_group_id` (`group_id`),
  CONSTRAINT `df_users_groups_group_id_224629aab5340e5b_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `df_users_groups_user_id_2edd44d3626819b2_fk_df_users_id` FOREIGN KEY (`user_id`) REFERENCES `df_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_users_groups
-- ----------------------------

-- ----------------------------
-- Table structure for df_users_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `df_users_user_permissions`;
CREATE TABLE `df_users_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `df_users_us_permission_id_3e6138357cebffc9_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `df_users_us_permission_id_3e6138357cebffc9_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `df_users_user_permission_user_id_5ca3ead1c4edb007_fk_df_users_id` FOREIGN KEY (`user_id`) REFERENCES `df_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_users_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_786a859f43bd3811_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_7697e5ae59423ca1_fk_df_users_id` (`user_id`),
  CONSTRAINT `djang_content_type_id_786a859f43bd3811_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_7697e5ae59423ca1_fk_df_users_id` FOREIGN KEY (`user_id`) REFERENCES `df_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2018-02-28 09:20:41.446700', '7', '1234', '1', '', '6', '8');
INSERT INTO `django_admin_log` VALUES ('2', '2018-02-28 09:21:13.873543', '7', '1234', '3', '', '6', '8');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_56f08698eb72265b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('7', 'goods', 'goods');
INSERT INTO `django_content_type` VALUES ('6', 'goods', 'goodscategory');
INSERT INTO `django_content_type` VALUES ('9', 'goods', 'goodsimage');
INSERT INTO `django_content_type` VALUES ('8', 'goods', 'goodssku');
INSERT INTO `django_content_type` VALUES ('11', 'goods', 'indexcategorygoodsbanner');
INSERT INTO `django_content_type` VALUES ('10', 'goods', 'indexgoodsbanner');
INSERT INTO `django_content_type` VALUES ('12', 'goods', 'indexpromotionbanner');
INSERT INTO `django_content_type` VALUES ('14', 'orders', 'ordergoods');
INSERT INTO `django_content_type` VALUES ('13', 'orders', 'orderinfo');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('16', 'users', 'address');
INSERT INTO `django_content_type` VALUES ('15', 'users', 'user');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-02-24 12:39:25.059595');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2018-02-24 12:39:25.159154');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2018-02-24 12:39:25.537024');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2018-02-24 12:39:25.591451');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2018-02-24 12:39:25.614272');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2018-02-24 12:39:25.637879');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2018-02-24 12:39:25.664366');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2018-02-24 12:39:25.680141');
INSERT INTO `django_migrations` VALUES ('9', 'users', '0001_initial', '2018-02-24 12:39:26.370377');
INSERT INTO `django_migrations` VALUES ('10', 'admin', '0001_initial', '2018-02-24 12:39:26.514069');
INSERT INTO `django_migrations` VALUES ('11', 'goods', '0001_initial', '2018-02-24 12:39:27.642846');
INSERT INTO `django_migrations` VALUES ('12', 'orders', '0001_initial', '2018-02-24 12:39:27.706204');
INSERT INTO `django_migrations` VALUES ('13', 'orders', '0002_auto_20180224_1239', '2018-02-24 12:39:28.345324');
INSERT INTO `django_migrations` VALUES ('14', 'sessions', '0001_initial', '2018-02-24 12:39:28.400377');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
