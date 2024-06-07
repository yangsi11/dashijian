/*
 Navicat Premium Data Transfer

 Source Server         : stu1
 Source Server Type    : MySQL
 Source Server Version : 80023 (8.0.23)
 Source Host           : localhost:3306
 Source Schema         : big_event

 Target Server Type    : MySQL
 Target Server Version : 80023 (8.0.23)
 File Encoding         : 65001

 Date: 07/06/2024 11:09:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章标题',
  `content` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章内容',
  `cover_img` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章封面',
  `state` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '草稿' COMMENT '文章状态: 只能是[已发布] 或者 [草稿]',
  `category_id` int UNSIGNED NULL DEFAULT NULL COMMENT '文章分类ID',
  `create_user` int UNSIGNED NOT NULL COMMENT '创建人ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_article_category`(`category_id` ASC) USING BTREE,
  INDEX `fk_article_user`(`create_user` ASC) USING BTREE,
  CONSTRAINT `fk_article_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_article_user` FOREIGN KEY (`create_user`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, '秘密', '<p>very beautiful</p>', 'http://localhost:8081/article', '草稿', 1, 2, '2023-11-09 17:07:52', '2023-11-09 17:07:52');
INSERT INTO `article` VALUES (2, 'secret', '<p>这确实不错</p>', 'http://localhost:8081/article', '草稿', 5, 2, '2023-11-09 17:08:33', '2023-11-09 17:08:33');
INSERT INTO `article` VALUES (4, '秘密', 'very beautiful', 'http://localhost:8081/article', '草稿', 1, 2, '2023-11-09 17:40:31', '2023-11-09 17:40:31');
INSERT INTO `article` VALUES (5, '秘密', 'very beautiful', 'http://localhost:8081/article', '草稿', 1, 2, '2023-11-09 17:41:29', '2023-11-09 17:41:29');
INSERT INTO `article` VALUES (6, '秘密', 'very beautiful', 'http://localhost:8081/article', '草稿', 4, 2, '2023-11-09 17:41:35', '2023-11-09 17:41:35');
INSERT INTO `article` VALUES (7, '秘密', 'very beautiful', 'http://localhost:8081/article', '草稿', 1, 2, '2023-11-09 17:44:38', '2023-11-09 17:44:38');
INSERT INTO `article` VALUES (8, '巴以冲突何时结束', '<p>巴以冲突何时休，这让人十分的苦恼</p>', '../public/imgs/e5acfb4c-def5-4a26-aebe-a6abd4e1a5b0.jpg', '已发布', 14, 2, '2023-11-13 10:32:40', '2023-11-13 10:32:40');
INSERT INTO `article` VALUES (9, '战争的残酷', '<p>战争的残酷，难以想象</p>', '../public/imgs/2fa11b6f-32db-46ed-8d08-7da8cd8aaaeb.jpg', '已发布', 14, 2, '2023-11-13 10:34:46', '2023-11-13 10:34:46');
INSERT INTO `article` VALUES (10, '战争的残酷', '<p>战争的残酷，难以想象</p>', '../public/imgs/2fa11b6f-32db-46ed-8d08-7da8cd8aaaeb.jpg', '已发布', 14, 2, '2023-11-13 10:34:51', '2023-11-13 10:34:51');
INSERT INTO `article` VALUES (13, '前国庆', '<p>前国庆是小可爱</p>', 'https://big-events11.oss-cn-beijing.aliyuncs.com/a77fd226-5c9a-4544-a18e-784b212edc20.jpg', '已发布', 15, 10, '2024-06-05 09:55:29', '2024-06-05 09:55:29');
INSERT INTO `article` VALUES (14, '杨天飞', '<p>阳台南非</p>', 'https://big-events11.oss-cn-beijing.aliyuncs.com/166a5540-5ed5-49ed-b452-4b00444f233e.jpg', '草稿', 15, 10, '2024-06-05 09:57:54', '2024-06-05 09:57:54');
INSERT INTO `article` VALUES (25, '杨天飞', '<p>阳台</p>', 'https://big-events11.oss-cn-beijing.aliyuncs.com/166a5540-5ed5-49ed-b452-4b00444f233e.jpg', '已发布', 15, 10, '2024-06-06 16:31:28', '2024-06-06 16:31:28');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `category_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  `category_alias` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类别名',
  `create_user` int UNSIGNED NOT NULL COMMENT '创建人ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_category_user`(`create_user` ASC) USING BTREE,
  CONSTRAINT `fk_category_user` FOREIGN KEY (`create_user`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '三体', '很喜欢的小说', 2, '2023-11-09 15:33:18', '2023-11-15 09:42:14');
INSERT INTO `category` VALUES (4, '科幻', '喜欢的', 2, '2023-11-09 16:06:59', '2023-11-09 16:06:59');
INSERT INTO `category` VALUES (5, '科幻', '喜欢的', 2, '2023-11-09 16:07:28', '2023-11-09 16:07:28');
INSERT INTO `category` VALUES (6, '文学', '大众的', 2, '2023-11-12 16:24:01', '2023-11-12 16:24:01');
INSERT INTO `category` VALUES (7, '轻小说', '青年的', 2, '2023-11-12 16:25:01', '2023-11-12 16:25:01');
INSERT INTO `category` VALUES (14, '军事', 'js', 2, '2023-11-13 10:30:06', '2023-11-13 10:30:06');
INSERT INTO `category` VALUES (15, '网页', 'wangye', 10, '2024-06-03 09:23:20', '2024-06-03 09:32:43');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `nickname` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '昵称',
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '邮箱',
  `user_pic` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (2, 'sjy', 'e10adc3949ba59abbe56e057f20f883e', '苏健尧', '925263293@qq.com', 'D:/资料/设计素材库/二次元图片/a2.jpg', '2023-11-08 09:20:29', '2023-11-14 15:22:26');
INSERT INTO `user` VALUES (3, 'sqdxs', 'e10adc3949ba59abbe56e057f20f883e', '苏健尧', '123456@qq.com', '', '2023-11-08 15:28:10', '2023-11-09 08:29:01');
INSERT INTO `user` VALUES (4, 'dxs', 'e10adc3949ba59abbe56e057f20f883e', '苏健尧', '', '', '2023-11-08 15:35:12', '2023-11-08 15:35:12');
INSERT INTO `user` VALUES (5, 'wxh', 'e10adc3949ba59abbe56e057f20f883e', '苏健尧', '', '', '2023-11-08 16:00:10', '2023-11-08 16:00:10');
INSERT INTO `user` VALUES (9, 'swg', 'e10adc3949ba59abbe56e057f20f883e', '苏健尧', '', '', '2023-11-12 10:15:37', '2023-11-12 10:15:37');
INSERT INTO `user` VALUES (10, 'wangba', '25f9e794323b453885f5181f1b624d0b', '扬天非', '29514049@qq.com', 'https://big-events11.oss-cn-beijing.aliyuncs.com/aa71b8ec-eb94-46ff-b9ad-003050054370.jpg', '2024-06-03 09:19:50', '2024-06-07 08:55:43');

SET FOREIGN_KEY_CHECKS = 1;
