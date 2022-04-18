/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : superprofessor

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bms_billboard
-- ----------------------------
DROP TABLE IF EXISTS `bms_billboard`;
CREATE TABLE `bms_billboard`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT '公告',
  `create_time` datetime NULL DEFAULT NULL COMMENT '公告时间',
  `show` tinyint(1) NULL DEFAULT NULL COMMENT '1：展示中，0：过期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4  COMMENT = '全站公告' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bms_billboard
-- ----------------------------
INSERT INTO `bms_billboard` VALUES (2, '夜间模式', '2020-11-19 17:16:19', 0);
INSERT INTO `bms_billboard` VALUES (4, 'Hello World', NULL, 1);


-- ----------------------------
-- Table structure for bms_follow
-- ----------------------------
DROP TABLE IF EXISTS `bms_follow`;
CREATE TABLE `bms_follow`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` varchar(20) CHARACTER SET utf8mb4 NULL DEFAULT NULL COMMENT 'p_ID',
  `follower_id` varchar(20) CHARACTER SET utf8mb4 NULL DEFAULT NULL COMMENT 'f_ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 130 CHARACTER SET = utf8mb4  COMMENT = '用户关注' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bms_follow
-- ----------------------------
INSERT INTO `bms_follow` VALUES (65, '1329723594994229250', '1317498859501797378');
INSERT INTO `bms_follow` VALUES (85, '1332912847614083073', '1332636310897664002');
INSERT INTO `bms_follow` VALUES (129, '1349290158897311745', '1349618748226658305');

-- ----------------------------
-- Table structure for bms_post
-- ----------------------------
DROP TABLE IF EXISTS `bms_post`;
CREATE TABLE `bms_post`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
	`url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'markdown内容',
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'userID',
  `comments` int NOT NULL DEFAULT 0 COMMENT '评论统计',
  `collects` int NOT NULL DEFAULT 0 COMMENT 'collect',
  `view` int NOT NULL DEFAULT 0 COMMENT '浏览统计',
  `top` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否置顶，1-是，0-否',
  `essence` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否加精，1-是，0-否',
  `section_id` int NULL DEFAULT 0 COMMENT 'sectionID',
  `create_time` datetime NOT NULL COMMENT '发布时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  UNIQUE INDEX `title`(`title`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '教授表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bms_post
