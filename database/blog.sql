/*
Navicat MySQL Data Transfer

Source Server         : 192.168.31.254
Source Server Version : 50648
Source Host           : 192.168.31.254:3306
Source Database       : lara

Target Server Type    : MYSQL
Target Server Version : 50648
File Encoding         : 65001

Date: 2020-12-11 11:11:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '描述',
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '链接url',
  `pid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否显示',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_pid_index` (`pid`),
  KEY `categories_status_index` (`status`),
  KEY `categories_sort_index` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', '新闻', '', '', '0', '1', '0', '2020-11-23 22:15:08', '2020-11-23 22:15:08');

-- ----------------------------
-- Table structure for collections
-- ----------------------------
DROP TABLE IF EXISTS `collections`;
CREATE TABLE `collections` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `post_id` bigint(20) unsigned NOT NULL COMMENT '文章id',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `collections_post_id_index` (`post_id`),
  KEY `collections_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of collections
-- ----------------------------

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `post_id` bigint(20) unsigned NOT NULL COMMENT '文章id',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户id',
  `content` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '评论内容',
  `at_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '回复评论id',
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '评论ip',
  `read` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否已读',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否显示',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_post_id_index` (`post_id`),
  KEY `comments_user_id_index` (`user_id`),
  KEY `comments_at_id_index` (`at_id`),
  KEY `comments_read_index` (`read`),
  KEY `comments_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of comments
-- ----------------------------

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for links
-- ----------------------------
DROP TABLE IF EXISTS `links`;
CREATE TABLE `links` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '链接地址',
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '链接图片',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否显示',
  `target` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `links_sort_index` (`sort`),
  KEY `links_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of links
-- ----------------------------
INSERT INTO `links` VALUES ('1', 'Lara博客', 'http://lara.zfsphp.com', '', '0', '1', '0', '2020-11-23 21:59:20', '2020-11-23 21:59:20');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2018_05_11_024840_create_categories_table', '1');
INSERT INTO `migrations` VALUES ('3', '2018_05_12_155005_create_tags_table', '1');
INSERT INTO `migrations` VALUES ('4', '2018_05_13_052846_create_links_table', '1');
INSERT INTO `migrations` VALUES ('5', '2018_05_14_064021_create_pages_table', '1');
INSERT INTO `migrations` VALUES ('6', '2018_05_15_023756_create_articles_table', '1');
INSERT INTO `migrations` VALUES ('7', '2018_05_23_060750_create_configs_table', '1');
INSERT INTO `migrations` VALUES ('8', '2018_05_24_113322_create_comments_table', '1');
INSERT INTO `migrations` VALUES ('9', '2018_05_25_082819_create_roles_table', '1');
INSERT INTO `migrations` VALUES ('10', '2018_06_13_035033_create_collections_table', '1');
INSERT INTO `migrations` VALUES ('11', '2018_07_15_032530_create_nodes_table', '1');
INSERT INTO `migrations` VALUES ('12', '2018_07_15_034451_create_node_role_table', '1');
INSERT INTO `migrations` VALUES ('13', '2019_08_20_142134_seed_sites_data', '1');
INSERT INTO `migrations` VALUES ('14', '2020_08_22_152917_create_notifications_table', '1');
INSERT INTO `migrations` VALUES ('15', '2020_08_27_225205_create_failed_jobs_table', '1');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `category_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `keyword` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '关键词',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '描述',
  `thumb` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '缩略图',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览数',
  `replies` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `author` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '作者',
  `create_time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `posts_title_index` (`title`),
  KEY `posts_user_id_index` (`user_id`),
  KEY `posts_category_id_index` (`category_id`),
  KEY `posts_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '测试', '测试', '1', '1', '', '', '', '1', '0', '0', null, null, '', '0');
INSERT INTO `news` VALUES ('20', '天津：海联冷库感染来源为北美猪头', '<p><span class=\"bjh-p\">来源：海外网</span></p><p><span class=\"bjh-p\">据“天津发布”微博消息，11月24日，天津召开第155场疫情防控新闻发布会。会上，天津市疾控中心副主任张颖通报，海联冷库与瞰海轩之间没有关联，海联冷库感染来源为北美猪头。</span></p><div class=\"img-container\"><img class=\"normal\" width=\"468px\" data-loadfunc=\"0\" src=\"https://pics6.baidu.com/feed/562c11dfa9ec8a1337818b08bd8f3288a2ecc0d7.jpeg?token=8a1cac19c14537389f5eaf22f06f359d\" data-loaded=\"0\"/></div><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics1.baidu.com/feed/622762d0f703918f5ebed2ebe264859059eec402.jpeg?token=bbc673f3e7335a6927e786005c4e7b48\" data-loaded=\"0\"/></div><div class=\"img-container\"><img class=\"normal\" width=\"462px\" data-loadfunc=\"0\" src=\"https://pics5.baidu.com/feed/838ba61ea8d3fd1f516f8b4bd415861895ca5f3b.jpeg?token=786fdda56a8b7c3830c98483f8bd4214\" data-loaded=\"0\"/></div><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics2.baidu.com/feed/ac345982b2b7d0a2830a6c082ab4d50e49369ac3.jpeg?token=dc05b23bec7f09d44126dcca1c67b321\" data-loaded=\"0\"/></div>', '0', '0', '', '', '', '1', '0', '0', null, null, '人民日报海外网', '1606232714');
INSERT INTO `news` VALUES ('21', '外交部回应英国涉港言论：没有资格当判官，收起虚伪和双重标准', '<p><span class=\"bjh-p\">【环球时报-环球网报道 记者 王盼盼】11月24日，外交部发言人赵立坚主持例行记者会，部分内容如下。</span></p><p><span class=\"bjh-p\">问:据报道，23日，英国外交及联邦事务部发表《香港问题半年报告》。英外交大臣拉布为报告撰写序言称，中国政府颁布香港国安法、取消数名立法会议员资格，短短5个月内两次严重违反《中英联合声明》，令人质疑其对“一国两制&#34;承诺。英将继续捍卫港人权利，落实《中英联合声明》中方对此有何评论?</span></p><p><span class=\"bjh-p\">答:香港已经回归祖国23年，英国政府还在通过发表所谓《香港问题半年报告》对香港事务颠倒黑白，说三道四，对中方进行无理指责，我们对此坚决反对，强烈谴责。</span></p><p><span class=\"bjh-p\">香港回归以来，中国中央政府切实贯彻落实“一国两制”、“港人治港”、高度自治方针，严格按宪法和基本法办事，全力支持行政长官和特区政府依法施政，香港居民依法享有充分的权利和自由。中国政府贯彻“一国两制”的决心坚定不移，维护国家主权、安全、发展利益的决心坚定不移，反对任何外部势力干涉香港事务的决心坚定不移。</span></p><p><span class=\"bjh-p\">我再次强调，香港是中国的特别行政区，英国对香港事务没有任何监督权和所谓道义责任，无权借《中英联合声明》干预香港事务。过去英国在殖民统治时期，没有给过香港民主。今天，英国也没有资格当判官！我们敦促英方摒弃殖民主义思想，收起虚伪和双重标准，停止干涉别国内政，早日回归国际法和国际关系基本准则的正道。</span></p><p><span class=\"bjh-p\">责编：张振 </span></p>', '0', '0', '', '', '', '1', '0', '0', null, null, '人民资讯', '1606232714');
INSERT INTO `news` VALUES ('22', '', '', '0', '0', '', '', '', '1', '0', '0', null, null, '', '1606232715');
INSERT INTO `news` VALUES ('23', '包茂高速陕西铜川段43车相撞  目前已造成4人死亡6人受伤', '<div class=\"img-container video-container\" data-rid=\"mda-kkptbyt9me2u2nyp\" data-showlog=\"tid:950;cst:1;ct:2;logInfo:main_video;\" data-extralog=\"rid:9598926549759065711;vid:mda-kkptbyt9me2u2nyp;\"><video style=\"display:block; height:100%;\" class=\"video-player\" x-webkit-airplay=\"allow\" preload=\"none\" poster=\"https://pic.rmb.bdstatic.com/bjh/news/a52947c0e24867b409fac1246eb7b576.jpeg\" src=\"https://vd3.bdstatic.com/mda-kkptbyt9me2u2nyp/mda-kkptbyt9me2u2nyp.mp4?playlist=%5B%22hd%22%2C%22sc%22%5D\"></video><div class=\"video-icon no-length-icon\"></div><div class=\"video-time-length\">00:31</div></div><p><span class=\"bjh-p\">今天（24日）早晨7时03分，包茂高速公路陕西铜川耀州区关庄立交桥路段因团雾发生43辆车相撞事故，造成十余辆车起火。事故发生后，公安、消防、应急、交通、卫生等相关部门抵达现场开展救援工作，上午10时20分现场明火被扑灭。<span class=\"bjh-br\"></span></span></p><div class=\"img-container\"><img class=\"normal\" width=\"416px\" data-loadfunc=\"0\" src=\"https://pic.rmb.bdstatic.com/bjh/news/d6bf866166d7bf7a5c7d2222eb6184a1.gif\" data-loaded=\"0\"/></div><p><span class=\"bjh-p\">目前事故已造成4人死亡、6人受伤，救援仍在进行中。（总台央视记者 杨雨桐 高涛 白龙飞）</span></p><p><span class=\"bjh-p bjh-text-align-right\">（编辑 王一冰）</span></p>', '0', '0', '', '', '', '1', '0', '0', null, null, '央视新闻', '1606232715');
INSERT INTO `news` VALUES ('24', '国办发文解决老年人运用智能技术困难！不得拒收现金', '<p><span class=\"bjh-p\">中新经纬客户端11月24日电 24日下午，国务院办公厅印发《关于切实解决老年人运用智能技术困难实施方案的通知》(下称《通知》)提到，强化支付市场监管，加大对拒收现金、拒绝银行卡支付等歧视行为的整改整治力度。</span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics7.baidu.com/feed/caef76094b36acaf39f6f6861b972e1701e99c0f.jpeg?token=2030dcbcc76c9f4a2d37dce99efba1da\" data-loaded=\"0\"/></div><p><span class=\"bjh-p\">截图来源：中国政府网</span></p><p><span class=\"bjh-p\">《通知》明确，在政策引导和全社会的共同努力下，有效解决老年人在运用智能技术方面遇到的困难，让广大老年人更好地适应并融入智慧社会。到2020年底前，集中力量推动各项传统服务兜底保障到位，抓紧出台实施一批解决老年人运用智能技术最迫切问题的有效措施，切实满足老年人基本生活需要。到2021年底前，围绕老年人出行、就医、消费、文娱、办事等高频事项和服务场景，推动老年人享受智能化服务更加普遍，传统服务方式更加完善。到2022年底前，老年人享受智能化服务水平显著提升、便捷性不断提高，线上线下服务更加高效协同，解决老年人面临的“数字鸿沟”问题的长效机制基本建立。</span></p><p><span class=\"bjh-p\">《通知》提出，做好突发事件应急响应状态下对老年人的服务保障。具体包括：完善“健康码”管理，便利老年人通行；保障居家老年人基本服务需要；在突发事件处置中做好帮助老年人应对工作。</span></p><p><span class=\"bjh-p\">就“完善“健康码”管理，便利老年人通行”，《通知》要求，在新冠肺炎疫情低风险地区，除机场、铁路车站、长途客运站、码头和出入境口岸等特殊场所外，一般不用查验“健康码”。对需查验“健康码”的情形，通过技术手段将疫情防控相关信息自动整合到“健康码”，简化操作以适合老年人使用，优化代办代查等服务，继续推行“健康码”全国互通互认，便利老年人跨省通行。各地不得将“健康码”作为人员通行的唯一凭证，对老年人等群体可采取凭有效身份证件登记、持纸质证明通行、出示“通信行程卡”作为辅助行程证明等替代措施。有条件的地区和场所要为不使用智能手机的老年人设立“无健康码通道”，做好服务引导和健康核验。在充分保障个人信息安全前提下，推进“健康码”与身份证、社保卡、老年卡、市民卡等互相关联，逐步实现“刷卡”或“刷脸”通行。对因“健康码”管理不当造成恶劣影响的，根据有关规定追究相关单位负责人的责任。</span></p><p><span class=\"bjh-p\">《通知》提出，便利老年人日常交通出行。包括：优化老年人打车出行服务，便利老年人乘坐公共交通及提高客运场站人工服务质量。</span></p><p><span class=\"bjh-p\">《通知》提出，便利老年人日常就医。其一是提供多渠道挂号等就诊服务。医疗机构、相关企业要完善电话、网络、现场等多种预约挂号方式，畅通家人、亲友、家庭签约医生等代老年人预约挂号的渠道。医疗机构应提供一定比例的现场号源，保留挂号、缴费、打印检验报告等人工服务窗口，配备导医、志愿者、社会工作者等人员，为老年人提供就医指导服务。</span></p><p><span class=\"bjh-p\">其二是优化老年人网上办理就医服务。简化网上办理就医服务流程，为老年人提供语音引导、人工咨询等服务，逐步实现网上就医服务与医疗机构自助挂号、取号叫号、缴费、打印检验报告、取药等智能终端设备的信息联通，促进线上线下服务结合。推动通过身份证、社保卡、医保电子凭证等多介质办理就医服务，鼓励在就医场景中应用人脸识别等技术。</span></p><p><span class=\"bjh-p\">其三是完善老年人日常健康管理服务。搭建社区、家庭健康服务平台，由家庭签约医生、家人和有关市场主体等共同帮助老年人获得健康监测、咨询指导、药品配送等服务，满足居家老年人的健康需求。推进“互联网+医疗健康”，提供老年人常见病、慢性病复诊以及随访管理等服务。</span></p><p><span class=\"bjh-p\">《通知》还提出，便利老年人日常消费。一是保留传统金融服务方式。<span class=\"bjh-strong\">任何单位和个人不得以格式条款、通知、声明、告示等方式拒收现金。</span>要改善服务人员的面对面服务，零售、餐饮、商场、公园等老年人高频消费场所，水电气费等基本公共服务费用、行政事业性费用缴纳，应支持现金和银行卡支付。强化支付市场监管，加大对拒收现金、拒绝银行卡支付等歧视行为的整改整治力度。采用无人销售方式经营的场所应以适当方式满足消费者现金支付需求，提供现金支付渠道或转换手段。</span></p><p><span class=\"bjh-p\">二是提升网络消费便利化水平。完善金融科技标准规则体系，推动金融机构、非银行支付机构、网络购物平台等优化用户注册、银行卡绑定和支付流程，打造大字版、语音版、民族语言版、简洁版等适老手机银行APP，提升手机银行产品的易用性和安全性，便利老年人进行网上购物、订餐、家政、生活缴费等日常消费。平台企业要提供技术措施，保障老年人网上支付安全。</span></p><p><span class=\"bjh-p\">此外，《通知》提出，便利老年人文体活动、便利老年人办事服务及便利老年人使用智能化产品和服务应用。《通知》要求，扩大适老化智能终端产品供给。推动手机等智能终端产品适老化改造，使其具备大屏幕、大字体、大音量、大电池容量、操作简单等更多方便老年人使用的特点。积极开发智能辅具、智能家居和健康监测、养老照护等智能化终端产品。发布智慧健康养老产品及服务推广目录，开展应用试点示范，按照适老化要求推动智能终端持续优化升级。建设智慧健康养老终端设备的标准及检测公共服务平台，提升适老产品设计、研发、检测、认证能力。</span></p><p><span class=\"bjh-p\">《通知》还明确五项保障措施，一是健全工作机制，二是完善法规规范，三是加强督促落实，四是保障信息安全，五是开展普及宣传。(中新经纬APP)</span></p>', '0', '0', '', '', '', '1', '0', '0', null, null, '中新经纬', '1606232715');
INSERT INTO `news` VALUES ('25', '拜登新团队成员的对华态度，基本都在这儿了', '<p><span class=\"bjh-p\"><span class=\"bjh-strong\">参考消息网11月24日报道</span>当地时间23日，拜登公布了一系列内阁成员名单。他们的对华态度怎样？从他们的过去言论或一些媒体报道中或可看出端倪。</span></p><p><span class=\"bjh-p\">拟任国务卿安东尼·布林肯（Antony Blinken）</span></p><p><span class=\"bjh-p\">安东尼·布林肯曾在奥巴马时期担任副国务卿，《纽约时报》将他形容为“全球联盟的捍卫者”，并称“在这项工作中，他将试图把持怀疑态度的国际伙伴联合起来，与中国展开新的竞争”。据悉，在今年7月举办的一个论坛上，他曾表示：“与其他国家合作，也可以在另一个重大外交挑战上带来额外的好处：通过推动贸易、技术投资和人权的多边努力与中国展开竞争，而不是迫使单个国家在两个超级大国的经济之间作选择。”另据气候变化新闻网（climatechangenews）报道，布林肯曾表示，与中国的关系既是“对抗性”和“竞争性”的，但也是“合作性”的，包括在气候变化、核不扩散和全球卫生等议题上。</span></p><p><span class=\"bjh-p\">拟任国家安全顾问杰克·沙利文（Jake Sullivan）</span></p><p><span class=\"bjh-p\">杰克·沙利文曾先后担任过拜登和希拉里·克林顿的顾问。据福克斯新闻网报道，沙利文曾在2017年的一次演讲中说：“我们需要走一条中间道路——一条通过开放、公平、基于规则的地区秩序鼓励中国崛起的道路。”沙利文还说，对华政策不仅仅需要双边关系，“还需要我们与该地区的联系，以创造一个更有利于中国崛起的和平和积极的环境”。沙利文认为，一个欣欣向荣的中国对全球经济有好处。《纽约时报》称，布林肯和沙利文处在民主党主流群体的中间位置，有意向对手——尤其是崛起中的中国——投射美国的力量，但也愿意在某些领域进行合作。</span></p><p><span class=\"bjh-p\">拟任财政部长珍妮特·耶伦（Janet Yellen）</span></p><p><span class=\"bjh-p\">珍妮特·耶伦曾担任美联储主席，预计将成为美国首位女财长。据美国有线电视新闻网（CNN）报道，她曾在今年1月份的论坛上就中美贸易议题表示：“中美贸易战尚未结束，尚未解决的技术紧张局势可能会分裂世界，并减缓人工智能和5G的发展。”她说：“如果两个经济超级大国无法找到共同点，技术进步的步伐可能会放慢，并使新的商业应用的推出变得复杂。世界甚至可能因技术而分裂成相互竞争的团体，使贸易复杂化，并使全球整合更加困难。”“在世界某个地方开发的技术需要并且能够在全世界应用，并成为技术创新更进一步的基础。”她当时还表示，“失去这些协同作用”将是非常不利的，“我希望我们不会走到那个地步。”</span></p><p><span class=\"bjh-p\">拟任总统气候问题特使约翰·克里（John Kerry）</span></p><p><span class=\"bjh-p\">约翰·克里曾担任奥巴马时期的国务卿，并指导了《巴黎协定》的谈判。据气候变化新闻网报道，克里对中国并不陌生。2014年，在其为期六天的亚洲之行中，他曾访问北京，以期推动中美在气候行动方面的合作。当时美国国务院一名高级官员说，克里认为，鉴于美国和中国是世界上最大的两个碳排放国，在这个问题上进行合作至关重要。时任美国国务院发言人说，克里对中国首都的访问凸显中美在气候变化和清洁能源方面合作的重要性。</span></p><p><span class=\"bjh-p\">拟任国土安全部长的亚历杭德罗·马约卡斯（Alejandro Mayorkas）</span></p><p><span class=\"bjh-p\">亚历杭德罗·马约卡斯是一名古巴裔美国人，曾任奥巴马时期国土安全部副部长。据美国全国广播公司（NBC）介绍，他曾在制定国家网络安全战略和保护方面发挥了重要作用，并曾牵头与以色列和中国展开网络安全协议谈判。</span></p><p><span class=\"bjh-p\">对于拜登新团队的对华政策，美国《政治报》称，拜登及其助手曾表示他们深知中美关系处于新的阶段，他们也坚持认为，即使过去4年由奥巴马执政，他们也会看到这种情况。</span></p>', '0', '0', '', '', '', '1', '0', '0', null, null, '参考消息', '1606232715');
INSERT INTO `news` VALUES ('26', '印度宣布禁用43款移动应用程序 包括阿里巴巴全球速卖通', '<p><span class=\"bjh-p\">来源：金融界网站</span></p><p><span class=\"bjh-p\">印度新闻局发声明称，印度电子和信息技术部发布命令，禁止访问43款移动应用程序。据悉，采取此举是因这些移动应用程序从事“有损于印度主权和完整、印度国防、国家安全和公共秩序的活动”。</span></p><p><span class=\"bjh-p\">被阻止访问的移动应用程序包括阿里卖家（AliSuppliers）、千牛工作台（Alibaba Workbench）、全球速卖通（AliExpress）和Alipay Cashier等。</span></p>', '0', '0', '', '', '', '1', '0', '0', null, null, '金融界', '1606232715');
INSERT INTO `news` VALUES ('27', '', '', '0', '0', '', '', '', '1', '0', '0', null, null, '', '1606232716');
INSERT INTO `news` VALUES ('28', '51岁高晓松一天瘦一斤？近照变化太大，曾自曝年轻时像吴亦凡', '<p><span class=\"bjh-p\">11月24日，高晓松在社交平台上晒出一组近照，自曝：&#34;26天减重26斤。完成第一阶段75kg以下的目标。&#34;一天瘦一斤的速度让很多网友感到惊讶，而高晓松的脸上的确少了很多赘肉。</span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics3.baidu.com/feed/50da81cb39dbb6fd4b6f233925a1081f972b3701.jpeg?token=e93072dd03daffe4737b738ad644ca42\" data-loaded=\"0\"/></div><p><span class=\"bjh-p\">不仅如此，当高晓松穿上浅色衬衫与黑色外套时，几乎看不到大肚腩的痕迹，侧脸下颚线轮廓也逐渐清晰，与以前相比的确是变化非常大。</span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics4.baidu.com/feed/2934349b033b5bb53b7780eb1a56763eb700bc94.jpeg?token=48009512aefe0886708c9f6cf88f98fc\" data-loaded=\"0\"/></div><p><span class=\"bjh-p\">其实高晓松的身高有有一米七八，骨架也比较大，因此他目前74.7kg也算是达到了标准体重的范围。瘦了26斤后，他似乎也有了自信，照片中满脸都是笑容，看起来非常开心。</span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics1.baidu.com/feed/91ef76c6a7efce1b87e758a184d450d9b58f651d.jpeg?token=05f5619fcb39600f95ebb9a85148cf78\" data-loaded=\"0\"/></div><p><span class=\"bjh-p\">而网友们在得知高晓松在短时间内瘦了26斤之后，都很想知道他的减肥秘籍。有人评论道：&#34;图三好像吴亦凡！&#34;还有人恭喜高晓松，称：&#34;要重回颜值巅峰了。&#34;也有人表示：&#34;人还是得瘦点，尤其是中年男人，不然太油腻了。&#34;</span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics2.baidu.com/feed/2f738bd4b31c8701e73378e20cfa3d280608ffbe.jpeg?token=ef508b3f2f692a237576b98494c44de2\" data-loaded=\"0\"/></div><p><span class=\"bjh-p\">其实这并不是网友们第一次调侃高晓松像吴亦凡了，在此之前，吴亦凡曾短暂发胖过，两人眉眼间的确有些相似。就连高晓松本人也曾说：&#34;我年轻的时候，跟吴亦凡非常像。&#34;</span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics2.baidu.com/feed/fcfaaf51f3deb48ff7e8dcb8dc9a992e2cf5785b.jpeg?token=7948a4a93e4d887cde4dda160bdc3201\" data-loaded=\"0\"/></div><p><span class=\"bjh-p\">当时很多人以为高晓松只是在说笑而已，没想到有网友做了高晓松年轻时旧照与吴亦凡的对比图之后，发现高晓松瘦的时候比现在帅很多，还自带忧郁气质，五官也很立体。</span></p><div class=\"img-container\"><img class=\"normal\" width=\"450px\" data-loadfunc=\"0\" src=\"https://pics4.baidu.com/feed/3ac79f3df8dcd10012808081590ee417b8122ffa.jpeg?token=e8e54d7da89d135bdaed6dcedd95efc0\" data-loaded=\"0\"/></div><p><span class=\"bjh-p\">就在两个月之前，高晓松在直播中发福很明显，不仅有双下巴，下颚线被赘肉遮盖得严严实实。而他幽默的提到了吴亦凡，称：&#34;虽然我年轻的时候长得真的很像吴亦凡，但是现在的我不是吴亦凡了。&#34;</span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics6.baidu.com/feed/38dbb6fd5266d016d2e598f7bbae770037fa35f9.jpeg?token=403c67704f2f71a94b516bc8a592d8c3\" data-loaded=\"0\"/></div><p><span class=\"bjh-p\">高晓松能在短时间内瘦26斤，的确是很难得的，不管怎样都希望他身体健康。</span></p>', '0', '0', '', '', '', '1', '0', '0', null, null, '猫眼娱乐', '1606232716');
INSERT INTO `news` VALUES ('29', '安倍涉嫌挪用50万元办赏樱宴 本人回应：全面配合调查', '<p><span class=\"bjh-p\">来源：海外网</span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics7.baidu.com/feed/58ee3d6d55fbb2fb8788f8ed748382a34423dcfb.jpeg?token=27434834d532ea733aa70285105fc239\" data-loaded=\"0\"/></div><p><span class=\"bjh-p bjh-text-align-center\">安倍在东京新宿御苑参加赏樱会（东方IC）</span></p><p><span class=\"bjh-p\"><span class=\"bjh-strong\">海外网11月24日电 </span>日本前首相安倍晋三涉嫌挪用公款一事，在日本持续引发舆论关注。东京地检署特搜部认为，安倍及其后援会或挪用约800万日元（约合50.4万人民币）的政治资金，用于“赏樱会”前夜举办宴会。24日中午，安倍接受记者团采访，对相关问题回应称会配合调查，其他“无可奉告”。</span></p><p><span class=\"bjh-p\">据日本富士电视台24日消息，安倍称，自己已知晓因资金问题而遭检方突击调查一事，“我将全面配合调查。除此以外，其他无可奉告。”有记者当面指出，他尚未对此事进行说明，安倍再次表示在现阶段无法多说，“我已经在国会上进行过答辩，现在正在接受相关调查，我会配合所有调查工作。”</span></p><p><span class=\"bjh-p\">据早前消息，2013年至2019年，安倍政府都会在“赏樱会”前夜举办被称为“前夜祭”的大型宴会，该宴会由一个名为“安倍晋三后援会”的政治团体负责。有消息人士透露，2015年至2019年，承办“前夜祭”的酒店共收到2300万日元的活动经费，但这5年，安倍及其后援会从参加者收取的参加费总额仅1400多万日元。东京地检署特搜部认为，约800万日元的资金缺口，可能是由安倍本人及其后援会进行了填补。</span></p><p><span class=\"bjh-p\">资金的具体来源，目前尚在调查之中。目前，特搜部正在对酒店方面和安倍及其后援会提供的资料进行分析，同时，还在对安倍前秘书及地方资金提供者等至少20人进行调查。</span></p><p><span class=\"bjh-p\">日本政府从1952年起在首都东京新宿御苑举办“赏樱会”，邀请社会各界代表与首相一起欣赏樱花，费用由政府承担。安倍执政期间，“赏樱会”预算大幅增加。（海外网 王珊宁）</span></p><p><span class=\"bjh-p\">本文系版权作品，未经授权严禁转载。海外视野，中国立场，浏览人民日报海外版官网——海外网www.haiwainet.cn或“海客”客户端，领先一步获取权威资讯。</span></p>', '0', '0', '', '', '', '1', '0', '0', null, null, '人民日报海外网', '1606232716');
INSERT INTO `news` VALUES ('30', '', '', '0', '0', '', '', '', '1', '0', '0', null, null, '', '1606232717');
INSERT INTO `news` VALUES ('31', '', '', '0', '0', '', '', '', '1', '0', '0', null, null, '', '1606232718');
INSERT INTO `news` VALUES ('32', '', '', '0', '0', '', '', '', '1', '0', '0', null, null, '', '1606232718');
INSERT INTO `news` VALUES ('33', '陈乔恩手机号被泄露 在线求网友支招：要换号吗？', '<p><span class=\"bjh-p\">来源：新浪娱乐</span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics0.baidu.com/feed/c75c10385343fbf2e7a7a8948042698764388f45.jpeg?token=407b020be28d83aece21d854eaf7ad15\" data-loaded=\"0\"/></div><p>陈乔恩手机号被泄露</p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics1.baidu.com/feed/b2de9c82d158ccbf25fb112c35e41f39b1354120.jpeg?token=7528d5805981f82157e76d7bb998accd\" data-loaded=\"0\"/></div><p>陈乔恩</p><p><span class=\"bjh-p\">新浪娱乐讯 11月24日，陈乔恩在社交平台上发文斥责自己的手机号被泄露，她说：“难得在台湾待着，有时候要处理事情，因为方便和信任就留了手机号码，结果现在动不动就会接到理财投资什么的打来，还问真的是我本人吗”。屡次接到骚扰电话，令陈乔恩心情变得很差：“恶心死了，有没有专业和职业道德啊，可怕的电话，让我一个下午的心情都差了！”。她也在线问网友该如何处理这个问题：“没有安全感真差，怎么办要换号码吗？”</span></p>', '0', '0', '', '', '', '1', '0', '0', null, null, '新浪娱乐', '1606232719');
INSERT INTO `news` VALUES ('34', '', '', '0', '0', '', '', '', '1', '0', '0', null, null, '', '1606232719');
INSERT INTO `news` VALUES ('35', '快手支付不远了？并购易联获支付牌照，此前曝已申请老铁支付商标', '<p><span class=\"bjh-p\">11月24日晚间消息，据支付百科报道，快手已经收购持牌支付机构易联支付，从而间接获得支付牌照。</span></p><p><span class=\"bjh-p\">报道称，知情人士透露，在收购方式上，快手是以现金+股票的形式进行对易联的并购，其中现金在3亿人民币左右，股票数额及价值不详。收购完成后快手将持有超过50%的股份，成为易联支付最大控股股东。此外，该知情人士还透露，目前双方已经在近期完成商业上的并购协议，并在调试支付接口，让双方的业务先运行起来。</span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics5.baidu.com/feed/b8014a90f603738d34006aa6c0771356f919ec64.jpeg?token=fce42a7a8f31543e44777230725ef960\" data-loaded=\"0\"/></div><p><span class=\"bjh-p\">另据媒体此前报道，快手通过旗下北京达佳互联信息技术有限公司，于8月31日申请了“老铁支付”商标。而在更早之前，快手还曾注册过“快手支付”的域名，并完成了相关的备案。今年6月份，快手还注册了名为“快手支付测试”的公众号。</span></p><p><span class=\"bjh-p\">天眼查App显示，易联支付有限公司成立于2005年，是国内大型非金融支付服务机构。2009年，公司拿到了PCI-DSS的国际认证；2011年，获中国人民银行颁发的《支付业务许可证》；2013年，获中国人民银行许可开展跨境人民币支付结算业务，并完成首笔支付机构跨境人民币支付交易；2014年，获基金销售支付结算业务许可，新增“互联网支付”业务。（文|AI财经社 林垚）</span></p>', '0', '0', '', '', '', '1', '0', '0', null, null, 'AI财经社', '1606232719');
INSERT INTO `news` VALUES ('36', '', '', '0', '0', '', '', '', '1', '0', '0', null, null, '', '1606232719');
INSERT INTO `news` VALUES ('37', '保胎药发成打胎药，合肥一医院出事了！', '<p><span class=\"bjh-p bjh-text-align-center\"><span class=\"bjh-strong\">原本进医院要保胎 </span></span></p><p><span class=\"bjh-p bjh-text-align-center\"><span class=\"bjh-strong\">没想到</span></span></p><p><span class=\"bjh-p bjh-text-align-center\"><span class=\"bjh-strong\">吃的竟是打胎药</span></span></p><p><span class=\"bjh-p bjh-text-align-center\">肥东一对夫妻</span></p><p><span class=\"bjh-p bjh-text-align-center\">就遇到了这样荒诞又气愤的事</span></p><p><span class=\"bjh-strong\">事情是这样的</span></p><p><span class=\"bjh-p\">11月4日，施先生陪同妻子程女士<span class=\"bjh-strong\">住进了肥东安贞医院保胎</span>。11月6日早上六点半左右，护士像往常一样给施先生的妻子量体温，并拿药给她吃，出于对护士的信任，施先生及其妻子程女士并没有多看多想，谁知服用过后等来的却是护士人员的一句<span class=\"bjh-strong\">“吃错药了”</span>。</span></p><p><span class=\"bjh-p\">打胎药被当成了保胎药服用，这两种截然相反药物让施先生认识到了问题的严重性，过了三个小时，施先生带着‘吃错药的’老婆赶往了肥东县人民医院洗胃，可洗胃的结果并不理想。</span></p><p><span class=\"bjh-p\">距离程女士吃错药已经过去半个多月了。施先生说，吃错药后的前几日医院还给做程女士做B超，而现在医护人员每天仅是量量体温和测血压，并催着他们出院，医院始终没有给出解决方案和具体答复。</span></p><p><span class=\"bjh-p\">施先生说妻子由于吃错药，精神上受到了一点刺激。<span class=\"bjh-strong\">“胎儿17周左右了，保胎药误食吃成了打胎药，胎儿不打算要了，现在只想医院给个相应说法和补偿。”</span>施先生表示。</span></p><p><span class=\"bjh-strong\">医院：</span></p><p><span class=\"bjh-strong\">医护人员工作失误所致</span></p><p><span class=\"bjh-p\"><span class=\"bjh-strong\">“保胎药却被送成了打胎药。”</span>肥东安贞医院妇产科负责人说，对此次医护人员严重的工作错误深表遗憾。</span></p><p><span class=\"bjh-p\">好端端的保胎药怎么会送成了打胎药呢？该院妇产科负责人表示，由于住院人员较多，住院的床位紧张，没有多余的床位腾出，医护人员就<span class=\"bjh-strong\">安排了打胎和保胎的患者住进同一个病房</span>。</span></p><p><span class=\"bjh-p\"><span class=\"bjh-strong\">被误食的打胎药是米非司酮，共3粒药</span>，11月6日发现送错药的护士及时向医院相关负责人汇报，医院医生也对患者进行过催吐、稀释等措施，出于无效，安贞医院的医护人员陪同了施先生及妻子程女士赶往了肥东县人民医院洗胃处理。</span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics0.baidu.com/feed/3b87e950352ac65c3238a22751db111693138a52.jpeg?token=d2fea722cd5afa251f658ea729fedd7f\" data-loaded=\"0\"/></div><p><span class=\"bjh-p bjh-text-align-center\"><span class=\"bjh-strong\">据百度百科</span></span></p><p><span class=\"bjh-p bjh-text-align-center\"><span class=\"bjh-strong\">米非司酮</span></span></p><p><span class=\"bjh-p bjh-text-align-center\"><span class=\"bjh-strong\">是一种口服堕胎药</span></span></p><p><span class=\"bjh-p bjh-text-align-center\">↓<span class=\"bjh-br\"></span></span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics5.baidu.com/feed/faf2b2119313b07e000c3425a4fe322497dd8c1f.jpeg?token=c9ad7958f422dbfa9f39a3222bc0b0b9\" data-loaded=\"0\"/></div><p><span class=\"bjh-p\"><span class=\"bjh-strong\">“医院前几天做了B超，从影像来看，胎儿整体状况良好。”</span>肥东县安贞医院妇产科负责人表示，  “施先生及其家属对于经济赔偿的数额稍高，医院这方还在和患者家属主动协调。”对于本次施先生的妻子程女士的住院、产检、乃至后面如果生孩子或者打胎，也都可以申请免去费用。</span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics7.baidu.com/feed/962bd40735fae6cd4d7dfc62a79aac2343a70f9c.jpeg?token=41e35d388ac2851db7c75ce90ca5b09b\" data-loaded=\"0\"/></div><p><span class=\"bjh-strong\">肥东卫健委：</span></p><p><span class=\"bjh-strong\">拿错药的护士已被停职</span></p><p><span class=\"bjh-p\">肥东县卫健委相关负责人表示，肥东卫健委对肥东安贞医院医护人员的工作错误给患者家属带来的问题高度重视，<span class=\"bjh-strong\">事发当日拿错药的护士已经被停职处理</span>。 “已经和患者家属、安贞医院相关负责人多次协调，目前患者家属施先生提出的高额赔偿金还没有和医院达成一致，还在继续协调中。”</span></p><p><span class=\"bjh-p\">若双方就赔偿问题难以达成一致，患者程女士及其家属可以走司法程序，对肥东安贞医院起诉。</span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics3.baidu.com/feed/3b87e950352ac65c4a76e94352db111693138a44.jpeg?token=4b0fcedea06fbfc5f89a6b87d835c865\" data-loaded=\"0\"/></div><p><span class=\"bjh-p bjh-text-align-center\"><span class=\"bjh-strong\">希望对职业和生命</span></span></p><p><span class=\"bjh-p bjh-text-align-center\"><span class=\"bjh-strong\">给予更多敬畏之心</span></span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics6.baidu.com/feed/9c16fdfaaf51f3de4b3e11a8c75e5218382979a2.jpeg?token=892556fd6c8ae19a142daab88416507b\" data-loaded=\"0\"/></div><p><span class=\"bjh-p bjh-text-align-right\">本期编辑：汪雯雯</span></p><p><span class=\"bjh-p bjh-text-align-right\">来源：江淮晨报<span class=\"bjh-br\"></span></span></p>', '0', '0', '', '', '', '1', '0', '0', null, null, '合肥在线', '1606232719');
INSERT INTO `news` VALUES ('38', '', '', '0', '0', '', '', '', '1', '0', '0', null, null, '', '1606232720');
INSERT INTO `news` VALUES ('39', '贴上就能信号满格？！这张安在你手机上的金属片，背后原来有猫腻→你中过招吗？', '<p><span class=\"bjh-p\"><span class=\"bjh-strong\">（央视财经《经济信息联播》）</span>最近一段时间，手机信号“增强贴”一度上了热搜，只要往手机后盖上一贴，据说就可以增强手机信号。别看它只是一张小小的金属片，号称无论在地下室还是电梯间，只要贴上它，手机信号瞬间满格。看上去似乎绝对是“手机党”的必备神器。可是，手机信号“增强贴”真的那么神奇吗？</span></p><p><span class=\"bjh-p\"><span class=\"bjh-strong\">01</span><span class=\"bjh-br\"></span></span></p><p><span class=\"bjh-p\"><span class=\"bjh-strong\">手机信号“增强贴”热销</span><span class=\"bjh-br\"></span></span></p><p><span class=\"bjh-p\"><span class=\"bjh-strong\">真是黑科技产品？</span></span></p><div class=\"img-container video-container\" data-rid=\"mda-kknzuct92vkcwc25\" data-showlog=\"tid:950;cst:1;ct:2;logInfo:main_video;\" data-extralog=\"rid:9756262072534941805;vid:mda-kknzuct92vkcwc25;\"><video style=\"display:block; height:100%;\" class=\"video-player\" x-webkit-airplay=\"allow\" preload=\"none\" poster=\"https://pic.rmb.bdstatic.com/bjh/news/95f8e168fc3baf796be34193967e7121.jpeg\" src=\"https://vd3.bdstatic.com/mda-kknzuct92vkcwc25/mda-kknzuct92vkcwc25.mp4?playlist=%5B%22hd%22%2C%22sc%22%5D\"></video><div class=\"video-icon no-length-icon\"></div><div class=\"video-time-length\">01:35</div></div><p><span class=\"bjh-p\">△央视财经《经济信息联播》栏目视频</span></p><p><span class=\"bjh-p\">记者调查发现，所谓黑科技产品的手机信号“增强贴”售价其实并不高，贵的几十元，最便宜的甚至还不到两元，更有不少商家进行着“买一送一”的促销活动。而产品版本更是五花八门，从8代、9代，一直到第26代，更新换代特别快，想买哪代买哪代。</span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics7.baidu.com/feed/48540923dd54564e718921169d823e85d0584f91.jpeg?token=d1c540d8873760a93cfc975bde264d9e\" data-loaded=\"0\"/></div><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics4.baidu.com/feed/ac345982b2b7d0a2338a6edffbb3d40e4a369a90.jpeg?token=17a3daf1b416d7b192bf38bd6e96beb1\" data-loaded=\"0\"/></div><p><span class=\"bjh-p\">比如这款所谓的“最新18代”信号增强贴，号称采用“双芯片”加粗天线，所有手机都能用，安装前没有信号，安装后一秒爆满；<span class=\"bjh-strong\">为信号而生，可将信号提速80%，</span>并且还低辐射。再加上清一色的买家好评，真是让人想不动心都难。<span class=\"bjh-br\"></span></span></p><p><span class=\"bjh-p\"><span class=\"bjh-strong\">02</span></span></p><p><span class=\"bjh-p\"><span class=\"bjh-strong\">测试结果：“增强贴”对手机信号无改善作用</span><span class=\"bjh-br\"></span></span></p><div class=\"img-container video-container\" data-rid=\"mda-kknzuap3v22172rt\" data-showlog=\"tid:950;cst:1;ct:2;logInfo:main_video;\" data-extralog=\"rid:9756262072534941805;vid:mda-kknzuap3v22172rt;\"><video style=\"display:block; height:100%;\" class=\"video-player\" x-webkit-airplay=\"allow\" preload=\"none\" poster=\"https://pic.rmb.bdstatic.com/bjh/news/424892eb632b0f915eae66c74ecbab84.jpeg\" src=\"https://vd3.bdstatic.com/mda-kknzuap3v22172rt/mda-kknzuap3v22172rt.mp4?playlist=%5B%22hd%22%2C%22sc%22%5D\"></video><div class=\"video-icon no-length-icon\"></div><div class=\"video-time-length\">01:40</div></div><p><span class=\"bjh-p\">△央视财经《经济信息联播》栏目视频</span></p><p><span class=\"bjh-p\">为了测试手机信号“增强贴”的效果，记者从三家网店，购买了价格分别为20元、30元和68元的三款手机信号增强贴，同时还准备了两部正规渠道购买的手机，将它们一起拿到中国信息通信研究院泰尔终端实验室进行对比试验。<span class=\"bjh-br\"></span></span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics5.baidu.com/feed/58ee3d6d55fbb2fb8cc7fe0e7d1682a34723dca6.jpeg?token=094ceec6d434905f6fdb905f106d3de1\" data-loaded=\"0\"/></div><p><span class=\"bjh-p\">实验室中，专家分别对不同价位的手机信号“增强贴”，进行了共四次比对试验。专家调出总辐射功率的测试数据，显示四组数据基本一致。<span class=\"bjh-strong\">也就是说，手机信号贴对手机信号无任何改善作用。</span></span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics3.baidu.com/feed/54fbb2fb43166d221fc835f8777fabf09152d286.jpeg?token=21e8836fdafd08ca98b8af328ea4856b\" data-loaded=\"0\"/></div><p><span class=\"bjh-p\">专家介绍，<span class=\"bjh-strong\">影响手机信号的第一因素是各大运营商设立的信号基站，基站远近、人流密度都会影响到信号强弱。而另一大影响因素就是手机天线。</span></span></p><p><span class=\"bjh-p\">由此可见，<span class=\"bjh-strong\">任何所谓增强手机信号的窍门或产品都是没有意义的</span>，因为手机在设计和进网检测时已经对通讯性能做了全面的考虑和评估。<span class=\"bjh-strong\">所谓的手机信号“增强贴”，既无电力驱动，也没有和手机内置天线连接，想隔空增加信号当然是不可能的。</span></span></p><p><span class=\"bjh-p\"><span class=\"bjh-strong\">转载请注明央视财经</span></span></p><p><span class=\"bjh-p bjh-text-align-right\"><span class=\"bjh-strong\">（编辑 张彩红）</span></span></p>', '0', '0', '', '', '', '1', '0', '0', null, null, '央视财经', '1606232720');
INSERT INTO `news` VALUES ('40', '', '', '0', '0', '', '', '', '1', '0', '0', null, null, '', '1606232721');
INSERT INTO `news` VALUES ('41', '密歇根州竞选委员会确认：拜登击败特朗普', '<div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics3.baidu.com/feed/314e251f95cad1c86a697beae784c50ecb3d516b.png?token=2d6576d548e459fba760cfec50108c55\" data-loaded=\"0\"/></div><p><span class=\"bjh-p\">【环球网快讯】美国《国会山报》刚刚消息，当地时间23日，密歇根州竞选委员会确认了该州的选举结果，乔·拜登在总统竞选中击败特朗普。报道称，这是“对特朗普的又一次打击。”</span></p>', '0', '0', '', '', '', '1', '0', '0', null, null, '环球网', '1606232721');
INSERT INTO `news` VALUES ('42', '辽宁自来水可燃，因混入天然气！官方深夜通报、启动问责', '<p><span class=\"bjh-p\">21日</span></p><p><span class=\"bjh-p\">辽宁盘锦一村民家中</span></p><p><span class=\"bjh-p\">“自来水可被点燃”</span></p><p><span class=\"bjh-p\">这一匪夷所思的事情</span></p><p><span class=\"bjh-p\">引发舆论关注</span></p><p><span class=\"bjh-p\">当地随即成立调查组介入</span></p><p><span class=\"bjh-p\">24日凌晨</span></p><p><span class=\"bjh-p\">盘锦市大洼区委宣传部</span></p><p><span class=\"bjh-p\">通报了调查结果</span></p><div class=\"img-container\"><img class=\"normal\" width=\"270px\" data-loadfunc=\"0\" src=\"https://tukuimg.bdstatic.com/scrop/93342f1861e9796df37f340d3127d203.gif\" data-loaded=\"0\"/></div><p><span class=\"bjh-p\">自来水可燃，成因何在？</span></p><p><span class=\"bjh-p\">通报称——</span></p><p><span class=\"bjh-p\">经过调查分析，专家认为，该居民所在的四营屯自来水源来自于深层地下水，<span class=\"bjh-strong\">因少量天然气串入水层，在采水过程中将天然气带到地面。</span></span></p><p><span class=\"bjh-p\">近期该区域自来水站的蓄水装置正在扩容改造，<span class=\"bjh-strong\">临时采取地下水直供方式，导致少量天然气进入自来水管网，造成可燃现象。</span></span></p><p><span class=\"bjh-p\">通报表示，目前，当地对全区自来水源进行全面排查，尚未发现其他区域存在此类问题。<span class=\"bjh-strong\">大洼区将对造成相关问题的有关部门及人员启动问责程序。</span></span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics6.baidu.com/feed/c9fcc3cec3fdfc03dfbf6ee9f1f82593a6c226ee.png?token=42e5dd13091d4fc01e6f506efc9c539f\" data-loaded=\"0\"/></div><p><span class=\"bjh-p\"><span class=\"bjh-strong\">此前报道</span></span></p><p><span class=\"bjh-p\">此前，辽宁盘锦大洼区赵圈河镇四营村村民文女士在家中拍摄的一段视频火上了微博热搜。</span></p><p><span class=\"bjh-p\">视频显示，她家的家用自来水可点燃。用打火机在水龙头下一打火，便有火焰瞬间冒出。</span></p><p><span class=\"bjh-p\">据文女士介绍，她家水龙头有时候打开后会有一些气体，而且洗手总感觉洗不干净，好像有一层油粘在手上，用打火机火焰靠近自来水会点燃。</span></p><p><span class=\"bjh-p\">这种现象已经困扰了文女士家3、4年时间了，村里也有100多户人家有类似的情况，具体原因不明。</span></p><p><span class=\"bjh-p\">去年夏天，文女士父亲找了自来水公司查明情况。自来水公司到现场并没有查明情况，却说这种情况会少收100多块钱的水费。</span></p><p><span class=\"bjh-p\">22日晚，大洼区委宣传部官方微信公众号“大洼宣传”发布“情况说明”称，接前述情况反映后，该区有关部门成立联合调查组，深入居民家中了解情况，并采取积极应对措施。</span></p><p><span class=\"bjh-p\"><span class=\"bjh-strong\">网友直呼后怕</span></span></p><p><span class=\"bjh-p\"><span class=\"bjh-strong\">群众健康安全岂容儿戏？</span></span></p><p><span class=\"bjh-p\">如今，真相终于水落石出，但是调查结果却让许多网友直呼“后怕”。</span></p><div class=\"img-container\"><img class=\"normal\" width=\"453px\" data-loadfunc=\"0\" src=\"https://pics4.baidu.com/feed/7a899e510fb30f24683a2ec2ec527344af4b0399.jpeg?token=1fb4b7725f863ff5dab83c40fb7821cb\" data-loaded=\"0\"/></div><div class=\"img-container\"><img class=\"normal\" width=\"383px\" data-loadfunc=\"0\" src=\"https://pics5.baidu.com/feed/a71ea8d3fd1f41342bf602f001d837cdd3c85e4d.jpeg?token=b0cc1868617aa27f0b4821de02a0ffed\" data-loaded=\"0\"/></div><div class=\"img-container\"><img class=\"normal\" width=\"462px\" data-loadfunc=\"0\" src=\"https://pics0.baidu.com/feed/574e9258d109b3debb686880e878ce86820a4c55.jpeg?token=646ad4becc036837bf6fc7480e5df22f\" data-loaded=\"0\"/></div><p><span class=\"bjh-p\">不少网友心有余悸地表示，天然气混入自来水，万一发生事故不堪设想。</span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics4.baidu.com/feed/faedab64034f78f0fd0b88005af6a852b2191c0a.png?token=1663d8c1dd7691d729355cac73049824\" data-loaded=\"0\"/></div><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics5.baidu.com/feed/4ec2d5628535e5ddcbaf060f520105e8cc1b62a9.jpeg?token=dc395c6cb775c994088dc8a9403daf94\" data-loaded=\"0\"/></div><p><span class=\"bjh-p\">依照村民所言，“自来水可燃”现象持续时间不短，问题却迟迟未得到解决。许多人呼吁，此事必须“彻查到底”、“调查清楚”。</span></p><div class=\"img-container\"><img class=\"normal\" width=\"442px\" data-loadfunc=\"0\" src=\"https://pics2.baidu.com/feed/c9fcc3cec3fdfc03f9bb4cc9f1f82593a6c226ca.jpeg?token=fefa1d74ee22653f1254671a91f67a5a\" data-loaded=\"0\"/></div><div class=\"img-container\"><img class=\"normal\" width=\"509px\" data-loadfunc=\"0\" src=\"https://pics4.baidu.com/feed/9213b07eca806538da4b5dcab31a0343af348291.jpeg?token=32087d84ff71b6802d01ddbc0c55d551\" data-loaded=\"0\"/></div><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics6.baidu.com/feed/b3119313b07eca80f7280364b5e435daa0448356.jpeg?token=e2544826f54c22d8e056c113d219c72c\" data-loaded=\"0\"/></div><p><span class=\"bjh-p\">“自来水可燃”的新闻，某种程度也“点燃”了大家的隐忧，这是正常的情绪反应。如果这些情绪得不到理性疏导，便可能滋生谣言，进而在当地或公共范围内，引发更大恐慌。</span></p><p><span class=\"bjh-p\">目前，当地除了积极介入，采取应对措施外，更需要通过全面客观地调查，还原事件真相。该问责要问责，该追究要追究，让调查过程公开透明，才能澄清人们诸多质疑。</span></p><p><span class=\"bjh-p\"><span class=\"bjh-strong\">群众生命健康安全无小事，容不得一点马虎儿戏！</span></span></p><p><span class=\"bjh-p\">北京日报（ID：Beijing_Daily）综合“大洼宣传”微信公众号、红星新闻、此前报道</span></p><p><span class=\"bjh-p\">来源  北京日报微信公号 | 记者 张力</span></p><p><span class=\"bjh-p\">编辑：张力</span></p><p><span class=\"bjh-p\">流程编辑 刘伟利</span></p>', '0', '0', '', '', '', '1', '0', '0', null, null, '北京日报客户端', '1606232721');
INSERT INTO `news` VALUES ('43', '快讯！拜登宣布国安及外交团队首批内阁成员名单，称“我们已没有时间可以浪费”', '<div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics7.baidu.com/feed/0df3d7ca7bcb0a467a4d219011cb54236a60af58.png?token=d683af07043010502cc7c92f09b53eab\" data-loaded=\"0\"/></div><p><span class=\"bjh-p\">【环球网快讯】据美国福克斯新闻刚刚消息，美国“当选总统”拜登23日宣布一系列内阁成员名单，其中提名安东尼·布林肯(Antony Blinken)担任国务卿，马约卡斯(Alejandro Mayorkas)担任美国国土安全部部长，艾薇儿·海恩斯(Avril Haines)担任情报总监，杰克·沙利文(Jack Sullivan)将担任白宫国家安全顾问，托马斯-格林菲尔德（LindaThomas-Greenfield）担任美国常驻联合国代表。</span></p><p><span class=\"bjh-p\">拜登还提名前国务卿约翰·克里(John Kerry)担任总统气候特使，并将进入国家安全委员会。福克斯称，这是国家安全委员会首次纳入致力于气候变化的官员，但克里的职位并非内阁职位。</span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics5.baidu.com/feed/e4dde71190ef76c6203e2a15e3be5ffdae516754.jpeg?token=13b70e4bea874d7cef374a97b0ed0545\" data-loaded=\"0\"/></div><p><span class=\"bjh-p\">另据《华尔街日报》援引知情人士消息称，拜登计划提名美联储前主席珍妮特·耶伦(Janet Yellen)担任美国财政部长。</span></p><p><span class=\"bjh-p\">拜登在提名声明中称，“在国家安全和外交政策方面，我们已没有时间可以浪费。我需要一支在我上任第一天就做足准备帮我们重新夺回美国关键席位的团队，他们要团结全世界来迎接我们所面临的最大挑战，推进我们的安全、繁荣和价值观。这是这个团队的关键。拜登说，“这些人既有创新精神又有想象力，而且经验丰富，经受过危机考验。”</span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics3.baidu.com/feed/279759ee3d6d55fbbd54448c108aed4d21a4dd3d.png?token=9001e87eec96b9115315abd71cadc5c0\" data-loaded=\"0\"/></div><p><span class=\"bjh-p\">《华盛顿邮报》23日报道称，现年58岁的布林肯被称为“温和的中间派”。他与拜登的渊源可以追溯到近20年前两人在参议院外交关系委员会共事时期。自那时起，布林肯就一直是拜登在外交事务上的臂膀。2009年，拜登任副总统后，布林肯成为拜登的国家安全事务顾问。其间，他每天和拜登一起参加奥巴马的情报简报会，成为直接影响美国最高决策层的人。2013年，奥巴马连任成功后，布林肯获任总统国家安全事务副助理。2014年，布林肯再被提拔，担任常务副国务卿。</span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics1.baidu.com/feed/ca1349540923dd54e47847f2a8a111d99d824855.png?token=4e380263f28e9e168f99e086f982d22d\" data-loaded=\"0\"/></div><p><span class=\"bjh-p\">福克斯新闻称，马约卡斯是首位被提名担任国土安全部部长的拉美裔移民。2009年至2013年担任美国公民及移民局局长。2013年至2016年他曾在奥巴马政府中担任国土安全部副部长。</span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics3.baidu.com/feed/0bd162d9f2d3572c069c5ec1fdbbc12063d0c3e5.png?token=5715279eed42fdb4067b12e5f4e5b8a7\" data-loaded=\"0\"/></div><p><span class=\"bjh-p\">而海恩斯曾在奥巴马政府中担任副国家安全顾问和中央情报局副局长。福克斯称，如果任命最终确认，她将成为首位担任国家情报总监的的女性。</span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics6.baidu.com/feed/35a85edf8db1cb13442173d7abfcf44990584bdd.jpeg?token=d77c062219a955343cb711b9d71f0755\" data-loaded=\"0\"/></div><p><span class=\"bjh-p\">沙利文曾在奥巴马政府中担任副总统拜登的国家安全顾问。“当选总统拜登教会我如何在政府高层保卫我们的国家安全，现在，他让我担任他的国家安全顾问。在任职期间，我将尽我所能保护我们国家的安全。”沙利文23日在推特上写道。</span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics4.baidu.com/feed/b2de9c82d158ccbf9084131961701e39b135410d.png?token=dcf480ee1d780111cc73178f77286be8\" data-loaded=\"0\"/></div><p><span class=\"bjh-p\">美国Axios新闻网报道称，拜登提名现年68岁的资深外交官托马斯-格林菲尔德出任美国常驻联合国代表，将有助于拜登兑现其建立多元化政府的承诺。</span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics6.baidu.com/feed/503d269759ee3d6dfacfdf3f35becf254e4ade6d.jpeg?token=6fabead73e5853ab38514dc3790c0598\" data-loaded=\"0\"/></div><p><span class=\"bjh-p\">克里曾在2013年至2017年担任奥巴马政府国务卿。“美国很快就会有一个将气候危机视为国家安全威胁的政府，我很荣幸能与当选总统，我们的盟友以及气候运动的年轻领袖们合作，作为总统气候特使来应对这场危机。”克里在推特上这样说。</span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics1.baidu.com/feed/37d12f2eb9389b50b36ebbfdfd9d47dae6116e38.jpeg?token=171c7badc69dfa7c2bf2e1c72d68ae7b\" data-loaded=\"0\"/></div><p><span class=\"bjh-p\">拜登23日在推特上称，“今天，我宣布了我的国家安全和外交政策团队的首批成员。他们将团结全世界来应对我们所面临的这些挑战——这是任何一个国家都无法单独应对的挑战。”拜登称，“是时候恢复美国的领导地位了。我相信这个团队可以做到。”</span></p>', '0', '0', '', '', '', '1', '0', '0', null, null, '环球网', '1606232721');
INSERT INTO `news` VALUES ('44', '石家庄警方回应“交警殴打市民”事件：成立调查组 登门道歉', '<div class=\"img-container\"><img class=\"normal\" width=\"270px\" data-loadfunc=\"0\" src=\"https://pics7.baidu.com/feed/43a7d933c895d143f55211d0423620055baf076e.jpeg?token=441122cd9ca05a7481b8f32bc28e9b9e\" data-loaded=\"0\"/></div><p><span class=\"bjh-p\">图为警方通报网络截图</span></p><p><span class=\"bjh-p\">23日，石家庄市公安局交通管理局针对网传“石家庄市交警殴打市民”一事发布通报称，已成立调查组，同时与当事人联系沟通，登门道歉，取得了当事人的谅解。</span></p><p><span class=\"bjh-p\">据通报，11月20日晚18时许，石家庄市长安交警大队工作人员在中山路与青园街交口执勤时，发现刘某某驾驶电动车在路口西侧人行横道由南向北逆向骑行。在纠正其交通违法行为时，当事人拒不服从管理，并扬言不要车子了，随后弃车而去。当看到执勤工作人员推走其电动车时，刘某某快速返回，骑到电动车上要强行将车骑走。执勤工作人员多次对其行为进行制止，刘某某不听劝阻，阻碍执勤工作人员执行职务。在争执中，一名工作人员情绪失控，用手打了当事人的面部。</span></p><p><span class=\"bjh-p\">通报称，事件发生后，石家庄市公安局交通管理局立即成立调查组对此事件展开调查。调查组经初步调查认为，虽然当事人刘某某交通违法在先，但该工作人员为制止当事人阻碍执行职务而动手打人的行为是错误的。目前，已对该名工作人员进行严厉批评，责令带班领导和该名工作人员在全体大会上作出深刻检查，并等待进一步处理结果。同时，积极与当事人联系沟通，主动登门道歉，取得了当事人的谅解。</span></p><p><span class=\"bjh-p\">石家庄市公安局交通管理局称，针对这一本不该发生的事件，石家庄公安交警将深入开展规范化执法教育活动，进一步强化全警法治意识，规范全警执法行为，努力提升整体履职能力。(李洋)</span></p>', '0', '0', '', '', '', '1', '0', '0', null, null, '新华网客户端', '1606232721');
INSERT INTO `news` VALUES ('45', '好消息！考辛斯选择加盟火箭，伤势还未痊愈，期待涅槃重生', '<div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics2.baidu.com/feed/7dd98d1001e939018f4c6ece2d34f6e034d196d0.jpeg?token=ac6e35f1856bd22173ee101d747962f9\" data-loaded=\"0\"/><span class=\"bjh-image-caption\">再见，湖人队</span></div><p><span class=\"bjh-p\">11月24日消息，过去的3天，NBA自由市场非常热闹，特别是今年夺冠的湖人队，连续完成多笔重磅签约。然而对于上赛季在湖人队效力的考辛斯，湖人队没有任何动作。如今，考辛斯已经找到了新东家，那就是休斯敦火箭队。</span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics7.baidu.com/feed/0823dd54564e92588218eaeeca5a735fcdbf4ee5.jpeg?token=b31d1c507e1f197d13ad1cc07afb68af\" data-loaded=\"0\"/><span class=\"bjh-image-caption\">恭喜考辛斯</span></div><p><span class=\"bjh-p\">自由市场开放之前，威少和哈登先后提交了交易申请，不过现在为止，不管是哈登还是威少的交易都没有成交，毕竟火箭队是不可能白白地送走他们的，火箭队想要换来足够的重建筹码，不管是篮网队、尼克斯、还是其他球队，到目前为止，给出的交易筹码，火箭队都不满意。</span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics1.baidu.com/feed/dcc451da81cb39db23561fbb86ceab23a91830ac.jpeg?token=445a83e0f20fb64d3643b49fac55c029\" data-loaded=\"0\"/><span class=\"bjh-image-caption\">终于找到工作了</span></div><p><span class=\"bjh-p\">对于火箭队来说，如今传来一个好消息，根据《竞技者》名记查拉尼亚的消息，火箭队已经签下了考辛斯，双方合同为期1年（没有完全保障），这意味着赛季期间火箭队有权利终止合同，至于合同的金额，双方都没有透露，不过应该是一份老将底薪合同，毕竟考辛斯的身体充满不确定性。</span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics5.baidu.com/feed/b999a9014c086e06637aa08e57d0d9f308d1cb01.jpeg?token=55ee5f2161aba8b4d7e149ee9d6b43c8\" data-loaded=\"0\"/><span class=\"bjh-image-caption\">考神加盟火箭队</span></div><p><span class=\"bjh-p\">自从拒绝国王队的顶薪合同前往鹈鹕队之后，考辛斯开始了职业生涯的噩梦，几乎每个赛季都受伤，上个赛季中途被湖人队裁掉。这种情况下，考辛斯甚至面临提前退役的窘境。不过，考辛斯没有放弃，一直在积极地准备复出，虽然和火箭队的合同只有1年+没有保障，不过对于考辛斯来说，找到工作就是好消息，起码他有了重新证明自己的机会。只要留在场上，他就有机会。</span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics1.baidu.com/feed/8b13632762d0f703941792905c22f33a2797c530.jpeg?token=16bed2925d06adea8f7cd4aef9ce553b\" data-loaded=\"0\"/><span class=\"bjh-image-caption\">曾经的称霸联盟内线</span></div><p><span class=\"bjh-p\">前几天，有消息称，湖人队想要用一份老将底薪合同拿下考辛斯，这样一来，湖人队的阵容就接近完美。不过双方为何没能完成签约，外界不得而知。根据名记海恩斯的消息，考辛斯在火箭队完成了试训，状态非常不错，同时考辛斯非常渴望回到球场，考辛斯的态度最终打动了火箭队。</span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics7.baidu.com/feed/95eef01f3a292df5202378a1e8e9fe6736a87386.jpeg?token=eb261b431687c58dd0f3c7c52b93215a\" data-loaded=\"0\"/><span class=\"bjh-image-caption\">期待涅槃重生</span></div><p><span class=\"bjh-p\">其实，考辛斯现在身上还有伤，旧伤还未痊愈。新赛季将会在12月底开赛，考辛斯还需要1-2个月的时间恢复，所以他会缺席开赛后的部分比赛。现在湖人队内线已经有了哈雷尔、小加和浓眉哥，然而火箭队没有一个像样的内线，如果考辛斯能够恢复健康，他在火箭队能获得更多的机会。很多球迷都在期待考神能涅槃重生。<span class=\"bjh-a\" data-bjh-src=\"https://m.baidu.com/s?word=%23%E8%80%83%E8%BE%9B%E6%96%AF%23&amp;topic_id=159192418828331883&amp;sa=edit&amp;sfrom=1023524a&amp;append=1&amp;newwindow=0&amp;upqrade=1\" data-bjh-type=\"topic\" data-bjh-id=\"159192418828331883\" data-bjh-cover=\"https://b0.bdstatic.com/ugc/servere1cf4035a65c3246799c4a18de3360ce.jpeg@w_267\">#考辛斯#</span></span></p>', '0', '0', '', '', '', '1', '0', '0', null, null, '篮球大部落', '1606232722');
INSERT INTO `news` VALUES ('46', '印尼74只珍稀鹦鹉被塞进塑料瓶走私', '<p><span class=\"bjh-p\">来源：中国新闻周刊</span></p><div class=\"img-container video-container\" data-rid=\"mda-kkpbt59dzdhtxqne\" data-showlog=\"tid:950;cst:1;ct:2;logInfo:main_video;\" data-extralog=\"rid:10061512489284443707;vid:mda-kkpbt59dzdhtxqne;\"><video style=\"display:block; height:100%;\" class=\"video-player\" x-webkit-airplay=\"allow\" preload=\"none\" poster=\"https://pic.rmb.bdstatic.com/bjh/news/a1f6000a4c1c95109d9bff48e8dc5942.jpeg\" src=\"https://vd3.bdstatic.com/mda-kkpbt59dzdhtxqne/mda-kkpbt59dzdhtxqne.mp4?playlist=%5B%22hd%22%2C%22sc%22%5D\"></video><div class=\"video-icon no-length-icon\"></div><div class=\"video-time-length\">00:57</div></div><p><span class=\"bjh-p\">【残忍！印尼74只珍稀鹦鹉被塞进塑料瓶走私】据BBC报道，当地时间11月19日，印尼警方破获一起鹦鹉走私案件。他们在一艘船上发现74只黑顶鹦鹉，每一只都被塞进塑料瓶中，其中有10只被发现时已死亡。图片显示，每个塑料瓶上扎有小洞，鹦鹉们在瓶中无法动弹。据悉，黑顶鹦鹉全世界的总数量仅有几万只。</span></p>', '0', '0', '', '', '', '1', '0', '0', null, null, '新浪财经', '1606232722');
INSERT INTO `news` VALUES ('47', '出殡日致9死车祸：一趟活儿赚一百元和一包烟的“抬棺爷爷”', '<div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics0.baidu.com/feed/7c1ed21b0ef41bd5a139681e236223cc38db3d35.jpeg?token=3cbaea9118471a83f1b0a28561fdf09b\" data-loaded=\"0\"/></div><p>事发现场被撞的大树 本文图均为澎湃新闻记者 段彦超 图“那个货车跑得跟射箭一样，都没眨巴眼，事故就出来了。加上出棺时放烟花放炮， ‘砰砰砰砰’，（根本）就摸不清啥情况。等反应过来，人都倒了。”事发次日，回忆起事故的惨烈，68岁的老杜仍禁不住打颤，说是别人和他换了抬棺位置，自己“捡回一条命”。</p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics2.baidu.com/feed/c75c10385343fbf29f058ca7c5c6688764388f4c.jpeg?token=071b28606f957793a2c8eb1644f96284\" data-loaded=\"0\"/></div><p>事发当天出殡的东家11月20日清晨5点，天还漆黑。河南省信阳市淮滨县张庄乡梧桐村，住在国道边、办白事的东家正式起棺，这是事先请阴阳师算的时辰。出殡队伍刚出院子，正左拐上国道，突然右后方一辆货车冲进左侧车道，撞进人群，窜出百十米才停下。<span class=\"bjh-p\">事故造成9死4伤，死者包含两名东家亲属和7名抬棺者。老杜说，右侧10名抬棺者，死了6个。他是4名幸存者之一，当时他们的脚还没跨上国道。</span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics3.baidu.com/feed/c9fcc3cec3fdfc0376d70239a6872593a6c226c0.jpeg?token=a263e97028f370c16e8afdc78ead104d\" data-loaded=\"0\"/></div><p>自称“捡回一条命”的幸存抬棺者老杜“就差一两米，就也要被车撞住。”老杜说。<span class=\"bjh-p\">11月22日，淮滨县官方人士告诉澎湃新闻（www.thepaper.cn），初步查明，事故主要原因是车辆超速、观察不周，操作不当。肇事司机谢某某不存在酒驾、醉驾、毒驾，其已因涉嫌交通肇事罪被警方刑拘，此外，货车挂靠的阜阳市的一家物流公司多人被控制。</span></p><p><span class=\"bjh-p\">淮滨人称抬棺者为“大工”，领头的为“杠头”。在当地，这是随着农村青壮年劳力纷纷外出打工，近十年才有的行当。抬棺者的年龄，基本在50岁以上，最大的70多岁。除抬棺外，“大工”们还需负责打坑和埋葬，所有活干下来，每人100元、一包烟。</span></p><p><span class=\"bjh-p\">有幸存抬棺者感到后怕，表示不再干了。也有抬棺者感叹，当地今年9月开始倡导殡葬改革，推行火化，通告不得将骨灰装棺再葬，这个行当，或将很快在当地消亡。</span></p><p><span class=\"bjh-p\"><span class=\"bjh-strong\">出殡日车祸</span></span></p><p><span class=\"bjh-p\">事发次日上午，幸存抬棺者老杜向澎湃新闻感叹：“现场太瘆人了。”</span></p><p><span class=\"bjh-p\">按当地习俗，死人要在天亮前出殡。墓坑的朝向、出殡的日期、时辰等，都要在事前请阴阳师根据生辰八字算好。而从家里起棺或出殡途中拐弯时，要放炮放烟花，寓意引领死者。</span></p><p><span class=\"bjh-p\">当天出殡的死者姓任，曾做过梧桐村小学几十年的校长。20日清晨5点，随着一声“起棺”，亲属开始痛哭，鞭炮烟花齐鸣。孝子和扶孝子的走在最前，跟着是棺材和抬棺者，后面是亲属。因为天还漆黑，有亲属拎灯，有抬棺者戴头灯，还有人打开手机手电筒照亮脚下路面。</span></p><p><span class=\"bjh-p\">因老人的坟在八里地外，按计划，抬棺者将棺材抬出院子，需装上停在国道边的灵车。事故就发生在送葬队伍刚出院子，正左拐上国道，棺材后半部分还没上国道时。</span></p><p><span class=\"bjh-p\">“那个车跑得跟箭一样。”老杜回忆说，自己啥都不知道，哐一声，人都倒了，“等迷瞪过了，就忙着找人。那场景太吓人，有人头骨被撞开，有人被撞到百米外。”</span></p><p><span class=\"bjh-p\">“杠头”老周在事故中身亡，他的父亲6点左右赶到现场。老周父亲看到，死伤者已被拉走，路边棺材是完整的，但灵车被撞得稀烂，空载的肇事货车停在百十米外，卡在两棵大树间，树干都被撞裂了。</span></p><p><span class=\"bjh-p\">据淮滨县官方通报，20日5时，淮滨县境内220国道张庄乡梧桐村路段，一辆皖KQ3062货车采取措施不当，驶到道路左侧，撞到出殡的送行人群，致2人当场死亡，送往医院途中和医院救治无效死亡7人，另有4人受伤正在医院救治。</span></p><p><span class=\"bjh-p\">“如果再晚半分钟，等出殡队伍都拐到国道上，后果更加不敢想象。”老杜说。</span></p><p><span class=\"bjh-p\">9名死者，包含7名抬棺者和2名出殡者亲属。一名是扶孝子的出殡者侄子，一名是出殡者堂哥，他们走在前面。当天共20名抬棺者，5人一组，分布棺材四角。老杜个子高、身体胖，不好弯腰，他准备抬前面，刚摸到竖担，位置被人占了。于是他到后面去，“杠头”老周又和他做了调换，他到了后面竖担的后头。老杜说，右侧10名抬棺者，上了国道的“杠头”老周及前面5人被撞死亡，还没上国道的4人两人受伤，他在最后面，没受伤。左侧抬棺者1人死亡，可能被横杆打的。</span></p><p><span class=\"bjh-p\">事发当晚，老杜配合警方做笔录时，还一直打颤。回到家，从不喝酒的他，喝了二两才睡着。老杜感叹，如果不换位，抬棺者中第一个被撞的就是他，自己“是捡回一条命”。</span></p><p><span class=\"bjh-p\"><span class=\"bjh-strong\">“抬棺爷爷”</span></span></p><p><span class=\"bjh-p\">76岁的余志甫接到通知，是20日清晨5点半左右。同村村民跑到他家，说他儿子余树明出事了，“被车怼坏了”。余志甫吓得晕了过去。</span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics6.baidu.com/feed/54fbb2fb43166d22721cc522329babf09152d259.jpeg?token=72feba37c891c85e26cd08d3fecba4e4\" data-loaded=\"0\"/></div><p>被撞死亡的余树明余树明52岁，是淮滨县谷堆乡杨湾村人，在事故中死亡。该村有两人在事故中死亡，两人受伤，都是抬棺者。一淮滨县殡葬业人士告诉澎湃新闻，抬棺队最早在县城出现，随着农村青壮年劳力纷纷外出打工，近十年也在乡村流行起来。人们称抬棺者为“大工”，领头的叫“杠头”。他们自己为吉利，将抬棺称为“抬花轿”。“大工”一般不固定，只要有“杠头”喊就去。最早，抬棺是十几块、一包烟，慢慢上涨到六十块、八十块，再到现在的一百块，加包烟。<span class=\"bjh-p\">抬棺者，基本都是“爷爷辈”，在50岁以上，最大的70多岁。</span></p><p><span class=\"bjh-p\">“他才52岁，在农村正能干，是家里的顶梁柱。没出去打工是因为走不开，上面有老父母和一直跟着这边生活、偏瘫的丈母娘，儿子在外打工，下面还有俩孙。”余树明亲属说。</span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics0.baidu.com/feed/8601a18b87d6277fbaa0daa45b80bd37e824fc38.jpeg?token=c5dfdf5078a4f55c44c93c7d22dbfd3e\" data-loaded=\"0\"/></div><p>余树明为家里盖起两座楼房，因为欠有外债，其中一座一直未装修。四年前，余树明花费五六十万，盖起两座小楼，因欠外债未还清，其中一座内部至今未装修。为何一次盖两座？亲属说，因为有两个孙子，余树明“想把孙子的心也操了”。<span class=\"bjh-p\">余树明种有四十亩地，两年前，他开始趁农闲时抬棺，因为活不稳定，每月差不多抬个十几次。没活时，他就跟别人放树，每天一二百元。事发前没多久，他还投资数万元买了台旋耕机，打算帮别人耕地赚钱。亲属说，每年余树明差不多能收入5万左右。</span></p><p><span class=\"bjh-p\">“一百块没挣着，人没了。”余树明亲属说。</span></p><p><span class=\"bjh-p\">一名业内人士介绍，淮滨当地棺材较大，有用拖拉机拉的，豪车运的，或纯人工抬的。（抬棺）最少要16人，一般二三十人。县城费用最低要六千，还有八千八，一万多的。乡村一般两千到四千。不只抬棺，还负责挖坑和埋葬。县城“杠头”利润比较高，乡村“杠头”一次也就赚三四百。</span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics4.baidu.com/feed/14ce36d3d539b600a0b5945b98e8972dc75cb727.jpeg?token=b409e6d75ad5a6fd32d698c05461e1bd\" data-loaded=\"0\"/></div><p>受伤的抬棺者杨传刚家，曾是贫困户。与余树明同村的杨传刚，在事故中受伤，目前正在医院观察。<span class=\"bjh-p\">“他后脑被打个包，身上有些疼。”杨传刚妻子说，事发时，丈夫被横杆打晕死过去，醒来看到余树明在他面前躺着，就喊“救救他救救他”，救护车说救不活了。等他爬起来，看许多人在喊，在找人，后来看到许多人躺在地上，“吓得一屁股又坐到地上”。</span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics6.baidu.com/feed/aa64034f78f0f73696bedf3a7ced111eeac4138c.jpeg?token=e1b0fe39a751b10b7e25a2fe717fe3b3\" data-loaded=\"0\"/></div><p>被撞身亡的“杠头”老周家，贴满外孙、外孙女得的奖状。死者“杠头”老周今年51岁，是张庄乡周空村的，他同村的亲老表也在事故中死亡。老周的父亲，是老一辈“杠头”，四年前，他身体不行了，老周才接了他的班。<span class=\"bjh-p\">因为漏雨，老周在两间旧平房上面，加盖了两间简易房。平房堂屋的两面墙上，贴满了奖状。家属介绍，老周只有两个女儿，奖状都是他从小带大的外孙、外孙女的。</span></p><p><span class=\"bjh-p\">今年国庆，老周的母亲去世，大女儿把他接过去住了一段，事发前一周才回家。</span></p><p><span class=\"bjh-p\">“事发前两天，父亲给我打电话，我还叮嘱他注意身体。”老周的二女儿哽咽着说。</span></p><p><span class=\"bjh-p\"><span class=\"bjh-strong\">将消失的“抬棺队”</span></span></p><p><span class=\"bjh-p\">事发次日中午，淮滨县下起小雨。澎湃新闻记者看到，事发地所处220国道路段为双向单车道，不时有货车经过。除被撞裂的大树，事故痕迹已经不在。</span></p><p><span class=\"bjh-p\">国道上，还有身穿反光背心的交通技术人员，在测绘事发路段。</span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics7.baidu.com/feed/aa64034f78f0f73697a8de2f7ced111eeac4138d.jpeg?token=a9ad20e26e83f02df91a3a0bdfd954b2\" data-loaded=\"0\"/></div><p>11月21日上午，事发现场，交通技术人员正在测绘。当地人传言，肇事司机拉了一夜砂，是疲劳驾驶。还有当地人指出，事发当天没有雾，但燃放烟花鞭炮会产生烟。对此，淮滨县官方人士向澎湃新闻介绍，肇事司机谢某某是当日清晨四点多出的门，准备去外县拉石子，事发时是空车。目前，其已因涉嫌交通肇事罪被刑拘，但案件仍在进一步调查，最终定性和涉嫌罪名，还要等待最终全面调查结果。<span class=\"bjh-p\">多名死者家属告诉澎湃新闻，事发后，乡、村干部到家里慰问，商谈的补偿标准是每名死者六七十万，补偿暂由当地政府设法垫付，将来再向相关方索赔。前述淮滨县官方人士介绍，截至22日中午，9名死者的遗体，已有6人的家属同意火葬。</span></p><p><span class=\"bjh-p\">“他也没想到会出现这样的情况，听说他在看守所一直哭。”11月22日，在淮滨县某安置小区，谢某某妻子告诉澎湃新闻，事发前一晚，丈夫曾告诉她早上四五点要干活，便早早睡了。但丈夫几点起的，自己没醒，不清楚。“小区有监控，你们可以去调。”</span></p><p><span class=\"bjh-p\">谢某某今年23岁，初中没有毕业，曾在北京学过厨师。原本，他是开大货车的，两三个月前，他将大货车卖掉，买了出事的这辆二手“前四后四”货车，平常主要拉砂石。</span></p><p><span class=\"bjh-p\">谢某某的女儿3岁，这两天，她哭着要“要爸爸”。谢某某妻子就骗女儿“爸爸出去打工了，给你挣钱花”。“她就说让爸爸给她买雪花糖、巧克力糖。”谢某某妻子说。</span></p><p><span class=\"bjh-p\">谢某某母亲说，自己早年离异，平时靠开三轮车拉客，每天挣个几十块。如果欠别人钱，娘俩可以慢慢还，但发生了这么大的事，自家肯定赔不起。不过，她表示，“孩子把别人撞坏了，咱痛苦，人家人都不在了，更痛苦。国家咋划责任咱咋认，咋判咱咋接受。”</span></p><p><span class=\"bjh-p\">事发当晚，担心死者家属找来闹事，谢家人吓得睡觉都开着灯。</span></p><p><span class=\"bjh-p\">“吓坏了，再也不干这个了。”在事故中躲过一劫的老杜说，以后，他还是准备老老实实做木工。另一名幸存抬棺者杨传刚的妻子则说，“以后我不叫他干了，这太危险太可怕了”，而且，“现在各乡公墓还没弄好，弄好就不让装棺下葬了，以后这个抬棺队就消失了。”</span></p><div class=\"img-container\"><img class=\"large\" data-loadfunc=\"0\" src=\"https://pics7.baidu.com/feed/8c1001e93901213f796fdc39275f94d62e2e9533.jpeg?token=030e10141b2044dfa46107d95b1bf8ad\" data-loaded=\"0\"/></div><p>刚投入使用不久的淮滨县殡仪馆澎湃新闻注意到，8月15日，淮滨县民政局公众号发布《关于推进移风易俗倡树文明殡葬新风的通告》规定，自9月1日零时起，县域内亡故人员除国家政策另有规定外，遗体一律实行火化。火化后，县乡殡葬服务机构免费提供安葬墓穴。<span class=\"bjh-p\">通告称，县乡两级公益性公墓正在建设，街道办辖区火化者在9月30日之前，其他乡镇12月31日之前，允许采取骨灰择地深埋、不留坟头或免费暂存县殡仪馆纪念堂等方式节地安葬，不得将骨灰装棺再葬。严禁制造、销售封建迷信丧葬用品、棺材及其他土葬用品。</span></p><p><span class=\"bjh-p\">对此，淮滨县委官方人士称，规定“不得”将骨灰装棺再葬而不是“严禁”，就是“因地制宜、循序渐进”工作原则的具体体现。“急于求成、搞一刀切，这方面案例和教训良多。”</span></p><p>(本文来自澎湃新闻，更多原创资讯请下载“澎湃新闻”APP)</p>', '0', '0', '', '', '', '1', '0', '0', null, null, '澎湃新闻', '1606232722');

-- ----------------------------
-- Table structure for node_role
-- ----------------------------
DROP TABLE IF EXISTS `node_role`;
CREATE TABLE `node_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` bigint(20) unsigned NOT NULL COMMENT '角色id',
  `node_id` bigint(20) unsigned NOT NULL COMMENT '节点id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `node_role_role_id_index` (`role_id`),
  KEY `node_role_node_id_index` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of node_role
-- ----------------------------

-- ----------------------------
-- Table structure for nodes
-- ----------------------------
DROP TABLE IF EXISTS `nodes`;
CREATE TABLE `nodes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '别名',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '路由',
  `pid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `class_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '类名',
  `sidebar` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否侧边栏导航',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nodes_name_unique` (`name`),
  KEY `nodes_sidebar_index` (`sidebar`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of nodes
-- ----------------------------
INSERT INTO `nodes` VALUES ('1', '控制台', '控制台', 'admin.dashboard', '0', 'ti-home', '1', '2019-09-04 12:50:22', '2019-09-04 12:50:22');
INSERT INTO `nodes` VALUES ('2', '管理', '管理', 'admin.manage', '0', 'ti-paint-bucket', '1', '2019-09-04 12:51:10', '2019-09-04 12:51:10');
INSERT INTO `nodes` VALUES ('3', '设置', '设置', 'admin.setting', '0', 'ti-user', '1', '2019-09-04 12:51:56', '2019-09-04 12:51:56');
INSERT INTO `nodes` VALUES ('4', '仪表盘', '仪表盘', 'admin.dashboard.index', '1', '', '1', '2019-09-04 12:55:29', '2019-09-04 12:55:29');
INSERT INTO `nodes` VALUES ('5', '我的资料', '我的资料', 'admin.dashboard.profile', '1', '', '1', '2019-09-04 12:56:54', '2019-09-04 12:56:54');
INSERT INTO `nodes` VALUES ('6', '修改密码', '修改密码', 'admin.dashboard.repass', '1', '', '1', '2019-09-04 12:57:22', '2019-09-04 12:57:22');
INSERT INTO `nodes` VALUES ('7', '文章列表', '文章', 'admin.post.index', '2', '', '1', '2019-09-04 13:02:03', '2019-09-04 13:02:03');
INSERT INTO `nodes` VALUES ('8', '分类列表', '分类', 'admin.category.index', '2', '', '1', '2019-09-04 13:03:13', '2019-09-04 13:03:13');
INSERT INTO `nodes` VALUES ('9', '用户列表', '用户', 'admin.user.index', '2', '', '1', '2019-09-04 13:04:04', '2019-09-04 13:04:04');
INSERT INTO `nodes` VALUES ('10', '角色列表', '角色', 'admin.role.index', '2', '', '1', '2019-09-04 13:04:42', '2019-09-04 13:04:42');
INSERT INTO `nodes` VALUES ('11', '节点列表', '节点', 'admin.node.index', '2', '', '1', '2019-09-04 13:05:25', '2019-09-04 13:05:25');
INSERT INTO `nodes` VALUES ('12', '评论列表', '评论', 'admin.comment.index', '2', '', '1', '2019-09-04 13:06:06', '2019-09-04 13:06:06');
INSERT INTO `nodes` VALUES ('13', '标签列表', '标签', 'admin.tag.index', '2', '', '1', '2019-09-04 13:06:34', '2019-09-04 13:06:34');
INSERT INTO `nodes` VALUES ('14', '页面列表', '页面', 'admin.page.index', '2', '', '1', '2019-09-04 13:07:17', '2019-09-04 13:07:17');
INSERT INTO `nodes` VALUES ('15', '链接列表', '链接', 'admin.link.index', '2', '', '1', '2019-09-04 13:07:45', '2019-09-04 13:07:45');
INSERT INTO `nodes` VALUES ('16', '全局', '全局', 'admin.setting.main', '3', '', '1', '2019-09-04 13:11:25', '2019-09-04 13:11:25');
INSERT INTO `nodes` VALUES ('17', '上传', '上传', 'admin.setting.upload', '3', '', '1', '2019-09-04 14:19:20', '2019-09-04 14:19:20');

-- ----------------------------
-- Table structure for notifications
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of notifications
-- ----------------------------

-- ----------------------------
-- Table structure for pages
-- ----------------------------
DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '别名',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `keyword` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '关键词',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '描述',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_alias_unique` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of pages
-- ----------------------------

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `category_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `keyword` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '关键词',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '描述',
  `thumb` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '缩略图',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览数',
  `replies` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `author` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '作者',
  `create_time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `posts_title_index` (`title`),
  KEY `posts_user_id_index` (`user_id`),
  KEY `posts_category_id_index` (`category_id`),
  KEY `posts_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES ('2', '测试', 'cc', '1', '1', '', '', '', '1', '0', '0', '2020-12-11 11:09:34', '2020-12-11 11:09:34', '', '0');

-- ----------------------------
-- Table structure for posts_copy
-- ----------------------------
DROP TABLE IF EXISTS `posts_copy`;
CREATE TABLE `posts_copy` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户id',
  `category_id` bigint(20) unsigned NOT NULL COMMENT '分类id',
  `keyword` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '关键词',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '描述',
  `thumb` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '缩略图',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览数',
  `replies` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `author` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '作者',
  PRIMARY KEY (`id`),
  KEY `posts_title_index` (`title`),
  KEY `posts_user_id_index` (`user_id`),
  KEY `posts_category_id_index` (`category_id`),
  KEY `posts_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of posts_copy
-- ----------------------------
INSERT INTO `posts_copy` VALUES ('1', '测试', '测试', '1', '1', '', '', '', '1', '0', '0', '2020-11-23 22:15:18', '2020-11-23 22:15:18', '');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `code` longtext,
  `price` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_products_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', '2020-11-24 22:18:05.287', '2020-11-24 22:18:05.320', '2020-11-24 22:18:05.320', 'F42', '200');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色描述',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roles_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', '创始人', '网站创始人', '2020-11-23 21:59:20', '2020-11-23 21:59:20');
INSERT INTO `roles` VALUES ('2', '注册用户', '网站注册用户', '2020-11-23 21:59:20', '2020-11-23 21:59:20');

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '键名',
  `value` varchar(1500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '键值',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'main' COMMENT '类别',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_name_unique` (`name`),
  KEY `settings_type_index` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES ('1', 'name', 'Lara博客系统', 'main', '2020-11-23 21:59:20', '2020-11-23 21:59:20');
INSERT INTO `settings` VALUES ('2', 'title', 'Lara博客系统', 'main', '2020-11-23 21:59:20', '2020-11-23 21:59:20');
INSERT INTO `settings` VALUES ('3', 'keyword', 'Lara,博客,Laravel,Laravel博客', 'main', '2020-11-23 21:59:20', '2020-11-23 21:59:20');
INSERT INTO `settings` VALUES ('4', 'description', '一款基于Laravel 6.x 开发的博客系统', 'main', '2020-11-23 21:59:20', '2020-11-23 21:59:20');
INSERT INTO `settings` VALUES ('5', 'status', '1', 'main', '2020-11-23 21:59:20', '2020-11-23 21:59:20');
INSERT INTO `settings` VALUES ('6', 'icp', '浙ICP备16000810号-2', 'main', '2020-11-23 21:59:20', '2020-11-23 21:59:20');
INSERT INTO `settings` VALUES ('7', 'code', '', 'main', '2020-11-23 21:59:20', '2020-11-23 21:59:20');
INSERT INTO `settings` VALUES ('8', 'upload_size', '2M', 'upload', '2020-11-23 21:59:20', '2020-11-23 21:59:20');
INSERT INTO `settings` VALUES ('9', 'upload_type', 'png,jpg,jpeg,gif', 'upload', '2020-11-23 21:59:20', '2020-11-23 21:59:20');

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标签名',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '搜索指数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tags_name_index` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tags
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮箱',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户简介',
  `notification_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '消息数',
  `activation_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '激活Token',
  `activated` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '激活状态',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '记住密码',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '显示状态',
  `role_id` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '角色id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_activated_index` (`activated`),
  KEY `users_status_index` (`status`),
  KEY `users_role_id_index` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin', 'admin@admin.com', '$2y$10$VLEqlP.XScTMQ4qdPxGsj.G8k/3kF5dKMzeXfOtmrz6Ft.vqlapEe', 'http://www.lara.com/uploads/images//avatar/202011/1606139924.jpg', '', '0', '', '1', null, '1', '1', '2020-11-23 21:59:20', '2020-12-11 11:05:32');
