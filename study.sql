/*
 Navicat MySQL Data Transfer

 Source Server         : 123
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : study

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 05/11/2020 16:25:51
*/
use study;
-- SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pwd` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'pbkdf2:sha256:50000$t1B4zFZd$b628f4506dd67f58e8f61571f0f07b27cbda33ad991676f90ab5308b7ff02a25');    -- 账户admin密码seuscse
INSERT INTO `admin` VALUES (2, 'mr', 'pbkdf2:sha256:50000$6eKyhd1Q$8951b6eee62f86f2d98cbcb72cdb389b9b94d9763eaf0cd16d66e4ef4dfedf20');       -- 账户mr密码admin123
INSERT INTO `admin` VALUES (3, 'bnm', 'pbkdf2:sha256:50000$MSh1x51n$04a110b589ccad68c3591be5585b06378af2a9857363cb34fb0ca4740b9735f9');       -- 账户bnm密码bnm

-- ----------------------------
-- Table structure for adminlog
-- ----------------------------
DROP TABLE IF EXISTS `adminlog`;
CREATE TABLE `adminlog`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `admin_id` int(0) NULL DEFAULT NULL,
  `ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ix_adminlog_addtime`(`addtime`) USING BTREE,
  INDEX `admin_id`(`admin_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of adminlog
-- ----------------------------
INSERT INTO `adminlog` VALUES (1, 1, '127.0.0.1', '2020-03-24 09:26:24');
INSERT INTO `adminlog` VALUES (2, 1, '127.0.0.1', '2020-03-24 09:27:09');
INSERT INTO `adminlog` VALUES (3, 1, '127.0.0.1', '2020-03-24 09:29:42');
INSERT INTO `adminlog` VALUES (4, 1, '127.0.0.1', '2020-08-09 14:52:55');
INSERT INTO `adminlog` VALUES (5, 1, '127.0.0.1', '2020-08-10 08:45:20');
INSERT INTO `adminlog` VALUES (6, 1, '127.0.0.1', '2020-08-10 10:02:37');
INSERT INTO `adminlog` VALUES (7, 1, '127.0.0.1', '2020-08-10 10:38:04');
INSERT INTO `adminlog` VALUES (8, 1, '127.0.0.1', '2020-08-10 10:53:51');
INSERT INTO `adminlog` VALUES (9, 1, '127.0.0.1', '2020-08-11 10:53:35');
INSERT INTO `adminlog` VALUES (10, 1, '127.0.0.1', '2020-08-13 14:14:36');
INSERT INTO `adminlog` VALUES (11, 1, '127.0.0.1', '2020-08-14 09:17:10');
INSERT INTO `adminlog` VALUES (12, 1, '127.0.0.1', '2020-08-14 11:04:20');
INSERT INTO `adminlog` VALUES (13, 1, '127.0.0.1', '2020-08-14 13:28:49');
INSERT INTO `adminlog` VALUES (14, 1, '127.0.0.1', '2020-10-11 14:02:45');
INSERT INTO `adminlog` VALUES (15, 1, '127.0.0.1', '2020-10-28 09:09:38');
INSERT INTO `adminlog` VALUES (16, 1, '127.0.0.1', '2020-10-30 19:44:08');
INSERT INTO `adminlog` VALUES (17, 1, '127.0.0.1', '2020-10-31 00:12:53');
INSERT INTO `adminlog` VALUES (18, 1, '127.0.0.1', '2020-11-05 15:29:16');