-- ----------------------------
INSERT INTO `bms_post` VALUES ('1333447953558765569', '张大鹏', 'https://s2.loli.net/2022/04/09/PK5pboTEsuGDUR3.png', '张大鹏教授是香港中文大学（深圳）数据科学学院校长学勤讲座教授、深圳市人工智能与机器人研究院（AIRS）计算机视觉研究中心主任、港中大（深圳）-联易融计算机视觉与人工智能联合实验室主任。

张大鹏教授毕业于北京大学计算机科学专业。他于1982年和1985年分别获得哈尔滨工业大学（HIT）计算机理学硕士及博士学位。1986年至1988年，作为中国首批博士后从师于清华大学著名导师常桐院士。1994年，又获得加拿大滑铁卢大学(University of Waterloo) 电气和计算机工程博士学位。自2005年以来, 他一直担任香港理工大学计算学系的讲座教授(智能计算)，并创建主持了香港特区政府资助的生物识别研究中心(UGC/CRC)。目前，他已受聘作为香港中文大学（深圳）的校长讲座教授。同时还长期担任清华大学双聘教授，以及哈工大、北大、上海交大、国防科大及加拿大滑铁卢大学的兼职教授。

他是国际图像和图形学报（IJIG）(http://www.worldscinet.com/ijig/ijig.shtml)以及Springer国际生物识别丛书（KISB）(http://www.springer.com/series/6191)的创始人和主编。40多年来一直从事模式识别，图像处理以及生物特征识别研究，是掌纹识别、中医四诊量化及人脸美学等研究领域的开创者和领军人。其研究成果曾多次获奖， 如中韩授予的发明金奖及特殊金奖、日内瓦发明展银奖，以及授予的我国香港特别行政区最高科学技术奖项“裘槎(Chroucher Foundation)优秀科研者”奖(http://www.croucher.org.hk/)等。 张教授已出版了20多部相关专著、500余篇国际期刊论文和40多项美国、日本、中国专利。从2014年开始，他已连续八年被Clarivate Analytics(前身为汤森路透)列为“高被引科学家”(http://highlycited.com) 。2021年，在国际计算机科学和电子学的Top 1000名科学家评选中，张教授以H-Index 120排名85 (http://www.guide2research.com/scientists)。

张教授还是IEEE计算机学会杰出演讲人，以及美国电气和电子工程师学会（IEEE）终身会士、国际模式识别协会（IAPR）和亚洲人工智能学会会士。张大鹏教授凭借其在生物特征识别领域的卓越成就，分别于2020年和2021年当选为加拿大皇家科学院和加拿大工程院两院院士。', '1349290158897311745', 0, 0, 77, b'0', b'0', 0, '2022-04-17 00:29:01', '2022-04-17 00:29:01');
INSERT INTO `bms_post` VALUES ('1349362401438392322', '蔡小强', 'https://s2.loli.net/2022/04/09/gpzaFDKQOuYEbZn.png', '蔡小强教授1988年获清华大学博士学位。1989-1991年在英国剑桥大学及贝尔法斯特女皇大学从事博士后研究。1991-1993年受聘任教西澳大利亚大学。1993年应聘加入香港中文大学系统工程及工程管理学系，2000年起任教授。他曾于1996-2003年担任香港中文大学系统工程与工程管理学系的系主任，2009-2012年任研究生学部主任，2010-2014年任香港中文大学和声书院首任通识教育主任。2014-2017担任香港中文大学（深圳）理工学院院长，2016起担任协理副校长，2018年起任校长讲习教授。 

蔡教授的研究主要集中在工业与系统工程、运筹学、供应链与物流管理等领域。他于国际学术刊物、专著、及会议发表论文300多篇，其中包括主流学术刊物（如Management Science、Operations Research、SIAM Journal on Control and Optimization、Naval Research Logistics、Production and Operations Management、IIE Transactions、IEEE Transactions、 Transportation Science、Transportation Research等）论文100多篇。他曾担任多个学术会议主席、国际顾问委员会委员、程序委员会委员和组织委员会委员，及多个学术刊物主编、副主编、编委。他于2021年获IEOM学会物流与供应链杰出教授奖。  

他是国家杰出青年科学基金（海外类）获得者，香港工程师学会Fellow, 亚太人工智能学会(AAIA) Fellow, 国际系统与控制科学院院士。', '1349290158897311745', 0, 0, 21, b'0', b'0', 0, '2022-04-17 00:29:01', '2022-04-17 00:29:01');
INSERT INTO `bms_post` VALUES ('1334481725322297346', '陈天石', 'https://s2.loli.net/2022/04/09/4RKi2oUdnl1cQxh.png', '陈天石在2001年以全系第一名的成绩从哈尔滨工业大学控制科学与工程系毕业获学士学位，在2005年从哈尔滨工业大学获得控制科学与控制工程硕士学位，在2008年12月从香港中文大学获得自动化与计算机辅助工程博士学位。从2009年4月至2015年12月，他在瑞典Linkoping 大学电气工程系工作，先任博士后（从2009年4月至2011年3月），后任助理教授（从2011年4月至2015年12月）。在2015年5月，他入选了国家第十一批“千人计划”青年人才（“青年千人计划”）。在2015年12月，他回国加入香港中文大学（深圳），任职副教授。

他主要从事系统辨识（数据驱动的建模和分析）、统计信号处理、机器学习、数据科学、非线性控制及其应用的研究工作。他在欧洲和中国参与了若干科研项目。目前，他主持一项由国家自然科学基金资助的面上项目（2018-2021），一项由深圳市科创委资助的学科布局项目（2017-2019），和一项由瑞典研究委员会资助的青年科学家基金(2015-2018，当年申请成功率为9.8%)。作为项目负责人，他目前获得的竞争性项目总经费为726万人民币和360万瑞典克朗。他在2011-2015年期间，作为主要合作者还参与了欧盟研究委员会资助的高级研究项目LEARN (Limitations, Estimation, Adaptivity, Reinforcement, Networks in System Identification, 250万欧元)。

他是Automatica（2017-至今）和System & Control Letters（2017-至今）的编委，他还是 IEEE控制系统协会会议编委会（CEB）的编委（2016-至今）。', '1349290158897311745', 0, 0, 46, b'0', b'0', 0, '2020-12-03 20:56:51', '2022-04-17 00:29:01');
INSERT INTO `bms_post` VALUES ('1332650453142827009', '陈昕韫', 'https://s2.loli.net/2022/04/09/fB5PzmY8nqOGAXv.png', '陈昕韫博士于2014年取得哥伦比亚大学运筹学博士学位。她的研究兴趣包括应用概率论、蒙特卡洛方法和它们在金融市场中的应用。相关研究成果发表于Annals of Applied Probability、Mathematics of Operations Research和Accounting and Finance等期刊。在加入香港中文大学（深圳）前，她曾经是纽约州立大学石溪分校和武汉大学的助理教授。

', '1349290158897311745', 0, 0, 29, b'0', b'0', 1, '2022-04-17 00:29:01', '2022-04-17 00:29:01');
INSERT INTO `bms_post` VALUES ('1333432347031646209', '林成川','https://pic.imgdb.cn/item/625141d5239250f7c5249bc8.png','研究领域
中国古代小说、文学理论与批评', '1349290158897311745',0, 0, 6, b'0', b'0', 0, '2022-04-17 00:29:01', '2022-04-17 00:29:01');
INSERT INTO `bms_post` VALUES ('1333668258587750401', '雷仕伟', 'https://pic.imgdb.cn/item/62514240239250f7c525c72d.png', '研究领域
中国古代史、世界古代史、人类学','1349290158897311745', 0, 0, 7, b'0', b'0', 0, '2022-04-17 00:29:01', '2022-04-17 00:29:01');
INSERT INTO `bms_post` VALUES ('1332682473151635458', '黄铠', 'https://pic.imgdb.cn/item/625142b4239250f7c52715fb.png', '黄铠教授现为香港中文大学（深圳）校长讲座教授。他毕业于美国加利福尼亚大学伯克利分校，获电子工程和计算机科学博士学位。黄教授先后任教于普度大学和南加州大学 45 年，获终身教授职位。他还曾任清华大学，香港大学等校杰出讲座教授多年。目前，他也兼任深圳市人工智能与机器人研究院的智能云计算与物联网研究中心主任，他领导的团队研究项目主要是开发智能医疗云平台与数字城市的多体智能应用。黄教授是世界并行处理计算机结构的先驱学者之一。多年来，黄教授在计算机与互联网方面出版了十本英文专著，其中六本曾被翻译为四国文字，在全球被广泛采用。他发表了280 篇论文。目前Google 学者引用率超过20500 次，h‐index 为62。他1983 年出版国际上第一本经典著作《计算机系统结构与并行计算》并多次回国讲学，推动了高性能计算的研发热潮，促进了国内银河、曙光、天河超算系统的建立。黄教授获得诸多奖项，其中包括2012 IEEE 世界云计算大会终身成就奖，2019 年获得建国70 周年70 人科技创新成就奖，2020 年获得吴文俊人工智能自然科学奖。他为中国计算机领域培养了几千名专业人才，包括6位院士、10 位IEEE/CCF 会士、30 多位计算机高科技领军骨干。中国计算机学会（CCF）向黄教授颁授首届2005 海外杰出学者贡献奖以表彰他对中国工程科技事业的巨大贡献。海外杰出学者贡献奖是CCF 为海外学者颁发的最高奖项。', '1349290158897311745',0, 0, 94, b'0', b'0', 2, '2022-04-17 00:29:01', '2022-04-17 00:29:01');
INSERT INTO `bms_post` VALUES ('1333695976536748034', '钟叶青', 'https://pic.imgdb.cn/item/62514300239250f7c527d7da.png', '钟叶青教授现为香港中文大学（深圳）教授，他于1983年获得中原大学计算机学士学位，1988及1992年获得美国雪城大学（Syracuse University）计算机硕士及博士学位。毕业后回到台湾，在逢甲大学资讯工程学系任教，担任副教授，教授，系主任，及所长等职务。2002年08月至2016年01月，在台湾清华大学资讯工程学系担任教授，其间曾担任图书馆副馆长，建立台湾第一个以UHF RFID为主的图书馆自动化系统。钟叶青博士于2007年创立了台湾格网计算学会（该学会于2010年改名为台湾云端计算学会）并担任第一及第二届的理事长。曾带领台湾清华大学的学生团队，赢得2010及2011年在美国举办的学生超算竞赛 (Student Cluster Competition) 冠军。也担任过许多国际会议的大会主席 (General Chair)，议程主席 (Program Chair)，及大会讲者 (keynote Speaker)。也多次获得台湾清华大学的杰出产学研究奖。2015-2018年，他在深圳清华大学研究院云计算与容灾技术实验室，担任副主任。', '1349290158897311745',0, 0, 45, b'1', b'1', 0, '2022-04-17 00:29:01', '2022-04-17 00:29:01');
INSERT INTO `bms_post` VALUES ('1349631541260595202', '李文烨', 'https://pic.imgdb.cn/item/6251434a239250f7c5289eff.png', '李文烨博士1995到1999年就读于山东大学计算机科学系，获得理学学士学位；1999到2003年就读于中国科学院软件研究所，获得工学硕士学位；2003到2007年就读于香港中文大学计算机科学与工程学系，获得哲学博士学位。2007到2009年，他在香港中文大学和加拿大阿尔伯塔大学从事博士后研究，2009到2016年在澳门理工学院任教。2016年8月，李博士加入香港中文大学（深圳）和深圳市大数据研究院，从事计算机和信息科学领域的教学科研工作。

李博士在机器学习和人工智能领域发表了30余篇第一作者论文，获得了IEEE-ICAL会议一项最佳论文奖和一项最佳论文提名。在澳门工作期间，他主持并完成了4项政府委托的基础研究项目，总资助金额逾百万港币。他常年担任NIPS、IJCAI、AAAI等多个学术会议的组织者和审稿人。','1349290158897311745', 0, 0, 17, b'0', b'0', 0, '2022-04-17 00:29:01', '2022-04-17 00:29:01');
INSERT INTO `bms_post` VALUES ('1333676096156528641', '吕伯君', 'https://pic.imgdb.cn/item/62514387239250f7c52947ee.png', '吕伯君博士于2008年获得中国科学技术大学（USTC）应用数学一等荣誉学士学位。 后于2014年7月在香港中文大学（CUHK）系统工程与工程管理系获得博士学位。毕业后，吕博士在WorldQuant LLC和Foresea Life Insurance CO., LTD 担任金融量化研究员，随后在Ping An (Group) Insruance CO., LTC 风险管理部短期工作，丰富了业界实践经验。她的研究兴趣包括量化金融，运筹优化建模，多元变量建模方法论等。', '1349290158897311745', 0, 0, 38, b'0', b'0', 0, '2022-04-17 00:29:01', '2022-04-17 00:29:01');
INSERT INTO `bms_post` VALUES ('1332681213400817665', '蔡玮', 'https://pic.imgdb.cn/item/625143eb239250f7c52a68a3.png', '蔡玮教授2008年毕业于厦门大学软件工程系，2011年获韩国首尔大学电气工程与计算机科学硕士，2016年获加拿大不列颠哥伦比亚大学电气与计算机工程博士，并于2016年至2018年期间在该校担任博士后研究员。求学期间曾赴日本国立情报学研究所、香港理工大学、台湾中央研究院等科研院所从事访问研究工作。

蔡玮教授于2018年8月加入香港中文大学(深圳)，担任理工学院计算机工程助理教授、博士生导师，人云系统实验室主任，香港中文大学（深圳）- 纯白矩阵虚拟空间联合实验室主任。他的研究兴趣主要包括元宇宙、区块链、游戏、人机交互等，目前已在国际主流学术期刊和会议发表70余篇论文，曾荣获2019 ACM BSCI最佳学生论文奖，2018年中国区块链大会最佳论文奖，2015年度中国国家优秀自费留学生奖学金，CloudCom2014、SmartComp2014以及CloudComp2013最佳论文奖等。他是现任IEEE Transactions on Cloud Computing的编委，中国计算机协会计算艺术分会、人机交互专委会、区块链专委会执委。', '1349290158897311745', 0, 0, 55, b'0', b'0', 1, '2022-04-17 00:29:01', '2022-04-17 00:29:01');
INSERT INTO `bms_post` VALUES ('1335149981733449729', '黄锐', 'https://pic.imgdb.cn/item/62514425239250f7c52b0d01.png', '黄锐教授先后毕业于北京大学（理学学士，1999），中科院自动化所（工学硕士，2002），和美国罗格斯大学（博士，2008）。博士毕业后他在罗格斯大学继续从事了两年博士后研究并于2010年回到中国加入华中科技大学担任教职。2012年至2016年，他曾在NEC中国研究院担任研究员，现任香港中文大学（深圳）理工学院副教授。黄教授在数据降维和子空间分析、可变形模型（deformable models）、概率图模型等方法以及它们在计算机视觉、模式识别、（医学）图像处理中的应用等方面做过大量研究工作，近年来主要从事智能视频监控相关的研究，包括行人的检测、跟踪与识别等。目前研究兴趣集中在计算机视觉在机器人领域的应用。黄教授已发表相关领域学术论文50余篇，主持过包括国家自然科学基金在内的多项科研课题。','1349290158897311745', 0, 0, 41, b'0', b'0', 0, '2022-04-17 00:29:01', '2022-04-17 00:29:01');


-- ----------------------------
-- Table structure for bms_comment
-- ----------------------------
DROP TABLE IF EXISTS `bms_comment`;
CREATE TABLE `bms_comment`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '内容',
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教授ID',
  `topic_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'topic_id',
  `create_time` datetime NOT NULL COMMENT '发布时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bms_tag
-- ----------------------------
DROP TABLE IF EXISTS `bms_tag`;
CREATE TABLE `bms_tag`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标签',
  `topic_count` int NOT NULL DEFAULT 0 COMMENT '关联话题',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标签表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bms_tag
-- ----------------------------
INSERT INTO `bms_tag` VALUES ('1332650453377708034', 'sse', 1);
INSERT INTO `bms_tag` VALUES ('1332681213568589825', 'sse', 1);
INSERT INTO `bms_tag` VALUES ('1332681213631504385', 'sds', 1);
INSERT INTO `bms_tag` VALUES ('1332682473218744321', 'sds', 1);
INSERT INTO `bms_tag` VALUES ('1332913064463794178', 'sse', 2);
INSERT INTO `bms_tag` VALUES ('1332913064530903041', 'sds', 1);
INSERT INTO `bms_tag` VALUES ('1333432347107143681', 'sds', 1);
INSERT INTO `bms_tag` VALUES ('1333432347107143682', 'hss', 1);
INSERT INTO `bms_tag` VALUES ('1333447953697177602', 'sse', 2);
INSERT INTO `bms_tag` VALUES ('1333676096320106498', 'sds', 1);
INSERT INTO `bms_tag` VALUES ('1333695976742268930', 'hss', 1);
INSERT INTO `bms_tag` VALUES ('1334481725519429634', 'sds', 1);
INSERT INTO `bms_tag` VALUES ('1349362401597775874', 'sds', 1);
INSERT INTO `bms_tag` VALUES ('1349631541306732545', 'sse', 1);


-- ----------------------------
-- Table structure for bms_post_tag
-- ----------------------------
DROP TABLE IF EXISTS `bms_post_tag`;
CREATE TABLE `bms_post_tag`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tag_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称ID',
  `topic_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学院ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tag_id`(`tag_id`) USING BTREE,
  INDEX `topic_id`(`topic_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '名称-学院 中间表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bms_post_tag
-- ----------------------------
INSERT INTO `bms_post_tag` VALUES (36, '1332650453377708034', '1332650453142827009');
INSERT INTO `bms_post_tag` VALUES (37, '1332681213568589825', '1332681213400817665');
INSERT INTO `bms_post_tag` VALUES (38, '1332681213631504385', '1332681213400817665');
INSERT INTO `bms_post_tag` VALUES (39, '1332682473218744321', '1332682473151635458');
INSERT INTO `bms_post_tag` VALUES (40, '1332913064463794178', '1332913064396685314');
INSERT INTO `bms_post_tag` VALUES (41, '1332913064530903041', '1332913064396685314');
INSERT INTO `bms_post_tag` VALUES (42, '1333432347107143681', '1333432347031646209');
INSERT INTO `bms_post_tag` VALUES (43, '1333432347107143682', '1333432347031646209');
INSERT INTO `bms_post_tag` VALUES (44, '1333447953697177602', '1333447953558765569');
INSERT INTO `bms_post_tag` VALUES (45, '1332913064463794178', '1333668258587750401');
INSERT INTO `bms_post_tag` VALUES (46, '1333676096320106498', '1333676096156528641');
INSERT INTO `bms_post_tag` VALUES (47, '1333695976742268930', '1333695976536748034');
INSERT INTO `bms_post_tag` VALUES (48, '1334481725519429634', '1334481725322297346');
INSERT INTO `bms_post_tag` VALUES (49, '1333447953697177602', '1335149981733449729');
INSERT INTO `bms_post_tag` VALUES (50, '1349362401597775874', '1349362401438392322');
INSERT INTO `bms_post_tag` VALUES (51, '1349631541306732545', '1349631541260595202');




-- ----------------------------
-- Table structure for ums_user
-- ----------------------------
DROP TABLE IF EXISTS `ums_user`;
CREATE TABLE `ums_user`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `username` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `avatar` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `score` int NOT NULL DEFAULT 0 COMMENT 'score',
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'token',
  `bio` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人简介',
  `active` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否激活，1：是，0：否',
  `status` bit(1) NULL DEFAULT b'1' COMMENT '状态，1：使用，0：停用',
  `role_id` int NULL DEFAULT NULL COMMENT '用户角色',
  `create_time` datetime NOT NULL COMMENT '加入时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_name`(`username`) USING BTREE,
  INDEX `user_email`(`email`) USING BTREE,
  INDEX `user_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_user
-- ----------------------------
INSERT INTO `ums_user` VALUES ('1349290158897311745', 'admin', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '', '123456@qq.com', NULL, 2, '', '', b'1', b'1', NULL, '2022-04-17 17:40:17', NULL);
INSERT INTO `ums_user` VALUES ('1349618748226658305', 'zhangsan', 'zhangsan', 'e10adc3949ba59abbe56e057f20f883e', '', '123456@qq.com', NULL, 0, '', '', b'1', b'1', NULL, '2022-04-17 15:25:59', NULL);

SET FOREIGN_KEY_CHECKS = 1;
