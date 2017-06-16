/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : eparking

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-06-16 09:28:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for db_fhdb
-- ----------------------------
DROP TABLE IF EXISTS `db_fhdb`;
CREATE TABLE `db_fhdb` (
  `FHDB_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '操作用户',
  `BACKUP_TIME` varchar(32) DEFAULT NULL COMMENT '备份时间',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '表名',
  `SQLPATH` varchar(300) DEFAULT NULL COMMENT '存储位置',
  `TYPE` int(1) NOT NULL COMMENT '类型',
  `DBSIZE` varchar(10) DEFAULT NULL COMMENT '文件大小',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FHDB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of db_fhdb
-- ----------------------------
INSERT INTO `db_fhdb` VALUES ('9d9584cc964a4d1fb8bcbb697a9c802d', 'admin', '2017-04-25 16:15:02', '整库', 'e:/mysql_backup/20170425/eparking_20170425161501.sql', '1', '147.826', 'admin备份全库操作');

-- ----------------------------
-- Table structure for db_timingbackup
-- ----------------------------
DROP TABLE IF EXISTS `db_timingbackup`;
CREATE TABLE `db_timingbackup` (
  `TIMINGBACKUP_ID` varchar(100) NOT NULL,
  `JOBNAME` varchar(50) DEFAULT NULL COMMENT '任务名称',
  `CREATE_TIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '表名',
  `STATUS` int(1) NOT NULL COMMENT '类型',
  `FHTIME` varchar(30) DEFAULT NULL COMMENT '时间规则',
  `TIMEEXPLAIN` varchar(100) DEFAULT NULL COMMENT '规则说明',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TIMINGBACKUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of db_timingbackup
-- ----------------------------
INSERT INTO `db_timingbackup` VALUES ('8722c9d62711414b9f315a8cb495bbf5', 'all_455725', '2017-04-25 16:21:30', 'all', '2', '0 0 * ? 1 MON', '每年 1 月份的 每个星期一  每小时执行一次', '整个数据库的备份。');
INSERT INTO `db_timingbackup` VALUES ('bc4a788bc2ec40bdb1b7730131c26d42', 'sys_app_user_359515', '2016-04-12 17:24:05', 'sys_app_user', '2', '1/3 * * ? * *', '每个月的 每周 每天 每小时执行一次', 'ssss');
INSERT INTO `db_timingbackup` VALUES ('e6b2d7f52b4b4ba09fd37a9a952ab07a', 'all_229692', '2017-04-25 16:21:13', 'all', '2', '0 0 24 * * ?', '每个月的 每周 每天 24点时执行一次', '整个数据库的备份。');

-- ----------------------------
-- Table structure for ep_ap
-- ----------------------------
DROP TABLE IF EXISTS `ep_ap`;
CREATE TABLE `ep_ap` (
  `id` bigint(20) NOT NULL COMMENT '���ID',
  `floor_id` bigint(20) DEFAULT NULL COMMENT '�������',
  `state` int(11) DEFAULT NULL COMMENT '״̬',
  `apcode` varchar(20) NOT NULL COMMENT '�м���������',
  `operate_time` bigint(20) DEFAULT NULL COMMENT '����ʱ��',
  `type` int(11) DEFAULT NULL COMMENT '����������',
  `voltage` float DEFAULT NULL COMMENT '��ѹ',
  `beart_time` bigint(20) DEFAULT NULL COMMENT '����ʱ��',
  `sensor_info` bigint(20) DEFAULT NULL COMMENT '��������ϢID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ep_ap
-- ----------------------------
INSERT INTO `ep_ap` VALUES ('1', '2', '3', '4', '5', '6', '7', '8', '9');

-- ----------------------------
-- Table structure for ep_berth
-- ----------------------------
DROP TABLE IF EXISTS `ep_berth`;
CREATE TABLE `ep_berth` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '���',
  `cid` varchar(20) DEFAULT NULL COMMENT '��λ���',
  `state` int(11) DEFAULT NULL COMMENT '��λ״̬��0����1ռ��2�����',
  `qid` bigint(20) DEFAULT NULL COMMENT '��ά�������',
  `berthsec_id` bigint(20) DEFAULT NULL COMMENT '��λ�α��',
  `address` varchar(50) DEFAULT NULL COMMENT '��ַ',
  `longitude` double DEFAULT NULL COMMENT '����',
  `latitude` double DEFAULT NULL COMMENT 'γ��',
  `oper_time` bigint(20) DEFAULT NULL COMMENT '��¼ʱ��',
  `order_id` bigint(20) DEFAULT NULL COMMENT '�������',
  `sensor_id` bigint(20) DEFAULT NULL COMMENT '���������',
  `enter_time` bigint(20) DEFAULT NULL,
  `out_time` bigint(20) DEFAULT NULL,
  `floor_id` bigint(20) DEFAULT NULL,
  `parking_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ep_berth
-- ----------------------------
INSERT INTO `ep_berth` VALUES ('1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '1', '11', '12', '1', '1');
INSERT INTO `ep_berth` VALUES ('2', '2', '2', '2', '2', '2', '2', '2', '2', '3', '2', '34', '33', '1', '1');
INSERT INTO `ep_berth` VALUES ('3', '2', '1', '2', '3', '4', '5', '6', '6', '5', '3', '44', '44', '1', '1');
INSERT INTO `ep_berth` VALUES ('4', '2', '3', '2', '2', '3', '5', '6', '7', '8', '4', '5', '4', '1', '1');

-- ----------------------------
-- Table structure for ep_floor
-- ----------------------------
DROP TABLE IF EXISTS `ep_floor`;
CREATE TABLE `ep_floor` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '���',
  `name` varchar(20) NOT NULL COMMENT '����',
  `name_second` varchar(20) DEFAULT NULL COMMENT '���ƶ���',
  `parking_id` varchar(20) DEFAULT NULL COMMENT 'ͣ����ID',
  `grade` int(11) DEFAULT NULL COMMENT '��',
  `address` varchar(50) DEFAULT NULL COMMENT '��ַ',
  `longitude` double DEFAULT NULL COMMENT '����',
  `latitude` double DEFAULT NULL COMMENT 'γ��',
  `create_time` bigint(20) DEFAULT NULL COMMENT '����ʱ��',
  `plan` varchar(50) DEFAULT NULL COMMENT 'ƽ��ͼ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ep_floor
-- ----------------------------
INSERT INTO `ep_floor` VALUES ('1', '地面一层', '测试', '1', '1', '6', '7', '8', '9', '10');

-- ----------------------------
-- Table structure for ep_parking
-- ----------------------------
DROP TABLE IF EXISTS `ep_parking`;
CREATE TABLE `ep_parking` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '���',
  `name` varchar(20) DEFAULT NULL COMMENT '����',
  `name_second` varchar(20) DEFAULT NULL COMMENT '���ƶ���',
  `city` varchar(20) DEFAULT NULL COMMENT '�������',
  `city_code` int(11) DEFAULT NULL COMMENT '���б���',
  `address` varchar(50) DEFAULT NULL COMMENT '��ַ',
  `longitude` double DEFAULT NULL COMMENT '����',
  `latitude` double DEFAULT NULL COMMENT 'γ��',
  `create_time` bigint(20) DEFAULT NULL COMMENT '����ʱ��',
  `groupid` bigint(20) DEFAULT NULL COMMENT '��Ӫ��ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ep_parking
-- ----------------------------
INSERT INTO `ep_parking` VALUES ('1', '太湖花园二期', '测试', '无锡', '214000', '无锡市长江路120', '120.351545', '31.560925', '1493361024702', '1');

-- ----------------------------
-- Table structure for ep_sensor
-- ----------------------------
DROP TABLE IF EXISTS `ep_sensor`;
CREATE TABLE `ep_sensor` (
  `id` bigint(20) NOT NULL COMMENT '���ID',
  `code` varchar(20) NOT NULL COMMENT '����',
  `parking_id` bigint(20) NOT NULL,
  `state` int(11) DEFAULT NULL COMMENT '״̬',
  `name` varchar(100) DEFAULT NULL,
  `apid` bigint(20) DEFAULT NULL COMMENT '�м�����ID',
  `operate_time` bigint(20) DEFAULT NULL COMMENT '����ʱ��',
  `type` int(11) DEFAULT NULL COMMENT '����������',
  `battery` float DEFAULT NULL COMMENT '��ص�ѹ',
  `beart_time` bigint(20) DEFAULT NULL COMMENT '����ʱ��',
  `sensor_info` bigint(20) DEFAULT NULL COMMENT '��������ϢID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ep_sensor
-- ----------------------------
INSERT INTO `ep_sensor` VALUES ('1', '2', '1', '4', '1', '1', '7', '1', '9', '10', '1');
INSERT INTO `ep_sensor` VALUES ('2', '3', '1', '3', '2', '1', null, '1', null, null, '2');
INSERT INTO `ep_sensor` VALUES ('3', '4', '1', '5', '2', '1', null, null, null, null, '3');
INSERT INTO `ep_sensor` VALUES ('4', '4', '1', '6', '1', '1', '3', '4', '5', '6', '4');

-- ----------------------------
-- Table structure for ep_sensor_info
-- ----------------------------
DROP TABLE IF EXISTS `ep_sensor_info`;
CREATE TABLE `ep_sensor_info` (
  `id` bigint(20) NOT NULL,
  `code` varchar(20) DEFAULT NULL COMMENT '����',
  `type` int(11) DEFAULT NULL COMMENT '����',
  `state` int(11) DEFAULT NULL COMMENT '״̬',
  `sensor_id` bigint(20) DEFAULT NULL,
  `battery` float(10,2) DEFAULT NULL,
  `x0` int(11) DEFAULT NULL COMMENT 'X��ʼ',
  `y0` int(11) DEFAULT NULL COMMENT 'Y��ʼ',
  `z0` int(11) DEFAULT NULL COMMENT 'Z��ʼ',
  `x1` int(11) DEFAULT NULL COMMENT 'X��ǰ',
  `y1` int(11) DEFAULT NULL COMMENT 'Y��ǰ',
  `z1` int(11) DEFAULT NULL COMMENT 'Z��ǰ',
  `magnetism` float(10,2) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL COMMENT '����',
  `error` int(11) DEFAULT NULL COMMENT '����',
  `apsite_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ep_sensor_info
-- ----------------------------
INSERT INTO `ep_sensor_info` VALUES ('1', '2', '3', '4', '5', '6.00', '7', '8', '9', '10', '11', '12', '13.00', '14', '15', '1');

-- ----------------------------
-- Table structure for positionmodel
-- ----------------------------
DROP TABLE IF EXISTS `positionmodel`;
CREATE TABLE `positionmodel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `accuracy` float NOT NULL,
  `altitude` double NOT NULL,
  `bearing` float NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `saveTime` bigint(20) DEFAULT NULL,
  `speed` float NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_r5ns6ufetnr00f5d6tc4olso3` (`saveTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of positionmodel
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `authority` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_gd858w0p4kqrhkp0h71hdvp24` (`authority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_app_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_app_user`;
CREATE TABLE `sys_app_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `PHONE` varchar(100) DEFAULT NULL,
  `SFID` varchar(100) DEFAULT NULL,
  `START_TIME` varchar(100) DEFAULT NULL,
  `END_TIME` varchar(100) DEFAULT NULL,
  `YEARS` int(10) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_app_user
-- ----------------------------
INSERT INTO `sys_app_user` VALUES ('1e89e6504be349a68c025976b3ecc1d1', 'a1', '698d51a19d8a121ce581499d7b701668', '会员甲', '', '115b386ff04f4352b060dffcd2b5d1da', '', '', '1', '121', '1212', '1212', '2015-12-02', '2015-12-25', '2', '111', '313596790@qq.com');
INSERT INTO `sys_app_user` VALUES ('55d00299ec76448790e5f38da99b8ed6', 'dd', '698d51a19d8a121ce581499d7b701668', '1212', '', '1b67fc82ce89457a8347ae53e43a347e', '', '', '1', '1213', '213123', '213', '2016-03-30', '2016-03-31', '123', '1121', '213435345@qq.com');

-- ----------------------------
-- Table structure for sys_city_code
-- ----------------------------
DROP TABLE IF EXISTS `sys_city_code`;
CREATE TABLE `sys_city_code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `state` varchar(200) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `district` varchar(200) DEFAULT NULL,
  `city_code` varchar(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2877 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_city_code
-- ----------------------------
INSERT INTO `sys_city_code` VALUES ('1', '北京市', '北京市', '东城区', '110101', null);
INSERT INTO `sys_city_code` VALUES ('2', '北京市', '北京市', '西城区', '\r\n110102', null);
INSERT INTO `sys_city_code` VALUES ('3', '北京市', '北京市', '崇文区', '\r\n110103', null);
INSERT INTO `sys_city_code` VALUES ('4', '北京市', '北京市', '宣武区', '\r\n110104', null);
INSERT INTO `sys_city_code` VALUES ('5', '北京市', '北京市', '朝阳区', '\r\n110105', null);
INSERT INTO `sys_city_code` VALUES ('6', '北京市', '北京市', '丰台区', '\r\n110106', null);
INSERT INTO `sys_city_code` VALUES ('7', '北京市', '北京市', '石景山区', '\r\n110107', null);
INSERT INTO `sys_city_code` VALUES ('8', '北京市', '北京市', '海淀区', '\r\n110108', null);
INSERT INTO `sys_city_code` VALUES ('9', '北京市', '北京市', '门头沟区', '\r\n110109', null);
INSERT INTO `sys_city_code` VALUES ('10', '北京市', '北京市', '房山区', '\r\n110111', null);
INSERT INTO `sys_city_code` VALUES ('11', '北京市', '北京市', '通州区', '\r\n110112', null);
INSERT INTO `sys_city_code` VALUES ('12', '北京市', '北京市', '顺义区', '\r\n110113', null);
INSERT INTO `sys_city_code` VALUES ('13', '北京市', '北京市', '昌平区', '\r\n110114', null);
INSERT INTO `sys_city_code` VALUES ('14', '北京市', '北京市', '大兴区', '\r\n110115', null);
INSERT INTO `sys_city_code` VALUES ('15', '北京市', '北京市', '怀柔区', '\r\n110116', null);
INSERT INTO `sys_city_code` VALUES ('16', '北京市', '北京市', '平谷区', '\r\n110117', null);
INSERT INTO `sys_city_code` VALUES ('17', '北京市', '北京市', '密云县', '\r\n110228', null);
INSERT INTO `sys_city_code` VALUES ('18', '北京市', '北京市', '延庆县', '\r\n110229', null);
INSERT INTO `sys_city_code` VALUES ('19', '天津市', '天津市', '和平区', '\r\n120101', null);
INSERT INTO `sys_city_code` VALUES ('20', '天津市', '天津市', '河东区', '\r\n120102', null);
INSERT INTO `sys_city_code` VALUES ('21', '天津市', '天津市', '河西区', '\r\n120103', null);
INSERT INTO `sys_city_code` VALUES ('22', '天津市', '天津市', '南开区', '\r\n120104', null);
INSERT INTO `sys_city_code` VALUES ('23', '天津市', '天津市', '河北区', '\r\n120105', null);
INSERT INTO `sys_city_code` VALUES ('24', '天津市', '天津市', '红桥区', '\r\n120106', null);
INSERT INTO `sys_city_code` VALUES ('25', '天津市', '天津市', '塘沽区', '\r\n120107', null);
INSERT INTO `sys_city_code` VALUES ('26', '天津市', '天津市', '汉沽区', '\r\n120108', null);
INSERT INTO `sys_city_code` VALUES ('27', '天津市', '天津市', '大港区', '\r\n120109', null);
INSERT INTO `sys_city_code` VALUES ('28', '天津市', '天津市', '东丽区', '\r\n120110', null);
INSERT INTO `sys_city_code` VALUES ('29', '天津市', '天津市', '西青区', '\r\n120111', null);
INSERT INTO `sys_city_code` VALUES ('30', '天津市', '天津市', '津南区', '\r\n120112', null);
INSERT INTO `sys_city_code` VALUES ('31', '天津市', '天津市', '北辰区', '\r\n120113', null);
INSERT INTO `sys_city_code` VALUES ('32', '天津市', '天津市', '武清区', '\r\n120114', null);
INSERT INTO `sys_city_code` VALUES ('33', '天津市', '天津市', '宝坻区', '\r\n120115', null);
INSERT INTO `sys_city_code` VALUES ('34', '天津市', '天津市', '滨海新区', '\r\n120116', null);
INSERT INTO `sys_city_code` VALUES ('35', '天津市', '天津市', '宁河县', '\r\n120221', null);
INSERT INTO `sys_city_code` VALUES ('36', '天津市', '天津市', '静海县', '\r\n120223', null);
INSERT INTO `sys_city_code` VALUES ('37', '天津市', '天津市', '蓟县', '\r\n120225', null);
INSERT INTO `sys_city_code` VALUES ('38', '河北省', '石家庄市', '长安区', '\r\n130102', null);
INSERT INTO `sys_city_code` VALUES ('39', '河北省', '石家庄市', '桥东区', '\r\n130103', null);
INSERT INTO `sys_city_code` VALUES ('40', '河北省', '石家庄市', '桥西区', '\r\n130104', null);
INSERT INTO `sys_city_code` VALUES ('41', '河北省', '石家庄市', '新华区', '\r\n130105', null);
INSERT INTO `sys_city_code` VALUES ('42', '河北省', '石家庄市', '井陉矿区', '\r\n130107', null);
INSERT INTO `sys_city_code` VALUES ('43', '河北省', '石家庄市', '裕华区', '\r\n130108', null);
INSERT INTO `sys_city_code` VALUES ('44', '河北省', '石家庄市', '井陉县', '\r\n130121', null);
INSERT INTO `sys_city_code` VALUES ('45', '河北省', '石家庄市', '正定县', '\r\n130123', null);
INSERT INTO `sys_city_code` VALUES ('46', '河北省', '石家庄市', '栾城县', '\r\n130124', null);
INSERT INTO `sys_city_code` VALUES ('47', '河北省', '石家庄市', '行唐县', '\r\n130125', null);
INSERT INTO `sys_city_code` VALUES ('48', '河北省', '石家庄市', '灵寿县', '\r\n130126', null);
INSERT INTO `sys_city_code` VALUES ('49', '河北省', '石家庄市', '高邑县', '\r\n130127', null);
INSERT INTO `sys_city_code` VALUES ('50', '河北省', '石家庄市', '深泽县', '\r\n130128', null);
INSERT INTO `sys_city_code` VALUES ('51', '河北省', '石家庄市', '赞皇县', '\r\n130129', null);
INSERT INTO `sys_city_code` VALUES ('52', '河北省', '石家庄市', '无极县', '\r\n130130', null);
INSERT INTO `sys_city_code` VALUES ('53', '河北省', '石家庄市', '平山县', '\r\n130131', null);
INSERT INTO `sys_city_code` VALUES ('54', '河北省', '石家庄市', '元氏县', '\r\n130132', null);
INSERT INTO `sys_city_code` VALUES ('55', '河北省', '石家庄市', '赵县', '\r\n130133', null);
INSERT INTO `sys_city_code` VALUES ('56', '河北省', '石家庄市', '辛集市', '\r\n130181', null);
INSERT INTO `sys_city_code` VALUES ('57', '河北省', '石家庄市', '藁城市', '\r\n130182', null);
INSERT INTO `sys_city_code` VALUES ('58', '河北省', '石家庄市', '晋州市', '\r\n130183', null);
INSERT INTO `sys_city_code` VALUES ('59', '河北省', '石家庄市', '新乐市', '\r\n130184', null);
INSERT INTO `sys_city_code` VALUES ('60', '河北省', '石家庄市', '鹿泉市', '\r\n130185', null);
INSERT INTO `sys_city_code` VALUES ('61', '河北省', '唐山市', '路南区', '\r\n130202', null);
INSERT INTO `sys_city_code` VALUES ('62', '河北省', '唐山市', '路北区', '\r\n130203', null);
INSERT INTO `sys_city_code` VALUES ('63', '河北省', '唐山市', '古冶区', '\r\n130204', null);
INSERT INTO `sys_city_code` VALUES ('64', '河北省', '唐山市', '开平区', '\r\n130205', null);
INSERT INTO `sys_city_code` VALUES ('65', '河北省', '唐山市', '丰南区', '\r\n130207', null);
INSERT INTO `sys_city_code` VALUES ('66', '河北省', '唐山市', '丰润区', '\r\n130208', null);
INSERT INTO `sys_city_code` VALUES ('67', '河北省', '唐山市', '滦县', '\r\n130223', null);
INSERT INTO `sys_city_code` VALUES ('68', '河北省', '唐山市', '滦南县', '\r\n130224', null);
INSERT INTO `sys_city_code` VALUES ('69', '河北省', '唐山市', '乐亭县', '\r\n130225', null);
INSERT INTO `sys_city_code` VALUES ('70', '河北省', '唐山市', '迁西县', '\r\n130227', null);
INSERT INTO `sys_city_code` VALUES ('71', '河北省', '唐山市', '玉田县', '\r\n130229', null);
INSERT INTO `sys_city_code` VALUES ('72', '河北省', '唐山市', '唐海县', '\r\n130230', null);
INSERT INTO `sys_city_code` VALUES ('73', '河北省', '唐山市', '唐海县', '\r\n130281', null);
INSERT INTO `sys_city_code` VALUES ('74', '河北省', '唐山市', '迁安市', '\r\n130283', null);
INSERT INTO `sys_city_code` VALUES ('75', '河北省', '秦皇岛市', '海港区', '\r\n130302', null);
INSERT INTO `sys_city_code` VALUES ('76', '河北省', '秦皇岛市', '山海关区', '\r\n130303', null);
INSERT INTO `sys_city_code` VALUES ('77', '河北省', '秦皇岛市', '北戴河区', '\r\n130304', null);
INSERT INTO `sys_city_code` VALUES ('78', '河北省', '秦皇岛市', '青龙满族自治县', '\r\n130321', null);
INSERT INTO `sys_city_code` VALUES ('79', '河北省', '秦皇岛市', '昌黎县', '\r\n130322', null);
INSERT INTO `sys_city_code` VALUES ('80', '河北省', '秦皇岛市', '抚宁县', '\r\n130323', null);
INSERT INTO `sys_city_code` VALUES ('81', '河北省', '秦皇岛市', '卢龙县', '\r\n130324', null);
INSERT INTO `sys_city_code` VALUES ('82', '河北省', '邯郸市', '邯山区', '\r\n130402', null);
INSERT INTO `sys_city_code` VALUES ('83', '河北省', '邯郸市', '丛台区', '\r\n130403', null);
INSERT INTO `sys_city_code` VALUES ('84', '河北省', '邯郸市', '复兴区', '\r\n130404', null);
INSERT INTO `sys_city_code` VALUES ('85', '河北省', '邯郸市', '峰峰矿区', '\r\n130406', null);
INSERT INTO `sys_city_code` VALUES ('86', '河北省', '邯郸市', '邯郸县', '\r\n130421', null);
INSERT INTO `sys_city_code` VALUES ('87', '河北省', '邯郸市', '临漳县', '\r\n130423', null);
INSERT INTO `sys_city_code` VALUES ('88', '河北省', '邯郸市', '成安县', '\r\n130424', null);
INSERT INTO `sys_city_code` VALUES ('89', '河北省', '邯郸市', '大名县', '\r\n130425', null);
INSERT INTO `sys_city_code` VALUES ('90', '河北省', '邯郸市', '涉县', '\r\n130426', null);
INSERT INTO `sys_city_code` VALUES ('91', '河北省', '邯郸市', '磁县', '\r\n130427', null);
INSERT INTO `sys_city_code` VALUES ('92', '河北省', '邯郸市', '肥乡县', '\r\n130428', null);
INSERT INTO `sys_city_code` VALUES ('93', '河北省', '邯郸市', '永年县', '\r\n130429', null);
INSERT INTO `sys_city_code` VALUES ('94', '河北省', '邯郸市', '邱县', '\r\n130430', null);
INSERT INTO `sys_city_code` VALUES ('95', '河北省', '邯郸市', '鸡泽县', '\r\n130431', null);
INSERT INTO `sys_city_code` VALUES ('96', '河北省', '邯郸市', '广平县', '\r\n130432', null);
INSERT INTO `sys_city_code` VALUES ('97', '河北省', '邯郸市', '馆陶县', '\r\n130433', null);
INSERT INTO `sys_city_code` VALUES ('98', '河北省', '邯郸市', '魏县', '\r\n130434', null);
INSERT INTO `sys_city_code` VALUES ('99', '河北省', '邯郸市', '曲周县', '\r\n130435', null);
INSERT INTO `sys_city_code` VALUES ('100', '河北省', '邯郸市', '武安市', '\r\n130481', null);
INSERT INTO `sys_city_code` VALUES ('101', '河北省', '邢台市', '桥东区', '\r\n130502', null);
INSERT INTO `sys_city_code` VALUES ('102', '河北省', '邢台市', '桥西区', '\r\n130503', null);
INSERT INTO `sys_city_code` VALUES ('103', '河北省', '邢台市', '邢台县', '\r\n130521', null);
INSERT INTO `sys_city_code` VALUES ('104', '河北省', '邢台市', '临城县', '\r\n130522', null);
INSERT INTO `sys_city_code` VALUES ('105', '河北省', '邢台市', '内丘县', '\r\n130523', null);
INSERT INTO `sys_city_code` VALUES ('106', '河北省', '邢台市', '柏乡县', '\r\n130524', null);
INSERT INTO `sys_city_code` VALUES ('107', '河北省', '邢台市', '隆尧县', '\r\n130525', null);
INSERT INTO `sys_city_code` VALUES ('108', '河北省', '邢台市', '任县', '\r\n130526', null);
INSERT INTO `sys_city_code` VALUES ('109', '河北省', '邢台市', '南和县', '\r\n130527', null);
INSERT INTO `sys_city_code` VALUES ('110', '河北省', '邢台市', '宁晋县', '\r\n130528', null);
INSERT INTO `sys_city_code` VALUES ('111', '河北省', '邢台市', '巨鹿县', '\r\n130529', null);
INSERT INTO `sys_city_code` VALUES ('112', '河北省', '邢台市', '新河县', '\r\n130530', null);
INSERT INTO `sys_city_code` VALUES ('113', '河北省', '邢台市', '广宗县', '\r\n130531', null);
INSERT INTO `sys_city_code` VALUES ('114', '河北省', '邢台市', '平乡县', '\r\n130532', null);
INSERT INTO `sys_city_code` VALUES ('115', '河北省', '邢台市', '威县', '\r\n130533', null);
INSERT INTO `sys_city_code` VALUES ('116', '河北省', '邢台市', '清河县', '\r\n130534', null);
INSERT INTO `sys_city_code` VALUES ('117', '河北省', '邢台市', '临西县', '\r\n130535', null);
INSERT INTO `sys_city_code` VALUES ('118', '河北省', '邢台市', '南宫市', '\r\n130581', null);
INSERT INTO `sys_city_code` VALUES ('119', '河北省', '邢台市', '沙河市', '\r\n130582', null);
INSERT INTO `sys_city_code` VALUES ('120', '河北省', '保定市', '新市区', '\r\n130602', null);
INSERT INTO `sys_city_code` VALUES ('121', '河北省', '保定市', '北市区', '\r\n130603', null);
INSERT INTO `sys_city_code` VALUES ('122', '河北省', '保定市', '南市区', '\r\n130604', null);
INSERT INTO `sys_city_code` VALUES ('123', '河北省', '保定市', '满城县', '\r\n130621', null);
INSERT INTO `sys_city_code` VALUES ('124', '河北省', '保定市', '清苑县', '\r\n130622', null);
INSERT INTO `sys_city_code` VALUES ('125', '河北省', '保定市', '涞水县', '\r\n130623', null);
INSERT INTO `sys_city_code` VALUES ('126', '河北省', '保定市', '阜平县', '\r\n130624', null);
INSERT INTO `sys_city_code` VALUES ('127', '河北省', '保定市', '徐水县', '\r\n130625', null);
INSERT INTO `sys_city_code` VALUES ('128', '河北省', '保定市', '定兴县', '\r\n130626', null);
INSERT INTO `sys_city_code` VALUES ('129', '河北省', '保定市', '唐县', '\r\n130627', null);
INSERT INTO `sys_city_code` VALUES ('130', '河北省', '保定市', '高阳县', '\r\n130628', null);
INSERT INTO `sys_city_code` VALUES ('131', '河北省', '保定市', '容城县', '\r\n130629', null);
INSERT INTO `sys_city_code` VALUES ('132', '河北省', '保定市', '涞源县', '\r\n130630', null);
INSERT INTO `sys_city_code` VALUES ('133', '河北省', '保定市', '望都县', '\r\n130631', null);
INSERT INTO `sys_city_code` VALUES ('134', '河北省', '保定市', '安新县', '\r\n130632', null);
INSERT INTO `sys_city_code` VALUES ('135', '河北省', '保定市', '易县', '\r\n130633', null);
INSERT INTO `sys_city_code` VALUES ('136', '河北省', '保定市', '曲阳县', '\r\n130634', null);
INSERT INTO `sys_city_code` VALUES ('137', '河北省', '保定市', '蠡县', '\r\n130635', null);
INSERT INTO `sys_city_code` VALUES ('138', '河北省', '保定市', '顺平县', '\r\n130636', null);
INSERT INTO `sys_city_code` VALUES ('139', '河北省', '保定市', '博野县', '\r\n130637', null);
INSERT INTO `sys_city_code` VALUES ('140', '河北省', '保定市', '雄县', '\r\n130638', null);
INSERT INTO `sys_city_code` VALUES ('141', '河北省', '保定市', '涿州市', '\r\n130681', null);
INSERT INTO `sys_city_code` VALUES ('142', '河北省', '保定市', '定州市', '\r\n130682', null);
INSERT INTO `sys_city_code` VALUES ('143', '河北省', '保定市', '安国市', '\r\n130683', null);
INSERT INTO `sys_city_code` VALUES ('144', '河北省', '保定市', '高碑店市', '\r\n130684', null);
INSERT INTO `sys_city_code` VALUES ('145', '河北省', '张家口市', '桥东区', '\r\n130702', null);
INSERT INTO `sys_city_code` VALUES ('146', '河北省', '张家口市', '桥西区', '\r\n130703', null);
INSERT INTO `sys_city_code` VALUES ('147', '河北省', '张家口市', '宣化区', '\r\n130705', null);
INSERT INTO `sys_city_code` VALUES ('148', '河北省', '张家口市', '下花园区', '\r\n130706', null);
INSERT INTO `sys_city_code` VALUES ('149', '河北省', '张家口市', '宣化县', '\r\n130721', null);
INSERT INTO `sys_city_code` VALUES ('150', '河北省', '张家口市', '张北县', '\r\n130722', null);
INSERT INTO `sys_city_code` VALUES ('151', '河北省', '张家口市', '康保县', '\r\n130723', null);
INSERT INTO `sys_city_code` VALUES ('152', '河北省', '张家口市', '沽源县', '\r\n130724', null);
INSERT INTO `sys_city_code` VALUES ('153', '河北省', '张家口市', '尚义县', '\r\n130725', null);
INSERT INTO `sys_city_code` VALUES ('154', '河北省', '张家口市', '蔚县', '\r\n130726', null);
INSERT INTO `sys_city_code` VALUES ('155', '河北省', '张家口市', '阳原县', '\r\n130727', null);
INSERT INTO `sys_city_code` VALUES ('156', '河北省', '张家口市', '怀安县', '\r\n130728', null);
INSERT INTO `sys_city_code` VALUES ('157', '河北省', '张家口市', '万全县', '\r\n130729', null);
INSERT INTO `sys_city_code` VALUES ('158', '河北省', '张家口市', '怀来县', '\r\n130730', null);
INSERT INTO `sys_city_code` VALUES ('159', '河北省', '张家口市', '涿鹿县', '\r\n130731', null);
INSERT INTO `sys_city_code` VALUES ('160', '河北省', '张家口市', '赤城县', '\r\n130732', null);
INSERT INTO `sys_city_code` VALUES ('161', '河北省', '张家口市', '崇礼县', '\r\n130733', null);
INSERT INTO `sys_city_code` VALUES ('162', '河北省', '承德市', '双桥区', '\r\n130802', null);
INSERT INTO `sys_city_code` VALUES ('163', '河北省', '承德市', '双滦区', '\r\n130803', null);
INSERT INTO `sys_city_code` VALUES ('164', '河北省', '承德市', '鹰手营子矿区', '\r\n130804', null);
INSERT INTO `sys_city_code` VALUES ('165', '河北省', '承德市', '承德县', '\r\n130821', null);
INSERT INTO `sys_city_code` VALUES ('166', '河北省', '承德市', '兴隆县', '\r\n130822', null);
INSERT INTO `sys_city_code` VALUES ('167', '河北省', '承德市', '平泉县', '\r\n130823', null);
INSERT INTO `sys_city_code` VALUES ('168', '河北省', '承德市', '滦平县', '\r\n130824', null);
INSERT INTO `sys_city_code` VALUES ('169', '河北省', '承德市', '隆化县', '\r\n130825', null);
INSERT INTO `sys_city_code` VALUES ('170', '河北省', '承德市', '丰宁满族自治县', '\r\n130826', null);
INSERT INTO `sys_city_code` VALUES ('171', '河北省', '承德市', '宽城满族自治县', '\r\n130827', null);
INSERT INTO `sys_city_code` VALUES ('172', '河北省', '承德市', '围场满族蒙古族自治县', '\r\n130828', null);
INSERT INTO `sys_city_code` VALUES ('173', '河北省', '沧州市', '新华区', '\r\n130902', null);
INSERT INTO `sys_city_code` VALUES ('174', '河北省', '沧州市', '运河区', '\r\n130903', null);
INSERT INTO `sys_city_code` VALUES ('175', '河北省', '沧州市', '沧县', '\r\n130921', null);
INSERT INTO `sys_city_code` VALUES ('176', '河北省', '沧州市', '青县', '\r\n130922', null);
INSERT INTO `sys_city_code` VALUES ('177', '河北省', '沧州市', '东光县', '\r\n130923', null);
INSERT INTO `sys_city_code` VALUES ('178', '河北省', '沧州市', '海兴县', '\r\n130924', null);
INSERT INTO `sys_city_code` VALUES ('179', '河北省', '沧州市', '盐山县', '\r\n130925', null);
INSERT INTO `sys_city_code` VALUES ('180', '河北省', '沧州市', '肃宁县', '\r\n130926', null);
INSERT INTO `sys_city_code` VALUES ('181', '河北省', '沧州市', '南皮县', '\r\n130927', null);
INSERT INTO `sys_city_code` VALUES ('182', '河北省', '沧州市', '吴桥县', '\r\n130928', null);
INSERT INTO `sys_city_code` VALUES ('183', '河北省', '沧州市', '献县', '\r\n130929', null);
INSERT INTO `sys_city_code` VALUES ('184', '河北省', '沧州市', '孟村回族自治县', '\r\n130930', null);
INSERT INTO `sys_city_code` VALUES ('185', '河北省', '沧州市', '泊头市', '\r\n130981', null);
INSERT INTO `sys_city_code` VALUES ('186', '河北省', '沧州市', '任丘市', '\r\n130982', null);
INSERT INTO `sys_city_code` VALUES ('187', '河北省', '沧州市', '黄骅市', '\r\n130983', null);
INSERT INTO `sys_city_code` VALUES ('188', '河北省', '沧州市', '河间市', '\r\n130984', null);
INSERT INTO `sys_city_code` VALUES ('189', '河北省', '廊坊市', '安次区', '\r\n131002', null);
INSERT INTO `sys_city_code` VALUES ('190', '河北省', '廊坊市', '广阳区', '\r\n131003', null);
INSERT INTO `sys_city_code` VALUES ('191', '河北省', '廊坊市', '固安县', '\r\n131022', null);
INSERT INTO `sys_city_code` VALUES ('192', '河北省', '廊坊市', '永清县', '\r\n131023', null);
INSERT INTO `sys_city_code` VALUES ('193', '河北省', '廊坊市', '香河县', '\r\n131024', null);
INSERT INTO `sys_city_code` VALUES ('194', '河北省', '廊坊市', '大城县', '\r\n131025', null);
INSERT INTO `sys_city_code` VALUES ('195', '河北省', '廊坊市', '文安县', '\r\n131026', null);
INSERT INTO `sys_city_code` VALUES ('196', '河北省', '廊坊市', '大厂回族自治县', '\r\n131028', null);
INSERT INTO `sys_city_code` VALUES ('197', '河北省', '廊坊市', '霸州市', '\r\n131081', null);
INSERT INTO `sys_city_code` VALUES ('198', '河北省', '廊坊市', '三河市', '\r\n131082', null);
INSERT INTO `sys_city_code` VALUES ('199', '河北省', '衡水市', '桃城区', '\r\n131102', null);
INSERT INTO `sys_city_code` VALUES ('200', '河北省', '衡水市', '枣强县', '\r\n131121', null);
INSERT INTO `sys_city_code` VALUES ('201', '河北省', '衡水市', '武邑县', '\r\n131122', null);
INSERT INTO `sys_city_code` VALUES ('202', '河北省', '衡水市', '武强县', '\r\n131123', null);
INSERT INTO `sys_city_code` VALUES ('203', '河北省', '衡水市', '饶阳县', '\r\n131124', null);
INSERT INTO `sys_city_code` VALUES ('204', '河北省', '衡水市', '安平县', '\r\n131125', null);
INSERT INTO `sys_city_code` VALUES ('205', '河北省', '衡水市', '故城县', '\r\n131126', null);
INSERT INTO `sys_city_code` VALUES ('206', '河北省', '衡水市', '景县', '\r\n131127', null);
INSERT INTO `sys_city_code` VALUES ('207', '河北省', '衡水市', '阜城县', '\r\n131128', null);
INSERT INTO `sys_city_code` VALUES ('208', '河北省', '衡水市', '冀州市', '\r\n131181', null);
INSERT INTO `sys_city_code` VALUES ('209', '河北省', '衡水市', '深州市', '\r\n131182', null);
INSERT INTO `sys_city_code` VALUES ('210', '山西省', '太原市', '小店区', '\r\n140105', null);
INSERT INTO `sys_city_code` VALUES ('211', '山西省', '太原市', '迎泽区', '\r\n140106', null);
INSERT INTO `sys_city_code` VALUES ('212', '山西省', '太原市', '杏花岭区', '\r\n140107', null);
INSERT INTO `sys_city_code` VALUES ('213', '山西省', '太原市', '尖草坪区', '\r\n140108', null);
INSERT INTO `sys_city_code` VALUES ('214', '山西省', '太原市', '万柏林区', '\r\n140109', null);
INSERT INTO `sys_city_code` VALUES ('215', '山西省', '太原市', '晋源区', '\r\n140110', null);
INSERT INTO `sys_city_code` VALUES ('216', '山西省', '太原市', '清徐县', '\r\n140121', null);
INSERT INTO `sys_city_code` VALUES ('217', '山西省', '太原市', '阳曲县', '\r\n140122', null);
INSERT INTO `sys_city_code` VALUES ('218', '山西省', '太原市', '娄烦县', '\r\n140123', null);
INSERT INTO `sys_city_code` VALUES ('219', '山西省', '太原市', '古交市', '\r\n140181', null);
INSERT INTO `sys_city_code` VALUES ('220', '山西省', '大同市', '城区', '\r\n140202', null);
INSERT INTO `sys_city_code` VALUES ('221', '山西省', '大同市', '矿区', '\r\n140203', null);
INSERT INTO `sys_city_code` VALUES ('222', '山西省', '大同市', '南郊区', '\r\n140211', null);
INSERT INTO `sys_city_code` VALUES ('223', '山西省', '大同市', '新荣区', '\r\n140212', null);
INSERT INTO `sys_city_code` VALUES ('224', '山西省', '大同市', '阳高县', '\r\n140221', null);
INSERT INTO `sys_city_code` VALUES ('225', '山西省', '大同市', '天镇县', '\r\n140222', null);
INSERT INTO `sys_city_code` VALUES ('226', '山西省', '大同市', '广灵县', '\r\n140223', null);
INSERT INTO `sys_city_code` VALUES ('227', '山西省', '大同市', '灵丘县', '\r\n140224', null);
INSERT INTO `sys_city_code` VALUES ('228', '山西省', '大同市', '浑源县', '\r\n140225', null);
INSERT INTO `sys_city_code` VALUES ('229', '山西省', '大同市', '左云县', '\r\n140226', null);
INSERT INTO `sys_city_code` VALUES ('230', '山西省', '大同市', '大同县', '\r\n140227', null);
INSERT INTO `sys_city_code` VALUES ('231', '山西省', '阳泉市', '城区', '\r\n140302', null);
INSERT INTO `sys_city_code` VALUES ('232', '山西省', '阳泉市', '矿区', '\r\n140303', null);
INSERT INTO `sys_city_code` VALUES ('233', '山西省', '阳泉市', '郊区', '\r\n140311', null);
INSERT INTO `sys_city_code` VALUES ('234', '山西省', '阳泉市', '平定县', '\r\n140321', null);
INSERT INTO `sys_city_code` VALUES ('235', '山西省', '阳泉市', '盂县', '\r\n140322', null);
INSERT INTO `sys_city_code` VALUES ('236', '山西省', '长治市', '城区', '\r\n140402', null);
INSERT INTO `sys_city_code` VALUES ('237', '山西省', '长治市', '郊区', '\r\n140411', null);
INSERT INTO `sys_city_code` VALUES ('238', '山西省', '长治市', '长治县', '\r\n140421', null);
INSERT INTO `sys_city_code` VALUES ('239', '山西省', '长治市', '襄垣县', '\r\n140423', null);
INSERT INTO `sys_city_code` VALUES ('240', '山西省', '长治市', '屯留县', '\r\n140424', null);
INSERT INTO `sys_city_code` VALUES ('241', '山西省', '长治市', '平顺县', '\r\n140425', null);
INSERT INTO `sys_city_code` VALUES ('242', '山西省', '长治市', '黎城县', '\r\n140426', null);
INSERT INTO `sys_city_code` VALUES ('243', '山西省', '长治市', '壶关县', '\r\n140427', null);
INSERT INTO `sys_city_code` VALUES ('244', '山西省', '长治市', '长子县', '\r\n140428', null);
INSERT INTO `sys_city_code` VALUES ('245', '山西省', '长治市', '武乡县', '\r\n140429', null);
INSERT INTO `sys_city_code` VALUES ('246', '山西省', '长治市', '沁县', '\r\n140430', null);
INSERT INTO `sys_city_code` VALUES ('247', '山西省', '长治市', '沁源县', '\r\n140431', null);
INSERT INTO `sys_city_code` VALUES ('248', '山西省', '长治市', '潞城市', '\r\n140481', null);
INSERT INTO `sys_city_code` VALUES ('249', '山西省', '晋城市', '城区', '\r\n140502', null);
INSERT INTO `sys_city_code` VALUES ('250', '山西省', '晋城市', '沁水县', '\r\n140521', null);
INSERT INTO `sys_city_code` VALUES ('251', '山西省', '晋城市', '阳城县', '\r\n140522', null);
INSERT INTO `sys_city_code` VALUES ('252', '山西省', '晋城市', '陵川县', '\r\n140524', null);
INSERT INTO `sys_city_code` VALUES ('253', '山西省', '晋城市', '泽州县', '\r\n140525', null);
INSERT INTO `sys_city_code` VALUES ('254', '山西省', '晋城市', '高平市', '\r\n140581', null);
INSERT INTO `sys_city_code` VALUES ('255', '山西省', '朔州市', '朔城区', '\r\n140602', null);
INSERT INTO `sys_city_code` VALUES ('256', '山西省', '朔州市', '平鲁区', '\r\n140603', null);
INSERT INTO `sys_city_code` VALUES ('257', '山西省', '朔州市', '山阴县', '\r\n140621', null);
INSERT INTO `sys_city_code` VALUES ('258', '山西省', '朔州市', '应县', '\r\n140622', null);
INSERT INTO `sys_city_code` VALUES ('259', '山西省', '朔州市', '右玉县', '\r\n140623', null);
INSERT INTO `sys_city_code` VALUES ('260', '山西省', '朔州市', '怀仁县', '\r\n140624', null);
INSERT INTO `sys_city_code` VALUES ('261', '山西省', '晋中市', '榆次区', '\r\n140702', null);
INSERT INTO `sys_city_code` VALUES ('262', '山西省', '晋中市', '榆社县', '\r\n140721', null);
INSERT INTO `sys_city_code` VALUES ('263', '山西省', '晋中市', '左权县', '\r\n140722', null);
INSERT INTO `sys_city_code` VALUES ('264', '山西省', '晋中市', '和顺县', '\r\n140723', null);
INSERT INTO `sys_city_code` VALUES ('265', '山西省', '晋中市', '昔阳县', '\r\n140724', null);
INSERT INTO `sys_city_code` VALUES ('266', '山西省', '晋中市', '寿阳县', '\r\n140725', null);
INSERT INTO `sys_city_code` VALUES ('267', '山西省', '晋中市', '太谷县', '\r\n140726', null);
INSERT INTO `sys_city_code` VALUES ('268', '山西省', '晋中市', '祁县', '\r\n140727', null);
INSERT INTO `sys_city_code` VALUES ('269', '山西省', '晋中市', '平遥县', '\r\n140728', null);
INSERT INTO `sys_city_code` VALUES ('270', '山西省', '晋中市', '灵石县', '\r\n140729', null);
INSERT INTO `sys_city_code` VALUES ('271', '山西省', '晋中市', '介休市', '\r\n140781', null);
INSERT INTO `sys_city_code` VALUES ('272', '山西省', '运城市', '盐湖区', '\r\n140802', null);
INSERT INTO `sys_city_code` VALUES ('273', '山西省', '运城市', '临猗县', '\r\n140821', null);
INSERT INTO `sys_city_code` VALUES ('274', '山西省', '运城市', '万荣县', '\r\n140822', null);
INSERT INTO `sys_city_code` VALUES ('275', '山西省', '运城市', '闻喜县', '\r\n140823', null);
INSERT INTO `sys_city_code` VALUES ('276', '山西省', '运城市', '稷山县', '\r\n140824', null);
INSERT INTO `sys_city_code` VALUES ('277', '山西省', '运城市', '新绛县', '\r\n140825', null);
INSERT INTO `sys_city_code` VALUES ('278', '山西省', '运城市', '绛县', '\r\n140826', null);
INSERT INTO `sys_city_code` VALUES ('279', '山西省', '运城市', '垣曲县', '\r\n140827', null);
INSERT INTO `sys_city_code` VALUES ('280', '山西省', '运城市', '夏县', '\r\n140828', null);
INSERT INTO `sys_city_code` VALUES ('281', '山西省', '运城市', '平陆县', '\r\n140829', null);
INSERT INTO `sys_city_code` VALUES ('282', '山西省', '运城市', '芮城县', '\r\n140830', null);
INSERT INTO `sys_city_code` VALUES ('283', '山西省', '运城市', '永济市', '\r\n140881', null);
INSERT INTO `sys_city_code` VALUES ('284', '山西省', '运城市', '河津市', '\r\n140882', null);
INSERT INTO `sys_city_code` VALUES ('285', '山西省', '忻州市', '忻府区', '\r\n140902', null);
INSERT INTO `sys_city_code` VALUES ('286', '山西省', '忻州市', '定襄县', '\r\n140921', null);
INSERT INTO `sys_city_code` VALUES ('287', '山西省', '忻州市', '五台县', '\r\n140922', null);
INSERT INTO `sys_city_code` VALUES ('288', '山西省', '忻州市', '代县', '\r\n140923', null);
INSERT INTO `sys_city_code` VALUES ('289', '山西省', '忻州市', '繁峙县', '\r\n140924', null);
INSERT INTO `sys_city_code` VALUES ('290', '山西省', '忻州市', '宁武县', '\r\n140925', null);
INSERT INTO `sys_city_code` VALUES ('291', '山西省', '忻州市', '静乐县', '\r\n140926', null);
INSERT INTO `sys_city_code` VALUES ('292', '山西省', '忻州市', '神池县', '\r\n140927', null);
INSERT INTO `sys_city_code` VALUES ('293', '山西省', '忻州市', '五寨县', '\r\n140928', null);
INSERT INTO `sys_city_code` VALUES ('294', '山西省', '忻州市', '岢岚县', '\r\n140929', null);
INSERT INTO `sys_city_code` VALUES ('295', '山西省', '忻州市', '河曲县', '\r\n140930', null);
INSERT INTO `sys_city_code` VALUES ('296', '山西省', '忻州市', '保德县', '\r\n140931', null);
INSERT INTO `sys_city_code` VALUES ('297', '山西省', '忻州市', '偏关县', '\r\n140932', null);
INSERT INTO `sys_city_code` VALUES ('298', '山西省', '忻州市', '原平市', '\r\n140981', null);
INSERT INTO `sys_city_code` VALUES ('299', '山西省', '临汾市', '尧都区', '\r\n141002', null);
INSERT INTO `sys_city_code` VALUES ('300', '山西省', '临汾市', '曲沃县', '\r\n141021', null);
INSERT INTO `sys_city_code` VALUES ('301', '山西省', '临汾市', '翼城县', '\r\n141022', null);
INSERT INTO `sys_city_code` VALUES ('302', '山西省', '临汾市', '襄汾县', '\r\n141023', null);
INSERT INTO `sys_city_code` VALUES ('303', '山西省', '临汾市', '洪洞县', '\r\n141024', null);
INSERT INTO `sys_city_code` VALUES ('304', '山西省', '临汾市', '古县', '\r\n141025', null);
INSERT INTO `sys_city_code` VALUES ('305', '山西省', '临汾市', '安泽县', '\r\n141026', null);
INSERT INTO `sys_city_code` VALUES ('306', '山西省', '临汾市', '浮山县', '\r\n141027', null);
INSERT INTO `sys_city_code` VALUES ('307', '山西省', '临汾市', '吉县', '\r\n141028', null);
INSERT INTO `sys_city_code` VALUES ('308', '山西省', '临汾市', '乡宁县', '\r\n141029', null);
INSERT INTO `sys_city_code` VALUES ('309', '山西省', '临汾市', '大宁县', '\r\n141030', null);
INSERT INTO `sys_city_code` VALUES ('310', '山西省', '临汾市', '隰县', '\r\n141031', null);
INSERT INTO `sys_city_code` VALUES ('311', '山西省', '临汾市', '永和县', '\r\n141032', null);
INSERT INTO `sys_city_code` VALUES ('312', '山西省', '临汾市', '蒲县', '\r\n141033', null);
INSERT INTO `sys_city_code` VALUES ('313', '山西省', '临汾市', '汾西县', '\r\n141034', null);
INSERT INTO `sys_city_code` VALUES ('314', '山西省', '临汾市', '侯马市', '\r\n141081', null);
INSERT INTO `sys_city_code` VALUES ('315', '山西省', '临汾市', '霍州市', '\r\n141082', null);
INSERT INTO `sys_city_code` VALUES ('316', '山西省', '吕梁市', '离石区', '\r\n141102', null);
INSERT INTO `sys_city_code` VALUES ('317', '山西省', '吕梁市', '文水县', '\r\n141121', null);
INSERT INTO `sys_city_code` VALUES ('318', '山西省', '吕梁市', '交城县', '\r\n141122', null);
INSERT INTO `sys_city_code` VALUES ('319', '山西省', '吕梁市', '兴县', '\r\n141123', null);
INSERT INTO `sys_city_code` VALUES ('320', '山西省', '吕梁市', '临县', '\r\n141124', null);
INSERT INTO `sys_city_code` VALUES ('321', '山西省', '吕梁市', '柳林县', '\r\n141125', null);
INSERT INTO `sys_city_code` VALUES ('322', '山西省', '吕梁市', '石楼县', '\r\n141126', null);
INSERT INTO `sys_city_code` VALUES ('323', '山西省', '吕梁市', '岚县', '\r\n141127', null);
INSERT INTO `sys_city_code` VALUES ('324', '山西省', '吕梁市', '方山县', '\r\n141128', null);
INSERT INTO `sys_city_code` VALUES ('325', '山西省', '吕梁市', '中阳县', '\r\n141129', null);
INSERT INTO `sys_city_code` VALUES ('326', '山西省', '吕梁市', '交口县', '\r\n141130', null);
INSERT INTO `sys_city_code` VALUES ('327', '山西省', '吕梁市', '孝义市', '\r\n141181', null);
INSERT INTO `sys_city_code` VALUES ('328', '山西省', '吕梁市', '汾阳市', '\r\n141182', null);
INSERT INTO `sys_city_code` VALUES ('329', '内蒙古自治区', '呼和浩特市', '新城区', '\r\n150102', null);
INSERT INTO `sys_city_code` VALUES ('330', '内蒙古自治区', '呼和浩特市', '回民区', '\r\n150103', null);
INSERT INTO `sys_city_code` VALUES ('331', '内蒙古自治区', '呼和浩特市', '玉泉区', '\r\n150104', null);
INSERT INTO `sys_city_code` VALUES ('332', '内蒙古自治区', '呼和浩特市', '赛罕区', '\r\n150105', null);
INSERT INTO `sys_city_code` VALUES ('333', '内蒙古自治区', '呼和浩特市', '土默特左旗', '\r\n150121', null);
INSERT INTO `sys_city_code` VALUES ('334', '内蒙古自治区', '呼和浩特市', '托克托县', '\r\n150122', null);
INSERT INTO `sys_city_code` VALUES ('335', '内蒙古自治区', '呼和浩特市', '和林格尔县', '\r\n150123', null);
INSERT INTO `sys_city_code` VALUES ('336', '内蒙古自治区', '呼和浩特市', '清水河县', '\r\n150124', null);
INSERT INTO `sys_city_code` VALUES ('337', '内蒙古自治区', '呼和浩特市', '武川县', '\r\n150125', null);
INSERT INTO `sys_city_code` VALUES ('338', '内蒙古自治区', '包头市', '东河区', '\r\n150202', null);
INSERT INTO `sys_city_code` VALUES ('339', '内蒙古自治区', '包头市', '昆都仑区', '\r\n150203', null);
INSERT INTO `sys_city_code` VALUES ('340', '内蒙古自治区', '包头市', '青山区', '\r\n150204', null);
INSERT INTO `sys_city_code` VALUES ('341', '内蒙古自治区', '包头市', '石拐区', '\r\n150205', null);
INSERT INTO `sys_city_code` VALUES ('342', '内蒙古自治区', '包头市', '白云矿区', '\r\n150206', null);
INSERT INTO `sys_city_code` VALUES ('343', '内蒙古自治区', '包头市', '九原区', '\r\n150207', null);
INSERT INTO `sys_city_code` VALUES ('344', '内蒙古自治区', '包头市', '土默特右旗', '\r\n150221', null);
INSERT INTO `sys_city_code` VALUES ('345', '内蒙古自治区', '包头市', '固阳县', '\r\n150222', null);
INSERT INTO `sys_city_code` VALUES ('346', '内蒙古自治区', '包头市', '达尔罕茂明安联合旗', '\r\n150223', null);
INSERT INTO `sys_city_code` VALUES ('347', '内蒙古自治区', '乌海市', '海勃湾区', '\r\n150302', null);
INSERT INTO `sys_city_code` VALUES ('348', '内蒙古自治区', '乌海市', '海南区', '\r\n150303', null);
INSERT INTO `sys_city_code` VALUES ('349', '内蒙古自治区', '乌海市', '乌达区', '\r\n150304', null);
INSERT INTO `sys_city_code` VALUES ('350', '内蒙古自治区', '赤峰市', '红山区', '\r\n150402', null);
INSERT INTO `sys_city_code` VALUES ('351', '内蒙古自治区', '赤峰市', '元宝山区', '\r\n150403', null);
INSERT INTO `sys_city_code` VALUES ('352', '内蒙古自治区', '赤峰市', '松山区', '\r\n150404', null);
INSERT INTO `sys_city_code` VALUES ('353', '内蒙古自治区', '赤峰市', '阿鲁科尔沁旗', '\r\n150421', null);
INSERT INTO `sys_city_code` VALUES ('354', '内蒙古自治区', '赤峰市', '巴林左旗', '\r\n150422', null);
INSERT INTO `sys_city_code` VALUES ('355', '内蒙古自治区', '赤峰市', '巴林右旗', '\r\n150423', null);
INSERT INTO `sys_city_code` VALUES ('356', '内蒙古自治区', '赤峰市', '林西县', '\r\n150424', null);
INSERT INTO `sys_city_code` VALUES ('357', '内蒙古自治区', '赤峰市', '克什克腾旗', '\r\n150425', null);
INSERT INTO `sys_city_code` VALUES ('358', '内蒙古自治区', '赤峰市', '翁牛特旗', '\r\n150426', null);
INSERT INTO `sys_city_code` VALUES ('359', '内蒙古自治区', '赤峰市', '喀喇沁旗', '\r\n150428', null);
INSERT INTO `sys_city_code` VALUES ('360', '内蒙古自治区', '赤峰市', '宁城县', '\r\n150429', null);
INSERT INTO `sys_city_code` VALUES ('361', '内蒙古自治区', '赤峰市', '敖汉旗', '\r\n150430', null);
INSERT INTO `sys_city_code` VALUES ('362', '内蒙古自治区', '通辽市', '科尔沁区', '\r\n150502', null);
INSERT INTO `sys_city_code` VALUES ('363', '内蒙古自治区', '通辽市', '科尔沁左翼中旗', '\r\n150521', null);
INSERT INTO `sys_city_code` VALUES ('364', '内蒙古自治区', '通辽市', '科尔沁左翼后旗', '\r\n150522', null);
INSERT INTO `sys_city_code` VALUES ('365', '内蒙古自治区', '通辽市', '开鲁县', '\r\n150523', null);
INSERT INTO `sys_city_code` VALUES ('366', '内蒙古自治区', '通辽市', '库伦旗', '\r\n150524', null);
INSERT INTO `sys_city_code` VALUES ('367', '内蒙古自治区', '通辽市', '奈曼旗', '\r\n150525', null);
INSERT INTO `sys_city_code` VALUES ('368', '内蒙古自治区', '通辽市', '扎鲁特旗', '\r\n150526', null);
INSERT INTO `sys_city_code` VALUES ('369', '内蒙古自治区', '通辽市', '霍林郭勒市', '\r\n150581', null);
INSERT INTO `sys_city_code` VALUES ('370', '内蒙古自治区', '鄂尔多斯市', '东胜区', '\r\n150602', null);
INSERT INTO `sys_city_code` VALUES ('371', '内蒙古自治区', '鄂尔多斯市', '达拉特旗', '\r\n150621', null);
INSERT INTO `sys_city_code` VALUES ('372', '内蒙古自治区', '鄂尔多斯市', '准格尔旗', '\r\n150622', null);
INSERT INTO `sys_city_code` VALUES ('373', '内蒙古自治区', '鄂尔多斯市', '鄂托克前旗', '\r\n150623', null);
INSERT INTO `sys_city_code` VALUES ('374', '内蒙古自治区', '鄂尔多斯市', '鄂托克旗', '\r\n150624', null);
INSERT INTO `sys_city_code` VALUES ('375', '内蒙古自治区', '鄂尔多斯市', '杭锦旗', '\r\n150625', null);
INSERT INTO `sys_city_code` VALUES ('376', '内蒙古自治区', '鄂尔多斯市', '乌审旗', '\r\n150626', null);
INSERT INTO `sys_city_code` VALUES ('377', '内蒙古自治区', '鄂尔多斯市', '伊金霍洛旗', '\r\n150627', null);
INSERT INTO `sys_city_code` VALUES ('378', '内蒙古自治区', '呼伦贝尔市', '海拉尔区', '\r\n150702', null);
INSERT INTO `sys_city_code` VALUES ('379', '内蒙古自治区', '呼伦贝尔市', '阿荣旗', '\r\n150721', null);
INSERT INTO `sys_city_code` VALUES ('380', '内蒙古自治区', '呼伦贝尔市', '莫力达瓦达斡尔族自治旗', '\r\n150722', null);
INSERT INTO `sys_city_code` VALUES ('381', '内蒙古自治区', '呼伦贝尔市', '鄂伦春自治旗', '\r\n150723', null);
INSERT INTO `sys_city_code` VALUES ('382', '内蒙古自治区', '呼伦贝尔市', '鄂温克族自治旗', '\r\n150724', null);
INSERT INTO `sys_city_code` VALUES ('383', '内蒙古自治区', '呼伦贝尔市', '陈巴尔虎旗', '\r\n150725', null);
INSERT INTO `sys_city_code` VALUES ('384', '内蒙古自治区', '呼伦贝尔市', '新巴尔虎左旗', '\r\n150726', null);
INSERT INTO `sys_city_code` VALUES ('385', '内蒙古自治区', '呼伦贝尔市', '新巴尔虎右旗', '\r\n150727', null);
INSERT INTO `sys_city_code` VALUES ('386', '内蒙古自治区', '呼伦贝尔市', '满洲里市', '\r\n150781', null);
INSERT INTO `sys_city_code` VALUES ('387', '内蒙古自治区', '呼伦贝尔市', '牙克石市', '\r\n150782', null);
INSERT INTO `sys_city_code` VALUES ('388', '内蒙古自治区', '呼伦贝尔市', '扎兰屯市', '\r\n150783', null);
INSERT INTO `sys_city_code` VALUES ('389', '内蒙古自治区', '呼伦贝尔市', '额尔古纳市', '\r\n150784', null);
INSERT INTO `sys_city_code` VALUES ('390', '内蒙古自治区', '呼伦贝尔市', '根河市', '\r\n150785', null);
INSERT INTO `sys_city_code` VALUES ('391', '内蒙古自治区', '巴彦淖尔市', '临河区', '\r\n150802', null);
INSERT INTO `sys_city_code` VALUES ('392', '内蒙古自治区', '巴彦淖尔市', '五原县', '\r\n150821', null);
INSERT INTO `sys_city_code` VALUES ('393', '内蒙古自治区', '巴彦淖尔市', '磴口县', '\r\n150822', null);
INSERT INTO `sys_city_code` VALUES ('394', '内蒙古自治区', '巴彦淖尔市', '乌拉特前旗', '\r\n150823', null);
INSERT INTO `sys_city_code` VALUES ('395', '内蒙古自治区', '巴彦淖尔市', '乌拉特中旗', '\r\n150824', null);
INSERT INTO `sys_city_code` VALUES ('396', '内蒙古自治区', '巴彦淖尔市', '乌拉特后旗', '\r\n150825', null);
INSERT INTO `sys_city_code` VALUES ('397', '内蒙古自治区', '巴彦淖尔市', '杭锦后旗', '\r\n150826', null);
INSERT INTO `sys_city_code` VALUES ('398', '内蒙古自治区', '乌兰察布市', '集宁区', '\r\n150902', null);
INSERT INTO `sys_city_code` VALUES ('399', '内蒙古自治区', '乌兰察布市', '卓资县', '\r\n150921', null);
INSERT INTO `sys_city_code` VALUES ('400', '内蒙古自治区', '乌兰察布市', '化德县', '\r\n150922', null);
INSERT INTO `sys_city_code` VALUES ('401', '内蒙古自治区', '乌兰察布市', '商都县', '\r\n150923', null);
INSERT INTO `sys_city_code` VALUES ('402', '内蒙古自治区', '乌兰察布市', '兴和县', '\r\n150924', null);
INSERT INTO `sys_city_code` VALUES ('403', '内蒙古自治区', '乌兰察布市', '凉城县', '\r\n150925', null);
INSERT INTO `sys_city_code` VALUES ('404', '内蒙古自治区', '乌兰察布市', '察哈尔右翼前旗', '\r\n150926', null);
INSERT INTO `sys_city_code` VALUES ('405', '内蒙古自治区', '乌兰察布市', '察哈尔右翼中旗', '\r\n150927', null);
INSERT INTO `sys_city_code` VALUES ('406', '内蒙古自治区', '乌兰察布市', '察哈尔右翼后旗', '\r\n150928', null);
INSERT INTO `sys_city_code` VALUES ('407', '内蒙古自治区', '乌兰察布市', '四子王旗', '\r\n150929', null);
INSERT INTO `sys_city_code` VALUES ('408', '内蒙古自治区', '乌兰察布市', '丰镇市', '\r\n150981', null);
INSERT INTO `sys_city_code` VALUES ('409', '内蒙古自治区', '兴安盟', '乌兰浩特市', '\r\n152201', null);
INSERT INTO `sys_city_code` VALUES ('410', '内蒙古自治区', '兴安盟', '阿尔山市', '\r\n152202', null);
INSERT INTO `sys_city_code` VALUES ('411', '内蒙古自治区', '兴安盟', '科尔沁右翼前旗', '\r\n152221', null);
INSERT INTO `sys_city_code` VALUES ('412', '内蒙古自治区', '兴安盟', '科尔沁右翼中旗', '\r\n152222', null);
INSERT INTO `sys_city_code` VALUES ('413', '内蒙古自治区', '兴安盟', '扎赉特旗', '\r\n152223', null);
INSERT INTO `sys_city_code` VALUES ('414', '内蒙古自治区', '兴安盟', '突泉县', '\r\n152224', null);
INSERT INTO `sys_city_code` VALUES ('415', '内蒙古自治区', '锡林郭勒盟', '二连浩特市', '\r\n152501', null);
INSERT INTO `sys_city_code` VALUES ('416', '内蒙古自治区', '锡林郭勒盟', '锡林浩特市', '\r\n152502', null);
INSERT INTO `sys_city_code` VALUES ('417', '内蒙古自治区', '锡林郭勒盟', '阿巴嘎旗', '\r\n152522', null);
INSERT INTO `sys_city_code` VALUES ('418', '内蒙古自治区', '锡林郭勒盟', '苏尼特左旗', '\r\n152523', null);
INSERT INTO `sys_city_code` VALUES ('419', '内蒙古自治区', '锡林郭勒盟', '苏尼特右旗', '\r\n152524', null);
INSERT INTO `sys_city_code` VALUES ('420', '内蒙古自治区', '锡林郭勒盟', '东乌珠穆沁旗', '\r\n152525', null);
INSERT INTO `sys_city_code` VALUES ('421', '内蒙古自治区', '锡林郭勒盟', '西乌珠穆沁旗', '\r\n152526', null);
INSERT INTO `sys_city_code` VALUES ('422', '内蒙古自治区', '锡林郭勒盟', '太仆寺旗', '\r\n152527', null);
INSERT INTO `sys_city_code` VALUES ('423', '内蒙古自治区', '锡林郭勒盟', '镶黄旗', '\r\n152528', null);
INSERT INTO `sys_city_code` VALUES ('424', '内蒙古自治区', '锡林郭勒盟', '正镶白旗', '\r\n152529', null);
INSERT INTO `sys_city_code` VALUES ('425', '内蒙古自治区', '锡林郭勒盟', '正蓝旗', '\r\n152530', null);
INSERT INTO `sys_city_code` VALUES ('426', '内蒙古自治区', '锡林郭勒盟', '多伦县', '\r\n152531', null);
INSERT INTO `sys_city_code` VALUES ('427', '内蒙古自治区', '阿拉善盟', '阿拉善左旗', '\r\n152921', null);
INSERT INTO `sys_city_code` VALUES ('428', '内蒙古自治区', '阿拉善盟', '阿拉善右旗', '\r\n152922', null);
INSERT INTO `sys_city_code` VALUES ('429', '内蒙古自治区', '阿拉善盟', '额济纳旗', '\r\n152923', null);
INSERT INTO `sys_city_code` VALUES ('430', '辽宁省', '沈阳市', '和平区', '\r\n210102', null);
INSERT INTO `sys_city_code` VALUES ('431', '辽宁省', '沈阳市', '沈河区', '\r\n210103', null);
INSERT INTO `sys_city_code` VALUES ('432', '辽宁省', '沈阳市', '大东区', '\r\n210104', null);
INSERT INTO `sys_city_code` VALUES ('433', '辽宁省', '沈阳市', '皇姑区', '\r\n210105', null);
INSERT INTO `sys_city_code` VALUES ('434', '辽宁省', '沈阳市', '铁西区', '\r\n210106', null);
INSERT INTO `sys_city_code` VALUES ('435', '辽宁省', '沈阳市', '苏家屯区', '\r\n210111', null);
INSERT INTO `sys_city_code` VALUES ('436', '辽宁省', '沈阳市', '东陵区', '\r\n210112', null);
INSERT INTO `sys_city_code` VALUES ('437', '辽宁省', '沈阳市', '新城子区', '\r\n210113', null);
INSERT INTO `sys_city_code` VALUES ('438', '辽宁省', '沈阳市', '于洪区', '\r\n210114', null);
INSERT INTO `sys_city_code` VALUES ('439', '辽宁省', '沈阳市', '辽中县', '\r\n210122', null);
INSERT INTO `sys_city_code` VALUES ('440', '辽宁省', '沈阳市', '康平县', '\r\n210123', null);
INSERT INTO `sys_city_code` VALUES ('441', '辽宁省', '沈阳市', '法库县', '\r\n210124', null);
INSERT INTO `sys_city_code` VALUES ('442', '辽宁省', '沈阳市', '新民市', '\r\n210181', null);
INSERT INTO `sys_city_code` VALUES ('443', '辽宁省', '大连市', '中山区', '\r\n210202', null);
INSERT INTO `sys_city_code` VALUES ('444', '辽宁省', '大连市', '西岗区', '\r\n210203', null);
INSERT INTO `sys_city_code` VALUES ('445', '辽宁省', '大连市', '沙河口区', '\r\n210204', null);
INSERT INTO `sys_city_code` VALUES ('446', '辽宁省', '大连市', '甘井子区', '\r\n210211', null);
INSERT INTO `sys_city_code` VALUES ('447', '辽宁省', '大连市', '旅顺口区', '\r\n210212', null);
INSERT INTO `sys_city_code` VALUES ('448', '辽宁省', '大连市', '金州区', '\r\n210213', null);
INSERT INTO `sys_city_code` VALUES ('449', '辽宁省', '大连市', '长海县', '\r\n210224', null);
INSERT INTO `sys_city_code` VALUES ('450', '辽宁省', '大连市', '瓦房店市', '\r\n210281', null);
INSERT INTO `sys_city_code` VALUES ('451', '辽宁省', '大连市', '普兰店市', '\r\n210282', null);
INSERT INTO `sys_city_code` VALUES ('452', '辽宁省', '大连市', '庄河市', '\r\n210283', null);
INSERT INTO `sys_city_code` VALUES ('453', '辽宁省', '鞍山市', '铁东区', '\r\n210302', null);
INSERT INTO `sys_city_code` VALUES ('454', '辽宁省', '鞍山市', '铁西区', '\r\n210303', null);
INSERT INTO `sys_city_code` VALUES ('455', '辽宁省', '鞍山市', '立山区', '\r\n210304', null);
INSERT INTO `sys_city_code` VALUES ('456', '辽宁省', '鞍山市', '千山区', '\r\n210311', null);
INSERT INTO `sys_city_code` VALUES ('457', '辽宁省', '鞍山市', '台安县', '\r\n210321', null);
INSERT INTO `sys_city_code` VALUES ('458', '辽宁省', '鞍山市', '岫岩满族自治县', '\r\n210323', null);
INSERT INTO `sys_city_code` VALUES ('459', '辽宁省', '鞍山市', '海城市', '\r\n210381', null);
INSERT INTO `sys_city_code` VALUES ('460', '辽宁省', '抚顺市', '新抚区', '\r\n210402', null);
INSERT INTO `sys_city_code` VALUES ('461', '辽宁省', '抚顺市', '东洲区', '\r\n210403', null);
INSERT INTO `sys_city_code` VALUES ('462', '辽宁省', '抚顺市', '望花区', '\r\n210404', null);
INSERT INTO `sys_city_code` VALUES ('463', '辽宁省', '抚顺市', '顺城区', '\r\n210411', null);
INSERT INTO `sys_city_code` VALUES ('464', '辽宁省', '抚顺市', '抚顺县', '\r\n210421', null);
INSERT INTO `sys_city_code` VALUES ('465', '辽宁省', '抚顺市', '新宾满族自治县', '\r\n210422', null);
INSERT INTO `sys_city_code` VALUES ('466', '辽宁省', '抚顺市', '清原满族自治县', '\r\n210423', null);
INSERT INTO `sys_city_code` VALUES ('467', '辽宁省', '本溪市', '平山区', '\r\n210502', null);
INSERT INTO `sys_city_code` VALUES ('468', '辽宁省', '本溪市', '溪湖区', '\r\n210503', null);
INSERT INTO `sys_city_code` VALUES ('469', '辽宁省', '本溪市', '明山区', '\r\n210504', null);
INSERT INTO `sys_city_code` VALUES ('470', '辽宁省', '本溪市', '南芬区', '\r\n210505', null);
INSERT INTO `sys_city_code` VALUES ('471', '辽宁省', '本溪市', '本溪满族自治县', '\r\n210521', null);
INSERT INTO `sys_city_code` VALUES ('472', '辽宁省', '本溪市', '桓仁满族自治县', '\r\n210522', null);
INSERT INTO `sys_city_code` VALUES ('473', '辽宁省', '丹东市', '元宝区', '\r\n210602', null);
INSERT INTO `sys_city_code` VALUES ('474', '辽宁省', '丹东市', '振兴区', '\r\n210603', null);
INSERT INTO `sys_city_code` VALUES ('475', '辽宁省', '丹东市', '振安区', '\r\n210604', null);
INSERT INTO `sys_city_code` VALUES ('476', '辽宁省', '丹东市', '宽甸满族自治县', '\r\n210624', null);
INSERT INTO `sys_city_code` VALUES ('477', '辽宁省', '丹东市', '东港市', '\r\n210681', null);
INSERT INTO `sys_city_code` VALUES ('478', '辽宁省', '丹东市', '凤城市', '\r\n210682', null);
INSERT INTO `sys_city_code` VALUES ('479', '辽宁省', '锦州市', '古塔区', '\r\n210702', null);
INSERT INTO `sys_city_code` VALUES ('480', '辽宁省', '锦州市', '凌河区', '\r\n210703', null);
INSERT INTO `sys_city_code` VALUES ('481', '辽宁省', '锦州市', '太和区', '\r\n210711', null);
INSERT INTO `sys_city_code` VALUES ('482', '辽宁省', '锦州市', '黑山县', '\r\n210726', null);
INSERT INTO `sys_city_code` VALUES ('483', '辽宁省', '锦州市', '义县', '\r\n210727', null);
INSERT INTO `sys_city_code` VALUES ('484', '辽宁省', '锦州市', '凌海市', '\r\n210781', null);
INSERT INTO `sys_city_code` VALUES ('485', '辽宁省', '锦州市', '北宁市', '\r\n210782', null);
INSERT INTO `sys_city_code` VALUES ('486', '辽宁省', '营口市', '站前区', '\r\n210802', null);
INSERT INTO `sys_city_code` VALUES ('487', '辽宁省', '营口市', '西市区', '\r\n210803', null);
INSERT INTO `sys_city_code` VALUES ('488', '辽宁省', '营口市', '鲅鱼圈区', '\r\n210804', null);
INSERT INTO `sys_city_code` VALUES ('489', '辽宁省', '营口市', '老边区', '\r\n210811', null);
INSERT INTO `sys_city_code` VALUES ('490', '辽宁省', '营口市', '盖州市', '\r\n210881', null);
INSERT INTO `sys_city_code` VALUES ('491', '辽宁省', '营口市', '大石桥市', '\r\n210882', null);
INSERT INTO `sys_city_code` VALUES ('492', '辽宁省', '阜新市', '海州区', '\r\n210902', null);
INSERT INTO `sys_city_code` VALUES ('493', '辽宁省', '阜新市', '新邱区', '\r\n210903', null);
INSERT INTO `sys_city_code` VALUES ('494', '辽宁省', '阜新市', '太平区', '\r\n210904', null);
INSERT INTO `sys_city_code` VALUES ('495', '辽宁省', '阜新市', '清河门区', '\r\n210905', null);
INSERT INTO `sys_city_code` VALUES ('496', '辽宁省', '阜新市', '细河区', '\r\n210911', null);
INSERT INTO `sys_city_code` VALUES ('497', '辽宁省', '阜新市', '阜新蒙古族自治县', '\r\n210921', null);
INSERT INTO `sys_city_code` VALUES ('498', '辽宁省', '阜新市', '彰武县', '\r\n210922', null);
INSERT INTO `sys_city_code` VALUES ('499', '辽宁省', '辽阳市', '白塔区', '\r\n211002', null);
INSERT INTO `sys_city_code` VALUES ('500', '辽宁省', '辽阳市', '文圣区', '\r\n211003', null);
INSERT INTO `sys_city_code` VALUES ('501', '辽宁省', '辽阳市', '宏伟区', '\r\n211004', null);
INSERT INTO `sys_city_code` VALUES ('502', '辽宁省', '辽阳市', '弓长岭区', '\r\n211005', null);
INSERT INTO `sys_city_code` VALUES ('503', '辽宁省', '辽阳市', '太子河区', '\r\n211011', null);
INSERT INTO `sys_city_code` VALUES ('504', '辽宁省', '辽阳市', '辽阳县', '\r\n211021', null);
INSERT INTO `sys_city_code` VALUES ('505', '辽宁省', '辽阳市', '灯塔市', '\r\n211081', null);
INSERT INTO `sys_city_code` VALUES ('506', '辽宁省', '盘锦市', '双台子区', '\r\n211102', null);
INSERT INTO `sys_city_code` VALUES ('507', '辽宁省', '盘锦市', '兴隆台区', '\r\n211103', null);
INSERT INTO `sys_city_code` VALUES ('508', '辽宁省', '盘锦市', '大洼县', '\r\n211121', null);
INSERT INTO `sys_city_code` VALUES ('509', '辽宁省', '盘锦市', '盘山县', '\r\n211122', null);
INSERT INTO `sys_city_code` VALUES ('510', '辽宁省', '铁岭市', '银州区', '\r\n211202', null);
INSERT INTO `sys_city_code` VALUES ('511', '辽宁省', '铁岭市', '清河区', '\r\n211204', null);
INSERT INTO `sys_city_code` VALUES ('512', '辽宁省', '铁岭市', '铁岭县', '\r\n211221', null);
INSERT INTO `sys_city_code` VALUES ('513', '辽宁省', '铁岭市', '西丰县', '\r\n211223', null);
INSERT INTO `sys_city_code` VALUES ('514', '辽宁省', '铁岭市', '昌图县', '\r\n211224', null);
INSERT INTO `sys_city_code` VALUES ('515', '辽宁省', '铁岭市', '调兵山市', '\r\n211281', null);
INSERT INTO `sys_city_code` VALUES ('516', '辽宁省', '铁岭市', '开原市', '\r\n211282', null);
INSERT INTO `sys_city_code` VALUES ('517', '辽宁省', '朝阳市', '双塔区', '\r\n211302', null);
INSERT INTO `sys_city_code` VALUES ('518', '辽宁省', '朝阳市', '龙城区', '\r\n211303', null);
INSERT INTO `sys_city_code` VALUES ('519', '辽宁省', '朝阳市', '朝阳县', '\r\n211321', null);
INSERT INTO `sys_city_code` VALUES ('520', '辽宁省', '朝阳市', '建平县', '\r\n211322', null);
INSERT INTO `sys_city_code` VALUES ('521', '辽宁省', '朝阳市', '喀喇沁左翼蒙古族自治县', '\r\n211324', null);
INSERT INTO `sys_city_code` VALUES ('522', '辽宁省', '朝阳市', '北票市', '\r\n211381', null);
INSERT INTO `sys_city_code` VALUES ('523', '辽宁省', '朝阳市', '凌源市', '\r\n211382', null);
INSERT INTO `sys_city_code` VALUES ('524', '辽宁省', '葫芦岛市', '连山区', '\r\n211402', null);
INSERT INTO `sys_city_code` VALUES ('525', '辽宁省', '葫芦岛市', '龙港区', '\r\n211403', null);
INSERT INTO `sys_city_code` VALUES ('526', '辽宁省', '葫芦岛市', '南票区', '\r\n211404', null);
INSERT INTO `sys_city_code` VALUES ('527', '辽宁省', '葫芦岛市', '绥中县', '\r\n211421', null);
INSERT INTO `sys_city_code` VALUES ('528', '辽宁省', '葫芦岛市', '建昌县', '\r\n211422', null);
INSERT INTO `sys_city_code` VALUES ('529', '辽宁省', '葫芦岛市', '兴城市', '\r\n211481', null);
INSERT INTO `sys_city_code` VALUES ('530', '吉林省', '长春市', '南关区', '\r\n220102', null);
INSERT INTO `sys_city_code` VALUES ('531', '吉林省', '长春市', '宽城区', '\r\n220103', null);
INSERT INTO `sys_city_code` VALUES ('532', '吉林省', '长春市', '朝阳区', '\r\n220104', null);
INSERT INTO `sys_city_code` VALUES ('533', '吉林省', '长春市', '二道区', '\r\n220105', null);
INSERT INTO `sys_city_code` VALUES ('534', '吉林省', '长春市', '绿园区', '\r\n220106', null);
INSERT INTO `sys_city_code` VALUES ('535', '吉林省', '长春市', '双阳区', '\r\n220112', null);
INSERT INTO `sys_city_code` VALUES ('536', '吉林省', '长春市', '农安县', '\r\n220122', null);
INSERT INTO `sys_city_code` VALUES ('537', '吉林省', '长春市', '九台市', '\r\n220181', null);
INSERT INTO `sys_city_code` VALUES ('538', '吉林省', '长春市', '榆树市', '\r\n220182', null);
INSERT INTO `sys_city_code` VALUES ('539', '吉林省', '长春市', '德惠市', '\r\n220183', null);
INSERT INTO `sys_city_code` VALUES ('540', '吉林省', '吉林市', '昌邑区', '\r\n220202', null);
INSERT INTO `sys_city_code` VALUES ('541', '吉林省', '吉林市', '龙潭区', '\r\n220203', null);
INSERT INTO `sys_city_code` VALUES ('542', '吉林省', '吉林市', '船营区', '\r\n220204', null);
INSERT INTO `sys_city_code` VALUES ('543', '吉林省', '吉林市', '丰满区', '\r\n220211', null);
INSERT INTO `sys_city_code` VALUES ('544', '吉林省', '吉林市', '永吉县', '\r\n220221', null);
INSERT INTO `sys_city_code` VALUES ('545', '吉林省', '吉林市', '蛟河市', '\r\n220281', null);
INSERT INTO `sys_city_code` VALUES ('546', '吉林省', '吉林市', '桦甸市', '\r\n220282', null);
INSERT INTO `sys_city_code` VALUES ('547', '吉林省', '吉林市', '舒兰市', '\r\n220283', null);
INSERT INTO `sys_city_code` VALUES ('548', '吉林省', '吉林市', '磐石市', '\r\n220284', null);
INSERT INTO `sys_city_code` VALUES ('549', '吉林省', '四平市', '铁西区', '\r\n220302', null);
INSERT INTO `sys_city_code` VALUES ('550', '吉林省', '四平市', '铁东区', '\r\n220303', null);
INSERT INTO `sys_city_code` VALUES ('551', '吉林省', '四平市', '梨树县', '\r\n220322', null);
INSERT INTO `sys_city_code` VALUES ('552', '吉林省', '四平市', '伊通满族自治县', '\r\n220323', null);
INSERT INTO `sys_city_code` VALUES ('553', '吉林省', '四平市', '公主岭市', '\r\n220381', null);
INSERT INTO `sys_city_code` VALUES ('554', '吉林省', '四平市', '双辽市', '\r\n220382', null);
INSERT INTO `sys_city_code` VALUES ('555', '吉林省', '辽源市', '龙山区', '\r\n220402', null);
INSERT INTO `sys_city_code` VALUES ('556', '吉林省', '辽源市', '西安区', '\r\n220403', null);
INSERT INTO `sys_city_code` VALUES ('557', '吉林省', '辽源市', '东丰县', '\r\n220421', null);
INSERT INTO `sys_city_code` VALUES ('558', '吉林省', '辽源市', '东辽县', '\r\n220422', null);
INSERT INTO `sys_city_code` VALUES ('559', '吉林省', '通化市', '东昌区', '\r\n220502', null);
INSERT INTO `sys_city_code` VALUES ('560', '吉林省', '通化市', '二道江区', '\r\n220503', null);
INSERT INTO `sys_city_code` VALUES ('561', '吉林省', '通化市', '通化县', '\r\n220521', null);
INSERT INTO `sys_city_code` VALUES ('562', '吉林省', '通化市', '辉南县', '\r\n220523', null);
INSERT INTO `sys_city_code` VALUES ('563', '吉林省', '通化市', '柳河县', '\r\n220524', null);
INSERT INTO `sys_city_code` VALUES ('564', '吉林省', '通化市', '梅河口市', '\r\n220581', null);
INSERT INTO `sys_city_code` VALUES ('565', '吉林省', '通化市', '集安市', '\r\n220582', null);
INSERT INTO `sys_city_code` VALUES ('566', '吉林省', '白山市', '八道江区', '\r\n220602', null);
INSERT INTO `sys_city_code` VALUES ('567', '吉林省', '白山市', '抚松县', '\r\n220621', null);
INSERT INTO `sys_city_code` VALUES ('568', '吉林省', '白山市', '靖宇县', '\r\n220622', null);
INSERT INTO `sys_city_code` VALUES ('569', '吉林省', '白山市', '长白朝鲜族自治县', '\r\n220623', null);
INSERT INTO `sys_city_code` VALUES ('570', '吉林省', '白山市', '江源县', '\r\n220625', null);
INSERT INTO `sys_city_code` VALUES ('571', '吉林省', '白山市', '临江市', '\r\n220681', null);
INSERT INTO `sys_city_code` VALUES ('572', '吉林省', '松原市', '宁江区', '\r\n220702', null);
INSERT INTO `sys_city_code` VALUES ('573', '吉林省', '松原市', '前郭尔罗斯蒙古族自治县', '\r\n220721', null);
INSERT INTO `sys_city_code` VALUES ('574', '吉林省', '松原市', '长岭县', '\r\n220722', null);
INSERT INTO `sys_city_code` VALUES ('575', '吉林省', '松原市', '乾安县', '\r\n220723', null);
INSERT INTO `sys_city_code` VALUES ('576', '吉林省', '松原市', '扶余县', '\r\n220724', null);
INSERT INTO `sys_city_code` VALUES ('577', '吉林省', '白城市', '洮北区', '\r\n220802', null);
INSERT INTO `sys_city_code` VALUES ('578', '吉林省', '白城市', '镇赉县', '\r\n220821', null);
INSERT INTO `sys_city_code` VALUES ('579', '吉林省', '白城市', '通榆县', '\r\n220822', null);
INSERT INTO `sys_city_code` VALUES ('580', '吉林省', '白城市', '洮南市', '\r\n220881', null);
INSERT INTO `sys_city_code` VALUES ('581', '吉林省', '白城市', '大安市', '\r\n220882', null);
INSERT INTO `sys_city_code` VALUES ('582', '吉林省', '延边朝鲜族自治州', '延吉市', '\r\n222401', null);
INSERT INTO `sys_city_code` VALUES ('583', '吉林省', '延边朝鲜族自治州', '图们市', '\r\n222402', null);
INSERT INTO `sys_city_code` VALUES ('584', '吉林省', '延边朝鲜族自治州', '敦化市', '\r\n222403', null);
INSERT INTO `sys_city_code` VALUES ('585', '吉林省', '延边朝鲜族自治州', '珲春市', '\r\n222404', null);
INSERT INTO `sys_city_code` VALUES ('586', '吉林省', '延边朝鲜族自治州', '龙井市', '\r\n222405', null);
INSERT INTO `sys_city_code` VALUES ('587', '吉林省', '延边朝鲜族自治州', '和龙市', '\r\n222406', null);
INSERT INTO `sys_city_code` VALUES ('588', '吉林省', '延边朝鲜族自治州', '汪清县', '\r\n222424', null);
INSERT INTO `sys_city_code` VALUES ('589', '吉林省', '延边朝鲜族自治州', '安图县', '\r\n222426', null);
INSERT INTO `sys_city_code` VALUES ('590', '黑龙江省', '哈尔滨市', '道里区', '\r\n230102', null);
INSERT INTO `sys_city_code` VALUES ('591', '黑龙江省', '哈尔滨市', '南岗区', '\r\n230103', null);
INSERT INTO `sys_city_code` VALUES ('592', '黑龙江省', '哈尔滨市', '道外区', '\r\n230104', null);
INSERT INTO `sys_city_code` VALUES ('593', '黑龙江省', '哈尔滨市', '太平区', '\r\n230105', null);
INSERT INTO `sys_city_code` VALUES ('594', '黑龙江省', '哈尔滨市', '香坊区', '\r\n230106', null);
INSERT INTO `sys_city_code` VALUES ('595', '黑龙江省', '哈尔滨市', '动力区', '\r\n230107', null);
INSERT INTO `sys_city_code` VALUES ('596', '黑龙江省', '哈尔滨市', '平房区', '\r\n230108', null);
INSERT INTO `sys_city_code` VALUES ('597', '黑龙江省', '哈尔滨市', '呼兰县', '\r\n230121', null);
INSERT INTO `sys_city_code` VALUES ('598', '黑龙江省', '哈尔滨市', '依兰县', '\r\n230123', null);
INSERT INTO `sys_city_code` VALUES ('599', '黑龙江省', '哈尔滨市', '方正县', '\r\n230124', null);
INSERT INTO `sys_city_code` VALUES ('600', '黑龙江省', '哈尔滨市', '宾县', '\r\n230125', null);
INSERT INTO `sys_city_code` VALUES ('601', '黑龙江省', '哈尔滨市', '巴彦县', '\r\n230126', null);
INSERT INTO `sys_city_code` VALUES ('602', '黑龙江省', '哈尔滨市', '木兰县', '\r\n230127', null);
INSERT INTO `sys_city_code` VALUES ('603', '黑龙江省', '哈尔滨市', '通河县', '\r\n230128', null);
INSERT INTO `sys_city_code` VALUES ('604', '黑龙江省', '哈尔滨市', '延寿县', '\r\n230129', null);
INSERT INTO `sys_city_code` VALUES ('605', '黑龙江省', '哈尔滨市', '阿城市', '\r\n230181', null);
INSERT INTO `sys_city_code` VALUES ('606', '黑龙江省', '哈尔滨市', '双城市', '\r\n230182', null);
INSERT INTO `sys_city_code` VALUES ('607', '黑龙江省', '哈尔滨市', '尚志市', '\r\n230183', null);
INSERT INTO `sys_city_code` VALUES ('608', '黑龙江省', '哈尔滨市', '五常市', '\r\n230184', null);
INSERT INTO `sys_city_code` VALUES ('609', '黑龙江省', '齐齐哈尔市', '龙沙区', '\r\n230202', null);
INSERT INTO `sys_city_code` VALUES ('610', '黑龙江省', '齐齐哈尔市', '建华区', '\r\n230203', null);
INSERT INTO `sys_city_code` VALUES ('611', '黑龙江省', '齐齐哈尔市', '铁锋区', '\r\n230204', null);
INSERT INTO `sys_city_code` VALUES ('612', '黑龙江省', '齐齐哈尔市', '昂昂溪区', '\r\n230205', null);
INSERT INTO `sys_city_code` VALUES ('613', '黑龙江省', '齐齐哈尔市', '富拉尔基区', '\r\n230206', null);
INSERT INTO `sys_city_code` VALUES ('614', '黑龙江省', '齐齐哈尔市', '碾子山区', '\r\n230207', null);
INSERT INTO `sys_city_code` VALUES ('615', '黑龙江省', '齐齐哈尔市', '梅里斯达斡尔族区', '\r\n230208', null);
INSERT INTO `sys_city_code` VALUES ('616', '黑龙江省', '齐齐哈尔市', '龙江县', '\r\n230221', null);
INSERT INTO `sys_city_code` VALUES ('617', '黑龙江省', '齐齐哈尔市', '依安县', '\r\n230223', null);
INSERT INTO `sys_city_code` VALUES ('618', '黑龙江省', '齐齐哈尔市', '泰来县', '\r\n230224', null);
INSERT INTO `sys_city_code` VALUES ('619', '黑龙江省', '齐齐哈尔市', '甘南县', '\r\n230225', null);
INSERT INTO `sys_city_code` VALUES ('620', '黑龙江省', '齐齐哈尔市', '富裕县', '\r\n230227', null);
INSERT INTO `sys_city_code` VALUES ('621', '黑龙江省', '齐齐哈尔市', '克山县', '\r\n230229', null);
INSERT INTO `sys_city_code` VALUES ('622', '黑龙江省', '齐齐哈尔市', '克东县', '\r\n230230', null);
INSERT INTO `sys_city_code` VALUES ('623', '黑龙江省', '齐齐哈尔市', '拜泉县', '\r\n230231', null);
INSERT INTO `sys_city_code` VALUES ('624', '黑龙江省', '齐齐哈尔市', '讷河市', '\r\n230281', null);
INSERT INTO `sys_city_code` VALUES ('625', '黑龙江省', '鸡西市', '鸡冠区', '\r\n230302', null);
INSERT INTO `sys_city_code` VALUES ('626', '黑龙江省', '鸡西市', '恒山区', '\r\n230303', null);
INSERT INTO `sys_city_code` VALUES ('627', '黑龙江省', '鸡西市', '滴道区', '\r\n230304', null);
INSERT INTO `sys_city_code` VALUES ('628', '黑龙江省', '鸡西市', '梨树区', '\r\n230305', null);
INSERT INTO `sys_city_code` VALUES ('629', '黑龙江省', '鸡西市', '城子河区', '\r\n230306', null);
INSERT INTO `sys_city_code` VALUES ('630', '黑龙江省', '鸡西市', '麻山区', '\r\n230307', null);
INSERT INTO `sys_city_code` VALUES ('631', '黑龙江省', '鸡西市', '鸡东县', '\r\n230321', null);
INSERT INTO `sys_city_code` VALUES ('632', '黑龙江省', '鸡西市', '虎林市', '\r\n230381', null);
INSERT INTO `sys_city_code` VALUES ('633', '黑龙江省', '鸡西市', '密山市', '\r\n230382', null);
INSERT INTO `sys_city_code` VALUES ('634', '黑龙江省', '鹤岗市', '向阳区', '\r\n230402', null);
INSERT INTO `sys_city_code` VALUES ('635', '黑龙江省', '鹤岗市', '工农区', '\r\n230403', null);
INSERT INTO `sys_city_code` VALUES ('636', '黑龙江省', '鹤岗市', '南山区', '\r\n230404', null);
INSERT INTO `sys_city_code` VALUES ('637', '黑龙江省', '鹤岗市', '兴安区', '\r\n230405', null);
INSERT INTO `sys_city_code` VALUES ('638', '黑龙江省', '鹤岗市', '东山区', '\r\n230406', null);
INSERT INTO `sys_city_code` VALUES ('639', '黑龙江省', '鹤岗市', '兴山区', '\r\n230407', null);
INSERT INTO `sys_city_code` VALUES ('640', '黑龙江省', '鹤岗市', '萝北县', '\r\n230421', null);
INSERT INTO `sys_city_code` VALUES ('641', '黑龙江省', '鹤岗市', '绥滨县', '\r\n230422', null);
INSERT INTO `sys_city_code` VALUES ('642', '黑龙江省', '双鸭山市', '尖山区', '\r\n230502', null);
INSERT INTO `sys_city_code` VALUES ('643', '黑龙江省', '双鸭山市', '岭东区', '\r\n230503', null);
INSERT INTO `sys_city_code` VALUES ('644', '黑龙江省', '双鸭山市', '四方台区', '\r\n230505', null);
INSERT INTO `sys_city_code` VALUES ('645', '黑龙江省', '双鸭山市', '宝山区', '\r\n230506', null);
INSERT INTO `sys_city_code` VALUES ('646', '黑龙江省', '双鸭山市', '集贤县', '\r\n230521', null);
INSERT INTO `sys_city_code` VALUES ('647', '黑龙江省', '双鸭山市', '友谊县', '\r\n230522', null);
INSERT INTO `sys_city_code` VALUES ('648', '黑龙江省', '双鸭山市', '宝清县', '\r\n230523', null);
INSERT INTO `sys_city_code` VALUES ('649', '黑龙江省', '双鸭山市', '饶河县', '\r\n230524', null);
INSERT INTO `sys_city_code` VALUES ('650', '黑龙江省', '大庆市', '萨尔图区', '\r\n230602', null);
INSERT INTO `sys_city_code` VALUES ('651', '黑龙江省', '大庆市', '龙凤区', '\r\n230603', null);
INSERT INTO `sys_city_code` VALUES ('652', '黑龙江省', '大庆市', '让胡路区', '\r\n230604', null);
INSERT INTO `sys_city_code` VALUES ('653', '黑龙江省', '大庆市', '红岗区', '\r\n230605', null);
INSERT INTO `sys_city_code` VALUES ('654', '黑龙江省', '大庆市', '大同区', '\r\n230606', null);
INSERT INTO `sys_city_code` VALUES ('655', '黑龙江省', '大庆市', '肇州县', '\r\n230621', null);
INSERT INTO `sys_city_code` VALUES ('656', '黑龙江省', '大庆市', '肇源县', '\r\n230622', null);
INSERT INTO `sys_city_code` VALUES ('657', '黑龙江省', '大庆市', '林甸县', '\r\n230623', null);
INSERT INTO `sys_city_code` VALUES ('658', '黑龙江省', '大庆市', '杜尔伯特蒙古族自治县', '\r\n230624', null);
INSERT INTO `sys_city_code` VALUES ('659', '黑龙江省', '伊春市', '伊春区', '\r\n230702', null);
INSERT INTO `sys_city_code` VALUES ('660', '黑龙江省', '伊春市', '南岔区', '\r\n230703', null);
INSERT INTO `sys_city_code` VALUES ('661', '黑龙江省', '伊春市', '友好区', '\r\n230704', null);
INSERT INTO `sys_city_code` VALUES ('662', '黑龙江省', '伊春市', '西林区', '\r\n230705', null);
INSERT INTO `sys_city_code` VALUES ('663', '黑龙江省', '伊春市', '翠峦区', '\r\n230706', null);
INSERT INTO `sys_city_code` VALUES ('664', '黑龙江省', '伊春市', '新青区', '\r\n230707', null);
INSERT INTO `sys_city_code` VALUES ('665', '黑龙江省', '伊春市', '美溪区', '\r\n230708', null);
INSERT INTO `sys_city_code` VALUES ('666', '黑龙江省', '伊春市', '金山屯区', '\r\n230709', null);
INSERT INTO `sys_city_code` VALUES ('667', '黑龙江省', '伊春市', '五营区', '\r\n230710', null);
INSERT INTO `sys_city_code` VALUES ('668', '黑龙江省', '伊春市', '乌马河区', '\r\n230711', null);
INSERT INTO `sys_city_code` VALUES ('669', '黑龙江省', '伊春市', '汤旺河区', '\r\n230712', null);
INSERT INTO `sys_city_code` VALUES ('670', '黑龙江省', '伊春市', '带岭区', '\r\n230713', null);
INSERT INTO `sys_city_code` VALUES ('671', '黑龙江省', '伊春市', '乌伊岭区', '\r\n230714', null);
INSERT INTO `sys_city_code` VALUES ('672', '黑龙江省', '伊春市', '红星区', '\r\n230715', null);
INSERT INTO `sys_city_code` VALUES ('673', '黑龙江省', '伊春市', '上甘岭区', '\r\n230716', null);
INSERT INTO `sys_city_code` VALUES ('674', '黑龙江省', '伊春市', '嘉荫县', '\r\n230722', null);
INSERT INTO `sys_city_code` VALUES ('675', '黑龙江省', '伊春市', '铁力市', '\r\n230781', null);
INSERT INTO `sys_city_code` VALUES ('676', '黑龙江省', '佳木斯市', '永红区', '\r\n230802', null);
INSERT INTO `sys_city_code` VALUES ('677', '黑龙江省', '佳木斯市', '向阳区', '\r\n230803', null);
INSERT INTO `sys_city_code` VALUES ('678', '黑龙江省', '佳木斯市', '前进区', '\r\n230804', null);
INSERT INTO `sys_city_code` VALUES ('679', '黑龙江省', '佳木斯市', '东风区', '\r\n230805', null);
INSERT INTO `sys_city_code` VALUES ('680', '黑龙江省', '佳木斯市', '郊区', '\r\n230811', null);
INSERT INTO `sys_city_code` VALUES ('681', '黑龙江省', '佳木斯市', '桦南县', '\r\n230822', null);
INSERT INTO `sys_city_code` VALUES ('682', '黑龙江省', '佳木斯市', '桦川县', '\r\n230826', null);
INSERT INTO `sys_city_code` VALUES ('683', '黑龙江省', '佳木斯市', '汤原县', '\r\n230828', null);
INSERT INTO `sys_city_code` VALUES ('684', '黑龙江省', '佳木斯市', '抚远县', '\r\n230833', null);
INSERT INTO `sys_city_code` VALUES ('685', '黑龙江省', '佳木斯市', '同江市', '\r\n230881', null);
INSERT INTO `sys_city_code` VALUES ('686', '黑龙江省', '佳木斯市', '富锦市', '\r\n230882', null);
INSERT INTO `sys_city_code` VALUES ('687', '黑龙江省', '七台河市', '新兴区', '\r\n230902', null);
INSERT INTO `sys_city_code` VALUES ('688', '黑龙江省', '七台河市', '桃山区', '\r\n230903', null);
INSERT INTO `sys_city_code` VALUES ('689', '黑龙江省', '七台河市', '茄子河区', '\r\n230904', null);
INSERT INTO `sys_city_code` VALUES ('690', '黑龙江省', '七台河市', '勃利县', '\r\n230921', null);
INSERT INTO `sys_city_code` VALUES ('691', '黑龙江省', '牡丹江市', '东安区', '\r\n231002', null);
INSERT INTO `sys_city_code` VALUES ('692', '黑龙江省', '牡丹江市', '阳明区', '\r\n231003', null);
INSERT INTO `sys_city_code` VALUES ('693', '黑龙江省', '牡丹江市', '爱民区', '\r\n231004', null);
INSERT INTO `sys_city_code` VALUES ('694', '黑龙江省', '牡丹江市', '西安区', '\r\n231005', null);
INSERT INTO `sys_city_code` VALUES ('695', '黑龙江省', '牡丹江市', '东宁县', '\r\n231024', null);
INSERT INTO `sys_city_code` VALUES ('696', '黑龙江省', '牡丹江市', '林口县', '\r\n231025', null);
INSERT INTO `sys_city_code` VALUES ('697', '黑龙江省', '牡丹江市', '绥芬河市', '\r\n231081', null);
INSERT INTO `sys_city_code` VALUES ('698', '黑龙江省', '牡丹江市', '海林市', '\r\n231083', null);
INSERT INTO `sys_city_code` VALUES ('699', '黑龙江省', '牡丹江市', '宁安市', '\r\n231084', null);
INSERT INTO `sys_city_code` VALUES ('700', '黑龙江省', '牡丹江市', '穆棱市', '\r\n231085', null);
INSERT INTO `sys_city_code` VALUES ('701', '黑龙江省', '黑河市', '爱辉区', '\r\n231102', null);
INSERT INTO `sys_city_code` VALUES ('702', '黑龙江省', '黑河市', '嫩江县', '\r\n231121', null);
INSERT INTO `sys_city_code` VALUES ('703', '黑龙江省', '黑河市', '逊克县', '\r\n231123', null);
INSERT INTO `sys_city_code` VALUES ('704', '黑龙江省', '黑河市', '孙吴县', '\r\n231124', null);
INSERT INTO `sys_city_code` VALUES ('705', '黑龙江省', '黑河市', '北安市', '\r\n231181', null);
INSERT INTO `sys_city_code` VALUES ('706', '黑龙江省', '黑河市', '五大连池市', '\r\n231182', null);
INSERT INTO `sys_city_code` VALUES ('707', '黑龙江省', '绥化市', '北林区', '\r\n231202', null);
INSERT INTO `sys_city_code` VALUES ('708', '黑龙江省', '绥化市', '望奎县', '\r\n231221', null);
INSERT INTO `sys_city_code` VALUES ('709', '黑龙江省', '绥化市', '兰西县', '\r\n231222', null);
INSERT INTO `sys_city_code` VALUES ('710', '黑龙江省', '绥化市', '青冈县', '\r\n231223', null);
INSERT INTO `sys_city_code` VALUES ('711', '黑龙江省', '绥化市', '庆安县', '\r\n231224', null);
INSERT INTO `sys_city_code` VALUES ('712', '黑龙江省', '绥化市', '明水县', '\r\n231225', null);
INSERT INTO `sys_city_code` VALUES ('713', '黑龙江省', '绥化市', '绥棱县', '\r\n231226', null);
INSERT INTO `sys_city_code` VALUES ('714', '黑龙江省', '绥化市', '安达市', '\r\n231281', null);
INSERT INTO `sys_city_code` VALUES ('715', '黑龙江省', '绥化市', '肇东市', '\r\n231282', null);
INSERT INTO `sys_city_code` VALUES ('716', '黑龙江省', '绥化市', '海伦市', '\r\n231283', null);
INSERT INTO `sys_city_code` VALUES ('717', '黑龙江省', '大兴安岭地区', '加格达奇区', '\r\n232701', null);
INSERT INTO `sys_city_code` VALUES ('718', '黑龙江省', '大兴安岭地区', '呼玛县', '\r\n232721', null);
INSERT INTO `sys_city_code` VALUES ('719', '黑龙江省', '大兴安岭地区', '塔河县', '\r\n232722', null);
INSERT INTO `sys_city_code` VALUES ('720', '黑龙江省', '大兴安岭地区', '漠河县', '\r\n232723', null);
INSERT INTO `sys_city_code` VALUES ('721', '上海市', '上海市', '黄浦区', '\r\n310101', null);
INSERT INTO `sys_city_code` VALUES ('722', '上海市', '上海市', '卢湾区', '\r\n310103', null);
INSERT INTO `sys_city_code` VALUES ('723', '上海市', '上海市', '徐汇区', '\r\n310104', null);
INSERT INTO `sys_city_code` VALUES ('724', '上海市', '上海市', '长宁区', '\r\n310105', null);
INSERT INTO `sys_city_code` VALUES ('725', '上海市', '上海市', '静安区', '\r\n310106', null);
INSERT INTO `sys_city_code` VALUES ('726', '上海市', '上海市', '普陀区', '\r\n310107', null);
INSERT INTO `sys_city_code` VALUES ('727', '上海市', '上海市', '闸北区', '\r\n310108', null);
INSERT INTO `sys_city_code` VALUES ('728', '上海市', '上海市', '虹口区', '\r\n310109', null);
INSERT INTO `sys_city_code` VALUES ('729', '上海市', '上海市', '杨浦区', '\r\n310110', null);
INSERT INTO `sys_city_code` VALUES ('730', '上海市', '上海市', '闵行区', '\r\n310112', null);
INSERT INTO `sys_city_code` VALUES ('731', '上海市', '上海市', '宝山区', '\r\n310113', null);
INSERT INTO `sys_city_code` VALUES ('732', '上海市', '上海市', '嘉定区', '\r\n310114', null);
INSERT INTO `sys_city_code` VALUES ('733', '上海市', '上海市', '浦东新区', '\r\n310115', null);
INSERT INTO `sys_city_code` VALUES ('734', '上海市', '上海市', '金山区', '\r\n310116', null);
INSERT INTO `sys_city_code` VALUES ('735', '上海市', '上海市', '松江区', '\r\n310117', null);
INSERT INTO `sys_city_code` VALUES ('736', '上海市', '上海市', '青浦区', '\r\n310118', null);
INSERT INTO `sys_city_code` VALUES ('737', '上海市', '上海市', '南汇区', '\r\n310119', null);
INSERT INTO `sys_city_code` VALUES ('738', '上海市', '上海市', '奉贤区', '\r\n310120', null);
INSERT INTO `sys_city_code` VALUES ('739', '上海市', '上海市', '崇明县', '\r\n310230', null);
INSERT INTO `sys_city_code` VALUES ('740', '江苏省', '南京市', '玄武区', '\r\n320102', null);
INSERT INTO `sys_city_code` VALUES ('741', '江苏省', '南京市', '白下区', '\r\n320103', null);
INSERT INTO `sys_city_code` VALUES ('742', '江苏省', '南京市', '秦淮区', '\r\n320104', null);
INSERT INTO `sys_city_code` VALUES ('743', '江苏省', '南京市', '建邺区', '\r\n320105', null);
INSERT INTO `sys_city_code` VALUES ('744', '江苏省', '南京市', '鼓楼区', '\r\n320106', null);
INSERT INTO `sys_city_code` VALUES ('745', '江苏省', '南京市', '下关区', '\r\n320107', null);
INSERT INTO `sys_city_code` VALUES ('746', '江苏省', '南京市', '浦口区', '\r\n320111', null);
INSERT INTO `sys_city_code` VALUES ('747', '江苏省', '南京市', '栖霞区', '\r\n320113', null);
INSERT INTO `sys_city_code` VALUES ('748', '江苏省', '南京市', '雨花台区', '\r\n320114', null);
INSERT INTO `sys_city_code` VALUES ('749', '江苏省', '南京市', '江宁区', '\r\n320115', null);
INSERT INTO `sys_city_code` VALUES ('750', '江苏省', '南京市', '六合区', '\r\n320116', null);
INSERT INTO `sys_city_code` VALUES ('751', '江苏省', '南京市', '溧水县', '\r\n320124', null);
INSERT INTO `sys_city_code` VALUES ('752', '江苏省', '南京市', '高淳县', '\r\n320125', null);
INSERT INTO `sys_city_code` VALUES ('753', '江苏省', '无锡市', '崇安区', '\r\n320202', null);
INSERT INTO `sys_city_code` VALUES ('754', '江苏省', '无锡市', '南长区', '\r\n320203', null);
INSERT INTO `sys_city_code` VALUES ('755', '江苏省', '无锡市', '北塘区', '\r\n320204', null);
INSERT INTO `sys_city_code` VALUES ('756', '江苏省', '无锡市', '锡山区', '\r\n320205', null);
INSERT INTO `sys_city_code` VALUES ('757', '江苏省', '无锡市', '惠山区', '\r\n320206', null);
INSERT INTO `sys_city_code` VALUES ('758', '江苏省', '无锡市', '滨湖区', '\r\n320211', null);
INSERT INTO `sys_city_code` VALUES ('759', '江苏省', '无锡市', '江阴市', '\r\n320281', null);
INSERT INTO `sys_city_code` VALUES ('760', '江苏省', '无锡市', '宜兴市', '\r\n320282', null);
INSERT INTO `sys_city_code` VALUES ('761', '江苏省', '徐州市', '鼓楼区', '\r\n320302', null);
INSERT INTO `sys_city_code` VALUES ('762', '江苏省', '徐州市', '云龙区', '\r\n320303', null);
INSERT INTO `sys_city_code` VALUES ('763', '江苏省', '徐州市', '九里区', '\r\n320304', null);
INSERT INTO `sys_city_code` VALUES ('764', '江苏省', '徐州市', '贾汪区', '\r\n320305', null);
INSERT INTO `sys_city_code` VALUES ('765', '江苏省', '徐州市', '泉山区', '\r\n320311', null);
INSERT INTO `sys_city_code` VALUES ('766', '江苏省', '徐州市', '丰县', '\r\n320321', null);
INSERT INTO `sys_city_code` VALUES ('767', '江苏省', '徐州市', '沛县', '\r\n320322', null);
INSERT INTO `sys_city_code` VALUES ('768', '江苏省', '徐州市', '铜山县', '\r\n320323', null);
INSERT INTO `sys_city_code` VALUES ('769', '江苏省', '徐州市', '睢宁县', '\r\n320324', null);
INSERT INTO `sys_city_code` VALUES ('770', '江苏省', '徐州市', '新沂市', '\r\n320381', null);
INSERT INTO `sys_city_code` VALUES ('771', '江苏省', '徐州市', '邳州市', '\r\n320382', null);
INSERT INTO `sys_city_code` VALUES ('772', '江苏省', '常州市', '天宁区', '\r\n320402', null);
INSERT INTO `sys_city_code` VALUES ('773', '江苏省', '常州市', '钟楼区', '\r\n320404', null);
INSERT INTO `sys_city_code` VALUES ('774', '江苏省', '常州市', '戚墅堰区', '\r\n320405', null);
INSERT INTO `sys_city_code` VALUES ('775', '江苏省', '常州市', '新北区', '\r\n320411', null);
INSERT INTO `sys_city_code` VALUES ('776', '江苏省', '常州市', '武进区', '\r\n320412', null);
INSERT INTO `sys_city_code` VALUES ('777', '江苏省', '常州市', '溧阳市', '\r\n320481', null);
INSERT INTO `sys_city_code` VALUES ('778', '江苏省', '常州市', '金坛市', '\r\n320482', null);
INSERT INTO `sys_city_code` VALUES ('779', '江苏省', '苏州市', '沧浪区', '\r\n320502', null);
INSERT INTO `sys_city_code` VALUES ('780', '江苏省', '苏州市', '平江区', '\r\n320503', null);
INSERT INTO `sys_city_code` VALUES ('781', '江苏省', '苏州市', '金阊区', '\r\n320504', null);
INSERT INTO `sys_city_code` VALUES ('782', '江苏省', '苏州市', '虎丘区', '\r\n320505', null);
INSERT INTO `sys_city_code` VALUES ('783', '江苏省', '苏州市', '吴中区', '\r\n320506', null);
INSERT INTO `sys_city_code` VALUES ('784', '江苏省', '苏州市', '相城区', '\r\n320507', null);
INSERT INTO `sys_city_code` VALUES ('785', '江苏省', '苏州市', '常熟市', '\r\n320581', null);
INSERT INTO `sys_city_code` VALUES ('786', '江苏省', '苏州市', '张家港市', '\r\n320582', null);
INSERT INTO `sys_city_code` VALUES ('787', '江苏省', '苏州市', '昆山市', '\r\n320583', null);
INSERT INTO `sys_city_code` VALUES ('788', '江苏省', '苏州市', '吴江市', '\r\n320584', null);
INSERT INTO `sys_city_code` VALUES ('789', '江苏省', '苏州市', '太仓市', '\r\n320585', null);
INSERT INTO `sys_city_code` VALUES ('790', '江苏省', '南通市', '崇川区', '\r\n320602', null);
INSERT INTO `sys_city_code` VALUES ('791', '江苏省', '南通市', '港闸区', '\r\n320611', null);
INSERT INTO `sys_city_code` VALUES ('792', '江苏省', '南通市', '通州区', '\r\n320612', null);
INSERT INTO `sys_city_code` VALUES ('793', '江苏省', '南通市', '海安县', '\r\n320621', null);
INSERT INTO `sys_city_code` VALUES ('794', '江苏省', '南通市', '如东县', '\r\n320623', null);
INSERT INTO `sys_city_code` VALUES ('795', '江苏省', '南通市', '启东市', '\r\n320681', null);
INSERT INTO `sys_city_code` VALUES ('796', '江苏省', '南通市', '如皋市', '\r\n320682', null);
INSERT INTO `sys_city_code` VALUES ('797', '江苏省', '南通市', '通州市', '\r\n320683', null);
INSERT INTO `sys_city_code` VALUES ('798', '江苏省', '南通市', '海门市', '\r\n320684', null);
INSERT INTO `sys_city_code` VALUES ('799', '江苏省', '连云港市', '连云区', '\r\n320703', null);
INSERT INTO `sys_city_code` VALUES ('800', '江苏省', '连云港市', '新浦区', '\r\n320705', null);
INSERT INTO `sys_city_code` VALUES ('801', '江苏省', '连云港市', '海州区', '\r\n320706', null);
INSERT INTO `sys_city_code` VALUES ('802', '江苏省', '连云港市', '赣榆县', '\r\n320721', null);
INSERT INTO `sys_city_code` VALUES ('803', '江苏省', '连云港市', '东海县', '\r\n320722', null);
INSERT INTO `sys_city_code` VALUES ('804', '江苏省', '连云港市', '灌云县', '\r\n320723', null);
INSERT INTO `sys_city_code` VALUES ('805', '江苏省', '连云港市', '灌南县', '\r\n320724', null);
INSERT INTO `sys_city_code` VALUES ('806', '江苏省', '淮安市', '清河区', '\r\n320802', null);
INSERT INTO `sys_city_code` VALUES ('807', '江苏省', '淮安市', '楚州区', '\r\n320803', null);
INSERT INTO `sys_city_code` VALUES ('808', '江苏省', '淮安市', '淮阴区', '\r\n320804', null);
INSERT INTO `sys_city_code` VALUES ('809', '江苏省', '淮安市', '清浦区', '\r\n320811', null);
INSERT INTO `sys_city_code` VALUES ('810', '江苏省', '淮安市', '涟水县', '\r\n320826', null);
INSERT INTO `sys_city_code` VALUES ('811', '江苏省', '淮安市', '洪泽县', '\r\n320829', null);
INSERT INTO `sys_city_code` VALUES ('812', '江苏省', '淮安市', '盱眙县', '\r\n320830', null);
INSERT INTO `sys_city_code` VALUES ('813', '江苏省', '淮安市', '金湖县', '\r\n320831', null);
INSERT INTO `sys_city_code` VALUES ('814', '江苏省', '盐城市', '亭湖区', '\r\n320902', null);
INSERT INTO `sys_city_code` VALUES ('815', '江苏省', '盐城市', '盐都区', '\r\n320903', null);
INSERT INTO `sys_city_code` VALUES ('816', '江苏省', '盐城市', '响水县', '\r\n320921', null);
INSERT INTO `sys_city_code` VALUES ('817', '江苏省', '盐城市', '滨海县', '\r\n320922', null);
INSERT INTO `sys_city_code` VALUES ('818', '江苏省', '盐城市', '阜宁县', '\r\n320923', null);
INSERT INTO `sys_city_code` VALUES ('819', '江苏省', '盐城市', '射阳县', '\r\n320924', null);
INSERT INTO `sys_city_code` VALUES ('820', '江苏省', '盐城市', '建湖县', '\r\n320925', null);
INSERT INTO `sys_city_code` VALUES ('821', '江苏省', '盐城市', '东台市', '\r\n320981', null);
INSERT INTO `sys_city_code` VALUES ('822', '江苏省', '盐城市', '大丰市', '\r\n320982', null);
INSERT INTO `sys_city_code` VALUES ('823', '江苏省', '扬州市', '广陵区', '\r\n321002', null);
INSERT INTO `sys_city_code` VALUES ('824', '江苏省', '扬州市', '邗江区', '\r\n321003', null);
INSERT INTO `sys_city_code` VALUES ('825', '江苏省', '扬州市', '郊区', '\r\n321011', null);
INSERT INTO `sys_city_code` VALUES ('826', '江苏省', '扬州市', '宝应县', '\r\n321023', null);
INSERT INTO `sys_city_code` VALUES ('827', '江苏省', '扬州市', '仪征市', '\r\n321081', null);
INSERT INTO `sys_city_code` VALUES ('828', '江苏省', '扬州市', '高邮市', '\r\n321084', null);
INSERT INTO `sys_city_code` VALUES ('829', '江苏省', '扬州市', '江都市', '\r\n321088', null);
INSERT INTO `sys_city_code` VALUES ('830', '江苏省', '镇江市', '京口区', '\r\n321102', null);
INSERT INTO `sys_city_code` VALUES ('831', '江苏省', '镇江市', '润州区', '\r\n321111', null);
INSERT INTO `sys_city_code` VALUES ('832', '江苏省', '镇江市', '丹徒区', '\r\n321112', null);
INSERT INTO `sys_city_code` VALUES ('833', '江苏省', '镇江市', '丹阳市', '\r\n321181', null);
INSERT INTO `sys_city_code` VALUES ('834', '江苏省', '镇江市', '扬中市', '\r\n321182', null);
INSERT INTO `sys_city_code` VALUES ('835', '江苏省', '镇江市', '句容市', '\r\n321183', null);
INSERT INTO `sys_city_code` VALUES ('836', '江苏省', '泰州市', '海陵区', '\r\n321202', null);
INSERT INTO `sys_city_code` VALUES ('837', '江苏省', '泰州市', '高港区', '\r\n321203', null);
INSERT INTO `sys_city_code` VALUES ('838', '江苏省', '泰州市', '兴化市', '\r\n321281', null);
INSERT INTO `sys_city_code` VALUES ('839', '江苏省', '泰州市', '靖江市', '\r\n321282', null);
INSERT INTO `sys_city_code` VALUES ('840', '江苏省', '泰州市', '泰兴市', '\r\n321283', null);
INSERT INTO `sys_city_code` VALUES ('841', '江苏省', '泰州市', '姜堰市', '\r\n321284', null);
INSERT INTO `sys_city_code` VALUES ('842', '江苏省', '宿迁市', '宿城区', '\r\n321302', null);
INSERT INTO `sys_city_code` VALUES ('843', '江苏省', '宿迁市', '宿豫县', '\r\n321321', null);
INSERT INTO `sys_city_code` VALUES ('844', '江苏省', '宿迁市', '沭阳县', '\r\n321322', null);
INSERT INTO `sys_city_code` VALUES ('845', '江苏省', '宿迁市', '泗阳县', '\r\n321323', null);
INSERT INTO `sys_city_code` VALUES ('846', '江苏省', '宿迁市', '泗洪县', '\r\n321324', null);
INSERT INTO `sys_city_code` VALUES ('847', '浙江省', '杭州市', '上城区', '\r\n330102', null);
INSERT INTO `sys_city_code` VALUES ('848', '浙江省', '杭州市', '下城区', '\r\n330103', null);
INSERT INTO `sys_city_code` VALUES ('849', '浙江省', '杭州市', '江干区', '\r\n330104', null);
INSERT INTO `sys_city_code` VALUES ('850', '浙江省', '杭州市', '拱墅区', '\r\n330105', null);
INSERT INTO `sys_city_code` VALUES ('851', '浙江省', '杭州市', '西湖区', '\r\n330106', null);
INSERT INTO `sys_city_code` VALUES ('852', '浙江省', '杭州市', '滨江区', '\r\n330108', null);
INSERT INTO `sys_city_code` VALUES ('853', '浙江省', '杭州市', '萧山区', '\r\n330109', null);
INSERT INTO `sys_city_code` VALUES ('854', '浙江省', '杭州市', '余杭区', '\r\n330110', null);
INSERT INTO `sys_city_code` VALUES ('855', '浙江省', '杭州市', '桐庐县', '\r\n330122', null);
INSERT INTO `sys_city_code` VALUES ('856', '浙江省', '杭州市', '淳安县', '\r\n330127', null);
INSERT INTO `sys_city_code` VALUES ('857', '浙江省', '杭州市', '建德市', '\r\n330182', null);
INSERT INTO `sys_city_code` VALUES ('858', '浙江省', '杭州市', '富阳市', '\r\n330183', null);
INSERT INTO `sys_city_code` VALUES ('859', '浙江省', '杭州市', '临安市', '\r\n330185', null);
INSERT INTO `sys_city_code` VALUES ('860', '浙江省', '宁波市', '海曙区', '\r\n330203', null);
INSERT INTO `sys_city_code` VALUES ('861', '浙江省', '宁波市', '江东区', '\r\n330204', null);
INSERT INTO `sys_city_code` VALUES ('862', '浙江省', '宁波市', '江北区', '\r\n330205', null);
INSERT INTO `sys_city_code` VALUES ('863', '浙江省', '宁波市', '北仑区', '\r\n330206', null);
INSERT INTO `sys_city_code` VALUES ('864', '浙江省', '宁波市', '镇海区', '\r\n330211', null);
INSERT INTO `sys_city_code` VALUES ('865', '浙江省', '宁波市', '鄞州区', '\r\n330212', null);
INSERT INTO `sys_city_code` VALUES ('866', '浙江省', '宁波市', '象山县', '\r\n330225', null);
INSERT INTO `sys_city_code` VALUES ('867', '浙江省', '宁波市', '宁海县', '\r\n330226', null);
INSERT INTO `sys_city_code` VALUES ('868', '浙江省', '宁波市', '余姚市', '\r\n330281', null);
INSERT INTO `sys_city_code` VALUES ('869', '浙江省', '宁波市', '慈溪市', '\r\n330282', null);
INSERT INTO `sys_city_code` VALUES ('870', '浙江省', '宁波市', '奉化市', '\r\n330283', null);
INSERT INTO `sys_city_code` VALUES ('871', '浙江省', '温州市', '鹿城区', '\r\n330302', null);
INSERT INTO `sys_city_code` VALUES ('872', '浙江省', '温州市', '龙湾区', '\r\n330303', null);
INSERT INTO `sys_city_code` VALUES ('873', '浙江省', '温州市', '瓯海区', '\r\n330304', null);
INSERT INTO `sys_city_code` VALUES ('874', '浙江省', '温州市', '洞头县', '\r\n330322', null);
INSERT INTO `sys_city_code` VALUES ('875', '浙江省', '温州市', '永嘉县', '\r\n330324', null);
INSERT INTO `sys_city_code` VALUES ('876', '浙江省', '温州市', '平阳县', '\r\n330326', null);
INSERT INTO `sys_city_code` VALUES ('877', '浙江省', '温州市', '苍南县', '\r\n330327', null);
INSERT INTO `sys_city_code` VALUES ('878', '浙江省', '温州市', '文成县', '\r\n330328', null);
INSERT INTO `sys_city_code` VALUES ('879', '浙江省', '温州市', '泰顺县', '\r\n330329', null);
INSERT INTO `sys_city_code` VALUES ('880', '浙江省', '温州市', '瑞安市', '\r\n330381', null);
INSERT INTO `sys_city_code` VALUES ('881', '浙江省', '温州市', '乐清市', '\r\n330382', null);
INSERT INTO `sys_city_code` VALUES ('882', '浙江省', '嘉兴市', '秀城区', '\r\n330402', null);
INSERT INTO `sys_city_code` VALUES ('883', '浙江省', '嘉兴市', '秀洲区', '\r\n330411', null);
INSERT INTO `sys_city_code` VALUES ('884', '浙江省', '嘉兴市', '嘉善县', '\r\n330421', null);
INSERT INTO `sys_city_code` VALUES ('885', '浙江省', '嘉兴市', '海盐县', '\r\n330424', null);
INSERT INTO `sys_city_code` VALUES ('886', '浙江省', '嘉兴市', '海宁市', '\r\n330481', null);
INSERT INTO `sys_city_code` VALUES ('887', '浙江省', '嘉兴市', '平湖市', '\r\n330482', null);
INSERT INTO `sys_city_code` VALUES ('888', '浙江省', '嘉兴市', '桐乡市', '\r\n330483', null);
INSERT INTO `sys_city_code` VALUES ('889', '浙江省', '湖州市', '吴兴区', '\r\n330502', null);
INSERT INTO `sys_city_code` VALUES ('890', '浙江省', '湖州市', '南浔区', '\r\n330503', null);
INSERT INTO `sys_city_code` VALUES ('891', '浙江省', '湖州市', '德清县', '\r\n330521', null);
INSERT INTO `sys_city_code` VALUES ('892', '浙江省', '湖州市', '长兴县', '\r\n330522', null);
INSERT INTO `sys_city_code` VALUES ('893', '浙江省', '湖州市', '安吉县', '\r\n330523', null);
INSERT INTO `sys_city_code` VALUES ('894', '浙江省', '绍兴市', '越城区', '\r\n330602', null);
INSERT INTO `sys_city_code` VALUES ('895', '浙江省', '绍兴市', '绍兴县', '\r\n330621', null);
INSERT INTO `sys_city_code` VALUES ('896', '浙江省', '绍兴市', '新昌县', '\r\n330624', null);
INSERT INTO `sys_city_code` VALUES ('897', '浙江省', '绍兴市', '诸暨市', '\r\n330681', null);
INSERT INTO `sys_city_code` VALUES ('898', '浙江省', '绍兴市', '上虞市', '\r\n330682', null);
INSERT INTO `sys_city_code` VALUES ('899', '浙江省', '绍兴市', '嵊州市', '\r\n330683', null);
INSERT INTO `sys_city_code` VALUES ('900', '浙江省', '金华市', '婺城区', '\r\n330702', null);
INSERT INTO `sys_city_code` VALUES ('901', '浙江省', '金华市', '金东区', '\r\n330703', null);
INSERT INTO `sys_city_code` VALUES ('902', '浙江省', '金华市', '武义县', '\r\n330723', null);
INSERT INTO `sys_city_code` VALUES ('903', '浙江省', '金华市', '浦江县', '\r\n330726', null);
INSERT INTO `sys_city_code` VALUES ('904', '浙江省', '金华市', '磐安县', '\r\n330727', null);
INSERT INTO `sys_city_code` VALUES ('905', '浙江省', '金华市', '兰溪市', '\r\n330781', null);
INSERT INTO `sys_city_code` VALUES ('906', '浙江省', '金华市', '义乌市', '\r\n330782', null);
INSERT INTO `sys_city_code` VALUES ('907', '浙江省', '金华市', '东阳市', '\r\n330783', null);
INSERT INTO `sys_city_code` VALUES ('908', '浙江省', '金华市', '永康市', '\r\n330784', null);
INSERT INTO `sys_city_code` VALUES ('909', '浙江省', '衢州市', '柯城区', '\r\n330802', null);
INSERT INTO `sys_city_code` VALUES ('910', '浙江省', '衢州市', '衢江区', '\r\n330803', null);
INSERT INTO `sys_city_code` VALUES ('911', '浙江省', '衢州市', '常山县', '\r\n330822', null);
INSERT INTO `sys_city_code` VALUES ('912', '浙江省', '衢州市', '开化县', '\r\n330824', null);
INSERT INTO `sys_city_code` VALUES ('913', '浙江省', '衢州市', '龙游县', '\r\n330825', null);
INSERT INTO `sys_city_code` VALUES ('914', '浙江省', '衢州市', '江山市', '\r\n330881', null);
INSERT INTO `sys_city_code` VALUES ('915', '浙江省', '舟山市', '定海区', '\r\n330902', null);
INSERT INTO `sys_city_code` VALUES ('916', '浙江省', '舟山市', '普陀区', '\r\n330903', null);
INSERT INTO `sys_city_code` VALUES ('917', '浙江省', '舟山市', '岱山县', '\r\n330921', null);
INSERT INTO `sys_city_code` VALUES ('918', '浙江省', '舟山市', '嵊泗县', '\r\n330922', null);
INSERT INTO `sys_city_code` VALUES ('919', '浙江省', '台州市', '椒江区', '\r\n331002', null);
INSERT INTO `sys_city_code` VALUES ('920', '浙江省', '台州市', '黄岩区', '\r\n331003', null);
INSERT INTO `sys_city_code` VALUES ('921', '浙江省', '台州市', '路桥区', '\r\n331004', null);
INSERT INTO `sys_city_code` VALUES ('922', '浙江省', '台州市', '玉环县', '\r\n331021', null);
INSERT INTO `sys_city_code` VALUES ('923', '浙江省', '台州市', '三门县', '\r\n331022', null);
INSERT INTO `sys_city_code` VALUES ('924', '浙江省', '台州市', '天台县', '\r\n331023', null);
INSERT INTO `sys_city_code` VALUES ('925', '浙江省', '台州市', '仙居县', '\r\n331024', null);
INSERT INTO `sys_city_code` VALUES ('926', '浙江省', '台州市', '温岭市', '\r\n331081', null);
INSERT INTO `sys_city_code` VALUES ('927', '浙江省', '台州市', '临海市', '\r\n331082', null);
INSERT INTO `sys_city_code` VALUES ('928', '浙江省', '丽水市', '莲都区', '\r\n331102', null);
INSERT INTO `sys_city_code` VALUES ('929', '浙江省', '丽水市', '青田县', '\r\n331121', null);
INSERT INTO `sys_city_code` VALUES ('930', '浙江省', '丽水市', '缙云县', '\r\n331122', null);
INSERT INTO `sys_city_code` VALUES ('931', '浙江省', '丽水市', '遂昌县', '\r\n331123', null);
INSERT INTO `sys_city_code` VALUES ('932', '浙江省', '丽水市', '松阳县', '\r\n331124', null);
INSERT INTO `sys_city_code` VALUES ('933', '浙江省', '丽水市', '云和县', '\r\n331125', null);
INSERT INTO `sys_city_code` VALUES ('934', '浙江省', '丽水市', '庆元县', '\r\n331126', null);
INSERT INTO `sys_city_code` VALUES ('935', '浙江省', '丽水市', '景宁畲族自治县', '\r\n331127', null);
INSERT INTO `sys_city_code` VALUES ('936', '浙江省', '丽水市', '龙泉市', '\r\n331181', null);
INSERT INTO `sys_city_code` VALUES ('937', '安徽省', '合肥市', '瑶海区', '\r\n340102', null);
INSERT INTO `sys_city_code` VALUES ('938', '安徽省', '合肥市', '庐阳区', '\r\n340103', null);
INSERT INTO `sys_city_code` VALUES ('939', '安徽省', '合肥市', '蜀山区', '\r\n340104', null);
INSERT INTO `sys_city_code` VALUES ('940', '安徽省', '合肥市', '包河区', '\r\n340111', null);
INSERT INTO `sys_city_code` VALUES ('941', '安徽省', '合肥市', '长丰县', '\r\n340121', null);
INSERT INTO `sys_city_code` VALUES ('942', '安徽省', '合肥市', '肥东县', '\r\n340122', null);
INSERT INTO `sys_city_code` VALUES ('943', '安徽省', '合肥市', '肥西县', '\r\n340123', null);
INSERT INTO `sys_city_code` VALUES ('944', '安徽省', '芜湖市', '镜湖区', '\r\n340202', null);
INSERT INTO `sys_city_code` VALUES ('945', '安徽省', '芜湖市', '马塘区', '\r\n340203', null);
INSERT INTO `sys_city_code` VALUES ('946', '安徽省', '芜湖市', '新芜区', '\r\n340204', null);
INSERT INTO `sys_city_code` VALUES ('947', '安徽省', '芜湖市', '鸠江区', '\r\n340207', null);
INSERT INTO `sys_city_code` VALUES ('948', '安徽省', '芜湖市', '芜湖县', '\r\n340221', null);
INSERT INTO `sys_city_code` VALUES ('949', '安徽省', '芜湖市', '繁昌县', '\r\n340222', null);
INSERT INTO `sys_city_code` VALUES ('950', '安徽省', '芜湖市', '南陵县', '\r\n340223', null);
INSERT INTO `sys_city_code` VALUES ('951', '安徽省', '蚌埠市', '东市区', '\r\n340302', null);
INSERT INTO `sys_city_code` VALUES ('952', '安徽省', '蚌埠市', '中市区', '\r\n340303', null);
INSERT INTO `sys_city_code` VALUES ('953', '安徽省', '蚌埠市', '西市区', '\r\n340304', null);
INSERT INTO `sys_city_code` VALUES ('954', '安徽省', '蚌埠市', '郊区', '\r\n340311', null);
INSERT INTO `sys_city_code` VALUES ('955', '安徽省', '蚌埠市', '怀远县', '\r\n340321', null);
INSERT INTO `sys_city_code` VALUES ('956', '安徽省', '蚌埠市', '五河县', '\r\n340322', null);
INSERT INTO `sys_city_code` VALUES ('957', '安徽省', '蚌埠市', '固镇县', '\r\n340323', null);
INSERT INTO `sys_city_code` VALUES ('958', '安徽省', '淮南市', '大通区', '\r\n340402', null);
INSERT INTO `sys_city_code` VALUES ('959', '安徽省', '淮南市', '田家庵区', '\r\n340403', null);
INSERT INTO `sys_city_code` VALUES ('960', '安徽省', '淮南市', '谢家集区', '\r\n340404', null);
INSERT INTO `sys_city_code` VALUES ('961', '安徽省', '淮南市', '八公山区', '\r\n340405', null);
INSERT INTO `sys_city_code` VALUES ('962', '安徽省', '淮南市', '潘集区', '\r\n340406', null);
INSERT INTO `sys_city_code` VALUES ('963', '安徽省', '淮南市', '凤台县', '\r\n340421', null);
INSERT INTO `sys_city_code` VALUES ('964', '安徽省', '马鞍山市', '金家庄区', '\r\n340502', null);
INSERT INTO `sys_city_code` VALUES ('965', '安徽省', '马鞍山市', '花山区', '\r\n340503', null);
INSERT INTO `sys_city_code` VALUES ('966', '安徽省', '马鞍山市', '雨山区', '\r\n340504', null);
INSERT INTO `sys_city_code` VALUES ('967', '安徽省', '马鞍山市', '当涂县', '\r\n340521', null);
INSERT INTO `sys_city_code` VALUES ('968', '安徽省', '淮北市', '杜集区', '\r\n340602', null);
INSERT INTO `sys_city_code` VALUES ('969', '安徽省', '淮北市', '相山区', '\r\n340603', null);
INSERT INTO `sys_city_code` VALUES ('970', '安徽省', '淮北市', '烈山区', '\r\n340604', null);
INSERT INTO `sys_city_code` VALUES ('971', '安徽省', '淮北市', '濉溪县', '\r\n340621', null);
INSERT INTO `sys_city_code` VALUES ('972', '安徽省', '铜陵市', '铜官山区', '\r\n340702', null);
INSERT INTO `sys_city_code` VALUES ('973', '安徽省', '铜陵市', '狮子山区', '\r\n340703', null);
INSERT INTO `sys_city_code` VALUES ('974', '安徽省', '铜陵市', '郊区', '\r\n340711', null);
INSERT INTO `sys_city_code` VALUES ('975', '安徽省', '铜陵市', '铜陵县', '\r\n340721', null);
INSERT INTO `sys_city_code` VALUES ('976', '安徽省', '安庆市', '迎江区', '\r\n340802', null);
INSERT INTO `sys_city_code` VALUES ('977', '安徽省', '安庆市', '大观区', '\r\n340803', null);
INSERT INTO `sys_city_code` VALUES ('978', '安徽省', '安庆市', '郊区', '\r\n340811', null);
INSERT INTO `sys_city_code` VALUES ('979', '安徽省', '安庆市', '怀宁县', '\r\n340822', null);
INSERT INTO `sys_city_code` VALUES ('980', '安徽省', '安庆市', '枞阳县', '\r\n340823', null);
INSERT INTO `sys_city_code` VALUES ('981', '安徽省', '安庆市', '潜山县', '\r\n340824', null);
INSERT INTO `sys_city_code` VALUES ('982', '安徽省', '安庆市', '太湖县', '\r\n340825', null);
INSERT INTO `sys_city_code` VALUES ('983', '安徽省', '安庆市', '宿松县', '\r\n340826', null);
INSERT INTO `sys_city_code` VALUES ('984', '安徽省', '安庆市', '望江县', '\r\n340827', null);
INSERT INTO `sys_city_code` VALUES ('985', '安徽省', '安庆市', '岳西县', '\r\n340828', null);
INSERT INTO `sys_city_code` VALUES ('986', '安徽省', '安庆市', '桐城市', '\r\n340881', null);
INSERT INTO `sys_city_code` VALUES ('987', '安徽省', '黄山市', '屯溪区', '\r\n341002', null);
INSERT INTO `sys_city_code` VALUES ('988', '安徽省', '黄山市', '黄山区', '\r\n341003', null);
INSERT INTO `sys_city_code` VALUES ('989', '安徽省', '黄山市', '徽州区', '\r\n341004', null);
INSERT INTO `sys_city_code` VALUES ('990', '安徽省', '黄山市', '歙县', '\r\n341021', null);
INSERT INTO `sys_city_code` VALUES ('991', '安徽省', '黄山市', '休宁县', '\r\n341022', null);
INSERT INTO `sys_city_code` VALUES ('992', '安徽省', '黄山市', '黟县', '\r\n341023', null);
INSERT INTO `sys_city_code` VALUES ('993', '安徽省', '黄山市', '祁门县', '\r\n341024', null);
INSERT INTO `sys_city_code` VALUES ('994', '安徽省', '滁州市', '琅琊区', '\r\n341102', null);
INSERT INTO `sys_city_code` VALUES ('995', '安徽省', '滁州市', '南谯区', '\r\n341103', null);
INSERT INTO `sys_city_code` VALUES ('996', '安徽省', '滁州市', '来安县', '\r\n341122', null);
INSERT INTO `sys_city_code` VALUES ('997', '安徽省', '滁州市', '全椒县', '\r\n341124', null);
INSERT INTO `sys_city_code` VALUES ('998', '安徽省', '滁州市', '定远县', '\r\n341125', null);
INSERT INTO `sys_city_code` VALUES ('999', '安徽省', '滁州市', '凤阳县', '\r\n341126', null);
INSERT INTO `sys_city_code` VALUES ('1000', '安徽省', '滁州市', '天长市', '\r\n341181', null);
INSERT INTO `sys_city_code` VALUES ('1001', '安徽省', '滁州市', '明光市', '\r\n341182', null);
INSERT INTO `sys_city_code` VALUES ('1002', '安徽省', '阜阳市', '颍州区', '\r\n341202', null);
INSERT INTO `sys_city_code` VALUES ('1003', '安徽省', '阜阳市', '颍东区', '\r\n341203', null);
INSERT INTO `sys_city_code` VALUES ('1004', '安徽省', '阜阳市', '颍泉区', '\r\n341204', null);
INSERT INTO `sys_city_code` VALUES ('1005', '安徽省', '阜阳市', '临泉县', '\r\n341221', null);
INSERT INTO `sys_city_code` VALUES ('1006', '安徽省', '阜阳市', '太和县', '\r\n341222', null);
INSERT INTO `sys_city_code` VALUES ('1007', '安徽省', '阜阳市', '阜南县', '\r\n341225', null);
INSERT INTO `sys_city_code` VALUES ('1008', '安徽省', '阜阳市', '颍上县', '\r\n341226', null);
INSERT INTO `sys_city_code` VALUES ('1009', '安徽省', '阜阳市', '界首市', '\r\n341282', null);
INSERT INTO `sys_city_code` VALUES ('1010', '安徽省', '宿州市', '墉桥区', '\r\n341302', null);
INSERT INTO `sys_city_code` VALUES ('1011', '安徽省', '宿州市', '砀山县', '\r\n341321', null);
INSERT INTO `sys_city_code` VALUES ('1012', '安徽省', '宿州市', '萧县', '\r\n341322', null);
INSERT INTO `sys_city_code` VALUES ('1013', '安徽省', '宿州市', '灵璧县', '\r\n341323', null);
INSERT INTO `sys_city_code` VALUES ('1014', '安徽省', '宿州市', '泗县', '\r\n341324', null);
INSERT INTO `sys_city_code` VALUES ('1015', '安徽省', '巢湖市', '居巢区', '\r\n341402', null);
INSERT INTO `sys_city_code` VALUES ('1016', '安徽省', '巢湖市', '庐江县', '\r\n341421', null);
INSERT INTO `sys_city_code` VALUES ('1017', '安徽省', '巢湖市', '无为县', '\r\n341422', null);
INSERT INTO `sys_city_code` VALUES ('1018', '安徽省', '巢湖市', '含山县', '\r\n341423', null);
INSERT INTO `sys_city_code` VALUES ('1019', '安徽省', '巢湖市', '和县', '\r\n341424', null);
INSERT INTO `sys_city_code` VALUES ('1020', '安徽省', '六安市', '金安区', '\r\n341502', null);
INSERT INTO `sys_city_code` VALUES ('1021', '安徽省', '六安市', '裕安区', '\r\n341503', null);
INSERT INTO `sys_city_code` VALUES ('1022', '安徽省', '六安市', '寿县', '\r\n341521', null);
INSERT INTO `sys_city_code` VALUES ('1023', '安徽省', '六安市', '霍邱县', '\r\n341522', null);
INSERT INTO `sys_city_code` VALUES ('1024', '安徽省', '六安市', '舒城县', '\r\n341523', null);
INSERT INTO `sys_city_code` VALUES ('1025', '安徽省', '六安市', '金寨县', '\r\n341524', null);
INSERT INTO `sys_city_code` VALUES ('1026', '安徽省', '六安市', '霍山县', '\r\n341525', null);
INSERT INTO `sys_city_code` VALUES ('1027', '安徽省', '亳州市', '谯城区', '\r\n341602', null);
INSERT INTO `sys_city_code` VALUES ('1028', '安徽省', '亳州市', '涡阳县', '\r\n341621', null);
INSERT INTO `sys_city_code` VALUES ('1029', '安徽省', '亳州市', '蒙城县', '\r\n341622', null);
INSERT INTO `sys_city_code` VALUES ('1030', '安徽省', '亳州市', '利辛县', '\r\n341623', null);
INSERT INTO `sys_city_code` VALUES ('1031', '安徽省', '池州市', '贵池区', '\r\n341702', null);
INSERT INTO `sys_city_code` VALUES ('1032', '安徽省', '池州市', '东至县', '\r\n341721', null);
INSERT INTO `sys_city_code` VALUES ('1033', '安徽省', '池州市', '石台县', '\r\n341722', null);
INSERT INTO `sys_city_code` VALUES ('1034', '安徽省', '池州市', '青阳县', '\r\n341723', null);
INSERT INTO `sys_city_code` VALUES ('1035', '安徽省', '宣城市', '宣州区', '\r\n341802', null);
INSERT INTO `sys_city_code` VALUES ('1036', '安徽省', '宣城市', '郎溪县', '\r\n341821', null);
INSERT INTO `sys_city_code` VALUES ('1037', '安徽省', '宣城市', '广德县', '\r\n341822', null);
INSERT INTO `sys_city_code` VALUES ('1038', '安徽省', '宣城市', '泾县', '\r\n341823', null);
INSERT INTO `sys_city_code` VALUES ('1039', '安徽省', '宣城市', '绩溪县', '\r\n341824', null);
INSERT INTO `sys_city_code` VALUES ('1040', '安徽省', '宣城市', '旌德县', '\r\n341825', null);
INSERT INTO `sys_city_code` VALUES ('1041', '安徽省', '宣城市', '宁国市', '\r\n341881', null);
INSERT INTO `sys_city_code` VALUES ('1042', '福建省', '福州市', '鼓楼区', '\r\n350102', null);
INSERT INTO `sys_city_code` VALUES ('1043', '福建省', '福州市', '台江区', '\r\n350103', null);
INSERT INTO `sys_city_code` VALUES ('1044', '福建省', '福州市', '仓山区', '\r\n350104', null);
INSERT INTO `sys_city_code` VALUES ('1045', '福建省', '福州市', '马尾区', '\r\n350105', null);
INSERT INTO `sys_city_code` VALUES ('1046', '福建省', '福州市', '晋安区', '\r\n350111', null);
INSERT INTO `sys_city_code` VALUES ('1047', '福建省', '福州市', '闽侯县', '\r\n350121', null);
INSERT INTO `sys_city_code` VALUES ('1048', '福建省', '福州市', '连江县', '\r\n350122', null);
INSERT INTO `sys_city_code` VALUES ('1049', '福建省', '福州市', '罗源县', '\r\n350123', null);
INSERT INTO `sys_city_code` VALUES ('1050', '福建省', '福州市', '闽清县', '\r\n350124', null);
INSERT INTO `sys_city_code` VALUES ('1051', '福建省', '福州市', '永泰县', '\r\n350125', null);
INSERT INTO `sys_city_code` VALUES ('1052', '福建省', '福州市', '平潭县', '\r\n350128', null);
INSERT INTO `sys_city_code` VALUES ('1053', '福建省', '福州市', '福清市', '\r\n350181', null);
INSERT INTO `sys_city_code` VALUES ('1054', '福建省', '福州市', '长乐市', '\r\n350182', null);
INSERT INTO `sys_city_code` VALUES ('1055', '福建省', '厦门市', '思明区', '\r\n350203', null);
INSERT INTO `sys_city_code` VALUES ('1056', '福建省', '厦门市', '海沧区', '\r\n350205', null);
INSERT INTO `sys_city_code` VALUES ('1057', '福建省', '厦门市', '湖里区', '\r\n350206', null);
INSERT INTO `sys_city_code` VALUES ('1058', '福建省', '厦门市', '集美区', '\r\n350211', null);
INSERT INTO `sys_city_code` VALUES ('1059', '福建省', '厦门市', '同安区', '\r\n350212', null);
INSERT INTO `sys_city_code` VALUES ('1060', '福建省', '厦门市', '翔安区', '\r\n350213', null);
INSERT INTO `sys_city_code` VALUES ('1061', '福建省', '莆田市', '城厢区', '\r\n350302', null);
INSERT INTO `sys_city_code` VALUES ('1062', '福建省', '莆田市', '涵江区', '\r\n350303', null);
INSERT INTO `sys_city_code` VALUES ('1063', '福建省', '莆田市', '荔城区', '\r\n350304', null);
INSERT INTO `sys_city_code` VALUES ('1064', '福建省', '莆田市', '秀屿区', '\r\n350305', null);
INSERT INTO `sys_city_code` VALUES ('1065', '福建省', '莆田市', '仙游县', '\r\n350322', null);
INSERT INTO `sys_city_code` VALUES ('1066', '福建省', '三明市', '梅列区', '\r\n350402', null);
INSERT INTO `sys_city_code` VALUES ('1067', '福建省', '三明市', '三元区', '\r\n350403', null);
INSERT INTO `sys_city_code` VALUES ('1068', '福建省', '三明市', '明溪县', '\r\n350421', null);
INSERT INTO `sys_city_code` VALUES ('1069', '福建省', '三明市', '清流县', '\r\n350423', null);
INSERT INTO `sys_city_code` VALUES ('1070', '福建省', '三明市', '宁化县', '\r\n350424', null);
INSERT INTO `sys_city_code` VALUES ('1071', '福建省', '三明市', '大田县', '\r\n350425', null);
INSERT INTO `sys_city_code` VALUES ('1072', '福建省', '三明市', '尤溪县', '\r\n350426', null);
INSERT INTO `sys_city_code` VALUES ('1073', '福建省', '三明市', '沙县', '\r\n350427', null);
INSERT INTO `sys_city_code` VALUES ('1074', '福建省', '三明市', '将乐县', '\r\n350428', null);
INSERT INTO `sys_city_code` VALUES ('1075', '福建省', '三明市', '泰宁县', '\r\n350429', null);
INSERT INTO `sys_city_code` VALUES ('1076', '福建省', '三明市', '建宁县', '\r\n350430', null);
INSERT INTO `sys_city_code` VALUES ('1077', '福建省', '三明市', '永安市', '\r\n350481', null);
INSERT INTO `sys_city_code` VALUES ('1078', '福建省', '泉州市', '鲤城区', '\r\n350502', null);
INSERT INTO `sys_city_code` VALUES ('1079', '福建省', '泉州市', '丰泽区', '\r\n350503', null);
INSERT INTO `sys_city_code` VALUES ('1080', '福建省', '泉州市', '洛江区', '\r\n350504', null);
INSERT INTO `sys_city_code` VALUES ('1081', '福建省', '泉州市', '泉港区', '\r\n350505', null);
INSERT INTO `sys_city_code` VALUES ('1082', '福建省', '泉州市', '惠安县', '\r\n350521', null);
INSERT INTO `sys_city_code` VALUES ('1083', '福建省', '泉州市', '安溪县', '\r\n350524', null);
INSERT INTO `sys_city_code` VALUES ('1084', '福建省', '泉州市', '永春县', '\r\n350525', null);
INSERT INTO `sys_city_code` VALUES ('1085', '福建省', '泉州市', '德化县', '\r\n350526', null);
INSERT INTO `sys_city_code` VALUES ('1086', '福建省', '泉州市', '金门县', '\r\n350527', null);
INSERT INTO `sys_city_code` VALUES ('1087', '福建省', '泉州市', '石狮市', '\r\n350581', null);
INSERT INTO `sys_city_code` VALUES ('1088', '福建省', '泉州市', '晋江市', '\r\n350582', null);
INSERT INTO `sys_city_code` VALUES ('1089', '福建省', '泉州市', '南安市', '\r\n350583', null);
INSERT INTO `sys_city_code` VALUES ('1090', '福建省', '漳州市', '芗城区', '\r\n350602', null);
INSERT INTO `sys_city_code` VALUES ('1091', '福建省', '漳州市', '龙文区', '\r\n350603', null);
INSERT INTO `sys_city_code` VALUES ('1092', '福建省', '漳州市', '云霄县', '\r\n350622', null);
INSERT INTO `sys_city_code` VALUES ('1093', '福建省', '漳州市', '漳浦县', '\r\n350623', null);
INSERT INTO `sys_city_code` VALUES ('1094', '福建省', '漳州市', '诏安县', '\r\n350624', null);
INSERT INTO `sys_city_code` VALUES ('1095', '福建省', '漳州市', '长泰县', '\r\n350625', null);
INSERT INTO `sys_city_code` VALUES ('1096', '福建省', '漳州市', '东山县', '\r\n350626', null);
INSERT INTO `sys_city_code` VALUES ('1097', '福建省', '漳州市', '南靖县', '\r\n350627', null);
INSERT INTO `sys_city_code` VALUES ('1098', '福建省', '漳州市', '平和县', '\r\n350628', null);
INSERT INTO `sys_city_code` VALUES ('1099', '福建省', '漳州市', '华安县', '\r\n350629', null);
INSERT INTO `sys_city_code` VALUES ('1100', '福建省', '漳州市', '龙海市', '\r\n350681', null);
INSERT INTO `sys_city_code` VALUES ('1101', '福建省', '南平市', '延平区', '\r\n350702', null);
INSERT INTO `sys_city_code` VALUES ('1102', '福建省', '南平市', '顺昌县', '\r\n350721', null);
INSERT INTO `sys_city_code` VALUES ('1103', '福建省', '南平市', '浦城县', '\r\n350722', null);
INSERT INTO `sys_city_code` VALUES ('1104', '福建省', '南平市', '光泽县', '\r\n350723', null);
INSERT INTO `sys_city_code` VALUES ('1105', '福建省', '南平市', '松溪县', '\r\n350724', null);
INSERT INTO `sys_city_code` VALUES ('1106', '福建省', '南平市', '政和县', '\r\n350725', null);
INSERT INTO `sys_city_code` VALUES ('1107', '福建省', '南平市', '邵武市', '\r\n350781', null);
INSERT INTO `sys_city_code` VALUES ('1108', '福建省', '南平市', '武夷山市', '\r\n350782', null);
INSERT INTO `sys_city_code` VALUES ('1109', '福建省', '南平市', '建瓯市', '\r\n350783', null);
INSERT INTO `sys_city_code` VALUES ('1110', '福建省', '南平市', '建阳市', '\r\n350784', null);
INSERT INTO `sys_city_code` VALUES ('1111', '福建省', '龙岩市', '新罗区', '\r\n350802', null);
INSERT INTO `sys_city_code` VALUES ('1112', '福建省', '龙岩市', '长汀县', '\r\n350821', null);
INSERT INTO `sys_city_code` VALUES ('1113', '福建省', '龙岩市', '永定县', '\r\n350822', null);
INSERT INTO `sys_city_code` VALUES ('1114', '福建省', '龙岩市', '上杭县', '\r\n350823', null);
INSERT INTO `sys_city_code` VALUES ('1115', '福建省', '龙岩市', '武平县', '\r\n350824', null);
INSERT INTO `sys_city_code` VALUES ('1116', '福建省', '龙岩市', '连城县', '\r\n350825', null);
INSERT INTO `sys_city_code` VALUES ('1117', '福建省', '龙岩市', '漳平市', '\r\n350881', null);
INSERT INTO `sys_city_code` VALUES ('1118', '福建省', '宁德市', '蕉城区', '\r\n350902', null);
INSERT INTO `sys_city_code` VALUES ('1119', '福建省', '宁德市', '霞浦县', '\r\n350921', null);
INSERT INTO `sys_city_code` VALUES ('1120', '福建省', '宁德市', '古田县', '\r\n350922', null);
INSERT INTO `sys_city_code` VALUES ('1121', '福建省', '宁德市', '屏南县', '\r\n350923', null);
INSERT INTO `sys_city_code` VALUES ('1122', '福建省', '宁德市', '寿宁县', '\r\n350924', null);
INSERT INTO `sys_city_code` VALUES ('1123', '福建省', '宁德市', '周宁县', '\r\n350925', null);
INSERT INTO `sys_city_code` VALUES ('1124', '福建省', '宁德市', '柘荣县', '\r\n350926', null);
INSERT INTO `sys_city_code` VALUES ('1125', '福建省', '宁德市', '福安市', '\r\n350981', null);
INSERT INTO `sys_city_code` VALUES ('1126', '福建省', '宁德市', '福鼎市', '\r\n350982', null);
INSERT INTO `sys_city_code` VALUES ('1127', '江西省', '南昌市', '东湖区', '\r\n360102', null);
INSERT INTO `sys_city_code` VALUES ('1128', '江西省', '南昌市', '西湖区', '\r\n360103', null);
INSERT INTO `sys_city_code` VALUES ('1129', '江西省', '南昌市', '青云谱区', '\r\n360104', null);
INSERT INTO `sys_city_code` VALUES ('1130', '江西省', '南昌市', '湾里区', '\r\n360105', null);
INSERT INTO `sys_city_code` VALUES ('1131', '江西省', '南昌市', '青山湖区', '\r\n360111', null);
INSERT INTO `sys_city_code` VALUES ('1132', '江西省', '南昌市', '南昌县', '\r\n360121', null);
INSERT INTO `sys_city_code` VALUES ('1133', '江西省', '南昌市', '新建县', '\r\n360122', null);
INSERT INTO `sys_city_code` VALUES ('1134', '江西省', '南昌市', '安义县', '\r\n360123', null);
INSERT INTO `sys_city_code` VALUES ('1135', '江西省', '南昌市', '进贤县', '\r\n360124', null);
INSERT INTO `sys_city_code` VALUES ('1136', '江西省', '景德镇市', '昌江区', '\r\n360202', null);
INSERT INTO `sys_city_code` VALUES ('1137', '江西省', '景德镇市', '珠山区', '\r\n360203', null);
INSERT INTO `sys_city_code` VALUES ('1138', '江西省', '景德镇市', '浮梁县', '\r\n360222', null);
INSERT INTO `sys_city_code` VALUES ('1139', '江西省', '景德镇市', '乐平市', '\r\n360281', null);
INSERT INTO `sys_city_code` VALUES ('1140', '江西省', '萍乡市', '安源区', '\r\n360302', null);
INSERT INTO `sys_city_code` VALUES ('1141', '江西省', '萍乡市', '湘东区', '\r\n360313', null);
INSERT INTO `sys_city_code` VALUES ('1142', '江西省', '萍乡市', '莲花县', '\r\n360321', null);
INSERT INTO `sys_city_code` VALUES ('1143', '江西省', '萍乡市', '上栗县', '\r\n360322', null);
INSERT INTO `sys_city_code` VALUES ('1144', '江西省', '萍乡市', '芦溪县', '\r\n360323', null);
INSERT INTO `sys_city_code` VALUES ('1145', '江西省', '九江市', '庐山区', '\r\n360402', null);
INSERT INTO `sys_city_code` VALUES ('1146', '江西省', '九江市', '浔阳区', '\r\n360403', null);
INSERT INTO `sys_city_code` VALUES ('1147', '江西省', '九江市', '九江县', '\r\n360421', null);
INSERT INTO `sys_city_code` VALUES ('1148', '江西省', '九江市', '武宁县', '\r\n360423', null);
INSERT INTO `sys_city_code` VALUES ('1149', '江西省', '九江市', '修水县', '\r\n360424', null);
INSERT INTO `sys_city_code` VALUES ('1150', '江西省', '九江市', '永修县', '\r\n360425', null);
INSERT INTO `sys_city_code` VALUES ('1151', '江西省', '九江市', '德安县', '\r\n360426', null);
INSERT INTO `sys_city_code` VALUES ('1152', '江西省', '九江市', '星子县', '\r\n360427', null);
INSERT INTO `sys_city_code` VALUES ('1153', '江西省', '九江市', '都昌县', '\r\n360428', null);
INSERT INTO `sys_city_code` VALUES ('1154', '江西省', '九江市', '湖口县', '\r\n360429', null);
INSERT INTO `sys_city_code` VALUES ('1155', '江西省', '九江市', '彭泽县', '\r\n360430', null);
INSERT INTO `sys_city_code` VALUES ('1156', '江西省', '九江市', '瑞昌市', '\r\n360481', null);
INSERT INTO `sys_city_code` VALUES ('1157', '江西省', '新余市', '渝水区', '\r\n360502', null);
INSERT INTO `sys_city_code` VALUES ('1158', '江西省', '新余市', '分宜县', '\r\n360521', null);
INSERT INTO `sys_city_code` VALUES ('1159', '江西省', '鹰潭市', '月湖区', '\r\n360602', null);
INSERT INTO `sys_city_code` VALUES ('1160', '江西省', '鹰潭市', '余江县', '\r\n360622', null);
INSERT INTO `sys_city_code` VALUES ('1161', '江西省', '鹰潭市', '贵溪市', '\r\n360681', null);
INSERT INTO `sys_city_code` VALUES ('1162', '江西省', '赣州市', '章贡区', '\r\n360702', null);
INSERT INTO `sys_city_code` VALUES ('1163', '江西省', '赣州市', '赣县', '\r\n360721', null);
INSERT INTO `sys_city_code` VALUES ('1164', '江西省', '赣州市', '信丰县', '\r\n360722', null);
INSERT INTO `sys_city_code` VALUES ('1165', '江西省', '赣州市', '大余县', '\r\n360723', null);
INSERT INTO `sys_city_code` VALUES ('1166', '江西省', '赣州市', '上犹县', '\r\n360724', null);
INSERT INTO `sys_city_code` VALUES ('1167', '江西省', '赣州市', '崇义县', '\r\n360725', null);
INSERT INTO `sys_city_code` VALUES ('1168', '江西省', '赣州市', '安远县', '\r\n360726', null);
INSERT INTO `sys_city_code` VALUES ('1169', '江西省', '赣州市', '龙南县', '\r\n360727', null);
INSERT INTO `sys_city_code` VALUES ('1170', '江西省', '赣州市', '定南县', '\r\n360728', null);
INSERT INTO `sys_city_code` VALUES ('1171', '江西省', '赣州市', '全南县', '\r\n360729', null);
INSERT INTO `sys_city_code` VALUES ('1172', '江西省', '赣州市', '宁都县', '\r\n360730', null);
INSERT INTO `sys_city_code` VALUES ('1173', '江西省', '赣州市', '于都县', '\r\n360731', null);
INSERT INTO `sys_city_code` VALUES ('1174', '江西省', '赣州市', '兴国县', '\r\n360732', null);
INSERT INTO `sys_city_code` VALUES ('1175', '江西省', '赣州市', '会昌县', '\r\n360733', null);
INSERT INTO `sys_city_code` VALUES ('1176', '江西省', '赣州市', '寻乌县', '\r\n360734', null);
INSERT INTO `sys_city_code` VALUES ('1177', '江西省', '赣州市', '石城县', '\r\n360735', null);
INSERT INTO `sys_city_code` VALUES ('1178', '江西省', '赣州市', '瑞金市', '\r\n360781', null);
INSERT INTO `sys_city_code` VALUES ('1179', '江西省', '赣州市', '南康市', '\r\n360782', null);
INSERT INTO `sys_city_code` VALUES ('1180', '江西省', '吉安市', '吉州区', '\r\n360802', null);
INSERT INTO `sys_city_code` VALUES ('1181', '江西省', '吉安市', '青原区', '\r\n360803', null);
INSERT INTO `sys_city_code` VALUES ('1182', '江西省', '吉安市', '吉安县', '\r\n360821', null);
INSERT INTO `sys_city_code` VALUES ('1183', '江西省', '吉安市', '吉水县', '\r\n360822', null);
INSERT INTO `sys_city_code` VALUES ('1184', '江西省', '吉安市', '峡江县', '\r\n360823', null);
INSERT INTO `sys_city_code` VALUES ('1185', '江西省', '吉安市', '新干县', '\r\n360824', null);
INSERT INTO `sys_city_code` VALUES ('1186', '江西省', '吉安市', '永丰县', '\r\n360825', null);
INSERT INTO `sys_city_code` VALUES ('1187', '江西省', '吉安市', '泰和县', '\r\n360826', null);
INSERT INTO `sys_city_code` VALUES ('1188', '江西省', '吉安市', '遂川县', '\r\n360827', null);
INSERT INTO `sys_city_code` VALUES ('1189', '江西省', '吉安市', '万安县', '\r\n360828', null);
INSERT INTO `sys_city_code` VALUES ('1190', '江西省', '吉安市', '安福县', '\r\n360829', null);
INSERT INTO `sys_city_code` VALUES ('1191', '江西省', '吉安市', '永新县', '\r\n360830', null);
INSERT INTO `sys_city_code` VALUES ('1192', '江西省', '吉安市', '井冈山市', '\r\n360881', null);
INSERT INTO `sys_city_code` VALUES ('1193', '江西省', '宜春市', '袁州区', '\r\n360902', null);
INSERT INTO `sys_city_code` VALUES ('1194', '江西省', '宜春市', '奉新县', '\r\n360921', null);
INSERT INTO `sys_city_code` VALUES ('1195', '江西省', '宜春市', '万载县', '\r\n360922', null);
INSERT INTO `sys_city_code` VALUES ('1196', '江西省', '宜春市', '上高县', '\r\n360923', null);
INSERT INTO `sys_city_code` VALUES ('1197', '江西省', '宜春市', '宜丰县', '\r\n360924', null);
INSERT INTO `sys_city_code` VALUES ('1198', '江西省', '宜春市', '靖安县', '\r\n360925', null);
INSERT INTO `sys_city_code` VALUES ('1199', '江西省', '宜春市', '铜鼓县', '\r\n360926', null);
INSERT INTO `sys_city_code` VALUES ('1200', '江西省', '宜春市', '丰城市', '\r\n360981', null);
INSERT INTO `sys_city_code` VALUES ('1201', '江西省', '宜春市', '樟树市', '\r\n360982', null);
INSERT INTO `sys_city_code` VALUES ('1202', '江西省', '宜春市', '高安市', '\r\n360983', null);
INSERT INTO `sys_city_code` VALUES ('1203', '江西省', '抚州市', '临川区', '\r\n361002', null);
INSERT INTO `sys_city_code` VALUES ('1204', '江西省', '抚州市', '南城县', '\r\n361021', null);
INSERT INTO `sys_city_code` VALUES ('1205', '江西省', '抚州市', '黎川县', '\r\n361022', null);
INSERT INTO `sys_city_code` VALUES ('1206', '江西省', '抚州市', '南丰县', '\r\n361023', null);
INSERT INTO `sys_city_code` VALUES ('1207', '江西省', '抚州市', '崇仁县', '\r\n361024', null);
INSERT INTO `sys_city_code` VALUES ('1208', '江西省', '抚州市', '乐安县', '\r\n361025', null);
INSERT INTO `sys_city_code` VALUES ('1209', '江西省', '抚州市', '宜黄县', '\r\n361026', null);
INSERT INTO `sys_city_code` VALUES ('1210', '江西省', '抚州市', '金溪县', '\r\n361027', null);
INSERT INTO `sys_city_code` VALUES ('1211', '江西省', '抚州市', '资溪县', '\r\n361028', null);
INSERT INTO `sys_city_code` VALUES ('1212', '江西省', '抚州市', '东乡县', '\r\n361029', null);
INSERT INTO `sys_city_code` VALUES ('1213', '江西省', '抚州市', '广昌县', '\r\n361030', null);
INSERT INTO `sys_city_code` VALUES ('1214', '江西省', '上饶市', '信州区', '\r\n361102', null);
INSERT INTO `sys_city_code` VALUES ('1215', '江西省', '上饶市', '上饶县', '\r\n361121', null);
INSERT INTO `sys_city_code` VALUES ('1216', '江西省', '上饶市', '广丰县', '\r\n361122', null);
INSERT INTO `sys_city_code` VALUES ('1217', '江西省', '上饶市', '玉山县', '\r\n361123', null);
INSERT INTO `sys_city_code` VALUES ('1218', '江西省', '上饶市', '铅山县', '\r\n361124', null);
INSERT INTO `sys_city_code` VALUES ('1219', '江西省', '上饶市', '横峰县', '\r\n361125', null);
INSERT INTO `sys_city_code` VALUES ('1220', '江西省', '上饶市', '弋阳县', '\r\n361126', null);
INSERT INTO `sys_city_code` VALUES ('1221', '江西省', '上饶市', '余干县', '\r\n361127', null);
INSERT INTO `sys_city_code` VALUES ('1222', '江西省', '上饶市', '鄱阳县', '\r\n361128', null);
INSERT INTO `sys_city_code` VALUES ('1223', '江西省', '上饶市', '万年县', '\r\n361129', null);
INSERT INTO `sys_city_code` VALUES ('1224', '江西省', '上饶市', '婺源县', '\r\n361130', null);
INSERT INTO `sys_city_code` VALUES ('1225', '江西省', '上饶市', '德兴市', '\r\n361181', null);
INSERT INTO `sys_city_code` VALUES ('1226', '山东省', '济南市', '历下区', '\r\n370102', null);
INSERT INTO `sys_city_code` VALUES ('1227', '山东省', '济南市', '市中区', '\r\n370103', null);
INSERT INTO `sys_city_code` VALUES ('1228', '山东省', '济南市', '槐荫区', '\r\n370104', null);
INSERT INTO `sys_city_code` VALUES ('1229', '山东省', '济南市', '天桥区', '\r\n370105', null);
INSERT INTO `sys_city_code` VALUES ('1230', '山东省', '济南市', '历城区', '\r\n370112', null);
INSERT INTO `sys_city_code` VALUES ('1231', '山东省', '济南市', '长清区', '\r\n370113', null);
INSERT INTO `sys_city_code` VALUES ('1232', '山东省', '济南市', '平阴县', '\r\n370124', null);
INSERT INTO `sys_city_code` VALUES ('1233', '山东省', '济南市', '济阳县', '\r\n370125', null);
INSERT INTO `sys_city_code` VALUES ('1234', '山东省', '济南市', '商河县', '\r\n370126', null);
INSERT INTO `sys_city_code` VALUES ('1235', '山东省', '济南市', '章丘市', '\r\n370181', null);
INSERT INTO `sys_city_code` VALUES ('1236', '山东省', '青岛市', '市南区', '\r\n370202', null);
INSERT INTO `sys_city_code` VALUES ('1237', '山东省', '青岛市', '市北区', '\r\n370203', null);
INSERT INTO `sys_city_code` VALUES ('1238', '山东省', '青岛市', '四方区', '\r\n370205', null);
INSERT INTO `sys_city_code` VALUES ('1239', '山东省', '青岛市', '黄岛区', '\r\n370211', null);
INSERT INTO `sys_city_code` VALUES ('1240', '山东省', '青岛市', '崂山区', '\r\n370212', null);
INSERT INTO `sys_city_code` VALUES ('1241', '山东省', '青岛市', '李沧区', '\r\n370213', null);
INSERT INTO `sys_city_code` VALUES ('1242', '山东省', '青岛市', '城阳区', '\r\n370214', null);
INSERT INTO `sys_city_code` VALUES ('1243', '山东省', '青岛市', '胶州市', '\r\n370281', null);
INSERT INTO `sys_city_code` VALUES ('1244', '山东省', '青岛市', '即墨市', '\r\n370282', null);
INSERT INTO `sys_city_code` VALUES ('1245', '山东省', '青岛市', '平度市', '\r\n370283', null);
INSERT INTO `sys_city_code` VALUES ('1246', '山东省', '青岛市', '胶南市', '\r\n370284', null);
INSERT INTO `sys_city_code` VALUES ('1247', '山东省', '青岛市', '莱西市', '\r\n370285', null);
INSERT INTO `sys_city_code` VALUES ('1248', '山东省', '淄博市', '淄川区', '\r\n370302', null);
INSERT INTO `sys_city_code` VALUES ('1249', '山东省', '淄博市', '张店区', '\r\n370303', null);
INSERT INTO `sys_city_code` VALUES ('1250', '山东省', '淄博市', '博山区', '\r\n370304', null);
INSERT INTO `sys_city_code` VALUES ('1251', '山东省', '淄博市', '临淄区', '\r\n370305', null);
INSERT INTO `sys_city_code` VALUES ('1252', '山东省', '淄博市', '周村区', '\r\n370306', null);
INSERT INTO `sys_city_code` VALUES ('1253', '山东省', '淄博市', '桓台县', '\r\n370321', null);
INSERT INTO `sys_city_code` VALUES ('1254', '山东省', '淄博市', '高青县', '\r\n370322', null);
INSERT INTO `sys_city_code` VALUES ('1255', '山东省', '淄博市', '沂源县', '\r\n370323', null);
INSERT INTO `sys_city_code` VALUES ('1256', '山东省', '枣庄市', '市中区', '\r\n370402', null);
INSERT INTO `sys_city_code` VALUES ('1257', '山东省', '枣庄市', '薛城区', '\r\n370403', null);
INSERT INTO `sys_city_code` VALUES ('1258', '山东省', '枣庄市', '峄城区', '\r\n370404', null);
INSERT INTO `sys_city_code` VALUES ('1259', '山东省', '枣庄市', '台儿庄区', '\r\n370405', null);
INSERT INTO `sys_city_code` VALUES ('1260', '山东省', '枣庄市', '山亭区', '\r\n370406', null);
INSERT INTO `sys_city_code` VALUES ('1261', '山东省', '枣庄市', '滕州市', '\r\n370481', null);
INSERT INTO `sys_city_code` VALUES ('1262', '山东省', '东营市', '东营区', '\r\n370502', null);
INSERT INTO `sys_city_code` VALUES ('1263', '山东省', '东营市', '河口区', '\r\n370503', null);
INSERT INTO `sys_city_code` VALUES ('1264', '山东省', '东营市', '垦利县', '\r\n370521', null);
INSERT INTO `sys_city_code` VALUES ('1265', '山东省', '东营市', '利津县', '\r\n370522', null);
INSERT INTO `sys_city_code` VALUES ('1266', '山东省', '东营市', '广饶县', '\r\n370523', null);
INSERT INTO `sys_city_code` VALUES ('1267', '山东省', '烟台市', '芝罘区', '\r\n370602', null);
INSERT INTO `sys_city_code` VALUES ('1268', '山东省', '烟台市', '福山区', '\r\n370611', null);
INSERT INTO `sys_city_code` VALUES ('1269', '山东省', '烟台市', '牟平区', '\r\n370612', null);
INSERT INTO `sys_city_code` VALUES ('1270', '山东省', '烟台市', '莱山区', '\r\n370613', null);
INSERT INTO `sys_city_code` VALUES ('1271', '山东省', '烟台市', '长岛县', '\r\n370634', null);
INSERT INTO `sys_city_code` VALUES ('1272', '山东省', '烟台市', '龙口市', '\r\n370681', null);
INSERT INTO `sys_city_code` VALUES ('1273', '山东省', '烟台市', '莱阳市', '\r\n370682', null);
INSERT INTO `sys_city_code` VALUES ('1274', '山东省', '烟台市', '莱州市', '\r\n370683', null);
INSERT INTO `sys_city_code` VALUES ('1275', '山东省', '烟台市', '蓬莱市', '\r\n370684', null);
INSERT INTO `sys_city_code` VALUES ('1276', '山东省', '烟台市', '招远市', '\r\n370685', null);
INSERT INTO `sys_city_code` VALUES ('1277', '山东省', '烟台市', '栖霞市', '\r\n370686', null);
INSERT INTO `sys_city_code` VALUES ('1278', '山东省', '烟台市', '海阳市', '\r\n370687', null);
INSERT INTO `sys_city_code` VALUES ('1279', '山东省', '潍坊市', '潍城区', '\r\n370702', null);
INSERT INTO `sys_city_code` VALUES ('1280', '山东省', '潍坊市', '寒亭区', '\r\n370703', null);
INSERT INTO `sys_city_code` VALUES ('1281', '山东省', '潍坊市', '坊子区', '\r\n370704', null);
INSERT INTO `sys_city_code` VALUES ('1282', '山东省', '潍坊市', '奎文区', '\r\n370705', null);
INSERT INTO `sys_city_code` VALUES ('1283', '山东省', '潍坊市', '临朐县', '\r\n370724', null);
INSERT INTO `sys_city_code` VALUES ('1284', '山东省', '潍坊市', '昌乐县', '\r\n370725', null);
INSERT INTO `sys_city_code` VALUES ('1285', '山东省', '潍坊市', '青州市', '\r\n370781', null);
INSERT INTO `sys_city_code` VALUES ('1286', '山东省', '潍坊市', '诸城市', '\r\n370782', null);
INSERT INTO `sys_city_code` VALUES ('1287', '山东省', '潍坊市', '寿光市', '\r\n370783', null);
INSERT INTO `sys_city_code` VALUES ('1288', '山东省', '潍坊市', '安丘市', '\r\n370784', null);
INSERT INTO `sys_city_code` VALUES ('1289', '山东省', '潍坊市', '高密市', '\r\n370785', null);
INSERT INTO `sys_city_code` VALUES ('1290', '山东省', '潍坊市', '昌邑市', '\r\n370786', null);
INSERT INTO `sys_city_code` VALUES ('1291', '山东省', '济宁市', '市中区', '\r\n370802', null);
INSERT INTO `sys_city_code` VALUES ('1292', '山东省', '济宁市', '任城区', '\r\n370811', null);
INSERT INTO `sys_city_code` VALUES ('1293', '山东省', '济宁市', '微山县', '\r\n370826', null);
INSERT INTO `sys_city_code` VALUES ('1294', '山东省', '济宁市', '鱼台县', '\r\n370827', null);
INSERT INTO `sys_city_code` VALUES ('1295', '山东省', '济宁市', '金乡县', '\r\n370828', null);
INSERT INTO `sys_city_code` VALUES ('1296', '山东省', '济宁市', '嘉祥县', '\r\n370829', null);
INSERT INTO `sys_city_code` VALUES ('1297', '山东省', '济宁市', '汶上县', '\r\n370830', null);
INSERT INTO `sys_city_code` VALUES ('1298', '山东省', '济宁市', '泗水县', '\r\n370831', null);
INSERT INTO `sys_city_code` VALUES ('1299', '山东省', '济宁市', '梁山县', '\r\n370832', null);
INSERT INTO `sys_city_code` VALUES ('1300', '山东省', '济宁市', '曲阜市', '\r\n370881', null);
INSERT INTO `sys_city_code` VALUES ('1301', '山东省', '济宁市', '兖州市', '\r\n370882', null);
INSERT INTO `sys_city_code` VALUES ('1302', '山东省', '济宁市', '邹城市', '\r\n370883', null);
INSERT INTO `sys_city_code` VALUES ('1303', '山东省', '泰安市', '泰山区', '\r\n370902', null);
INSERT INTO `sys_city_code` VALUES ('1304', '山东省', '泰安市', '岱岳区', '\r\n370903', null);
INSERT INTO `sys_city_code` VALUES ('1305', '山东省', '泰安市', '宁阳县', '\r\n370921', null);
INSERT INTO `sys_city_code` VALUES ('1306', '山东省', '泰安市', '东平县', '\r\n370923', null);
INSERT INTO `sys_city_code` VALUES ('1307', '山东省', '泰安市', '新泰市', '\r\n370982', null);
INSERT INTO `sys_city_code` VALUES ('1308', '山东省', '泰安市', '肥城市', '\r\n370983', null);
INSERT INTO `sys_city_code` VALUES ('1309', '山东省', '威海市', '环翠区', '\r\n371002', null);
INSERT INTO `sys_city_code` VALUES ('1310', '山东省', '威海市', '文登市', '\r\n371081', null);
INSERT INTO `sys_city_code` VALUES ('1311', '山东省', '威海市', '荣成市', '\r\n371082', null);
INSERT INTO `sys_city_code` VALUES ('1312', '山东省', '威海市', '乳山市', '\r\n371083', null);
INSERT INTO `sys_city_code` VALUES ('1313', '山东省', '日照市', '东港区', '\r\n371102', null);
INSERT INTO `sys_city_code` VALUES ('1314', '山东省', '日照市', '五莲县', '\r\n371121', null);
INSERT INTO `sys_city_code` VALUES ('1315', '山东省', '日照市', '莒县', '\r\n371122', null);
INSERT INTO `sys_city_code` VALUES ('1316', '山东省', '莱芜市', '莱城区', '\r\n371202', null);
INSERT INTO `sys_city_code` VALUES ('1317', '山东省', '莱芜市', '钢城区', '\r\n371203', null);
INSERT INTO `sys_city_code` VALUES ('1318', '山东省', '临沂市', '兰山区', '\r\n371302', null);
INSERT INTO `sys_city_code` VALUES ('1319', '山东省', '临沂市', '罗庄区', '\r\n371311', null);
INSERT INTO `sys_city_code` VALUES ('1320', '山东省', '临沂市', '河东区', '\r\n371312', null);
INSERT INTO `sys_city_code` VALUES ('1321', '山东省', '临沂市', '沂南县', '\r\n371321', null);
INSERT INTO `sys_city_code` VALUES ('1322', '山东省', '临沂市', '郯城县', '\r\n371322', null);
INSERT INTO `sys_city_code` VALUES ('1323', '山东省', '临沂市', '沂水县', '\r\n371323', null);
INSERT INTO `sys_city_code` VALUES ('1324', '山东省', '临沂市', '苍山县', '\r\n371324', null);
INSERT INTO `sys_city_code` VALUES ('1325', '山东省', '临沂市', '费县', '\r\n371325', null);
INSERT INTO `sys_city_code` VALUES ('1326', '山东省', '临沂市', '平邑县', '\r\n371326', null);
INSERT INTO `sys_city_code` VALUES ('1327', '山东省', '临沂市', '莒南县', '\r\n371327', null);
INSERT INTO `sys_city_code` VALUES ('1328', '山东省', '临沂市', '蒙阴县', '\r\n371328', null);
INSERT INTO `sys_city_code` VALUES ('1329', '山东省', '临沂市', '临沭县', '\r\n371329', null);
INSERT INTO `sys_city_code` VALUES ('1330', '山东省', '德州市', '德城区', '\r\n371402', null);
INSERT INTO `sys_city_code` VALUES ('1331', '山东省', '德州市', '陵县', '\r\n371421', null);
INSERT INTO `sys_city_code` VALUES ('1332', '山东省', '德州市', '宁津县', '\r\n371422', null);
INSERT INTO `sys_city_code` VALUES ('1333', '山东省', '德州市', '庆云县', '\r\n371423', null);
INSERT INTO `sys_city_code` VALUES ('1334', '山东省', '德州市', '临邑县', '\r\n371424', null);
INSERT INTO `sys_city_code` VALUES ('1335', '山东省', '德州市', '齐河县', '\r\n371425', null);
INSERT INTO `sys_city_code` VALUES ('1336', '山东省', '德州市', '平原县', '\r\n371426', null);
INSERT INTO `sys_city_code` VALUES ('1337', '山东省', '德州市', '夏津县', '\r\n371427', null);
INSERT INTO `sys_city_code` VALUES ('1338', '山东省', '德州市', '武城县', '\r\n371428', null);
INSERT INTO `sys_city_code` VALUES ('1339', '山东省', '德州市', '乐陵市', '\r\n371481', null);
INSERT INTO `sys_city_code` VALUES ('1340', '山东省', '德州市', '禹城市', '\r\n371482', null);
INSERT INTO `sys_city_code` VALUES ('1341', '山东省', '聊城市', '东昌府区', '\r\n371502', null);
INSERT INTO `sys_city_code` VALUES ('1342', '山东省', '聊城市', '阳谷县', '\r\n371521', null);
INSERT INTO `sys_city_code` VALUES ('1343', '山东省', '聊城市', '莘县', '\r\n371522', null);
INSERT INTO `sys_city_code` VALUES ('1344', '山东省', '聊城市', '茌平县', '\r\n371523', null);
INSERT INTO `sys_city_code` VALUES ('1345', '山东省', '聊城市', '东阿县', '\r\n371524', null);
INSERT INTO `sys_city_code` VALUES ('1346', '山东省', '聊城市', '冠县', '\r\n371525', null);
INSERT INTO `sys_city_code` VALUES ('1347', '山东省', '聊城市', '高唐县', '\r\n371526', null);
INSERT INTO `sys_city_code` VALUES ('1348', '山东省', '聊城市', '临清市', '\r\n371581', null);
INSERT INTO `sys_city_code` VALUES ('1349', '山东省', '滨州市', '滨城区', '\r\n371602', null);
INSERT INTO `sys_city_code` VALUES ('1350', '山东省', '滨州市', '惠民县', '\r\n371621', null);
INSERT INTO `sys_city_code` VALUES ('1351', '山东省', '滨州市', '阳信县', '\r\n371622', null);
INSERT INTO `sys_city_code` VALUES ('1352', '山东省', '滨州市', '无棣县', '\r\n371623', null);
INSERT INTO `sys_city_code` VALUES ('1353', '山东省', '滨州市', '沾化县', '\r\n371624', null);
INSERT INTO `sys_city_code` VALUES ('1354', '山东省', '滨州市', '博兴县', '\r\n371625', null);
INSERT INTO `sys_city_code` VALUES ('1355', '山东省', '滨州市', '邹平县', '\r\n371626', null);
INSERT INTO `sys_city_code` VALUES ('1356', '山东省', '荷泽市', '牡丹区', '\r\n371702', null);
INSERT INTO `sys_city_code` VALUES ('1357', '山东省', '荷泽市', '曹县', '\r\n371721', null);
INSERT INTO `sys_city_code` VALUES ('1358', '山东省', '荷泽市', '单县', '\r\n371722', null);
INSERT INTO `sys_city_code` VALUES ('1359', '山东省', '荷泽市', '成武县', '\r\n371723', null);
INSERT INTO `sys_city_code` VALUES ('1360', '山东省', '荷泽市', '巨野县', '\r\n371724', null);
INSERT INTO `sys_city_code` VALUES ('1361', '山东省', '荷泽市', '郓城县', '\r\n371725', null);
INSERT INTO `sys_city_code` VALUES ('1362', '山东省', '荷泽市', '鄄城县', '\r\n371726', null);
INSERT INTO `sys_city_code` VALUES ('1363', '山东省', '荷泽市', '定陶县', '\r\n371727', null);
INSERT INTO `sys_city_code` VALUES ('1364', '山东省', '荷泽市', '东明县', '\r\n371728', null);
INSERT INTO `sys_city_code` VALUES ('1365', '河南省', '郑州市', '中原区', '\r\n410102', null);
INSERT INTO `sys_city_code` VALUES ('1366', '河南省', '郑州市', '二七区', '\r\n410103', null);
INSERT INTO `sys_city_code` VALUES ('1367', '河南省', '郑州市', '管城回族区', '\r\n410104', null);
INSERT INTO `sys_city_code` VALUES ('1368', '河南省', '郑州市', '金水区', '\r\n410105', null);
INSERT INTO `sys_city_code` VALUES ('1369', '河南省', '郑州市', '上街区', '\r\n410106', null);
INSERT INTO `sys_city_code` VALUES ('1370', '河南省', '郑州市', '惠济区', '\r\n410108', null);
INSERT INTO `sys_city_code` VALUES ('1371', '河南省', '郑州市', '中牟县', '\r\n410122', null);
INSERT INTO `sys_city_code` VALUES ('1372', '河南省', '郑州市', '巩义市', '\r\n410181', null);
INSERT INTO `sys_city_code` VALUES ('1373', '河南省', '郑州市', '荥阳市', '\r\n410182', null);
INSERT INTO `sys_city_code` VALUES ('1374', '河南省', '郑州市', '新密市', '\r\n410183', null);
INSERT INTO `sys_city_code` VALUES ('1375', '河南省', '郑州市', '新郑市', '\r\n410184', null);
INSERT INTO `sys_city_code` VALUES ('1376', '河南省', '郑州市', '登封市', '\r\n410185', null);
INSERT INTO `sys_city_code` VALUES ('1377', '河南省', '开封市', '龙亭区', '\r\n410202', null);
INSERT INTO `sys_city_code` VALUES ('1378', '河南省', '开封市', '顺河回族区', '\r\n410203', null);
INSERT INTO `sys_city_code` VALUES ('1379', '河南省', '开封市', '鼓楼区', '\r\n410204', null);
INSERT INTO `sys_city_code` VALUES ('1380', '河南省', '开封市', '南关区', '\r\n410205', null);
INSERT INTO `sys_city_code` VALUES ('1381', '河南省', '开封市', '郊区', '\r\n410211', null);
INSERT INTO `sys_city_code` VALUES ('1382', '河南省', '开封市', '杞县', '\r\n410221', null);
INSERT INTO `sys_city_code` VALUES ('1383', '河南省', '开封市', '通许县', '\r\n410222', null);
INSERT INTO `sys_city_code` VALUES ('1384', '河南省', '开封市', '尉氏县', '\r\n410223', null);
INSERT INTO `sys_city_code` VALUES ('1385', '河南省', '开封市', '开封县', '\r\n410224', null);
INSERT INTO `sys_city_code` VALUES ('1386', '河南省', '开封市', '兰考县', '\r\n410225', null);
INSERT INTO `sys_city_code` VALUES ('1387', '河南省', '洛阳市', '老城区', '\r\n410302', null);
INSERT INTO `sys_city_code` VALUES ('1388', '河南省', '洛阳市', '西工区', '\r\n410303', null);
INSERT INTO `sys_city_code` VALUES ('1389', '河南省', '洛阳市', '廛河回族区', '\r\n410304', null);
INSERT INTO `sys_city_code` VALUES ('1390', '河南省', '洛阳市', '涧西区', '\r\n410305', null);
INSERT INTO `sys_city_code` VALUES ('1391', '河南省', '洛阳市', '吉利区', '\r\n410306', null);
INSERT INTO `sys_city_code` VALUES ('1392', '河南省', '洛阳市', '洛龙区', '\r\n410307', null);
INSERT INTO `sys_city_code` VALUES ('1393', '河南省', '洛阳市', '孟津县', '\r\n410322', null);
INSERT INTO `sys_city_code` VALUES ('1394', '河南省', '洛阳市', '新安县', '\r\n410323', null);
INSERT INTO `sys_city_code` VALUES ('1395', '河南省', '洛阳市', '栾川县', '\r\n410324', null);
INSERT INTO `sys_city_code` VALUES ('1396', '河南省', '洛阳市', '嵩县', '\r\n410325', null);
INSERT INTO `sys_city_code` VALUES ('1397', '河南省', '洛阳市', '汝阳县', '\r\n410326', null);
INSERT INTO `sys_city_code` VALUES ('1398', '河南省', '洛阳市', '宜阳县', '\r\n410327', null);
INSERT INTO `sys_city_code` VALUES ('1399', '河南省', '洛阳市', '洛宁县', '\r\n410328', null);
INSERT INTO `sys_city_code` VALUES ('1400', '河南省', '洛阳市', '伊川县', '\r\n410329', null);
INSERT INTO `sys_city_code` VALUES ('1401', '河南省', '洛阳市', '偃师市', '\r\n410381', null);
INSERT INTO `sys_city_code` VALUES ('1402', '河南省', '平顶山市', '新华区', '\r\n410402', null);
INSERT INTO `sys_city_code` VALUES ('1403', '河南省', '平顶山市', '卫东区', '\r\n410403', null);
INSERT INTO `sys_city_code` VALUES ('1404', '河南省', '平顶山市', '石龙区', '\r\n410404', null);
INSERT INTO `sys_city_code` VALUES ('1405', '河南省', '平顶山市', '湛河区', '\r\n410411', null);
INSERT INTO `sys_city_code` VALUES ('1406', '河南省', '平顶山市', '宝丰县', '\r\n410421', null);
INSERT INTO `sys_city_code` VALUES ('1407', '河南省', '平顶山市', '叶县', '\r\n410422', null);
INSERT INTO `sys_city_code` VALUES ('1408', '河南省', '平顶山市', '鲁山县', '\r\n410423', null);
INSERT INTO `sys_city_code` VALUES ('1409', '河南省', '平顶山市', '郏县', '\r\n410425', null);
INSERT INTO `sys_city_code` VALUES ('1410', '河南省', '平顶山市', '舞钢市', '\r\n410481', null);
INSERT INTO `sys_city_code` VALUES ('1411', '河南省', '平顶山市', '汝州市', '\r\n410482', null);
INSERT INTO `sys_city_code` VALUES ('1412', '河南省', '安阳市', '文峰区', '\r\n410502', null);
INSERT INTO `sys_city_code` VALUES ('1413', '河南省', '安阳市', '北关区', '\r\n410503', null);
INSERT INTO `sys_city_code` VALUES ('1414', '河南省', '安阳市', '殷都区', '\r\n410505', null);
INSERT INTO `sys_city_code` VALUES ('1415', '河南省', '安阳市', '龙安区', '\r\n410506', null);
INSERT INTO `sys_city_code` VALUES ('1416', '河南省', '安阳市', '安阳县', '\r\n410522', null);
INSERT INTO `sys_city_code` VALUES ('1417', '河南省', '安阳市', '汤阴县', '\r\n410523', null);
INSERT INTO `sys_city_code` VALUES ('1418', '河南省', '安阳市', '滑县', '\r\n410526', null);
INSERT INTO `sys_city_code` VALUES ('1419', '河南省', '安阳市', '内黄县', '\r\n410527', null);
INSERT INTO `sys_city_code` VALUES ('1420', '河南省', '安阳市', '林州市', '\r\n410581', null);
INSERT INTO `sys_city_code` VALUES ('1421', '河南省', '鹤壁市', '鹤山区', '\r\n410602', null);
INSERT INTO `sys_city_code` VALUES ('1422', '河南省', '鹤壁市', '山城区', '\r\n410603', null);
INSERT INTO `sys_city_code` VALUES ('1423', '河南省', '鹤壁市', '淇滨区', '\r\n410611', null);
INSERT INTO `sys_city_code` VALUES ('1424', '河南省', '鹤壁市', '浚县', '\r\n410621', null);
INSERT INTO `sys_city_code` VALUES ('1425', '河南省', '鹤壁市', '淇县', '\r\n410622', null);
INSERT INTO `sys_city_code` VALUES ('1426', '河南省', '新乡市', '红旗区', '\r\n410702', null);
INSERT INTO `sys_city_code` VALUES ('1427', '河南省', '新乡市', '卫滨区', '\r\n410703', null);
INSERT INTO `sys_city_code` VALUES ('1428', '河南省', '新乡市', '凤泉区', '\r\n410704', null);
INSERT INTO `sys_city_code` VALUES ('1429', '河南省', '新乡市', '牧野区', '\r\n410711', null);
INSERT INTO `sys_city_code` VALUES ('1430', '河南省', '新乡市', '新乡县', '\r\n410721', null);
INSERT INTO `sys_city_code` VALUES ('1431', '河南省', '新乡市', '获嘉县', '\r\n410724', null);
INSERT INTO `sys_city_code` VALUES ('1432', '河南省', '新乡市', '原阳县', '\r\n410725', null);
INSERT INTO `sys_city_code` VALUES ('1433', '河南省', '新乡市', '延津县', '\r\n410726', null);
INSERT INTO `sys_city_code` VALUES ('1434', '河南省', '新乡市', '封丘县', '\r\n410727', null);
INSERT INTO `sys_city_code` VALUES ('1435', '河南省', '新乡市', '长垣县', '\r\n410728', null);
INSERT INTO `sys_city_code` VALUES ('1436', '河南省', '新乡市', '卫辉市', '\r\n410781', null);
INSERT INTO `sys_city_code` VALUES ('1437', '河南省', '新乡市', '辉县市', '\r\n410782', null);
INSERT INTO `sys_city_code` VALUES ('1438', '河南省', '焦作市', '解放区', '\r\n410802', null);
INSERT INTO `sys_city_code` VALUES ('1439', '河南省', '焦作市', '中站区', '\r\n410803', null);
INSERT INTO `sys_city_code` VALUES ('1440', '河南省', '焦作市', '马村区', '\r\n410804', null);
INSERT INTO `sys_city_code` VALUES ('1441', '河南省', '焦作市', '山阳区', '\r\n410811', null);
INSERT INTO `sys_city_code` VALUES ('1442', '河南省', '焦作市', '修武县', '\r\n410821', null);
INSERT INTO `sys_city_code` VALUES ('1443', '河南省', '焦作市', '博爱县', '\r\n410822', null);
INSERT INTO `sys_city_code` VALUES ('1444', '河南省', '焦作市', '武陟县', '\r\n410823', null);
INSERT INTO `sys_city_code` VALUES ('1445', '河南省', '焦作市', '温县', '\r\n410825', null);
INSERT INTO `sys_city_code` VALUES ('1446', '河南省', '焦作市', '济源市', '\r\n410881', null);
INSERT INTO `sys_city_code` VALUES ('1447', '河南省', '焦作市', '沁阳市', '\r\n410882', null);
INSERT INTO `sys_city_code` VALUES ('1448', '河南省', '焦作市', '孟州市', '\r\n410883', null);
INSERT INTO `sys_city_code` VALUES ('1449', '河南省', '濮阳市', '华龙区', '\r\n410902', null);
INSERT INTO `sys_city_code` VALUES ('1450', '河南省', '濮阳市', '清丰县', '\r\n410922', null);
INSERT INTO `sys_city_code` VALUES ('1451', '河南省', '濮阳市', '南乐县', '\r\n410923', null);
INSERT INTO `sys_city_code` VALUES ('1452', '河南省', '濮阳市', '范县', '\r\n410926', null);
INSERT INTO `sys_city_code` VALUES ('1453', '河南省', '濮阳市', '台前县', '\r\n410927', null);
INSERT INTO `sys_city_code` VALUES ('1454', '河南省', '濮阳市', '濮阳县', '\r\n410928', null);
INSERT INTO `sys_city_code` VALUES ('1455', '河南省', '许昌市', '魏都区', '\r\n411002', null);
INSERT INTO `sys_city_code` VALUES ('1456', '河南省', '许昌市', '许昌县', '\r\n411023', null);
INSERT INTO `sys_city_code` VALUES ('1457', '河南省', '许昌市', '鄢陵县', '\r\n411024', null);
INSERT INTO `sys_city_code` VALUES ('1458', '河南省', '许昌市', '襄城县', '\r\n411025', null);
INSERT INTO `sys_city_code` VALUES ('1459', '河南省', '许昌市', '禹州市', '\r\n411081', null);
INSERT INTO `sys_city_code` VALUES ('1460', '河南省', '许昌市', '长葛市', '\r\n411082', null);
INSERT INTO `sys_city_code` VALUES ('1461', '河南省', '漯河市', '源汇区', '\r\n411102', null);
INSERT INTO `sys_city_code` VALUES ('1462', '河南省', '漯河市', '舞阳县', '\r\n411121', null);
INSERT INTO `sys_city_code` VALUES ('1463', '河南省', '漯河市', '临颍县', '\r\n411122', null);
INSERT INTO `sys_city_code` VALUES ('1464', '河南省', '漯河市', '郾城县', '\r\n411123', null);
INSERT INTO `sys_city_code` VALUES ('1465', '河南省', '三门峡市', '湖滨区', '\r\n411202', null);
INSERT INTO `sys_city_code` VALUES ('1466', '河南省', '三门峡市', '渑池县', '\r\n411221', null);
INSERT INTO `sys_city_code` VALUES ('1467', '河南省', '三门峡市', '陕县', '\r\n411222', null);
INSERT INTO `sys_city_code` VALUES ('1468', '河南省', '三门峡市', '卢氏县', '\r\n411224', null);
INSERT INTO `sys_city_code` VALUES ('1469', '河南省', '三门峡市', '义马市', '\r\n411281', null);
INSERT INTO `sys_city_code` VALUES ('1470', '河南省', '三门峡市', '灵宝市', '\r\n411282', null);
INSERT INTO `sys_city_code` VALUES ('1471', '河南省', '南阳市', '宛城区', '\r\n411302', null);
INSERT INTO `sys_city_code` VALUES ('1472', '河南省', '南阳市', '卧龙区', '\r\n411303', null);
INSERT INTO `sys_city_code` VALUES ('1473', '河南省', '南阳市', '南召县', '\r\n411321', null);
INSERT INTO `sys_city_code` VALUES ('1474', '河南省', '南阳市', '方城县', '\r\n411322', null);
INSERT INTO `sys_city_code` VALUES ('1475', '河南省', '南阳市', '西峡县', '\r\n411323', null);
INSERT INTO `sys_city_code` VALUES ('1476', '河南省', '南阳市', '镇平县', '\r\n411324', null);
INSERT INTO `sys_city_code` VALUES ('1477', '河南省', '南阳市', '内乡县', '\r\n411325', null);
INSERT INTO `sys_city_code` VALUES ('1478', '河南省', '南阳市', '淅川县', '\r\n411326', null);
INSERT INTO `sys_city_code` VALUES ('1479', '河南省', '南阳市', '社旗县', '\r\n411327', null);
INSERT INTO `sys_city_code` VALUES ('1480', '河南省', '南阳市', '唐河县', '\r\n411328', null);
INSERT INTO `sys_city_code` VALUES ('1481', '河南省', '南阳市', '新野县', '\r\n411329', null);
INSERT INTO `sys_city_code` VALUES ('1482', '河南省', '南阳市', '桐柏县', '\r\n411330', null);
INSERT INTO `sys_city_code` VALUES ('1483', '河南省', '南阳市', '邓州市', '\r\n411381', null);
INSERT INTO `sys_city_code` VALUES ('1484', '河南省', '商丘市', '梁园区', '\r\n411402', null);
INSERT INTO `sys_city_code` VALUES ('1485', '河南省', '商丘市', '睢阳区', '\r\n411403', null);
INSERT INTO `sys_city_code` VALUES ('1486', '河南省', '商丘市', '民权县', '\r\n411421', null);
INSERT INTO `sys_city_code` VALUES ('1487', '河南省', '商丘市', '睢县', '\r\n411422', null);
INSERT INTO `sys_city_code` VALUES ('1488', '河南省', '商丘市', '宁陵县', '\r\n411423', null);
INSERT INTO `sys_city_code` VALUES ('1489', '河南省', '商丘市', '柘城县', '\r\n411424', null);
INSERT INTO `sys_city_code` VALUES ('1490', '河南省', '商丘市', '虞城县', '\r\n411425', null);
INSERT INTO `sys_city_code` VALUES ('1491', '河南省', '商丘市', '夏邑县', '\r\n411426', null);
INSERT INTO `sys_city_code` VALUES ('1492', '河南省', '商丘市', '永城市', '\r\n411481', null);
INSERT INTO `sys_city_code` VALUES ('1493', '河南省', '信阳市', '师河区', '\r\n411502', null);
INSERT INTO `sys_city_code` VALUES ('1494', '河南省', '信阳市', '平桥区', '\r\n411503', null);
INSERT INTO `sys_city_code` VALUES ('1495', '河南省', '信阳市', '罗山县', '\r\n411521', null);
INSERT INTO `sys_city_code` VALUES ('1496', '河南省', '信阳市', '光山县', '\r\n411522', null);
INSERT INTO `sys_city_code` VALUES ('1497', '河南省', '信阳市', '新县', '\r\n411523', null);
INSERT INTO `sys_city_code` VALUES ('1498', '河南省', '信阳市', '商城县', '\r\n411524', null);
INSERT INTO `sys_city_code` VALUES ('1499', '河南省', '信阳市', '固始县', '\r\n411525', null);
INSERT INTO `sys_city_code` VALUES ('1500', '河南省', '信阳市', '潢川县', '\r\n411526', null);
INSERT INTO `sys_city_code` VALUES ('1501', '河南省', '信阳市', '淮滨县', '\r\n411527', null);
INSERT INTO `sys_city_code` VALUES ('1502', '河南省', '信阳市', '息县', '\r\n411528', null);
INSERT INTO `sys_city_code` VALUES ('1503', '河南省', '周口市', '川汇区', '\r\n411602', null);
INSERT INTO `sys_city_code` VALUES ('1504', '河南省', '周口市', '扶沟县', '\r\n411621', null);
INSERT INTO `sys_city_code` VALUES ('1505', '河南省', '周口市', '西华县', '\r\n411622', null);
INSERT INTO `sys_city_code` VALUES ('1506', '河南省', '周口市', '商水县', '\r\n411623', null);
INSERT INTO `sys_city_code` VALUES ('1507', '河南省', '周口市', '沈丘县', '\r\n411624', null);
INSERT INTO `sys_city_code` VALUES ('1508', '河南省', '周口市', '郸城县', '\r\n411625', null);
INSERT INTO `sys_city_code` VALUES ('1509', '河南省', '周口市', '淮阳县', '\r\n411626', null);
INSERT INTO `sys_city_code` VALUES ('1510', '河南省', '周口市', '太康县', '\r\n411627', null);
INSERT INTO `sys_city_code` VALUES ('1511', '河南省', '周口市', '鹿邑县', '\r\n411628', null);
INSERT INTO `sys_city_code` VALUES ('1512', '河南省', '周口市', '项城市', '\r\n411681', null);
INSERT INTO `sys_city_code` VALUES ('1513', '河南省', '驻马店市', '驿城区', '\r\n411702', null);
INSERT INTO `sys_city_code` VALUES ('1514', '河南省', '驻马店市', '西平县', '\r\n411721', null);
INSERT INTO `sys_city_code` VALUES ('1515', '河南省', '驻马店市', '上蔡县', '\r\n411722', null);
INSERT INTO `sys_city_code` VALUES ('1516', '河南省', '驻马店市', '平舆县', '\r\n411723', null);
INSERT INTO `sys_city_code` VALUES ('1517', '河南省', '驻马店市', '正阳县', '\r\n411724', null);
INSERT INTO `sys_city_code` VALUES ('1518', '河南省', '驻马店市', '确山县', '\r\n411725', null);
INSERT INTO `sys_city_code` VALUES ('1519', '河南省', '驻马店市', '泌阳县', '\r\n411726', null);
INSERT INTO `sys_city_code` VALUES ('1520', '河南省', '驻马店市', '汝南县', '\r\n411727', null);
INSERT INTO `sys_city_code` VALUES ('1521', '河南省', '驻马店市', '遂平县', '\r\n411728', null);
INSERT INTO `sys_city_code` VALUES ('1522', '河南省', '驻马店市', '新蔡县', '\r\n411729', null);
INSERT INTO `sys_city_code` VALUES ('1523', '湖北省', '武汉市', '江岸区', '\r\n420102', null);
INSERT INTO `sys_city_code` VALUES ('1524', '湖北省', '武汉市', '江汉区', '\r\n420103', null);
INSERT INTO `sys_city_code` VALUES ('1525', '湖北省', '武汉市', '乔口区', '\r\n420104', null);
INSERT INTO `sys_city_code` VALUES ('1526', '湖北省', '武汉市', '汉阳区', '\r\n420105', null);
INSERT INTO `sys_city_code` VALUES ('1527', '湖北省', '武汉市', '武昌区', '\r\n420106', null);
INSERT INTO `sys_city_code` VALUES ('1528', '湖北省', '武汉市', '青山区', '\r\n420107', null);
INSERT INTO `sys_city_code` VALUES ('1529', '湖北省', '武汉市', '洪山区', '\r\n420111', null);
INSERT INTO `sys_city_code` VALUES ('1530', '湖北省', '武汉市', '东西湖区', '\r\n420112', null);
INSERT INTO `sys_city_code` VALUES ('1531', '湖北省', '武汉市', '汉南区', '\r\n420113', null);
INSERT INTO `sys_city_code` VALUES ('1532', '湖北省', '武汉市', '蔡甸区', '\r\n420114', null);
INSERT INTO `sys_city_code` VALUES ('1533', '湖北省', '武汉市', '江夏区', '\r\n420115', null);
INSERT INTO `sys_city_code` VALUES ('1534', '湖北省', '武汉市', '黄陂区', '\r\n420116', null);
INSERT INTO `sys_city_code` VALUES ('1535', '湖北省', '武汉市', '新洲区', '\r\n420117', null);
INSERT INTO `sys_city_code` VALUES ('1536', '湖北省', '黄石市', '黄石港区', '\r\n420202', null);
INSERT INTO `sys_city_code` VALUES ('1537', '湖北省', '黄石市', '西塞山区', '\r\n420203', null);
INSERT INTO `sys_city_code` VALUES ('1538', '湖北省', '黄石市', '下陆区', '\r\n420204', null);
INSERT INTO `sys_city_code` VALUES ('1539', '湖北省', '黄石市', '铁山区', '\r\n420205', null);
INSERT INTO `sys_city_code` VALUES ('1540', '湖北省', '黄石市', '阳新县', '\r\n420222', null);
INSERT INTO `sys_city_code` VALUES ('1541', '湖北省', '黄石市', '大冶市', '\r\n420281', null);
INSERT INTO `sys_city_code` VALUES ('1542', '湖北省', '十堰市', '茅箭区', '\r\n420302', null);
INSERT INTO `sys_city_code` VALUES ('1543', '湖北省', '十堰市', '张湾区', '\r\n420303', null);
INSERT INTO `sys_city_code` VALUES ('1544', '湖北省', '十堰市', '郧县', '\r\n420321', null);
INSERT INTO `sys_city_code` VALUES ('1545', '湖北省', '十堰市', '郧西县', '\r\n420322', null);
INSERT INTO `sys_city_code` VALUES ('1546', '湖北省', '十堰市', '竹山县', '\r\n420323', null);
INSERT INTO `sys_city_code` VALUES ('1547', '湖北省', '十堰市', '竹溪县', '\r\n420324', null);
INSERT INTO `sys_city_code` VALUES ('1548', '湖北省', '十堰市', '房县', '\r\n420325', null);
INSERT INTO `sys_city_code` VALUES ('1549', '湖北省', '十堰市', '丹江口市', '\r\n420381', null);
INSERT INTO `sys_city_code` VALUES ('1550', '湖北省', '宜昌市', '西陵区', '\r\n420502', null);
INSERT INTO `sys_city_code` VALUES ('1551', '湖北省', '宜昌市', '伍家岗区', '\r\n420503', null);
INSERT INTO `sys_city_code` VALUES ('1552', '湖北省', '宜昌市', '点军区', '\r\n420504', null);
INSERT INTO `sys_city_code` VALUES ('1553', '湖北省', '宜昌市', '虎亭区', '\r\n420505', null);
INSERT INTO `sys_city_code` VALUES ('1554', '湖北省', '宜昌市', '夷陵区', '\r\n420506', null);
INSERT INTO `sys_city_code` VALUES ('1555', '湖北省', '宜昌市', '远安县', '\r\n420525', null);
INSERT INTO `sys_city_code` VALUES ('1556', '湖北省', '宜昌市', '兴山县', '\r\n420526', null);
INSERT INTO `sys_city_code` VALUES ('1557', '湖北省', '宜昌市', '秭归县', '\r\n420527', null);
INSERT INTO `sys_city_code` VALUES ('1558', '湖北省', '宜昌市', '长阳土家族自治县', '\r\n420528', null);
INSERT INTO `sys_city_code` VALUES ('1559', '湖北省', '宜昌市', '五峰土家族自治县', '\r\n420529', null);
INSERT INTO `sys_city_code` VALUES ('1560', '湖北省', '宜昌市', '宜都市', '\r\n420581', null);
INSERT INTO `sys_city_code` VALUES ('1561', '湖北省', '宜昌市', '当阳市', '\r\n420582', null);
INSERT INTO `sys_city_code` VALUES ('1562', '湖北省', '宜昌市', '枝江市', '\r\n420583', null);
INSERT INTO `sys_city_code` VALUES ('1563', '湖北省', '襄樊市', '襄城区', '\r\n420602', null);
INSERT INTO `sys_city_code` VALUES ('1564', '湖北省', '襄樊市', '樊城区', '\r\n420606', null);
INSERT INTO `sys_city_code` VALUES ('1565', '湖北省', '襄樊市', '襄阳区', '\r\n420607', null);
INSERT INTO `sys_city_code` VALUES ('1566', '湖北省', '襄樊市', '南漳县', '\r\n420624', null);
INSERT INTO `sys_city_code` VALUES ('1567', '湖北省', '襄樊市', '谷城县', '\r\n420625', null);
INSERT INTO `sys_city_code` VALUES ('1568', '湖北省', '襄樊市', '保康县', '\r\n420626', null);
INSERT INTO `sys_city_code` VALUES ('1569', '湖北省', '襄樊市', '老河口市', '\r\n420682', null);
INSERT INTO `sys_city_code` VALUES ('1570', '湖北省', '襄樊市', '枣阳市', '\r\n420683', null);
INSERT INTO `sys_city_code` VALUES ('1571', '湖北省', '襄樊市', '宜城市', '\r\n420684', null);
INSERT INTO `sys_city_code` VALUES ('1572', '湖北省', '鄂州市', '梁子湖区', '\r\n420702', null);
INSERT INTO `sys_city_code` VALUES ('1573', '湖北省', '鄂州市', '华容区', '\r\n420703', null);
INSERT INTO `sys_city_code` VALUES ('1574', '湖北省', '鄂州市', '鄂城区', '\r\n420704', null);
INSERT INTO `sys_city_code` VALUES ('1575', '湖北省', '荆门市', '东宝区', '\r\n420802', null);
INSERT INTO `sys_city_code` VALUES ('1576', '湖北省', '荆门市', '掇刀区', '\r\n420804', null);
INSERT INTO `sys_city_code` VALUES ('1577', '湖北省', '荆门市', '京山县', '\r\n420821', null);
INSERT INTO `sys_city_code` VALUES ('1578', '湖北省', '荆门市', '沙洋县', '\r\n420822', null);
INSERT INTO `sys_city_code` VALUES ('1579', '湖北省', '荆门市', '钟祥市', '\r\n420881', null);
INSERT INTO `sys_city_code` VALUES ('1580', '湖北省', '孝感市', '孝南区', '\r\n420902', null);
INSERT INTO `sys_city_code` VALUES ('1581', '湖北省', '孝感市', '孝昌县', '\r\n420921', null);
INSERT INTO `sys_city_code` VALUES ('1582', '湖北省', '孝感市', '大悟县', '\r\n420922', null);
INSERT INTO `sys_city_code` VALUES ('1583', '湖北省', '孝感市', '云梦县', '\r\n420923', null);
INSERT INTO `sys_city_code` VALUES ('1584', '湖北省', '孝感市', '应城市', '\r\n420981', null);
INSERT INTO `sys_city_code` VALUES ('1585', '湖北省', '孝感市', '安陆市', '\r\n420982', null);
INSERT INTO `sys_city_code` VALUES ('1586', '湖北省', '孝感市', '汉川市', '\r\n420984', null);
INSERT INTO `sys_city_code` VALUES ('1587', '湖北省', '荆州市', '沙市区', '\r\n421002', null);
INSERT INTO `sys_city_code` VALUES ('1588', '湖北省', '荆州市', '荆州区', '\r\n421003', null);
INSERT INTO `sys_city_code` VALUES ('1589', '湖北省', '荆州市', '公安县', '\r\n421022', null);
INSERT INTO `sys_city_code` VALUES ('1590', '湖北省', '荆州市', '监利县', '\r\n421023', null);
INSERT INTO `sys_city_code` VALUES ('1591', '湖北省', '荆州市', '江陵县', '\r\n421024', null);
INSERT INTO `sys_city_code` VALUES ('1592', '湖北省', '荆州市', '石首市', '\r\n421081', null);
INSERT INTO `sys_city_code` VALUES ('1593', '湖北省', '荆州市', '洪湖市', '\r\n421083', null);
INSERT INTO `sys_city_code` VALUES ('1594', '湖北省', '荆州市', '松滋市', '\r\n421087', null);
INSERT INTO `sys_city_code` VALUES ('1595', '湖北省', '黄冈市', '黄州区', '\r\n421102', null);
INSERT INTO `sys_city_code` VALUES ('1596', '湖北省', '黄冈市', '团风县', '\r\n421121', null);
INSERT INTO `sys_city_code` VALUES ('1597', '湖北省', '黄冈市', '红安县', '\r\n421122', null);
INSERT INTO `sys_city_code` VALUES ('1598', '湖北省', '黄冈市', '罗田县', '\r\n421123', null);
INSERT INTO `sys_city_code` VALUES ('1599', '湖北省', '黄冈市', '英山县', '\r\n421124', null);
INSERT INTO `sys_city_code` VALUES ('1600', '湖北省', '黄冈市', '浠水县', '\r\n421125', null);
INSERT INTO `sys_city_code` VALUES ('1601', '湖北省', '黄冈市', '蕲春县', '\r\n421126', null);
INSERT INTO `sys_city_code` VALUES ('1602', '湖北省', '黄冈市', '黄梅县', '\r\n421127', null);
INSERT INTO `sys_city_code` VALUES ('1603', '湖北省', '黄冈市', '麻城市', '\r\n421181', null);
INSERT INTO `sys_city_code` VALUES ('1604', '湖北省', '黄冈市', '武穴市', '\r\n421182', null);
INSERT INTO `sys_city_code` VALUES ('1605', '湖北省', '咸宁市', '咸安区', '\r\n421202', null);
INSERT INTO `sys_city_code` VALUES ('1606', '湖北省', '咸宁市', '嘉鱼县', '\r\n421221', null);
INSERT INTO `sys_city_code` VALUES ('1607', '湖北省', '咸宁市', '通城县', '\r\n421222', null);
INSERT INTO `sys_city_code` VALUES ('1608', '湖北省', '咸宁市', '崇阳县', '\r\n421223', null);
INSERT INTO `sys_city_code` VALUES ('1609', '湖北省', '咸宁市', '通山县', '\r\n421224', null);
INSERT INTO `sys_city_code` VALUES ('1610', '湖北省', '咸宁市', '赤壁市', '\r\n421281', null);
INSERT INTO `sys_city_code` VALUES ('1611', '湖北省', '随州市', '曾都区', '\r\n421302', null);
INSERT INTO `sys_city_code` VALUES ('1612', '湖北省', '随州市', '广水市', '\r\n421381', null);
INSERT INTO `sys_city_code` VALUES ('1613', '湖北省', '恩施土家族苗族自治州', '恩施市', '\r\n422801', null);
INSERT INTO `sys_city_code` VALUES ('1614', '湖北省', '恩施土家族苗族自治州', '利川市', '\r\n422802', null);
INSERT INTO `sys_city_code` VALUES ('1615', '湖北省', '恩施土家族苗族自治州', '建始县', '\r\n422822', null);
INSERT INTO `sys_city_code` VALUES ('1616', '湖北省', '恩施土家族苗族自治州', '巴东县', '\r\n422823', null);
INSERT INTO `sys_city_code` VALUES ('1617', '湖北省', '恩施土家族苗族自治州', '宣恩县', '\r\n422825', null);
INSERT INTO `sys_city_code` VALUES ('1618', '湖北省', '恩施土家族苗族自治州', '咸丰县', '\r\n422826', null);
INSERT INTO `sys_city_code` VALUES ('1619', '湖北省', '恩施土家族苗族自治州', '来凤县', '\r\n422827', null);
INSERT INTO `sys_city_code` VALUES ('1620', '湖北省', '恩施土家族苗族自治州', '鹤峰县', '\r\n422828', null);
INSERT INTO `sys_city_code` VALUES ('1621', '湖北省', '湖北省辖市区', '仙桃市', '\r\n429004', null);
INSERT INTO `sys_city_code` VALUES ('1622', '湖北省', '湖北省辖市区', '潜江市', '\r\n429005', null);
INSERT INTO `sys_city_code` VALUES ('1623', '湖北省', '湖北省辖市区', '天门市', '\r\n429006', null);
INSERT INTO `sys_city_code` VALUES ('1624', '湖北省', '湖北省辖市区', '神农架林区', '\r\n429021', null);
INSERT INTO `sys_city_code` VALUES ('1625', '湖南省', '长沙市', '芙蓉区', '\r\n430102', null);
INSERT INTO `sys_city_code` VALUES ('1626', '湖南省', '长沙市', '天心区', '\r\n430103', null);
INSERT INTO `sys_city_code` VALUES ('1627', '湖南省', '长沙市', '岳麓区', '\r\n430104', null);
INSERT INTO `sys_city_code` VALUES ('1628', '湖南省', '长沙市', '开福区', '\r\n430105', null);
INSERT INTO `sys_city_code` VALUES ('1629', '湖南省', '长沙市', '雨花区', '\r\n430111', null);
INSERT INTO `sys_city_code` VALUES ('1630', '湖南省', '长沙市', '长沙县', '\r\n430121', null);
INSERT INTO `sys_city_code` VALUES ('1631', '湖南省', '长沙市', '望城县', '\r\n430122', null);
INSERT INTO `sys_city_code` VALUES ('1632', '湖南省', '长沙市', '宁乡县', '\r\n430124', null);
INSERT INTO `sys_city_code` VALUES ('1633', '湖南省', '长沙市', '浏阳市', '\r\n430181', null);
INSERT INTO `sys_city_code` VALUES ('1634', '湖南省', '株洲市', '荷塘区', '\r\n430202', null);
INSERT INTO `sys_city_code` VALUES ('1635', '湖南省', '株洲市', '芦淞区', '\r\n430203', null);
INSERT INTO `sys_city_code` VALUES ('1636', '湖南省', '株洲市', '石峰区', '\r\n430204', null);
INSERT INTO `sys_city_code` VALUES ('1637', '湖南省', '株洲市', '天元区', '\r\n430211', null);
INSERT INTO `sys_city_code` VALUES ('1638', '湖南省', '株洲市', '株洲县', '\r\n430221', null);
INSERT INTO `sys_city_code` VALUES ('1639', '湖南省', '株洲市', '攸县', '\r\n430223', null);
INSERT INTO `sys_city_code` VALUES ('1640', '湖南省', '株洲市', '茶陵县', '\r\n430224', null);
INSERT INTO `sys_city_code` VALUES ('1641', '湖南省', '株洲市', '炎陵县', '\r\n430225', null);
INSERT INTO `sys_city_code` VALUES ('1642', '湖南省', '株洲市', '醴陵市', '\r\n430281', null);
INSERT INTO `sys_city_code` VALUES ('1643', '湖南省', '湘潭市', '雨湖区', '\r\n430302', null);
INSERT INTO `sys_city_code` VALUES ('1644', '湖南省', '湘潭市', '岳塘区', '\r\n430304', null);
INSERT INTO `sys_city_code` VALUES ('1645', '湖南省', '湘潭市', '湘潭县', '\r\n430321', null);
INSERT INTO `sys_city_code` VALUES ('1646', '湖南省', '湘潭市', '湘乡市', '\r\n430381', null);
INSERT INTO `sys_city_code` VALUES ('1647', '湖南省', '湘潭市', '韶山市', '\r\n430382', null);
INSERT INTO `sys_city_code` VALUES ('1648', '湖南省', '衡阳市', '珠晖区', '\r\n430405', null);
INSERT INTO `sys_city_code` VALUES ('1649', '湖南省', '衡阳市', '雁峰区', '\r\n430406', null);
INSERT INTO `sys_city_code` VALUES ('1650', '湖南省', '衡阳市', '石鼓区', '\r\n430407', null);
INSERT INTO `sys_city_code` VALUES ('1651', '湖南省', '衡阳市', '蒸湘区', '\r\n430408', null);
INSERT INTO `sys_city_code` VALUES ('1652', '湖南省', '衡阳市', '南岳区', '\r\n430412', null);
INSERT INTO `sys_city_code` VALUES ('1653', '湖南省', '衡阳市', '衡阳县', '\r\n430421', null);
INSERT INTO `sys_city_code` VALUES ('1654', '湖南省', '衡阳市', '衡南县', '\r\n430422', null);
INSERT INTO `sys_city_code` VALUES ('1655', '湖南省', '衡阳市', '衡山县', '\r\n430423', null);
INSERT INTO `sys_city_code` VALUES ('1656', '湖南省', '衡阳市', '衡东县', '\r\n430424', null);
INSERT INTO `sys_city_code` VALUES ('1657', '湖南省', '衡阳市', '祁东县', '\r\n430426', null);
INSERT INTO `sys_city_code` VALUES ('1658', '湖南省', '衡阳市', '耒阳市', '\r\n430481', null);
INSERT INTO `sys_city_code` VALUES ('1659', '湖南省', '衡阳市', '常宁市', '\r\n430482', null);
INSERT INTO `sys_city_code` VALUES ('1660', '湖南省', '邵阳市', '双清区', '\r\n430502', null);
INSERT INTO `sys_city_code` VALUES ('1661', '湖南省', '邵阳市', '大祥区', '\r\n430503', null);
INSERT INTO `sys_city_code` VALUES ('1662', '湖南省', '邵阳市', '北塔区', '\r\n430511', null);
INSERT INTO `sys_city_code` VALUES ('1663', '湖南省', '邵阳市', '邵东县', '\r\n430521', null);
INSERT INTO `sys_city_code` VALUES ('1664', '湖南省', '邵阳市', '新邵县', '\r\n430522', null);
INSERT INTO `sys_city_code` VALUES ('1665', '湖南省', '邵阳市', '邵阳县', '\r\n430523', null);
INSERT INTO `sys_city_code` VALUES ('1666', '湖南省', '邵阳市', '隆回县', '\r\n430524', null);
INSERT INTO `sys_city_code` VALUES ('1667', '湖南省', '邵阳市', '洞口县', '\r\n430525', null);
INSERT INTO `sys_city_code` VALUES ('1668', '湖南省', '邵阳市', '绥宁县', '\r\n430527', null);
INSERT INTO `sys_city_code` VALUES ('1669', '湖南省', '邵阳市', '新宁县', '\r\n430528', null);
INSERT INTO `sys_city_code` VALUES ('1670', '湖南省', '邵阳市', '城步苗族自治县', '\r\n430529', null);
INSERT INTO `sys_city_code` VALUES ('1671', '湖南省', '邵阳市', '武冈市', '\r\n430581', null);
INSERT INTO `sys_city_code` VALUES ('1672', '湖南省', '岳阳市', '岳阳楼区', '\r\n430602', null);
INSERT INTO `sys_city_code` VALUES ('1673', '湖南省', '岳阳市', '云溪区', '\r\n430603', null);
INSERT INTO `sys_city_code` VALUES ('1674', '湖南省', '岳阳市', '君山区', '\r\n430611', null);
INSERT INTO `sys_city_code` VALUES ('1675', '湖南省', '岳阳市', '岳阳县', '\r\n430621', null);
INSERT INTO `sys_city_code` VALUES ('1676', '湖南省', '岳阳市', '华容县', '\r\n430623', null);
INSERT INTO `sys_city_code` VALUES ('1677', '湖南省', '岳阳市', '湘阴县', '\r\n430624', null);
INSERT INTO `sys_city_code` VALUES ('1678', '湖南省', '岳阳市', '平江县', '\r\n430626', null);
INSERT INTO `sys_city_code` VALUES ('1679', '湖南省', '岳阳市', '汨罗市', '\r\n430681', null);
INSERT INTO `sys_city_code` VALUES ('1680', '湖南省', '岳阳市', '临湘市', '\r\n430682', null);
INSERT INTO `sys_city_code` VALUES ('1681', '湖南省', '常德市', '武陵区', '\r\n430702', null);
INSERT INTO `sys_city_code` VALUES ('1682', '湖南省', '常德市', '鼎城区', '\r\n430703', null);
INSERT INTO `sys_city_code` VALUES ('1683', '湖南省', '常德市', '安乡县', '\r\n430721', null);
INSERT INTO `sys_city_code` VALUES ('1684', '湖南省', '常德市', '汉寿县', '\r\n430722', null);
INSERT INTO `sys_city_code` VALUES ('1685', '湖南省', '常德市', '澧县', '\r\n430723', null);
INSERT INTO `sys_city_code` VALUES ('1686', '湖南省', '常德市', '临澧县', '\r\n430724', null);
INSERT INTO `sys_city_code` VALUES ('1687', '湖南省', '常德市', '桃源县', '\r\n430725', null);
INSERT INTO `sys_city_code` VALUES ('1688', '湖南省', '常德市', '石门县', '\r\n430726', null);
INSERT INTO `sys_city_code` VALUES ('1689', '湖南省', '常德市', '津市市', '\r\n430781', null);
INSERT INTO `sys_city_code` VALUES ('1690', '湖南省', '张家界市', '永定区', '\r\n430802', null);
INSERT INTO `sys_city_code` VALUES ('1691', '湖南省', '张家界市', '武陵源区', '\r\n430811', null);
INSERT INTO `sys_city_code` VALUES ('1692', '湖南省', '张家界市', '慈利县', '\r\n430821', null);
INSERT INTO `sys_city_code` VALUES ('1693', '湖南省', '张家界市', '桑植县', '\r\n430822', null);
INSERT INTO `sys_city_code` VALUES ('1694', '湖南省', '益阳市', '资阳区', '\r\n430902', null);
INSERT INTO `sys_city_code` VALUES ('1695', '湖南省', '益阳市', '赫山区', '\r\n430903', null);
INSERT INTO `sys_city_code` VALUES ('1696', '湖南省', '益阳市', '南县', '\r\n430921', null);
INSERT INTO `sys_city_code` VALUES ('1697', '湖南省', '益阳市', '桃江县', '\r\n430922', null);
INSERT INTO `sys_city_code` VALUES ('1698', '湖南省', '益阳市', '安化县', '\r\n430923', null);
INSERT INTO `sys_city_code` VALUES ('1699', '湖南省', '益阳市', '沅江市', '\r\n430981', null);
INSERT INTO `sys_city_code` VALUES ('1700', '湖南省', '郴州市', '北湖区', '\r\n431002', null);
INSERT INTO `sys_city_code` VALUES ('1701', '湖南省', '郴州市', '苏仙区', '\r\n431003', null);
INSERT INTO `sys_city_code` VALUES ('1702', '湖南省', '郴州市', '桂阳县', '\r\n431021', null);
INSERT INTO `sys_city_code` VALUES ('1703', '湖南省', '郴州市', '宜章县', '\r\n431022', null);
INSERT INTO `sys_city_code` VALUES ('1704', '湖南省', '郴州市', '永兴县', '\r\n431023', null);
INSERT INTO `sys_city_code` VALUES ('1705', '湖南省', '郴州市', '嘉禾县', '\r\n431024', null);
INSERT INTO `sys_city_code` VALUES ('1706', '湖南省', '郴州市', '临武县', '\r\n431025', null);
INSERT INTO `sys_city_code` VALUES ('1707', '湖南省', '郴州市', '汝城县', '\r\n431026', null);
INSERT INTO `sys_city_code` VALUES ('1708', '湖南省', '郴州市', '桂东县', '\r\n431027', null);
INSERT INTO `sys_city_code` VALUES ('1709', '湖南省', '郴州市', '安仁县', '\r\n431028', null);
INSERT INTO `sys_city_code` VALUES ('1710', '湖南省', '郴州市', '资兴市', '\r\n431081', null);
INSERT INTO `sys_city_code` VALUES ('1711', '湖南省', '永州市', '芝山区', '\r\n431102', null);
INSERT INTO `sys_city_code` VALUES ('1712', '湖南省', '永州市', '冷水滩区', '\r\n431103', null);
INSERT INTO `sys_city_code` VALUES ('1713', '湖南省', '永州市', '祁阳县', '\r\n431121', null);
INSERT INTO `sys_city_code` VALUES ('1714', '湖南省', '永州市', '东安县', '\r\n431122', null);
INSERT INTO `sys_city_code` VALUES ('1715', '湖南省', '永州市', '双牌县', '\r\n431123', null);
INSERT INTO `sys_city_code` VALUES ('1716', '湖南省', '永州市', '道县', '\r\n431124', null);
INSERT INTO `sys_city_code` VALUES ('1717', '湖南省', '永州市', '江永县', '\r\n431125', null);
INSERT INTO `sys_city_code` VALUES ('1718', '湖南省', '永州市', '宁远县', '\r\n431126', null);
INSERT INTO `sys_city_code` VALUES ('1719', '湖南省', '永州市', '蓝山县', '\r\n431127', null);
INSERT INTO `sys_city_code` VALUES ('1720', '湖南省', '永州市', '新田县', '\r\n431128', null);
INSERT INTO `sys_city_code` VALUES ('1721', '湖南省', '永州市', '江华瑶族自治县', '\r\n431129', null);
INSERT INTO `sys_city_code` VALUES ('1722', '湖南省', '怀化市', '鹤城区', '\r\n431202', null);
INSERT INTO `sys_city_code` VALUES ('1723', '湖南省', '怀化市', '中方县', '\r\n431221', null);
INSERT INTO `sys_city_code` VALUES ('1724', '湖南省', '怀化市', '沅陵县', '\r\n431222', null);
INSERT INTO `sys_city_code` VALUES ('1725', '湖南省', '怀化市', '辰溪县', '\r\n431223', null);
INSERT INTO `sys_city_code` VALUES ('1726', '湖南省', '怀化市', '溆浦县', '\r\n431224', null);
INSERT INTO `sys_city_code` VALUES ('1727', '湖南省', '怀化市', '会同县', '\r\n431225', null);
INSERT INTO `sys_city_code` VALUES ('1728', '湖南省', '怀化市', '麻阳苗族自治县', '\r\n431226', null);
INSERT INTO `sys_city_code` VALUES ('1729', '湖南省', '怀化市', '新晃侗族自治县', '\r\n431227', null);
INSERT INTO `sys_city_code` VALUES ('1730', '湖南省', '怀化市', '芷江侗族自治县', '\r\n431228', null);
INSERT INTO `sys_city_code` VALUES ('1731', '湖南省', '怀化市', '靖州苗族侗族自治县', '\r\n431229', null);
INSERT INTO `sys_city_code` VALUES ('1732', '湖南省', '怀化市', '通道侗族自治县', '\r\n431230', null);
INSERT INTO `sys_city_code` VALUES ('1733', '湖南省', '怀化市', '洪江市', '\r\n431281', null);
INSERT INTO `sys_city_code` VALUES ('1734', '湖南省', '娄底市', '娄星区', '\r\n431302', null);
INSERT INTO `sys_city_code` VALUES ('1735', '湖南省', '娄底市', '双峰县', '\r\n431321', null);
INSERT INTO `sys_city_code` VALUES ('1736', '湖南省', '娄底市', '新化县', '\r\n431322', null);
INSERT INTO `sys_city_code` VALUES ('1737', '湖南省', '娄底市', '冷水江市', '\r\n431381', null);
INSERT INTO `sys_city_code` VALUES ('1738', '湖南省', '娄底市', '涟源市', '\r\n431382', null);
INSERT INTO `sys_city_code` VALUES ('1739', '湖南省', '湘西土家族苗族自治州', '吉首市', '\r\n433101', null);
INSERT INTO `sys_city_code` VALUES ('1740', '湖南省', '湘西土家族苗族自治州', '泸溪县', '\r\n433122', null);
INSERT INTO `sys_city_code` VALUES ('1741', '湖南省', '湘西土家族苗族自治州', '凤凰县', '\r\n433123', null);
INSERT INTO `sys_city_code` VALUES ('1742', '湖南省', '湘西土家族苗族自治州', '花垣县', '\r\n433124', null);
INSERT INTO `sys_city_code` VALUES ('1743', '湖南省', '湘西土家族苗族自治州', '保靖县', '\r\n433125', null);
INSERT INTO `sys_city_code` VALUES ('1744', '湖南省', '湘西土家族苗族自治州', '古丈县', '\r\n433126', null);
INSERT INTO `sys_city_code` VALUES ('1745', '湖南省', '湘西土家族苗族自治州', '永顺县', '\r\n433127', null);
INSERT INTO `sys_city_code` VALUES ('1746', '湖南省', '湘西土家族苗族自治州', '龙山县', '\r\n433130', null);
INSERT INTO `sys_city_code` VALUES ('1747', '广东省', '广州市', '东山区', '\r\n440102', null);
INSERT INTO `sys_city_code` VALUES ('1748', '广东省', '广州市', '荔湾区', '\r\n440103', null);
INSERT INTO `sys_city_code` VALUES ('1749', '广东省', '广州市', '越秀区', '\r\n440104', null);
INSERT INTO `sys_city_code` VALUES ('1750', '广东省', '广州市', '海珠区', '\r\n440105', null);
INSERT INTO `sys_city_code` VALUES ('1751', '广东省', '广州市', '天河区', '\r\n440106', null);
INSERT INTO `sys_city_code` VALUES ('1752', '广东省', '广州市', '芳村区', '\r\n440107', null);
INSERT INTO `sys_city_code` VALUES ('1753', '广东省', '广州市', '白云区', '\r\n440111', null);
INSERT INTO `sys_city_code` VALUES ('1754', '广东省', '广州市', '黄埔区', '\r\n440112', null);
INSERT INTO `sys_city_code` VALUES ('1755', '广东省', '广州市', '番禺区', '\r\n440113', null);
INSERT INTO `sys_city_code` VALUES ('1756', '广东省', '广州市', '花都区', '\r\n440114', null);
INSERT INTO `sys_city_code` VALUES ('1757', '广东省', '广州市', '增城市', '\r\n440183', null);
INSERT INTO `sys_city_code` VALUES ('1758', '广东省', '广州市', '从化市', '\r\n440184', null);
INSERT INTO `sys_city_code` VALUES ('1759', '广东省', '韶关市', '北江区', '\r\n440202', null);
INSERT INTO `sys_city_code` VALUES ('1760', '广东省', '韶关市', '武江区', '\r\n440203', null);
INSERT INTO `sys_city_code` VALUES ('1761', '广东省', '韶关市', '浈江区', '\r\n440204', null);
INSERT INTO `sys_city_code` VALUES ('1762', '广东省', '韶关市', '曲江县', '\r\n440221', null);
INSERT INTO `sys_city_code` VALUES ('1763', '广东省', '韶关市', '始兴县', '\r\n440222', null);
INSERT INTO `sys_city_code` VALUES ('1764', '广东省', '韶关市', '仁化县', '\r\n440224', null);
INSERT INTO `sys_city_code` VALUES ('1765', '广东省', '韶关市', '翁源县', '\r\n440229', null);
INSERT INTO `sys_city_code` VALUES ('1766', '广东省', '韶关市', '乳源瑶族自治县', '\r\n440232', null);
INSERT INTO `sys_city_code` VALUES ('1767', '广东省', '韶关市', '新丰县', '\r\n440233', null);
INSERT INTO `sys_city_code` VALUES ('1768', '广东省', '韶关市', '乐昌市', '\r\n440281', null);
INSERT INTO `sys_city_code` VALUES ('1769', '广东省', '韶关市', '南雄市', '\r\n440282', null);
INSERT INTO `sys_city_code` VALUES ('1770', '广东省', '深圳市', '罗湖区', '\r\n440303', null);
INSERT INTO `sys_city_code` VALUES ('1771', '广东省', '深圳市', '福田区', '\r\n440304', null);
INSERT INTO `sys_city_code` VALUES ('1772', '广东省', '深圳市', '南山区', '\r\n440305', null);
INSERT INTO `sys_city_code` VALUES ('1773', '广东省', '深圳市', '宝安区', '\r\n440306', null);
INSERT INTO `sys_city_code` VALUES ('1774', '广东省', '深圳市', '龙岗区', '\r\n440307', null);
INSERT INTO `sys_city_code` VALUES ('1775', '广东省', '深圳市', '盐田区', '\r\n440308', null);
INSERT INTO `sys_city_code` VALUES ('1776', '广东省', '珠海市', '香洲区', '\r\n440402', null);
INSERT INTO `sys_city_code` VALUES ('1777', '广东省', '珠海市', '斗门区', '\r\n440403', null);
INSERT INTO `sys_city_code` VALUES ('1778', '广东省', '珠海市', '金湾区', '\r\n440404', null);
INSERT INTO `sys_city_code` VALUES ('1779', '广东省', '汕头市', '龙湖区', '\r\n440507', null);
INSERT INTO `sys_city_code` VALUES ('1780', '广东省', '汕头市', '金平区', '\r\n440511', null);
INSERT INTO `sys_city_code` VALUES ('1781', '广东省', '汕头市', '濠江区', '\r\n440512', null);
INSERT INTO `sys_city_code` VALUES ('1782', '广东省', '汕头市', '潮阳区', '\r\n440513', null);
INSERT INTO `sys_city_code` VALUES ('1783', '广东省', '汕头市', '潮南区', '\r\n440514', null);
INSERT INTO `sys_city_code` VALUES ('1784', '广东省', '汕头市', '澄海区', '\r\n440515', null);
INSERT INTO `sys_city_code` VALUES ('1785', '广东省', '汕头市', '南澳县', '\r\n440523', null);
INSERT INTO `sys_city_code` VALUES ('1786', '广东省', '佛山市', '禅城区', '\r\n440604', null);
INSERT INTO `sys_city_code` VALUES ('1787', '广东省', '佛山市', '南海区', '\r\n440605', null);
INSERT INTO `sys_city_code` VALUES ('1788', '广东省', '佛山市', '顺德区', '\r\n440606', null);
INSERT INTO `sys_city_code` VALUES ('1789', '广东省', '佛山市', '三水区', '\r\n440607', null);
INSERT INTO `sys_city_code` VALUES ('1790', '广东省', '佛山市', '高明区', '\r\n440608', null);
INSERT INTO `sys_city_code` VALUES ('1791', '广东省', '江门市', '蓬江区', '\r\n440703', null);
INSERT INTO `sys_city_code` VALUES ('1792', '广东省', '江门市', '江海区', '\r\n440704', null);
INSERT INTO `sys_city_code` VALUES ('1793', '广东省', '江门市', '新会区', '\r\n440705', null);
INSERT INTO `sys_city_code` VALUES ('1794', '广东省', '江门市', '台山市', '\r\n440781', null);
INSERT INTO `sys_city_code` VALUES ('1795', '广东省', '江门市', '开平市', '\r\n440783', null);
INSERT INTO `sys_city_code` VALUES ('1796', '广东省', '江门市', '鹤山市', '\r\n440784', null);
INSERT INTO `sys_city_code` VALUES ('1797', '广东省', '江门市', '恩平市', '\r\n440785', null);
INSERT INTO `sys_city_code` VALUES ('1798', '广东省', '湛江市', '赤坎区', '\r\n440802', null);
INSERT INTO `sys_city_code` VALUES ('1799', '广东省', '湛江市', '霞山区', '\r\n440803', null);
INSERT INTO `sys_city_code` VALUES ('1800', '广东省', '湛江市', '坡头区', '\r\n440804', null);
INSERT INTO `sys_city_code` VALUES ('1801', '广东省', '湛江市', '麻章区', '\r\n440811', null);
INSERT INTO `sys_city_code` VALUES ('1802', '广东省', '湛江市', '遂溪县', '\r\n440823', null);
INSERT INTO `sys_city_code` VALUES ('1803', '广东省', '湛江市', '徐闻县', '\r\n440825', null);
INSERT INTO `sys_city_code` VALUES ('1804', '广东省', '湛江市', '廉江市', '\r\n440881', null);
INSERT INTO `sys_city_code` VALUES ('1805', '广东省', '湛江市', '雷州市', '\r\n440882', null);
INSERT INTO `sys_city_code` VALUES ('1806', '广东省', '湛江市', '吴川市', '\r\n440883', null);
INSERT INTO `sys_city_code` VALUES ('1807', '广东省', '茂名市', '茂南区', '\r\n440902', null);
INSERT INTO `sys_city_code` VALUES ('1808', '广东省', '茂名市', '茂港区', '\r\n440903', null);
INSERT INTO `sys_city_code` VALUES ('1809', '广东省', '茂名市', '电白县', '\r\n440923', null);
INSERT INTO `sys_city_code` VALUES ('1810', '广东省', '茂名市', '高州市', '\r\n440981', null);
INSERT INTO `sys_city_code` VALUES ('1811', '广东省', '茂名市', '化州市', '\r\n440982', null);
INSERT INTO `sys_city_code` VALUES ('1812', '广东省', '茂名市', '信宜市', '\r\n440983', null);
INSERT INTO `sys_city_code` VALUES ('1813', '广东省', '肇庆市', '端州区', '\r\n441202', null);
INSERT INTO `sys_city_code` VALUES ('1814', '广东省', '肇庆市', '鼎湖区', '\r\n441203', null);
INSERT INTO `sys_city_code` VALUES ('1815', '广东省', '肇庆市', '广宁县', '\r\n441223', null);
INSERT INTO `sys_city_code` VALUES ('1816', '广东省', '肇庆市', '怀集县', '\r\n441224', null);
INSERT INTO `sys_city_code` VALUES ('1817', '广东省', '肇庆市', '封开县', '\r\n441225', null);
INSERT INTO `sys_city_code` VALUES ('1818', '广东省', '肇庆市', '德庆县', '\r\n441226', null);
INSERT INTO `sys_city_code` VALUES ('1819', '广东省', '肇庆市', '高要市', '\r\n441283', null);
INSERT INTO `sys_city_code` VALUES ('1820', '广东省', '肇庆市', '四会市', '\r\n441284', null);
INSERT INTO `sys_city_code` VALUES ('1821', '广东省', '惠州市', '惠城区', '\r\n441302', null);
INSERT INTO `sys_city_code` VALUES ('1822', '广东省', '惠州市', '惠阳区', '\r\n441303', null);
INSERT INTO `sys_city_code` VALUES ('1823', '广东省', '惠州市', '博罗县', '\r\n441322', null);
INSERT INTO `sys_city_code` VALUES ('1824', '广东省', '惠州市', '惠东县', '\r\n441323', null);
INSERT INTO `sys_city_code` VALUES ('1825', '广东省', '惠州市', '龙门县', '\r\n441324', null);
INSERT INTO `sys_city_code` VALUES ('1826', '广东省', '梅州市', '梅江区', '\r\n441402', null);
INSERT INTO `sys_city_code` VALUES ('1827', '广东省', '梅州市', '梅县', '\r\n441421', null);
INSERT INTO `sys_city_code` VALUES ('1828', '广东省', '梅州市', '大埔县', '\r\n441422', null);
INSERT INTO `sys_city_code` VALUES ('1829', '广东省', '梅州市', '丰顺县', '\r\n441423', null);
INSERT INTO `sys_city_code` VALUES ('1830', '广东省', '梅州市', '五华县', '\r\n441424', null);
INSERT INTO `sys_city_code` VALUES ('1831', '广东省', '梅州市', '平远县', '\r\n441426', null);
INSERT INTO `sys_city_code` VALUES ('1832', '广东省', '梅州市', '蕉岭县', '\r\n441427', null);
INSERT INTO `sys_city_code` VALUES ('1833', '广东省', '梅州市', '兴宁市', '\r\n441481', null);
INSERT INTO `sys_city_code` VALUES ('1834', '广东省', '汕尾市', '城区', '\r\n441502', null);
INSERT INTO `sys_city_code` VALUES ('1835', '广东省', '汕尾市', '海丰县', '\r\n441521', null);
INSERT INTO `sys_city_code` VALUES ('1836', '广东省', '汕尾市', '陆河县', '\r\n441523', null);
INSERT INTO `sys_city_code` VALUES ('1837', '广东省', '汕尾市', '陆丰市', '\r\n441581', null);
INSERT INTO `sys_city_code` VALUES ('1838', '广东省', '河源市', '源城区', '\r\n441602', null);
INSERT INTO `sys_city_code` VALUES ('1839', '广东省', '河源市', '紫金县', '\r\n441621', null);
INSERT INTO `sys_city_code` VALUES ('1840', '广东省', '河源市', '龙川县', '\r\n441622', null);
INSERT INTO `sys_city_code` VALUES ('1841', '广东省', '河源市', '连平县', '\r\n441623', null);
INSERT INTO `sys_city_code` VALUES ('1842', '广东省', '河源市', '和平县', '\r\n441624', null);
INSERT INTO `sys_city_code` VALUES ('1843', '广东省', '河源市', '东源县', '\r\n441625', null);
INSERT INTO `sys_city_code` VALUES ('1844', '广东省', '阳江市', '江城区', '\r\n441702', null);
INSERT INTO `sys_city_code` VALUES ('1845', '广东省', '阳江市', '阳西县', '\r\n441721', null);
INSERT INTO `sys_city_code` VALUES ('1846', '广东省', '阳江市', '阳东县', '\r\n441723', null);
INSERT INTO `sys_city_code` VALUES ('1847', '广东省', '阳江市', '阳春市', '\r\n441781', null);
INSERT INTO `sys_city_code` VALUES ('1848', '广东省', '清远市', '清城区', '\r\n441802', null);
INSERT INTO `sys_city_code` VALUES ('1849', '广东省', '清远市', '佛冈县', '\r\n441821', null);
INSERT INTO `sys_city_code` VALUES ('1850', '广东省', '清远市', '阳山县', '\r\n441823', null);
INSERT INTO `sys_city_code` VALUES ('1851', '广东省', '清远市', '连山壮族瑶族自治县', '\r\n441825', null);
INSERT INTO `sys_city_code` VALUES ('1852', '广东省', '清远市', '连南瑶族自治县', '\r\n441826', null);
INSERT INTO `sys_city_code` VALUES ('1853', '广东省', '清远市', '清新县', '\r\n441827', null);
INSERT INTO `sys_city_code` VALUES ('1854', '广东省', '清远市', '英德市', '\r\n441881', null);
INSERT INTO `sys_city_code` VALUES ('1855', '广东省', '清远市', '连州市', '\r\n441882', null);
INSERT INTO `sys_city_code` VALUES ('1856', '广东省', '东莞市', '东莞', '\r\n441900', null);
INSERT INTO `sys_city_code` VALUES ('1857', '广东省', '中山市', '中山', '\r\n442000', null);
INSERT INTO `sys_city_code` VALUES ('1858', '广东省', '潮州市', '湘桥区', '\r\n445102', null);
INSERT INTO `sys_city_code` VALUES ('1859', '广东省', '潮州市', '潮安县', '\r\n445121', null);
INSERT INTO `sys_city_code` VALUES ('1860', '广东省', '潮州市', '饶平县', '\r\n445122', null);
INSERT INTO `sys_city_code` VALUES ('1861', '广东省', '揭阳市', '榕城区', '\r\n445202', null);
INSERT INTO `sys_city_code` VALUES ('1862', '广东省', '揭阳市', '揭东县', '\r\n445221', null);
INSERT INTO `sys_city_code` VALUES ('1863', '广东省', '揭阳市', '揭西县', '\r\n445222', null);
INSERT INTO `sys_city_code` VALUES ('1864', '广东省', '揭阳市', '惠来县', '\r\n445224', null);
INSERT INTO `sys_city_code` VALUES ('1865', '广东省', '揭阳市', '普宁市', '\r\n445281', null);
INSERT INTO `sys_city_code` VALUES ('1866', '广东省', '云浮市', '云城区', '\r\n445302', null);
INSERT INTO `sys_city_code` VALUES ('1867', '广东省', '云浮市', '新兴县', '\r\n445321', null);
INSERT INTO `sys_city_code` VALUES ('1868', '广东省', '云浮市', '郁南县', '\r\n445322', null);
INSERT INTO `sys_city_code` VALUES ('1869', '广东省', '云浮市', '云安县', '\r\n445323', null);
INSERT INTO `sys_city_code` VALUES ('1870', '广东省', '云浮市', '罗定市', '\r\n445381', null);
INSERT INTO `sys_city_code` VALUES ('1871', '广西壮族自治区', '南宁市', '兴宁区', '\r\n450102', null);
INSERT INTO `sys_city_code` VALUES ('1872', '广西壮族自治区', '南宁市', '新城区', '\r\n450103', null);
INSERT INTO `sys_city_code` VALUES ('1873', '广西壮族自治区', '南宁市', '城北区', '\r\n450104', null);
INSERT INTO `sys_city_code` VALUES ('1874', '广西壮族自治区', '南宁市', '江南区', '\r\n450105', null);
INSERT INTO `sys_city_code` VALUES ('1875', '广西壮族自治区', '南宁市', '永新区', '\r\n450106', null);
INSERT INTO `sys_city_code` VALUES ('1876', '广西壮族自治区', '南宁市', '邕宁县', '\r\n450121', null);
INSERT INTO `sys_city_code` VALUES ('1877', '广西壮族自治区', '南宁市', '武鸣县', '\r\n450122', null);
INSERT INTO `sys_city_code` VALUES ('1878', '广西壮族自治区', '南宁市', '隆安县', '\r\n450123', null);
INSERT INTO `sys_city_code` VALUES ('1879', '广西壮族自治区', '南宁市', '马山县', '\r\n450124', null);
INSERT INTO `sys_city_code` VALUES ('1880', '广西壮族自治区', '南宁市', '上林县', '\r\n450125', null);
INSERT INTO `sys_city_code` VALUES ('1881', '广西壮族自治区', '南宁市', '宾阳县', '\r\n450126', null);
INSERT INTO `sys_city_code` VALUES ('1882', '广西壮族自治区', '南宁市', '横县', '\r\n450127', null);
INSERT INTO `sys_city_code` VALUES ('1883', '广西壮族自治区', '柳州市', '城中区', '\r\n450202', null);
INSERT INTO `sys_city_code` VALUES ('1884', '广西壮族自治区', '柳州市', '鱼峰区', '\r\n450203', null);
INSERT INTO `sys_city_code` VALUES ('1885', '广西壮族自治区', '柳州市', '柳南区', '\r\n450204', null);
INSERT INTO `sys_city_code` VALUES ('1886', '广西壮族自治区', '柳州市', '柳北区', '\r\n450205', null);
INSERT INTO `sys_city_code` VALUES ('1887', '广西壮族自治区', '柳州市', '柳江县', '\r\n450221', null);
INSERT INTO `sys_city_code` VALUES ('1888', '广西壮族自治区', '柳州市', '柳城县', '\r\n450222', null);
INSERT INTO `sys_city_code` VALUES ('1889', '广西壮族自治区', '柳州市', '鹿寨县', '\r\n450223', null);
INSERT INTO `sys_city_code` VALUES ('1890', '广西壮族自治区', '柳州市', '融安县', '\r\n450224', null);
INSERT INTO `sys_city_code` VALUES ('1891', '广西壮族自治区', '柳州市', '融水苗族自治县', '\r\n450225', null);
INSERT INTO `sys_city_code` VALUES ('1892', '广西壮族自治区', '柳州市', '三江侗族自治县', '\r\n450226', null);
INSERT INTO `sys_city_code` VALUES ('1893', '广西壮族自治区', '桂林市', '秀峰区', '\r\n450302', null);
INSERT INTO `sys_city_code` VALUES ('1894', '广西壮族自治区', '桂林市', '叠彩区', '\r\n450303', null);
INSERT INTO `sys_city_code` VALUES ('1895', '广西壮族自治区', '桂林市', '象山区', '\r\n450304', null);
INSERT INTO `sys_city_code` VALUES ('1896', '广西壮族自治区', '桂林市', '七星区', '\r\n450305', null);
INSERT INTO `sys_city_code` VALUES ('1897', '广西壮族自治区', '桂林市', '雁山区', '\r\n450311', null);
INSERT INTO `sys_city_code` VALUES ('1898', '广西壮族自治区', '桂林市', '阳朔县', '\r\n450321', null);
INSERT INTO `sys_city_code` VALUES ('1899', '广西壮族自治区', '桂林市', '临桂县', '\r\n450322', null);
INSERT INTO `sys_city_code` VALUES ('1900', '广西壮族自治区', '桂林市', '灵川县', '\r\n450323', null);
INSERT INTO `sys_city_code` VALUES ('1901', '广西壮族自治区', '桂林市', '全州县', '\r\n450324', null);
INSERT INTO `sys_city_code` VALUES ('1902', '广西壮族自治区', '桂林市', '兴安县', '\r\n450325', null);
INSERT INTO `sys_city_code` VALUES ('1903', '广西壮族自治区', '桂林市', '永福县', '\r\n450326', null);
INSERT INTO `sys_city_code` VALUES ('1904', '广西壮族自治区', '桂林市', '灌阳县', '\r\n450327', null);
INSERT INTO `sys_city_code` VALUES ('1905', '广西壮族自治区', '桂林市', '龙胜各族自治县', '\r\n450328', null);
INSERT INTO `sys_city_code` VALUES ('1906', '广西壮族自治区', '桂林市', '资源县', '\r\n450329', null);
INSERT INTO `sys_city_code` VALUES ('1907', '广西壮族自治区', '桂林市', '平乐县', '\r\n450330', null);
INSERT INTO `sys_city_code` VALUES ('1908', '广西壮族自治区', '桂林市', '荔蒲县', '\r\n450331', null);
INSERT INTO `sys_city_code` VALUES ('1909', '广西壮族自治区', '桂林市', '恭城瑶族自治县', '\r\n450332', null);
INSERT INTO `sys_city_code` VALUES ('1910', '广西壮族自治区', '梧州市', '万秀区', '\r\n450403', null);
INSERT INTO `sys_city_code` VALUES ('1911', '广西壮族自治区', '梧州市', '蝶山区', '\r\n450404', null);
INSERT INTO `sys_city_code` VALUES ('1912', '广西壮族自治区', '梧州市', '长洲区', '\r\n450405', null);
INSERT INTO `sys_city_code` VALUES ('1913', '广西壮族自治区', '梧州市', '苍梧县', '\r\n450421', null);
INSERT INTO `sys_city_code` VALUES ('1914', '广西壮族自治区', '梧州市', '藤县', '\r\n450422', null);
INSERT INTO `sys_city_code` VALUES ('1915', '广西壮族自治区', '梧州市', '蒙山县', '\r\n450423', null);
INSERT INTO `sys_city_code` VALUES ('1916', '广西壮族自治区', '梧州市', '岑溪市', '\r\n450481', null);
INSERT INTO `sys_city_code` VALUES ('1917', '广西壮族自治区', '北海市', '海城区', '\r\n450502', null);
INSERT INTO `sys_city_code` VALUES ('1918', '广西壮族自治区', '北海市', '银海区', '\r\n450503', null);
INSERT INTO `sys_city_code` VALUES ('1919', '广西壮族自治区', '北海市', '铁山港区', '\r\n450512', null);
INSERT INTO `sys_city_code` VALUES ('1920', '广西壮族自治区', '北海市', '合浦县', '\r\n450521', null);
INSERT INTO `sys_city_code` VALUES ('1921', '广西壮族自治区', '防城港市', '港口区', '\r\n450602', null);
INSERT INTO `sys_city_code` VALUES ('1922', '广西壮族自治区', '防城港市', '防城区', '\r\n450603', null);
INSERT INTO `sys_city_code` VALUES ('1923', '广西壮族自治区', '防城港市', '上思县', '\r\n450621', null);
INSERT INTO `sys_city_code` VALUES ('1924', '广西壮族自治区', '防城港市', '东兴市', '\r\n450681', null);
INSERT INTO `sys_city_code` VALUES ('1925', '广西壮族自治区', '钦州市', '钦南区', '\r\n450702', null);
INSERT INTO `sys_city_code` VALUES ('1926', '广西壮族自治区', '钦州市', '钦北区', '\r\n450703', null);
INSERT INTO `sys_city_code` VALUES ('1927', '广西壮族自治区', '钦州市', '灵山县', '\r\n450721', null);
INSERT INTO `sys_city_code` VALUES ('1928', '广西壮族自治区', '钦州市', '浦北县', '\r\n450722', null);
INSERT INTO `sys_city_code` VALUES ('1929', '广西壮族自治区', '贵港市', '港北区', '\r\n450802', null);
INSERT INTO `sys_city_code` VALUES ('1930', '广西壮族自治区', '贵港市', '港南区', '\r\n450803', null);
INSERT INTO `sys_city_code` VALUES ('1931', '广西壮族自治区', '贵港市', '覃塘区', '\r\n450804', null);
INSERT INTO `sys_city_code` VALUES ('1932', '广西壮族自治区', '贵港市', '平南县', '\r\n450821', null);
INSERT INTO `sys_city_code` VALUES ('1933', '广西壮族自治区', '贵港市', '桂平市', '\r\n450881', null);
INSERT INTO `sys_city_code` VALUES ('1934', '广西壮族自治区', '玉林市', '玉州区', '\r\n450902', null);
INSERT INTO `sys_city_code` VALUES ('1935', '广西壮族自治区', '玉林市', '容县', '\r\n450921', null);
INSERT INTO `sys_city_code` VALUES ('1936', '广西壮族自治区', '玉林市', '陆川县', '\r\n450922', null);
INSERT INTO `sys_city_code` VALUES ('1937', '广西壮族自治区', '玉林市', '博白县', '\r\n450923', null);
INSERT INTO `sys_city_code` VALUES ('1938', '广西壮族自治区', '玉林市', '兴业县', '\r\n450924', null);
INSERT INTO `sys_city_code` VALUES ('1939', '广西壮族自治区', '玉林市', '北流市', '\r\n450981', null);
INSERT INTO `sys_city_code` VALUES ('1940', '广西壮族自治区', '百色市', '右江区', '\r\n451002', null);
INSERT INTO `sys_city_code` VALUES ('1941', '广西壮族自治区', '百色市', '田阳县', '\r\n451021', null);
INSERT INTO `sys_city_code` VALUES ('1942', '广西壮族自治区', '百色市', '田东县', '\r\n451022', null);
INSERT INTO `sys_city_code` VALUES ('1943', '广西壮族自治区', '百色市', '平果县', '\r\n451023', null);
INSERT INTO `sys_city_code` VALUES ('1944', '广西壮族自治区', '百色市', '德保县', '\r\n451024', null);
INSERT INTO `sys_city_code` VALUES ('1945', '广西壮族自治区', '百色市', '靖西县', '\r\n451025', null);
INSERT INTO `sys_city_code` VALUES ('1946', '广西壮族自治区', '百色市', '那坡县', '\r\n451026', null);
INSERT INTO `sys_city_code` VALUES ('1947', '广西壮族自治区', '百色市', '凌云县', '\r\n451027', null);
INSERT INTO `sys_city_code` VALUES ('1948', '广西壮族自治区', '百色市', '乐业县', '\r\n451028', null);
INSERT INTO `sys_city_code` VALUES ('1949', '广西壮族自治区', '百色市', '田林县', '\r\n451029', null);
INSERT INTO `sys_city_code` VALUES ('1950', '广西壮族自治区', '百色市', '西林县', '\r\n451030', null);
INSERT INTO `sys_city_code` VALUES ('1951', '广西壮族自治区', '百色市', '隆林各族自治县', '\r\n451031', null);
INSERT INTO `sys_city_code` VALUES ('1952', '广西壮族自治区', '贺州市', '八步区', '\r\n451102', null);
INSERT INTO `sys_city_code` VALUES ('1953', '广西壮族自治区', '贺州市', '昭平县', '\r\n451121', null);
INSERT INTO `sys_city_code` VALUES ('1954', '广西壮族自治区', '贺州市', '钟山县', '\r\n451122', null);
INSERT INTO `sys_city_code` VALUES ('1955', '广西壮族自治区', '贺州市', '富川瑶族自治县', '\r\n451123', null);
INSERT INTO `sys_city_code` VALUES ('1956', '广西壮族自治区', '河池市', '金城江区', '\r\n451202', null);
INSERT INTO `sys_city_code` VALUES ('1957', '广西壮族自治区', '河池市', '南丹县', '\r\n451221', null);
INSERT INTO `sys_city_code` VALUES ('1958', '广西壮族自治区', '河池市', '天峨县', '\r\n451222', null);
INSERT INTO `sys_city_code` VALUES ('1959', '广西壮族自治区', '河池市', '凤山县', '\r\n451223', null);
INSERT INTO `sys_city_code` VALUES ('1960', '广西壮族自治区', '河池市', '东兰县', '\r\n451224', null);
INSERT INTO `sys_city_code` VALUES ('1961', '广西壮族自治区', '河池市', '罗城仫佬族自治县', '\r\n451225', null);
INSERT INTO `sys_city_code` VALUES ('1962', '广西壮族自治区', '河池市', '环江毛南族自治县', '\r\n451226', null);
INSERT INTO `sys_city_code` VALUES ('1963', '广西壮族自治区', '河池市', '巴马瑶族自治县', '\r\n451227', null);
INSERT INTO `sys_city_code` VALUES ('1964', '广西壮族自治区', '河池市', '都安瑶族自治县', '\r\n451228', null);
INSERT INTO `sys_city_code` VALUES ('1965', '广西壮族自治区', '河池市', '大化瑶族自治县', '\r\n451229', null);
INSERT INTO `sys_city_code` VALUES ('1966', '广西壮族自治区', '河池市', '宜州市', '\r\n451281', null);
INSERT INTO `sys_city_code` VALUES ('1967', '广西壮族自治区', '来宾市', '兴宾区', '\r\n451302', null);
INSERT INTO `sys_city_code` VALUES ('1968', '广西壮族自治区', '来宾市', '忻城县', '\r\n451321', null);
INSERT INTO `sys_city_code` VALUES ('1969', '广西壮族自治区', '来宾市', '象州县', '\r\n451322', null);
INSERT INTO `sys_city_code` VALUES ('1970', '广西壮族自治区', '来宾市', '武宣县', '\r\n451323', null);
INSERT INTO `sys_city_code` VALUES ('1971', '广西壮族自治区', '来宾市', '金秀瑶族自治县', '\r\n451324', null);
INSERT INTO `sys_city_code` VALUES ('1972', '广西壮族自治区', '来宾市', '合山市', '\r\n451381', null);
INSERT INTO `sys_city_code` VALUES ('1973', '广西壮族自治区', '崇左市', '江洲区', '\r\n451402', null);
INSERT INTO `sys_city_code` VALUES ('1974', '广西壮族自治区', '崇左市', '扶绥县', '\r\n451421', null);
INSERT INTO `sys_city_code` VALUES ('1975', '广西壮族自治区', '崇左市', '宁明县', '\r\n451422', null);
INSERT INTO `sys_city_code` VALUES ('1976', '广西壮族自治区', '崇左市', '龙州县', '\r\n451423', null);
INSERT INTO `sys_city_code` VALUES ('1977', '广西壮族自治区', '崇左市', '大新县', '\r\n451424', null);
INSERT INTO `sys_city_code` VALUES ('1978', '广西壮族自治区', '崇左市', '天等县', '\r\n451425', null);
INSERT INTO `sys_city_code` VALUES ('1979', '广西壮族自治区', '崇左市', '凭祥市', '\r\n451481', null);
INSERT INTO `sys_city_code` VALUES ('1980', '海南省', '海口市', '秀英区', '\r\n460105', null);
INSERT INTO `sys_city_code` VALUES ('1981', '海南省', '海口市', '龙华区', '\r\n460106', null);
INSERT INTO `sys_city_code` VALUES ('1982', '海南省', '海口市', '琼山区', '\r\n460107', null);
INSERT INTO `sys_city_code` VALUES ('1983', '海南省', '海口市', '美兰区', '\r\n460108', null);
INSERT INTO `sys_city_code` VALUES ('1984', '海南省', '三亚市', '三亚', '\r\n460200', null);
INSERT INTO `sys_city_code` VALUES ('1985', '海南省', '省直辖行政单位', '五指山市', '\r\n469001', null);
INSERT INTO `sys_city_code` VALUES ('1986', '海南省', '省直辖行政单位', '琼海市', '\r\n469002', null);
INSERT INTO `sys_city_code` VALUES ('1987', '海南省', '省直辖行政单位', '儋州市', '\r\n469003', null);
INSERT INTO `sys_city_code` VALUES ('1988', '海南省', '省直辖行政单位', '文昌市', '\r\n469005', null);
INSERT INTO `sys_city_code` VALUES ('1989', '海南省', '省直辖行政单位', '万宁市', '\r\n469006', null);
INSERT INTO `sys_city_code` VALUES ('1990', '海南省', '省直辖行政单位', '东方市', '\r\n469007', null);
INSERT INTO `sys_city_code` VALUES ('1991', '海南省', '省直辖行政单位', '定安县', '\r\n469025', null);
INSERT INTO `sys_city_code` VALUES ('1992', '海南省', '省直辖行政单位', '屯昌县', '\r\n469026', null);
INSERT INTO `sys_city_code` VALUES ('1993', '海南省', '省直辖行政单位', '澄迈县', '\r\n469027', null);
INSERT INTO `sys_city_code` VALUES ('1994', '海南省', '省直辖行政单位', '临高县', '\r\n469028', null);
INSERT INTO `sys_city_code` VALUES ('1995', '海南省', '省直辖行政单位', '白沙黎族自治县', '\r\n469030', null);
INSERT INTO `sys_city_code` VALUES ('1996', '海南省', '省直辖行政单位', '昌江黎族自治县', '\r\n469031', null);
INSERT INTO `sys_city_code` VALUES ('1997', '海南省', '省直辖行政单位', '乐东黎族自治县', '\r\n469033', null);
INSERT INTO `sys_city_code` VALUES ('1998', '海南省', '省直辖行政单位', '陵水黎族自治县', '\r\n469034', null);
INSERT INTO `sys_city_code` VALUES ('1999', '海南省', '省直辖行政单位', '保亭黎族苗族自治县', '\r\n469035', null);
INSERT INTO `sys_city_code` VALUES ('2000', '海南省', '省直辖行政单位', '琼中黎族苗族自治县', '\r\n469036', null);
INSERT INTO `sys_city_code` VALUES ('2001', '海南省', '省直辖行政单位', '西沙群岛', '\r\n469037', null);
INSERT INTO `sys_city_code` VALUES ('2002', '海南省', '省直辖行政单位', '南沙群岛', '\r\n469038', null);
INSERT INTO `sys_city_code` VALUES ('2003', '海南省', '省直辖行政单位', '中沙群岛的岛礁及其海域', '\r\n469039', null);
INSERT INTO `sys_city_code` VALUES ('2004', '重庆市', '重庆市', '万州区', '\r\n500101', null);
INSERT INTO `sys_city_code` VALUES ('2005', '重庆市', '重庆市', '涪陵区', '\r\n500102', null);
INSERT INTO `sys_city_code` VALUES ('2006', '重庆市', '重庆市', '渝中区', '\r\n500103', null);
INSERT INTO `sys_city_code` VALUES ('2007', '重庆市', '重庆市', '大渡口区', '\r\n500104', null);
INSERT INTO `sys_city_code` VALUES ('2008', '重庆市', '重庆市', '江北区', '\r\n500105', null);
INSERT INTO `sys_city_code` VALUES ('2009', '重庆市', '重庆市', '沙坪坝区', '\r\n500106', null);
INSERT INTO `sys_city_code` VALUES ('2010', '重庆市', '重庆市', '九龙坡区', '\r\n500107', null);
INSERT INTO `sys_city_code` VALUES ('2011', '重庆市', '重庆市', '南岸区', '\r\n500108', null);
INSERT INTO `sys_city_code` VALUES ('2012', '重庆市', '重庆市', '北碚区', '\r\n500109', null);
INSERT INTO `sys_city_code` VALUES ('2013', '重庆市', '重庆市', '万盛区', '\r\n500110', null);
INSERT INTO `sys_city_code` VALUES ('2014', '重庆市', '重庆市', '双桥区', '\r\n500111', null);
INSERT INTO `sys_city_code` VALUES ('2015', '重庆市', '重庆市', '渝北区', '\r\n500112', null);
INSERT INTO `sys_city_code` VALUES ('2016', '重庆市', '重庆市', '巴南区', '\r\n500113', null);
INSERT INTO `sys_city_code` VALUES ('2017', '重庆市', '重庆市', '黔江区', '\r\n500114', null);
INSERT INTO `sys_city_code` VALUES ('2018', '重庆市', '重庆市', '长寿区', '\r\n500115', null);
INSERT INTO `sys_city_code` VALUES ('2019', '重庆市', '重庆市', '綦江县', '\r\n500222', null);
INSERT INTO `sys_city_code` VALUES ('2020', '重庆市', '重庆市', '潼南县', '\r\n500223', null);
INSERT INTO `sys_city_code` VALUES ('2021', '重庆市', '重庆市', '铜梁县', '\r\n500224', null);
INSERT INTO `sys_city_code` VALUES ('2022', '重庆市', '重庆市', '大足县', '\r\n500225', null);
INSERT INTO `sys_city_code` VALUES ('2023', '重庆市', '重庆市', '荣昌县', '\r\n500226', null);
INSERT INTO `sys_city_code` VALUES ('2024', '重庆市', '重庆市', '璧山县', '\r\n500227', null);
INSERT INTO `sys_city_code` VALUES ('2025', '重庆市', '重庆市', '梁平县', '\r\n500228', null);
INSERT INTO `sys_city_code` VALUES ('2026', '重庆市', '重庆市', '城口县', '\r\n500229', null);
INSERT INTO `sys_city_code` VALUES ('2027', '重庆市', '重庆市', '丰都县', '\r\n500230', null);
INSERT INTO `sys_city_code` VALUES ('2028', '重庆市', '重庆市', '垫江县', '\r\n500231', null);
INSERT INTO `sys_city_code` VALUES ('2029', '重庆市', '重庆市', '武隆县', '\r\n500232', null);
INSERT INTO `sys_city_code` VALUES ('2030', '重庆市', '重庆市', '忠县', '\r\n500233', null);
INSERT INTO `sys_city_code` VALUES ('2031', '重庆市', '重庆市', '开县', '\r\n500234', null);
INSERT INTO `sys_city_code` VALUES ('2032', '重庆市', '重庆市', '云阳县', '\r\n500235', null);
INSERT INTO `sys_city_code` VALUES ('2033', '重庆市', '重庆市', '奉节县', '\r\n500236', null);
INSERT INTO `sys_city_code` VALUES ('2034', '重庆市', '重庆市', '巫山县', '\r\n500237', null);
INSERT INTO `sys_city_code` VALUES ('2035', '重庆市', '重庆市', '巫溪县', '\r\n500238', null);
INSERT INTO `sys_city_code` VALUES ('2036', '重庆市', '重庆市', '石柱土家族自治县', '\r\n500240', null);
INSERT INTO `sys_city_code` VALUES ('2037', '重庆市', '重庆市', '秀山土家族苗族自治县', '\r\n500241', null);
INSERT INTO `sys_city_code` VALUES ('2038', '重庆市', '重庆市', '酉阳土家族苗族自治县', '\r\n500242', null);
INSERT INTO `sys_city_code` VALUES ('2039', '重庆市', '重庆市', '彭水苗族土家族自治县', '\r\n500243', null);
INSERT INTO `sys_city_code` VALUES ('2040', '重庆市', '重庆市', '江津市', '\r\n500381', null);
INSERT INTO `sys_city_code` VALUES ('2041', '重庆市', '重庆市', '合川市', '\r\n500382', null);
INSERT INTO `sys_city_code` VALUES ('2042', '重庆市', '重庆市', '永川市', '\r\n500383', null);
INSERT INTO `sys_city_code` VALUES ('2043', '重庆市', '重庆市', '南川市', '\r\n500384', null);
INSERT INTO `sys_city_code` VALUES ('2044', '四川省', '成都市', '锦江区', '\r\n510104', null);
INSERT INTO `sys_city_code` VALUES ('2045', '四川省', '成都市', '青羊区', '\r\n510105', null);
INSERT INTO `sys_city_code` VALUES ('2046', '四川省', '成都市', '金牛区', '\r\n510106', null);
INSERT INTO `sys_city_code` VALUES ('2047', '四川省', '成都市', '武侯区', '\r\n510107', null);
INSERT INTO `sys_city_code` VALUES ('2048', '四川省', '成都市', '成华区', '\r\n510108', null);
INSERT INTO `sys_city_code` VALUES ('2049', '四川省', '成都市', '龙泉驿区', '\r\n510112', null);
INSERT INTO `sys_city_code` VALUES ('2050', '四川省', '成都市', '青白江区', '\r\n510113', null);
INSERT INTO `sys_city_code` VALUES ('2051', '四川省', '成都市', '新都区', '\r\n510114', null);
INSERT INTO `sys_city_code` VALUES ('2052', '四川省', '成都市', '温江区', '\r\n510115', null);
INSERT INTO `sys_city_code` VALUES ('2053', '四川省', '成都市', '金堂县', '\r\n510121', null);
INSERT INTO `sys_city_code` VALUES ('2054', '四川省', '成都市', '双流县', '\r\n510122', null);
INSERT INTO `sys_city_code` VALUES ('2055', '四川省', '成都市', '郫县', '\r\n510124', null);
INSERT INTO `sys_city_code` VALUES ('2056', '四川省', '成都市', '大邑县', '\r\n510129', null);
INSERT INTO `sys_city_code` VALUES ('2057', '四川省', '成都市', '蒲江县', '\r\n510131', null);
INSERT INTO `sys_city_code` VALUES ('2058', '四川省', '成都市', '新津县', '\r\n510132', null);
INSERT INTO `sys_city_code` VALUES ('2059', '四川省', '成都市', '都江堰市', '\r\n510181', null);
INSERT INTO `sys_city_code` VALUES ('2060', '四川省', '成都市', '彭州市', '\r\n510182', null);
INSERT INTO `sys_city_code` VALUES ('2061', '四川省', '成都市', '邛崃市', '\r\n510183', null);
INSERT INTO `sys_city_code` VALUES ('2062', '四川省', '成都市', '崇州市', '\r\n510184', null);
INSERT INTO `sys_city_code` VALUES ('2063', '四川省', '自贡市', '自流井区', '\r\n510302', null);
INSERT INTO `sys_city_code` VALUES ('2064', '四川省', '自贡市', '贡井区', '\r\n510303', null);
INSERT INTO `sys_city_code` VALUES ('2065', '四川省', '自贡市', '大安区', '\r\n510304', null);
INSERT INTO `sys_city_code` VALUES ('2066', '四川省', '自贡市', '沿滩区', '\r\n510311', null);
INSERT INTO `sys_city_code` VALUES ('2067', '四川省', '自贡市', '荣县', '\r\n510321', null);
INSERT INTO `sys_city_code` VALUES ('2068', '四川省', '自贡市', '富顺县', '\r\n510322', null);
INSERT INTO `sys_city_code` VALUES ('2069', '四川省', '攀枝花市', '东区', '\r\n510402', null);
INSERT INTO `sys_city_code` VALUES ('2070', '四川省', '攀枝花市', '西区', '\r\n510403', null);
INSERT INTO `sys_city_code` VALUES ('2071', '四川省', '攀枝花市', '仁和区', '\r\n510411', null);
INSERT INTO `sys_city_code` VALUES ('2072', '四川省', '攀枝花市', '米易县', '\r\n510421', null);
INSERT INTO `sys_city_code` VALUES ('2073', '四川省', '攀枝花市', '盐边县', '\r\n510422', null);
INSERT INTO `sys_city_code` VALUES ('2074', '四川省', '泸州市', '江阳区', '\r\n510502', null);
INSERT INTO `sys_city_code` VALUES ('2075', '四川省', '泸州市', '纳溪区', '\r\n510503', null);
INSERT INTO `sys_city_code` VALUES ('2076', '四川省', '泸州市', '龙马潭区', '\r\n510504', null);
INSERT INTO `sys_city_code` VALUES ('2077', '四川省', '泸州市', '泸县', '\r\n510521', null);
INSERT INTO `sys_city_code` VALUES ('2078', '四川省', '泸州市', '合江县', '\r\n510522', null);
INSERT INTO `sys_city_code` VALUES ('2079', '四川省', '泸州市', '叙永县', '\r\n510524', null);
INSERT INTO `sys_city_code` VALUES ('2080', '四川省', '泸州市', '古蔺县', '\r\n510525', null);
INSERT INTO `sys_city_code` VALUES ('2081', '四川省', '德阳市', '旌阳区', '\r\n510603', null);
INSERT INTO `sys_city_code` VALUES ('2082', '四川省', '德阳市', '中江县', '\r\n510623', null);
INSERT INTO `sys_city_code` VALUES ('2083', '四川省', '德阳市', '罗江县', '\r\n510626', null);
INSERT INTO `sys_city_code` VALUES ('2084', '四川省', '德阳市', '广汉市', '\r\n510681', null);
INSERT INTO `sys_city_code` VALUES ('2085', '四川省', '德阳市', '什邡市', '\r\n510682', null);
INSERT INTO `sys_city_code` VALUES ('2086', '四川省', '德阳市', '绵竹市', '\r\n510683', null);
INSERT INTO `sys_city_code` VALUES ('2087', '四川省', '绵阳市', '涪城区', '\r\n510703', null);
INSERT INTO `sys_city_code` VALUES ('2088', '四川省', '绵阳市', '游仙区', '\r\n510704', null);
INSERT INTO `sys_city_code` VALUES ('2089', '四川省', '绵阳市', '三台县', '\r\n510722', null);
INSERT INTO `sys_city_code` VALUES ('2090', '四川省', '绵阳市', '盐亭县', '\r\n510723', null);
INSERT INTO `sys_city_code` VALUES ('2091', '四川省', '绵阳市', '安县', '\r\n510724', null);
INSERT INTO `sys_city_code` VALUES ('2092', '四川省', '绵阳市', '梓潼县', '\r\n510725', null);
INSERT INTO `sys_city_code` VALUES ('2093', '四川省', '绵阳市', '北川羌族自治县', '\r\n510726', null);
INSERT INTO `sys_city_code` VALUES ('2094', '四川省', '绵阳市', '平武县', '\r\n510727', null);
INSERT INTO `sys_city_code` VALUES ('2095', '四川省', '绵阳市', '江油市', '\r\n510781', null);
INSERT INTO `sys_city_code` VALUES ('2096', '四川省', '广元市', '市中区', '\r\n510802', null);
INSERT INTO `sys_city_code` VALUES ('2097', '四川省', '广元市', '元坝区', '\r\n510811', null);
INSERT INTO `sys_city_code` VALUES ('2098', '四川省', '广元市', '朝天区', '\r\n510812', null);
INSERT INTO `sys_city_code` VALUES ('2099', '四川省', '广元市', '旺苍县', '\r\n510821', null);
INSERT INTO `sys_city_code` VALUES ('2100', '四川省', '广元市', '青川县', '\r\n510822', null);
INSERT INTO `sys_city_code` VALUES ('2101', '四川省', '广元市', '剑阁县', '\r\n510823', null);
INSERT INTO `sys_city_code` VALUES ('2102', '四川省', '广元市', '苍溪县', '\r\n510824', null);
INSERT INTO `sys_city_code` VALUES ('2103', '四川省', '遂宁市', '船山区', '\r\n510903', null);
INSERT INTO `sys_city_code` VALUES ('2104', '四川省', '遂宁市', '安居区', '\r\n510904', null);
INSERT INTO `sys_city_code` VALUES ('2105', '四川省', '遂宁市', '蓬溪县', '\r\n510921', null);
INSERT INTO `sys_city_code` VALUES ('2106', '四川省', '遂宁市', '射洪县', '\r\n510922', null);
INSERT INTO `sys_city_code` VALUES ('2107', '四川省', '遂宁市', '大英县', '\r\n510923', null);
INSERT INTO `sys_city_code` VALUES ('2108', '四川省', '内江市', '市中区', '\r\n511002', null);
INSERT INTO `sys_city_code` VALUES ('2109', '四川省', '内江市', '东兴区', '\r\n511011', null);
INSERT INTO `sys_city_code` VALUES ('2110', '四川省', '内江市', '威远县', '\r\n511024', null);
INSERT INTO `sys_city_code` VALUES ('2111', '四川省', '内江市', '资中县', '\r\n511025', null);
INSERT INTO `sys_city_code` VALUES ('2112', '四川省', '内江市', '隆昌县', '\r\n511028', null);
INSERT INTO `sys_city_code` VALUES ('2113', '四川省', '乐山市', '市中区', '\r\n511102', null);
INSERT INTO `sys_city_code` VALUES ('2114', '四川省', '乐山市', '沙湾区', '\r\n511111', null);
INSERT INTO `sys_city_code` VALUES ('2115', '四川省', '乐山市', '五通桥区', '\r\n511112', null);
INSERT INTO `sys_city_code` VALUES ('2116', '四川省', '乐山市', '金口河区', '\r\n511113', null);
INSERT INTO `sys_city_code` VALUES ('2117', '四川省', '乐山市', '犍为县', '\r\n511123', null);
INSERT INTO `sys_city_code` VALUES ('2118', '四川省', '乐山市', '井研县', '\r\n511124', null);
INSERT INTO `sys_city_code` VALUES ('2119', '四川省', '乐山市', '夹江县', '\r\n511126', null);
INSERT INTO `sys_city_code` VALUES ('2120', '四川省', '乐山市', '沐川县', '\r\n511129', null);
INSERT INTO `sys_city_code` VALUES ('2121', '四川省', '乐山市', '峨边彝族自治县', '\r\n511132', null);
INSERT INTO `sys_city_code` VALUES ('2122', '四川省', '乐山市', '马边彝族自治县', '\r\n511133', null);
INSERT INTO `sys_city_code` VALUES ('2123', '四川省', '乐山市', '峨眉山市', '\r\n511181', null);
INSERT INTO `sys_city_code` VALUES ('2124', '四川省', '南充市', '顺庆区', '\r\n511302', null);
INSERT INTO `sys_city_code` VALUES ('2125', '四川省', '南充市', '高坪区', '\r\n511303', null);
INSERT INTO `sys_city_code` VALUES ('2126', '四川省', '南充市', '嘉陵区', '\r\n511304', null);
INSERT INTO `sys_city_code` VALUES ('2127', '四川省', '南充市', '南部县', '\r\n511321', null);
INSERT INTO `sys_city_code` VALUES ('2128', '四川省', '南充市', '营山县', '\r\n511322', null);
INSERT INTO `sys_city_code` VALUES ('2129', '四川省', '南充市', '蓬安县', '\r\n511323', null);
INSERT INTO `sys_city_code` VALUES ('2130', '四川省', '南充市', '仪陇县', '\r\n511324', null);
INSERT INTO `sys_city_code` VALUES ('2131', '四川省', '南充市', '西充县', '\r\n511325', null);
INSERT INTO `sys_city_code` VALUES ('2132', '四川省', '南充市', '阆中市', '\r\n511381', null);
INSERT INTO `sys_city_code` VALUES ('2133', '四川省', '眉山市', '东坡区', '\r\n511402', null);
INSERT INTO `sys_city_code` VALUES ('2134', '四川省', '眉山市', '仁寿县', '\r\n511421', null);
INSERT INTO `sys_city_code` VALUES ('2135', '四川省', '眉山市', '彭山县', '\r\n511422', null);
INSERT INTO `sys_city_code` VALUES ('2136', '四川省', '眉山市', '洪雅县', '\r\n511423', null);
INSERT INTO `sys_city_code` VALUES ('2137', '四川省', '眉山市', '丹棱县', '\r\n511424', null);
INSERT INTO `sys_city_code` VALUES ('2138', '四川省', '眉山市', '青神县', '\r\n511425', null);
INSERT INTO `sys_city_code` VALUES ('2139', '四川省', '宜宾市', '翠屏区', '\r\n511502', null);
INSERT INTO `sys_city_code` VALUES ('2140', '四川省', '宜宾市', '宜宾县', '\r\n511521', null);
INSERT INTO `sys_city_code` VALUES ('2141', '四川省', '宜宾市', '南溪县', '\r\n511522', null);
INSERT INTO `sys_city_code` VALUES ('2142', '四川省', '宜宾市', '江安县', '\r\n511523', null);
INSERT INTO `sys_city_code` VALUES ('2143', '四川省', '宜宾市', '长宁县', '\r\n511524', null);
INSERT INTO `sys_city_code` VALUES ('2144', '四川省', '宜宾市', '高县', '\r\n511525', null);
INSERT INTO `sys_city_code` VALUES ('2145', '四川省', '宜宾市', '珙县', '\r\n511526', null);
INSERT INTO `sys_city_code` VALUES ('2146', '四川省', '宜宾市', '筠连县', '\r\n511527', null);
INSERT INTO `sys_city_code` VALUES ('2147', '四川省', '宜宾市', '兴文县', '\r\n511528', null);
INSERT INTO `sys_city_code` VALUES ('2148', '四川省', '宜宾市', '屏山县', '\r\n511529', null);
INSERT INTO `sys_city_code` VALUES ('2149', '四川省', '广安市', '广安区', '\r\n511602', null);
INSERT INTO `sys_city_code` VALUES ('2150', '四川省', '广安市', '岳池县', '\r\n511621', null);
INSERT INTO `sys_city_code` VALUES ('2151', '四川省', '广安市', '武胜县', '\r\n511622', null);
INSERT INTO `sys_city_code` VALUES ('2152', '四川省', '广安市', '邻水县', '\r\n511623', null);
INSERT INTO `sys_city_code` VALUES ('2153', '四川省', '广安市', '华莹市', '\r\n511681', null);
INSERT INTO `sys_city_code` VALUES ('2154', '四川省', '达州市', '通川区', '\r\n511702', null);
INSERT INTO `sys_city_code` VALUES ('2155', '四川省', '达州市', '达县', '\r\n511721', null);
INSERT INTO `sys_city_code` VALUES ('2156', '四川省', '达州市', '宣汉县', '\r\n511722', null);
INSERT INTO `sys_city_code` VALUES ('2157', '四川省', '达州市', '开江县', '\r\n511723', null);
INSERT INTO `sys_city_code` VALUES ('2158', '四川省', '达州市', '大竹县', '\r\n511724', null);
INSERT INTO `sys_city_code` VALUES ('2159', '四川省', '达州市', '渠县', '\r\n511725', null);
INSERT INTO `sys_city_code` VALUES ('2160', '四川省', '达州市', '万源市', '\r\n511781', null);
INSERT INTO `sys_city_code` VALUES ('2161', '四川省', '雅安市', '雨城区', '\r\n511802', null);
INSERT INTO `sys_city_code` VALUES ('2162', '四川省', '雅安市', '名山县', '\r\n511821', null);
INSERT INTO `sys_city_code` VALUES ('2163', '四川省', '雅安市', '荥经县', '\r\n511822', null);
INSERT INTO `sys_city_code` VALUES ('2164', '四川省', '雅安市', '汉源县', '\r\n511823', null);
INSERT INTO `sys_city_code` VALUES ('2165', '四川省', '雅安市', '石棉县', '\r\n511824', null);
INSERT INTO `sys_city_code` VALUES ('2166', '四川省', '雅安市', '天全县', '\r\n511825', null);
INSERT INTO `sys_city_code` VALUES ('2167', '四川省', '雅安市', '芦山县', '\r\n511826', null);
INSERT INTO `sys_city_code` VALUES ('2168', '四川省', '雅安市', '宝兴县', '\r\n511827', null);
INSERT INTO `sys_city_code` VALUES ('2169', '四川省', '巴中市', '巴州区', '\r\n511902', null);
INSERT INTO `sys_city_code` VALUES ('2170', '四川省', '巴中市', '通江县', '\r\n511921', null);
INSERT INTO `sys_city_code` VALUES ('2171', '四川省', '巴中市', '南江县', '\r\n511922', null);
INSERT INTO `sys_city_code` VALUES ('2172', '四川省', '巴中市', '平昌县', '\r\n511923', null);
INSERT INTO `sys_city_code` VALUES ('2173', '四川省', '资阳市', '雁江区', '\r\n512002', null);
INSERT INTO `sys_city_code` VALUES ('2174', '四川省', '资阳市', '安岳县', '\r\n512021', null);
INSERT INTO `sys_city_code` VALUES ('2175', '四川省', '资阳市', '乐至县', '\r\n512022', null);
INSERT INTO `sys_city_code` VALUES ('2176', '四川省', '资阳市', '简阳市', '\r\n512081', null);
INSERT INTO `sys_city_code` VALUES ('2177', '四川省', '阿坝藏族羌族自治州', '汶川县', '\r\n513221', null);
INSERT INTO `sys_city_code` VALUES ('2178', '四川省', '阿坝藏族羌族自治州', '理县', '\r\n513222', null);
INSERT INTO `sys_city_code` VALUES ('2179', '四川省', '阿坝藏族羌族自治州', '茂县', '\r\n513223', null);
INSERT INTO `sys_city_code` VALUES ('2180', '四川省', '阿坝藏族羌族自治州', '松潘县', '\r\n513224', null);
INSERT INTO `sys_city_code` VALUES ('2181', '四川省', '阿坝藏族羌族自治州', '九寨沟县', '\r\n513225', null);
INSERT INTO `sys_city_code` VALUES ('2182', '四川省', '阿坝藏族羌族自治州', '金川县', '\r\n513226', null);
INSERT INTO `sys_city_code` VALUES ('2183', '四川省', '阿坝藏族羌族自治州', '小金县', '\r\n513227', null);
INSERT INTO `sys_city_code` VALUES ('2184', '四川省', '阿坝藏族羌族自治州', '黑水县', '\r\n513228', null);
INSERT INTO `sys_city_code` VALUES ('2185', '四川省', '阿坝藏族羌族自治州', '马尔康县', '\r\n513229', null);
INSERT INTO `sys_city_code` VALUES ('2186', '四川省', '阿坝藏族羌族自治州', '壤塘县', '\r\n513230', null);
INSERT INTO `sys_city_code` VALUES ('2187', '四川省', '阿坝藏族羌族自治州', '阿坝县', '\r\n513231', null);
INSERT INTO `sys_city_code` VALUES ('2188', '四川省', '阿坝藏族羌族自治州', '若尔盖县', '\r\n513232', null);
INSERT INTO `sys_city_code` VALUES ('2189', '四川省', '阿坝藏族羌族自治州', '红原县', '\r\n513233', null);
INSERT INTO `sys_city_code` VALUES ('2190', '四川省', '甘孜藏族自治州', '康定县', '\r\n513321', null);
INSERT INTO `sys_city_code` VALUES ('2191', '四川省', '甘孜藏族自治州', '泸定县', '\r\n513322', null);
INSERT INTO `sys_city_code` VALUES ('2192', '四川省', '甘孜藏族自治州', '丹巴县', '\r\n513323', null);
INSERT INTO `sys_city_code` VALUES ('2193', '四川省', '甘孜藏族自治州', '九龙县', '\r\n513324', null);
INSERT INTO `sys_city_code` VALUES ('2194', '四川省', '甘孜藏族自治州', '雅江县', '\r\n513325', null);
INSERT INTO `sys_city_code` VALUES ('2195', '四川省', '甘孜藏族自治州', '道孚县', '\r\n513326', null);
INSERT INTO `sys_city_code` VALUES ('2196', '四川省', '甘孜藏族自治州', '炉霍县', '\r\n513327', null);
INSERT INTO `sys_city_code` VALUES ('2197', '四川省', '甘孜藏族自治州', '甘孜县', '\r\n513328', null);
INSERT INTO `sys_city_code` VALUES ('2198', '四川省', '甘孜藏族自治州', '新龙县', '\r\n513329', null);
INSERT INTO `sys_city_code` VALUES ('2199', '四川省', '甘孜藏族自治州', '德格县', '\r\n513330', null);
INSERT INTO `sys_city_code` VALUES ('2200', '四川省', '甘孜藏族自治州', '白玉县', '\r\n513331', null);
INSERT INTO `sys_city_code` VALUES ('2201', '四川省', '甘孜藏族自治州', '石渠县', '\r\n513332', null);
INSERT INTO `sys_city_code` VALUES ('2202', '四川省', '甘孜藏族自治州', '色达县', '\r\n513333', null);
INSERT INTO `sys_city_code` VALUES ('2203', '四川省', '甘孜藏族自治州', '理塘县', '\r\n513334', null);
INSERT INTO `sys_city_code` VALUES ('2204', '四川省', '甘孜藏族自治州', '巴塘县', '\r\n513335', null);
INSERT INTO `sys_city_code` VALUES ('2205', '四川省', '甘孜藏族自治州', '乡城县', '\r\n513336', null);
INSERT INTO `sys_city_code` VALUES ('2206', '四川省', '甘孜藏族自治州', '稻城县', '\r\n513337', null);
INSERT INTO `sys_city_code` VALUES ('2207', '四川省', '甘孜藏族自治州', '得荣县', '\r\n513338', null);
INSERT INTO `sys_city_code` VALUES ('2208', '四川省', '凉山彝族自治州', '西昌市', '\r\n513401', null);
INSERT INTO `sys_city_code` VALUES ('2209', '四川省', '凉山彝族自治州', '木里藏族自治县', '\r\n513422', null);
INSERT INTO `sys_city_code` VALUES ('2210', '四川省', '凉山彝族自治州', '盐源县', '\r\n513423', null);
INSERT INTO `sys_city_code` VALUES ('2211', '四川省', '凉山彝族自治州', '德昌县', '\r\n513424', null);
INSERT INTO `sys_city_code` VALUES ('2212', '四川省', '凉山彝族自治州', '会理县', '\r\n513425', null);
INSERT INTO `sys_city_code` VALUES ('2213', '四川省', '凉山彝族自治州', '会东县', '\r\n513426', null);
INSERT INTO `sys_city_code` VALUES ('2214', '四川省', '凉山彝族自治州', '宁南县', '\r\n513427', null);
INSERT INTO `sys_city_code` VALUES ('2215', '四川省', '凉山彝族自治州', '普格县', '\r\n513428', null);
INSERT INTO `sys_city_code` VALUES ('2216', '四川省', '凉山彝族自治州', '布拖县', '\r\n513429', null);
INSERT INTO `sys_city_code` VALUES ('2217', '四川省', '凉山彝族自治州', '金阳县', '\r\n513430', null);
INSERT INTO `sys_city_code` VALUES ('2218', '四川省', '凉山彝族自治州', '昭觉县', '\r\n513431', null);
INSERT INTO `sys_city_code` VALUES ('2219', '四川省', '凉山彝族自治州', '喜德县', '\r\n513432', null);
INSERT INTO `sys_city_code` VALUES ('2220', '四川省', '凉山彝族自治州', '冕宁县', '\r\n513433', null);
INSERT INTO `sys_city_code` VALUES ('2221', '四川省', '凉山彝族自治州', '越西县', '\r\n513434', null);
INSERT INTO `sys_city_code` VALUES ('2222', '四川省', '凉山彝族自治州', '甘洛县', '\r\n513435', null);
INSERT INTO `sys_city_code` VALUES ('2223', '四川省', '凉山彝族自治州', '美姑县', '\r\n513436', null);
INSERT INTO `sys_city_code` VALUES ('2224', '四川省', '凉山彝族自治州', '雷波县', '\r\n513437', null);
INSERT INTO `sys_city_code` VALUES ('2225', '贵州省', '贵阳市', '南明区', '\r\n520102', null);
INSERT INTO `sys_city_code` VALUES ('2226', '贵州省', '贵阳市', '云岩区', '\r\n520103', null);
INSERT INTO `sys_city_code` VALUES ('2227', '贵州省', '贵阳市', '花溪区', '\r\n520111', null);
INSERT INTO `sys_city_code` VALUES ('2228', '贵州省', '贵阳市', '乌当区', '\r\n520112', null);
INSERT INTO `sys_city_code` VALUES ('2229', '贵州省', '贵阳市', '白云区', '\r\n520113', null);
INSERT INTO `sys_city_code` VALUES ('2230', '贵州省', '贵阳市', '小河区', '\r\n520114', null);
INSERT INTO `sys_city_code` VALUES ('2231', '贵州省', '贵阳市', '金阳新区', '\r\n520115', null);
INSERT INTO `sys_city_code` VALUES ('2232', '贵州省', '贵阳市', '开阳县', '\r\n520121', null);
INSERT INTO `sys_city_code` VALUES ('2233', '贵州省', '贵阳市', '息烽县', '\r\n520122', null);
INSERT INTO `sys_city_code` VALUES ('2234', '贵州省', '贵阳市', '修文县', '\r\n520123', null);
INSERT INTO `sys_city_code` VALUES ('2235', '贵州省', '贵阳市', '清镇市', '\r\n520181', null);
INSERT INTO `sys_city_code` VALUES ('2236', '贵州省', '六盘水市', '钟山区', '\r\n520201', null);
INSERT INTO `sys_city_code` VALUES ('2237', '贵州省', '六盘水市', '六枝特区', '\r\n520203', null);
INSERT INTO `sys_city_code` VALUES ('2238', '贵州省', '六盘水市', '水城县', '\r\n520221', null);
INSERT INTO `sys_city_code` VALUES ('2239', '贵州省', '六盘水市', '盘县', '\r\n520222', null);
INSERT INTO `sys_city_code` VALUES ('2240', '贵州省', '遵义市', '红花岗区', '\r\n520302', null);
INSERT INTO `sys_city_code` VALUES ('2241', '贵州省', '遵义市', '汇川区', '\r\n520303', null);
INSERT INTO `sys_city_code` VALUES ('2242', '贵州省', '遵义市', '遵义县', '\r\n520321', null);
INSERT INTO `sys_city_code` VALUES ('2243', '贵州省', '遵义市', '桐梓县', '\r\n520322', null);
INSERT INTO `sys_city_code` VALUES ('2244', '贵州省', '遵义市', '绥阳县', '\r\n520323', null);
INSERT INTO `sys_city_code` VALUES ('2245', '贵州省', '遵义市', '正安县', '\r\n520324', null);
INSERT INTO `sys_city_code` VALUES ('2246', '贵州省', '遵义市', '道真仡佬族苗族自治县', '\r\n520325', null);
INSERT INTO `sys_city_code` VALUES ('2247', '贵州省', '遵义市', '务川仡佬族苗族自治县', '\r\n520326', null);
INSERT INTO `sys_city_code` VALUES ('2248', '贵州省', '遵义市', '凤冈县', '\r\n520327', null);
INSERT INTO `sys_city_code` VALUES ('2249', '贵州省', '遵义市', '湄潭县', '\r\n520328', null);
INSERT INTO `sys_city_code` VALUES ('2250', '贵州省', '遵义市', '余庆县', '\r\n520329', null);
INSERT INTO `sys_city_code` VALUES ('2251', '贵州省', '遵义市', '习水县', '\r\n520330', null);
INSERT INTO `sys_city_code` VALUES ('2252', '贵州省', '遵义市', '赤水市', '\r\n520381', null);
INSERT INTO `sys_city_code` VALUES ('2253', '贵州省', '遵义市', '仁怀市', '\r\n520382', null);
INSERT INTO `sys_city_code` VALUES ('2254', '贵州省', '安顺市', '西秀区', '\r\n520402', null);
INSERT INTO `sys_city_code` VALUES ('2255', '贵州省', '安顺市', '平坝县', '\r\n520421', null);
INSERT INTO `sys_city_code` VALUES ('2256', '贵州省', '安顺市', '普定县', '\r\n520422', null);
INSERT INTO `sys_city_code` VALUES ('2257', '贵州省', '安顺市', '镇宁布依族苗族自治县', '\r\n520423', null);
INSERT INTO `sys_city_code` VALUES ('2258', '贵州省', '安顺市', '关岭布依族苗族自治县', '\r\n520424', null);
INSERT INTO `sys_city_code` VALUES ('2259', '贵州省', '安顺市', '紫云苗族布依族自治县', '\r\n520425', null);
INSERT INTO `sys_city_code` VALUES ('2260', '贵州省', '铜仁地区', '铜仁市', '\r\n522201', null);
INSERT INTO `sys_city_code` VALUES ('2261', '贵州省', '铜仁地区', '江口县', '\r\n522222', null);
INSERT INTO `sys_city_code` VALUES ('2262', '贵州省', '铜仁地区', '玉屏侗族自治县', '\r\n522223', null);
INSERT INTO `sys_city_code` VALUES ('2263', '贵州省', '铜仁地区', '石阡县', '\r\n522224', null);
INSERT INTO `sys_city_code` VALUES ('2264', '贵州省', '铜仁地区', '思南县', '\r\n522225', null);
INSERT INTO `sys_city_code` VALUES ('2265', '贵州省', '铜仁地区', '印江土家族苗族自治县', '\r\n522226', null);
INSERT INTO `sys_city_code` VALUES ('2266', '贵州省', '铜仁地区', '德江县', '\r\n522227', null);
INSERT INTO `sys_city_code` VALUES ('2267', '贵州省', '铜仁地区', '沿河土家族自治县', '\r\n522228', null);
INSERT INTO `sys_city_code` VALUES ('2268', '贵州省', '铜仁地区', '松桃苗族自治县', '\r\n522229', null);
INSERT INTO `sys_city_code` VALUES ('2269', '贵州省', '铜仁地区', '万山特区', '\r\n522230', null);
INSERT INTO `sys_city_code` VALUES ('2270', '贵州省', '黔西南布依族苗族自治州', '兴义市', '\r\n522301', null);
INSERT INTO `sys_city_code` VALUES ('2271', '贵州省', '黔西南布依族苗族自治州', '兴仁县', '\r\n522322', null);
INSERT INTO `sys_city_code` VALUES ('2272', '贵州省', '黔西南布依族苗族自治州', '普安县', '\r\n522323', null);
INSERT INTO `sys_city_code` VALUES ('2273', '贵州省', '黔西南布依族苗族自治州', '晴隆县', '\r\n522324', null);
INSERT INTO `sys_city_code` VALUES ('2274', '贵州省', '黔西南布依族苗族自治州', '贞丰县', '\r\n522325', null);
INSERT INTO `sys_city_code` VALUES ('2275', '贵州省', '黔西南布依族苗族自治州', '望谟县', '\r\n522326', null);
INSERT INTO `sys_city_code` VALUES ('2276', '贵州省', '黔西南布依族苗族自治州', '册亨县', '\r\n522327', null);
INSERT INTO `sys_city_code` VALUES ('2277', '贵州省', '黔西南布依族苗族自治州', '安龙县', '\r\n522328', null);
INSERT INTO `sys_city_code` VALUES ('2278', '贵州省', '毕节地区', '毕节市', '\r\n522401', null);
INSERT INTO `sys_city_code` VALUES ('2279', '贵州省', '毕节地区', '大方县', '\r\n522422', null);
INSERT INTO `sys_city_code` VALUES ('2280', '贵州省', '毕节地区', '黔西县', '\r\n522423', null);
INSERT INTO `sys_city_code` VALUES ('2281', '贵州省', '毕节地区', '金沙县', '\r\n522424', null);
INSERT INTO `sys_city_code` VALUES ('2282', '贵州省', '毕节地区', '织金县', '\r\n522425', null);
INSERT INTO `sys_city_code` VALUES ('2283', '贵州省', '毕节地区', '纳雍县', '\r\n522426', null);
INSERT INTO `sys_city_code` VALUES ('2284', '贵州省', '毕节地区', '威宁彝族回族苗族自治县', '\r\n522427', null);
INSERT INTO `sys_city_code` VALUES ('2285', '贵州省', '毕节地区', '赫章县', '\r\n522428', null);
INSERT INTO `sys_city_code` VALUES ('2286', '贵州省', '黔东南苗族侗族自治州', '凯里市', '\r\n522601', null);
INSERT INTO `sys_city_code` VALUES ('2287', '贵州省', '黔东南苗族侗族自治州', '黄平县', '\r\n522622', null);
INSERT INTO `sys_city_code` VALUES ('2288', '贵州省', '黔东南苗族侗族自治州', '施秉县', '\r\n522623', null);
INSERT INTO `sys_city_code` VALUES ('2289', '贵州省', '黔东南苗族侗族自治州', '三穗县', '\r\n522624', null);
INSERT INTO `sys_city_code` VALUES ('2290', '贵州省', '黔东南苗族侗族自治州', '镇远县', '\r\n522625', null);
INSERT INTO `sys_city_code` VALUES ('2291', '贵州省', '黔东南苗族侗族自治州', '岑巩县', '\r\n522626', null);
INSERT INTO `sys_city_code` VALUES ('2292', '贵州省', '黔东南苗族侗族自治州', '天柱县', '\r\n522627', null);
INSERT INTO `sys_city_code` VALUES ('2293', '贵州省', '黔东南苗族侗族自治州', '锦屏县', '\r\n522628', null);
INSERT INTO `sys_city_code` VALUES ('2294', '贵州省', '黔东南苗族侗族自治州', '剑河县', '\r\n522629', null);
INSERT INTO `sys_city_code` VALUES ('2295', '贵州省', '黔东南苗族侗族自治州', '台江县', '\r\n522630', null);
INSERT INTO `sys_city_code` VALUES ('2296', '贵州省', '黔东南苗族侗族自治州', '黎平县', '\r\n522631', null);
INSERT INTO `sys_city_code` VALUES ('2297', '贵州省', '黔东南苗族侗族自治州', '榕江县', '\r\n522632', null);
INSERT INTO `sys_city_code` VALUES ('2298', '贵州省', '黔东南苗族侗族自治州', '从江县', '\r\n522633', null);
INSERT INTO `sys_city_code` VALUES ('2299', '贵州省', '黔东南苗族侗族自治州', '雷山县', '\r\n522634', null);
INSERT INTO `sys_city_code` VALUES ('2300', '贵州省', '黔东南苗族侗族自治州', '麻江县', '\r\n522635', null);
INSERT INTO `sys_city_code` VALUES ('2301', '贵州省', '黔东南苗族侗族自治州', '丹寨县', '\r\n522636', null);
INSERT INTO `sys_city_code` VALUES ('2302', '贵州省', '黔南布依族苗族自治州', '都匀市', '\r\n522701', null);
INSERT INTO `sys_city_code` VALUES ('2303', '贵州省', '黔南布依族苗族自治州', '福泉市', '\r\n522702', null);
INSERT INTO `sys_city_code` VALUES ('2304', '贵州省', '黔南布依族苗族自治州', '荔波县', '\r\n522722', null);
INSERT INTO `sys_city_code` VALUES ('2305', '贵州省', '黔南布依族苗族自治州', '贵定县', '\r\n522723', null);
INSERT INTO `sys_city_code` VALUES ('2306', '贵州省', '黔南布依族苗族自治州', '瓮安县', '\r\n522725', null);
INSERT INTO `sys_city_code` VALUES ('2307', '贵州省', '黔南布依族苗族自治州', '独山县', '\r\n522726', null);
INSERT INTO `sys_city_code` VALUES ('2308', '贵州省', '黔南布依族苗族自治州', '平塘县', '\r\n522727', null);
INSERT INTO `sys_city_code` VALUES ('2309', '贵州省', '黔南布依族苗族自治州', '罗甸县', '\r\n522728', null);
INSERT INTO `sys_city_code` VALUES ('2310', '贵州省', '黔南布依族苗族自治州', '长顺县', '\r\n522729', null);
INSERT INTO `sys_city_code` VALUES ('2311', '贵州省', '黔南布依族苗族自治州', '龙里县', '\r\n522730', null);
INSERT INTO `sys_city_code` VALUES ('2312', '贵州省', '黔南布依族苗族自治州', '惠水县', '\r\n522731', null);
INSERT INTO `sys_city_code` VALUES ('2313', '贵州省', '黔南布依族苗族自治州', '三都水族自治县', '\r\n522732', null);
INSERT INTO `sys_city_code` VALUES ('2314', '云南省', '昆明市', '五华区', '\r\n530102', null);
INSERT INTO `sys_city_code` VALUES ('2315', '云南省', '昆明市', '盘龙区', '\r\n530103', null);
INSERT INTO `sys_city_code` VALUES ('2316', '云南省', '昆明市', '官渡区', '\r\n530111', null);
INSERT INTO `sys_city_code` VALUES ('2317', '云南省', '昆明市', '西山区', '\r\n530112', null);
INSERT INTO `sys_city_code` VALUES ('2318', '云南省', '昆明市', '东川区', '\r\n530113', null);
INSERT INTO `sys_city_code` VALUES ('2319', '云南省', '昆明市', '呈贡县', '\r\n530121', null);
INSERT INTO `sys_city_code` VALUES ('2320', '云南省', '昆明市', '晋宁县', '\r\n530122', null);
INSERT INTO `sys_city_code` VALUES ('2321', '云南省', '昆明市', '富民县', '\r\n530124', null);
INSERT INTO `sys_city_code` VALUES ('2322', '云南省', '昆明市', '宜良县', '\r\n530125', null);
INSERT INTO `sys_city_code` VALUES ('2323', '云南省', '昆明市', '石林彝族自治县', '\r\n530126', null);
INSERT INTO `sys_city_code` VALUES ('2324', '云南省', '昆明市', '嵩明县', '\r\n530127', null);
INSERT INTO `sys_city_code` VALUES ('2325', '云南省', '昆明市', '禄劝彝族苗族自治县', '\r\n530128', null);
INSERT INTO `sys_city_code` VALUES ('2326', '云南省', '昆明市', '寻甸回族彝族自治县', '\r\n530129', null);
INSERT INTO `sys_city_code` VALUES ('2327', '云南省', '昆明市', '安宁市', '\r\n530181', null);
INSERT INTO `sys_city_code` VALUES ('2328', '云南省', '曲靖市', '麒麟区', '\r\n530302', null);
INSERT INTO `sys_city_code` VALUES ('2329', '云南省', '曲靖市', '马龙县', '\r\n530321', null);
INSERT INTO `sys_city_code` VALUES ('2330', '云南省', '曲靖市', '陆良县', '\r\n530322', null);
INSERT INTO `sys_city_code` VALUES ('2331', '云南省', '曲靖市', '师宗县', '\r\n530323', null);
INSERT INTO `sys_city_code` VALUES ('2332', '云南省', '曲靖市', '罗平县', '\r\n530324', null);
INSERT INTO `sys_city_code` VALUES ('2333', '云南省', '曲靖市', '富源县', '\r\n530325', null);
INSERT INTO `sys_city_code` VALUES ('2334', '云南省', '曲靖市', '会泽县', '\r\n530326', null);
INSERT INTO `sys_city_code` VALUES ('2335', '云南省', '曲靖市', '沾益县', '\r\n530328', null);
INSERT INTO `sys_city_code` VALUES ('2336', '云南省', '曲靖市', '宣威市', '\r\n530381', null);
INSERT INTO `sys_city_code` VALUES ('2337', '云南省', '玉溪市', '红塔区', '\r\n530402', null);
INSERT INTO `sys_city_code` VALUES ('2338', '云南省', '玉溪市', '江川县', '\r\n530421', null);
INSERT INTO `sys_city_code` VALUES ('2339', '云南省', '玉溪市', '澄江县', '\r\n530422', null);
INSERT INTO `sys_city_code` VALUES ('2340', '云南省', '玉溪市', '通海县', '\r\n530423', null);
INSERT INTO `sys_city_code` VALUES ('2341', '云南省', '玉溪市', '华宁县', '\r\n530424', null);
INSERT INTO `sys_city_code` VALUES ('2342', '云南省', '玉溪市', '易门县', '\r\n530425', null);
INSERT INTO `sys_city_code` VALUES ('2343', '云南省', '玉溪市', '峨山彝族自治县', '\r\n530426', null);
INSERT INTO `sys_city_code` VALUES ('2344', '云南省', '玉溪市', '新平彝族傣族自治县', '\r\n530427', null);
INSERT INTO `sys_city_code` VALUES ('2345', '云南省', '玉溪市', '元江哈尼族彝族傣族自治县', '\r\n530428', null);
INSERT INTO `sys_city_code` VALUES ('2346', '云南省', '保山市', '隆阳区', '\r\n530502', null);
INSERT INTO `sys_city_code` VALUES ('2347', '云南省', '保山市', '施甸县', '\r\n530521', null);
INSERT INTO `sys_city_code` VALUES ('2348', '云南省', '保山市', '腾冲县', '\r\n530522', null);
INSERT INTO `sys_city_code` VALUES ('2349', '云南省', '保山市', '龙陵县', '\r\n530523', null);
INSERT INTO `sys_city_code` VALUES ('2350', '云南省', '保山市', '昌宁县', '\r\n530524', null);
INSERT INTO `sys_city_code` VALUES ('2351', '云南省', '昭通市', '昭阳区', '\r\n530602', null);
INSERT INTO `sys_city_code` VALUES ('2352', '云南省', '昭通市', '鲁甸县', '\r\n530621', null);
INSERT INTO `sys_city_code` VALUES ('2353', '云南省', '昭通市', '巧家县', '\r\n530622', null);
INSERT INTO `sys_city_code` VALUES ('2354', '云南省', '昭通市', '盐津县', '\r\n530623', null);
INSERT INTO `sys_city_code` VALUES ('2355', '云南省', '昭通市', '大关县', '\r\n530624', null);
INSERT INTO `sys_city_code` VALUES ('2356', '云南省', '昭通市', '永善县', '\r\n530625', null);
INSERT INTO `sys_city_code` VALUES ('2357', '云南省', '昭通市', '绥江县', '\r\n530626', null);
INSERT INTO `sys_city_code` VALUES ('2358', '云南省', '昭通市', '镇雄县', '\r\n530627', null);
INSERT INTO `sys_city_code` VALUES ('2359', '云南省', '昭通市', '彝良县', '\r\n530628', null);
INSERT INTO `sys_city_code` VALUES ('2360', '云南省', '昭通市', '威信县', '\r\n530629', null);
INSERT INTO `sys_city_code` VALUES ('2361', '云南省', '昭通市', '水富县', '\r\n530630', null);
INSERT INTO `sys_city_code` VALUES ('2362', '云南省', '丽江市', '古城区', '\r\n530702', null);
INSERT INTO `sys_city_code` VALUES ('2363', '云南省', '丽江市', '玉龙纳西族自治县', '\r\n530721', null);
INSERT INTO `sys_city_code` VALUES ('2364', '云南省', '丽江市', '永胜县', '\r\n530722', null);
INSERT INTO `sys_city_code` VALUES ('2365', '云南省', '丽江市', '华坪县', '\r\n530723', null);
INSERT INTO `sys_city_code` VALUES ('2366', '云南省', '丽江市', '宁蒗彝族自治县', '\r\n530724', null);
INSERT INTO `sys_city_code` VALUES ('2367', '云南省', '普洱市', '思茅区', '\r\n530802', null);
INSERT INTO `sys_city_code` VALUES ('2368', '云南省', '普洱市', '宁洱哈尼族彝族自治县', '\r\n530821', null);
INSERT INTO `sys_city_code` VALUES ('2369', '云南省', '普洱市', '墨江哈尼族自治县', '\r\n530822', null);
INSERT INTO `sys_city_code` VALUES ('2370', '云南省', '普洱市', '景东彝族自治县', '\r\n530823', null);
INSERT INTO `sys_city_code` VALUES ('2371', '云南省', '普洱市', '景谷傣族彝族自治县', '\r\n530824', null);
INSERT INTO `sys_city_code` VALUES ('2372', '云南省', '普洱市', '镇沅彝族哈尼族拉祜族自治县', '\r\n530825', null);
INSERT INTO `sys_city_code` VALUES ('2373', '云南省', '普洱市', '江城哈尼族彝族自治县', '\r\n530826', null);
INSERT INTO `sys_city_code` VALUES ('2374', '云南省', '普洱市', '孟连傣族拉祜族佤族自治县', '\r\n530827', null);
INSERT INTO `sys_city_code` VALUES ('2375', '云南省', '普洱市', '澜沧拉祜族自治县', '\r\n530828', null);
INSERT INTO `sys_city_code` VALUES ('2376', '云南省', '普洱市', '西盟佤族自治县', '\r\n530829', null);
INSERT INTO `sys_city_code` VALUES ('2377', '云南省', '临沧市', '临翔区', '\r\n530902', null);
INSERT INTO `sys_city_code` VALUES ('2378', '云南省', '临沧市', '凤庆县', '\r\n530921', null);
INSERT INTO `sys_city_code` VALUES ('2379', '云南省', '临沧市', '云县', '\r\n530922', null);
INSERT INTO `sys_city_code` VALUES ('2380', '云南省', '临沧市', '永德县', '\r\n530923', null);
INSERT INTO `sys_city_code` VALUES ('2381', '云南省', '临沧市', '镇康县', '\r\n530924', null);
INSERT INTO `sys_city_code` VALUES ('2382', '云南省', '临沧市', '双江拉祜族佤族布朗族傣族自治县', '\r\n530925', null);
INSERT INTO `sys_city_code` VALUES ('2383', '云南省', '临沧市', '耿马傣族佤族自治县', '\r\n530926', null);
INSERT INTO `sys_city_code` VALUES ('2384', '云南省', '临沧市', '沧源佤族自治县', '\r\n530927', null);
INSERT INTO `sys_city_code` VALUES ('2385', '云南省', '楚雄彝族自治州', '楚雄市', '\r\n532301', null);
INSERT INTO `sys_city_code` VALUES ('2386', '云南省', '楚雄彝族自治州', '双柏县', '\r\n532322', null);
INSERT INTO `sys_city_code` VALUES ('2387', '云南省', '楚雄彝族自治州', '牟定县', '\r\n532323', null);
INSERT INTO `sys_city_code` VALUES ('2388', '云南省', '楚雄彝族自治州', '南华县', '\r\n532324', null);
INSERT INTO `sys_city_code` VALUES ('2389', '云南省', '楚雄彝族自治州', '姚安县', '\r\n532325', null);
INSERT INTO `sys_city_code` VALUES ('2390', '云南省', '楚雄彝族自治州', '大姚县', '\r\n532326', null);
INSERT INTO `sys_city_code` VALUES ('2391', '云南省', '楚雄彝族自治州', '永仁县', '\r\n532327', null);
INSERT INTO `sys_city_code` VALUES ('2392', '云南省', '楚雄彝族自治州', '元谋县', '\r\n532328', null);
INSERT INTO `sys_city_code` VALUES ('2393', '云南省', '楚雄彝族自治州', '武定县', '\r\n532329', null);
INSERT INTO `sys_city_code` VALUES ('2394', '云南省', '楚雄彝族自治州', '禄丰县', '\r\n532331', null);
INSERT INTO `sys_city_code` VALUES ('2395', '云南省', '红河哈尼族彝族自治州', '个旧市', '\r\n532501', null);
INSERT INTO `sys_city_code` VALUES ('2396', '云南省', '红河哈尼族彝族自治州', '开远市', '\r\n532502', null);
INSERT INTO `sys_city_code` VALUES ('2397', '云南省', '红河哈尼族彝族自治州', '蒙自县', '\r\n532522', null);
INSERT INTO `sys_city_code` VALUES ('2398', '云南省', '红河哈尼族彝族自治州', '屏边苗族自治县', '\r\n532523', null);
INSERT INTO `sys_city_code` VALUES ('2399', '云南省', '红河哈尼族彝族自治州', '建水县', '\r\n532524', null);
INSERT INTO `sys_city_code` VALUES ('2400', '云南省', '红河哈尼族彝族自治州', '石屏县', '\r\n532525', null);
INSERT INTO `sys_city_code` VALUES ('2401', '云南省', '红河哈尼族彝族自治州', '弥勒县', '\r\n532526', null);
INSERT INTO `sys_city_code` VALUES ('2402', '云南省', '红河哈尼族彝族自治州', '泸西县', '\r\n532527', null);
INSERT INTO `sys_city_code` VALUES ('2403', '云南省', '红河哈尼族彝族自治州', '元阳县', '\r\n532528', null);
INSERT INTO `sys_city_code` VALUES ('2404', '云南省', '红河哈尼族彝族自治州', '红河县', '\r\n532529', null);
INSERT INTO `sys_city_code` VALUES ('2405', '云南省', '红河哈尼族彝族自治州', '金平苗族瑶族傣族自治县', '\r\n532530', null);
INSERT INTO `sys_city_code` VALUES ('2406', '云南省', '红河哈尼族彝族自治州', '绿春县', '\r\n532531', null);
INSERT INTO `sys_city_code` VALUES ('2407', '云南省', '红河哈尼族彝族自治州', '河口瑶族自治县', '\r\n532532', null);
INSERT INTO `sys_city_code` VALUES ('2408', '云南省', '文山壮族苗族自治州', '文山县', '\r\n532621', null);
INSERT INTO `sys_city_code` VALUES ('2409', '云南省', '文山壮族苗族自治州', '砚山县', '\r\n532622', null);
INSERT INTO `sys_city_code` VALUES ('2410', '云南省', '文山壮族苗族自治州', '西畴县', '\r\n532623', null);
INSERT INTO `sys_city_code` VALUES ('2411', '云南省', '文山壮族苗族自治州', '麻栗坡县', '\r\n532624', null);
INSERT INTO `sys_city_code` VALUES ('2412', '云南省', '文山壮族苗族自治州', '马关县', '\r\n532625', null);
INSERT INTO `sys_city_code` VALUES ('2413', '云南省', '文山壮族苗族自治州', '丘北县', '\r\n532626', null);
INSERT INTO `sys_city_code` VALUES ('2414', '云南省', '文山壮族苗族自治州', '广南县', '\r\n532627', null);
INSERT INTO `sys_city_code` VALUES ('2415', '云南省', '文山壮族苗族自治州', '富宁县', '\r\n532628', null);
INSERT INTO `sys_city_code` VALUES ('2416', '云南省', '西双版纳傣族自治州', '景洪市', '\r\n532801', null);
INSERT INTO `sys_city_code` VALUES ('2417', '云南省', '西双版纳傣族自治州', '勐海县', '\r\n532822', null);
INSERT INTO `sys_city_code` VALUES ('2418', '云南省', '西双版纳傣族自治州', '勐腊县', '\r\n532823', null);
INSERT INTO `sys_city_code` VALUES ('2419', '云南省', '大理白族自治州', '大理市', '\r\n532901', null);
INSERT INTO `sys_city_code` VALUES ('2420', '云南省', '大理白族自治州', '漾濞彝族自治县', '\r\n532922', null);
INSERT INTO `sys_city_code` VALUES ('2421', '云南省', '大理白族自治州', '祥云县', '\r\n532923', null);
INSERT INTO `sys_city_code` VALUES ('2422', '云南省', '大理白族自治州', '宾川县', '\r\n532924', null);
INSERT INTO `sys_city_code` VALUES ('2423', '云南省', '大理白族自治州', '弥渡县', '\r\n532925', null);
INSERT INTO `sys_city_code` VALUES ('2424', '云南省', '大理白族自治州', '南涧彝族自治县', '\r\n532926', null);
INSERT INTO `sys_city_code` VALUES ('2425', '云南省', '大理白族自治州', '巍山彝族回族自治县', '\r\n532927', null);
INSERT INTO `sys_city_code` VALUES ('2426', '云南省', '大理白族自治州', '永平县', '\r\n532928', null);
INSERT INTO `sys_city_code` VALUES ('2427', '云南省', '大理白族自治州', '云龙县', '\r\n532929', null);
INSERT INTO `sys_city_code` VALUES ('2428', '云南省', '大理白族自治州', '洱源县', '\r\n532930', null);
INSERT INTO `sys_city_code` VALUES ('2429', '云南省', '大理白族自治州', '剑川县', '\r\n532931', null);
INSERT INTO `sys_city_code` VALUES ('2430', '云南省', '大理白族自治州', '鹤庆县', '\r\n532932', null);
INSERT INTO `sys_city_code` VALUES ('2431', '云南省', '德宏傣族景颇族自治州', '瑞丽市', '\r\n533102', null);
INSERT INTO `sys_city_code` VALUES ('2432', '云南省', '德宏傣族景颇族自治州', '潞西市', '\r\n533103', null);
INSERT INTO `sys_city_code` VALUES ('2433', '云南省', '德宏傣族景颇族自治州', '梁河县', '\r\n533122', null);
INSERT INTO `sys_city_code` VALUES ('2434', '云南省', '德宏傣族景颇族自治州', '盈江县', '\r\n533123', null);
INSERT INTO `sys_city_code` VALUES ('2435', '云南省', '德宏傣族景颇族自治州', '陇川县', '\r\n533124', null);
INSERT INTO `sys_city_code` VALUES ('2436', '云南省', '怒江傈僳族自治州', '泸水县', '\r\n533321', null);
INSERT INTO `sys_city_code` VALUES ('2437', '云南省', '怒江傈僳族自治州', '福贡县', '\r\n533323', null);
INSERT INTO `sys_city_code` VALUES ('2438', '云南省', '怒江傈僳族自治州', '贡山独龙族怒族自治县', '\r\n533324', null);
INSERT INTO `sys_city_code` VALUES ('2439', '云南省', '怒江傈僳族自治州', '兰坪白族普米族自治县', '\r\n533325', null);
INSERT INTO `sys_city_code` VALUES ('2440', '云南省', '迪庆藏族自治州', '香格里拉县', '\r\n533421', null);
INSERT INTO `sys_city_code` VALUES ('2441', '云南省', '迪庆藏族自治州', '德钦县', '\r\n533422', null);
INSERT INTO `sys_city_code` VALUES ('2442', '云南省', '迪庆藏族自治州', '维西傈僳族自治县', '\r\n533423', null);
INSERT INTO `sys_city_code` VALUES ('2443', '西藏自治区', '拉萨市', '城关区', '\r\n540102', null);
INSERT INTO `sys_city_code` VALUES ('2444', '西藏自治区', '拉萨市', '林周县', '\r\n540121', null);
INSERT INTO `sys_city_code` VALUES ('2445', '西藏自治区', '拉萨市', '当雄县', '\r\n540122', null);
INSERT INTO `sys_city_code` VALUES ('2446', '西藏自治区', '拉萨市', '尼木县', '\r\n540123', null);
INSERT INTO `sys_city_code` VALUES ('2447', '西藏自治区', '拉萨市', '曲水县', '\r\n540124', null);
INSERT INTO `sys_city_code` VALUES ('2448', '西藏自治区', '拉萨市', '堆龙德庆县', '\r\n540125', null);
INSERT INTO `sys_city_code` VALUES ('2449', '西藏自治区', '拉萨市', '达孜县', '\r\n540126', null);
INSERT INTO `sys_city_code` VALUES ('2450', '西藏自治区', '拉萨市', '墨竹工卡县', '\r\n540127', null);
INSERT INTO `sys_city_code` VALUES ('2451', '西藏自治区', '昌都地区', '昌都县', '\r\n542121', null);
INSERT INTO `sys_city_code` VALUES ('2452', '西藏自治区', '昌都地区', '江达县', '\r\n542122', null);
INSERT INTO `sys_city_code` VALUES ('2453', '西藏自治区', '昌都地区', '贡觉县', '\r\n542123', null);
INSERT INTO `sys_city_code` VALUES ('2454', '西藏自治区', '昌都地区', '类乌齐县', '\r\n542124', null);
INSERT INTO `sys_city_code` VALUES ('2455', '西藏自治区', '昌都地区', '丁青县', '\r\n542125', null);
INSERT INTO `sys_city_code` VALUES ('2456', '西藏自治区', '昌都地区', '察雅县', '\r\n542126', null);
INSERT INTO `sys_city_code` VALUES ('2457', '西藏自治区', '昌都地区', '八宿县', '\r\n542127', null);
INSERT INTO `sys_city_code` VALUES ('2458', '西藏自治区', '昌都地区', '左贡县', '\r\n542128', null);
INSERT INTO `sys_city_code` VALUES ('2459', '西藏自治区', '昌都地区', '芒康县', '\r\n542129', null);
INSERT INTO `sys_city_code` VALUES ('2460', '西藏自治区', '昌都地区', '洛隆县', '\r\n542132', null);
INSERT INTO `sys_city_code` VALUES ('2461', '西藏自治区', '昌都地区', '边坝县', '\r\n542133', null);
INSERT INTO `sys_city_code` VALUES ('2462', '西藏自治区', '山南地区', '乃东县', '\r\n542221', null);
INSERT INTO `sys_city_code` VALUES ('2463', '西藏自治区', '山南地区', '扎囊县', '\r\n542222', null);
INSERT INTO `sys_city_code` VALUES ('2464', '西藏自治区', '山南地区', '贡嘎县', '\r\n542223', null);
INSERT INTO `sys_city_code` VALUES ('2465', '西藏自治区', '山南地区', '桑日县', '\r\n542224', null);
INSERT INTO `sys_city_code` VALUES ('2466', '西藏自治区', '山南地区', '琼结县', '\r\n542225', null);
INSERT INTO `sys_city_code` VALUES ('2467', '西藏自治区', '山南地区', '曲松县', '\r\n542226', null);
INSERT INTO `sys_city_code` VALUES ('2468', '西藏自治区', '山南地区', '措美县', '\r\n542227', null);
INSERT INTO `sys_city_code` VALUES ('2469', '西藏自治区', '山南地区', '洛扎县', '\r\n542228', null);
INSERT INTO `sys_city_code` VALUES ('2470', '西藏自治区', '山南地区', '加查县', '\r\n542229', null);
INSERT INTO `sys_city_code` VALUES ('2471', '西藏自治区', '山南地区', '隆子县', '\r\n542231', null);
INSERT INTO `sys_city_code` VALUES ('2472', '西藏自治区', '山南地区', '错那县', '\r\n542232', null);
INSERT INTO `sys_city_code` VALUES ('2473', '西藏自治区', '山南地区', '浪卡子县', '\r\n542233', null);
INSERT INTO `sys_city_code` VALUES ('2474', '西藏自治区', '日喀则地区', '日喀则市', '\r\n542301', null);
INSERT INTO `sys_city_code` VALUES ('2475', '西藏自治区', '日喀则地区', '南木林县', '\r\n542322', null);
INSERT INTO `sys_city_code` VALUES ('2476', '西藏自治区', '日喀则地区', '江孜县', '\r\n542323', null);
INSERT INTO `sys_city_code` VALUES ('2477', '西藏自治区', '日喀则地区', '定日县', '\r\n542324', null);
INSERT INTO `sys_city_code` VALUES ('2478', '西藏自治区', '日喀则地区', '萨迦县', '\r\n542325', null);
INSERT INTO `sys_city_code` VALUES ('2479', '西藏自治区', '日喀则地区', '拉孜县', '\r\n542326', null);
INSERT INTO `sys_city_code` VALUES ('2480', '西藏自治区', '日喀则地区', '昂仁县', '\r\n542327', null);
INSERT INTO `sys_city_code` VALUES ('2481', '西藏自治区', '日喀则地区', '谢通门县', '\r\n542328', null);
INSERT INTO `sys_city_code` VALUES ('2482', '西藏自治区', '日喀则地区', '白朗县', '\r\n542329', null);
INSERT INTO `sys_city_code` VALUES ('2483', '西藏自治区', '日喀则地区', '仁布县', '\r\n542330', null);
INSERT INTO `sys_city_code` VALUES ('2484', '西藏自治区', '日喀则地区', '康马县', '\r\n542331', null);
INSERT INTO `sys_city_code` VALUES ('2485', '西藏自治区', '日喀则地区', '定结县', '\r\n542332', null);
INSERT INTO `sys_city_code` VALUES ('2486', '西藏自治区', '日喀则地区', '仲巴县', '\r\n542333', null);
INSERT INTO `sys_city_code` VALUES ('2487', '西藏自治区', '日喀则地区', '亚东县', '\r\n542334', null);
INSERT INTO `sys_city_code` VALUES ('2488', '西藏自治区', '日喀则地区', '吉隆县', '\r\n542335', null);
INSERT INTO `sys_city_code` VALUES ('2489', '西藏自治区', '日喀则地区', '聂拉木县', '\r\n542336', null);
INSERT INTO `sys_city_code` VALUES ('2490', '西藏自治区', '日喀则地区', '萨嘎县', '\r\n542337', null);
INSERT INTO `sys_city_code` VALUES ('2491', '西藏自治区', '日喀则地区', '岗巴县', '\r\n542338', null);
INSERT INTO `sys_city_code` VALUES ('2492', '西藏自治区', '那曲地区', '那曲县', '\r\n542421', null);
INSERT INTO `sys_city_code` VALUES ('2493', '西藏自治区', '那曲地区', '嘉黎县', '\r\n542422', null);
INSERT INTO `sys_city_code` VALUES ('2494', '西藏自治区', '那曲地区', '比如县', '\r\n542423', null);
INSERT INTO `sys_city_code` VALUES ('2495', '西藏自治区', '那曲地区', '聂荣县', '\r\n542424', null);
INSERT INTO `sys_city_code` VALUES ('2496', '西藏自治区', '那曲地区', '安多县', '\r\n542425', null);
INSERT INTO `sys_city_code` VALUES ('2497', '西藏自治区', '那曲地区', '申扎县', '\r\n542426', null);
INSERT INTO `sys_city_code` VALUES ('2498', '西藏自治区', '那曲地区', '索县', '\r\n542427', null);
INSERT INTO `sys_city_code` VALUES ('2499', '西藏自治区', '那曲地区', '班戈县', '\r\n542428', null);
INSERT INTO `sys_city_code` VALUES ('2500', '西藏自治区', '那曲地区', '巴青县', '\r\n542429', null);
INSERT INTO `sys_city_code` VALUES ('2501', '西藏自治区', '那曲地区', '尼玛县', '\r\n542430', null);
INSERT INTO `sys_city_code` VALUES ('2502', '西藏自治区', '阿里地区', '普兰县', '\r\n542521', null);
INSERT INTO `sys_city_code` VALUES ('2503', '西藏自治区', '阿里地区', '札达县', '\r\n542522', null);
INSERT INTO `sys_city_code` VALUES ('2504', '西藏自治区', '阿里地区', '噶尔县', '\r\n542523', null);
INSERT INTO `sys_city_code` VALUES ('2505', '西藏自治区', '阿里地区', '日土县', '\r\n542524', null);
INSERT INTO `sys_city_code` VALUES ('2506', '西藏自治区', '阿里地区', '革吉县', '\r\n542525', null);
INSERT INTO `sys_city_code` VALUES ('2507', '西藏自治区', '阿里地区', '改则县', '\r\n542526', null);
INSERT INTO `sys_city_code` VALUES ('2508', '西藏自治区', '阿里地区', '措勤县', '\r\n542527', null);
INSERT INTO `sys_city_code` VALUES ('2509', '西藏自治区', '林芝地区', '林芝县', '\r\n542621', null);
INSERT INTO `sys_city_code` VALUES ('2510', '西藏自治区', '林芝地区', '工布江达县', '\r\n542622', null);
INSERT INTO `sys_city_code` VALUES ('2511', '西藏自治区', '林芝地区', '米林县', '\r\n542623', null);
INSERT INTO `sys_city_code` VALUES ('2512', '西藏自治区', '林芝地区', '墨脱县', '\r\n542624', null);
INSERT INTO `sys_city_code` VALUES ('2513', '西藏自治区', '林芝地区', '波密县', '\r\n542625', null);
INSERT INTO `sys_city_code` VALUES ('2514', '西藏自治区', '林芝地区', '察隅县', '\r\n542626', null);
INSERT INTO `sys_city_code` VALUES ('2515', '西藏自治区', '林芝地区', '朗县', '\r\n542627', null);
INSERT INTO `sys_city_code` VALUES ('2516', '陕西省', '西安市', '新城区', '\r\n610102', null);
INSERT INTO `sys_city_code` VALUES ('2517', '陕西省', '西安市', '碑林区', '\r\n610103', null);
INSERT INTO `sys_city_code` VALUES ('2518', '陕西省', '西安市', '莲湖区', '\r\n610104', null);
INSERT INTO `sys_city_code` VALUES ('2519', '陕西省', '西安市', '灞桥区', '\r\n610111', null);
INSERT INTO `sys_city_code` VALUES ('2520', '陕西省', '西安市', '未央区', '\r\n610112', null);
INSERT INTO `sys_city_code` VALUES ('2521', '陕西省', '西安市', '雁塔区', '\r\n610113', null);
INSERT INTO `sys_city_code` VALUES ('2522', '陕西省', '西安市', '阎良区', '\r\n610114', null);
INSERT INTO `sys_city_code` VALUES ('2523', '陕西省', '西安市', '临潼区', '\r\n610115', null);
INSERT INTO `sys_city_code` VALUES ('2524', '陕西省', '西安市', '长安区', '\r\n610116', null);
INSERT INTO `sys_city_code` VALUES ('2525', '陕西省', '西安市', '蓝田县', '\r\n610122', null);
INSERT INTO `sys_city_code` VALUES ('2526', '陕西省', '西安市', '周至县', '\r\n610124', null);
INSERT INTO `sys_city_code` VALUES ('2527', '陕西省', '西安市', '户县', '\r\n610125', null);
INSERT INTO `sys_city_code` VALUES ('2528', '陕西省', '西安市', '高陵县', '\r\n610126', null);
INSERT INTO `sys_city_code` VALUES ('2529', '陕西省', '铜川市', '王益区', '\r\n610202', null);
INSERT INTO `sys_city_code` VALUES ('2530', '陕西省', '铜川市', '印台区', '\r\n610203', null);
INSERT INTO `sys_city_code` VALUES ('2531', '陕西省', '铜川市', '耀州区', '\r\n610204', null);
INSERT INTO `sys_city_code` VALUES ('2532', '陕西省', '铜川市', '宜君县', '\r\n610222', null);
INSERT INTO `sys_city_code` VALUES ('2533', '陕西省', '宝鸡市', '渭滨区', '\r\n610302', null);
INSERT INTO `sys_city_code` VALUES ('2534', '陕西省', '宝鸡市', '金台区', '\r\n610303', null);
INSERT INTO `sys_city_code` VALUES ('2535', '陕西省', '宝鸡市', '陈仓区', '\r\n610304', null);
INSERT INTO `sys_city_code` VALUES ('2536', '陕西省', '宝鸡市', '凤翔县', '\r\n610322', null);
INSERT INTO `sys_city_code` VALUES ('2537', '陕西省', '宝鸡市', '岐山县', '\r\n610323', null);
INSERT INTO `sys_city_code` VALUES ('2538', '陕西省', '宝鸡市', '扶风县', '\r\n610324', null);
INSERT INTO `sys_city_code` VALUES ('2539', '陕西省', '宝鸡市', '眉县', '\r\n610326', null);
INSERT INTO `sys_city_code` VALUES ('2540', '陕西省', '宝鸡市', '陇县', '\r\n610327', null);
INSERT INTO `sys_city_code` VALUES ('2541', '陕西省', '宝鸡市', '千阳县', '\r\n610328', null);
INSERT INTO `sys_city_code` VALUES ('2542', '陕西省', '宝鸡市', '麟游县', '\r\n610329', null);
INSERT INTO `sys_city_code` VALUES ('2543', '陕西省', '宝鸡市', '凤县', '\r\n610330', null);
INSERT INTO `sys_city_code` VALUES ('2544', '陕西省', '宝鸡市', '太白县', '\r\n610331', null);
INSERT INTO `sys_city_code` VALUES ('2545', '陕西省', '咸阳市', '秦都区', '\r\n610402', null);
INSERT INTO `sys_city_code` VALUES ('2546', '陕西省', '咸阳市', '杨凌区', '\r\n610403', null);
INSERT INTO `sys_city_code` VALUES ('2547', '陕西省', '咸阳市', '渭城区', '\r\n610404', null);
INSERT INTO `sys_city_code` VALUES ('2548', '陕西省', '咸阳市', '三原县', '\r\n610422', null);
INSERT INTO `sys_city_code` VALUES ('2549', '陕西省', '咸阳市', '泾阳县', '\r\n610423', null);
INSERT INTO `sys_city_code` VALUES ('2550', '陕西省', '咸阳市', '乾县', '\r\n610424', null);
INSERT INTO `sys_city_code` VALUES ('2551', '陕西省', '咸阳市', '礼泉县', '\r\n610425', null);
INSERT INTO `sys_city_code` VALUES ('2552', '陕西省', '咸阳市', '永寿县', '\r\n610426', null);
INSERT INTO `sys_city_code` VALUES ('2553', '陕西省', '咸阳市', '彬县', '\r\n610427', null);
INSERT INTO `sys_city_code` VALUES ('2554', '陕西省', '咸阳市', '长武县', '\r\n610428', null);
INSERT INTO `sys_city_code` VALUES ('2555', '陕西省', '咸阳市', '旬邑县', '\r\n610429', null);
INSERT INTO `sys_city_code` VALUES ('2556', '陕西省', '咸阳市', '淳化县', '\r\n610430', null);
INSERT INTO `sys_city_code` VALUES ('2557', '陕西省', '咸阳市', '武功县', '\r\n610431', null);
INSERT INTO `sys_city_code` VALUES ('2558', '陕西省', '咸阳市', '兴平市', '\r\n610481', null);
INSERT INTO `sys_city_code` VALUES ('2559', '陕西省', '渭南市', '临渭区', '\r\n610502', null);
INSERT INTO `sys_city_code` VALUES ('2560', '陕西省', '渭南市', '华县', '\r\n610521', null);
INSERT INTO `sys_city_code` VALUES ('2561', '陕西省', '渭南市', '潼关县', '\r\n610522', null);
INSERT INTO `sys_city_code` VALUES ('2562', '陕西省', '渭南市', '大荔县', '\r\n610523', null);
INSERT INTO `sys_city_code` VALUES ('2563', '陕西省', '渭南市', '合阳县', '\r\n610524', null);
INSERT INTO `sys_city_code` VALUES ('2564', '陕西省', '渭南市', '澄城县', '\r\n610525', null);
INSERT INTO `sys_city_code` VALUES ('2565', '陕西省', '渭南市', '蒲城县', '\r\n610526', null);
INSERT INTO `sys_city_code` VALUES ('2566', '陕西省', '渭南市', '白水县', '\r\n610527', null);
INSERT INTO `sys_city_code` VALUES ('2567', '陕西省', '渭南市', '富平县', '\r\n610528', null);
INSERT INTO `sys_city_code` VALUES ('2568', '陕西省', '渭南市', '韩城市', '\r\n610581', null);
INSERT INTO `sys_city_code` VALUES ('2569', '陕西省', '渭南市', '华阴市', '\r\n610582', null);
INSERT INTO `sys_city_code` VALUES ('2570', '陕西省', '延安市', '宝塔区', '\r\n610602', null);
INSERT INTO `sys_city_code` VALUES ('2571', '陕西省', '延安市', '延长县', '\r\n610621', null);
INSERT INTO `sys_city_code` VALUES ('2572', '陕西省', '延安市', '延川县', '\r\n610622', null);
INSERT INTO `sys_city_code` VALUES ('2573', '陕西省', '延安市', '子长县', '\r\n610623', null);
INSERT INTO `sys_city_code` VALUES ('2574', '陕西省', '延安市', '安塞县', '\r\n610624', null);
INSERT INTO `sys_city_code` VALUES ('2575', '陕西省', '延安市', '志丹县', '\r\n610625', null);
INSERT INTO `sys_city_code` VALUES ('2576', '陕西省', '延安市', '吴旗县', '\r\n610626', null);
INSERT INTO `sys_city_code` VALUES ('2577', '陕西省', '延安市', '甘泉县', '\r\n610627', null);
INSERT INTO `sys_city_code` VALUES ('2578', '陕西省', '延安市', '富县', '\r\n610628', null);
INSERT INTO `sys_city_code` VALUES ('2579', '陕西省', '延安市', '洛川县', '\r\n610629', null);
INSERT INTO `sys_city_code` VALUES ('2580', '陕西省', '延安市', '宜川县', '\r\n610630', null);
INSERT INTO `sys_city_code` VALUES ('2581', '陕西省', '延安市', '黄龙县', '\r\n610631', null);
INSERT INTO `sys_city_code` VALUES ('2582', '陕西省', '延安市', '黄陵县', '\r\n610632', null);
INSERT INTO `sys_city_code` VALUES ('2583', '陕西省', '汉中市', '汉台区', '\r\n610702', null);
INSERT INTO `sys_city_code` VALUES ('2584', '陕西省', '汉中市', '南郑县', '\r\n610721', null);
INSERT INTO `sys_city_code` VALUES ('2585', '陕西省', '汉中市', '城固县', '\r\n610722', null);
INSERT INTO `sys_city_code` VALUES ('2586', '陕西省', '汉中市', '洋县', '\r\n610723', null);
INSERT INTO `sys_city_code` VALUES ('2587', '陕西省', '汉中市', '西乡县', '\r\n610724', null);
INSERT INTO `sys_city_code` VALUES ('2588', '陕西省', '汉中市', '勉县', '\r\n610725', null);
INSERT INTO `sys_city_code` VALUES ('2589', '陕西省', '汉中市', '宁强县', '\r\n610726', null);
INSERT INTO `sys_city_code` VALUES ('2590', '陕西省', '汉中市', '略阳县', '\r\n610727', null);
INSERT INTO `sys_city_code` VALUES ('2591', '陕西省', '汉中市', '镇巴县', '\r\n610728', null);
INSERT INTO `sys_city_code` VALUES ('2592', '陕西省', '汉中市', '留坝县', '\r\n610729', null);
INSERT INTO `sys_city_code` VALUES ('2593', '陕西省', '汉中市', '佛坪县', '\r\n610730', null);
INSERT INTO `sys_city_code` VALUES ('2594', '陕西省', '榆林市', '榆阳区', '\r\n610802', null);
INSERT INTO `sys_city_code` VALUES ('2595', '陕西省', '榆林市', '神木县', '\r\n610821', null);
INSERT INTO `sys_city_code` VALUES ('2596', '陕西省', '榆林市', '府谷县', '\r\n610822', null);
INSERT INTO `sys_city_code` VALUES ('2597', '陕西省', '榆林市', '横山县', '\r\n610823', null);
INSERT INTO `sys_city_code` VALUES ('2598', '陕西省', '榆林市', '靖边县', '\r\n610824', null);
INSERT INTO `sys_city_code` VALUES ('2599', '陕西省', '榆林市', '定边县', '\r\n610825', null);
INSERT INTO `sys_city_code` VALUES ('2600', '陕西省', '榆林市', '绥德县', '\r\n610826', null);
INSERT INTO `sys_city_code` VALUES ('2601', '陕西省', '榆林市', '米脂县', '\r\n610827', null);
INSERT INTO `sys_city_code` VALUES ('2602', '陕西省', '榆林市', '佳县', '\r\n610828', null);
INSERT INTO `sys_city_code` VALUES ('2603', '陕西省', '榆林市', '吴堡县', '\r\n610829', null);
INSERT INTO `sys_city_code` VALUES ('2604', '陕西省', '榆林市', '清涧县', '\r\n610830', null);
INSERT INTO `sys_city_code` VALUES ('2605', '陕西省', '榆林市', '子洲县', '\r\n610831', null);
INSERT INTO `sys_city_code` VALUES ('2606', '陕西省', '安康市', '汉滨区', '\r\n610902', null);
INSERT INTO `sys_city_code` VALUES ('2607', '陕西省', '安康市', '汉阴县', '\r\n610921', null);
INSERT INTO `sys_city_code` VALUES ('2608', '陕西省', '安康市', '石泉县', '\r\n610922', null);
INSERT INTO `sys_city_code` VALUES ('2609', '陕西省', '安康市', '宁陕县', '\r\n610923', null);
INSERT INTO `sys_city_code` VALUES ('2610', '陕西省', '安康市', '紫阳县', '\r\n610924', null);
INSERT INTO `sys_city_code` VALUES ('2611', '陕西省', '安康市', '岚皋县', '\r\n610925', null);
INSERT INTO `sys_city_code` VALUES ('2612', '陕西省', '安康市', '平利县', '\r\n610926', null);
INSERT INTO `sys_city_code` VALUES ('2613', '陕西省', '安康市', '镇坪县', '\r\n610927', null);
INSERT INTO `sys_city_code` VALUES ('2614', '陕西省', '安康市', '旬阳县', '\r\n610928', null);
INSERT INTO `sys_city_code` VALUES ('2615', '陕西省', '安康市', '白河县', '\r\n610929', null);
INSERT INTO `sys_city_code` VALUES ('2616', '陕西省', '商洛市', '商州区', '\r\n611002', null);
INSERT INTO `sys_city_code` VALUES ('2617', '陕西省', '商洛市', '洛南县', '\r\n611021', null);
INSERT INTO `sys_city_code` VALUES ('2618', '陕西省', '商洛市', '丹凤县', '\r\n611022', null);
INSERT INTO `sys_city_code` VALUES ('2619', '陕西省', '商洛市', '商南县', '\r\n611023', null);
INSERT INTO `sys_city_code` VALUES ('2620', '陕西省', '商洛市', '山阳县', '\r\n611024', null);
INSERT INTO `sys_city_code` VALUES ('2621', '陕西省', '商洛市', '镇安县', '\r\n611025', null);
INSERT INTO `sys_city_code` VALUES ('2622', '陕西省', '商洛市', '柞水县', '\r\n611026', null);
INSERT INTO `sys_city_code` VALUES ('2623', '甘肃省', '兰州市', '城关区', '\r\n620102', null);
INSERT INTO `sys_city_code` VALUES ('2624', '甘肃省', '兰州市', '七里河区', '\r\n620103', null);
INSERT INTO `sys_city_code` VALUES ('2625', '甘肃省', '兰州市', '西固区', '\r\n620104', null);
INSERT INTO `sys_city_code` VALUES ('2626', '甘肃省', '兰州市', '安宁区', '\r\n620105', null);
INSERT INTO `sys_city_code` VALUES ('2627', '甘肃省', '兰州市', '红古区', '\r\n620111', null);
INSERT INTO `sys_city_code` VALUES ('2628', '甘肃省', '兰州市', '永登县', '\r\n620121', null);
INSERT INTO `sys_city_code` VALUES ('2629', '甘肃省', '兰州市', '皋兰县', '\r\n620122', null);
INSERT INTO `sys_city_code` VALUES ('2630', '甘肃省', '兰州市', '榆中县', '\r\n620123', null);
INSERT INTO `sys_city_code` VALUES ('2631', '甘肃省', '嘉峪关市', '嘉峪关市', '\r\n620201', null);
INSERT INTO `sys_city_code` VALUES ('2632', '甘肃省', '金昌市', '金川区', '\r\n620302', null);
INSERT INTO `sys_city_code` VALUES ('2633', '甘肃省', '金昌市', '永昌县', '\r\n620321', null);
INSERT INTO `sys_city_code` VALUES ('2634', '甘肃省', '白银市', '白银区', '\r\n620402', null);
INSERT INTO `sys_city_code` VALUES ('2635', '甘肃省', '白银市', '平川区', '\r\n620403', null);
INSERT INTO `sys_city_code` VALUES ('2636', '甘肃省', '白银市', '靖远县', '\r\n620421', null);
INSERT INTO `sys_city_code` VALUES ('2637', '甘肃省', '白银市', '会宁县', '\r\n620422', null);
INSERT INTO `sys_city_code` VALUES ('2638', '甘肃省', '白银市', '景泰县', '\r\n620423', null);
INSERT INTO `sys_city_code` VALUES ('2639', '甘肃省', '天水市', '秦城区', '\r\n620502', null);
INSERT INTO `sys_city_code` VALUES ('2640', '甘肃省', '天水市', '北道区', '\r\n620503', null);
INSERT INTO `sys_city_code` VALUES ('2641', '甘肃省', '天水市', '清水县', '\r\n620521', null);
INSERT INTO `sys_city_code` VALUES ('2642', '甘肃省', '天水市', '秦安县', '\r\n620522', null);
INSERT INTO `sys_city_code` VALUES ('2643', '甘肃省', '天水市', '甘谷县', '\r\n620523', null);
INSERT INTO `sys_city_code` VALUES ('2644', '甘肃省', '天水市', '武山县', '\r\n620524', null);
INSERT INTO `sys_city_code` VALUES ('2645', '甘肃省', '天水市', '张家川回族自治县', '\r\n620525', null);
INSERT INTO `sys_city_code` VALUES ('2646', '甘肃省', '武威市', '凉州区', '\r\n620602', null);
INSERT INTO `sys_city_code` VALUES ('2647', '甘肃省', '武威市', '民勤县', '\r\n620621', null);
INSERT INTO `sys_city_code` VALUES ('2648', '甘肃省', '武威市', '古浪县', '\r\n620622', null);
INSERT INTO `sys_city_code` VALUES ('2649', '甘肃省', '武威市', '天祝藏族自治县', '\r\n620623', null);
INSERT INTO `sys_city_code` VALUES ('2650', '甘肃省', '张掖市', '甘州区', '\r\n620702', null);
INSERT INTO `sys_city_code` VALUES ('2651', '甘肃省', '张掖市', '肃南裕固族自治县', '\r\n620721', null);
INSERT INTO `sys_city_code` VALUES ('2652', '甘肃省', '张掖市', '民乐县', '\r\n620722', null);
INSERT INTO `sys_city_code` VALUES ('2653', '甘肃省', '张掖市', '临泽县', '\r\n620723', null);
INSERT INTO `sys_city_code` VALUES ('2654', '甘肃省', '张掖市', '高台县', '\r\n620724', null);
INSERT INTO `sys_city_code` VALUES ('2655', '甘肃省', '张掖市', '山丹县', '\r\n620725', null);
INSERT INTO `sys_city_code` VALUES ('2656', '甘肃省', '平凉市', '崆峒区', '\r\n620802', null);
INSERT INTO `sys_city_code` VALUES ('2657', '甘肃省', '平凉市', '泾川县', '\r\n620821', null);
INSERT INTO `sys_city_code` VALUES ('2658', '甘肃省', '平凉市', '灵台县', '\r\n620822', null);
INSERT INTO `sys_city_code` VALUES ('2659', '甘肃省', '平凉市', '崇信县', '\r\n620823', null);
INSERT INTO `sys_city_code` VALUES ('2660', '甘肃省', '平凉市', '华亭县', '\r\n620824', null);
INSERT INTO `sys_city_code` VALUES ('2661', '甘肃省', '平凉市', '庄浪县', '\r\n620825', null);
INSERT INTO `sys_city_code` VALUES ('2662', '甘肃省', '平凉市', '静宁县', '\r\n620826', null);
INSERT INTO `sys_city_code` VALUES ('2663', '甘肃省', '酒泉市', '肃州区', '\r\n620902', null);
INSERT INTO `sys_city_code` VALUES ('2664', '甘肃省', '酒泉市', '金塔县', '\r\n620921', null);
INSERT INTO `sys_city_code` VALUES ('2665', '甘肃省', '酒泉市', '安西县', '\r\n620922', null);
INSERT INTO `sys_city_code` VALUES ('2666', '甘肃省', '酒泉市', '肃北蒙古族自治县', '\r\n620923', null);
INSERT INTO `sys_city_code` VALUES ('2667', '甘肃省', '酒泉市', '阿克塞哈萨克族自治县', '\r\n620924', null);
INSERT INTO `sys_city_code` VALUES ('2668', '甘肃省', '酒泉市', '玉门市', '\r\n620981', null);
INSERT INTO `sys_city_code` VALUES ('2669', '甘肃省', '酒泉市', '敦煌市', '\r\n620982', null);
INSERT INTO `sys_city_code` VALUES ('2670', '甘肃省', '庆阳市', '西峰区', '\r\n621002', null);
INSERT INTO `sys_city_code` VALUES ('2671', '甘肃省', '庆阳市', '庆城县', '\r\n621021', null);
INSERT INTO `sys_city_code` VALUES ('2672', '甘肃省', '庆阳市', '环县', '\r\n621022', null);
INSERT INTO `sys_city_code` VALUES ('2673', '甘肃省', '庆阳市', '华池县', '\r\n621023', null);
INSERT INTO `sys_city_code` VALUES ('2674', '甘肃省', '庆阳市', '合水县', '\r\n621024', null);
INSERT INTO `sys_city_code` VALUES ('2675', '甘肃省', '庆阳市', '正宁县', '\r\n621025', null);
INSERT INTO `sys_city_code` VALUES ('2676', '甘肃省', '庆阳市', '宁县', '\r\n621026', null);
INSERT INTO `sys_city_code` VALUES ('2677', '甘肃省', '庆阳市', '镇原县', '\r\n621027', null);
INSERT INTO `sys_city_code` VALUES ('2678', '甘肃省', '定西市', '安定区', '\r\n621102', null);
INSERT INTO `sys_city_code` VALUES ('2679', '甘肃省', '定西市', '通渭县', '\r\n621121', null);
INSERT INTO `sys_city_code` VALUES ('2680', '甘肃省', '定西市', '陇西县', '\r\n621122', null);
INSERT INTO `sys_city_code` VALUES ('2681', '甘肃省', '定西市', '渭源县', '\r\n621123', null);
INSERT INTO `sys_city_code` VALUES ('2682', '甘肃省', '定西市', '临洮县', '\r\n621124', null);
INSERT INTO `sys_city_code` VALUES ('2683', '甘肃省', '定西市', '漳县', '\r\n621125', null);
INSERT INTO `sys_city_code` VALUES ('2684', '甘肃省', '定西市', '岷县', '\r\n621126', null);
INSERT INTO `sys_city_code` VALUES ('2685', '甘肃省', '陇南地区', '武都县', '\r\n622621', null);
INSERT INTO `sys_city_code` VALUES ('2686', '甘肃省', '陇南地区', '宕昌县', '\r\n622623', null);
INSERT INTO `sys_city_code` VALUES ('2687', '甘肃省', '陇南地区', '成县', '\r\n622624', null);
INSERT INTO `sys_city_code` VALUES ('2688', '甘肃省', '陇南地区', '康县', '\r\n622625', null);
INSERT INTO `sys_city_code` VALUES ('2689', '甘肃省', '陇南地区', '文县', '\r\n622626', null);
INSERT INTO `sys_city_code` VALUES ('2690', '甘肃省', '陇南地区', '西和县', '\r\n622627', null);
INSERT INTO `sys_city_code` VALUES ('2691', '甘肃省', '陇南地区', '礼县', '\r\n622628', null);
INSERT INTO `sys_city_code` VALUES ('2692', '甘肃省', '陇南地区', '两当县', '\r\n622629', null);
INSERT INTO `sys_city_code` VALUES ('2693', '甘肃省', '陇南地区', '徽县', '\r\n622630', null);
INSERT INTO `sys_city_code` VALUES ('2694', '甘肃省', '临夏回族自治州', '临夏市', '\r\n622901', null);
INSERT INTO `sys_city_code` VALUES ('2695', '甘肃省', '临夏回族自治州', '临夏县', '\r\n622921', null);
INSERT INTO `sys_city_code` VALUES ('2696', '甘肃省', '临夏回族自治州', '康乐县', '\r\n622922', null);
INSERT INTO `sys_city_code` VALUES ('2697', '甘肃省', '临夏回族自治州', '永靖县', '\r\n622923', null);
INSERT INTO `sys_city_code` VALUES ('2698', '甘肃省', '临夏回族自治州', '广河县', '\r\n622924', null);
INSERT INTO `sys_city_code` VALUES ('2699', '甘肃省', '临夏回族自治州', '和政县', '\r\n622925', null);
INSERT INTO `sys_city_code` VALUES ('2700', '甘肃省', '临夏回族自治州', '东乡族自治县', '\r\n622926', null);
INSERT INTO `sys_city_code` VALUES ('2701', '甘肃省', '临夏回族自治州', '积石山保安族东乡族撒拉族自治县', '\r\n622927', null);
INSERT INTO `sys_city_code` VALUES ('2702', '甘肃省', '甘南藏族自治州', '合作市', '\r\n623001', null);
INSERT INTO `sys_city_code` VALUES ('2703', '甘肃省', '甘南藏族自治州', '临潭县', '\r\n623021', null);
INSERT INTO `sys_city_code` VALUES ('2704', '甘肃省', '甘南藏族自治州', '卓尼县', '\r\n623022', null);
INSERT INTO `sys_city_code` VALUES ('2705', '甘肃省', '甘南藏族自治州', '舟曲县', '\r\n623023', null);
INSERT INTO `sys_city_code` VALUES ('2706', '甘肃省', '甘南藏族自治州', '迭部县', '\r\n623024', null);
INSERT INTO `sys_city_code` VALUES ('2707', '甘肃省', '甘南藏族自治州', '玛曲县', '\r\n623025', null);
INSERT INTO `sys_city_code` VALUES ('2708', '甘肃省', '甘南藏族自治州', '碌曲县', '\r\n623026', null);
INSERT INTO `sys_city_code` VALUES ('2709', '甘肃省', '甘南藏族自治州', '夏河县', '\r\n623027', null);
INSERT INTO `sys_city_code` VALUES ('2710', '青海省', '西宁市', '城东区', '\r\n630102', null);
INSERT INTO `sys_city_code` VALUES ('2711', '青海省', '西宁市', '城中区', '\r\n630103', null);
INSERT INTO `sys_city_code` VALUES ('2712', '青海省', '西宁市', '城西区', '\r\n630104', null);
INSERT INTO `sys_city_code` VALUES ('2713', '青海省', '西宁市', '城北区', '\r\n630105', null);
INSERT INTO `sys_city_code` VALUES ('2714', '青海省', '西宁市', '大通回族土族自治县', '\r\n630121', null);
INSERT INTO `sys_city_code` VALUES ('2715', '青海省', '西宁市', '湟中县', '\r\n630122', null);
INSERT INTO `sys_city_code` VALUES ('2716', '青海省', '西宁市', '湟源县', '\r\n630123', null);
INSERT INTO `sys_city_code` VALUES ('2717', '青海省', '海东地区', '平安县', '\r\n632121', null);
INSERT INTO `sys_city_code` VALUES ('2718', '青海省', '海东地区', '民和回族土族自治县', '\r\n632122', null);
INSERT INTO `sys_city_code` VALUES ('2719', '青海省', '海东地区', '乐都县', '\r\n632123', null);
INSERT INTO `sys_city_code` VALUES ('2720', '青海省', '海东地区', '互助土族自治县', '\r\n632126', null);
INSERT INTO `sys_city_code` VALUES ('2721', '青海省', '海东地区', '化隆回族自治县', '\r\n632127', null);
INSERT INTO `sys_city_code` VALUES ('2722', '青海省', '海东地区', '循化撒拉族自治县', '\r\n632128', null);
INSERT INTO `sys_city_code` VALUES ('2723', '青海省', '海北藏族自治州', '门源回族自治县', '\r\n632221', null);
INSERT INTO `sys_city_code` VALUES ('2724', '青海省', '海北藏族自治州', '祁连县', '\r\n632222', null);
INSERT INTO `sys_city_code` VALUES ('2725', '青海省', '海北藏族自治州', '海晏县', '\r\n632223', null);
INSERT INTO `sys_city_code` VALUES ('2726', '青海省', '海北藏族自治州', '刚察县', '\r\n632224', null);
INSERT INTO `sys_city_code` VALUES ('2727', '青海省', '黄南藏族自治州', '同仁县', '\r\n632321', null);
INSERT INTO `sys_city_code` VALUES ('2728', '青海省', '黄南藏族自治州', '尖扎县', '\r\n632322', null);
INSERT INTO `sys_city_code` VALUES ('2729', '青海省', '黄南藏族自治州', '泽库县', '\r\n632323', null);
INSERT INTO `sys_city_code` VALUES ('2730', '青海省', '黄南藏族自治州', '河南蒙古族自治县', '\r\n632324', null);
INSERT INTO `sys_city_code` VALUES ('2731', '青海省', '海南藏族自治州', '共和县', '\r\n632521', null);
INSERT INTO `sys_city_code` VALUES ('2732', '青海省', '海南藏族自治州', '同德县', '\r\n632522', null);
INSERT INTO `sys_city_code` VALUES ('2733', '青海省', '海南藏族自治州', '贵德县', '\r\n632523', null);
INSERT INTO `sys_city_code` VALUES ('2734', '青海省', '海南藏族自治州', '兴海县', '\r\n632524', null);
INSERT INTO `sys_city_code` VALUES ('2735', '青海省', '海南藏族自治州', '贵南县', '\r\n632525', null);
INSERT INTO `sys_city_code` VALUES ('2736', '青海省', '果洛藏族自治州', '玛沁县', '\r\n632621', null);
INSERT INTO `sys_city_code` VALUES ('2737', '青海省', '果洛藏族自治州', '班玛县', '\r\n632622', null);
INSERT INTO `sys_city_code` VALUES ('2738', '青海省', '果洛藏族自治州', '甘德县', '\r\n632623', null);
INSERT INTO `sys_city_code` VALUES ('2739', '青海省', '果洛藏族自治州', '达日县', '\r\n632624', null);
INSERT INTO `sys_city_code` VALUES ('2740', '青海省', '果洛藏族自治州', '久治县', '\r\n632625', null);
INSERT INTO `sys_city_code` VALUES ('2741', '青海省', '果洛藏族自治州', '玛多县', '\r\n632626', null);
INSERT INTO `sys_city_code` VALUES ('2742', '青海省', '玉树藏族自治州', '玉树县', '\r\n632721', null);
INSERT INTO `sys_city_code` VALUES ('2743', '青海省', '玉树藏族自治州', '杂多县', '\r\n632722', null);
INSERT INTO `sys_city_code` VALUES ('2744', '青海省', '玉树藏族自治州', '称多县', '\r\n632723', null);
INSERT INTO `sys_city_code` VALUES ('2745', '青海省', '玉树藏族自治州', '治多县', '\r\n632724', null);
INSERT INTO `sys_city_code` VALUES ('2746', '青海省', '玉树藏族自治州', '囊谦县', '\r\n632725', null);
INSERT INTO `sys_city_code` VALUES ('2747', '青海省', '玉树藏族自治州', '曲麻莱县', '\r\n632726', null);
INSERT INTO `sys_city_code` VALUES ('2748', '青海省', '海西蒙古族藏族自治州', '格尔木市', '\r\n632801', null);
INSERT INTO `sys_city_code` VALUES ('2749', '青海省', '海西蒙古族藏族自治州', '德令哈市', '\r\n632802', null);
INSERT INTO `sys_city_code` VALUES ('2750', '青海省', '海西蒙古族藏族自治州', '乌兰县', '\r\n632821', null);
INSERT INTO `sys_city_code` VALUES ('2751', '青海省', '海西蒙古族藏族自治州', '都兰县', '\r\n632822', null);
INSERT INTO `sys_city_code` VALUES ('2752', '青海省', '海西蒙古族藏族自治州', '天峻县', '\r\n632823', null);
INSERT INTO `sys_city_code` VALUES ('2753', '宁夏回族自治区', '银川市', '兴庆区', '\r\n640104', null);
INSERT INTO `sys_city_code` VALUES ('2754', '宁夏回族自治区', '银川市', '西夏区', '\r\n640105', null);
INSERT INTO `sys_city_code` VALUES ('2755', '宁夏回族自治区', '银川市', '金凤区', '\r\n640106', null);
INSERT INTO `sys_city_code` VALUES ('2756', '宁夏回族自治区', '银川市', '永宁县', '\r\n640121', null);
INSERT INTO `sys_city_code` VALUES ('2757', '宁夏回族自治区', '银川市', '贺兰县', '\r\n640122', null);
INSERT INTO `sys_city_code` VALUES ('2758', '宁夏回族自治区', '银川市', '灵武市', '\r\n640181', null);
INSERT INTO `sys_city_code` VALUES ('2759', '宁夏回族自治区', '石嘴山市', '大武口区', '\r\n640202', null);
INSERT INTO `sys_city_code` VALUES ('2760', '宁夏回族自治区', '石嘴山市', '惠农区', '\r\n640205', null);
INSERT INTO `sys_city_code` VALUES ('2761', '宁夏回族自治区', '石嘴山市', '平罗县', '\r\n640221', null);
INSERT INTO `sys_city_code` VALUES ('2762', '宁夏回族自治区', '吴忠市', '利通区', '\r\n640302', null);
INSERT INTO `sys_city_code` VALUES ('2763', '宁夏回族自治区', '吴忠市', '红寺堡区', '\r\n640303', null);
INSERT INTO `sys_city_code` VALUES ('2764', '宁夏回族自治区', '吴忠市', '盐池县', '\r\n640323', null);
INSERT INTO `sys_city_code` VALUES ('2765', '宁夏回族自治区', '吴忠市', '同心县', '\r\n640324', null);
INSERT INTO `sys_city_code` VALUES ('2766', '宁夏回族自治区', '吴忠市', '青铜峡市', '\r\n640381', null);
INSERT INTO `sys_city_code` VALUES ('2767', '宁夏回族自治区', '固原市', '原州区', '\r\n640402', null);
INSERT INTO `sys_city_code` VALUES ('2768', '宁夏回族自治区', '固原市', '西吉县', '\r\n640422', null);
INSERT INTO `sys_city_code` VALUES ('2769', '宁夏回族自治区', '固原市', '隆德县', '\r\n640423', null);
INSERT INTO `sys_city_code` VALUES ('2770', '宁夏回族自治区', '固原市', '泾源县', '\r\n640424', null);
INSERT INTO `sys_city_code` VALUES ('2771', '宁夏回族自治区', '固原市', '彭阳县', '\r\n640425', null);
INSERT INTO `sys_city_code` VALUES ('2772', '宁夏回族自治区', '中卫市', '沙坡头区', '\r\n640502', null);
INSERT INTO `sys_city_code` VALUES ('2773', '宁夏回族自治区', '中卫市', '中宁县', '\r\n640521', null);
INSERT INTO `sys_city_code` VALUES ('2774', '宁夏回族自治区', '中卫市', '海原县', '\r\n640522', null);
INSERT INTO `sys_city_code` VALUES ('2775', '新疆维吾尔自治区', '乌鲁木齐市', '天山区', '\r\n650102', null);
INSERT INTO `sys_city_code` VALUES ('2776', '新疆维吾尔自治区', '乌鲁木齐市', '沙依巴克区', '\r\n650103', null);
INSERT INTO `sys_city_code` VALUES ('2777', '新疆维吾尔自治区', '乌鲁木齐市', '新市区', '\r\n650104', null);
INSERT INTO `sys_city_code` VALUES ('2778', '新疆维吾尔自治区', '乌鲁木齐市', '水磨沟区', '\r\n650105', null);
INSERT INTO `sys_city_code` VALUES ('2779', '新疆维吾尔自治区', '乌鲁木齐市', '头屯河区', '\r\n650106', null);
INSERT INTO `sys_city_code` VALUES ('2780', '新疆维吾尔自治区', '乌鲁木齐市', '达坂城区', '\r\n650107', null);
INSERT INTO `sys_city_code` VALUES ('2781', '新疆维吾尔自治区', '乌鲁木齐市', '东山区', '\r\n650108', null);
INSERT INTO `sys_city_code` VALUES ('2782', '新疆维吾尔自治区', '乌鲁木齐市', '乌鲁木齐县', '\r\n650121', null);
INSERT INTO `sys_city_code` VALUES ('2783', '新疆维吾尔自治区', '克拉玛依市', '独山子区', '\r\n650202', null);
INSERT INTO `sys_city_code` VALUES ('2784', '新疆维吾尔自治区', '克拉玛依市', '克拉玛依区', '\r\n650203', null);
INSERT INTO `sys_city_code` VALUES ('2785', '新疆维吾尔自治区', '克拉玛依市', '白碱滩区', '\r\n650204', null);
INSERT INTO `sys_city_code` VALUES ('2786', '新疆维吾尔自治区', '克拉玛依市', '乌尔禾区', '\r\n650205', null);
INSERT INTO `sys_city_code` VALUES ('2787', '新疆维吾尔自治区', '吐鲁番地区', '吐鲁番市', '\r\n652101', null);
INSERT INTO `sys_city_code` VALUES ('2788', '新疆维吾尔自治区', '吐鲁番地区', '鄯善县', '\r\n652122', null);
INSERT INTO `sys_city_code` VALUES ('2789', '新疆维吾尔自治区', '吐鲁番地区', '托克逊县', '\r\n652123', null);
INSERT INTO `sys_city_code` VALUES ('2790', '新疆维吾尔自治区', '哈密地区', '哈密市', '\r\n652201', null);
INSERT INTO `sys_city_code` VALUES ('2791', '新疆维吾尔自治区', '哈密地区', '巴里坤哈萨克自治县', '\r\n652222', null);
INSERT INTO `sys_city_code` VALUES ('2792', '新疆维吾尔自治区', '哈密地区', '伊吾县', '\r\n652223', null);
INSERT INTO `sys_city_code` VALUES ('2793', '新疆维吾尔自治区', '昌吉回族自治州', '昌吉市', '\r\n652301', null);
INSERT INTO `sys_city_code` VALUES ('2794', '新疆维吾尔自治区', '昌吉回族自治州', '阜康市', '\r\n652302', null);
INSERT INTO `sys_city_code` VALUES ('2795', '新疆维吾尔自治区', '昌吉回族自治州', '米泉市', '\r\n652303', null);
INSERT INTO `sys_city_code` VALUES ('2796', '新疆维吾尔自治区', '昌吉回族自治州', '呼图壁县', '\r\n652323', null);
INSERT INTO `sys_city_code` VALUES ('2797', '新疆维吾尔自治区', '昌吉回族自治州', '玛纳斯县', '\r\n652324', null);
INSERT INTO `sys_city_code` VALUES ('2798', '新疆维吾尔自治区', '昌吉回族自治州', '奇台县', '\r\n652325', null);
INSERT INTO `sys_city_code` VALUES ('2799', '新疆维吾尔自治区', '昌吉回族自治州', '吉木萨尔县', '\r\n652327', null);
INSERT INTO `sys_city_code` VALUES ('2800', '新疆维吾尔自治区', '昌吉回族自治州', '木垒哈萨克自治县', '\r\n652328', null);
INSERT INTO `sys_city_code` VALUES ('2801', '新疆维吾尔自治区', '博尔塔拉蒙古自治州', '博乐市', '\r\n652701', null);
INSERT INTO `sys_city_code` VALUES ('2802', '新疆维吾尔自治区', '博尔塔拉蒙古自治州', '精河县', '\r\n652722', null);
INSERT INTO `sys_city_code` VALUES ('2803', '新疆维吾尔自治区', '博尔塔拉蒙古自治州', '温泉县', '\r\n652723', null);
INSERT INTO `sys_city_code` VALUES ('2804', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '库尔勒市', '\r\n652801', null);
INSERT INTO `sys_city_code` VALUES ('2805', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '轮台县', '\r\n652822', null);
INSERT INTO `sys_city_code` VALUES ('2806', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '尉犁县', '\r\n652823', null);
INSERT INTO `sys_city_code` VALUES ('2807', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '若羌县', '\r\n652824', null);
INSERT INTO `sys_city_code` VALUES ('2808', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '且末县', '\r\n652825', null);
INSERT INTO `sys_city_code` VALUES ('2809', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '焉耆回族自治县', '\r\n652826', null);
INSERT INTO `sys_city_code` VALUES ('2810', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '和静县', '\r\n652827', null);
INSERT INTO `sys_city_code` VALUES ('2811', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '和硕县', '\r\n652828', null);
INSERT INTO `sys_city_code` VALUES ('2812', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '博湖县', '\r\n652829', null);
INSERT INTO `sys_city_code` VALUES ('2813', '新疆维吾尔自治区', '阿克苏地区', '阿克苏市', '\r\n652901', null);
INSERT INTO `sys_city_code` VALUES ('2814', '新疆维吾尔自治区', '阿克苏地区', '温宿县', '\r\n652922', null);
INSERT INTO `sys_city_code` VALUES ('2815', '新疆维吾尔自治区', '阿克苏地区', '库车县', '\r\n652923', null);
INSERT INTO `sys_city_code` VALUES ('2816', '新疆维吾尔自治区', '阿克苏地区', '沙雅县', '\r\n652924', null);
INSERT INTO `sys_city_code` VALUES ('2817', '新疆维吾尔自治区', '阿克苏地区', '新和县', '\r\n652925', null);
INSERT INTO `sys_city_code` VALUES ('2818', '新疆维吾尔自治区', '阿克苏地区', '拜城县', '\r\n652926', null);
INSERT INTO `sys_city_code` VALUES ('2819', '新疆维吾尔自治区', '阿克苏地区', '乌什县', '\r\n652927', null);
INSERT INTO `sys_city_code` VALUES ('2820', '新疆维吾尔自治区', '阿克苏地区', '阿瓦提县', '\r\n652928', null);
INSERT INTO `sys_city_code` VALUES ('2821', '新疆维吾尔自治区', '阿克苏地区', '柯坪县', '\r\n652929', null);
INSERT INTO `sys_city_code` VALUES ('2822', '新疆维吾尔自治区', '克孜勒苏柯尔克孜自治州', '阿图什市', '\r\n653001', null);
INSERT INTO `sys_city_code` VALUES ('2823', '新疆维吾尔自治区', '克孜勒苏柯尔克孜自治州', '阿克陶县', '\r\n653022', null);
INSERT INTO `sys_city_code` VALUES ('2824', '新疆维吾尔自治区', '克孜勒苏柯尔克孜自治州', '阿合奇县', '\r\n653023', null);
INSERT INTO `sys_city_code` VALUES ('2825', '新疆维吾尔自治区', '克孜勒苏柯尔克孜自治州', '乌恰县', '\r\n653024', null);
INSERT INTO `sys_city_code` VALUES ('2826', '新疆维吾尔自治区', '喀什地区', '喀什市', '\r\n653101', null);
INSERT INTO `sys_city_code` VALUES ('2827', '新疆维吾尔自治区', '喀什地区', '疏附县', '\r\n653121', null);
INSERT INTO `sys_city_code` VALUES ('2828', '新疆维吾尔自治区', '喀什地区', '疏勒县', '\r\n653122', null);
INSERT INTO `sys_city_code` VALUES ('2829', '新疆维吾尔自治区', '喀什地区', '英吉沙县', '\r\n653123', null);
INSERT INTO `sys_city_code` VALUES ('2830', '新疆维吾尔自治区', '喀什地区', '泽普县', '\r\n653124', null);
INSERT INTO `sys_city_code` VALUES ('2831', '新疆维吾尔自治区', '喀什地区', '莎车县', '\r\n653125', null);
INSERT INTO `sys_city_code` VALUES ('2832', '新疆维吾尔自治区', '喀什地区', '叶城县', '\r\n653126', null);
INSERT INTO `sys_city_code` VALUES ('2833', '新疆维吾尔自治区', '喀什地区', '麦盖提县', '\r\n653127', null);
INSERT INTO `sys_city_code` VALUES ('2834', '新疆维吾尔自治区', '喀什地区', '岳普湖县', '\r\n653128', null);
INSERT INTO `sys_city_code` VALUES ('2835', '新疆维吾尔自治区', '喀什地区', '伽师县', '\r\n653129', null);
INSERT INTO `sys_city_code` VALUES ('2836', '新疆维吾尔自治区', '喀什地区', '巴楚县', '\r\n653130', null);
INSERT INTO `sys_city_code` VALUES ('2837', '新疆维吾尔自治区', '喀什地区', '塔什库尔干塔吉克自治县', '\r\n653131', null);
INSERT INTO `sys_city_code` VALUES ('2838', '新疆维吾尔自治区', '和田地区', '和田市', '\r\n653201', null);
INSERT INTO `sys_city_code` VALUES ('2839', '新疆维吾尔自治区', '和田地区', '和田县', '\r\n653221', null);
INSERT INTO `sys_city_code` VALUES ('2840', '新疆维吾尔自治区', '和田地区', '墨玉县', '\r\n653222', null);
INSERT INTO `sys_city_code` VALUES ('2841', '新疆维吾尔自治区', '和田地区', '皮山县', '\r\n653223', null);
INSERT INTO `sys_city_code` VALUES ('2842', '新疆维吾尔自治区', '和田地区', '洛浦县', '\r\n653224', null);
INSERT INTO `sys_city_code` VALUES ('2843', '新疆维吾尔自治区', '和田地区', '策勒县', '\r\n653225', null);
INSERT INTO `sys_city_code` VALUES ('2844', '新疆维吾尔自治区', '和田地区', '于田县', '\r\n653226', null);
INSERT INTO `sys_city_code` VALUES ('2845', '新疆维吾尔自治区', '和田地区', '民丰县', '\r\n653227', null);
INSERT INTO `sys_city_code` VALUES ('2846', '新疆维吾尔自治区', '伊犁哈萨克自治州', '伊宁市', '\r\n654002', null);
INSERT INTO `sys_city_code` VALUES ('2847', '新疆维吾尔自治区', '伊犁哈萨克自治州', '奎屯市', '\r\n654003', null);
INSERT INTO `sys_city_code` VALUES ('2848', '新疆维吾尔自治区', '伊犁哈萨克自治州', '伊宁县', '\r\n654021', null);
INSERT INTO `sys_city_code` VALUES ('2849', '新疆维吾尔自治区', '伊犁哈萨克自治州', '察布查尔锡伯自治县', '\r\n654022', null);
INSERT INTO `sys_city_code` VALUES ('2850', '新疆维吾尔自治区', '伊犁哈萨克自治州', '霍城县', '\r\n654023', null);
INSERT INTO `sys_city_code` VALUES ('2851', '新疆维吾尔自治区', '伊犁哈萨克自治州', '巩留县', '\r\n654024', null);
INSERT INTO `sys_city_code` VALUES ('2852', '新疆维吾尔自治区', '伊犁哈萨克自治州', '新源县', '\r\n654025', null);
INSERT INTO `sys_city_code` VALUES ('2853', '新疆维吾尔自治区', '伊犁哈萨克自治州', '昭苏县', '\r\n654026', null);
INSERT INTO `sys_city_code` VALUES ('2854', '新疆维吾尔自治区', '伊犁哈萨克自治州', '特克斯县', '\r\n654027', null);
INSERT INTO `sys_city_code` VALUES ('2855', '新疆维吾尔自治区', '伊犁哈萨克自治州', '尼勒克县', '\r\n654028', null);
INSERT INTO `sys_city_code` VALUES ('2856', '新疆维吾尔自治区', '塔城地区', '塔城市', '\r\n654201', null);
INSERT INTO `sys_city_code` VALUES ('2857', '新疆维吾尔自治区', '塔城地区', '乌苏市', '\r\n654202', null);
INSERT INTO `sys_city_code` VALUES ('2858', '新疆维吾尔自治区', '塔城地区', '额敏县', '\r\n654221', null);
INSERT INTO `sys_city_code` VALUES ('2859', '新疆维吾尔自治区', '塔城地区', '沙湾县', '\r\n654223', null);
INSERT INTO `sys_city_code` VALUES ('2860', '新疆维吾尔自治区', '塔城地区', '托里县', '\r\n654224', null);
INSERT INTO `sys_city_code` VALUES ('2861', '新疆维吾尔自治区', '塔城地区', '裕民县', '\r\n654225', null);
INSERT INTO `sys_city_code` VALUES ('2862', '新疆维吾尔自治区', '塔城地区', '和布克赛尔蒙古自治县', '\r\n654226', null);
INSERT INTO `sys_city_code` VALUES ('2863', '新疆维吾尔自治区', '阿勒泰地区', '阿勒泰市', '\r\n654301', null);
INSERT INTO `sys_city_code` VALUES ('2864', '新疆维吾尔自治区', '阿勒泰地区', '布尔津县', '\r\n654321', null);
INSERT INTO `sys_city_code` VALUES ('2865', '新疆维吾尔自治区', '阿勒泰地区', '富蕴县', '\r\n654322', null);
INSERT INTO `sys_city_code` VALUES ('2866', '新疆维吾尔自治区', '阿勒泰地区', '福海县', '\r\n654323', null);
INSERT INTO `sys_city_code` VALUES ('2867', '新疆维吾尔自治区', '阿勒泰地区', '哈巴河县', '\r\n654324', null);
INSERT INTO `sys_city_code` VALUES ('2868', '新疆维吾尔自治区', '阿勒泰地区', '青河县', '\r\n654325', null);
INSERT INTO `sys_city_code` VALUES ('2869', '新疆维吾尔自治区', '阿勒泰地区', '吉木乃县', '\r\n654326', null);
INSERT INTO `sys_city_code` VALUES ('2870', '新疆维吾尔自治区', '省直辖行政单位', '石河子市', '\r\n659001', null);
INSERT INTO `sys_city_code` VALUES ('2871', '新疆维吾尔自治区', '省直辖行政单位', '阿拉尔市', '\r\n659002', null);
INSERT INTO `sys_city_code` VALUES ('2872', '新疆维吾尔自治区', '省直辖行政单位', '图木舒克市', '\r\n659003', null);
INSERT INTO `sys_city_code` VALUES ('2873', '新疆维吾尔自治区', '省直辖行政单位', '五家渠市', '\r\n659004', null);
INSERT INTO `sys_city_code` VALUES ('2874', '台湾省', '台湾省', '台湾省', '\r\n710102', null);
INSERT INTO `sys_city_code` VALUES ('2875', '香港特别行政区', '香港特别行政区', '香港特别行政区', '\r\n810000', null);
INSERT INTO `sys_city_code` VALUES ('2876', '澳门特别行政区', '澳门特别行政区', '澳门特别行政区', '\r\n820000', null);

-- ----------------------------
-- Table structure for sys_dictionaries
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionaries`;
CREATE TABLE `sys_dictionaries` (
  `DICTIONARIES_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(50) DEFAULT NULL COMMENT '编码',
  `ORDER_BY` int(11) NOT NULL COMMENT '排序',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT '上级ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `TBSNAME` varchar(100) DEFAULT NULL COMMENT '排查表',
  PRIMARY KEY (`DICTIONARIES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dictionaries
-- ----------------------------
INSERT INTO `sys_dictionaries` VALUES ('00ef925d227444859eef2057693722ae', '达州', 'dazhou', '0032504', '4', 'd3538add7125404aba4b0007ef9fde50', '达州市', '');
INSERT INTO `sys_dictionaries` VALUES ('010692054ac24eeebf5b8067f0f0521a', '安庆', 'anqing', '0030401', '1', '249999f296d14f95b8138a30bbb2c374', '安庆市', '');
INSERT INTO `sys_dictionaries` VALUES ('023473e9e6204583a110531036357514', '山西', 'shanxi', '00323', '23', '1', '山西省', '');
INSERT INTO `sys_dictionaries` VALUES ('02e5eb8f50bd4824ad97427e2b372d14', '绥化', 'suihua', '0031312', '12', 'b2d4133b5dbf4599ada940620d2ab250', '绥化市', '');
INSERT INTO `sys_dictionaries` VALUES ('035fe989f54742ac8b64b80b24213442', '来宾', 'laibin', '0030809', '9', 'c5f3d426c582410281f89f1451e1d854', '来宾市', '');
INSERT INTO `sys_dictionaries` VALUES ('055273fe79f94e09a64698dab8d30ea8', '揭阳', 'jieyang', '0030708', '8', '0dd1f40bcb9d46aeba015dc19645a5b9', '揭阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('05ab2921b64d4f5c935c35228cc49ecb', '大同', 'datong', '0032302', '2', '023473e9e6204583a110531036357514', '大同市', '');
INSERT INTO `sys_dictionaries` VALUES ('05ed855479d94b139c77ae82452bb39c', '涪陵区', 'fulingqu', '0033102', '2', '1c85fbd06cf840d093f3640aca1b6b2d', '涪陵区', '');
INSERT INTO `sys_dictionaries` VALUES ('076995f7d0034b32a94e0130d406d137', '湖州', 'huzhou', '0033002', '2', '6d846178376549ed878d11d109819f25', '湖州市', '');
INSERT INTO `sys_dictionaries` VALUES ('076a163af6814f93954a543bd3b2fa4d', '广州', 'guangzhou', '0030704', '4', '0dd1f40bcb9d46aeba015dc19645a5b9', '广州市', '');
INSERT INTO `sys_dictionaries` VALUES ('085ebd2776384eff842de8b61b781a7e', '潼南区', 'tongnanqu', '0033122', '22', '1c85fbd06cf840d093f3640aca1b6b2d', '潼南区', '');
INSERT INTO `sys_dictionaries` VALUES ('0953fe05e34642169c4cf24492b163b9', '湘西', 'xiangxi', '0031514', '14', 'c59f91630bef4289b71fcb2a48994582', '湘西市', '');
INSERT INTO `sys_dictionaries` VALUES ('098bf5e3603e44889a2c4bb25e350400', '阿坝', 'a\'ba', '0032501', '1', 'd3538add7125404aba4b0007ef9fde50', '阿坝市', '');
INSERT INTO `sys_dictionaries` VALUES ('0a2561ec256b4f46b4fa76c621256595', '鹤岗', 'hegang', '0031304', '4', 'b2d4133b5dbf4599ada940620d2ab250', '鹤岗市', '');
INSERT INTO `sys_dictionaries` VALUES ('0a65f2ef68d54b7c8772e1d916684c4a', '岳阳', 'yueyang', '0031506', '6', 'c59f91630bef4289b71fcb2a48994582', '岳阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('0a754e878c304b99bf5d34a82ca3705c', '吉林', 'jilin', '0031604', '4', '857be71b0d6d4a40a2c83476824206d1', '吉林市', '');
INSERT INTO `sys_dictionaries` VALUES ('0b08e52f2b264d0da66d37e718e32aba', '常德', 'changde', '0031507', '7', 'c59f91630bef4289b71fcb2a48994582', '常德市', '');
INSERT INTO `sys_dictionaries` VALUES ('0c908137935946ac885cb56e55ff4f5d', '北碚区', 'beibeiqu', '0033109', '9', '1c85fbd06cf840d093f3640aca1b6b2d', '北碚区', '');
INSERT INTO `sys_dictionaries` VALUES ('0dba32de24014bcab807fd0fc51953aa', '北海', 'beihai', '0030802', '2', 'c5f3d426c582410281f89f1451e1d854', '北海市', '');
INSERT INTO `sys_dictionaries` VALUES ('0dd1f40bcb9d46aeba015dc19645a5b9', '广东', 'guangdong', '00307', '7', '1', '广东省', '');
INSERT INTO `sys_dictionaries` VALUES ('0e18ab3edf5e43ee8737c156b0b50692', '吉安', 'ji\'an', '0031803', '3', 'cb3008cbd6ae4b5f8cebd2254ccb8603', '吉安市', '');
INSERT INTO `sys_dictionaries` VALUES ('0eb279a28a0d43c7a075d58c6cfc3e02', '长寿区', 'changshouqu', '0033115', '15', '1c85fbd06cf840d093f3640aca1b6b2d', '长寿区', '');
INSERT INTO `sys_dictionaries` VALUES ('0efda23d751b42cb9472ca4f80cdf6c5', '德州', 'dezhou', '0030303', '3', '10f46a521ea0471f8d71ee75ac3b5f3a', '德州市', '');
INSERT INTO `sys_dictionaries` VALUES ('0f975f2f51e245439b7d759f822a4a43', '嘉定区', 'jiadingqu', '0030210', '10', 'f1ea30ddef1340609c35c88fb2919bee', '嘉定区', '');
INSERT INTO `sys_dictionaries` VALUES ('1', '地区', 'diqu', '003', '3', '0', '地区', '');
INSERT INTO `sys_dictionaries` VALUES ('10a2b2b54bce432baf603c7fa4b45de0', '淮北', 'huaibei', '0030409', '9', '249999f296d14f95b8138a30bbb2c374', '淮北市', '');
INSERT INTO `sys_dictionaries` VALUES ('10c14cd82df9496bb86c5681ddfb92fb', '本溪', 'benxi', '0031902', '2', 'b3366626c66c4b61881f09e1722e8495', '本溪市', '');
INSERT INTO `sys_dictionaries` VALUES ('10f46a521ea0471f8d71ee75ac3b5f3a', '山东', 'shandong', '00303', '3', '1', '山东省', '');
INSERT INTO `sys_dictionaries` VALUES ('10f5278b19824877988e8baa5a1b58f4', '邯郸', 'handan', '0031104', '4', '75362368f22f4d60a810c2a45cced487', '邯郸市', '');
INSERT INTO `sys_dictionaries` VALUES ('11ab8df614c14451bb08a91fbe05162e', '防城港', 'fangchenggang', '0030804', '4', 'c5f3d426c582410281f89f1451e1d854', '防城港市', '');
INSERT INTO `sys_dictionaries` VALUES ('12a62a3e5bed44bba0412b7e6b733c93', '北京', 'beijing', '00301', '1', '1', '北京', '');
INSERT INTO `sys_dictionaries` VALUES ('13b4d440cdd043378c2bbd0b797bc7b7', '黄石', 'huangshi', '0031404', '4', '312b80775e104ba08c8244a042a658df', '黄石市', '');
INSERT INTO `sys_dictionaries` VALUES ('13e9e380abed4def837bea1671b92633', '大兴安岭', 'daxinganling', '0031302', '2', 'b2d4133b5dbf4599ada940620d2ab250', '大兴安岭市', '');
INSERT INTO `sys_dictionaries` VALUES ('14452abafbef4cadbb05a5a74a61eb6f', '广安', 'guang\'an', '0032507', '7', 'd3538add7125404aba4b0007ef9fde50', '广安市', '');
INSERT INTO `sys_dictionaries` VALUES ('158588bf48464dcca0e656968b8e09c0', '密云区', 'miyunqu', '0030115', '15', '12a62a3e5bed44bba0412b7e6b733c93', '密云区', '');
INSERT INTO `sys_dictionaries` VALUES ('159d49075827476490aee58956fb159c', '潜江', 'qianjiang', '0031406', '6', '312b80775e104ba08c8244a042a658df', '潜江市', '');
INSERT INTO `sys_dictionaries` VALUES ('15da226f465b4dac95c8333fd3d81747', '淮安', 'huaian', '0031702', '2', '577405ff648240959b3765c950598ab0', '淮安市', '');
INSERT INTO `sys_dictionaries` VALUES ('16535e38a2534f4781353e7570831ea1', '丽江', 'lijiang', '0032909', '9', '510607a1836e4079b3103e14ec5864ed', '丽江', '');
INSERT INTO `sys_dictionaries` VALUES ('165fd1c02d98439d8d7cc2e81def88d6', '陇南', 'longnan', '0030609', '9', '3283f1a77180495f9a0b192d0f9cdd35', '陇南市', '');
INSERT INTO `sys_dictionaries` VALUES ('16a1eb63489e4d28827fc16a90e2ed61', '贵港', 'guigang', '0030805', '5', 'c5f3d426c582410281f89f1451e1d854', '贵港市', '');
INSERT INTO `sys_dictionaries` VALUES ('1895a514cda74329817bce6a5fe918f4', '济源', 'jiyuan', '0031203', '3', '7336944efb4b40fcae9118fc9a970d2d', '济源市', '');
INSERT INTO `sys_dictionaries` VALUES ('1929f99821f2484fa33991233c1555e9', '大理', 'dali', '0032904', '4', '510607a1836e4079b3103e14ec5864ed', '大理', '');
INSERT INTO `sys_dictionaries` VALUES ('192a36eb3d234a909e339c06b9cf723a', '许昌', 'xuchang', '0031215', '15', '7336944efb4b40fcae9118fc9a970d2d', '许昌市', '');
INSERT INTO `sys_dictionaries` VALUES ('19cf8222eac9457280ebb40f14052590', '南岸区', 'nan\'anqu', '0033108', '8', '1c85fbd06cf840d093f3640aca1b6b2d', '南岸区', '');
INSERT INTO `sys_dictionaries` VALUES ('1a99e7e302ce4f24b4b5d5d4b20a75fe', '清远', 'qingyuan', '0030711', '11', '0dd1f40bcb9d46aeba015dc19645a5b9', '清远市', '');
INSERT INTO `sys_dictionaries` VALUES ('1ac809034f3d471592a5c74e19c7f1bc', '烟台', 'yantai', '0030315', '15', '10f46a521ea0471f8d71ee75ac3b5f3a', '烟台市', '');
INSERT INTO `sys_dictionaries` VALUES ('1b65dd2a2057489c9598c789b4114d24', '孝感', 'xiaogan', '0031415', '15', '312b80775e104ba08c8244a042a658df', '孝感市', '');
INSERT INTO `sys_dictionaries` VALUES ('1b79421601744059a4ef6b0ca9be32f9', '上学期', 'shangxueqi', '0010101', '1', '5b1905ef82bf48039a96cd5dd1d8da10', '上学期', '');
INSERT INTO `sys_dictionaries` VALUES ('1b8b44f0c4384a09987ab0c5d9ceedd2', '神农架林区', 'shennongjialinqu', '0031407', '7', '312b80775e104ba08c8244a042a658df', '神农架林区', '');
INSERT INTO `sys_dictionaries` VALUES ('1c4313525bdc4d4b9f7849dfb614cfb3', '柳州', 'liuzhou', '0030810', '10', 'c5f3d426c582410281f89f1451e1d854', '柳州市', '');
INSERT INTO `sys_dictionaries` VALUES ('1c85fbd06cf840d093f3640aca1b6b2d', '重庆', 'chongqing', '00331', '31', '1', '重庆', '');
INSERT INTO `sys_dictionaries` VALUES ('1cf92384c7ee46faa91acface462b32f', '沧州', 'cangzhou', '0031102', '2', '75362368f22f4d60a810c2a45cced487', '沧州市', '');
INSERT INTO `sys_dictionaries` VALUES ('1d0deff7da2745cc960cfa9ae07bdd13', '抚顺', 'fushun', '0031906', '6', 'b3366626c66c4b61881f09e1722e8495', '抚顺市', '');
INSERT INTO `sys_dictionaries` VALUES ('1d6d2d9af05849da9807d4cba0144695', '南通', 'nantong', '0031705', '5', '577405ff648240959b3765c950598ab0', '南通市', '');
INSERT INTO `sys_dictionaries` VALUES ('1e228d052ec24bb7ba64524f51689cef', '鄂尔多斯', 'eerduosi', '0032005', '5', 'c072c248c7ab47dda7bf24f5e577925c', '鄂尔多斯市', '');
INSERT INTO `sys_dictionaries` VALUES ('1e429ce404794a30aad09bc592d0f5ce', '荆门', 'jingmen', '0031405', '5', '312b80775e104ba08c8244a042a658df', '荆门市', '');
INSERT INTO `sys_dictionaries` VALUES ('1e89ca839dbf46a3bc8c02b7d55802c5', '长沙', 'changsha', '0031501', '1', 'c59f91630bef4289b71fcb2a48994582', '长沙市', '');
INSERT INTO `sys_dictionaries` VALUES ('2087851693514e3c9c98fd843fb5b32c', '河西区', 'hexiqu', '0032603', '3', '2c254799d3454f2cbc338ef5712548e9', '河西区', '');
INSERT INTO `sys_dictionaries` VALUES ('20a08ca32856488dad122529f901fb9b', '固原', 'guyuan', '0032101', '1', '5690b0534fe745e5ba0f504f0c260559', '固原市', '');
INSERT INTO `sys_dictionaries` VALUES ('20f6d6c3b3234c21b52755ab6b690ffe', '杭州', 'hangzhou', '0033001', '1', '6d846178376549ed878d11d109819f25', '杭州市', '');
INSERT INTO `sys_dictionaries` VALUES ('212dbe5474304ad8b5f6e6049a72da46', '包头', 'baotou', '0032003', '3', 'c072c248c7ab47dda7bf24f5e577925c', '包头市', '');
INSERT INTO `sys_dictionaries` VALUES ('217c993dce9544c89279e88bdd60e7a8', '黄冈', 'huanggang', '0031403', '3', '312b80775e104ba08c8244a042a658df', '黄冈市', '');
INSERT INTO `sys_dictionaries` VALUES ('22ef24142b0a4d6e9f05582e3c8790a9', '济南', 'jinan', '0030301', '1', '10f46a521ea0471f8d71ee75ac3b5f3a', '济南市', '');
INSERT INTO `sys_dictionaries` VALUES ('2303cab27d704a259d7b0c42a687f3db', '马鞍山', 'maanshan', '0030413', '13', '249999f296d14f95b8138a30bbb2c374', '马鞍山市', '');
INSERT INTO `sys_dictionaries` VALUES ('23aff8da2e6c4513be3155f372c45046', '石嘴山', 'shizuishan', '0032103', '3', '5690b0534fe745e5ba0f504f0c260559', '石嘴山市', '');
INSERT INTO `sys_dictionaries` VALUES ('23caa037fe8c4283b7a7fc42da4a45a9', '武威', 'wuwei', '0030613', '13', '3283f1a77180495f9a0b192d0f9cdd35', '武威市', '');
INSERT INTO `sys_dictionaries` VALUES ('23f71d660bb94d239dde6738b73d3905', '延边', 'yanbian', '0031609', '9', '857be71b0d6d4a40a2c83476824206d1', '延边市', '');
INSERT INTO `sys_dictionaries` VALUES ('24007511f8ec42da8c6555305afe56ce', '青岛', 'qindao', '0030310', '10', '10f46a521ea0471f8d71ee75ac3b5f3a', '青岛市', '');
INSERT INTO `sys_dictionaries` VALUES ('2431e2f471624fd9bf0f76b7049b1296', '驻马店', 'zhumadian', '0031218', '18', '7336944efb4b40fcae9118fc9a970d2d', '驻马店市', '');
INSERT INTO `sys_dictionaries` VALUES ('244ffa16c2cd4594af2dfed2f7257d24', '德阳', 'deyang', '0032505', '5', 'd3538add7125404aba4b0007ef9fde50', '德阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('2477f3e5e2c94c73844b060d9dc82316', '深圳', 'shenzhen', '0030715', '15', '0dd1f40bcb9d46aeba015dc19645a5b9', '深圳市', '');
INSERT INTO `sys_dictionaries` VALUES ('249999f296d14f95b8138a30bbb2c374', '安徽', 'anhui', '00304', '4', '1', '安徽省', '');
INSERT INTO `sys_dictionaries` VALUES ('25892ce9cba1429fb1b45d4aaeaf3bca', '石家庄', 'shijiazhuang', '0031108', '8', '75362368f22f4d60a810c2a45cced487', '石家庄市', '');
INSERT INTO `sys_dictionaries` VALUES ('2627d3e9f98a4cdfbe0f59a4c5d3772a', '白银', 'baiyin', '0030601', '1', '3283f1a77180495f9a0b192d0f9cdd35', '白银市', '');
INSERT INTO `sys_dictionaries` VALUES ('26a79d023ad7483194241cddf97f3689', '莱芜', 'laiwu', '0030307', '7', '10f46a521ea0471f8d71ee75ac3b5f3a', '莱芜市', '');
INSERT INTO `sys_dictionaries` VALUES ('26b093ae7635474d8da8162efe7e4035', '合川区', 'hechuanqu', '0033117', '17', '1c85fbd06cf840d093f3640aca1b6b2d', '合川区', '');
INSERT INTO `sys_dictionaries` VALUES ('26d4e79797d34b11b58eb12e5c0c55ae', '抚州', 'fuzhou', '0031801', '1', 'cb3008cbd6ae4b5f8cebd2254ccb8603', '抚州市', '');
INSERT INTO `sys_dictionaries` VALUES ('273f2c545056473abaf320327073b48b', '无锡', 'wuxi', '0031709', '9', '577405ff648240959b3765c950598ab0', '无锡市', '');
INSERT INTO `sys_dictionaries` VALUES ('27927fbc83154894b096221da15b326a', '保定', 'baoding', '0031101', '1', '75362368f22f4d60a810c2a45cced487', '保定市', '');
INSERT INTO `sys_dictionaries` VALUES ('287baf1c903444359971b0ce8d58dce2', '普洱', 'pu\'er', '0032912', '12', '510607a1836e4079b3103e14ec5864ed', '普洱', '');
INSERT INTO `sys_dictionaries` VALUES ('29a4dbca082b49078af67caf5fd28f4f', '漳州', 'zhangzhou', '0030509', '9', 'd4066f6f425a4894a77f49f539f2a34f', '漳州市', '');
INSERT INTO `sys_dictionaries` VALUES ('2a4c3b9f024743d19907b36ab4a43499', '宣城', 'xuancheng', '0030417', '17', '249999f296d14f95b8138a30bbb2c374', '宣城市', '');
INSERT INTO `sys_dictionaries` VALUES ('2a4f0cb0748645bab53b94b62412df04', '黔西南', 'qianxinan', '0030907', '7', '592f6fcf45a74524aa8ea853fc9761d5', '黔西南市', '');
INSERT INTO `sys_dictionaries` VALUES ('2ae081dd5d3c47b584fdaf24769e49e1', '玉溪', 'yuxi', '0032915', '15', '510607a1836e4079b3103e14ec5864ed', '玉溪', '');
INSERT INTO `sys_dictionaries` VALUES ('2ba8e6d0fd944983aa19b781c6b53477', '海南', 'hainan', '00310', '10', '1', '海南省', '');
INSERT INTO `sys_dictionaries` VALUES ('2bd0431e3566451297ecd194287a878a', '甘孜', 'ganzi', '0032506', '6', 'd3538add7125404aba4b0007ef9fde50', '甘孜', '');
INSERT INTO `sys_dictionaries` VALUES ('2c0da3154cc74d7990c597bed6ebf2d6', '大兴区', 'daxingqu', '0030112', '12', '12a62a3e5bed44bba0412b7e6b733c93', '大兴区', '');
INSERT INTO `sys_dictionaries` VALUES ('2c254799d3454f2cbc338ef5712548e9', '天津', 'tianjin', '00326', '26', '1', '天津', '');
INSERT INTO `sys_dictionaries` VALUES ('2d0e4687904b48738ac6bd6a42e7f32d', '忻州', 'xinzhou', '0032309', '9', '023473e9e6204583a110531036357514', '忻州市', '');
INSERT INTO `sys_dictionaries` VALUES ('2d0ff92556b544c19dbfc8b8b055e19a', '常州', 'changzhou', '0031701', '1', '577405ff648240959b3765c950598ab0', '常州市', '');
INSERT INTO `sys_dictionaries` VALUES ('2e3c279cf0a44115869049e4a6d9ed08', '西宁', 'xining', '0032207', '7', '5a80e3435c0e4dc09bafceeadb38e5f0', '西宁', '');
INSERT INTO `sys_dictionaries` VALUES ('2f097a8914de4b01a04bf61852435672', '阿勒泰', 'a\'letai', '0032802', '2', '2fabed91c6d94e698ed449165cd250ca', '阿勒泰', '');
INSERT INTO `sys_dictionaries` VALUES ('2f5e433682f24e20b600532062ff0bcb', '白山', 'baishan', '0031602', '2', '857be71b0d6d4a40a2c83476824206d1', '白山市', '');
INSERT INTO `sys_dictionaries` VALUES ('2f7f68eb9be845be90e74a0763de2c7f', '平谷区', 'pingguqu', '0030114', '14', '12a62a3e5bed44bba0412b7e6b733c93', '平谷区', '');
INSERT INTO `sys_dictionaries` VALUES ('2f8e7a55eaab4649b9abe43ade744e58', '大庆', 'daqing', '0031301', '1', 'b2d4133b5dbf4599ada940620d2ab250', '大庆市', '');
INSERT INTO `sys_dictionaries` VALUES ('2fabed91c6d94e698ed449165cd250ca', '新疆', 'xinjiang', '00328', '28', '1', '新疆', '');
INSERT INTO `sys_dictionaries` VALUES ('30d424f63bf44e8391683f371ed3552f', '秦皇岛', 'qinhuangdao', '0031107', '7', '75362368f22f4d60a810c2a45cced487', '秦皇岛市', '');
INSERT INTO `sys_dictionaries` VALUES ('312b80775e104ba08c8244a042a658df', '湖北', 'hubei', '00314', '14', '1', '湖北省', '');
INSERT INTO `sys_dictionaries` VALUES ('3186f859efa246f793401c475d3d0090', '阿里', 'a\'li', '0032701', '1', '3e846b08dbbe495e93bc93f8f202de79', '阿里', '');
INSERT INTO `sys_dictionaries` VALUES ('325e45e49c1849efb7fea2296f686210', '赣州', 'ganzhou', '0031802', '2', 'cb3008cbd6ae4b5f8cebd2254ccb8603', '赣州市', '');
INSERT INTO `sys_dictionaries` VALUES ('3283f1a77180495f9a0b192d0f9cdd35', '甘肃', 'gansu', '00306', '6', '1', '甘肃省', '');
INSERT INTO `sys_dictionaries` VALUES ('329838f633f340779483910f33387ccd', '通州区', 'tongzhouqu', '0030109', '9', '12a62a3e5bed44bba0412b7e6b733c93', '通州区', '');
INSERT INTO `sys_dictionaries` VALUES ('3326f321dfe54e5292e94a9f2a518723', '乌鲁木齐', 'wulumuqi', '0032812', '12', '2fabed91c6d94e698ed449165cd250ca', '乌鲁木齐', '');
INSERT INTO `sys_dictionaries` VALUES ('33fe30734ed84994bdd46ebe69aac088', '朝阳区', 'chaoyangqu', '0030103', '3', '12a62a3e5bed44bba0412b7e6b733c93', '朝阳区', '');
INSERT INTO `sys_dictionaries` VALUES ('34bc05269e304e2e99c9ded314a12321', '石景山区', 'shijingshanqu', '0030105', '5', '12a62a3e5bed44bba0412b7e6b733c93', '石景山区', '');
INSERT INTO `sys_dictionaries` VALUES ('34d6634b8baa47a3b1c0d0346d93873b', '和平区', 'hepingqu', '0032601', '1', '2c254799d3454f2cbc338ef5712548e9', '和平区', '');
INSERT INTO `sys_dictionaries` VALUES ('3521e41344aa42aaa1cd212482992055', '漯河', 'luohe', '0031207', '7', '7336944efb4b40fcae9118fc9a970d2d', '漯河市', '');
INSERT INTO `sys_dictionaries` VALUES ('38bc876c1cab4434af9d14be194463c8', '南充', 'nanchong', '0032514', '14', 'd3538add7125404aba4b0007ef9fde50', '南充市', '');
INSERT INTO `sys_dictionaries` VALUES ('39595ea4b765445dae9c26ae870b3a0f', '克州', 'kezhou', '0032809', '9', '2fabed91c6d94e698ed449165cd250ca', '克州', '');
INSERT INTO `sys_dictionaries` VALUES ('3a3b4ea7445a4aec80083e5957028990', '汕头', 'shantou', '0030712', '12', '0dd1f40bcb9d46aeba015dc19645a5b9', '汕头市', '');
INSERT INTO `sys_dictionaries` VALUES ('3a5d1b6e800541c683724672cae3e0f6', '泰安', 'taian', '0030312', '12', '10f46a521ea0471f8d71ee75ac3b5f3a', '泰安市', '');
INSERT INTO `sys_dictionaries` VALUES ('3ad7c52e9a7044a1a9ab00f29f8cef7c', '阿克苏', 'a\'kesu', '0032801', '1', '2fabed91c6d94e698ed449165cd250ca', '阿克苏', '');
INSERT INTO `sys_dictionaries` VALUES ('3ae7c64c40c147eeb3898883e20a7fe0', '山南', 'shannan', '0032707', '7', '3e846b08dbbe495e93bc93f8f202de79', '山南', '');
INSERT INTO `sys_dictionaries` VALUES ('3d2a8f11e6d345b5af2f8e5d8bb6bb7a', '鹰潭', 'yingtan', '0031811', '11', 'cb3008cbd6ae4b5f8cebd2254ccb8603', '鹰潭市', '');
INSERT INTO `sys_dictionaries` VALUES ('3dbed4444dfc4884ab57d769ceac9507', '松江区', 'songjiangqu', '0030213', '13', 'f1ea30ddef1340609c35c88fb2919bee', '松江区', '');
INSERT INTO `sys_dictionaries` VALUES ('3e846b08dbbe495e93bc93f8f202de79', '西藏', 'xizang', '00327', '27', '1', '西藏', '');
INSERT INTO `sys_dictionaries` VALUES ('3eed1c5fb2c9420dbe6e76fdb0f9c4cb', '眉山', 'meishan', '0032511', '11', 'd3538add7125404aba4b0007ef9fde50', '眉山市', '');
INSERT INTO `sys_dictionaries` VALUES ('3ef5fb1ad8e24696a9de78b987847238', '中学', 'zhongxue', '00102', '2', 'b602b0bc378a46629cc37dc037eb9684', '中学', '');
INSERT INTO `sys_dictionaries` VALUES ('3f7c5e8ba51849549f5e5dfee72566cc', '呼伦贝尔', 'hulunbeier', '0032007', '7', 'c072c248c7ab47dda7bf24f5e577925c', '呼伦贝尔市', '');
INSERT INTO `sys_dictionaries` VALUES ('3fb6c72b11124211a22d9f8f40715737', '辽阳', 'liaoyang', '0031910', '10', 'b3366626c66c4b61881f09e1722e8495', '辽阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('3fffacbb502d4647bd358ff00412f536', '长治', 'changzhi', '0032301', '1', '023473e9e6204583a110531036357514', '长治市', '');
INSERT INTO `sys_dictionaries` VALUES ('407fa7f152f4461582cfd6904b2c454a', '晋城', 'jincheng', '0032303', '3', '023473e9e6204583a110531036357514', '晋城市', '');
INSERT INTO `sys_dictionaries` VALUES ('415fe5fbf3054a3ea2ebdbe24ce4c49f', '永川区', 'yongchuanqu', '0033118', '18', '1c85fbd06cf840d093f3640aca1b6b2d', '永川区', '');
INSERT INTO `sys_dictionaries` VALUES ('417d25314a9e43c6b7b725db160db360', '延安', 'yan\'an', '0032409', '9', '534850c72ceb4a57b7dc269da63c330a', '延安市', '');
INSERT INTO `sys_dictionaries` VALUES ('4266f08d4bc24321bba7ea3a83a8ba95', '永州', 'yongzhou', '0031511', '11', 'c59f91630bef4289b71fcb2a48994582', '永州市', '');
INSERT INTO `sys_dictionaries` VALUES ('429dc62e0f6641b8b2ddced272d5d087', '遵义', 'zunyi', '0030909', '9', '592f6fcf45a74524aa8ea853fc9761d5', '遵义市', '');
INSERT INTO `sys_dictionaries` VALUES ('432c0a1be10143beba6de15ad8811b64', '安顺', 'anshun', '0030901', '1', '592f6fcf45a74524aa8ea853fc9761d5', '安顺市', '');
INSERT INTO `sys_dictionaries` VALUES ('44fee1b9a9e141f9bdf90053f4972d2e', '北辰区', 'beichenqu', '0032610', '10', '2c254799d3454f2cbc338ef5712548e9', '北辰区', '');
INSERT INTO `sys_dictionaries` VALUES ('458411aef2d34ccd99ab5976f0f1f030', '金华', 'jinhua', '0033004', '4', '6d846178376549ed878d11d109819f25', '金华市', '');
INSERT INTO `sys_dictionaries` VALUES ('45a5be4b22ec494c99b112a7c96bca47', '钦州', 'qinzhou', '0030812', '12', 'c5f3d426c582410281f89f1451e1d854', '钦州市', '');
INSERT INTO `sys_dictionaries` VALUES ('4795a00ae89441ce82bcabdf086e8316', '宝鸡', 'baoji', '0032402', '2', '534850c72ceb4a57b7dc269da63c330a', '宝鸡市', '');
INSERT INTO `sys_dictionaries` VALUES ('480875fd43a947119e24c2302eeead53', '伊春', 'yichun', '0031313', '13', 'b2d4133b5dbf4599ada940620d2ab250', '伊春市', '');
INSERT INTO `sys_dictionaries` VALUES ('4921e0e6f9d445cdb6a4b3da98ab3555', '林芝', 'linzhi', '0032704', '4', '3e846b08dbbe495e93bc93f8f202de79', '林芝', '');
INSERT INTO `sys_dictionaries` VALUES ('4972af008f074efd91ea8312587afb42', '牡丹江', 'mudanjiang', '0031308', '8', 'b2d4133b5dbf4599ada940620d2ab250', '牡丹江市', '');
INSERT INTO `sys_dictionaries` VALUES ('49b4639e83e441c581bfdefda3a9ac27', '宜春', 'yichun', '0031810', '10', 'cb3008cbd6ae4b5f8cebd2254ccb8603', '宜春市', '');
INSERT INTO `sys_dictionaries` VALUES ('4b41fbe4cdae414a91af371e3105ebe5', '景德镇', 'jingdezhen', '0031804', '4', 'cb3008cbd6ae4b5f8cebd2254ccb8603', '景德镇市', '');
INSERT INTO `sys_dictionaries` VALUES ('4b72f022312e4664ae7863b343239ff0', '淄博', 'zibo', '0030317', '17', '10f46a521ea0471f8d71ee75ac3b5f3a', '淄博市', '');
INSERT INTO `sys_dictionaries` VALUES ('4be3e0a560a2486eae928b44110e971e', '白城', 'baicheng', '0031601', '1', '857be71b0d6d4a40a2c83476824206d1', '白城市', '');
INSERT INTO `sys_dictionaries` VALUES ('4c5dbcb293bf40f8837c0acec1ad67eb', '佳木斯', 'jiamusi', '0031307', '7', 'b2d4133b5dbf4599ada940620d2ab250', '佳木斯市', '');
INSERT INTO `sys_dictionaries` VALUES ('4cee922697a64ec78de69210e8e40af1', '昌都', 'changdu', '0032702', '2', '3e846b08dbbe495e93bc93f8f202de79', '昌都', '');
INSERT INTO `sys_dictionaries` VALUES ('50b42656af3f4068984fa042e81d7d22', '威海', 'weihai', '0030313', '13', '10f46a521ea0471f8d71ee75ac3b5f3a', '威海市', '');
INSERT INTO `sys_dictionaries` VALUES ('510607a1836e4079b3103e14ec5864ed', '云南', 'yunnan', '00329', '29', '1', '云南省', '');
INSERT INTO `sys_dictionaries` VALUES ('512a316326984ed8aa32d7f610b7604f', '玉树', 'yushu', '0032208', '8', '5a80e3435c0e4dc09bafceeadb38e5f0', '玉树', '');
INSERT INTO `sys_dictionaries` VALUES ('51f23688604848809184ec828f89cfca', '嘉兴', 'jiaxing', '0033003', '3', '6d846178376549ed878d11d109819f25', '嘉兴市', '');
INSERT INTO `sys_dictionaries` VALUES ('5259c4093aa84f7c88a367685581fbc6', '门头沟区', 'mentougouqu', '0030107', '7', '12a62a3e5bed44bba0412b7e6b733c93', '门头沟区', '');
INSERT INTO `sys_dictionaries` VALUES ('52630830669149edba48a7bb9b06e297', '中卫', 'zhongwei', '0032106', '6', '5690b0534fe745e5ba0f504f0c260559', '中卫市', '');
INSERT INTO `sys_dictionaries` VALUES ('534850c72ceb4a57b7dc269da63c330a', '陕西', 'shanxi', '00324', '24', '1', '陕西省', '');
INSERT INTO `sys_dictionaries` VALUES ('537974fdf5f54b8f99452bb8a03cf37b', '厦门', 'xiamen', '0030508', '8', 'd4066f6f425a4894a77f49f539f2a34f', '厦门市', '');
INSERT INTO `sys_dictionaries` VALUES ('53ca3f5aede8420b835b38bbc542da81', '松源', 'songyuan', '0031607', '7', '857be71b0d6d4a40a2c83476824206d1', '松源市', '');
INSERT INTO `sys_dictionaries` VALUES ('558d920174014b4cb5a0c8f518b5819b', '东城区', 'dongchengqu', '0030101', '1', '12a62a3e5bed44bba0412b7e6b733c93', '东城区', '');
INSERT INTO `sys_dictionaries` VALUES ('56103b0e83a44d07a6025061fab4cebc', '运城', 'yuncheng', '0032311', '11', '023473e9e6204583a110531036357514', '运城市', '');
INSERT INTO `sys_dictionaries` VALUES ('5690b0534fe745e5ba0f504f0c260559', '宁夏', 'ningxia', '00321', '21', '1', '宁夏', '');
INSERT INTO `sys_dictionaries` VALUES ('576fa3bd7d294f61af1315e95f70d44c', '九龙坡区', 'jiulongpoqu', '0033107', '7', '1c85fbd06cf840d093f3640aca1b6b2d', '九龙坡区', '');
INSERT INTO `sys_dictionaries` VALUES ('577405ff648240959b3765c950598ab0', '江苏', 'jiangsu', '00317', '17', '1', '江苏省', '');
INSERT INTO `sys_dictionaries` VALUES ('58ed29aefce044339ecf067f514c43cb', '宁德', 'ningde', '0030504', '4', 'd4066f6f425a4894a77f49f539f2a34f', '宁德市', '');
INSERT INTO `sys_dictionaries` VALUES ('5908fbf750a347b8a6b82af7778bb866', '商洛', 'shangluo', '0032404', '4', '534850c72ceb4a57b7dc269da63c330a', '商洛市', '');
INSERT INTO `sys_dictionaries` VALUES ('592f6fcf45a74524aa8ea853fc9761d5', '贵州', 'guizhou', '00309', '9', '1', '贵州省', '');
INSERT INTO `sys_dictionaries` VALUES ('59dbb93b007d44a6ae97744ac14e642c', '龙岩', 'longyan', '0030502', '2', 'd4066f6f425a4894a77f49f539f2a34f', '龙岩市', '');
INSERT INTO `sys_dictionaries` VALUES ('5a80e3435c0e4dc09bafceeadb38e5f0', '青海', 'qinghai', '00322', '22', '1', '青海', '');
INSERT INTO `sys_dictionaries` VALUES ('5b1905ef82bf48039a96cd5dd1d8da10', '小学', 'xiaoxue', '00101', '1', 'b602b0bc378a46629cc37dc037eb9684', '小学', '');
INSERT INTO `sys_dictionaries` VALUES ('5b5747166f714882b5cdfbeb7856f965', '周口', 'zhoukou', '0031217', '17', '7336944efb4b40fcae9118fc9a970d2d', '周口市', '');
INSERT INTO `sys_dictionaries` VALUES ('5c91965168eb4deaab99266bbb4b64e1', '朝阳', 'chaoyang', '0031903', '3', 'b3366626c66c4b61881f09e1722e8495', '朝阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('5d2d367b0aee49449e65d0dd7601ee29', '巴中', 'bazhong', '0032502', '2', 'd3538add7125404aba4b0007ef9fde50', '巴中市', '');
INSERT INTO `sys_dictionaries` VALUES ('5ddde49610d4433eb157897d01ba6838', '东莞', 'dongguan', '0030702', '2', '0dd1f40bcb9d46aeba015dc19645a5b9', '东莞市', '');
INSERT INTO `sys_dictionaries` VALUES ('5e85d09db1054472bcca22d82da6ec5d', '乐山', 'leshan', '0032509', '9', 'd3538add7125404aba4b0007ef9fde50', '乐山市', '');
INSERT INTO `sys_dictionaries` VALUES ('60c96ec0debf4cc4bf5974c93d4f638c', '阳泉', 'yangquan', '0032310', '10', '023473e9e6204583a110531036357514', '阳泉市', '');
INSERT INTO `sys_dictionaries` VALUES ('61c3711334fe44b0806e717e6fb238b0', '滨海新区', 'binhaixinqu', '0032613', '13', '2c254799d3454f2cbc338ef5712548e9', '滨海新区', '');
INSERT INTO `sys_dictionaries` VALUES ('6214f40ad2704fb6af0ded59420ca958', '安康', 'ankang', '0032401', '1', '534850c72ceb4a57b7dc269da63c330a', '安康市', '');
INSERT INTO `sys_dictionaries` VALUES ('62ed6854726c4674ae2f5b676ddec7fb', '新乡', 'xinxiang', '0031213', '13', '7336944efb4b40fcae9118fc9a970d2d', '新乡市', '');
INSERT INTO `sys_dictionaries` VALUES ('6303e3eeffb441018044b039063e3f96', '丹东', 'dandong', '0031905', '5', 'b3366626c66c4b61881f09e1722e8495', '丹东市', '');
INSERT INTO `sys_dictionaries` VALUES ('644316de71f942f9a90eb1f810eca872', '怀柔区', 'huairouqu', '0030113', '13', '12a62a3e5bed44bba0412b7e6b733c93', '怀柔区', '');
INSERT INTO `sys_dictionaries` VALUES ('64a03236dd084d09ada9a1ca22b3815f', '长春', 'changchun', '0031603', '3', '857be71b0d6d4a40a2c83476824206d1', '长春市', '');
INSERT INTO `sys_dictionaries` VALUES ('65629a05de764a19b66b752726f5cdbd', '海淀区', 'haidianqu', '0030106', '6', '12a62a3e5bed44bba0412b7e6b733c93', '海淀区', '');
INSERT INTO `sys_dictionaries` VALUES ('6567a081f5d142779e17edbda3da9a04', '宁波', 'ningbo', '0033006', '6', '6d846178376549ed878d11d109819f25', '宁波市', '');
INSERT INTO `sys_dictionaries` VALUES ('6624ad3b318149f3a8ee5beef1b8b38f', '肇庆', 'zhaoqing', '0030719', '19', '0dd1f40bcb9d46aeba015dc19645a5b9', '肇庆市', '');
INSERT INTO `sys_dictionaries` VALUES ('66d9ddeebbea43f4b52cd33964c4c429', '语文', 'yuwen', '001010101', '1', '1b79421601744059a4ef6b0ca9be32f9', '语文', '');
INSERT INTO `sys_dictionaries` VALUES ('674ec37e9641450dadc9798df10c58bc', '静安区', 'jing\'anqu', '0030204', '4', 'f1ea30ddef1340609c35c88fb2919bee', '静安区', '');
INSERT INTO `sys_dictionaries` VALUES ('67cba9a4ca4c4c38ac3ba2c21dd191e6', '南昌', 'nanchang', '0031806', '6', 'cb3008cbd6ae4b5f8cebd2254ccb8603', '南昌市', '');
INSERT INTO `sys_dictionaries` VALUES ('68a8f7a8337141d3a092fadfd2457970', '鸡西', 'jixi', '0031306', '6', 'b2d4133b5dbf4599ada940620d2ab250', '鸡西市', '');
INSERT INTO `sys_dictionaries` VALUES ('6932b6b7b5124bef8385fb8e5b5c2568', '通化', 'tonghua', '0031608', '8', '857be71b0d6d4a40a2c83476824206d1', '通化市', '');
INSERT INTO `sys_dictionaries` VALUES ('694348f8e1c0444e8e0b2c2caf4de1a6', '榆林', 'yulin', '0032410', '10', '534850c72ceb4a57b7dc269da63c330a', '榆林市', '');
INSERT INTO `sys_dictionaries` VALUES ('697141b58ada46518bc8ec0cc3d64b31', '博州', 'bozhou', '032804', '4', '2fabed91c6d94e698ed449165cd250ca', '博州', '');
INSERT INTO `sys_dictionaries` VALUES ('6a2226c73bc745faa6973dd3af3e274a', '吐鲁番', 'tulufan', '0032811', '11', '2fabed91c6d94e698ed449165cd250ca', '吐鲁番', '');
INSERT INTO `sys_dictionaries` VALUES ('6b2b1d55b06b44cd8a487d327397b69b', '徐汇区', 'xuhuiqu', '0030202', '2', 'f1ea30ddef1340609c35c88fb2919bee', '徐汇区', '');
INSERT INTO `sys_dictionaries` VALUES ('6d1e9b9c9c334448878312d589eeaeac', '荣昌区', 'rongchangqu', '0033123', '23', '1c85fbd06cf840d093f3640aca1b6b2d', '荣昌区', '');
INSERT INTO `sys_dictionaries` VALUES ('6d846178376549ed878d11d109819f25', '浙江', 'zhejiang', '00330', '30', '1', '浙江省', '');
INSERT INTO `sys_dictionaries` VALUES ('6daab50a4a1048f993f348a66dcfa83d', '喀什', 'kashi', '0032807', '7', '2fabed91c6d94e698ed449165cd250ca', '喀什', '');
INSERT INTO `sys_dictionaries` VALUES ('6dc38f66c86a4f32ac9d585e668c110e', '怒江', 'nujiang', '0032911', '11', '510607a1836e4079b3103e14ec5864ed', '怒江', '');
INSERT INTO `sys_dictionaries` VALUES ('6e1f1c6d82704e5cadcd0bc8ef2ab79f', '昆明', 'kunming', '0032908', '8', '510607a1836e4079b3103e14ec5864ed', '昆明', '');
INSERT INTO `sys_dictionaries` VALUES ('6e639147d90943c38490cafe223985ce', '梅州', 'meizhou', '0030710', '10', '0dd1f40bcb9d46aeba015dc19645a5b9', '梅州市', '');
INSERT INTO `sys_dictionaries` VALUES ('6e67518f1da44dbaa8cf95920779f188', '汕尾', 'shanwei', '0030713', '13', '0dd1f40bcb9d46aeba015dc19645a5b9', '汕尾市', '');
INSERT INTO `sys_dictionaries` VALUES ('6eaa823330da42b6b5783e389707853c', '四平', 'siping', '0031606', '6', '857be71b0d6d4a40a2c83476824206d1', '四平市', '');
INSERT INTO `sys_dictionaries` VALUES ('6ecc40e527404bba89207cc158ef3994', '河源', 'heyuan', '0030705', '5', '0dd1f40bcb9d46aeba015dc19645a5b9', '河源市', '');
INSERT INTO `sys_dictionaries` VALUES ('6ee20f02066e43a29f10ca6dbd0b7c71', '普陀区', 'putuoqu', '0030205', '5', 'f1ea30ddef1340609c35c88fb2919bee', '普陀区', '');
INSERT INTO `sys_dictionaries` VALUES ('6f5749ab2b5d4cbea1655e9a5197096d', '湛江', 'zhanjiang', '0030718', '18', '0dd1f40bcb9d46aeba015dc19645a5b9', '湛江市', '');
INSERT INTO `sys_dictionaries` VALUES ('6f8c18c8b3a54bc287c1dfc5642be577', '三明', 'sanming', '0030507', '7', 'd4066f6f425a4894a77f49f539f2a34f', '三明市', '');
INSERT INTO `sys_dictionaries` VALUES ('6f9601270aca46519e7f8836e0d2446c', '广元', 'guangyuan', '0032508', '8', 'd3538add7125404aba4b0007ef9fde50', '广元市', '');
INSERT INTO `sys_dictionaries` VALUES ('6fd083505ab24086b234c032dab3c2a7', '海口', 'haikou', '0031001', '1', '2ba8e6d0fd944983aa19b781c6b53477', '海口市', '');
INSERT INTO `sys_dictionaries` VALUES ('70733399b60d4b058c255fa9fff2eee0', '莆田', 'putian', '0030505', '5', 'd4066f6f425a4894a77f49f539f2a34f', '莆田市', '');
INSERT INTO `sys_dictionaries` VALUES ('70c1525174a04767865d0e6b7ed01f5a', '七台河', 'qitaihe', '0031309', '9', 'b2d4133b5dbf4599ada940620d2ab250', '七台河市', '');
INSERT INTO `sys_dictionaries` VALUES ('70c41ec5cb9e4aec98bd2357702c4082', '江门', 'jiangmen', '0030707', '7', '0dd1f40bcb9d46aeba015dc19645a5b9', '江门市', '');
INSERT INTO `sys_dictionaries` VALUES ('71aba068cd5b4588a03be75e2e49f496', '鄂州', 'ezhou', '0031401', '1', '312b80775e104ba08c8244a042a658df', '鄂州市', '');
INSERT INTO `sys_dictionaries` VALUES ('7336944efb4b40fcae9118fc9a970d2d', '河南', 'henan', '00312', '12', '1', '河南省', '');
INSERT INTO `sys_dictionaries` VALUES ('748623f3282b4ca7ace0e73303327310', '巴南区', 'bananqu', '0033113', '13', '1c85fbd06cf840d093f3640aca1b6b2d', '巴南区', '');
INSERT INTO `sys_dictionaries` VALUES ('74d2aaddaf294355b01970d52e303a1a', '资阳', 'ziyang', '0032519', '19', 'd3538add7125404aba4b0007ef9fde50', '资阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('75362368f22f4d60a810c2a45cced487', '河北', 'hebei', '00311', '11', '1', '河北省', '');
INSERT INTO `sys_dictionaries` VALUES ('755e2d15540c49dbad6be564f694a4af', '曲靖', 'qujing', '0032913', '13', '510607a1836e4079b3103e14ec5864ed', '曲靖', '');
INSERT INTO `sys_dictionaries` VALUES ('75b889c8e86c4d518a1fb74b089ceae8', '攀枝花', 'panzhihua', '0032515', '15', 'd3538add7125404aba4b0007ef9fde50', '攀枝花市', '');
INSERT INTO `sys_dictionaries` VALUES ('75e0334ad60b41a1b42ae6724b06c874', '镇江', 'zhenjiang', '0031713', '13', '577405ff648240959b3765c950598ab0', '镇江市', '');
INSERT INTO `sys_dictionaries` VALUES ('762bc3b1443e4ea98ab051b4007c0238', '邢台', 'xingtai', '0031110', '10', '75362368f22f4d60a810c2a45cced487', '邢台市', '');
INSERT INTO `sys_dictionaries` VALUES ('76d023f160e448c8bcb78598bf246a44', '黔南', 'qiannan', '0030906', '6', '592f6fcf45a74524aa8ea853fc9761d5', '黔南市', '');
INSERT INTO `sys_dictionaries` VALUES ('773cb4f25b9d4ebcba2953570da776c9', '吴忠', 'wuzhong', '0032104', '4', '5690b0534fe745e5ba0f504f0c260559', '吴忠市', '');
INSERT INTO `sys_dictionaries` VALUES ('776b55acb6804296a00c9f97723633ba', '舟山', 'zhoushan', '0033011', '11', '6d846178376549ed878d11d109819f25', '舟山市', '');
INSERT INTO `sys_dictionaries` VALUES ('79b98f7f0c054fa0ab2a3a2cb75d1b87', '邵阳', 'shaoyang', '0031505', '5', 'c59f91630bef4289b71fcb2a48994582', '邵阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('7a8097646dc8419284201db66dd6eda1', '芜湖', 'wuhu', '0030416', '16', '249999f296d14f95b8138a30bbb2c374', '芜湖市', '');
INSERT INTO `sys_dictionaries` VALUES ('7ab1618b70354ee2ab49e8fd5cbca27f', '哈密', 'hami', '0032806', '6', '2fabed91c6d94e698ed449165cd250ca', '哈密', '');
INSERT INTO `sys_dictionaries` VALUES ('7bed9f7f137e4048bbfd0d564283312d', '日照', 'rizhao', '0030311', '11', '10f46a521ea0471f8d71ee75ac3b5f3a', '日照市', '');
INSERT INTO `sys_dictionaries` VALUES ('7c6addc8becd4e759479228f6dd38bb2', '通辽', 'tongliao', '0032008', '8', 'c072c248c7ab47dda7bf24f5e577925c', '通辽市', '');
INSERT INTO `sys_dictionaries` VALUES ('7f69cfd9e1ae4c92b4ddf13b9f78cb6c', '保山', 'baoshan', '0032902', '2', '510607a1836e4079b3103e14ec5864ed', '保山', '');
INSERT INTO `sys_dictionaries` VALUES ('802ef5c62bbb47e3a026e3c92989f53e', '临夏', 'linxia', '0030608', '8', '3283f1a77180495f9a0b192d0f9cdd35', '临夏市', '');
INSERT INTO `sys_dictionaries` VALUES ('8114568fa8a34c6e878ff13d5ba59006', '齐齐哈尔', 'qiqihaer', '0031310', '10', 'b2d4133b5dbf4599ada940620d2ab250', '齐齐哈尔市', '');
INSERT INTO `sys_dictionaries` VALUES ('8127fbeb13a44c3284dfa8e2326ce19a', '茂名', 'maoming', '0030709', '9', '0dd1f40bcb9d46aeba015dc19645a5b9', '茂名市', '');
INSERT INTO `sys_dictionaries` VALUES ('813ff1376c0445c6a64b9f00452c2427', '成都', 'chengdu', '0032503', '3', 'd3538add7125404aba4b0007ef9fde50', '成都市', '');
INSERT INTO `sys_dictionaries` VALUES ('81443e6b687349c6ae3231aff5e038ba', '铜陵', 'tongling', '0030415', '15', '249999f296d14f95b8138a30bbb2c374', '铜陵市', '');
INSERT INTO `sys_dictionaries` VALUES ('8170c3271bc840d78e92ed355851aa5e', '西城区', 'xichengqu', '0030102', '2', '12a62a3e5bed44bba0412b7e6b733c93', '西城区', '');
INSERT INTO `sys_dictionaries` VALUES ('8346ebddc2464a9bbb99f7b0794da39c', '韶关', 'shaoguan', '0030714', '14', '0dd1f40bcb9d46aeba015dc19645a5b9', '韶关市', '');
INSERT INTO `sys_dictionaries` VALUES ('8362c89358c748a5907b44de500a1333', '泰州', 'taizhou', '0031708', '8', '577405ff648240959b3765c950598ab0', '泰州市', '');
INSERT INTO `sys_dictionaries` VALUES ('83e9fbd9e7fa4d878575088df7798b5e', '泸州', 'luzhou', '0032510', '10', 'd3538add7125404aba4b0007ef9fde50', '泸州市', '');
INSERT INTO `sys_dictionaries` VALUES ('857be71b0d6d4a40a2c83476824206d1', '吉林', 'jilin', '00316', '16', '1', '吉林省', '');
INSERT INTO `sys_dictionaries` VALUES ('85b8accc31b34d70bce548a9d42767dd', '汉中', 'hanzhong', '0032403', '3', '534850c72ceb4a57b7dc269da63c330a', '汉中市', '');
INSERT INTO `sys_dictionaries` VALUES ('85c0cb3849bc4d79b9c2fa2b63b2c858', '福州', 'fuzhou', '0030501', '1', 'd4066f6f425a4894a77f49f539f2a34f', '福州市', '');
INSERT INTO `sys_dictionaries` VALUES ('85da31513d984f3e8a179b764efb3a22', '太原', 'taiyuan', '0032308', '8', '023473e9e6204583a110531036357514', '太原市', '');
INSERT INTO `sys_dictionaries` VALUES ('863205a0ac1d4c50b19bb79f602dbea7', '张家口', 'zhangjiakou', '0031111', '11', '75362368f22f4d60a810c2a45cced487', '张家口市', '');
INSERT INTO `sys_dictionaries` VALUES ('8636d6e9bdb34510bcb528159ca4f29d', '辽源', 'liaoyuan', '0031605', '5', '857be71b0d6d4a40a2c83476824206d1', '辽源市', '');
INSERT INTO `sys_dictionaries` VALUES ('866bf0b4a8cc41dfb5071f8edb271934', '佛山', 'foshan', '0030703', '3', '0dd1f40bcb9d46aeba015dc19645a5b9', '佛山市', '');
INSERT INTO `sys_dictionaries` VALUES ('86b85d3d8ddc4632946bdc4cdf642504', '虹口区', 'hongkouqu', '0030206', '6', 'f1ea30ddef1340609c35c88fb2919bee', '虹口区', '');
INSERT INTO `sys_dictionaries` VALUES ('871c4e3b4a044b2e8235d731835db559', '酒泉', 'jiuquan', '0030606', '6', '3283f1a77180495f9a0b192d0f9cdd35', '酒泉市', '');
INSERT INTO `sys_dictionaries` VALUES ('87563959aa914187a0b5af82f862a0f0', '金昌', 'jinchang', '0030605', '5', '3283f1a77180495f9a0b192d0f9cdd35', '金昌市', '');
INSERT INTO `sys_dictionaries` VALUES ('886a63c7def64cdfad1cfc0a2de8a1e0', '崇左', 'chongzuo', '0030803', '3', 'c5f3d426c582410281f89f1451e1d854', '崇左市', '');
INSERT INTO `sys_dictionaries` VALUES ('89341f9a48444d258609e87cf40604fa', '伊犁州直', 'yilizhouzhi', '0032813', '13', '2fabed91c6d94e698ed449165cd250ca', '伊犁州直', '');
INSERT INTO `sys_dictionaries` VALUES ('89461222215e40f7b8067c7b791a9c2c', '南平', 'nanping', '0030503', '3', 'd4066f6f425a4894a77f49f539f2a34f', '南平市', '');
INSERT INTO `sys_dictionaries` VALUES ('895262136b904f4888aa5af2f89dc967', '洛阳', 'luoyang', '0031206', '6', '7336944efb4b40fcae9118fc9a970d2d', '洛阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('896bce499bd740ffb9f745a4782a7886', '青浦区', 'qingpuqu', '0030214', '14', 'f1ea30ddef1340609c35c88fb2919bee', '青浦区', '');
INSERT INTO `sys_dictionaries` VALUES ('8a7265e11f0141ba808c0410b76d415b', '临沂', 'linyi', '0030309', '9', '10f46a521ea0471f8d71ee75ac3b5f3a', '临沂市', '');
INSERT INTO `sys_dictionaries` VALUES ('8a79e7d2af7244b0b543492374ec6549', '兴安盟', 'xinganmeng', '0032012', '12', 'c072c248c7ab47dda7bf24f5e577925c', '兴安盟', '');
INSERT INTO `sys_dictionaries` VALUES ('8abbfbb071f34df4b77e2828f53ef99b', '怀化', 'huaihua', '0031512', '12', 'c59f91630bef4289b71fcb2a48994582', '怀化市', '');
INSERT INTO `sys_dictionaries` VALUES ('8af40c23c6fe4ed8819dbe99f1f125f0', '奉贤区', 'fengxianqu', '0030215', '15', 'f1ea30ddef1340609c35c88fb2919bee', '奉贤区', '');
INSERT INTO `sys_dictionaries` VALUES ('8b336fb55c2346a2b5ec13f578c627ef', '苏州', 'suzhou', '0031706', '6', '577405ff648240959b3765c950598ab0', '苏州市', '');
INSERT INTO `sys_dictionaries` VALUES ('8b5512281c364e09a67d8e81a5bd7ce9', '南川区', 'nanchuanqu', '0033119', '19', '1c85fbd06cf840d093f3640aca1b6b2d', '南川区', '');
INSERT INTO `sys_dictionaries` VALUES ('8b95528d20c44f86adf1e64009ce317b', '贵阳', 'guiyang', '0030903', '3', '592f6fcf45a74524aa8ea853fc9761d5', '贵阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('8bfd173e34704a7f978c539f87a511a8', '宝山区', 'baoshanqu', '0030209', '9', 'f1ea30ddef1340609c35c88fb2919bee', '宝山区', '');
INSERT INTO `sys_dictionaries` VALUES ('8c64bc307e894223a429a4f50a0cd387', '唐山', 'tangshan', '0031109', '9', '75362368f22f4d60a810c2a45cced487', '唐山市', '');
INSERT INTO `sys_dictionaries` VALUES ('8d10532fba444c66bead45a6d9e13b6a', '延庆区', 'yanqingqu', '0030116', '16', '12a62a3e5bed44bba0412b7e6b733c93', '延庆区', '');
INSERT INTO `sys_dictionaries` VALUES ('8e35c978f8b248cb93863818be6be56b', '大足区', 'dazuqu', '0033111', '11', '1c85fbd06cf840d093f3640aca1b6b2d', '大足区', '');
INSERT INTO `sys_dictionaries` VALUES ('8f617ff8e61c49689cb26540a618a80c', '宁河区', 'ninghequ', '0032614', '14', '2c254799d3454f2cbc338ef5712548e9', '宁河区', '');
INSERT INTO `sys_dictionaries` VALUES ('8fa97a231db54e879ece49d566f0561d', '天门', 'tianmen', '0031410', '10', '312b80775e104ba08c8244a042a658df', '天门市', '');
INSERT INTO `sys_dictionaries` VALUES ('9068c4ec7d1a4de69339fb61654cb3d9', '温州', 'wenzhou', '0033010', '10', '6d846178376549ed878d11d109819f25', '温州市', '');
INSERT INTO `sys_dictionaries` VALUES ('921a9e3d2c434cca943aca4f3e5087b5', '渝中区', 'yuzhongqu', '0033103', '3', '1c85fbd06cf840d093f3640aca1b6b2d', '渝中区', '');
INSERT INTO `sys_dictionaries` VALUES ('923ca61a8fdb4357a5220763fdbd7c37', '台州', 'taizhou', '0033009', '9', '6d846178376549ed878d11d109819f25', '台州市', '');
INSERT INTO `sys_dictionaries` VALUES ('92800c5b33df4f15a689ceda6bd23f2b', '信阳', 'xinyang', '0031214', '14', '7336944efb4b40fcae9118fc9a970d2d', '信阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('9381ab9da4b64001b289252ee21d1157', '河东区', 'hedongqu', '0032602', '2', '2c254799d3454f2cbc338ef5712548e9', '河东区', '');
INSERT INTO `sys_dictionaries` VALUES ('95a7fd77484f4ef39e9ed4596556a93c', '海西', 'haixi', '0032205', '5', '5a80e3435c0e4dc09bafceeadb38e5f0', '海西', '');
INSERT INTO `sys_dictionaries` VALUES ('9795de38301642539aefda61adf595a4', '江津区', 'jiangjinqu', '0033116', '16', '1c85fbd06cf840d093f3640aca1b6b2d', '江津区', '');
INSERT INTO `sys_dictionaries` VALUES ('97c543ee46e84586998554f5f745fcc6', '杨浦区', 'yangpuqu', '0030207', '7', 'f1ea30ddef1340609c35c88fb2919bee', '杨浦区', '');
INSERT INTO `sys_dictionaries` VALUES ('983eaae633244ecea99d11a804b1c736', '万州区', 'wanzhouqu', '0033101', '1', '1c85fbd06cf840d093f3640aca1b6b2d', '万州区', '');
INSERT INTO `sys_dictionaries` VALUES ('9a7465597dda46c8bb4c5c98aabfb4b9', '阳江', 'yangjiang', '0030716', '16', '0dd1f40bcb9d46aeba015dc19645a5b9', '阳江市', '');
INSERT INTO `sys_dictionaries` VALUES ('9b483ad27bc14af2a47d8facdf8fafca', '嘉峪关', 'jiayuguan', '0030604', '4', '3283f1a77180495f9a0b192d0f9cdd35', '嘉峪关市', '');
INSERT INTO `sys_dictionaries` VALUES ('9bb5220b50dd4def87ffbf6444a28c58', '黄浦区', 'huangpuqu', '0030201', '1', 'f1ea30ddef1340609c35c88fb2919bee', '黄浦区', '');
INSERT INTO `sys_dictionaries` VALUES ('9c8a7d5f3423458eb9e6ef68f6185fca', '黄山', 'huangshan', '0030411', '11', '249999f296d14f95b8138a30bbb2c374', '黄山市', '');
INSERT INTO `sys_dictionaries` VALUES ('9d9700b28ae347bca4db9f592c78eb02', '百色', 'baise', '0030801', '1', 'c5f3d426c582410281f89f1451e1d854', '百色市', '');
INSERT INTO `sys_dictionaries` VALUES ('9e4d7c5d9d86458d8c8d8a644e7eec9a', '阿拉善盟', 'alashanmeng', '0032001', '1', 'c072c248c7ab47dda7bf24f5e577925c', '阿拉善盟', '');
INSERT INTO `sys_dictionaries` VALUES ('9e833df814a74d1690f8039782ddf914', '昭通', 'zhaotong', '0032916', '16', '510607a1836e4079b3103e14ec5864ed', '昭通', '');
INSERT INTO `sys_dictionaries` VALUES ('9e9d0ad23c9e45df9dd9c269c0e4fdfa', '昌平区', 'changpingqu', '0030111', '11', '12a62a3e5bed44bba0412b7e6b733c93', '昌平区', '');
INSERT INTO `sys_dictionaries` VALUES ('9fc24347a7ca4a34bdea408dad223348', '闵行区', 'minhangqu', '0030208', '8', 'f1ea30ddef1340609c35c88fb2919bee', '闵行区', '');
INSERT INTO `sys_dictionaries` VALUES ('a013e3db1b384beb843959c33f361203', '静海区', 'jinghaiqu', '0032615', '15', '2c254799d3454f2cbc338ef5712548e9', '静海区', '');
INSERT INTO `sys_dictionaries` VALUES ('a0d5b55e48c945faad1d7bb624de7de8', '九江', 'jiujiang', '0031805', '5', 'cb3008cbd6ae4b5f8cebd2254ccb8603', '九江市', '');
INSERT INTO `sys_dictionaries` VALUES ('a165da9b81b940fe9764fc7f5d41232d', '银川', 'yinchuan', '0032105', '5', '5690b0534fe745e5ba0f504f0c260559', '银川市', '');
INSERT INTO `sys_dictionaries` VALUES ('a268c4b698274f12a64ba48db568d057', '潮州', 'chaozhou', '0030701', '1', '0dd1f40bcb9d46aeba015dc19645a5b9', '潮州市', '');
INSERT INTO `sys_dictionaries` VALUES ('a34815cb348d4598a6fac4ece3baa0cd', '衡阳', 'hengyang', '0031504', '4', 'c59f91630bef4289b71fcb2a48994582', '衡阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('a39af97e7ad04ebfb530f49b05c7b146', '阜阳', 'fuyang', '0030407', '7', '249999f296d14f95b8138a30bbb2c374', '阜阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('a405680276e645188a122e8933f77a38', '乌兰察布', 'wulanchabu', '0032010', '10', 'c072c248c7ab47dda7bf24f5e577925c', '乌兰察布市', '');
INSERT INTO `sys_dictionaries` VALUES ('a46bb0749dac4627b9a7d465dc75aca5', '武汉', 'wuhan', '0031411', '11', '312b80775e104ba08c8244a042a658df', '武汉市', '');
INSERT INTO `sys_dictionaries` VALUES ('a4d4d8f678dd4dba958f466bbc581c5f', '菏泽', 'heze', '0030305', '5', '10f46a521ea0471f8d71ee75ac3b5f3a', '菏泽市', '');
INSERT INTO `sys_dictionaries` VALUES ('a6898561d8664f6dad7a32f63ab64e19', '铁岭', 'tieling', '0031913', '13', 'b3366626c66c4b61881f09e1722e8495', '铁岭市', '');
INSERT INTO `sys_dictionaries` VALUES ('a76ed518fb584442aaf1769fd2583677', '兰州', 'lanzhou', '0030607', '7', '3283f1a77180495f9a0b192d0f9cdd35', '兰州市', '');
INSERT INTO `sys_dictionaries` VALUES ('a7d500ab05844c45b839f4a30c1d7643', '宜昌', 'yichang', '0031416', '16', '312b80775e104ba08c8244a042a658df', '宜昌市', '');
INSERT INTO `sys_dictionaries` VALUES ('a9093795a013403e869a4308f17c7588', '海东', 'haidong', '0032203', '3', '5a80e3435c0e4dc09bafceeadb38e5f0', '海东', '');
INSERT INTO `sys_dictionaries` VALUES ('aa4b703a13dc4116bea578295efd9ea0', '赤峰', 'chifeng', '0032004', '4', 'c072c248c7ab47dda7bf24f5e577925c', '赤峰市', '');
INSERT INTO `sys_dictionaries` VALUES ('aab8d56a03de4bbc84d433bc24748730', '贺州', 'hezhou', '0030808', '8', 'c5f3d426c582410281f89f1451e1d854', '贺州市', '');
INSERT INTO `sys_dictionaries` VALUES ('ab8f76725d8541bc9195a69260c33641', '停车位状态', 'parkingstate', '004', '4', '0', '停车位的状态，查看停车位状态', '');
INSERT INTO `sys_dictionaries` VALUES ('ac1aa3c1b928467ebfa261cfaeb77be9', '葫芦岛', 'huludao', '0031908', '8', 'b3366626c66c4b61881f09e1722e8495', '葫芦岛市', '');
INSERT INTO `sys_dictionaries` VALUES ('ac23d537ccd64827ab44007c5503bd58', '安阳', 'anyang', '0031201', '1', '7336944efb4b40fcae9118fc9a970d2d', '安阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('acd9f9b8fb8a4e47bd1e5d4eea45809c', '滁州', 'chuzhou', '0030406', '6', '249999f296d14f95b8138a30bbb2c374', '滁州市', '');
INSERT INTO `sys_dictionaries` VALUES ('acf5c250d6614fb9920e442a3b178b86', '东营', 'dongying', '0030304', '4', '10f46a521ea0471f8d71ee75ac3b5f3a', '东营市', '');
INSERT INTO `sys_dictionaries` VALUES ('adfac2a66ce04767bdbabbd8c115cd5d', '黄南', 'huangnan', '0032206', '6', '5a80e3435c0e4dc09bafceeadb38e5f0', '黄南', '');
INSERT INTO `sys_dictionaries` VALUES ('ae2c4a00360442f29ce8b0c284525ded', '崇明县', 'chongmingxian', '0030216', '16', 'f1ea30ddef1340609c35c88fb2919bee', '崇明县', '');
INSERT INTO `sys_dictionaries` VALUES ('ae384d9313e448949c8ed9c565e5cade', '扬州', 'yangzhou', '0031712', '12', '577405ff648240959b3765c950598ab0', '扬州市', '');
INSERT INTO `sys_dictionaries` VALUES ('affc6a796b524efdb006bd1730003df7', '西青区', 'xiqingqu', '0032608', '8', '2c254799d3454f2cbc338ef5712548e9', '西青区', '');
INSERT INTO `sys_dictionaries` VALUES ('b0251d85679b40dca30ee83af80838bb', '拉萨', 'lasa', '0032703', '3', '3e846b08dbbe495e93bc93f8f202de79', '拉萨市', '');
INSERT INTO `sys_dictionaries` VALUES ('b041a523ae214f03969454aa8c180ced', '房山区', 'fangshanqu', '0030108', '8', '12a62a3e5bed44bba0412b7e6b733c93', '房山区', '');
INSERT INTO `sys_dictionaries` VALUES ('b08ccea3cf89458e97b346546221e4ae', '凉山', 'liangshan', '0032102', '2', '5690b0534fe745e5ba0f504f0c260559', '凉山市', '');
INSERT INTO `sys_dictionaries` VALUES ('b1d50a7eb21f44389733e17831fd121d', '盘锦', 'panjin', '0031911', '11', 'b3366626c66c4b61881f09e1722e8495', '盘锦市', '');
INSERT INTO `sys_dictionaries` VALUES ('b21a81793ca6459f97c246ccbd543c67', '张掖', 'zhangye', '0030614', '14', '3283f1a77180495f9a0b192d0f9cdd35', '张掖市', '');
INSERT INTO `sys_dictionaries` VALUES ('b2356bf7a1d546709ac296de1bf2a9eb', '连云港', 'lianyungang', '0031703', '3', '577405ff648240959b3765c950598ab0', '连云港市', '');
INSERT INTO `sys_dictionaries` VALUES ('b2409f9c928f4dd1bd224809f54a1225', '宝坻区', 'baodiqu', '0032612', '12', '2c254799d3454f2cbc338ef5712548e9', '宝坻区', '');
INSERT INTO `sys_dictionaries` VALUES ('b2d4133b5dbf4599ada940620d2ab250', '黑龙江', 'heilongjiang', '00313', '13', '1', '黑龙江省', '');
INSERT INTO `sys_dictionaries` VALUES ('b3221428d30249d8acbb40f0f38d7a5c', '南宁', 'nanning', '0030811', '11', 'c5f3d426c582410281f89f1451e1d854', '南宁市', '');
INSERT INTO `sys_dictionaries` VALUES ('b3366626c66c4b61881f09e1722e8495', '辽宁', 'liaoning', '00319', '19', '1', '辽宁省', '');
INSERT INTO `sys_dictionaries` VALUES ('b38f0725533a47cea5d0f5f520ad72c7', '沙坪坝区', 'shapingbaqu', '0033106', '6', '1c85fbd06cf840d093f3640aca1b6b2d', '沙坪坝区', '');
INSERT INTO `sys_dictionaries` VALUES ('b4736703fc064dbe8b8440c79991a1ed', '大连', 'dalian', '0031904', '4', 'b3366626c66c4b61881f09e1722e8495', '大连市', '');
INSERT INTO `sys_dictionaries` VALUES ('b5329030086d470fa8cf6b38aaafb320', '随州', 'suizhou', '0031409', '9', '312b80775e104ba08c8244a042a658df', '随州市', '');
INSERT INTO `sys_dictionaries` VALUES ('b602b0bc378a46629cc37dc037eb9684', '课程', 'kecheng', '001', '1', '0', '课程', '');
INSERT INTO `sys_dictionaries` VALUES ('b68e669c229945ae86e053d15c277a6a', '惠州', 'huizhou', '0030706', '6', '0dd1f40bcb9d46aeba015dc19645a5b9', '惠州市', '');
INSERT INTO `sys_dictionaries` VALUES ('b7785f96730e4a35820e08da1c200c4d', '璧山区', 'bishanqu', '0033120', '20', '1c85fbd06cf840d093f3640aca1b6b2d', '璧山区', '');
INSERT INTO `sys_dictionaries` VALUES ('b84acd830f3b4c65bd82c97cc925badf', '自贡', 'zigong', '0032520', '20', 'd3538add7125404aba4b0007ef9fde50', '自贡市', '');
INSERT INTO `sys_dictionaries` VALUES ('b8e203af46924284a9a8be9851a557a2', '南开区', 'nankaiqu', '0032604', '4', '2c254799d3454f2cbc338ef5712548e9', '南开区', '');
INSERT INTO `sys_dictionaries` VALUES ('b908e46ac1544cb6a26f1e1fb22f2a94', '宜宾', 'yibin', '0032518', '18', 'd3538add7125404aba4b0007ef9fde50', '宜宾市', '');
INSERT INTO `sys_dictionaries` VALUES ('b9c02b885a4a49719b1000110ed47df4', '毕节', 'bijie', '0030902', '2', '592f6fcf45a74524aa8ea853fc9761d5', '毕节市', '');
INSERT INTO `sys_dictionaries` VALUES ('b9c8e39d06c24e0c92c0be41a5c6d1e1', '红色', 'red', '00201', '1', 'ce174640544549f1b31c8f66e01c111b', '红色', '');
INSERT INTO `sys_dictionaries` VALUES ('ba821dcfd50d4f64af1cd3eecc5f54e0', '海北', 'haibei', '0032202', '2', '5a80e3435c0e4dc09bafceeadb38e5f0', '海北', '');
INSERT INTO `sys_dictionaries` VALUES ('bbf9ff3b0fa444f18d70f2a4a9e45609', '绵阳', 'mianyang', '0032512', '12', 'd3538add7125404aba4b0007ef9fde50', '绵阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('bc2ec49f78204ea29cd666e2dc6583a2', '临沧', 'lincang', '0032910', '10', '510607a1836e4079b3103e14ec5864ed', '临沧', '');
INSERT INTO `sys_dictionaries` VALUES ('bc97087ea25547a794cec553d03c1abc', '那曲', 'naqu', '0032705', '5', '3e846b08dbbe495e93bc93f8f202de79', '那曲', '');
INSERT INTO `sys_dictionaries` VALUES ('bd1efd2194724213b72efa91fe3d5ddc', '浦东新区', 'pudongxinqu', '0030211', '11', 'f1ea30ddef1340609c35c88fb2919bee', '浦东新区', '');
INSERT INTO `sys_dictionaries` VALUES ('bdb65b22a7c447dcadbc6328292e5aef', '中山', 'zhongshan', '0030720', '20', '0dd1f40bcb9d46aeba015dc19645a5b9', '中山市', '');
INSERT INTO `sys_dictionaries` VALUES ('bdce443b39ba4cef8c0c0b75bdc8e253', '沈阳', 'shenyang', '0031912', '12', 'b3366626c66c4b61881f09e1722e8495', '沈阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('be33f1cad2954520bbf033e4198890f7', '亳州', 'bozhou', '0030403', '3', '249999f296d14f95b8138a30bbb2c374', '亳州市', '');
INSERT INTO `sys_dictionaries` VALUES ('be359cbd02944e1da5997ae560831db1', '定西', 'dingxi', '0030602', '2', '3283f1a77180495f9a0b192d0f9cdd35', '定西市', '');
INSERT INTO `sys_dictionaries` VALUES ('beaf0090ebf94ad9af5dd78e372611fe', '咸阳', 'xianyang', '0032408', '8', '534850c72ceb4a57b7dc269da63c330a', '咸阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('bff8ba692e4c4d78a23309ec0ad745c7', '桂林', 'guilin', '0030806', '6', 'c5f3d426c582410281f89f1451e1d854', '桂林市', '');
INSERT INTO `sys_dictionaries` VALUES ('c0170db89f2e48fe99bfdcd857fe2016', '承德', 'chengde', '0031103', '3', '75362368f22f4d60a810c2a45cced487', '承德市', '');
INSERT INTO `sys_dictionaries` VALUES ('c072c248c7ab47dda7bf24f5e577925c', '内蒙古', 'neimenggu', '00320', '20', '1', '内蒙古', '');
INSERT INTO `sys_dictionaries` VALUES ('c0e55c6a60564359859d87d25c249ac4', '锦州', 'jinzhou', '0031909', '9', 'b3366626c66c4b61881f09e1722e8495', '锦州市', '');
INSERT INTO `sys_dictionaries` VALUES ('c1875ba50f6d4e61870be000be8ee78e', '东丽区', 'dongliqu', '0032607', '7', '2c254799d3454f2cbc338ef5712548e9', '东丽区', '');
INSERT INTO `sys_dictionaries` VALUES ('c22083b403ba4ea698ba4dfc7245a317', '平凉', 'pingliang', '0030610', '10', '3283f1a77180495f9a0b192d0f9cdd35', '平凉市', '');
INSERT INTO `sys_dictionaries` VALUES ('c256624d6caa49979ebc4dce35006945', '武清区', 'wuqingqu', '0032611', '11', '2c254799d3454f2cbc338ef5712548e9', '武清区', '');
INSERT INTO `sys_dictionaries` VALUES ('c2e0fca8943d41ba8ec5d013e9bc3f41', '日喀则', 'rikaze', '0032706', '6', '3e846b08dbbe495e93bc93f8f202de79', '日喀则', '');
INSERT INTO `sys_dictionaries` VALUES ('c3717fb4891148a0bef623dbd746e7e6', '开封', 'kaifeng', '0031205', '5', '7336944efb4b40fcae9118fc9a970d2d', '开封市', '');
INSERT INTO `sys_dictionaries` VALUES ('c4817fc49be444e491920112aa9a3e32', '淮南', 'huainan', '0030410', '10', '249999f296d14f95b8138a30bbb2c374', '淮南市', '');
INSERT INTO `sys_dictionaries` VALUES ('c59f91630bef4289b71fcb2a48994582', '湖南', 'hunan', '00315', '15', '1', '湖南省', '');
INSERT INTO `sys_dictionaries` VALUES ('c5f3d426c582410281f89f1451e1d854', '广西', 'guangxi', '00308', '8', '1', '广西省', '');
INSERT INTO `sys_dictionaries` VALUES ('c7852784049a473c917863c5bc84dd95', '甘南', 'gannan', '0030603', '3', '3283f1a77180495f9a0b192d0f9cdd35', '甘南市', '');
INSERT INTO `sys_dictionaries` VALUES ('c7a5ba87961742f3b242ee4d30a55921', '营口', 'yingkou', '0031914', '14', 'b3366626c66c4b61881f09e1722e8495', '营口市', '');
INSERT INTO `sys_dictionaries` VALUES ('c8342c1dcf584cbf92f20d90a62a34bf', '平顶山', 'pingdingshan', '0031209', '9', '7336944efb4b40fcae9118fc9a970d2d', '平顶山市', '');
INSERT INTO `sys_dictionaries` VALUES ('c8d4119e57f84e71815769f03935e471', '黔东南', 'qiandongnan', '0030905', '5', '592f6fcf45a74524aa8ea853fc9761d5', '黔东南市', '');
INSERT INTO `sys_dictionaries` VALUES ('c928e9192e2f4f5ca06c6599371ff83c', '六安', 'lu\'an', '0030412', '12', '249999f296d14f95b8138a30bbb2c374', '六安市', '');
INSERT INTO `sys_dictionaries` VALUES ('c9811aef284b4ae8b8bf7698e90d8b3b', '泉州', 'quanzhou', '0030506', '6', 'd4066f6f425a4894a77f49f539f2a34f', '泉州市', '');
INSERT INTO `sys_dictionaries` VALUES ('c9df1fd73d0642eea8b050738f6ed9fa', '聊城', 'liaocheng', '0030308', '8', '10f46a521ea0471f8d71ee75ac3b5f3a', '聊城市', '');
INSERT INTO `sys_dictionaries` VALUES ('ca2e3717bb734c4b9142f29e36a31989', '株洲', 'zhuzhou', '0031502', '2', 'c59f91630bef4289b71fcb2a48994582', '株洲市', '');
INSERT INTO `sys_dictionaries` VALUES ('cabe896dba3a4a21ba194f8839a3eb98', '大渡口区', 'dadukouqu', '0033104', '4', '1c85fbd06cf840d093f3640aca1b6b2d', '大渡口区', '');
INSERT INTO `sys_dictionaries` VALUES ('caeba09845bf4a29960a840d4f436f09', '上饶', 'shangrao', '0031808', '8', 'cb3008cbd6ae4b5f8cebd2254ccb8603', '上饶市', '');
INSERT INTO `sys_dictionaries` VALUES ('cb3008cbd6ae4b5f8cebd2254ccb8603', '江西', 'jiangxi', '00318', '18', '1', '江西省', '');
INSERT INTO `sys_dictionaries` VALUES ('cc2aaa3ed3904d66a2f79676b14a1b49', '黔江区', 'qianjiangqu', '0033114', '14', '1c85fbd06cf840d093f3640aca1b6b2d', '黔江区', '');
INSERT INTO `sys_dictionaries` VALUES ('cd66a360619847d2b17989643f03dc8f', '济宁', 'jining', '0030306', '6', '10f46a521ea0471f8d71ee75ac3b5f3a', '济宁市', '');
INSERT INTO `sys_dictionaries` VALUES ('cd87ffcb742744d18bbce6928922a5be', '衡州', 'hengzhou', '0033007', '7', '6d846178376549ed878d11d109819f25', '衡州市', '');
INSERT INTO `sys_dictionaries` VALUES ('cdc1df5961994a9d94751003edd0fc58', '宿州', 'suzhou', '0030414', '14', '249999f296d14f95b8138a30bbb2c374', '宿州市', '');
INSERT INTO `sys_dictionaries` VALUES ('cddd155314404710bd1ab3fa51d80cf2', '天水', 'tianshui', '0030612', '12', '3283f1a77180495f9a0b192d0f9cdd35', '天水市', '');
INSERT INTO `sys_dictionaries` VALUES ('ce0dcc5a66dd44b3b9a42aef4aa8b4ba', '蚌埠', 'bengbu', '0030402', '2', '249999f296d14f95b8138a30bbb2c374', '蚌埠市', '');
INSERT INTO `sys_dictionaries` VALUES ('ce174640544549f1b31c8f66e01c111b', '颜色', 'yanse', '002', '2', '0', '颜色', '');
INSERT INTO `sys_dictionaries` VALUES ('cf632a4f4de54b619ad5cb6835f35434', '玉林', 'yulin', '0030814', '14', 'c5f3d426c582410281f89f1451e1d854', '玉林市', '');
INSERT INTO `sys_dictionaries` VALUES ('cf7d29feb2c34cbfaf4e28896ca577e4', '巴彦淖尔', 'bayannaoer', '0032002', '2', 'c072c248c7ab47dda7bf24f5e577925c', '巴彦淖尔', '');
INSERT INTO `sys_dictionaries` VALUES ('cfb2df83812d4fabb10ba91e98be9467', '黑河', 'heihe', '0031305', '5', 'b2d4133b5dbf4599ada940620d2ab250', '黑河市', '');
INSERT INTO `sys_dictionaries` VALUES ('cfee5c9833664e0aba76267389e4adbd', '丰台区', 'fengtaiqu', '0030104', '4', '12a62a3e5bed44bba0412b7e6b733c93', '丰台区', '');
INSERT INTO `sys_dictionaries` VALUES ('d13b01a607e34fdfa16deb7292a0f299', '鹤壁', 'hebi', '0031202', '2', '7336944efb4b40fcae9118fc9a970d2d', '鹤壁市', '');
INSERT INTO `sys_dictionaries` VALUES ('d1646344b9cc45018c3a347f6dc6c77b', '红桥区', 'hongqiaoqu', '0032606', '6', '2c254799d3454f2cbc338ef5712548e9', '红桥区', '');
INSERT INTO `sys_dictionaries` VALUES ('d26fc248d49c4a71b2a003033adc88de', '娄底', 'loudi', '0031513', '13', 'c59f91630bef4289b71fcb2a48994582', '娄底市', '');
INSERT INTO `sys_dictionaries` VALUES ('d3538add7125404aba4b0007ef9fde50', '四川', 'sichuan', '00325', '25', '1', '四川省', '');
INSERT INTO `sys_dictionaries` VALUES ('d3c2d3b9184b4e3185ca6bdbe73c5cff', '襄樊', 'xiangfan', '0031414', '14', '312b80775e104ba08c8244a042a658df', '襄樊市', '');
INSERT INTO `sys_dictionaries` VALUES ('d3c76818757942fba8ebf8246fa257a9', '咸宁', 'xianning', '0031413', '13', '312b80775e104ba08c8244a042a658df', '咸宁市', '');
INSERT INTO `sys_dictionaries` VALUES ('d4066f6f425a4894a77f49f539f2a34f', '福建', 'fujian', '00305', '5', '1', '福建省', '');
INSERT INTO `sys_dictionaries` VALUES ('d4131ecb91d3435db1dbd770ac39221f', '鞍山', 'anshan', '0031901', '1', 'b3366626c66c4b61881f09e1722e8495', '鞍山市', '');
INSERT INTO `sys_dictionaries` VALUES ('d42e09432d10454caecf1d4335aca1da', '合肥', 'hefei', '0030408', '8', '249999f296d14f95b8138a30bbb2c374', '合肥市', '');
INSERT INTO `sys_dictionaries` VALUES ('d4f8ba23c3ef4fbaa00c8f8a7c047bf1', '商丘', 'shangqiu', '0031212', '12', '7336944efb4b40fcae9118fc9a970d2d', '商丘市', '');
INSERT INTO `sys_dictionaries` VALUES ('d5f5462779bc4976a3fbcbdeba45ed00', '丽水', 'lishui', '0033005', '5', '6d846178376549ed878d11d109819f25', '丽水市', '');
INSERT INTO `sys_dictionaries` VALUES ('d5f621c6fab44d1eab1bdafd9d08e042', '绍兴', 'shaoxing', '0033008', '8', '6d846178376549ed878d11d109819f25', '绍兴市', '');
INSERT INTO `sys_dictionaries` VALUES ('d7443dcd45704a27981810fc32b93390', '潍坊', 'weifang', '0030314', '14', '10f46a521ea0471f8d71ee75ac3b5f3a', '潍坊市', '');
INSERT INTO `sys_dictionaries` VALUES ('d7c388a2ed58414a9bd4dfbedf6858b3', '顺义区', 'shunyiqu', '0030110', '10', '12a62a3e5bed44bba0412b7e6b733c93', '顺义区', '');
INSERT INTO `sys_dictionaries` VALUES ('d7e006b55b96491282e9c2e672d35a34', '克拉玛依', 'kelamayi', '0032808', '8', '2fabed91c6d94e698ed449165cd250ca', '克拉玛依', '');
INSERT INTO `sys_dictionaries` VALUES ('d7e25a4040694008b4cb8aa322f77ad9', '张家界', 'zhangjiajie', '0031508', '8', 'c59f91630bef4289b71fcb2a48994582', '张家界市', '');
INSERT INTO `sys_dictionaries` VALUES ('d80455402bc44d2ca15e905913301fb2', '焦作', 'jiaozuo', '0031204', '4', '7336944efb4b40fcae9118fc9a970d2d', '焦作市', '');
INSERT INTO `sys_dictionaries` VALUES ('d90a14bfbfe44a3e8d60bda8f8f362a6', '铜仁', 'tongren', '0030908', '8', '592f6fcf45a74524aa8ea853fc9761d5', '铜仁市', '');
INSERT INTO `sys_dictionaries` VALUES ('da583c36f6754d498176755c93db8d7c', '遂宁', 'suining', '0032516', '16', 'd3538add7125404aba4b0007ef9fde50', '遂宁市', '');
INSERT INTO `sys_dictionaries` VALUES ('db3b9c7116bc49e3a65fa641dd82155d', '红河', 'honghe', '0032907', '7', '510607a1836e4079b3103e14ec5864ed', '红河', '');
INSERT INTO `sys_dictionaries` VALUES ('db6336fcf27f4c00b37513ff0e368ae6', '长宁区', 'changningqu', '0030203', '3', 'f1ea30ddef1340609c35c88fb2919bee', '长宁区', '');
INSERT INTO `sys_dictionaries` VALUES ('db77fd88654c4014a71d541171d2795b', '西安', 'xi\'an', '0032407', '7', '534850c72ceb4a57b7dc269da63c330a', '西安市', '');
INSERT INTO `sys_dictionaries` VALUES ('dc022922169446549dfac0de221d2a4d', '雅安', 'ya\'an', '0032517', '17', 'd3538add7125404aba4b0007ef9fde50', '雅安市', '');
INSERT INTO `sys_dictionaries` VALUES ('dc9b2098188f4b5c93aec5c9bbfb895d', '吕梁', 'lvliang', '0032306', '6', '023473e9e6204583a110531036357514', '吕梁市', '');
INSERT INTO `sys_dictionaries` VALUES ('dcbcde16e75643f9b8dd4b6293c87dd5', '滨州', 'binzhou', '0030302', '2', '10f46a521ea0471f8d71ee75ac3b5f3a', '滨州市', '');
INSERT INTO `sys_dictionaries` VALUES ('dcd0ca1cde8f420dbfecbac4cf1506ee', '巴州', 'bazhou', '0032803', '3', '2fabed91c6d94e698ed449165cd250ca', '巴州', '');
INSERT INTO `sys_dictionaries` VALUES ('dcd445ef42c9484bbd14bacd02bebf37', '郑州', 'zhengzhou', '0031216', '16', '7336944efb4b40fcae9118fc9a970d2d', '郑州市', '');
INSERT INTO `sys_dictionaries` VALUES ('dcf99d941ca44b30915e16a4048d5004', '益阳', 'yiyang', '0031509', '9', 'c59f91630bef4289b71fcb2a48994582', '益阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('dee1fa3295ec42219815769d00fabe70', '迪庆', 'diqing', '0032906', '6', '510607a1836e4079b3103e14ec5864ed', '迪庆', '');
INSERT INTO `sys_dictionaries` VALUES ('e06c4a42478b4853827911b8adac6def', '庆阳', 'qingyang', '0030611', '11', '3283f1a77180495f9a0b192d0f9cdd35', '庆阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('e1204d4286834046886f26ae6af0722a', '湘潭', 'xiangtan', '0031503', '3', 'c59f91630bef4289b71fcb2a48994582', '湘潭市', '');
INSERT INTO `sys_dictionaries` VALUES ('e15cb9bb072248628b7ec481b6337229', '六盘水', 'liupanshui', '0030904', '4', '592f6fcf45a74524aa8ea853fc9761d5', '六盘水市', '');
INSERT INTO `sys_dictionaries` VALUES ('e1bbd9b635e140ee8fcf0dc06743519b', '廊坊', 'langfang', '0031106', '6', '75362368f22f4d60a810c2a45cced487', '廊坊市', '');
INSERT INTO `sys_dictionaries` VALUES ('e384a07d11bf413eb83cd490939ca7a2', '綦江区', 'qijiangqu', '0033110', '10', '1c85fbd06cf840d093f3640aca1b6b2d', '綦江区', '');
INSERT INTO `sys_dictionaries` VALUES ('e3ca4d54f3354ba5b17e1f93415ceb1a', '云浮', 'yunfu', '0030717', '17', '0dd1f40bcb9d46aeba015dc19645a5b9', '云浮市', '');
INSERT INTO `sys_dictionaries` VALUES ('e4adf72e96ee4b7fa3528ee5ba4eb5cf', '梧州', 'wuzhou', '0030813', '13', 'c5f3d426c582410281f89f1451e1d854', '梧州市', '');
INSERT INTO `sys_dictionaries` VALUES ('e556d8e5e148406883e1a83d6595e406', '铜梁区', 'tongliangqu', '0033121', '21', '1c85fbd06cf840d093f3640aca1b6b2d', '铜梁区', '');
INSERT INTO `sys_dictionaries` VALUES ('e7200f8c6dce4ea193bf33f55d9fd192', '池州', 'chizhou', '0030405', '5', '249999f296d14f95b8138a30bbb2c374', '池州市', '');
INSERT INTO `sys_dictionaries` VALUES ('e7de6c7b752040b2bd3175641d83d128', '哈尔滨', 'haerbin', '0031303', '3', 'b2d4133b5dbf4599ada940620d2ab250', '哈尔滨市', '');
INSERT INTO `sys_dictionaries` VALUES ('e8311a6f0ab4495484fdf24902ee97cc', '新余', 'xinyu', '0031809', '9', 'cb3008cbd6ae4b5f8cebd2254ccb8603', '新余市', '');
INSERT INTO `sys_dictionaries` VALUES ('e9a653c9850c46bc9e2e1916de643a52', '楚雄', 'chuxiong', '0032903', '3', '510607a1836e4079b3103e14ec5864ed', '楚雄', '');
INSERT INTO `sys_dictionaries` VALUES ('ec0eed6293294d58aa56f6c381263288', '郴州', 'chenzhou', '0031510', '10', 'c59f91630bef4289b71fcb2a48994582', '郴州市', '');
INSERT INTO `sys_dictionaries` VALUES ('ec107e60189346adb2b5749d6f6fe074', '德宏', 'dehong', '0032905', '5', '510607a1836e4079b3103e14ec5864ed', '德宏', '');
INSERT INTO `sys_dictionaries` VALUES ('ec892838cf4944cc8b330216f02de1e6', '津南区', 'jinnanqu', '0032609', '9', '2c254799d3454f2cbc338ef5712548e9', '津南区', '');
INSERT INTO `sys_dictionaries` VALUES ('ec96c3771161459c99eb01124db7aa8a', '三门峡', 'sanmenxia', '0031211', '11', '7336944efb4b40fcae9118fc9a970d2d', '三门峡市', '');
INSERT INTO `sys_dictionaries` VALUES ('eca8a2f4e2534f77b7bccf263139d8c7', '内江', 'neijiang', '0032513', '13', 'd3538add7125404aba4b0007ef9fde50', '内江市', '');
INSERT INTO `sys_dictionaries` VALUES ('ecb8f08c1408495bb31842c221d3edb4', '渝北区', 'yubeiqu', '0033112', '12', '1c85fbd06cf840d093f3640aca1b6b2d', '渝北区', '');
INSERT INTO `sys_dictionaries` VALUES ('ed5391a7608b4a61a24d95f2384f2131', '阜新', 'fuxin', '0031907', '7', 'b3366626c66c4b61881f09e1722e8495', '阜新市', '');
INSERT INTO `sys_dictionaries` VALUES ('ed5b3d39695f496d88c37f56508d6447', '仙桃', 'xiantao', '0031412', '12', '312b80775e104ba08c8244a042a658df', '仙桃市', '');
INSERT INTO `sys_dictionaries` VALUES ('ed97335f8b3d42fabfd89993bc68475d', '海南', 'hainan', '0032204', '4', '5a80e3435c0e4dc09bafceeadb38e5f0', '海南', '');
INSERT INTO `sys_dictionaries` VALUES ('ede65c49ae624ef8900414298f79a438', '乌海', 'wuhai', '0032009', '9', 'c072c248c7ab47dda7bf24f5e577925c', '乌海市', '');
INSERT INTO `sys_dictionaries` VALUES ('f0570e2fe4644e32af5c5401e8c371ba', '盐城', 'yancheng', '0031711', '11', '577405ff648240959b3765c950598ab0', '盐城市', '');
INSERT INTO `sys_dictionaries` VALUES ('f0eb076930844fe18fdd8dcf5fc1f56e', '塔城', 'tacheng', '0032810', '10', '2fabed91c6d94e698ed449165cd250ca', '塔城', '');
INSERT INTO `sys_dictionaries` VALUES ('f16ddc177870477685297a6abb157637', '朔州', 'shuozhou', '0032307', '7', '023473e9e6204583a110531036357514', '朔州市', '');
INSERT INTO `sys_dictionaries` VALUES ('f1e2cdd9518c4ac2b5e1ea52985b9771', '果洛', 'guoluo', '0032201', '1', '5a80e3435c0e4dc09bafceeadb38e5f0', '果洛', '');
INSERT INTO `sys_dictionaries` VALUES ('f1ea30ddef1340609c35c88fb2919bee', '上海', 'shanghai', '00302', '2', '1', '上海', '');
INSERT INTO `sys_dictionaries` VALUES ('f260eee573dc48fca1572b228d280849', '版纳', 'banna', '0032901', '1', '510607a1836e4079b3103e14ec5864ed', '版纳', '');
INSERT INTO `sys_dictionaries` VALUES ('f389ad0eb7884c4d91d4f31312bc8771', '萍乡', 'pingxiang', '0031807', '7', 'cb3008cbd6ae4b5f8cebd2254ccb8603', '萍乡市', '');
INSERT INTO `sys_dictionaries` VALUES ('f416737f56924f7cb642a75f57b1530a', '渭南', 'weinan', '0032406', '6', '534850c72ceb4a57b7dc269da63c330a', '渭南市', '');
INSERT INTO `sys_dictionaries` VALUES ('f498d09200ba48df9d6e281776eba4f8', '徐州', 'xuzhou', '0031710', '10', '577405ff648240959b3765c950598ab0', '徐州市', '');
INSERT INTO `sys_dictionaries` VALUES ('f4bdd6b8f0704479a6d051f52d62d693', '河池', 'hechi', '0030807', '7', 'c5f3d426c582410281f89f1451e1d854', '河池市', '');
INSERT INTO `sys_dictionaries` VALUES ('f4f2434769b842afbbf1791018b69800', '河北区', 'hebeiqu', '0032605', '5', '2c254799d3454f2cbc338ef5712548e9', '河北区', '');
INSERT INTO `sys_dictionaries` VALUES ('f57d2b8d983f43d5a035a596b690445b', '金山区', 'jinshanqu', '0030212', '12', 'f1ea30ddef1340609c35c88fb2919bee', '金山区', '');
INSERT INTO `sys_dictionaries` VALUES ('f6337bdeefa44b0db9f35fe2fe7d6d6f', '十堰', 'shiyan', '0031408', '8', '312b80775e104ba08c8244a042a658df', '十堰市', '');
INSERT INTO `sys_dictionaries` VALUES ('f661c388a73d478699a2c1c5909b45f1', '三亚', 'sanya', '0031002', '2', '2ba8e6d0fd944983aa19b781c6b53477', '三亚市', '');
INSERT INTO `sys_dictionaries` VALUES ('f6ff36eb35414a5dacf7ccc0c479d2ea', '宿迁', 'suqian', '0031707', '7', '577405ff648240959b3765c950598ab0', '宿迁市', '');
INSERT INTO `sys_dictionaries` VALUES ('f775a440cb004c63b0b3d3429b58a1e6', '衡水', 'hengshui', '0031105', '5', '75362368f22f4d60a810c2a45cced487', '衡水市', '');
INSERT INTO `sys_dictionaries` VALUES ('f845a1c0a62b45bfbf358688eec3680d', '巢湖', 'chaohu', '0030404', '4', '249999f296d14f95b8138a30bbb2c374', '巢湖市', '');
INSERT INTO `sys_dictionaries` VALUES ('f9565fe7c0a348ba949131645d20e8fa', '恩施', 'enshi', '0031402', '2', '312b80775e104ba08c8244a042a658df', '恩施市', '');
INSERT INTO `sys_dictionaries` VALUES ('f970bd1da8f94bfa92206fa94d595cbb', '锡林郭勒盟', 'xilinguolemeng', '0032011', '11', 'c072c248c7ab47dda7bf24f5e577925c', '锡林郭勒盟', '');
INSERT INTO `sys_dictionaries` VALUES ('f9a9156f0e9e41438e823f93070248bd', '濮阳', 'puyang', '0031210', '10', '7336944efb4b40fcae9118fc9a970d2d', '濮阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('f9ceff59e02c4be3a4b20aa806c1ec0d', '呼和浩特', 'huhehaote', '0032006', '6', 'c072c248c7ab47dda7bf24f5e577925c', '呼和浩特市', '');
INSERT INTO `sys_dictionaries` VALUES ('fa2ff170919e406d9d5547ff09d14d0d', '双鸭山', 'shuangyashan', '0031311', '11', 'b2d4133b5dbf4599ada940620d2ab250', '双鸭山市', '');
INSERT INTO `sys_dictionaries` VALUES ('fa3446ef035546c09c1f27268b43b937', '南京', 'nanjing', '0031704', '4', '577405ff648240959b3765c950598ab0', '南京市', '');
INSERT INTO `sys_dictionaries` VALUES ('fc70429d9b8146e0ac31ce38410e2cb7', '南阳', 'nanyang', '0031208', '8', '7336944efb4b40fcae9118fc9a970d2d', '南阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('fd06b72a41654fcfbfe2c3327ca4e9fc', '珠海', 'zhuhai', '0030721', '21', '0dd1f40bcb9d46aeba015dc19645a5b9', '珠海市', '');
INSERT INTO `sys_dictionaries` VALUES ('fd1d83119c414e56b3a35052c9d6dd0f', '文山', 'wenshan', '0032914', '14', '510607a1836e4079b3103e14ec5864ed', '文山', '');
INSERT INTO `sys_dictionaries` VALUES ('fd2a0cad70c643528587d1ccde4c5530', '铜川', 'tongchuan', '0032405', '5', '534850c72ceb4a57b7dc269da63c330a', '铜川市', '');
INSERT INTO `sys_dictionaries` VALUES ('fd79801a69ad4ec5857df82358c26368', '江北区', 'jiangbeiqu', '0033105', '5', '1c85fbd06cf840d093f3640aca1b6b2d', '江北区', '');
INSERT INTO `sys_dictionaries` VALUES ('ff880943e156482ea50d1ece4ff233a6', '昌吉州', 'changjizhou', '0032805', '5', '2fabed91c6d94e698ed449165cd250ca', '昌吉州', '');
INSERT INTO `sys_dictionaries` VALUES ('ffb2cc1e96fe485b94335589315ab38c', '临汾', 'linfen', '0032305', '5', '023473e9e6204583a110531036357514', '临汾市', '');
INSERT INTO `sys_dictionaries` VALUES ('ffd838f71da648319bfe4f176e0e209f', '晋中', 'jinzhong', '0032304', '4', '023473e9e6204583a110531036357514', '晋中市', '');
INSERT INTO `sys_dictionaries` VALUES ('ffeaa196501d4f35a486e42be17f2986', '枣庄', 'zaozhuang', '0030316', '16', '10f46a521ea0471f8d71ee75ac3b5f3a', '枣庄市', '');

-- ----------------------------
-- Table structure for sys_fhbutton
-- ----------------------------
DROP TABLE IF EXISTS `sys_fhbutton`;
CREATE TABLE `sys_fhbutton` (
  `FHBUTTON_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `QX_NAME` varchar(50) DEFAULT NULL COMMENT '权限标识',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FHBUTTON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_fhbutton
-- ----------------------------
INSERT INTO `sys_fhbutton` VALUES ('3542adfbda73410c976e185ffe50ad06', '导出EXCEL', 'toExcel', '导出EXCEL');
INSERT INTO `sys_fhbutton` VALUES ('46992ea280ba4b72b29dedb0d4bc0106', '发邮件', 'email', '发送电子邮件');
INSERT INTO `sys_fhbutton` VALUES ('4c7f34b9eed54683957f356afcda24df', '组织机构数据权限', 'Datajur', '组织机构数据权限按钮');
INSERT INTO `sys_fhbutton` VALUES ('4efa162fce8340f0bd2dcd3b11d327ec', '导入EXCEL', 'FromExcel', '导入EXCEL到系统用户');
INSERT INTO `sys_fhbutton` VALUES ('cc51b694d5344d28a9aa13c84b7166cd', '发短信', 'sms', '发送短信');
INSERT INTO `sys_fhbutton` VALUES ('da7fd386de0b49ce809984f5919022b8', '站内信', 'FHSMS', '发送站内信');
INSERT INTO `sys_fhbutton` VALUES ('fc5e8767b4564f34a0d2ce2375fcc92e', '绑定用户', 'userBinding', '绑定用户');

-- ----------------------------
-- Table structure for sys_fhlog
-- ----------------------------
DROP TABLE IF EXISTS `sys_fhlog`;
CREATE TABLE `sys_fhlog` (
  `FHLOG_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '用户名',
  `CZTIME` varchar(32) DEFAULT NULL COMMENT '操作时间',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '事件',
  PRIMARY KEY (`FHLOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_fhlog
-- ----------------------------
INSERT INTO `sys_fhlog` VALUES ('0006fe2d7b3b4622963f03f4d7e1e3b6', 'admin', '2017-05-02 12:53:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0073d8147338427aa656af1af52bed0d', 'admin', '2017-05-03 08:34:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('00860cfb67d04709951df378d835cd5c', 'admin', '2017-05-02 10:57:17', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('008e4fd933c34f90adea64ed36d98745', 'admin', '2017-04-27 13:14:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('00fa9e6896c9405ea4fd8b3f282940df', 'admin', '2017-04-28 11:37:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('014f1b91850743838798a9f1a54971c1', 'admin', '2017-05-02 13:43:27', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('02ef63d4e45641558f400c2478565aae', 'admin', '2017-05-02 13:43:27', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('02f4c93f9d6045cfa3071a88be139520', 'admin', '2017-04-25 14:21:08', '退出');
INSERT INTO `sys_fhlog` VALUES ('03951cb88f2f4fca86bd9a178802150f', 'admin', '2017-02-05 12:06:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('03f9f5e0a5ba4d29b603930775047ce6', 'admin', '2017-02-13 02:14:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('040a7c11c53b41bbb3310cb4bd6594b5', 'admin', '2017-05-02 12:03:54', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('043c943927ab4149b8089128d25200f7', 'admin', '2017-05-02 13:45:38', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('0497136827b84ffca2fb9f0fb5634c26', 'admin', '2017-04-25 14:02:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('04bba736ba9f448f9b4e27fbd5524365', 'admin', '2017-05-04 13:02:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('04ce339f6bbd4f058bc9bafd1e675e9d', 'admin', '2017-03-16 01:04:04', '退出');
INSERT INTO `sys_fhlog` VALUES ('05788e66c39a4b0294c9384fa0ad6b5f', 'admin', '2017-05-02 13:45:40', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('05db6cce7d524a8aa72f9bc6da92fda8', 'admin', '2017-03-16 01:03:30', '退出');
INSERT INTO `sys_fhlog` VALUES ('06076e1b89e44670944ed30077b0a29a', 'admin', '2017-05-03 09:38:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('06847250057843e69b10c009e5d471bf', 'admin', '2017-05-02 12:11:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('06c9dac771c941fba5962ea9e8d3c9ce', 'admin', '2017-05-02 13:44:12', '修改菜单硬件管理');
INSERT INTO `sys_fhlog` VALUES ('0964df5ce11a4957ab20106e78c302eb', 'admin', '2017-05-02 12:03:54', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0a2f0a04ab294ed4adacdbc64f8867fa', 'admin', '2017-05-02 10:57:15', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('0a37aeeea51c46279933905863111013', 'admin', '2017-05-05 08:40:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0a576c2b3f9941b6bb870d67b29a297e', 'admin', '2017-05-02 12:03:53', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0bb9f15e5eac45f089b4d13ddcb847bd', 'admin', '2017-05-02 12:51:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0d3b53f116324e1fb474c7e38f3a8635', 'admin', '2017-04-25 10:21:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0d84d4ebeb134561a09671c89aa91ccb', 'admin', '2017-05-02 12:09:46', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0e5507235af94276a765c7937ef9794c', 'admin', '2017-05-04 10:56:13', '退出');
INSERT INTO `sys_fhlog` VALUES ('0eeafd690f8f4019b15fea5b312128a3', 'san', '2017-04-26 10:54:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0ef373cfc8614a509ed6839733bc1855', 'admin', '2017-04-27 13:14:57', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0f8d3046a4cb4be1beb66a2f8190e782', 'admin', '2017-04-27 13:14:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0f9b32a05f4c4db9b5eab6e3422a88cc', 'admin', '2017-04-25 16:05:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0fbc4fe2a73a4082afec05328fbf363a', 'admin', '2016-12-05 14:40:53', '退出');
INSERT INTO `sys_fhlog` VALUES ('0fc10c267b4e4e899c78eb49279f75e6', 'admin', '2017-05-02 12:09:47', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0fcf61d61c9940c38fc75b2adaf0c663', 'admin', '2017-06-09 13:32:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1009cf4ee3b74d8295db88919e17cee9', 'admin', '2017-05-03 09:57:26', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('1063574ddcbb4863aad56774f604d306', 'admin', '2017-05-02 13:46:36', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('11107031a3914ae18fa194a6d5678ea8', 'admin', '2017-03-16 01:03:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1174b093295c4fd9ab4675c57cc045a6', 'admin', '2017-05-02 12:09:47', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('11a03b4d790044eb9eb2b19fcf85d20d', 'admin', '2017-04-25 10:10:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('120830937bab4283ac751afbdc5c27f9', 'admin', '2017-05-05 08:50:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('120d561c2dd14f95a73b4527bb5f75cc', 'admin', '2017-05-02 13:44:30', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('1261856d234e406eb63f8978852a50fd', 'san', '2016-06-06 03:09:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('12ea2a78e0c847e483c80ceae7578561', 'admin', '2017-04-27 16:31:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('12fd1a1fa1594af092e198018eb261e4', 'admin', '2017-05-02 12:09:46', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('13cf59e6bf454b29a2d49d3f0a1bbb16', 'admin', '2017-04-28 15:25:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('143491b61fde440b889df1645f43821d', 'admin', '2017-05-05 09:22:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('147c638b3d474b058ce95a667c537b6d', 'admin', '2017-05-02 13:43:26', '新增菜单硬件管理');
INSERT INTO `sys_fhlog` VALUES ('14b5999a6b864b869a0433722c6e0a61', 'admin', '2016-11-02 01:12:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('14f7a312ee0047d9adf6e91b67dd33e2', 'admin', '2017-05-03 08:39:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('152e1f1c32a0416fa8f8cb7368ac2b6f', 'admin', '2017-03-29 01:22:48', '退出');
INSERT INTO `sys_fhlog` VALUES ('154ef0a5b037467f92e9d79c224591a4', 'admin', '2017-05-02 14:04:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1655fb2fcf794677bdf0a52b5dd23fdd', 'admin', '2017-03-30 00:23:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1666745a7aff4aacb15302dff6310742', 'admin', '2017-05-02 13:47:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1735ae2094b94bd692bad1ba493bb357', 'longmao', '2017-04-27 13:10:01', '修改角色菜单权限，角色ID为:3');
INSERT INTO `sys_fhlog` VALUES ('17a5d8264599444c98cc0616489d94fa', 'admin', '2017-05-02 13:44:13', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('17cc75ce5db6404fa0a35e68b6d4cd42', 'admin', '2017-04-27 13:15:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('17e192060d704dfc89584573c7287b54', 'admin', '2017-05-02 11:00:53', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('180f3e4cb8a2406cb26d6f2a9f255557', 'admin', '2017-05-02 12:34:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('18494b93bdc045a6baf40b6cf8128969', 'admin', '2017-05-02 11:00:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('18743c88b16a46f9bf84b89b4aff1d36', 'admin', '2017-05-02 13:55:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('19841fc3142e4499ad2a0c86afbf2878', 'admin', '2017-05-02 13:46:35', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('19bd5c136de44e4192132eba607d98cc', 'admin', '2017-04-26 11:43:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1a0b91b839c740dc8d0ccd04dd7b6387', 'admin', '2017-04-27 16:10:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1a18d44c39a14aef810496ac58fe3e8c', 'admin', '2017-04-27 15:13:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1a362938abb047a4bb004f78e7a89d07', 'admin', '2017-05-02 10:55:13', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('1cf8c97a122341fa86c1c8065b9d31d6', 'admin', '2017-05-02 13:43:28', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('1d547864abc440188d4af037999a10dc', 'admin', '2017-05-02 13:45:39', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('1def3575cde04f538c7ce98fc040e510', 'admin', '2017-04-26 16:14:44', '退出');
INSERT INTO `sys_fhlog` VALUES ('1f18307e2469418280357fe7a903e1d9', 'admin', '2017-05-02 13:44:31', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('1f1c1b75866d453a8afa1069f844b54b', 'admin', '2017-05-02 10:57:17', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('1f48dd27c8b74bcab943260c632339d4', 'admin', '2017-05-04 14:49:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1f4be773d0b54b28a9958d191bfb0cd5', 'admin', '2017-05-02 12:09:45', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('2009aa79e6aa41149a1fe8556cd5ef4a', 'admin', '2017-04-27 13:15:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('2059a66601bd4836afc0134412bcbec0', 'admin', '2017-04-25 11:55:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2115873f9c7a45468afa16d8fa0180ea', 'admin', '2017-06-10 11:21:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('214ce312958a496bb869884201814dfa', 'admin', '2017-04-27 13:14:57', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('21cf8025b1e44eea82fa446a8c7b33c8', 'admin', '2017-04-27 13:14:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('226b0f040946413baf9b558d20f75d3a', 'admin', '2017-04-27 13:15:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('228a202582db420fbb89664607f55676', 'admin', '2017-04-26 09:04:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('237bd5e1b648446bbfe4065a018308ca', 'admin', '2017-05-02 12:53:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('23af38b939de42729e256d926784efe8', 'longmao', '2017-04-27 13:09:52', '修改角色菜单权限，角色ID为:3');
INSERT INTO `sys_fhlog` VALUES ('23eb8347ca344ec992b3a84965e02acd', 'san', '2017-04-25 12:43:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2443a04dedfb4b4b98c19843a0221180', 'admin', '2017-05-02 10:55:13', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('2514f8f1f8e84f5884b590bfcdeb4f5f', 'admin', '2017-05-02 13:43:28', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('253938b2dd994d24a4fa36b4d450fedd', 'admin', '2017-03-29 01:35:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('253b9a9a90784dd3ab9128f922c96741', 'admin', '2017-05-02 13:44:30', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('26ae3777125049be8e3957b286b16b38', 'admin', '2017-04-27 13:51:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('26c3baeb77ea4fa59d0e508f0eb2cf6a', 'admin', '2017-05-02 10:57:15', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('2707565f39fa4b92bb3b06f414d5b6b5', 'admin', '2017-05-02 10:55:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('2764d127ed0342c88768a5f09bab83fa', 'admin', '2017-05-03 10:55:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('276f7fc4faf34e998edc36b1825f36ff', 'admin', '2017-05-02 10:57:16', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('27e03529c2de4cc394ecb696d32262e3', 'admin', '2017-05-02 13:45:38', '新增菜单Ap中继器管理');
INSERT INTO `sys_fhlog` VALUES ('27ea5410340a40c78696de9f1d8172ba', 'admin', '2017-04-27 13:14:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('2821c6ef0ba74711885a8673d99a70a6', 'admin', '2016-12-05 14:04:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('29f097e9522f46fbb014feedf3318a56', 'admin', '2017-03-14 23:44:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2a6c2db119664f749f026716acd10cca', 'admin', '2017-05-02 13:44:13', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('2b36bcec71d844d093b51f5bbe51b4e2', 'admin', '2017-04-27 13:14:56', '修改菜单停车场记录');
INSERT INTO `sys_fhlog` VALUES ('2b5a9e8608a24651976e184d9e214d2d', 'admin', '2017-04-25 10:46:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2b82a93a6e2a4721b7441400a6f4e0b0', 'admin', '2017-04-27 13:14:57', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('2bc8dc70d7d347c481bd35b18f71f97f', 'longmao', '2017-04-27 13:09:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2bd499b54bb0482ca8b434f70043aecd', 'admin', '2017-05-02 10:41:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2c3158f81af34d629ce5bcff02b8d828', 'admin', '2017-06-09 08:56:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2c73209ac0f04def93ea23917347746f', 'admin', '2017-05-02 13:46:35', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('2cbd8b2110b94b04af908300fb02c367', 'admin', '2017-04-27 13:14:57', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('2d4f8ec85c2944449f9dfa602e6f776d', 'admin', '2017-05-02 13:45:40', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('2dc3543bf33d40d7809796d7f26bd660', 'admin', '2017-05-02 10:57:16', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('2ddd88ea7ba64b799086af7e2c8c84c2', 'admin', '2017-05-02 10:55:13', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('2e001977b4ee469c8a6795e2cefc9030', 'admin', '2017-05-02 10:55:13', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('2f5564d1468b471ebddb4394af572bb5', 'admin', '2017-05-02 13:46:36', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('2f951406ef0e41a89491c3fb4dfd52c6', 'admin', '2017-04-27 13:14:56', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('30ac1abb5173448183099947c28e1173', 'admin', '2017-04-26 16:19:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('311ffb6d24c74509a250b7e7ad8934c3', 'admin', '2017-04-26 13:16:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3171ccc5bc8048519ff625ec70e445ae', 'san', '2017-04-26 10:49:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('336b01a20bb34d89818ea4c65cdc2e90', 'admin', '2017-05-02 13:45:39', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('33ca04457bb64fdcb300bca4c0b8da4b', 'admin', '2017-03-29 01:22:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('340e0b744f734cec8abf99e6abfc2357', 'admin', '2017-04-25 16:07:01', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('34fad8190a614c6c8952ba828c733647', 'admin', '2017-01-20 10:42:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('35e78ee5acb74f21a4c9402e82a33056', 'admin', '2017-05-02 10:58:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('35f4518c81f245e8b8348ec6a8abd3b4', 'admin', '2017-05-03 08:35:59', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3685a57dcafa4dcc927087fed7745914', 'admin', '2017-05-04 15:20:01', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3758a6ccb7d4442bbd9889760a22ccef', 'admin', '2017-04-25 09:48:19', '修改系统用户：san');
INSERT INTO `sys_fhlog` VALUES ('3763757ec9a24aa997a1485ada5b6dc7', 'admin', '2017-05-02 11:00:53', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('37a18cc07b2e4e47a57651fd0eaf4ed8', 'admin', '2017-05-02 14:49:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3850f761faa841c2b07ec59a90c2a17d', 'admin', '2017-05-28 09:27:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('386479416e1949fea178a88c565a2e74', 'admin', '2017-05-02 10:55:12', '修改菜单传感器信息');
INSERT INTO `sys_fhlog` VALUES ('398746ed7a374a8993232d203c1a1e48', 'admin', '2017-05-02 10:57:16', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('3a9685fb21a749759180b20c290d1750', 'admin', '2017-04-25 12:48:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3bd6a26d45bc45a3883522475f851de7', 'admin', '2017-05-02 13:44:30', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3c116cb085bc49b1ace012b2ebaf2a5d', 'admin', '2017-04-27 13:14:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3c1c3eb22d294e599102f986796f6464', 'admin', '2017-05-02 10:55:13', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3c1cdf1e45994b20aa6634220700e0fc', 'admin', '2017-05-02 12:03:55', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3d05ffe701224ecf80b16c6dccf82b2e', 'admin', '2017-04-27 13:14:51', '修改菜单数据库管理');
INSERT INTO `sys_fhlog` VALUES ('3da6f686557f4e7688e035b20c265ae5', 'admin', '2017-02-13 00:31:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3dd0c4ff34624de0ad2494de61fe5a30', 'admin', '2017-05-02 12:09:47', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3df4894bbf5742668a2c25c0cb6519f0', 'admin', '2017-03-16 01:03:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3e81635e28c243499321ca62b3cf25a9', 'admin', '2017-04-27 13:14:57', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('401e82122a114ba09fb3fc64411183e4', 'admin', '2017-05-02 10:44:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4068760befbc441eb94565c0e91337b8', 'admin', '2017-05-03 10:43:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('41732eb1ab814ba8bf8fcb0f3d4f7bc6', 'admin', '2017-05-02 10:55:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('41be5a9220c1422f86bbffab7170e008', 'admin', '2017-03-29 03:14:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('42c48ac8ce45475d8307821509d1e240', 'admin', '2017-05-04 16:20:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4306c9b5d40649f8962c3bf9f322a78d', 'admin', '2017-05-02 14:09:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('43383378d75549f99b424761188c99da', 'admin', '2017-05-02 12:14:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4350b52374a74c58b49153eaf5ca0cb2', 'admin', '2017-03-16 01:02:09', '退出');
INSERT INTO `sys_fhlog` VALUES ('438bb1ef7dc7404896b587869bc167ba', 'admin', '2017-05-02 11:00:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('43fd6853a51f4150b190dbf6cd1f4e26', 'admin', '2017-05-02 12:32:06', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('444dc44b9a35414eb6e9388493967a77', 'admin', '2017-06-09 09:41:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('44afafdef7aa43ff8e455cf96455966a', 'admin', '2017-05-02 13:43:26', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('44b37b814dab433a8590db599e72f830', 'admin', '2017-06-12 10:43:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('45155e935efa49e8a070e593e2962c90', 'admin', '2017-06-09 10:03:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4578bdf3d55648d7979eae39c7dff8d9', 'admin', '2017-03-16 01:01:25', '退出');
INSERT INTO `sys_fhlog` VALUES ('45a22062bfaa4857a30a70351ad6ed0f', 'admin', '2017-06-09 09:26:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4637570ba60d45b2ad5daa5d5d8dc705', 'totoru', '2017-06-10 10:31:09', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('46b91d29c2884abb9db57f2e41ee64b9', 'admin', '2017-05-02 12:09:45', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('46fbb570635746b082020a16dcdd870f', 'admin', '2017-05-02 12:03:55', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('471cbfde62004303bd0c6d90aaa1d70e', 'admin', '2017-05-02 13:44:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('472426b0d7a14bc2864cc9c279dc98a2', 'admin', '2017-05-02 12:03:54', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('47294e8ed5ab4cdfb3a751921a5ad77a', 'admin', '2017-05-02 10:57:15', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('48575ef85dc74b65a0d384f9a72dca7d', 'lisi', '2017-04-27 12:09:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4863caa473104457af87076ebe1c851c', 'admin', '2017-05-02 13:43:26', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('48a3421540a04f19a31faf203cedcf9e', 'admin', '2017-05-02 13:44:13', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4a0755223e024c6c998cafd7c24300c6', 'admin', '2017-05-05 09:23:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4aada545b37e48379d0c49161736abc6', 'admin', '2017-03-31 22:12:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4aaf1b2dc71f4ea8b7a8e43b4b4f63fd', 'admin', '2017-05-02 13:43:28', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('4b36e7f4ad6746f8b548b29ccd0956d6', 'admin', '2017-05-02 13:46:36', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('4b98faf259074e89a7e9e2a102ff96a9', 'admin', '2017-04-27 13:15:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4be13c586bea42cd951d7301ed764794', 'admin', '2017-05-02 11:00:53', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4c3d5b25694b4c2d82c8d384257ba167', 'admin', '2017-05-04 13:46:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4ca62a75820d43febf8684ab95141cbf', 'admin', '2017-04-26 08:30:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4d8eb0fa590c40b09317f908993af0b2', 'admin', '2017-05-02 13:43:27', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('4dd056c431384accad25deaf704907db', 'admin', '2017-05-04 16:09:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4dfb1eb4a15742cd962f7ea3d9cb5de1', 'admin', '2017-05-04 10:07:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4ee77ae5985d4d04a6522b0d1755a412', 'admin', '2017-04-25 16:07:03', '退出');
INSERT INTO `sys_fhlog` VALUES ('4f77c408c5a743fda5710fdd054fd78c', 'admin', '2017-05-02 12:04:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('509d6b14ffbc47e0b949ca88d6ee3cc3', 'admin', '2017-03-15 15:38:59', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('527f27e5df8649108dc0bdc674846939', 'admin', '2017-05-02 10:55:13', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('53215d5f8aef4bba8cd37d39929e92a8', 'admin', '2017-04-25 16:50:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('538511b327db4ef9b18ecccaea64e4b2', 'admin', '2017-03-30 00:56:42', '退出');
INSERT INTO `sys_fhlog` VALUES ('53b2c0c20bec4be18727f4ace6334f87', 'admin', '2017-05-02 13:44:30', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('556c6b1abdc646ac92830c9fd71900e0', 'admin', '2016-10-18 04:08:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('55f31e90a3e44b9e81e2636029670b61', 'admin', '2017-03-16 01:01:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('56532c46e9124460890261a0cebdf229', 'admin', '2017-04-27 13:15:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('56634d4264ff4846a26a7ef8cdc961f8', 'admin', '2017-01-20 09:49:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5664ce738a744221922c7840bf9c4178', 'admin', '2017-05-05 09:26:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5697eff320f8468782fda484fe8d2ab1', 'admin', '2017-04-27 13:15:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('5728002e1e964bfe8166bde59ab6b861', 'admin', '2017-05-02 10:57:16', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('5752dcf5b9bf4e28956b8e8dd8fb277b', 'admin', '2016-10-18 03:31:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5781170a6ab94f64a6ddd1016db35b5b', 'admin', '2017-06-12 09:02:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('58013fe5bc7945fa99bf57e3a5c9a0f2', 'admin', '2017-04-27 13:14:57', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('582dd4c06e674622a00562a34ae6c238', 'admin', '2017-06-12 10:00:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5904fc27e9304750b10f1169b0382a45', 'admin', '2017-05-02 13:44:13', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('590d03de86d046a485fe5373874403ff', 'admin', '2017-05-02 11:00:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('59489c33eb684355aa7910300a60bc9e', 'admin', '2017-04-27 13:08:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5969b0e3a26d4b8ea688e1b7e50baf8b', 'admin', '2017-04-27 15:51:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5974cc3826bd453ca2bf63a35a5c4303', 'admin', '2016-12-05 15:59:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('598ce720eb114d24a0d21104ba56a1ac', 'admin', '2017-04-25 09:48:31', '修改系统用户：lisi');
INSERT INTO `sys_fhlog` VALUES ('599937a99b0b47c3aed8e926993e963f', 'admin', '2017-04-25 16:57:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('59e2c4d8b6a54d2183486665f46d3458', 'admin', '2017-02-13 01:21:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5a61bff1beea4b7dab530750d9533219', 'admin', '2017-04-26 13:14:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5a9fb606b9bf4ad2820f2f4da4ec195c', 'admin', '2017-05-02 12:09:45', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('5b0f9d4e2daf4e4bb4d85c68ddd4eae8', 'admin', '2017-05-02 13:44:30', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('5d29fcbdf99947a8b160098f6fae4d9a', 'admin', '2017-03-16 01:00:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5d6dfdf6bbad4ca582540f7f79f6e613', 'admin', '2017-05-02 13:45:39', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('5db0e35e64654c2891ec86514e2fbe7f', 'san', '2016-06-06 02:28:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5e06d3eef1ba4961bbd56b03455ad82c', 'admin', '2017-05-02 13:43:26', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('5ed48ce8b0cd45a9a3c988516cc862e3', 'admin', '2017-04-27 13:14:57', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('5edb843eee6d41b89d4fd3e08296e59d', 'admin', '2017-05-02 13:44:30', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('5eef250e328f4add8f362daa1fc0cb7a', 'totoru', '2017-06-10 10:31:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('60d6a6ca5a0c4e15ac7cc62d669a734c', 'admin', '2017-05-03 10:35:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6115f32fb414418ebcb3703594e3eddb', 'admin', '2017-04-27 13:15:04', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('61589ec8a9704d8c9df81d2c09769861', 'admin', '2017-05-02 11:00:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6183f4c7ddfc4ad08a64413f37a36a9f', 'admin', '2017-05-04 14:51:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('62131baffce0481782aa39c501b2b799', 'admin', '2017-05-02 10:57:16', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('62c1e544722d463c853734c53d2189bc', 'admin', '2017-05-04 16:23:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('63918363ced846c0adcc4213ea7e53a9', 'admin', '2017-04-25 14:25:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('640704de63184af48ef9de1c0bbca3c1', 'admin', '2017-05-02 12:52:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('642cde623c584737b6e7ca1b0f672a60', 'admin', '2017-05-02 10:57:15', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('644a2fb8bf6845d7a412f32005e1db5d', 'admin', '2017-05-02 14:07:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('64a408e4b7794ea498f6b07c65215b92', 'admin', '2017-05-02 13:45:39', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('6505c7424eb7434ebf376af88cebbc0c', 'admin', '2017-06-09 09:17:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('654bcd92a6204085b9bfb765e7f71297', 'admin', '2017-05-02 10:55:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('657af26cf3df483fa3966096cdb6db2a', 'admin', '2017-05-02 13:46:34', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('66452e32b0b249bebda85e72ddd86cb6', 'admin', '2017-05-02 13:43:27', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('666159aa34e041e9b26015c6a0bd02ae', 'admin', '2017-03-30 00:30:57', '删除系统用户：{tm=1490805057831, USER_ID=456a34455b1241ebb7c373e4a245694c}');
INSERT INTO `sys_fhlog` VALUES ('673647516c84437e85969f40e58a863f', 'san', '2017-04-25 11:57:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('673d1424381b4fd1aa8cf900041e2fad', 'lisi', '2017-04-26 10:38:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('674791a3fd1b40fbbaf83c02bdc46299', 'admin', '2017-04-27 13:14:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('678ef92b80d445768c37ec4dbae9bc91', 'san', '2017-04-25 12:15:58', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('67e0a43a2feb451389953d9b2b8ad7c1', 'admin', '2017-05-02 10:55:13', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('68255085c44445cfb11e8f48789402ea', 'admin', '2017-05-02 13:46:34', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('684a45df9868431c9356101e82b87b2f', 'admin', '2017-05-02 13:44:12', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6885be7c36b0472a8dd5852fdcdee041', 'admin', '2017-05-05 09:11:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('68dc9f6aa9c846aaac74c77d6bf1f7ae', 'admin', '2016-12-05 14:48:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('69cfbe85f5ca4a8ca80baa3acccf77a9', 'admin', '2017-05-02 13:43:27', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('6a64887eeff942b5b1f5df6298ca46ce', 'admin', '2017-05-02 12:09:46', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6baa6fb0566a424296cd53115dbc8d76', 'admin', '2017-05-02 13:46:36', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('6bb4eff36e0240fe9c47c23aea0439cc', 'admin', '2017-05-04 16:24:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6be83b8d6b884d21827ac31e757baab5', 'admin', '2017-05-02 15:20:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6c7059d4e8f64b7e848d08bf240f717b', 'admin', '2017-05-02 13:44:31', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6d719e167f224b8aa58abbd01fa9484e', 'admin', '2017-05-02 13:40:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6da57f3c57164f83abd531d7c861e378', 'admin', '2017-05-02 13:45:40', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('6db73bcd88fd4ebda5b8f6bfdd85c8a3', 'admin', '2017-05-02 13:47:39', '修改角色菜单权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('6e442130d1a94f55a36cf1e5dd5a1bb5', 'admin', '2017-05-04 10:54:06', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6ed3e472ef8b4e7c8b24739d2027de95', 'admin', '2017-05-03 08:42:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6ee05ebdcc2c4c1c8631815676ab8329', 'admin', '2017-05-02 13:44:13', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6ee7083e04ca4c7a9e3508747ba972c0', 'admin', '2017-05-02 14:53:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6f0a0188d20e48758995ab3b1718fd5c', 'lisi', '2017-04-26 13:30:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6f6e9f9e1b2a4f0b80ce3ca41f3e1c33', 'lisi', '2017-04-25 11:56:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6f79868330964c7fa2a95ea97b748103', 'admin', '2017-05-02 10:57:17', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('6fc799f8d7a34d659dd44f3e645e7f31', 'admin', '2017-03-16 01:04:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('705e4ffe9c6b4cb48b4461de94a535eb', 'admin', '2016-10-28 19:34:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('70b6933b396f476280ad96bd5c619797', 'admin', '2017-04-27 13:14:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('71095f4d4a5942d1bbbcd339421c23f8', 'admin', '2017-03-16 01:01:39', '退出');
INSERT INTO `sys_fhlog` VALUES ('7110f3f0db9049bfa14d65fa68b030ae', 'admin', '2017-04-27 15:25:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('716f0bc575f8404a9587554d21160235', 'admin', '2017-04-27 13:14:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('716f8b11f94f43f3896171d8e2d2812c', 'admin', '2017-04-25 16:13:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('71971c697b9a4c57aa85810dec6d8233', 'admin', '2017-05-02 11:00:53', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('71fcb6b4386d4a5ba0a46e51927e56f8', 'admin', '2017-04-28 16:06:21', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('72f45cbe80eb4d1eb2af5f8f8098ef78', 'admin', '2017-05-02 13:07:07', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('73df42bdf79e4483a70d1b4281202132', 'admin', '2017-03-30 01:17:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('75452de15a274af6bdec59ad7434828d', 'admin', '2017-05-02 13:43:27', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('754995fc5b244acaa26fd3b2ed0e84a1', 'admin', '2017-04-27 13:14:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('75aa061443d84fe89ad34a53c5925e80', 'admin', '2017-05-02 13:44:30', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('75de41773be840658f201020996b692d', 'admin', '2017-05-02 13:05:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('761f18417a4e47c596074ff70c4acbdc', 'admin', '2017-05-02 12:03:54', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('766717dfcc4d4625bd59d294d50e7e11', 'admin', '2017-05-02 13:44:30', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('78a68ec800104c1db100870c56659d57', 'admin', '2017-05-02 10:55:13', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('78d78c6f963c44f8bc08c64334eca33b', 'admin', '2017-05-02 10:58:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('793b8c599ee0460a8c4502285364119e', 'admin', '2017-05-03 12:10:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7984968bd2914f55951f57d849531ee6', 'admin', '2017-04-27 13:15:04', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('79945b965c6046b5ad42c8bba7af11d3', 'admin', '2017-05-02 11:00:27', '删除菜单ID69');
INSERT INTO `sys_fhlog` VALUES ('79b49c417b5345e88d71151fb1274373', 'admin', '2017-05-02 10:58:07', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('79bce7d8985a420babe3a33be5e1cd4f', 'admin', '2017-05-02 12:03:54', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7a52e04e19454e17ba62c9e4dedc6d5e', 'admin', '2017-05-04 11:17:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7a59838db988489ab9ce36ac21cbff71', 'admin', '2017-04-27 13:15:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7ab8f10b0a1f4c92836d6cda9a8a685f', 'admin', '2017-05-02 11:00:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7b23d6145cc442289031527952824c80', 'admin', '2017-05-02 12:09:46', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7b3d71ae6abf4de6abb805880058c57f', 'admin', '2017-05-02 13:44:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7bb7555d3cb3432cbf11862867e3e917', 'admin', '2017-05-03 08:31:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7c22701441ea439d9fcb8cb636b8de68', 'admin', '2017-05-02 13:43:27', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('7cc3e11df84c4823a7234984c6c82e4a', 'admin', '2017-04-26 16:14:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7d577bd224824f32a090314014c2059b', 'admin', '2017-03-16 01:03:55', '退出');
INSERT INTO `sys_fhlog` VALUES ('7dd0dda32ee940d8bde2071e947e57b3', 'lisi', '2017-04-26 13:23:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7df4fd514332436995a3ed213d22842d', 'admin', '2017-04-27 13:14:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7f481f5a4a3347d0a64c1a20a71a6eee', 'admin', '2017-03-29 02:28:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8005b59ba1314c6182563e917872d2fb', 'admin', '2017-05-02 13:45:39', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('804f4700a8b44a9cab74ebddc8095406', 'admin', '2017-05-02 12:09:46', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8077dbf7606a4fe5b230513cac4a29d0', 'admin', '2016-11-02 01:13:48', '新增菜单公众号管理');
INSERT INTO `sys_fhlog` VALUES ('80d13da471d6455095e573b238fbf8f5', 'admin', '2017-05-02 13:44:12', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('813ecc9ae5ec4d76aeb7a828fbc5268b', 'admin', '2017-04-25 09:47:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('821e266967644073901cf02fbd2a05a0', 'admin', '2017-05-02 12:32:58', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8235b4103cca4fe681dc09d579aeb914', 'admin', '2017-05-03 12:32:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('829e206715214e78b4ff235f800420c6', 'admin', '2017-05-02 13:46:35', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('82e0c8c271c746099b5b358605c080aa', 'admin', '2017-05-02 13:44:13', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('832b9d1a530941f3896c0a73a72a4aaa', 'admin', '2016-11-02 01:14:13', '退出');
INSERT INTO `sys_fhlog` VALUES ('83790985502a43f194bb138fb1cf8b80', 'admin', '2017-05-02 12:09:47', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('838b334edc964b8ab8c4ac45bbcba65d', 'admin', '2017-05-02 11:00:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('83b00de5fa594f83a84a04052e135311', 'admin', '2017-04-27 13:14:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('84172302a24d44d9b0c3bc1d13d6cc96', 'admin', '2017-04-28 15:40:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8446f03e03b54d018d6b059b811d0bfd', 'longmao', '2017-04-26 13:14:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8469fca61eed4e529c2c6a8c87217b6b', 'admin', '2017-04-27 13:15:04', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8481b5cf9d934c2fb5d694ee5fd1f3f0', 'admin', '2017-05-02 12:03:53', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('848569e5046942a1bc89a30b8113f80a', 'longmao', '2017-04-27 13:12:49', '修改add_qx权限，角色ID为:3');
INSERT INTO `sys_fhlog` VALUES ('84caae6bdb5640e88d3df7386f2fc235', 'admin', '2017-05-02 12:03:55', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('852a8f7b0e3247a3ba8d41edb72a9d28', 'admin', '2016-06-06 02:28:38', '退出');
INSERT INTO `sys_fhlog` VALUES ('854ef7d585484d31929dc90838a8e478', 'admin', '2017-05-02 13:44:31', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('85acf10826a4413c903651735ade87c4', 'admin', '2017-05-02 13:44:30', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('85ba63653c794e0e873dcd38d0e21430', 'admin', '2017-06-09 08:59:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('86b458a8c51740569c8db1d1d9aa8c17', 'admin', '2017-05-03 11:14:59', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('86c7c9ef145b414bb34f01aea1fd52a9', 'admin', '2017-05-02 13:46:35', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('87133982441344c2af81e0248131f80e', 'admin', '2017-05-02 13:43:28', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('87c7f863a2e64c98a314d7f3c584f3ac', 'admin', '2016-06-06 02:27:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('87eecac17e3c4b04889ff6db07adb7ca', 'admin', '2017-06-10 09:34:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('88b074a4cbe44c8c85f465b94b3c4b51', 'admin', '2017-04-27 13:14:57', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('88c2fe81fef04ed5bbcba5a73bf4e7b8', 'admin', '2017-05-02 13:44:13', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('88e8f37057ff478585c880b4b9c45060', 'admin', '2017-05-02 13:44:30', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('89cfc7e669804aaf86f45f5d5d8cca80', 'admin', '2017-05-02 12:03:56', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('89d2c4a288e4472eb51733392d8d90ba', 'admin', '2017-04-26 16:15:37', '退出');
INSERT INTO `sys_fhlog` VALUES ('8a585f34a4874d4787ae3090bca5dfc1', 'admin', '2017-05-02 11:00:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8b203a04803e4a45b8edbac8adb24108', 'admin', '2017-05-04 15:00:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8ba3c7dbf64e4832a842b644aaf64b98', 'admin', '2017-04-27 13:15:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8bee715ca4474cd1b80b785ff0a64d2b', 'admin', '2017-04-27 16:15:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8c4a7be064b9471a88772899f2224eb1', 'admin', '2017-04-27 13:15:04', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8c622aa893dd416880bbc89280444500', 'admin', '2017-03-29 00:16:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8d0566d86af246b3a1f8556f34e2792e', 'admin', '2017-05-02 13:45:40', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('8d30dbd163174071b0183fea39448fc8', 'admin', '2017-05-02 12:49:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8ec77d9f0e62411faecdf47c47ca9509', 'lisi', '2017-04-26 11:45:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8f4ea9d509174c9da9337d20a3594eb3', 'admin', '2017-05-02 13:44:30', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('905cadd055b847cb9dce295861a1dbf2', 'san', '2016-06-06 02:29:18', '修改角色菜单权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('910cc8400f7e49698e88d32d9cc950cb', 'san', '2017-04-25 11:57:54', '退出');
INSERT INTO `sys_fhlog` VALUES ('9117d67f2e254c8fa370f69970f5fe26', 'admin', '2017-05-02 12:03:55', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('919a304d19b3464c9741fbc708714590', 'admin', '2017-04-27 13:15:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('91d45df86a3841b4a66f61da34e031c5', 'admin', '2017-03-16 01:00:05', '退出');
INSERT INTO `sys_fhlog` VALUES ('91f8834a2af4446d8098998c0fb281e8', 'admin', '2017-03-16 01:01:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('922773f50a0948188e3e8b729648159b', 'admin', '2017-03-16 00:46:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9240e234409041bab17f7f58b52b2bb3', 'admin', '2017-05-02 11:00:53', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('92e3f22b9ce54fdba58f4d7b89f88977', 'admin', '2017-05-02 13:44:13', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('92e98e16a496471eb97af39a78c8d4d7', 'admin', '2017-05-04 11:29:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('93ba05e76cbe47b78b70b40d15079ead', 'admin', '2017-05-02 13:44:29', '修改菜单硬件管理');
INSERT INTO `sys_fhlog` VALUES ('93d1e1f0d5f14e39aa3e406a67d298cf', 'admin', '2017-05-04 16:44:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('94100f202adc4a75a340f8de28d9d19f', 'admin', '2017-05-02 08:45:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('944a6dc6cf1e45238cb74e50b2727b51', 'admin', '2017-05-02 13:46:36', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('944e5e66b45f4906a250321b228b0ca6', 'admin', '2017-05-02 12:09:45', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('95309b53d0c142afb0d83362cda8585e', 'admin', '2017-04-25 14:24:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('954623bf389940cc9211de600a3675ce', 'longmao', '2017-04-25 14:21:29', '新注册');
INSERT INTO `sys_fhlog` VALUES ('969fd1c6332e419e9f68bcf815ca451f', 'admin', '2017-05-02 16:48:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('96abb2cff2af4af6a4b6c364f7c10508', 'admin', '2017-04-26 09:12:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('978a17ec2e264294be17ab55a190a175', 'admin', '2017-03-16 01:02:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('97e9a120d03641a2880f1f183e545075', 'san', '2017-04-26 10:21:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9828cfa013f9470ca0ac42eb268432e4', 'admin', '2017-04-27 13:14:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('985bf4c3e2ce45b3bb2bdef3776bf03c', 'admin', '2017-04-27 13:15:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('99108c2c1a7348c2a69e58bf743b2014', 'admin', '2017-04-27 12:06:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('996e640ffb524b1fbad48bd7744fa4ac', 'admin', '2017-05-02 12:19:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('99e93b3bead1443cb9f4edbeb1b6a08e', 'admin', '2017-05-04 16:14:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9a259e83e3b24c359bd17b94cdf1ba1f', 'admin', '2017-05-02 13:44:13', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9ae9eae4674f4b68bd62850f6d6c1c86', 'admin', '2017-04-27 13:14:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9af4b67635ce4cfba39ced9250b3e814', 'admin', '2017-05-02 12:03:53', '修改菜单停车场管理');
INSERT INTO `sys_fhlog` VALUES ('9b0770702a4241058c832d38e7be92d8', 'admin', '2017-04-27 13:13:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9bddc0b7b10e439e8c58ed1183d68ddc', 'admin', '2017-02-13 01:05:01', '修改菜单性能监控');
INSERT INTO `sys_fhlog` VALUES ('9d34bacabb8345d2b01eccf5eeddafac', 'admin', '2017-05-04 16:41:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9d37127ef1a943a2937d51c40047e4c8', 'admin', '2017-05-03 11:17:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9d9b073ddc244974bccafddee736cf7f', 'admin', '2017-03-30 02:13:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9e6b90c6382c41f392bad13b39a28e75', 'admin', '2017-05-02 13:43:27', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('9ef8842514074f47b40b244202231834', 'admin', '2017-05-02 11:00:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a050274c09144efe875936f811d46973', 'admin', '2017-05-02 10:55:13', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a050655d842441f28ffb03bb61a8d9d1', 'admin', '2017-03-30 00:30:50', '删除系统用户：{tm=1490805050674, USER_ID=e4a6c22ca4244d18ab969367677f5d5a}');
INSERT INTO `sys_fhlog` VALUES ('a0518d2ea99d4402b0fa7266a575127b', 'totoru', '2017-06-10 10:31:36', '新注册');
INSERT INTO `sys_fhlog` VALUES ('a0842c658b7743f29882d344c04e881b', 'admin', '2017-06-09 09:53:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a14d8708138249039db05e46a9ea1fd7', 'admin', '2017-05-02 12:03:56', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a1f608d6619848bea2290beb87edf6bd', 'admin', '2017-05-03 11:16:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a23edbb3c8d344b8913c0792d0a2d6d7', 'admin', '2017-05-02 10:57:15', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('a26761051e0d4ed6b4d6d2bcfca2d853', 'admin', '2017-05-02 12:09:47', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a2a722fcd5ed44408a5d256490620060', 'admin', '2017-05-02 10:55:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a2d4853b847941caa85beeaea65cde28', 'admin', '2017-04-27 13:14:57', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a430cd05232e4f7ca3ae467a1b7c79f2', 'admin', '2017-05-02 10:57:14', '新增菜单传感器细节信息');
INSERT INTO `sys_fhlog` VALUES ('a46df07e5dc646faa14ec659f992e727', 'admin', '2017-04-28 09:27:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a4860d1ebaa44f59a910e2ba5dc5696e', 'admin', '2017-05-04 15:13:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a4c1d7ff85e04906af1e797c163a2df7', 'admin', '2017-05-02 13:45:39', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('a4e623dbb58f44d59fbb6f46fc09c464', 'admin', '2017-05-02 10:52:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a4ee32c8ae464efe8b30f8a33344cd12', 'admin', '2017-05-02 12:03:56', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a56b6bf972e3437585fd54ce3577843f', 'admin', '2017-04-27 13:14:57', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a5b6f4fcbd0940abbff905c03f018138', 'admin', '2017-05-02 13:45:40', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('a5bacd07c986424d919bbfecbfdcb6ac', 'admin', '2017-05-02 13:45:39', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('a5f911ae69294c2d9f0a06de5aff34e2', 'admin', '2017-04-27 13:14:57', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a6a8c8fcf5fd4287bd91ad1023e4c7c8', 'admin', '2017-04-27 13:14:56', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a6dfd8bcdf954b9da5941f2ac70c41de', 'admin', '2017-05-02 12:03:54', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a71820bd2d9843bdb0218502d03ffabf', 'admin', '2017-05-02 13:44:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a73e0f0d72a741be915094c9a30447fe', 'admin', '2017-05-02 12:03:56', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a7bee7c910fd43d7beb77235d97508e6', 'admin', '2017-04-27 12:10:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a83d0f18595e42ee97832542014bdc38', 'admin', '2017-05-02 13:43:26', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('a871dfe411174aa391cc96fe7925c44e', 'admin', '2017-05-02 13:44:29', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a8bf84b48f7d4f93930a440bc96e82b2', 'admin', '2017-05-02 12:09:47', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a8c308fd99dd42f6bd46ae8f458029ca', 'admin', '2017-04-26 13:18:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a9b602a80d754b75a7f934463ad1e23b', 'san', '2017-04-25 11:58:01', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('aa894b86d65946c58ba6b70437f3ab01', 'longmao', '2017-04-26 13:14:44', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('aa8de05b522f4d4689b5232884878be7', 'admin', '2017-05-02 10:14:21', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('abdc159037714e5aa68db2157b486f65', 'admin', '2017-05-02 10:57:16', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('ac12178ec46e464fb511bab8754e1f37', 'admin', '2016-10-18 03:27:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ac36bf0e5f874139ad17c6145e3fcae8', 'admin', '2017-05-04 14:06:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ac8973fd3b81458a92855154cd181deb', 'admin', '2017-04-27 13:15:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ad359956523149019615fa8cc598e46e', 'admin', '2017-05-02 13:46:34', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('ad6c522597d34a57b905769ceb677a20', 'admin', '2017-05-02 10:59:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('adf830d31e4c42a4a0f2dd4889bbcba1', 'admin', '2017-05-02 11:00:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ae4ebd3ac6f24b6e9bd90043b8daee08', 'admin', '2017-05-02 13:46:34', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('ae8053151aff4eeb8c9c229d1da66afa', 'admin', '2017-04-27 13:14:57', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('af0ac5c3af72414e982e8f4d6b4c47d8', 'admin', '2017-05-05 09:37:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('af0d8f3465e24518b7ee9f73fbe0c31d', 'admin', '2017-05-02 12:59:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('af4aee65e0f14c869db350c4bd4c1bf7', 'admin', '2016-06-06 00:15:44', '退出');
INSERT INTO `sys_fhlog` VALUES ('af597ef427a84fad92eef1227ade06a1', 'admin', '2017-05-02 12:09:45', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('af6dd688a33e440eb1730be7da4ac15c', 'admin', '2017-04-27 13:14:56', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('afdc3039b9ec4e5dbc85be5df31aba91', 'admin', '2017-05-04 15:25:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b0377e33892f4c3796b6cf42fc1218d5', 'admin', '2017-04-28 14:14:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b0696e8376544ef5a67c38252ca41ad2', 'admin', '2017-05-02 16:40:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b086a3e83d42431abcc7cfaec09b1f81', 'admin', '2017-05-02 12:03:54', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b2c5fa193428479ba0140276a5ffe21b', 'admin', '2017-05-02 10:30:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b5579748423241e2849b81a3d83008e5', 'admin', '2017-04-27 13:09:04', '修改add_qx权限，角色ID为:3');
INSERT INTO `sys_fhlog` VALUES ('b56c2b7516ae427b9330d8215a60a841', 'admin', '2017-04-26 16:10:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b613d133a2c543579bfce5912dce048b', 'admin', '2017-05-03 12:34:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b65482d915e54dffa7513f7bde72100b', 'admin', '2017-05-02 12:03:53', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b68c090340cd406785bc43fd50385cd9', 'admin', '2017-03-16 01:03:47', '退出');
INSERT INTO `sys_fhlog` VALUES ('b7623ef9ccff4fab81d5c32a98fa30b9', 'admin', '2017-05-02 13:44:30', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b8688474e5764263a588a3070c4df693', 'admin', '2017-05-04 12:59:59', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b90b5031fb5b45b7b4ad578f03b37722', 'admin', '2017-04-27 14:29:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b9186079e6b54ad2b64018ec52f27b9f', 'admin', '2017-05-02 13:45:39', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('b9b4566201cf45dba5bfea34b75817a4', 'admin', '2017-05-03 12:44:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ba021d57134c430ea09e0d53fc81dba1', 'admin', '2017-05-02 10:43:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ba16e52175cc4aeab8701ae6880b1957', 'admin', '2017-04-26 08:35:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bac6e98204d242ce9b30a2dca8b0898c', 'admin', '2017-03-16 01:00:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bacd051162f54f379b70144f2f26fce7', 'admin', '2017-04-27 13:15:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('bb834ea31c284440afbff98237282e74', 'admin', '2017-05-03 14:52:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bbdca7fd921d48ba97e23f6e141663da', 'admin', '2017-04-26 10:07:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bc706b5677df41fba611a65b3c93a4ab', 'admin', '2017-05-02 12:03:54', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('bc7fa5e3e221496b827fc306ae28fbe9', 'admin', '2017-05-02 13:44:13', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('bc87ebce8b9442d2b13de0480381b77d', 'admin', '2017-05-02 13:44:13', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('bcde2101256345e683826baa627b8251', 'admin', '2017-04-26 12:55:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bce977f4fe124609b27b8825a02415ff', 'admin', '2017-04-26 08:32:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bdee15b3f2be4068a6493c433bdec1ba', 'admin', '2017-05-04 10:55:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bed5ee7da01c4fff97574f9af374ed12', 'admin', '2017-05-02 10:55:13', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('bee23b499015492cb8043f05a1e47b2c', 'admin', '2017-04-27 15:49:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bf87ad41583f45de87e36bf84dd6e2c8', 'admin', '2017-05-04 10:54:01', '退出');
INSERT INTO `sys_fhlog` VALUES ('bfaa93a0e8224821a1dfceffe0356de5', 'admin', '2017-02-13 01:05:49', '新增菜单快递查询');
INSERT INTO `sys_fhlog` VALUES ('bfcae93323bc469292ae33defcac4389', 'admin', '2017-05-02 13:06:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bfcdfc169d7f4f75b2946e442e4c0dd4', 'admin', '2017-05-02 13:44:30', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('bfdea11e32c04438ab6dbb3e36d82b33', 'san', '2017-04-26 10:36:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c0ef8a3323cf46edb147da82abbfdaeb', 'admin', '2017-05-02 11:00:53', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c1a5eae1f4e34adbbc6aead5f93b7698', 'san', '2017-04-26 10:21:48', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('c23e7eeb3a8a476ea9f2d60c8839f3a2', 'admin', '2017-04-27 13:14:57', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c24f88af7638476e84481e65ffb3b7d3', 'san', '2016-06-06 02:29:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c26180167bb74cc28390fe492a07c6d0', 'admin', '2017-06-09 09:05:21', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c264720ea56e4e38b5355713ca98f942', 'admin', '2017-05-02 13:45:38', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('c2b39dc0b5ca45029cf9bb1c60d68a5a', 'admin', '2017-05-02 13:43:27', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('c3137738d6dd4d55b6e6bf8052e929ad', 'admin', '2017-04-25 14:21:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c339bbb5460844c490dfd972cb82273e', 'admin', '2017-05-02 12:59:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c37921144e05405da24e241e60f2edc0', 'admin', '2017-05-04 13:42:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c3ecb8ab4c6f4eb486ec83872c4ee427', 'admin', '2017-03-16 01:03:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c45a244a1c4342a99df12b4cd86072f5', 'admin', '2017-05-02 10:55:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c48a2f6ea7754f9c9919292e3292076c', 'admin', '2017-04-28 09:12:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c4d07c1c606c4387be71afa632c828e2', 'admin', '2017-05-02 13:46:34', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('c51294b93b6e449693fda8d5e8dd663d', 'admin', '2017-06-09 09:20:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c56ed44ca84049f291d30aa2ce8c8a2c', 'admin', '2017-05-02 10:57:15', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('c68a865c513a43daa02936fc7d3126ff', 'admin', '2017-05-02 10:57:16', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('c6d96a11d7504e96aee2faf081fd3413', 'admin', '2017-05-02 12:03:53', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c6fea6c99fde42f8844911222d2ed15b', 'admin', '2017-04-28 15:48:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c716acac934b4bf48e89d612a5c5e11a', 'admin', '2017-05-02 13:33:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c7313d9ffc784dabaefa7299796a0c85', 'admin', '2017-05-04 14:22:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c7fe8b4aecb9418484c294d1409551ad', 'lisi', '2017-04-26 12:55:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c8ac0628ba4f41619bcd0ee619366f12', 'admin', '2017-05-03 12:32:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c900304fffdc417faef3e9da0ce670f4', 'admin', '2017-05-02 13:43:28', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('c989ecd6e8fd4ba9b604f125de8993e2', 'admin', '2017-05-04 16:40:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c9bb8cf89e124daa9d9eea2462283e6b', 'admin', '2017-04-27 13:14:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ca80cd2baf5a4831b7eddaccb08e65de', 'admin', '2017-06-12 13:38:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ca8cd7fc097b41fc8ca65db8f13af27d', 'admin', '2017-05-02 10:49:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('caba1b235b094e028574a39f19419c25', 'admin', '2017-05-02 13:45:40', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('cc49f219f5ac4e9a9855339a1e298deb', 'admin', '2017-05-02 13:44:30', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('cc9ddc440c144c6a99794eda25bd93f4', 'admin', '2017-05-02 13:41:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cd57b41a3a814f788abe5b12075c01d7', 'admin', '2017-02-13 01:05:56', '修改菜单快递查询');
INSERT INTO `sys_fhlog` VALUES ('cd6c5a6054c844b585d1a92d93b05f01', 'admin', '2017-01-12 00:59:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cd99c6c79a7b4c19a40907b48740795b', 'admin', '2017-05-02 13:47:56', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('cdbf6f421da14e5f86d4cf6d91973252', 'admin', '2017-05-02 11:00:53', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ce33fe709b5c41eab7589a88f9bfa355', 'admin', '2017-04-27 13:15:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ce3fabe5f4fe41f7b8d0716756166096', 'admin', '2017-05-02 13:46:35', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('ce76a269fc56407ebfd53f72c137d2a5', 'admin', '2017-05-02 13:46:35', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('ce8da889f4f446c8aab798bdcf7ae3af', 'admin', '2017-05-02 09:59:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cee59771408444f2b4998c8bc458f26c', 'admin', '2017-03-16 01:01:56', '退出');
INSERT INTO `sys_fhlog` VALUES ('cf56ffdbcb5c42a199efaab78ae744d4', 'admin', '2017-05-02 13:46:36', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('d02b4d568ed6472da90943f0e38225d2', 'admin', '2017-04-27 13:15:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d07b1e561d594726a854003f3bdb753b', 'admin', '2017-05-02 10:57:17', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('d0a573c7c0394092bebb351f72ffbd30', 'lisi', '2017-04-26 10:21:30', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('d0a9652a387d40959cceb854c2632a74', 'admin', '2017-05-02 12:02:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d0e728b1c2fd4f50a27f20910524961f', 'admin', '2017-04-27 13:14:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d19aff6f976747559dddebf94fe201c1', 'admin', '2016-11-02 01:14:11', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('d1c8367290fa4dc7a2a1c619a8b2966b', 'admin', '2017-05-02 11:00:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d1de940a7c4147bc8691c038defd62fa', 'admin', '2017-03-29 01:22:34', '退出');
INSERT INTO `sys_fhlog` VALUES ('d2325cb92bc34b308558b27388049996', 'admin', '2017-05-02 09:08:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d24062aad2ab47fb9861790f1b069a12', 'admin', '2017-05-02 13:43:26', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('d2acf11cf24b42c186aa0ed21abb4428', 'admin', '2017-06-09 13:31:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d3d09497b7484b24a5f08a236c71071c', 'admin', '2017-05-04 14:40:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d3ed1dfdf60a4597bc611c357a254c8f', 'admin', '2017-05-02 13:44:30', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d40eb83d30cb4a6ca8398cd27d86a14f', 'admin', '2017-05-02 12:09:45', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d41f998d70a7402cb9467df62ea436ad', 'admin', '2017-03-29 02:45:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d430d712533b439e90c506b6a2afd78a', 'admin', '2017-04-27 13:14:57', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d44cd6cdbd60494f9c4e3327522f1bbc', 'admin', '2017-05-04 14:52:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d5486174560f44e79240fdbaf4a45285', 'admin', '2017-05-02 12:13:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d59c2dcfb7a446f4a15c2bc15c55c5cc', 'admin', '2017-05-04 10:56:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d62a6aec5193412cb7409bde6fa36a96', 'admin', '2017-05-02 10:55:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d642d7b6754148c8b03d56912c00640c', 'admin', '2017-05-02 10:55:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d66ae3ba3e1a4d8c8ed19f5161c2da2f', 'admin', '2017-04-25 12:51:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d7d8f1672f54496a87f81a7776e08714', 'admin', '2017-04-27 13:14:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d81bed448d8645dcb182cd3e2e077d75', 'admin', '2017-05-02 09:08:52', '退出');
INSERT INTO `sys_fhlog` VALUES ('d89040ed74184642a41a6c10319b223b', 'admin', '2017-04-26 08:44:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('da198364305f453a8cadd80a4994f98d', 'longmao', '2017-04-27 13:10:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('daa3de3870f94263bc743ae5afa7be18', 'admin', '2017-05-02 12:09:46', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('dab05396154046a9a2d82d34c9d5df3a', 'admin', '2017-05-02 11:00:53', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('dc5a94987e934b6285cd1563337947cf', 'admin', '2017-04-27 13:14:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('dcbd6953ac31448199aea59275cd8362', 'admin', '2017-05-02 10:55:13', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('de5e2b091b05425ca338d5b13b9e688c', 'admin', '2017-04-27 15:07:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('def6ea92bc8142f6b60878c3e57aa314', 'admin', '2017-05-02 13:46:34', '新增菜单传感器管理');
INSERT INTO `sys_fhlog` VALUES ('dfce3a79d9f44be6be4ed82370449660', 'admin', '2017-04-25 12:59:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('dfcf65a6ccdf477b8c861896a82c1953', 'admin', '2017-05-02 08:52:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('dffe8c0643af439c9b524f88cf61126e', 'admin', '2017-05-02 13:44:30', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e0bb77eab14845e0878d798541048fd0', 'admin', '2017-05-02 13:46:35', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('e0d712d2f60640c5b73960330254a4b6', 'admin', '2017-05-02 13:43:28', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('e114ea3f7ce149db8e98877120d7f0e1', 'admin', '2017-03-29 01:23:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e12315df32b744a9b8b771da78107bd4', 'admin', '2017-05-02 12:03:54', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e144ba5e9cb4421092d3713003f36d42', 'admin', '2017-05-02 13:45:38', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('e19ed769bdb44852a1c4a75d4515baab', 'admin', '2017-04-26 10:15:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e19ef2e4ad3b42c8b9e754a99c31e260', 'admin', '2016-10-28 19:53:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e2613ae214d54e7c851bb3a56b522c84', 'admin', '2017-05-02 12:03:53', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e30c403277e447eb9104f5cd733d7ef6', 'admin', '2017-04-25 14:45:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e3b1b2cf68d44b10a8094cb7cf6fcd68', 'admin', '2017-02-05 09:40:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e40eca50fdf3498692f04949a06ec7e8', 'admin', '2017-04-27 13:14:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e4d2004e73f74de5a44f8e2bb64d934b', 'admin', '2017-05-02 13:05:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e5dff936ef2f46528c679ca17f3d1548', 'admin', '2017-04-27 13:14:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e5fb5f5b2466447ba36a994383dc6d50', 'admin', '2017-05-03 10:18:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e647c8887e4848edbc7845a6c92c9a3d', 'admin', '2017-05-02 13:45:39', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('e6866ece3933452baead644d98fe5b10', 'admin', '2017-04-27 13:14:57', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e709c869eaf041d5b98181a2bd99eb3d', 'admin', '2017-05-02 13:45:40', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('e7bcd9f7712647229716d46023edf5ca', 'admin', '2017-05-03 12:32:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e7bf3ac392954e509e4c0341f4869a95', 'san', '2016-06-06 02:29:19', '退出');
INSERT INTO `sys_fhlog` VALUES ('e7d4599db34249339791b226e3a1b297', 'admin', '2017-03-16 01:03:40', '退出');
INSERT INTO `sys_fhlog` VALUES ('e7ee91422416426c92a95e74a42de0e9', 'admin', '2017-05-02 11:00:53', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e89b9d9614ad4286ae248a4225b7c039', 'admin', '2017-04-27 13:14:56', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e95c4af43aaa4ed6899a34850b0cf317', 'admin', '2017-05-02 10:57:16', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('ea22297c67ff402fae31075d9455a534', 'admin', '2017-05-03 14:47:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ea972ef5f05f4d0d8a48d4a7e81b68ad', 'admin', '2017-05-02 12:03:55', '修改菜单停车场管理');
INSERT INTO `sys_fhlog` VALUES ('ea9c926c78f042b38eddc95d1950ff4a', 'admin', '2017-05-02 11:00:52', '修改菜单传感器细节信息');
INSERT INTO `sys_fhlog` VALUES ('eab037a6200e4ab9b19e3986ae5bbb4e', 'admin', '2017-05-03 12:28:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('eac4eb29df5547ea8daa38d5490a6d1d', 'admin', '2017-06-09 08:49:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('eae61c4099b2407f92970de76db59fbe', 'admin', '2017-05-02 13:53:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('eba8d7b9d5274240859d108730493d6f', 'admin', '2017-05-02 13:45:40', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('ebf7e5273fc049fd82c98113ba78d24b', 'admin', '2017-03-30 00:30:53', '删除系统用户：{tm=1490805053670, USER_ID=065202edd0cc44188e9c59c07b4742e1}');
INSERT INTO `sys_fhlog` VALUES ('ec21e25edf71410fb5901b7481035739', 'admin', '2016-11-20 02:40:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ec4d462006b34f1d95d65525946ab31d', 'admin', '2017-04-25 15:17:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('edf666f89c0a483aafb92a62f0ba79cb', 'lisi', '2017-04-26 10:21:37', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('ef4d9e55a6b540d2b8db753a25834e31', 'admin', '2017-05-02 12:12:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f03d9d374dda454eb05df520f02d0e9c', 'admin', '2017-05-02 12:09:46', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f0f56243f96b4843b6d92e28b1bc76d6', 'admin', '2017-04-25 13:06:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f2340050d8334dca889d67c8d69998fd', 'admin', '2017-05-02 13:46:35', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('f2353b7a800a4942a546c59968b7e65b', 'admin', '2017-04-27 13:15:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f2688afeedc44737b781e6904140249a', 'admin', '2017-03-16 01:03:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f2a01a1a6c054441a1af3452b4940784', 'admin', '2017-04-27 13:15:04', '修改菜单停车场记录');
INSERT INTO `sys_fhlog` VALUES ('f2c44f24af0a45ca98e788093e40626e', 'admin', '2017-05-02 10:57:17', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('f2d950636246404f84e044259db32d36', 'admin', '2016-11-02 01:14:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f31abeef0f5943c1829b70402db7d17e', 'admin', '2017-05-02 12:03:56', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f332368d120a4c57882d54c2ff5a6f1c', 'admin', '2017-04-27 12:52:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f39a2417e0874c2ca7f1f347670d6ec1', 'admin', '2017-04-25 14:22:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f3ac360befd74c73b89113c2ed9a6061', 'admin', '2017-05-02 12:09:47', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f403502217da4a41af5d7c8fbb75b3f7', 'admin', '2017-04-27 13:14:56', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f4d2a8fc27654d6d9660519846d98d7d', 'admin', '2017-05-02 13:15:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f5de4a0f41f44dc6bd064f7f0084814e', 'admin', '2017-03-29 01:22:01', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f63fc9f9181f4b8594ec47c98b12d941', 'admin', '2017-04-26 10:21:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f6954a5e242f462b9b2c895ef0e354bd', 'admin', '2017-06-09 09:39:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f6ba27f3da374e84afbd5ee79338a758', 'admin', '2017-05-02 13:44:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f7085cbe453f41cba31b53503f966205', 'admin', '2017-04-27 13:15:04', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f7f5546fc23942729904d353f8db0ff9', 'admin', '2017-03-16 01:01:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f88437e532aa4eaea6792924ae382729', 'admin', '2017-03-16 01:00:54', '退出');
INSERT INTO `sys_fhlog` VALUES ('f8b9dc2dfa8941fb8a0b2cfed3b01e9f', 'admin', '2017-05-02 10:55:13', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f9bd30015975488fb7a1462409a5d52c', 'admin', '2017-05-02 13:48:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f9fe2b9a8e3840d1a16550ef41d8c5ba', 'admin', '2017-05-02 13:40:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fa51c95d64594280bb3512f40b216ade', 'admin', '2017-04-28 14:46:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('faa6b7f2cbb54017bec158912f6a9481', 'admin', '2017-06-08 15:45:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('facbc585214f4df698c6e9ce9f6ff0d3', 'admin', '2017-04-25 15:18:17', '导出用户信息到EXCEL');
INSERT INTO `sys_fhlog` VALUES ('fb65d097733b4fec86923110f16055ca', 'admin', '2017-05-02 10:55:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('fb680cb9c00f4a19a153414b55483ae4', 'admin', '2017-04-27 13:14:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('fb83f540f02748a9986132ee5efe257a', 'admin', '2017-05-02 10:57:16', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('fb8b384a900b4de78dc918af22ea8fd5', 'admin', '2017-05-02 12:09:45', '修改菜单传感器');
INSERT INTO `sys_fhlog` VALUES ('fc253ea8dec543cf87f0b05738bb2dfe', 'admin', '2017-05-02 13:46:35', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('fc4decfe676f4dbbb80d45444ffcb6de', 'longmao', '2017-04-27 13:09:26', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('fca229082ae74c8e83a903b8b3be363c', 'admin', '2017-05-02 11:00:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('fceab60a760f4a1ca3c6b5c50df892fe', 'admin', '2017-03-30 00:55:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fd692d1a5d5849f6b1b2e55a63809907', 'admin', '2017-05-02 13:44:13', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('fd6f6723b29d414d841fbe94afd4bc3a', 'admin', '2017-05-02 12:10:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fd83840f73224a9e8026f2f48f095284', 'admin', '2017-05-02 10:33:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('feef45ebeb88401eaac024a0adf15b9f', 'admin', '2017-05-02 13:44:13', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ffb9a44ad83f4b08922c68c7e00a60ba', 'admin', '2017-05-02 13:44:13', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ffc69c789c834b81b101d3e7f431ff24', 'admin', '2017-02-13 01:06:44', '修改角色菜单权限，角色ID为:1');

-- ----------------------------
-- Table structure for sys_fhsms
-- ----------------------------
DROP TABLE IF EXISTS `sys_fhsms`;
CREATE TABLE `sys_fhsms` (
  `FHSMS_ID` varchar(100) NOT NULL,
  `CONTENT` varchar(1000) DEFAULT NULL COMMENT '内容',
  `TYPE` varchar(5) DEFAULT NULL COMMENT '类型',
  `TO_USERNAME` varchar(255) DEFAULT NULL COMMENT '收信人',
  `FROM_USERNAME` varchar(255) DEFAULT NULL COMMENT '发信人',
  `SEND_TIME` varchar(100) DEFAULT NULL COMMENT '发信时间',
  `STATUS` varchar(5) DEFAULT NULL COMMENT '状态',
  `SANME_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`FHSMS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_fhsms
-- ----------------------------
INSERT INTO `sys_fhsms` VALUES ('05879f5868824f35932ee9f2062adc03', '你好', '2', 'admin', 'san', '2016-01-25 14:05:31', '1', 'b311e893228f42d5a05dbe16917fd16f');
INSERT INTO `sys_fhsms` VALUES ('2635dd035c6f4bb5a091abdd784bd899', '你好', '2', 'san', 'admin', '2016-01-25 14:05:02', '1', '1b7637306683460f89174c2b025862b5');
INSERT INTO `sys_fhsms` VALUES ('52378ccd4e2d4fe08994d1652af87c68', '你好', '1', 'admin', 'san', '2016-01-25 16:26:44', '1', '920b20dafdfb4c09b560884eb277c51d');
INSERT INTO `sys_fhsms` VALUES ('77ed13f9c49a4c4bb460c41b8580dd36', 'gggg', '2', 'admin', 'san', '2016-01-24 21:22:43', '2', 'dd9ee339576e48c5b046b94fa1901d00');
INSERT INTO `sys_fhsms` VALUES ('98a6869f942042a1a037d9d9f01cb50f', '你好', '1', 'admin', 'san', '2016-01-25 14:05:02', '1', '1b7637306683460f89174c2b025862b5');
INSERT INTO `sys_fhsms` VALUES ('9e00295529014b6e8a27019cbccb3da1', '柔柔弱弱', '1', 'admin', 'san', '2016-01-24 21:22:57', '1', 'a29603d613ea4e54b5678033c1bf70a6');
INSERT INTO `sys_fhsms` VALUES ('d3aedeb430f640359bff86cd657a8f59', '你好', '1', 'admin', 'san', '2016-01-24 21:22:12', '1', 'f022fbdce3d845aba927edb698beb90b');
INSERT INTO `sys_fhsms` VALUES ('e5376b1bd54b489cb7f2203632bd74ec', '管理员好', '2', 'admin', 'san', '2016-01-25 14:06:13', '2', 'b347b2034faf43c79b54be4627f3bd2b');
INSERT INTO `sys_fhsms` VALUES ('e613ac0fcc454f32895a70b747bf4fb5', '你也好', '2', 'admin', 'san', '2016-01-25 16:27:54', '2', 'ce8dc3b15afb40f28090f8b8e13f078d');
INSERT INTO `sys_fhsms` VALUES ('f25e00cfafe741a3a05e3839b66dc7aa', '你好', '2', 'san', 'admin', '2016-01-25 16:26:44', '1', '920b20dafdfb4c09b560884eb277c51d');

-- ----------------------------
-- Table structure for sys_loginimg
-- ----------------------------
DROP TABLE IF EXISTS `sys_loginimg`;
CREATE TABLE `sys_loginimg` (
  `LOGINIMG_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '文件名',
  `FILEPATH` varchar(100) DEFAULT NULL COMMENT '路径',
  `TYPE` int(2) NOT NULL COMMENT '状态',
  `FORDER` int(3) NOT NULL COMMENT '排序',
  PRIMARY KEY (`LOGINIMG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_loginimg
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `MENU_ID` int(11) NOT NULL,
  `MENU_NAME` varchar(255) DEFAULT NULL,
  `MENU_URL` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `MENU_ORDER` varchar(100) DEFAULT NULL,
  `MENU_ICON` varchar(60) DEFAULT NULL,
  `MENU_TYPE` varchar(10) DEFAULT NULL,
  `MENU_STATE` int(1) DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '#', '0', '1', 'menu-icon fa fa-desktop blue', '2', '1');
INSERT INTO `sys_menu` VALUES ('2', '权限管理', '#', '1', '1', 'menu-icon fa fa-lock black', '1', '1');
INSERT INTO `sys_menu` VALUES ('3', '日志管理', 'fhlog/list.do', '1', '6', 'menu-icon fa fa-book blue', '1', '1');
INSERT INTO `sys_menu` VALUES ('8', '性能监控', 'druid/index.html', '9', '9', 'menu-icon fa fa-tachometer red', '1', '1');
INSERT INTO `sys_menu` VALUES ('9', '系统工具', '#', '0', '3', 'menu-icon fa fa-cog black', '2', '1');
INSERT INTO `sys_menu` VALUES ('15', '微信管理', '#', '0', '4', 'menu-icon fa fa-comments purple', '2', '1');
INSERT INTO `sys_menu` VALUES ('16', '文本回复', 'textmsg/list.do', '15', '2', 'menu-icon fa fa-comment green', '2', '1');
INSERT INTO `sys_menu` VALUES ('17', '应用命令', 'command/list.do', '15', '4', 'menu-icon fa fa-comment grey', '2', '1');
INSERT INTO `sys_menu` VALUES ('18', '图文回复', 'imgmsg/list.do', '15', '3', 'menu-icon fa fa-comment pink', '2', '1');
INSERT INTO `sys_menu` VALUES ('19', '关注回复', 'textmsg/goSubscribe.do', '15', '1', 'menu-icon fa fa-comment orange', '2', '1');
INSERT INTO `sys_menu` VALUES ('20', '在线管理', 'onlinemanager/list.do', '1', '5', 'menu-icon fa fa-laptop green', '1', '1');
INSERT INTO `sys_menu` VALUES ('22', '停车场管理', '#', '0', '7', 'menu-icon fa fa-cab blue', '2', '1');
INSERT INTO `sys_menu` VALUES ('36', '角色(基础权限)', 'role.do', '2', '1', 'menu-icon fa fa-key orange', '1', '1');
INSERT INTO `sys_menu` VALUES ('37', '按钮权限', 'buttonrights/list.do', '2', '2', 'menu-icon fa fa-key green', '1', '1');
INSERT INTO `sys_menu` VALUES ('38', '菜单管理', 'menu/listAllMenu.do', '1', '3', 'menu-icon fa fa-folder-open-o brown', '1', '1');
INSERT INTO `sys_menu` VALUES ('39', '按钮管理', 'fhbutton/list.do', '1', '2', 'menu-icon fa fa-download orange', '1', '1');
INSERT INTO `sys_menu` VALUES ('40', '用户管理', '#', '0', '2', 'menu-icon fa fa-users blue', '2', '1');
INSERT INTO `sys_menu` VALUES ('41', '系统用户', 'user/listUsers.do', '40', '1', 'menu-icon fa fa-users green', '1', '1');
INSERT INTO `sys_menu` VALUES ('43', '数据字典', 'dictionaries/listAllDict.do?DICTIONARIES_ID=0', '1', '4', 'menu-icon fa fa-book purple', '1', '1');
INSERT INTO `sys_menu` VALUES ('54', '数据库管理', '#', '0', '6', 'menu-icon fa fa-hdd-o blue', '2', '1');
INSERT INTO `sys_menu` VALUES ('55', '数据库备份', 'brdb/listAllTable.do', '54', '1', 'menu-icon fa fa-cloud-upload blue', '1', '1');
INSERT INTO `sys_menu` VALUES ('56', '数据库还原', 'brdb/list.do', '54', '3', 'menu-icon fa fa-cloud-download blue', '1', '1');
INSERT INTO `sys_menu` VALUES ('57', '备份定时器', 'timingbackup/list.do', '54', '2', 'menu-icon fa fa-tachometer blue', '1', '1');
INSERT INTO `sys_menu` VALUES ('67', '公众号管理', 'key/list.do', '15', '0', 'menu-icon fa fa-comments blue', '1', '1');
INSERT INTO `sys_menu` VALUES ('68', '停车场信息', 'parking/list.do', '22', '2', 'menu-icon fa fa-cab blue', '1', '1');
INSERT INTO `sys_menu` VALUES ('71', '硬件管理', '#', '0', '8', 'menu-icon fa fa-hdd-o orange', '2', '1');
INSERT INTO `sys_menu` VALUES ('72', 'Ap中继器管理', 'ap/list.do', '71', '1', 'menu-icon fa fa-sitemap blue', '1', '1');
INSERT INTO `sys_menu` VALUES ('73', '传感器管理', 'sensordetail/list.do', '71', '2', 'menu-icon fa fa-cube green', '1', '1');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `ROLE_ID` varchar(100) NOT NULL,
  `ROLE_NAME` varchar(100) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `ADD_QX` varchar(255) DEFAULT NULL,
  `DEL_QX` varchar(255) DEFAULT NULL,
  `EDIT_QX` varchar(255) DEFAULT NULL,
  `CHA_QX` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '系统管理组', '17091186780602797907918', '0', '1', '1', '1', '1');
INSERT INTO `sys_role` VALUES ('115b386ff04f4352b060dffcd2b5d1da', '中级会员', '', '2', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('1b67fc82ce89457a8347ae53e43a347e', '初级会员', '', '2', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('2', '会员组', '', '0', '0', '0', '0', '1');
INSERT INTO `sys_role` VALUES ('3', '注册用户', '35462840320', '1', '35462840320', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('3264c8e83d0248bb9e3ea6195b4c0216', '一级管理员', '10384598668832293764056317087965134', '1', '36892925196425486294', '36892925196425486294', '36892925196425486294', '36892925196425486294');
INSERT INTO `sys_role` VALUES ('46294b31a71c4600801724a6eb06bb26', '职位组', '', '0', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('5466347ac07044cb8d82990ec7f3a90e', '主管', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('68f8e4a39efe47c7bb869e9d15ab925d', '二级管理员', '73786413343844589510', '1', '0', '0', '2251798773489606', '0');
INSERT INTO `sys_role` VALUES ('856849f422774ad390a4e564054d8cc8', '经理', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('8b70a7e67f2841e7aaba8a4d92e5ff6f', '高级会员', '', '2', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('c21cecf84048434b93383182b1d98cba', '组长', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('d449195cd8e7491080688c58e11452eb', '总监', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('de9de2f006e145a29d52dfadda295353', '三级管理员', '73786413343844589510', '1', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for sys_role_fhbutton
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_fhbutton`;
CREATE TABLE `sys_role_fhbutton` (
  `RB_ID` varchar(100) NOT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `BUTTON_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`RB_ID`),
  KEY `角色表外键` (`ROLE_ID`) USING BTREE,
  KEY `fbutton` (`BUTTON_ID`),
  CONSTRAINT `fbutton` FOREIGN KEY (`BUTTON_ID`) REFERENCES `sys_fhbutton` (`FHBUTTON_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `frole` FOREIGN KEY (`ROLE_ID`) REFERENCES `sys_role` (`ROLE_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_fhbutton
-- ----------------------------
INSERT INTO `sys_role_fhbutton` VALUES ('1743733f366240c693c4295b527d1b0e', 'de9de2f006e145a29d52dfadda295353', '4efa162fce8340f0bd2dcd3b11d327ec');
INSERT INTO `sys_role_fhbutton` VALUES ('469ffb4848ad49c389867d99560a4698', 'de9de2f006e145a29d52dfadda295353', '46992ea280ba4b72b29dedb0d4bc0106');
INSERT INTO `sys_role_fhbutton` VALUES ('4ee1e2bc03a64ef1bc578fcf2e2ea2c1', '68f8e4a39efe47c7bb869e9d15ab925d', '3542adfbda73410c976e185ffe50ad06');
INSERT INTO `sys_role_fhbutton` VALUES ('5669c8754b4d4e368365ed5065f9fc10', '3264c8e83d0248bb9e3ea6195b4c0216', '3542adfbda73410c976e185ffe50ad06');
INSERT INTO `sys_role_fhbutton` VALUES ('6cc655a1f9b746eea6af9df540f8e743', '3', 'da7fd386de0b49ce809984f5919022b8');
INSERT INTO `sys_role_fhbutton` VALUES ('74203935bfa34ce3b9b80e81f2a2bcfe', '68f8e4a39efe47c7bb869e9d15ab925d', '4efa162fce8340f0bd2dcd3b11d327ec');
INSERT INTO `sys_role_fhbutton` VALUES ('81d31bc5bf02490a85ce496b6755ef26', '3', '46992ea280ba4b72b29dedb0d4bc0106');
INSERT INTO `sys_role_fhbutton` VALUES ('8231c216fb514b4188e4162e629c6237', '3264c8e83d0248bb9e3ea6195b4c0216', '4efa162fce8340f0bd2dcd3b11d327ec');
INSERT INTO `sys_role_fhbutton` VALUES ('88f66a65ee1642bea7979e0e1050ac5f', '3', '4efa162fce8340f0bd2dcd3b11d327ec');
INSERT INTO `sys_role_fhbutton` VALUES ('8e478e8615ee455e95671ba05a29e457', 'de9de2f006e145a29d52dfadda295353', '3542adfbda73410c976e185ffe50ad06');
INSERT INTO `sys_role_fhbutton` VALUES ('91958c938bfe4a5fb7b18c7c6a871848', '3264c8e83d0248bb9e3ea6195b4c0216', 'fc5e8767b4564f34a0d2ce2375fcc92e');
INSERT INTO `sys_role_fhbutton` VALUES ('9c30cc6b58da480b83c8566f83f9f639', '3', 'fc5e8767b4564f34a0d2ce2375fcc92e');
INSERT INTO `sys_role_fhbutton` VALUES ('a45f54074f634b698038455f204faf26', 'de9de2f006e145a29d52dfadda295353', 'da7fd386de0b49ce809984f5919022b8');
INSERT INTO `sys_role_fhbutton` VALUES ('cebf4460cdb64161aa158baae84962fa', 'de9de2f006e145a29d52dfadda295353', 'fc5e8767b4564f34a0d2ce2375fcc92e');
INSERT INTO `sys_role_fhbutton` VALUES ('d51dc41918b040a78a021c9a43caf8d5', '68f8e4a39efe47c7bb869e9d15ab925d', 'da7fd386de0b49ce809984f5919022b8');
INSERT INTO `sys_role_fhbutton` VALUES ('d80abc961d594f75b65e90d5b7437aa9', '3', 'cc51b694d5344d28a9aa13c84b7166cd');
INSERT INTO `sys_role_fhbutton` VALUES ('f0329033d0914faf8ea6e9ff252cc5e6', '68f8e4a39efe47c7bb869e9d15ab925d', '46992ea280ba4b72b29dedb0d4bc0106');
INSERT INTO `sys_role_fhbutton` VALUES ('f627982cc9d4479dbc03af726dc6ac58', 'de9de2f006e145a29d52dfadda295353', 'cc51b694d5344d28a9aa13c84b7166cd');
INSERT INTO `sys_role_fhbutton` VALUES ('f919c1f620634bdaa353a9f63194a2e0', '3', '3542adfbda73410c976e185ffe50ad06');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `SKIN` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `PHONE` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('0223e246d2c94ffeb57ca8b89e3a0d2d', 'totoru', 'fdd53a781f4bdccdcf0b6d35327cc47269c484c1', 'totoru', '', '3', '2017-06-10 10:31:40', '0:0:0:0:0:0:0:1', '0', '注册用户', 'default', '222@123.com', '', '');
INSERT INTO `sys_user` VALUES ('1', 'admin', 'de41b7fb99201d8334c23c014db35ecd92df81bc', 'Sommer', '1133671055321055258374707980945218933803269864762743594642571294', '1', '2017-06-12 13:38:29', '0:0:0:0:0:0:0:1', '0', 'admin', 'default', 'QQ313596790@main.com', '001', '18788888888');
INSERT INTO `sys_user` VALUES ('151aeac5570e4059b06329b65095f6a6', 'w5', 'b59f639d71549e18865961c6872a6140dcbb3c6c', 'ssssw', '', 'de9de2f006e145a29d52dfadda295353', '', '', '0', '121312', 'default', '121212121@qq.com', '21312312', '13798585856');
INSERT INTO `sys_user` VALUES ('280417faf62348ad82de85fa82206c85', 'w3', 'd77c1e457d6af24fa0bf31f0c08c331aaa15fd44', 'kkl', '', '68f8e4a39efe47c7bb869e9d15ab925d', '', '', '0', 'q1', 'default', '25222222@qq.com', '33656', '13796586965');
INSERT INTO `sys_user` VALUES ('488a7a0566594b54b2c988daed8abfa3', 'longmao', '5cc786f9f333110e71359738756c0bfc258eae34', 'LONGMAO', '', '3', '2017-04-27 13:10:08', '0:0:0:0:0:0:0:1', '0', '注册用户', 'default', 'LONGMAO@163.COM', '', '');
INSERT INTO `sys_user` VALUES ('69177258a06e4927b4639ab1684c3320', 'san', '9b69448e5ac7f9e7544732aaba4bb8e8885ccbe1', '三', '', '3264c8e83d0248bb9e3ea6195b4c0216', '2017-04-26 10:54:28', '0:0:0:0:0:0:0:1', '0', '111', 'default', '978336446@qq.com', '333', '13562202556');
INSERT INTO `sys_user` VALUES ('69a8805832814c78b61563b6e787bd40', 'w2', 'a5815a141484a0a71ac71a11ca2faf5f7c67e8e7', 'wwqw', '', 'de9de2f006e145a29d52dfadda295353', '', '', '0', '1121', 'default', '12111111@qq.com', '121212', '13562202225');
INSERT INTO `sys_user` VALUES ('896496bf0906410d8495110e1b14f69e', 'oo1', '6a3833e90aeb440deba899cc9b39fbc79c18a946', 'D1', '', '68f8e4a39efe47c7bb869e9d15ab925d', '', '', '0', '121', 'default', 'pppp@qq.com', '12ww', '13793758969');
INSERT INTO `sys_user` VALUES ('9991f4d7782a4ccfb8a65bd96ea7aafa', 'lisi', 'f7a1aa35ea79412686f009eef0e22f96ffbd476d', '李四', '', '3264c8e83d0248bb9e3ea6195b4c0216', '2017-04-27 12:09:50', '127.0.0.1', '0', '小李', 'default', '313596790@qq.com', '1102', '13566233663');
INSERT INTO `sys_user` VALUES ('9a89f6cd9b654b71b39c6f8c6a54d6df', 's2', '796927602c27126ba11cb413b8549e8dc9c20fad', 'qwq', '', 'de9de2f006e145a29d52dfadda295353', '', '', '0', 'qq1', 'default', 'wwwwww@qq.com', '121211212', '13797858569');
INSERT INTO `sys_user` VALUES ('e128d0b8807b4a128d6390c44a6accef', 'tt1', '92617286a7ea59a8674463ea055e4fc727fb62b4', 'sss', '', '68f8e4a39efe47c7bb869e9d15ab925d', '', '', '0', 'ww', 'default', 'qqqqq@qq.com', '122121', '13793736586');
INSERT INTO `sys_user` VALUES ('e29149962e944589bb7da23ad18ddeed', 'zhangsan', 'c2da1419caf053885c492e10ebde421581cdc03f', '张三', '', '3264c8e83d0248bb9e3ea6195b4c0216', '', '', '0', '小张', 'default', 'zhangsan@www.com', '1101', '2147483647');
INSERT INTO `sys_user` VALUES ('eded77bdf35347249b2bacfa181c869d', 'w1', 'c46e5c325e9edfbf213d5d82018ba3c522eabbea', '1212', '', '68f8e4a39efe47c7bb869e9d15ab925d', '', '', '0', '111', 'default', '1111116@qq.com', '112', '13566625555');

-- ----------------------------
-- Table structure for sys_userphoto
-- ----------------------------
DROP TABLE IF EXISTS `sys_userphoto`;
CREATE TABLE `sys_userphoto` (
  `USERPHOTO_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(30) DEFAULT NULL COMMENT '用户名',
  `PHOTO0` varchar(255) DEFAULT NULL COMMENT '原图',
  `PHOTO1` varchar(100) DEFAULT NULL COMMENT '头像1',
  `PHOTO2` varchar(100) DEFAULT NULL COMMENT '头像2',
  `PHOTO3` varchar(100) DEFAULT NULL COMMENT '头像3',
  PRIMARY KEY (`USERPHOTO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_userphoto
-- ----------------------------

-- ----------------------------
-- Table structure for tb_attached
-- ----------------------------
DROP TABLE IF EXISTS `tb_attached`;
CREATE TABLE `tb_attached` (
  `ATTACHED_ID` varchar(100) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT '名称',
  `FDESCRIBE` varchar(255) DEFAULT NULL COMMENT '描述',
  `PRICE` double(11,2) DEFAULT NULL COMMENT '价格',
  `CTIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ATTACHED_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_attached
-- ----------------------------
INSERT INTO `tb_attached` VALUES ('60d05d8e7d9046a4893f8bdaa34d6488', 'eee', 'ee', '22.00', '2016-04-22 15:33:23');
INSERT INTO `tb_attached` VALUES ('d74b6f507e784607b8f85e31e3cfad22', 'AA', 'aaa', '222.00', '2016-04-17 18:20:41');

-- ----------------------------
-- Table structure for tb_attachedmx
-- ----------------------------
DROP TABLE IF EXISTS `tb_attachedmx`;
CREATE TABLE `tb_attachedmx` (
  `ATTACHEDMX_ID` varchar(100) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT '名称',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `CTIME` varchar(32) DEFAULT NULL COMMENT '创建日期',
  `PRICE` double(11,2) DEFAULT NULL COMMENT '单价',
  `ATTACHED_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ATTACHEDMX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_attachedmx
-- ----------------------------
INSERT INTO `tb_attachedmx` VALUES ('04717d1a034c4e51aacd5e062a4c63bd', 'ddd', 'ddd', '2016-03-29', '111.00', 'd74b6f507e784607b8f85e31e3cfad22');
INSERT INTO `tb_attachedmx` VALUES ('4394c6ace3d44b17a635de56f5c9a271', 'sss', 'ss', '2016-11-29', '1.00', '60d05d8e7d9046a4893f8bdaa34d6488');
INSERT INTO `tb_attachedmx` VALUES ('7992c783fd0b476d90be363858a941ba', 'ddd', 'ddsds', '2016-04-06', '222.00', 'd74b6f507e784607b8f85e31e3cfad22');

-- ----------------------------
-- Table structure for tb_pictures
-- ----------------------------
DROP TABLE IF EXISTS `tb_pictures`;
CREATE TABLE `tb_pictures` (
  `PICTURES_ID` varchar(100) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `NAME` varchar(255) DEFAULT NULL COMMENT '文件名',
  `PATH` varchar(255) DEFAULT NULL COMMENT '路径',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `MASTER_ID` varchar(255) DEFAULT NULL COMMENT '属于',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`PICTURES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_pictures
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `enabled` bit(1) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_jreodf78a7pl5qidfh43axdfb` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FK_it77eq964jhfqtu54081ebtio` (`role_id`),
  CONSTRAINT `FK_apcc8lxk2xnug8377fatvbn04` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_it77eq964jhfqtu54081ebtio` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_command
-- ----------------------------
DROP TABLE IF EXISTS `weixin_command`;
CREATE TABLE `weixin_command` (
  `COMMAND_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `COMMANDCODE` varchar(255) DEFAULT NULL COMMENT '应用路径',
  `CREATETIME` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(1) NOT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`COMMAND_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_command
-- ----------------------------
INSERT INTO `weixin_command` VALUES ('2636750f6978451b8330874c9be042c2', '锁定服务器', 'rundll32.exe user32.dll,LockWorkStation', '2015-05-10 21:25:06', '1', '锁定计算机');
INSERT INTO `weixin_command` VALUES ('46217c6d44354010823241ef484f7214', '打开浏览器', 'C:/Program Files/Internet Explorer/iexplore.exe', '2015-05-09 02:43:02', '1', '打开浏览器操作');
INSERT INTO `weixin_command` VALUES ('854a157c6d99499493f4cc303674c01f', '关闭QQ', 'taskkill /f /im qq.exe', '2015-05-10 21:25:46', '1', '关闭QQ');
INSERT INTO `weixin_command` VALUES ('ab3a8c6310ca4dc8b803ecc547e55ae7', '打开QQ', 'D:\\Program Files (x86)\\Tencent\\QQ\\Bin\\QQScLauncher.exe', '2015-05-10 21:25:25', '1', '打开QQ');

-- ----------------------------
-- Table structure for weixin_imgmsg
-- ----------------------------
DROP TABLE IF EXISTS `weixin_imgmsg`;
CREATE TABLE `weixin_imgmsg` (
  `IMGMSG_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(11) NOT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `TITLE1` varchar(255) DEFAULT NULL COMMENT '标题1',
  `DESCRIPTION1` varchar(255) DEFAULT NULL COMMENT '描述1',
  `IMGURL1` varchar(255) DEFAULT NULL COMMENT '图片地址1',
  `TOURL1` varchar(255) DEFAULT NULL COMMENT '超链接1',
  `TITLE2` varchar(255) DEFAULT NULL COMMENT '标题2',
  `DESCRIPTION2` varchar(255) DEFAULT NULL COMMENT '描述2',
  `IMGURL2` varchar(255) DEFAULT NULL COMMENT '图片地址2',
  `TOURL2` varchar(255) DEFAULT NULL COMMENT '超链接2',
  `TITLE3` varchar(255) DEFAULT NULL COMMENT '标题3',
  `DESCRIPTION3` varchar(255) DEFAULT NULL COMMENT '描述3',
  `IMGURL3` varchar(255) DEFAULT NULL COMMENT '图片地址3',
  `TOURL3` varchar(255) DEFAULT NULL COMMENT '超链接3',
  `TITLE4` varchar(255) DEFAULT NULL COMMENT '标题4',
  `DESCRIPTION4` varchar(255) DEFAULT NULL COMMENT '描述4',
  `IMGURL4` varchar(255) DEFAULT NULL COMMENT '图片地址4',
  `TOURL4` varchar(255) DEFAULT NULL COMMENT '超链接4',
  `TITLE5` varchar(255) DEFAULT NULL COMMENT '标题5',
  `DESCRIPTION5` varchar(255) DEFAULT NULL COMMENT '描述5',
  `IMGURL5` varchar(255) DEFAULT NULL COMMENT '图片地址5',
  `TOURL5` varchar(255) DEFAULT NULL COMMENT '超链接5',
  `TITLE6` varchar(255) DEFAULT NULL COMMENT '标题6',
  `DESCRIPTION6` varchar(255) DEFAULT NULL COMMENT '描述6',
  `IMGURL6` varchar(255) DEFAULT NULL COMMENT '图片地址6',
  `TOURL6` varchar(255) DEFAULT NULL COMMENT '超链接6',
  `TITLE7` varchar(255) DEFAULT NULL COMMENT '标题7',
  `DESCRIPTION7` varchar(255) DEFAULT NULL COMMENT '描述7',
  `IMGURL7` varchar(255) DEFAULT NULL COMMENT '图片地址7',
  `TOURL7` varchar(255) DEFAULT NULL COMMENT '超链接7',
  `TITLE8` varchar(255) DEFAULT NULL COMMENT '标题8',
  `DESCRIPTION8` varchar(255) DEFAULT NULL COMMENT '描述8',
  `IMGURL8` varchar(255) DEFAULT NULL COMMENT '图片地址8',
  `TOURL8` varchar(255) DEFAULT NULL COMMENT '超链接8',
  PRIMARY KEY (`IMGMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_imgmsg
-- ----------------------------
INSERT INTO `weixin_imgmsg` VALUES ('380b2cb1f4954315b0e20618f7b5bd8f', '首页', '2015-05-10 20:51:09', '1', '图文回复', '图文回复标题', '图文回复描述', 'http://a.hiphotos.baidu.com/image/h%3D360/sign=c6c7e73ebc389b5027ffe654b535e5f1/a686c9177f3e6709392bb8df3ec79f3df8dc55e3.jpg', 'http://eparking-site.tunnel.qydev.com/main/index', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for weixin_key
-- ----------------------------
DROP TABLE IF EXISTS `weixin_key`;
CREATE TABLE `weixin_key` (
  `KEY_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '用户名',
  `APPID` varchar(100) DEFAULT NULL COMMENT 'appid',
  `APPSECRET` varchar(100) DEFAULT NULL COMMENT 'appsecret',
  `ACCESS_TOKEN` varchar(100) DEFAULT NULL COMMENT 'access_token',
  `CREATETIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `WXUSERNAME` varchar(100) DEFAULT NULL COMMENT '公众号',
  PRIMARY KEY (`KEY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_key
-- ----------------------------
INSERT INTO `weixin_key` VALUES ('d9d812da00dd41eabc0796dbf3dc57d1', 'sommer78', 'wxa908145f61803a3f', 'b592e2ece0f36b10921589f5e0f37d08', '', '2017-04-27 16:00:43', 'totoru78', 'totoru78');

-- ----------------------------
-- Table structure for weixin_mymenu
-- ----------------------------
DROP TABLE IF EXISTS `weixin_mymenu`;
CREATE TABLE `weixin_mymenu` (
  `MYMENU_ID` varchar(100) NOT NULL,
  `WXUSERNAME` varchar(100) DEFAULT NULL COMMENT '公众号',
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '用户名',
  `TITLE` varchar(30) DEFAULT NULL COMMENT '菜单名称',
  `TYPE` varchar(10) DEFAULT NULL COMMENT '类型',
  `CONTENT` varchar(100) DEFAULT NULL COMMENT '指向',
  `XID` varchar(10) DEFAULT NULL COMMENT 'XID',
  PRIMARY KEY (`MYMENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_mymenu
-- ----------------------------
INSERT INTO `weixin_mymenu` VALUES ('04c050296bbe42b7a3554283d7273901', 'totoru78', 'sommer78', '', '', '', 'M22');
INSERT INTO `weixin_mymenu` VALUES ('094bcba07c72412290a7148a8d170fa5', 'totoru78', 'sommer78', '', '', '', 'M32');
INSERT INTO `weixin_mymenu` VALUES ('0953206582e34907a435dc45ff8d029e', 'totoru78', 'sommer78', '', '', '', 'M3');
INSERT INTO `weixin_mymenu` VALUES ('0e3bfac84b4d45fc999b9e310d3fdfca', 'totoru78', 'sommer78', '', '', '', 'M25');
INSERT INTO `weixin_mymenu` VALUES ('1015d042212d4a95a0f15ba15551fabd', 'totoru78', 'sommer78', '', '', '', 'M2');
INSERT INTO `weixin_mymenu` VALUES ('10308a291667410485cb1b8534e5fbe1', 'totoru78', 'sommer78', '', '', '', 'M12');
INSERT INTO `weixin_mymenu` VALUES ('2516813a9c91411aa9e241981ba22683', 'totoru78', 'sommer78', '', '', '', 'M14');
INSERT INTO `weixin_mymenu` VALUES ('3699057f4d2f4a9a8b6d03ee6b9777a7', 'totoru78', 'sommer78', '', '', '', 'M33');
INSERT INTO `weixin_mymenu` VALUES ('6145a30f06fb4ab08bb8ab2a74b32adc', 'totoru78', 'sommer78', '', '', '', 'M15');
INSERT INTO `weixin_mymenu` VALUES ('62ce46461839440893f673248c7b059d', 'totoru78', 'sommer78', '', '', '', 'M13');
INSERT INTO `weixin_mymenu` VALUES ('6f1d61f9d86b421cacc42bebffb3be08', 'totoru78', 'sommer78', '', '', '', 'M35');
INSERT INTO `weixin_mymenu` VALUES ('9865a808afd14096af015936af3b2f1f', 'totoru78', 'sommer78', '停车场', 'view', 'eparking-site.tunnel.qydev.com', 'M11');
INSERT INTO `weixin_mymenu` VALUES ('ab2a625113124207af7ac1ce7a86af94', 'totoru78', 'sommer78', '停车场主页', '', '', 'M1');
INSERT INTO `weixin_mymenu` VALUES ('b27f12a4496e4b1eb8421d3ac4be1968', 'totoru78', 'sommer78', '', '', '', 'M24');
INSERT INTO `weixin_mymenu` VALUES ('cdc57075da59456dbb0522a422d47e7c', 'totoru78', 'sommer78', '', '', '', 'M21');
INSERT INTO `weixin_mymenu` VALUES ('d16e22bbdc4e46fc8e0d0b2cd811a870', 'totoru78', 'sommer78', '', '', '', 'M34');
INSERT INTO `weixin_mymenu` VALUES ('d43764b77e7545d39e4c377b23156f3a', 'totoru78', 'sommer78', '', '', '', 'M31');
INSERT INTO `weixin_mymenu` VALUES ('dba9b4a403d04ef8bc0f17b1ed4f2e4e', 'totoru78', 'sommer78', '', '', '', 'M23');

-- ----------------------------
-- Table structure for weixin_textmsg
-- ----------------------------
DROP TABLE IF EXISTS `weixin_textmsg`;
CREATE TABLE `weixin_textmsg` (
  `TEXTMSG_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '内容',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(2) DEFAULT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TEXTMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_textmsg
-- ----------------------------
INSERT INTO `weixin_textmsg` VALUES ('695cd74779734231928a253107ab0eeb', '吃饭', '吃了噢噢噢噢', '2015-05-10 22:52:27', '1', '文本回复');
INSERT INTO `weixin_textmsg` VALUES ('9b64170b94cc48e59468dbef2bd1744f', '老朱', '这是老朱的公众号。', '2017-05-02 09:27:17', '1', '老朱');
INSERT INTO `weixin_textmsg` VALUES ('d4738af7aea74a6ca1a5fb25a98f9acb', '关注', '关注后有你的信息', '2015-05-11 02:12:36', '1', '关注回复');