-- ----------------------------
-- Table structure for alembic_version
-- ----------------------------
DROP TABLE IF EXISTS `alembic_version`;
CREATE TABLE `alembic_version`  (
  `version_num` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`version_num`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of alembic_version
-- ----------------------------
INSERT INTO `alembic_version` VALUES ('423caff1b936');

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addtime` datetime(0) NULL DEFAULT NULL,
  `is_recommended` tinyint(1) NULL DEFAULT NULL,
  `introduction` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `ix_area_addtime`(`addtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of area
-- ----------------------------
INSERT INTO `area` VALUES (1, '大学基础课程', '2020-10-28 10:39:12', 1, '与“专业课”相对，指高等学校和中等专业学校根据专业培养目标而开设的自然科学和人文社会科学基本理论、基本技能的课程。大学和中专的基础课的任务，是学生具有高等和中等专门人才的文化水平，为学习专业基础课和专业课打下基本理论和基本技能的基础。同一科类的各个专业，基础课程大致相同。为了达到专门人才的培养目标和基本要求，各专业的基础课都规定为必修课。为了提高教育质量，使学生具有适应科技迅速发展的能力，高等学校都十分重视加强基础课程的教学，选派经验丰富、水平较高的教师担任基础课教学工作。');
INSERT INTO `area` VALUES (2, '计算机科学与技术', '2020-10-28 10:22:59', 1, '主修大数据技术导论、数据采集与处理实践(Python ) 、Web前/后端开发、统计与数据分析、机器学习、高级数据库系统、数据可视化、云计算技术、人工智能、自然语言处理、媒体大数据案例分析、网络空间安全、计算机网络、数据结构、软件工程、操作系统等课程，以及大数据方向系列实验，并完成程序设计、数据分析、机器学习、数据可视化、大数据综合应用实践、专业实训和毕业设计等多种实践环节。\r\n');
INSERT INTO `area` VALUES ('3', '软件工程', '2020-10-10 09:31:59', '1', '软件工程专业，暂无简介');

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `scenic_id` int(0) NULL DEFAULT NULL,
  `user_id` int(0) NULL DEFAULT NULL,
  `addtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ix_collect_addtime`(`addtime`) USING BTREE,
  INDEX `scenic_id`(`scenic_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES (3, 1, 7, '2018-08-13 09:25:14');
INSERT INTO `collect` VALUES (6, 1, 8, '2020-10-28 13:10:38');
INSERT INTO `collect` VALUES (7, 8, 9, '2020-10-28 14:48:10');

-- ----------------------------
-- Table structure for oplog
-- ----------------------------
DROP TABLE IF EXISTS `oplog`;
CREATE TABLE `oplog`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `admin_id` int(0) NULL DEFAULT NULL,
  `ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reason` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ix_oplog_addtime`(`addtime`) USING BTREE,
  INDEX `admin_id`(`admin_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oplog
-- ----------------------------

INSERT INTO `oplog` VALUES (1, 1, '127.0.0.1', '添加学科计算机科学与技术', '2020-01-28 10:22:59');
INSERT INTO `oplog` VALUES (2, 1, '127.0.0.1', '添加课程C++', '2020-01-28 10:28:00');
INSERT INTO `oplog` VALUES (3, 1, '127.0.0.1', '添加学科大学基础课程', '2020-03-28 10:39:12');
INSERT INTO `oplog` VALUES (4, 1, '127.0.0.1', '添加课程Linux系统编程', '2020-03-28 10:56:39');
INSERT INTO `oplog` VALUES (5, 1, '127.0.0.1', '添加课程高等数学（下）', '2020-03-28 11:13:40');
INSERT INTO `oplog` VALUES (6, 1, '127.0.0.1', '添加攻略高等数学（上）学习攻略', '2020-03-28 11:15:54');
INSERT INTO `oplog` VALUES (7, 1, '127.0.0.1', '添加攻略Linux系统编程学习攻略', '2020-10-30 19:45:59');

-- ----------------------------
-- Table structure for scenic
-- ----------------------------
DROP TABLE IF EXISTS `scenic`;
CREATE TABLE `scenic`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `star` int(0) NULL DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `introduction` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `address` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_hot` tinyint(1) NULL DEFAULT NULL,
  `is_recommended` tinyint(1) NULL DEFAULT NULL,
  `area_id` int(0) NULL DEFAULT NULL,
  `addtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `logo`(`logo`) USING BTREE,
  UNIQUE INDEX `title`(`title`) USING BTREE,
  INDEX `ix_scenic_addtime`(`addtime`) USING BTREE,
  INDEX `area_id`(`area_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scenic
-- ----------------------------
INSERT INTO `scenic` VALUES (1, '高等数学（上）', 5, '202010281043283504d75088ca4789a77f47ccbe8dbda1.jpg', '广义地说，初等数学之外的数学都是高等数学，也有将中学较深入的代数、几何以及简单的集合论初步、逻辑初步称为中等数学的，将其作为中小学阶段的初等数学与大学阶段的高等数学的过渡。通常认为，高等数学是由微积分学，较深入的代数学、几何学以及它们之间的交叉内容所形成的一门基础学科。主要内容包括：数列、极限、微积分、空间解析几何与线性代数、级数、常微分方程。工科、理科、财经类研究生考试的基础科目。', '<h2>课程特点</h2>\r\n\r\n<p>在中国<a href=\"https://baike.baidu.com/item/%E7%90%86%E5%B7%A5%E7%A7%91\" target=\"_blank\">理工科</a>各类专业的学生（数学专业除外，数学专业学<a href=\"https://baike.baidu.com/item/%E6%95%B0%E5%AD%A6%E5%88%86%E6%9E%90\" target=\"_blank\">数学分析</a>），学的数学较难，课本常称&ldquo;高等数学&rdquo;；<a href=\"https://baike.baidu.com/item/%E6%96%87%E5%8F%B2/72467\" target=\"_blank\">文史</a>科各类专业的学生，学的数学稍微浅一些，课本常称&ldquo;<a href=\"https://baike.baidu.com/item/%E5%BE%AE%E7%A7%AF%E5%88%86/6065\" target=\"_blank\">微积分</a>&rdquo;。<a href=\"https://baike.baidu.com/item/%E7%90%86%E5%B7%A5%E7%A7%91\" target=\"_blank\">理工科</a>的不同专业，文史科的不同专业，深浅程度又各不相同。研究变量的是高等数学，可高等数学并不只研究变量。至于与&ldquo;高等数学&rdquo;相伴的课程通常有：<a href=\"https://baike.baidu.com/item/%E7%BA%BF%E6%80%A7%E4%BB%A3%E6%95%B0\" target=\"_blank\">线性代数</a>（数学专业学<a href=\"https://baike.baidu.com/item/%E9%AB%98%E7%AD%89%E4%BB%A3%E6%95%B0\" target=\"_blank\">高等代数</a>），<a href=\"https://baike.baidu.com/item/%E6%A6%82%E7%8E%87%E8%AE%BA\" target=\"_blank\">概率论</a>与<a href=\"https://baike.baidu.com/item/%E6%95%B0%E7%90%86%E7%BB%9F%E8%AE%A1\" target=\"_blank\">数理统计</a>（有些数学专业分开学）。</p>\r\n\r\n<p>初等数学研究的是<a href=\"https://baike.baidu.com/item/%E5%B8%B8%E9%87%8F/10232375\" target=\"_blank\">常量</a>与匀<a href=\"https://baike.baidu.com/item/%E5%8F%98%E9%87%8F/5271\" target=\"_blank\">变量</a>，高等数学研究的是非匀变量。高等数学（它是几门课程的总称）是理、工科院校一门重要的基础学科，也是非数学专业理工科专业学生的必修数学课,也是其它某些专业的<a href=\"https://baike.baidu.com/item/%E5%BF%85%E4%BF%AE\" target=\"_blank\">必修</a>课。</p>\r\n\r\n<p>作为一门<a href=\"https://baike.baidu.com/item/%E5%9F%BA%E7%A1%80%E7%A7%91%E5%AD%A6\" target=\"_blank\">基础科学</a>，高等数学有其固有的特点，这就是高度的抽象性、严密的逻辑性和广泛的应用性。抽象性和计算性是数学最基本、最显著的特点，有了高度抽象和统一，我们才能深入地揭示其本质规律，才能使之得到更广泛的应用。严密的逻辑性是指在数学理论的归纳和整理中，无论是概念和表述，还是判断和推理，都要运用逻辑的规则，遵循思维的规律。所以说，数学也是一种思想方法，学习数学的过程就是思维训练的过程。人类社会的进步，与数学这门科学的广泛应用是分不开的。尤其是到了现代，电子计算机的出现和普及使得数学的应用领域更加拓宽，<a href=\"https://baike.baidu.com/item/%E7%8E%B0%E4%BB%A3%E6%95%B0%E5%AD%A6\" target=\"_blank\">现代数学</a>正成为科技发展的强大动力，同时也广泛和深入地渗透到了社会科学领域。</p>\r\n\r\n<p><a href=\"https://baike.baidu.com/pic/%E9%AB%98%E7%AD%89%E6%95%B0%E5%AD%A6/1182/0/9922720e0cf3d7ca41810db7f21fbe096a63a9ff?fr=lemma&amp;ct=single\" target=\"_blank\"><img alt=\"三角函数\" src=\"https://bkimg.cdn.bcebos.com/pic/9922720e0cf3d7ca41810db7f21fbe096a63a9ff?x-bce-process=image/resize,m_lfit,w_220,h_220,limit_1\" /></a>三角函数</p>\r\n\r\n<blockquote>\r\n<h2><strong>学习须知：</strong></h2>\r\n\r\n<p><big>教师qq：97894562</big></p>\r\n\r\n<p><big>答疑地点及时间：文昌院303/周五上午9点-10点</big></p>\r\n</blockquote>\r\n', '朱老师', 1, 1, 1, '2018-03-22 12:48:16');
INSERT INTO `scenic` VALUES (2, 'Python程序设计', 5, '2020102810365719987c58f89e4259a64874adfd2a4f85.jpg', 'Python语言是非常简单易用的，容易学。并且Python还是人工智能首选的编程语言，未来有可能有一天会爆发。利用课程中的知识搭建简单的Web服务。熟悉Scrapy各模块。熟悉Django各模块的使用，创建Scrapy项目(scrapy startproject)、定义提取的结构化数据(Item)、编写爬取网站的 Spider 并提取出结构化数据(Item)、编写 Item Pipelines 来存储提取到的Item(即结构化数据)理解掌握内容：掌握其运行的基本效果。', '<h2>发展历程</h2>\r\n\r\n<p><a href=\"javascript:;\">编辑</a></p>\r\n\r\n<p>自从20世纪90年代初Python语言诞生至今，它已被逐渐广泛应用于系统管理任务的处理和<a href=\"https://baike.baidu.com/item/Web/150564\" target=\"_blank\">Web</a>编程。</p>\r\n\r\n<p>Python的创始人为荷兰人吉多&middot;范罗苏姆&nbsp;[4]<a name=\"ref_[4]_21087\">&nbsp;</a>&nbsp;<a name=\"ref_4\"></a>（Guido van Rossum）。1989年圣诞节期间，在<a href=\"https://baike.baidu.com/item/%E9%98%BF%E5%A7%86%E6%96%AF%E7%89%B9%E4%B8%B9/2259975\" target=\"_blank\">阿姆斯特丹</a>，Guido为了打发<a href=\"https://baike.baidu.com/item/%E5%9C%A3%E8%AF%9E%E8%8A%82/127881\" target=\"_blank\">圣诞节</a>的无趣，决心开发一个新的脚本解释程序，作为ABC 语言的一种继承。之所以选中Python（大蟒蛇的意思）作为该编程语言的名字，是取自英国20世纪70年代首播的电视喜剧《蒙提.派森的飞行马戏团》（Monty Python&#39;s Flying Circus）。</p>\r\n\r\n<p>ABC是由Guido参加设计的一种<a href=\"https://baike.baidu.com/item/%E6%95%99%E5%AD%A6\" target=\"_blank\">教学</a>语言。就Guido本人看来，ABC 这种语言非常优美和强大，是专门为非专业程序员设计的。但是ABC语言并没有成功，究其原因，Guido 认为是其非开放造成的。Guido 决心在Python 中避免这一错误。同时，他还想实现在ABC 中闪现过但未曾实现的东西。</p>\r\n\r\n<p>就这样，Python在Guido手中诞生了。可以说，Python是从ABC发展起来，主要受到了Modula-3（另一种相当优美且强大的语言，为小型团体所设计的）的影响。并且结合了<a href=\"https://baike.baidu.com/item/Unix%20shell\" target=\"_blank\">Unix shell</a>和C的习惯。</p>\r\n\r\n<p>Python&nbsp;[5]已经成为最受欢迎的<a href=\"https://baike.baidu.com/item/%E7%A8%8B%E5%BA%8F%E8%AE%BE%E8%AE%A1%E8%AF%AD%E8%A8%80/2317999\" target=\"_blank\">程序设计语言</a>之一。自从2004年以后，python的使用率呈线性增长。Python 2于2000年10月16日发布，稳定版本是Python 2.7。Python 3于2008年12月3日发布，不完全兼容Python 2。&nbsp;[4]2011年1月，它被<a href=\"https://baike.baidu.com/item/TIOBE\" target=\"_blank\">TIOBE</a>编程语言<a href=\"https://baike.baidu.com/item/%E6%8E%92%E8%A1%8C%E6%A6%9C/4895\" target=\"_blank\">排行榜</a>评为2010年度语言。&nbsp;[6]</p>\r\n\r\n<p>由于Python语言的<a href=\"https://baike.baidu.com/item/%E7%AE%80%E6%B4%81\" target=\"_blank\">简洁</a>性、易读性以及可扩展性，在国外用Python做科学计算的研究机构日益增多，一些知名大学已经采用Python来教授程序设计<a href=\"https://baike.baidu.com/item/%E8%AF%BE%E7%A8%8B\" target=\"_blank\">课程</a>。例如<a href=\"https://baike.baidu.com/item/%E5%8D%A1%E8%80%90%E5%9F%BA%E6%A2%85%E9%9A%86%E5%A4%A7%E5%AD%A6\" target=\"_blank\">卡耐基梅隆大学</a>的编程基础、麻省理工学院的计算机科学及编程导论就使用Python语言讲授。众多开源的科学计算软件包都提供了Python的调用<a href=\"https://baike.baidu.com/item/%E6%8E%A5%E5%8F%A3\" target=\"_blank\">接口</a>，例如著名的计算机视觉库<a href=\"https://baike.baidu.com/item/OpenCV\" target=\"_blank\">OpenCV</a>、三维可视化库VTK、医学图像处理库ITK。而Python专用的科学计算扩展库就更多了，例如如下3个十分经典的科学计算扩展库：NumPy、SciPy和matplotlib，它们分别为Python提供了快速数组处理、数值运算以及绘图功能。因此Python语言及其众多的扩展库所构成的开发环境十分适合<a href=\"https://baike.baidu.com/item/%E5%B7%A5%E7%A8%8B\" target=\"_blank\">工程</a>技术、科研人员处理实验数据、制作图表，甚至开发科学计算<a href=\"https://baike.baidu.com/item/%E5%BA%94%E7%94%A8%E7%A8%8B%E5%BA%8F\" target=\"_blank\">应用程序</a>。2018年3月，该语言作者在邮件列表上宣布Python 2.7将于2020年1月1日终止支持。用户如果想要在这个日期之后继续得到与Python 2.7有关的支持，则需要付费给商业供应商。&nbsp;[7]</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp;<img alt=\"\" src=\"/static/uploads/ckeditor/202010281034412cb91c9a75904effb61a06250a5f9b9c.png\" style=\"height:522px; width:807px\" /></p>\r\n\r\n<h2><strong>学习须知：</strong></h2>\r\n\r\n<blockquote>\r\n<ul>\r\n	<li>\r\n	<p>教师电话</p>\r\n\r\n	<p>010-123456</p>\r\n	</li>\r\n	<li>\r\n	<p>学习网址</p>\r\n\r\n	<p><a href=\"http://www.badaling.cn/\" target=\"_blank\">http://www.python.</a>org</p>\r\n	</li>\r\n	<li>\r\n	<p>上课时间</p>\r\n\r\n	<p>上学期（9~12月）：08:00~10:00<br />\r\n	下学期（3~5月）：08:00~10:00</p>\r\n	</li>\r\n</ul>\r\n</blockquote>\r\n', '李老师', 1, 1, 2, '2018-03-24 11:19:05');
INSERT INTO `scenic` VALUES (3, 'JAVA程序设计', 5, '20201028103113d0e1beb46cb247d2a3eb4f736ae601cb.jpg', 'Java的主要作用、特点、开发环境、classpath。数组的定义、动态初始化、静态初始化、内存分配、方法定义格式、方法重载、两个新特性：foreach、可变参数。类与对象、类的定义结构、构造方法、private、static、this、引用传递、内部类、掌握简单类的开发方法。类的扩展、super、final、抽象类、接口、多态、实际分析。', '<p>异常的产生原因、标准异常的处理语句格式、throw、throws、assert。包的作用、package、import、系统常见包、四种权限的关系。Java常用类库。学会如何查询文档。常用的灵活掌握，如：StringBuffer、垃圾收集、Date、SimpleDateFormat、正则、比较器等。Java IO，面向对象的核心体现，File，OutputStream，InputStream，Writer，Reader，Serializable等。Java类集的作用及使用，Collection、List、Set、Map、Iterator等核心接口的使用。MySQL、SQL命令、Statement、PreparedStatement、ResultSet、事务处理，了解部分的SQL语句。理解掌握内容：掌握其运行的基本效果，具体的代码可以不用全部灵活掌握。</p>\r\n\r\n<p><img alt=\"\" src=\"/static/uploads/ckeditor/202010281031055c2661f9d46044788ac2b776e81e809b.png\" style=\"height:369px; width:500px\" /></p>\r\n', '张老师', 1, 1, 2, '2018-03-24 13:01:27');
INSERT INTO `scenic` VALUES (4, 'C++程序设计', 5, '20201028102800ed9794fb2dc4418785c18f75d81a8b1e.jpg', '面向对象编程思想；类的封装，构造和析构、静态成员、对象管理；类的构造(有参构造函数、无参构造、拷贝构造、默认构造函数)和析构等。C++是C语言的继承，它既可以进行C语言的过程化程序设计，又可以进行以抽象数据类型为特点的基于对象的程序设计，还可以进行以继承和多态为特点的面向对象的程序设计。C++擅长面向对象程序设计的同时，还可以进行基于过程的程序设计，因而C++就适应的问题规模而论，大小由之。', '<p>对象动态管理、友元函数、友元类、操作符重载；C++编译器对象管理模型分析；类对象的动态管理(new/delete)；友元函数和友元类；运算符重载(一元运算符、二元运算符、运算符重载难点、项目开发中的运算符重载)；类的继承、多继承及其二义性、虚继承；多态(概念、意义、原理剖析、多态案例)；虚函数、纯虚函数、抽象类(面向抽象类编程思想案例)；函数模板、类模板，模板的继承；C++类型转换；C++输入输出流(标准I/O文件I/O 字符流I/O)；C++异常处理(异常机制、异常类型、异常变量、异常层次结构、标准异常库)。<br />\r\n&nbsp;</p>\r\n', '王老师', 1, 1, 2, '2020-10-28 10:28:00');
INSERT INTO `scenic` VALUES (5, 'Linux系统编程', 5, '202010281056396d44ef0c03fd429aa9ed9a7cfde160d4.jpg', 'Linux，全称GNU/Linux，是一种免费使用和自由传播的类UNIX操作系统，其内核由林纳斯·本纳第克特·托瓦兹于1991年10月5日首次发布，它主要受到Minix和Unix思想的启发，是一个基于POSIX和Unix的多用户、多任务、支持多线程和多CPU的操作系统。它能运行主要的Unix工具软件、应用程序和网络协议。它支持32位和64位硬件。Linux继承了Unix以网络为核心的设计思想，是一个性能稳定的多用户网络操作系统。Linux有上百种不同的发行版，如基于社区开发的debian、archlinux，和基于商业开发的Red Hat Enterprise Linux、SUSE、oracle linux等。', '<h2>Linux简史</h2>\r\n\r\n<p>Linux操作系统的诞生、发展和成长过程始终依赖着五个重要支柱：Unix操作系统、<a href=\"https://baike.baidu.com/item/MINIX/7106045\" target=\"_blank\">MINIX</a>操作系统、<a href=\"https://baike.baidu.com/item/GNU/671972\" target=\"_blank\">GNU</a>计划、<a href=\"https://baike.baidu.com/item/POSIX/3792413\" target=\"_blank\">POSIX</a>标准和Internet网络。</p>\r\n\r\n<p>20世纪80年代，计算机硬件的性能不断提高，PC的市场不断扩大，当时可供计算机选用的操作系统主要有Unix、DOS和MacOS这几种。Unix价格昂贵，不能运行于<a href=\"https://baike.baidu.com/item/PC/107\" target=\"_blank\">PC</a>；<a href=\"https://baike.baidu.com/item/DOS/32025\" target=\"_blank\">DOS</a>显得简陋，且源代码被软件厂商严格保密；<a href=\"https://baike.baidu.com/item/MacOS/8654551\" target=\"_blank\">MacOS</a>是一种专门用于苹果计算机的操作系统。此时，计算机科学领域迫切需要一个更加完善、强大、廉价和完全开放的操作系统。由于供教学使用的典型操作系统很少，因此当时在荷兰当教授的美国人AndrewS.Tanenbaum编写了一个操作系统，名为<a href=\"https://baike.baidu.com/item/MINIX/7106045\" target=\"_blank\">MINIX</a>，为了向学生讲述操作系统内部工作原理。MINIX虽然很好，但只是一个用于教学目的的简单操作系统，而不是一个强有力的实用操作系统，然而最大的好处就是公开源代码。全世界学计算机的学生都通过钻研MINIX源代码来了解电脑里运行的MINIX操作系统，芬兰赫尔辛基大学大学二年级的学生Linus Torvalds就是其中一个，在吸收了MINIX精华的基础上，Linus于1991年写出了属于自己的Linux操作系统，版本为Linux0.01，是Linux时代开始的标志。他利用Unix的核心，去除繁杂的核心程序，改写成适用于一般计算机的x86系统，并放在网络上供大家下载，1994年推出完整的核心Version1.0，至此，Linux逐渐成为功能完善、稳定的操作系统，并被广泛使用。&nbsp;[1]</p>\r\n\r\n<p><img alt=\"\" src=\"/static/uploads/ckeditor/20201028110210cf7d5ebc7526474b85611a0bac2b3113.png\" style=\"height:624px; width:929px\" /></p>\r\n\r\n<p><a href=\"/static/uploads/ckeditor/202010281100439c419095d40b4af69577f536c3433a13.mp4\">&bull; 第八章学习视频</a></p>\r\n\r\n<h2><strong>学习须知：</strong></h2>\r\n\r\n<blockquote>\r\n<ul>\r\n	<li>\r\n	<p>教师电话</p>\r\n\r\n	<p>010-123456</p>\r\n	</li>\r\n	<li>\r\n	<p>学习网址</p>\r\n\r\n	<p><a href=\"http://www.linux.org\">http://www.linux.org</a></p>\r\n	</li>\r\n	<li>\r\n	<p>上课时间</p>\r\n\r\n	<p>上学期（9~12月）：08:00~10:00<br />\r\n	下学期（3~5月）：08:00~10:00</p>\r\n	</li>\r\n</ul>\r\n</blockquote>\r\n', '赵老师', 1, 1, 2, '2020-10-28 10:56:39');
INSERT INTO `scenic` VALUES (6, '高等数学（下）', 5, '20201028111340616c17f1d0894060b0d6b0b39ede87cb.jpg', '初等数学之外的数学都是高等数学，也有将中学较深入的代数、几何以及简单的集合论初步、逻辑初步称为中等数学的，将其作为中小学阶段的初等数学与大学阶段的高等数学的过渡。通常认为，高等数学是由微积分学，较深入的代数学、几何学以及它们之间的交叉内容所形成的一门基础学科。主要内容包括：数列、极限、微积分、空间解析几何与线性代数、级数、常微分方程。工科、理科、财经类研究生考试的基础科目。', '<h2>课程特点</h2>\r\n\r\n<p>在中国<a href=\"https://baike.baidu.com/item/%E7%90%86%E5%B7%A5%E7%A7%91\" target=\"_blank\">理工科</a>各类专业的学生（数学专业除外，数学专业学<a href=\"https://baike.baidu.com/item/%E6%95%B0%E5%AD%A6%E5%88%86%E6%9E%90\" target=\"_blank\">数学分析</a>），学的数学较难，课本常称&ldquo;高等数学&rdquo;；<a href=\"https://baike.baidu.com/item/%E6%96%87%E5%8F%B2/72467\" target=\"_blank\">文史</a>科各类专业的学生，学的数学稍微浅一些，课本常称&ldquo;<a href=\"https://baike.baidu.com/item/%E5%BE%AE%E7%A7%AF%E5%88%86/6065\" target=\"_blank\">微积分</a>&rdquo;。<a href=\"https://baike.baidu.com/item/%E7%90%86%E5%B7%A5%E7%A7%91\" target=\"_blank\">理工科</a>的不同专业，文史科的不同专业，深浅程度又各不相同。研究变量的是高等数学，可高等数学并不只研究变量。至于与&ldquo;高等数学&rdquo;相伴的课程通常有：<a href=\"https://baike.baidu.com/item/%E7%BA%BF%E6%80%A7%E4%BB%A3%E6%95%B0\" target=\"_blank\">线性代数</a>（数学专业学<a href=\"https://baike.baidu.com/item/%E9%AB%98%E7%AD%89%E4%BB%A3%E6%95%B0\" target=\"_blank\">高等代数</a>），<a href=\"https://baike.baidu.com/item/%E6%A6%82%E7%8E%87%E8%AE%BA\" target=\"_blank\">概率论</a>与<a href=\"https://baike.baidu.com/item/%E6%95%B0%E7%90%86%E7%BB%9F%E8%AE%A1\" target=\"_blank\">数理统计</a>（有些数学专业分开学）。</p>\r\n\r\n<p>初等数学研究的是<a href=\"https://baike.baidu.com/item/%E5%B8%B8%E9%87%8F/10232375\" target=\"_blank\">常量</a>与匀<a href=\"https://baike.baidu.com/item/%E5%8F%98%E9%87%8F/5271\" target=\"_blank\">变量</a>，高等数学研究的是非匀变量。高等数学（它是几门课程的总称）是理、工科院校一门重要的基础学科，也是非数学专业理工科专业学生的必修数学课,也是其它某些专业的<a href=\"https://baike.baidu.com/item/%E5%BF%85%E4%BF%AE\" target=\"_blank\">必修</a>课。</p>\r\n\r\n<p>作为一门<a href=\"https://baike.baidu.com/item/%E5%9F%BA%E7%A1%80%E7%A7%91%E5%AD%A6\" target=\"_blank\">基础科学</a>，高等数学有其固有的特点，这就是高度的抽象性、严密的逻辑性和广泛的应用性。抽象性和计算性是数学最基本、最显著的特点，有了高度抽象和统一，我们才能深入地揭示其本质规律，才能使之得到更广泛的应用。严密的逻辑性是指在数学理论的归纳和整理中，无论是概念和表述，还是判断和推理，都要运用逻辑的规则，遵循思维的规律。所以说，数学也是一种思想方法，学习数学的过程就是思维训练的过程。人类社会的进步，与数学这门科学的广泛应用是分不开的。尤其是到了现代，电子计算机的出现和普及使得数学的应用领域更加拓宽，<a href=\"https://baike.baidu.com/item/%E7%8E%B0%E4%BB%A3%E6%95%B0%E5%AD%A6\" target=\"_blank\">现代数学</a>正成为科技发展的强大动力，同时也广泛和深入地渗透到了社会科学领域。</p>\r\n\r\n<p><img alt=\"\" src=\"/static/uploads/ckeditor/202010281112427d903989ac94402aa24d34303430c4f3.jpg\" style=\"height:432px; width:590px\" /></p>\r\n\r\n<p>19世纪以前确立的几何、<a href=\"https://baike.baidu.com/item/%E4%BB%A3%E6%95%B0\" target=\"_blank\">代数</a>、分析三大数学分支中，前两个都原是初等数学的分支，其后又发展了属于高等数学的部分，而只有分析从一开始就属于高等数学。分析的基础&mdash;&mdash;<a href=\"https://baike.baidu.com/item/%E5%BE%AE%E7%A7%AF%E5%88%86\" target=\"_blank\">微积分</a>被认为是&ldquo;<a href=\"https://baike.baidu.com/item/%E5%8F%98%E9%87%8F/3956968\" target=\"_blank\">变量</a>的数学&rdquo;的开始，因此，研究<a href=\"https://baike.baidu.com/item/%E5%8F%98%E9%87%8F\" target=\"_blank\">变量</a>是高等数学的特征之一。原始的变量概念是物质世界变化的诸量的直接抽象，现代数学中变量的概念包含了更高层次的抽象。如<a href=\"https://baike.baidu.com/item/%E6%95%B0%E5%AD%A6%E5%88%86%E6%9E%90\" target=\"_blank\">数学分析</a>中研究的限于实变量，而其他数学分支所研究的还有取复数值的复变量和<a href=\"https://baike.baidu.com/item/%E5%90%91%E9%87%8F\" target=\"_blank\">向量</a>、<a href=\"https://baike.baidu.com/item/%E5%BC%A0%E9%87%8F\" target=\"_blank\">张量</a>形式的，以及各种<a href=\"https://baike.baidu.com/item/%E5%87%A0%E4%BD%95%E9%87%8F\" target=\"_blank\">几何量</a>、<a href=\"https://baike.baidu.com/item/%E4%BB%A3%E6%95%B0%E9%87%8F\" target=\"_blank\">代数量</a>，还有取值具有偶然性的<a href=\"https://baike.baidu.com/item/%E9%9A%8F%E6%9C%BA%E5%8F%98%E9%87%8F\" target=\"_blank\">随机变量</a>、模糊变量和变化的（概率）空间&mdash;&mdash;范畴和随机过程。描述变量间依赖关系的概念由函数发展到<a href=\"https://baike.baidu.com/item/%E6%B3%9B%E5%87%BD\" target=\"_blank\">泛函</a>、<a href=\"https://baike.baidu.com/item/%E5%8F%98%E6%8D%A2\" target=\"_blank\">变换</a>以至于函子。与初等数学一样，高等数学也研究空间形式，只不过它具有更高层次的抽象性，并反映变化的特征，或者说是在变化中研究它。例如，曲线、<a href=\"https://baike.baidu.com/item/%E6%9B%B2%E9%9D%A2\" target=\"_blank\">曲面</a>的概念已发展成一般的<a href=\"https://baike.baidu.com/item/%E6%B5%81%E5%BD%A2\" target=\"_blank\">流形</a>。按照埃尔朗根纲领，几何是关于图形在某种变换群下不变性质的理论，这也就是说，几何是将各种空间形式置于变换之下来来研究的。</p>\r\n\r\n<blockquote>\r\n<h2><strong>学习须知：</strong></h2>\r\n\r\n<p><big>教师qq：97894562</big></p>\r\n\r\n<p><big>答疑地点及时间：文昌院303/周五上午9点-10点</big></p>\r\n</blockquote>\r\n', '于老师', 1, 1, 1, '2020-10-28 11:13:40');

-- ----------------------------
-- Table structure for suggestion
-- ----------------------------
DROP TABLE IF EXISTS `suggestion`;
CREATE TABLE `suggestion`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `addtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ix_suggestion_addtime`(`addtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of suggestion
-- ----------------------------
INSERT INTO `suggestion` VALUES (1, 'andy', 'andy@qq.com', 'haha', '2020-03-22 14:56:05');
INSERT INTO `suggestion` VALUES (2, 'andy', 'andy@qq.com', 'haha', '2020-03-22 14:58:57');
INSERT INTO `suggestion` VALUES (3, 'andy', 'andy@qq.com', 'haha', '2020-03-22 14:59:55');
INSERT INTO `suggestion` VALUES (4, 'andy', 'andy@qq.com', 'haha', '2020-03-22 14:59:59');
INSERT INTO `suggestion` VALUES (5, 'andy', 'andy@qq.com', 'haha', '2020-03-22 15:00:03');
INSERT INTO `suggestion` VALUES (6, 'andy', 'andy@qq.com', 'haha', '2020-03-22 15:00:43');
INSERT INTO `suggestion` VALUES (7, 'andy', 'andy@qq.com', 'haha', '2020-03-22 15:00:48');
INSERT INTO `suggestion` VALUES (8, 'andy', 'andy@qq.com', 'haha', '2020-03-22 15:01:12');
INSERT INTO `suggestion` VALUES (9, 'love', 'wty5201314@qhy.com', 'our story no end', '2020-05-20 13:14:00');

-- ----------------------------
-- Table structure for travels
-- ----------------------------
DROP TABLE IF EXISTS `travels`;
CREATE TABLE `travels`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `scenic_id` int(0) NULL DEFAULT NULL,
  `addtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `title`(`title`) USING BTREE,
  INDEX `ix_travels_addtime`(`addtime`) USING BTREE,
  INDEX `scenic_id`(`scenic_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of travels
-- ----------------------------
INSERT INTO `travels` VALUES (1, 'Linux系统编程学习攻略', '李四', '<p>第一本书：<br />\r\n深入理解计算机系统(原书第2版)（Amazon五星图书，被誉为&ldquo;价值超过等重量黄金的无价资源宝库&rdquo;)</p>\r\n\r\n<p><a href=\"https://link.zhihu.com/?target=http%3A//www.china-pub.com/197167\" target=\"_blank\">http://www.china-pub.com/197167</a></p>\r\n\r\n<p>这本书会让你对计算机、编程有个真切的体会，入门神书。不求全看，按需而看。此书对C语言有要求，但不高，看时参看相关书籍即可。</p>\r\n\r\n<p>C/C++：<br />\r\nc程序设计语言：<a href=\"https://link.zhihu.com/?target=http%3A//www.china-pub.com/14975\" target=\"_blank\">http://www.china-pub.com/14975</a></p>\r\n\r\n<p>c语言深度解剖:解开程序员面试笔试的秘密 ：<a href=\"https://link.zhihu.com/?target=http%3A//www.china-pub.com/196985\" target=\"_blank\">http://www.china-pub.com/196985</a></p>\r\n\r\n<p>C++程序设计语言：<a href=\"https://link.zhihu.com/?target=http%3A//www.china-pub.com/196448\" target=\"_blank\">http://www.china-pub.com/196448</a></p>\r\n\r\n<p>深入浅出MFC（第二版):<a href=\"https://link.zhihu.com/?target=http%3A//www.china-pub.com/3565\" target=\"_blank\">http://www.china-pub.com/3565</a>&nbsp;个人认为此书对于理解C++的机制极佳</p>\r\n\r\n<p>算法：<br />\r\n各高校ACM平台</p>\r\n\r\n<p>算法导论：<a href=\"https://link.zhihu.com/?target=http%3A//www.china-pub.com/31701\" target=\"_blank\">http://www.china-pub.com/31701</a></p>\r\n\r\n<p>算法C实现I～IV：<a href=\"https://link.zhihu.com/?target=http%3A//www.china-pub.com/14178\" target=\"_blank\">http://www.china-pub.com/14178</a></p>\r\n\r\n<p>算法C实现V：<a href=\"https://link.zhihu.com/?target=http%3A//www.china-pub.com/15116\" target=\"_blank\">http://www.china-pub.com/15116</a></p>\r\n\r\n<p>Linux Books：<br />\r\n1.内核书籍</p>\r\n\r\n<p>由于国内翻译国外书籍的翻译质量、以及有些机制必须深入内核方能明白，所以即便你不搞内核开发我也建议你买本内核的书备在案头，即便你不看，放也要放在那里，我相信，不就之后你就会看，仅推荐以下两本：</p>\r\n\r\n<p>深入Linux内核架构：<a href=\"https://link.zhihu.com/?target=http%3A//www.china-pub.com/196739\" target=\"_blank\">http://www.china-pub.com/196739</a></p>\r\n\r\n<p>深入理解linux内核：<a href=\"https://link.zhihu.com/?target=http%3A//www.china-pub.com/36767\" target=\"_blank\">http://www.china-pub.com/36767</a></p>\r\n\r\n<p>2.系统编程</p>\r\n\r\n<p>Unix环境高级编程（APUE）：<a href=\"https://link.zhihu.com/?target=http%3A//www.china-pub.com/28766\" target=\"_blank\">http://www.china-pub.com/28766</a></p>\r\n\r\n<p>APUE此乃圣经级别书籍，你不能不看，书中内容部分过时，或者废弃比如（STREAMS)。</p>\r\n\r\n<p>Linux程序设计：<a href=\"https://link.zhihu.com/?target=http%3A//www.china-pub.com/196711\" target=\"_blank\">http://www.china-pub.com/196711</a></p>\r\n\r\n<p>此书与APUE异曲同工，相对APUE更贴近Linux，且内容较新10新版，但稍逊于APUE。</p>\r\n\r\n<p>Unix网络编程：进程间通信（UNPv2）：<a href=\"https://link.zhihu.com/?target=http%3A//www.china-pub.com/196859\" target=\"_blank\">http://www.china-pub.com/196859</a></p>\r\n\r\n<p>虽然是98年的书，请相信我这是最好讲解的IPC进程间通信的书，非常经典。部分内容过时，看时参考我的博客。</p>\r\n\r\n<p>3.网络编程</p>\r\n\r\n<p>Unix网络编程：Socket API（UNPv1）：<a href=\"https://link.zhihu.com/?target=http%3A//www.china-pub.com/196770\" target=\"_blank\">http://www.china-pub.com/196770</a></p>\r\n\r\n<p>UNPv1是LInux网络编程的圣经，书中内容极为经典，但有若干章节早已过时，看时需注意。</p>\r\n\r\n<p>4.Shell编程</p>\r\n\r\n<p>Linux命令行和shell脚本编程宝典：<a href=\"https://link.zhihu.com/?target=http%3A//www.china-pub.com/45924\" target=\"_blank\">http://www.china-pub.com/45924</a></p>\r\n\r\n<p>我一直在看，真的不错。</p>\r\n\r\n<p>TCP/IP<br />\r\n计算机网络 第五版 ：<a href=\"https://link.zhihu.com/?target=http%3A//www.china-pub.com/38136\" target=\"_blank\">http://www.china-pub.com/38136</a></p>\r\n\r\n<p>我看过：Stevens的TCP/IP 详解和Commer的用TCP/IP进行网际互联 都不错，但我认为这本书 更好一些！！</p>\r\n\r\n<p>设计模式<br />\r\n设计模式：可复用面向对象软件的基础（模式中的泰山北斗）：<a href=\"https://link.zhihu.com/?target=http%3A//www.china-pub.com/25961\" target=\"_blank\">http://www.china-pub.com/25961</a></p>\r\n\r\n<p>Head First设计模式(中文版）：<a href=\"https://link.zhihu.com/?target=http%3A//www.china-pub.com/36020\" target=\"_blank\">http://www.china-pub.com/36020</a></p>\r\n\r\n<p>汇编<br />\r\n汇编语言（第2版）：<a href=\"https://link.zhihu.com/?target=http%3A//www.china-pub.com/40125\" target=\"_blank\">http://www.china-pub.com/40125</a></p>\r\n\r\n<p>Linux OS<br />\r\n对于我们来书 ，学习linux ，就要有一个顺手的系统 ，我使用 过Ubuntu Fedora这两个系统，这里推荐下Ubuntu10.10虽然说 Canonical 对开源社区的贡献很少，Ubuntu 真的很好用呀 呵呵。</p>\r\n\r\n<p>Ubuntu 10.10：<a href=\"https://link.zhihu.com/?target=http%3A//www.ubuntu.com/desktop/get-ubuntu/download\" target=\"_blank\">http://www.ubuntu.com/desktop/get-ubuntu/download</a></p>\r\n\r\n<p>Chrome：<a href=\"https://link.zhihu.com/?target=http%3A//www.google.com/chrome%3Fplatform%3Dlinux\" target=\"_blank\">http://www.google.com/chrome?platform=linux</a></p>\r\n\r\n<p>在我看来chrome是最优秀的浏览器。简洁的UI对于宽屏笔记本来说节省了好多屏幕呀；同步功让你的收藏夹随身携带，特别是使用linux和windows双系统的用户。最好的是你可以这样，把Bookmakrs Bar作成这样，用起来很方便：</p>\r\n\r\n<p>Eclipse:<a href=\"https://link.zhihu.com/?target=http%3A//www.eclipse.org/downloads/\" target=\"_blank\">http://www.eclipse.org/downloads/</a></p>\r\n\r\n<p>emerald透明主题: 使用Ubuntu softcenter 安装</p>\r\n\r\n<p>Ailurus：<a href=\"https://link.zhihu.com/?target=http%3A//code.google.com/p/ailurus/\" target=\"_blank\">http://code.google.com/p/ailurus/</a>&nbsp;一款非常优秀的系统管理软件，类似于windows优化大师，用了就知道。</p>\r\n\r\n<p>sunpinyin：<a href=\"https://link.zhihu.com/?target=http%3A//code.google.com/p/sunpinyin/\" target=\"_blank\">http://code.google.com/p/sunpinyin/</a></p>\r\n\r\n<p>使用了n多的输入法，相对来说sunpinyin挺优秀,scim google pinyin 也不错.</p>\r\n\r\n<p>咪咕音乐:<a href=\"https://link.zhihu.com/?target=http%3A//music.10086.cn/newweb/zq/2009/migu_music_client/default/_/_/_/_/_/_/p.html\" target=\"_blank\">http://music.10086.cn/newweb/zq/2009/migu_music_client/default/_/_/_/_/_/_/p.html</a></p>\r\n\r\n<p>咪咕音乐是中国移动倾力打造的正版音乐播放器,我刚刚试用过，和kugou很像绝对给力！！！就是占内存有点大。</p>\r\n\r\n<p>Audacious：我最喜欢的mp3播放软件。</p>\r\n\r\n<p>大神的blog<br />\r\n3天前google搜索algorithms时，偶遇pongba的blog，连看3天了。获益匪浅呀！！！</p>\r\n\r\n<p>pongba个人主页：<a href=\"https://link.zhihu.com/?target=http%3A//mindhacks.cn/\" target=\"_blank\">http://mindhacks.cn/</a></p>\r\n\r\n<p>pongbaCsdn主页：<a href=\"https://link.zhihu.com/?target=http%3A//blog.csdn.net/pongba\" target=\"_blank\">http://blog.csdn.net/pongba</a></p>\r\n\r\n<p>TopLanguage：<a href=\"https://link.zhihu.com/?target=https%3A//groups.google.com/group/pongba\" target=\"_blank\">https://groups.google.com/group/pongba</a>&nbsp;注意：一定要用https访问</p>\r\n\r\n<p>高性能服务器研发与运营邮件列表：<a href=\"https://link.zhihu.com/?target=https%3A//groups.google.com/group/dev4server/topics\" target=\"_blank\">https://groups.google.com/group/dev4server/topics</a></p>\r\n\r\n<p>Linux 新闻<br />\r\n<a href=\"https://link.zhihu.com/?target=http%3A//www.linuxeden.com/\" target=\"_blank\">http://www.linuxeden.com/</a></p>\r\n', 5, '2020-10-30 19:45:59');
INSERT INTO `travels` VALUES (2, '高等数学（上）学习攻略', '张三', '<p>1.先将我们的高数书仔细看一遍，每一章看完后，便做课后习题，此时肯定是有许多的题不会做，没关系，将不会做的用笔做个记号，接着做后面的题。<br />\r\n⒉将不会的习题翻书找出它在哪节中出现过，仔细想想，如果实在想不出就看看例题什么的，总能找出相似的例题。<br />\r\n3.将整本书全部按上述方法做完后开始做模拟试卷，将不会的题对着课本目录寻找它跟哪章哪节有联系，然后将相关章节仔细看&mdash;遍，再回过头来做题.<br />\r\n4.公式要记熟，主要是几个，基本的函数公式，洛必达法则，中值定理，导数公式，积分公式，微分公式;<br />\r\n5.例题要做熟，其实例题都是按公式的套路来的，做熟就行了，考试中一定都是那几个公式都要考的;<br />\r\n6.老师布置的作业非常重要，一定要认真，保质保量地完成，可以与参考书对照，因为老师认为必须学会的作业题很有可能就是考试题。上高数课往往有这样的感觉，很容易忘记，上一次课的内容到下一次课也许就忘光了，所以复习是必须的.<br />\r\n7.学完一章后，最好把这一章没有做过作业的习题都做一遍，这样便于理清条理，也是对自己学习情况的检测。不然等到考试才发现自己还有很多问题不懂，那就麻烦了。考试形式和难度与课后习题相差无几，考试前做一下这些题是很有用的。</p>\r\n', 1, '2020-10-28 11:15:54');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `pwd` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addtime` datetime(0) NULL DEFAULT NULL,
  `face` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` int(0) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE,
  UNIQUE INDEX `face`(`face`) USING BTREE,
  INDEX `ix_user_addtime`(`addtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (4, 'pbkdf2:sha256:50000$TkExX9Jm$d63477853a17dcaedcd52be4b6213ebb74b61a12456762ac19d6b7dfb559aa57', 'andy@mrsoft.com', '2018-03-23 14:26:12', NULL, NULL, NULL, 'Andy', NULL);
INSERT INTO `user` VALUES (5, 'pbkdf2:sha256:50000$qFfVpeJK$9bc7ff46019ff211c31081e016d42770be6fae4df99e2f8d386ebd00e852ebda', 'zhangsan@qq.com', '2018-08-10 10:50:34', NULL, NULL, NULL, '张三', NULL);
INSERT INTO `user` VALUES (7, 'pbkdf2:sha256:50000$sSujvFmg$0958ae9e146e41e1301d38c55d424fe9c1fae98c0843e84234fefe1aab1a7d38', 'lisi@qq.com', '2018-08-10 16:10:13', NULL, NULL, NULL, '李四', NULL);
INSERT INTO `user` VALUES (8, 'pbkdf2:sha256:50000$hgnE4S9B$ff3c6c5b5de51af60bc139692a12b20277419228e79b98e2eefe344e7a494a32', '1235@136.com', '2020-10-28 11:17:35', NULL, NULL, '12345678901', 'aaa', 0);
INSERT INTO `user` VALUES (9, 'pbkdf2:sha256:50000$M6JYPeZr$9f3229730650f0c563b16cc3f8a4a4aa45ff35b06d6351e03696405aceb445d2', '123455@qq.com', '2020-10-28 13:11:09', NULL, NULL, '123456711', 'duhas', 0);

-- ----------------------------
-- Table structure for userlog
-- ----------------------------
DROP TABLE IF EXISTS `userlog`;
CREATE TABLE `userlog`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NULL DEFAULT NULL,
  `ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ix_userlog_addtime`(`addtime`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userlog
-- ----------------------------
INSERT INTO `userlog` VALUES (1, 1, '127.0.0.1', '2018-03-23 10:06:15');
INSERT INTO `userlog` VALUES (2, 4, '127.0.0.1', '2018-03-23 14:28:54');
INSERT INTO `userlog` VALUES (3, 5, '127.0.0.1', '2018-08-10 10:50:56');
INSERT INTO `userlog` VALUES (4, 7, '127.0.0.1', '2018-08-11 09:12:38');
INSERT INTO `userlog` VALUES (5, 7, '127.0.0.1', '2018-08-11 09:21:02');
INSERT INTO `userlog` VALUES (6, 7, '127.0.0.1', '2018-08-13 09:24:59');
INSERT INTO `userlog` VALUES (7, 5, '127.0.0.1', '2018-08-13 09:33:05');
INSERT INTO `userlog` VALUES (8, 5, '127.0.0.1', '2018-08-13 10:35:49');
INSERT INTO `userlog` VALUES (9, 8, '127.0.0.1', '2020-10-28 11:17:48');
INSERT INTO `userlog` VALUES (10, 9, '127.0.0.1', '2020-10-28 13:11:36');
INSERT INTO `userlog` VALUES (11, 9, '127.0.0.1', '2020-10-31 00:11:58');
INSERT INTO `userlog` VALUES (12, 9, '127.0.0.1', '2020-10-31 00:12:45');

SET FOREIGN_KEY_CHECKS = 1;
