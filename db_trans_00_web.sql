/*
Navicat MySQL Data Transfer

Source Server         : LOCAL
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : db_trans_00_web

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-10-05 09:41:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for se_ordenservicio
-- ----------------------------
DROP TABLE IF EXISTS `se_ordenservicio`;
CREATE TABLE `se_ordenservicio` (
  `id_control` int(11) NOT NULL COMMENT 'ID DE LA EMPRESA DE TRANSPORTE',
  `nro_orden` varchar(11) NOT NULL COMMENT 'NUMERO DE ORDEN DE TRANSPORTE',
  `id_empleado` int(11) NOT NULL COMMENT 'ID DEL EMPLEADO',
  `fh_orden` varchar(10) NOT NULL COMMENT 'FECHA DE LA ORDEN DE TRANSPORTE',
  `nro_ordenA` varchar(11) DEFAULT NULL COMMENT 'NUMERO DE ORDEN DE ADUANA',
  `ruc_clte` varchar(11) NOT NULL COMMENT 'RUC DEL CLIENTE',
  `name_clte` varchar(200) NOT NULL COMMENT 'NOMBRE DEL CLIENTE',
  `tipo_serv` varchar(2) NOT NULL COMMENT 'TIPO DE SERVICIO MI-ME-AI-AE-DI-TR',
  `tipo_flete` char(1) NOT NULL COMMENT 'TIPO DE ENVIO: CONTENEDOR-CARGA SUELTA',
  `resumerc` text COMMENT 'RESUMEN DE MERCADERIA',
  `observacion` varchar(255) DEFAULT NULL COMMENT 'OBSERVACION DE LA ORDEN DE TRANSPORTE',
  `fh_reg` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'FECHA DE REGISTRO',
  PRIMARY KEY (`id_control`,`nro_orden`),
  KEY `fk_se_ordenservicio__empleado` (`id_empleado`),
  KEY `fk_se_ordenservicio___servicio` (`tipo_serv`),
  CONSTRAINT `fk_se_ordenservicio___servicio` FOREIGN KEY (`tipo_serv`) REFERENCES `_servicio` (`tipo_serv`),
  CONSTRAINT `fk_se_ordenservicio__empleado` FOREIGN KEY (`id_empleado`) REFERENCES `_empleado` (`id_empleado`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of se_ordenservicio
-- ----------------------------
INSERT INTO `se_ordenservicio` VALUES ('2', '17/00000900', '14', '2017-08-07', '17/00000100', '20600791771', 'AGRO INDUSTRIAL INKA WORLD S.A.C.', 'DI', '1', 'RESINA', 'SER PUNTUALES', '2017-08-07 11:33:27');
INSERT INTO `se_ordenservicio` VALUES ('3', '17/00000901', '14', '2017-08-08', '17/00000100', '20600791771', 'AGRO INDUSTRIAL INKA WORLD S.A.C.', 'ME', '1', 'RESINA', 'SER PUNTUALES', '2017-08-07 11:33:27');
INSERT INTO `se_ordenservicio` VALUES ('4', '17/00000902', '14', '2017-08-09', '17/00000100', '20600791771', 'AGRO INDUSTRIAL INKA WORLD S.A.C.', 'TR', '1', 'RESINA', 'SER PUNTUALES', '2017-08-07 11:33:27');
INSERT INTO `se_ordenservicio` VALUES ('5', '17/00000903', '14', '2017-08-09', '17/00000100', '20600791771', 'AGRO INDUSTRIAL INKA WORLD S.A.C.', 'TR', '1', 'RESINA', 'SER PUNTUALES', '2017-08-07 11:33:27');

-- ----------------------------
-- Table structure for se_ordenservicio_deta
-- ----------------------------
DROP TABLE IF EXISTS `se_ordenservicio_deta`;
CREATE TABLE `se_ordenservicio_deta` (
  `id_control` int(11) NOT NULL COMMENT 'ID DE LA EMPRESA DE TRANSPORTE',
  `nro_orden` varchar(11) NOT NULL COMMENT 'NUMERO DE ORDEN DE TRANSPORTE',
  `viaje` int(11) NOT NULL COMMENT 'NUMERO DE VIAJE',
  `chofer` varchar(20) NOT NULL COMMENT 'BREVETE DEL CHOFER',
  `vehiculo` varchar(7) DEFAULT NULL COMMENT 'PLACA DEL VEHICULO',
  `tipo_merc` char(1) NOT NULL,
  `nro_guiaT` varchar(11) DEFAULT NULL COMMENT 'NUMERO DE GUIA DE TRANSPORTISTA',
  `depoCod_P` varchar(6) NOT NULL COMMENT 'CODIGO DEL DEPOSITO DE PUNTO DE PARTIDA',
  `depoNom_P` varchar(70) DEFAULT NULL COMMENT 'NOMBRE DEL DEPOSITO DE PUNTO DE PARTIDA',
  `dire_P` varchar(200) DEFAULT NULL COMMENT 'DIRECCION DEL DEPOSITO DE PUNTO DE PARTIDA',
  `ubigeo_P` varchar(6) DEFAULT NULL COMMENT 'UBIGEO DEL DEPOSITO DE PUNTO DE PARTIDA',
  `lat_P` float(10,5) DEFAULT NULL,
  `lon_P` float(10,5) DEFAULT NULL,
  `depoCod_L` varchar(6) NOT NULL COMMENT 'CODIGO DEL DEPOSITO DE PUNTO DE LLEGADA',
  `depoNom_L` varchar(70) DEFAULT NULL COMMENT 'NOMBRE DEL DEPOSITO DE PUNTO DE LLEGADA',
  `dire_L` varchar(200) DEFAULT NULL COMMENT 'DIRECCION DEL DEPOSITO DE PUNTO DE LLEGADA',
  `ubigeo_L` varchar(6) DEFAULT NULL COMMENT 'UBIGEO DEL DEPOSITO DE PUNTO DE LLEGADA',
  `lat_L` float(10,5) DEFAULT NULL,
  `lon_L` float(10,5) DEFAULT NULL,
  `fh_lleptoent_p` datetime DEFAULT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '0' COMMENT 'ESTADO DEL VIAJE (1) EJECUTADO ,(0) POR EJECUTAR',
  PRIMARY KEY (`id_control`,`nro_orden`,`viaje`),
  KEY `fk_se_ordenservicio_deta___mercaderia` (`tipo_merc`),
  CONSTRAINT `fk_se_ordenservicio_deta___mercaderia` FOREIGN KEY (`tipo_merc`) REFERENCES `_mercaderia` (`tipo_merc`),
  CONSTRAINT `fk_se_ordenservicio_deta__se_ordenservicio` FOREIGN KEY (`id_control`, `nro_orden`) REFERENCES `se_ordenservicio` (`id_control`, `nro_orden`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of se_ordenservicio_deta
-- ----------------------------
INSERT INTO `se_ordenservicio_deta` VALUES ('2', '17/00000900', '1', 'Q06919557', 'F5P-801', '6', 'LUN', '3550', 'INICIO', 'AV. CABO GUTARRA 530', '070101', '-12.08254', '-77.06378', '0001', 'UPC SI', 'PANAMERICANA NORTE 794 PUERTO SUPE - BARRANCA', '150201', '-12.08763', '-77.05011', '2017-08-07 10:00:00', '0');
INSERT INTO `se_ordenservicio_deta` VALUES ('2', '17/00000900', '2', 'Q06661530', 'V3C-852', '6', '2', '3550', 'INICIO', 'AV. CABO GUTARRA 530', '070101', '-12.08254', '-77.06378', '0001', 'UTP 28', 'PANAMERICANA NORTE 794 PUERTO SUPE - BARRANCA', '150201', '-12.06485', '-77.03688', '2017-08-07 11:00:00', '0');
INSERT INTO `se_ordenservicio_deta` VALUES ('2', '17/00000900', '3', 'A00256480', 'F5P-801', '6', '', '3550', 'INICIO', 'AV. CABO GUTARRA 530', '070101', '-12.08254', '-77.06378', '0001', 'UTP 28 2', 'PANAMERICANA NORTE 794 PUERTO SUPE - BARRANCA', '150201', '-12.06485', '-77.03688', '2017-08-07 11:30:00', '0');
INSERT INTO `se_ordenservicio_deta` VALUES ('2', '17/00000900', '4', 'Q06661530', 'V3C-852', '6', 'EUNICE LARA', '3550', 'INICIO', 'AV. CABO GUTARRA 530', '070101', '-12.08254', '-77.06378', '0001', 'PARQUE KENNEDY', 'PANAMERICANA NORTE 794 PUERTO SUPE - BARRANCA', '150201', '-12.12201', '-77.03077', '2017-08-08 10:00:00', '0');
INSERT INTO `se_ordenservicio_deta` VALUES ('3', '17/00000901', '1', 'Q06661530', 'V3C-852', '6', 'EUNICE LARA', '3550', 'INICIO', 'AV. CABO GUTARRA 530', '070101', '-12.08254', '-77.06378', '0001', 'PARQUE KENNEDY', 'PANAMERICANA NORTE 794 PUERTO SUPE - BARRANCA', '150201', '-12.12201', '-77.03077', '2017-08-08 10:00:00', '0');
INSERT INTO `se_ordenservicio_deta` VALUES ('3', '17/00000901', '2', 'Q06661530', 'V3C-852', '6', 'EUNICE LARA', '3550', 'PUENTE BARRANCO', 'BARRANCO', '070101', '-12.14909', '-77.02272', '0001', 'BCP CHORRILLOS', 'PANAMERICANA NORTE 794 PUERTO SUPE - BARRANCA', '150201', '-12.17940', '-77.01488', '2017-08-08 10:00:00', '0');

-- ----------------------------
-- Table structure for se_ordenservicio_deta_cnt
-- ----------------------------
DROP TABLE IF EXISTS `se_ordenservicio_deta_cnt`;
CREATE TABLE `se_ordenservicio_deta_cnt` (
  `id_control` int(11) NOT NULL COMMENT 'ID DE LA EMPRESA DE TRANSPORTE',
  `nro_orden` varchar(11) NOT NULL COMMENT 'NUMERO DE ORDEN DE TRANSPORTE',
  `viaje` int(11) NOT NULL COMMENT 'NUMERO DE VIAJE',
  `num_cnt` varchar(40) DEFAULT NULL COMMENT 'NUMERO DEL CONTENEDOR',
  `num_cnt_tras` varchar(40) DEFAULT NULL,
  `capa_cnt` varchar(2) DEFAULT NULL COMMENT 'CAPACIDAD DEL CONTENEDOR 20-40',
  `tipo_cnt` varchar(2) DEFAULT NULL COMMENT 'TIPO DEL CONTENEDOR ST..',
  PRIMARY KEY (`id_control`,`nro_orden`,`viaje`),
  CONSTRAINT `fk_se_ordenservicio_deta_cnt__se_ordenservicio` FOREIGN KEY (`id_control`, `nro_orden`, `viaje`) REFERENCES `se_ordenservicio_deta` (`id_control`, `nro_orden`, `viaje`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of se_ordenservicio_deta_cnt
-- ----------------------------
INSERT INTO `se_ordenservicio_deta_cnt` VALUES ('2', '17/00000900', '1', 'CAXU7435903', 'MSKU6415777', '40', 'ST');
INSERT INTO `se_ordenservicio_deta_cnt` VALUES ('2', '17/00000900', '2', 'MSKU6415777', null, '40', 'ST');
INSERT INTO `se_ordenservicio_deta_cnt` VALUES ('2', '17/00000900', '3', 'MSKU6477974', null, '40', 'ST');
INSERT INTO `se_ordenservicio_deta_cnt` VALUES ('2', '17/00000900', '4', 'MSKU6489471', null, '40', 'ST');

-- ----------------------------
-- Table structure for se_ordenservicio_deta_css
-- ----------------------------
DROP TABLE IF EXISTS `se_ordenservicio_deta_css`;
CREATE TABLE `se_ordenservicio_deta_css` (
  `id_control` int(11) NOT NULL COMMENT 'ID DE LA EMPRESA DE TRANSPORTE',
  `nro_orden` varchar(11) NOT NULL COMMENT 'NUMERO DE ORDEN DE TRANSPORTE',
  `viaje` int(11) NOT NULL COMMENT 'NUMERO DE VIAJE',
  `cantidad` int(11) DEFAULT NULL COMMENT 'CANTIDAD DE BULTO',
  `tipo_bulto` varchar(150) DEFAULT NULL COMMENT 'TIPO DE BULTO',
  `peso_bruto` double(13,3) DEFAULT NULL COMMENT 'KILOS BRUTO',
  `largo` double(11,2) DEFAULT NULL COMMENT 'LARGO DE LA CARGA',
  `ancho` double(11,2) DEFAULT NULL COMMENT 'ANCHO DE LA CARGA',
  `alto` double(11,2) DEFAULT NULL COMMENT 'ALTO DE LA CARGA',
  `peso_vol` double(11,2) DEFAULT NULL COMMENT 'PESO VOLUMEN DE LA CARGA',
  `volumen` double(11,2) DEFAULT NULL COMMENT 'VOLUMEN DE LA CARGA',
  PRIMARY KEY (`id_control`,`nro_orden`,`viaje`),
  CONSTRAINT `fk_se_ordenservicio_deta_css__se_ordenservicio` FOREIGN KEY (`id_control`, `nro_orden`, `viaje`) REFERENCES `se_ordenservicio_deta` (`id_control`, `nro_orden`, `viaje`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of se_ordenservicio_deta_css
-- ----------------------------

-- ----------------------------
-- Table structure for se_ordenservicio_deta_segui
-- ----------------------------
DROP TABLE IF EXISTS `se_ordenservicio_deta_segui`;
CREATE TABLE `se_ordenservicio_deta_segui` (
  `id_control` int(11) NOT NULL COMMENT 'ID DE LA EMPRESA DE TRANSPORTE',
  `nro_orden` varchar(11) NOT NULL COMMENT 'NUMERO DE ORDEN DE TRANSPORTE',
  `viaje` int(11) NOT NULL COMMENT 'NUMERO DE VIAJE',
  `fh_LlePtoCar` datetime DEFAULT NULL COMMENT 'FECHA Y HORA DE LLEGADA AL PUNTO DE CARGA',
  `fh_IniCarga` datetime DEFAULT NULL COMMENT 'FECHA Y HORA DEL INICIO DE LA CARGA',
  `fh_FinCarga` datetime DEFAULT NULL COMMENT 'FECHA Y HORA DEL FIN DE LA CARGA',
  `fh_SalPtoCar` datetime DEFAULT NULL COMMENT 'FECHA Y HORA DE SALIDA DEL PUNTO DE CARGA',
  `fh_LlePtoEnt` datetime DEFAULT NULL COMMENT 'FECHA Y HORA DE LLEGADA AL PUNTO DE ENTREGA',
  `fh_IniDescarga` datetime DEFAULT NULL COMMENT 'FECHA Y HORA DEL INICIO DE LA DESCARGA',
  `fh_FinDescarga` datetime DEFAULT NULL COMMENT 'FECHA Y HORA DEL FIN DE LA DESCARGA',
  `fh_SalPtoEnt` datetime DEFAULT NULL COMMENT 'FECHA Y HORA DE SALIDA DEL PUNTO DE ENTREGA',
  `km_ini` double(12,2) DEFAULT NULL COMMENT 'KILOMETRAJE INICIAL DEL VEHICULO POR VIAJE',
  `km_fin` double(12,2) DEFAULT NULL COMMENT 'KILOMETRAJE FINAL DEL VEHICULO POR VIAJE',
  `combus_ini` double(8,2) DEFAULT NULL COMMENT 'COMBUSTIBLE INICAL DEL VEHICULO POR VIAJE',
  `combus_fin` double(8,2) DEFAULT NULL COMMENT 'COMBUSTIBLE FINAL DEL VEHICULO POR VIAJE',
  PRIMARY KEY (`id_control`,`nro_orden`,`viaje`),
  CONSTRAINT `fk_se_ordenservicio_deta_segui__se_ordenservicio` FOREIGN KEY (`id_control`, `nro_orden`, `viaje`) REFERENCES `se_ordenservicio_deta` (`id_control`, `nro_orden`, `viaje`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of se_ordenservicio_deta_segui
-- ----------------------------
INSERT INTO `se_ordenservicio_deta_segui` VALUES ('2', '17/00000900', '1', '2017-08-11 17:54:52', '2017-08-11 17:55:35', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `se_ordenservicio_deta_segui` VALUES ('2', '17/00000900', '4', '2017-08-11 17:47:33', null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for _bitacora
-- ----------------------------
DROP TABLE IF EXISTS `_bitacora`;
CREATE TABLE `_bitacora` (
  `id_bitacora` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID DE LA BITACORA',
  `id_control` int(11) NOT NULL COMMENT 'ID DE LA EMPRESA DE TRANSPORTE',
  `id_user` int(11) NOT NULL COMMENT 'ID DE LA CUENTA DE USUARIO',
  `ip_adress` varchar(25) DEFAULT NULL,
  `sistema` char(4) NOT NULL,
  `tabla` varchar(40) NOT NULL,
  `proceso` char(40) NOT NULL,
  `desc_proceso` varchar(90) NOT NULL,
  `documento` varchar(50) DEFAULT NULL,
  `fch_hra` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'FECHA Y HORA DE REGISTRO',
  `str_sql` text COMMENT 'CAMBIOS EFECTUADOS',
  PRIMARY KEY (`id_bitacora`),
  KEY `fk_bitacora__user` (`id_user`),
  CONSTRAINT `fk_bitacora__user` FOREIGN KEY (`id_user`) REFERENCES `_user` (`id_user`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=336 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of _bitacora
-- ----------------------------
INSERT INTO `_bitacora` VALUES ('308', '2', '14', '0:0:0:0:0:0:0:1', 'SITR', 'se_ordenservicio_deta', 'UPD', 'SEGUIMIENTO VIAJE MANUAL', '17/00000900-4', '2017-08-11 15:46:03', '{\"id_control\":2,\"nro_orden\":\"17/00000900\",\"id_empleado\":0,\"ordenServicioDetaWS\":{\"viaje\":4,\"nro_guiaT\":\"\",\"ordenServicioDetaSeguiWS\":{\"kmIni\":0.0,\"kmFin\":0.0,\"combusIni\":0.0,\"combusFin\":0.0,\"fhLlePtoCar\":\"Aug 11, 2017 5:00:00 AM\"}}}');
INSERT INTO `_bitacora` VALUES ('309', '2', '14', '0:0:0:0:0:0:0:1', 'SITR', 'se_ordenservicio_deta_segui', 'UPD', 'SEGUIMIENTO VIAJE AUTOMATICO(INI_CARGA)', '17/00000900-4', '2017-08-11 15:46:40', '{\"kmIni\":0.0,\"kmFin\":0.0,\"combusIni\":0.0,\"combusFin\":0.0,\"fhLlePtoCar\":\"Aug 11, 2017 5:00:00 AM\",\"fhIniCarga\":\"Aug 11, 2017 3:46:00 PM\"}');
INSERT INTO `_bitacora` VALUES ('310', '2', '14', '0:0:0:0:0:0:0:1', 'SITR', 'se_ordenservicio_deta', 'UPD', 'SEGUIMIENTO VIAJE MANUAL', '17/00000900-4', '2017-08-11 15:47:59', '{\"id_control\":2,\"nro_orden\":\"17/00000900\",\"id_empleado\":0,\"ordenServicioDetaWS\":{\"viaje\":4,\"nro_guiaT\":\"\",\"ordenServicioDetaSeguiWS\":{\"kmIni\":0.0,\"kmFin\":0.0,\"combusIni\":0.0,\"combusFin\":0.0,\"fhLlePtoCar\":\"Aug 11, 2017 5:00:00 AM\",\"fhIniCarga\":\"Aug 11, 2017 3:46:00 PM\"}}}');
INSERT INTO `_bitacora` VALUES ('311', '2', '14', '0:0:0:0:0:0:0:1', 'SITR', 'se_ordenservicio_deta_segui', 'UPD', 'SEGUIMIENTO VIAJE AUTOMATICO(LLE_PTO_CARGA)', '17/00000900-4', '2017-08-11 15:57:32', '{\"kmIni\":0.0,\"kmFin\":0.0,\"combusIni\":0.0,\"combusFin\":0.0,\"fhLlePtoCar\":\"Aug 11, 2017 3:57:00 PM\"}');
INSERT INTO `_bitacora` VALUES ('312', '2', '14', '0:0:0:0:0:0:0:1', 'SITR', 'se_ordenservicio_deta_segui', 'UPD', 'SEGUIMIENTO VIAJE AUTOMATICO(INI_CARGA)', '17/00000900-4', '2017-08-11 15:58:16', '{\"kmIni\":0.0,\"kmFin\":0.0,\"combusIni\":0.0,\"combusFin\":0.0,\"fhLlePtoCar\":\"Aug 11, 2017 3:57:00 PM\",\"fhIniCarga\":\"Aug 11, 2017 3:58:00 PM\"}');
INSERT INTO `_bitacora` VALUES ('313', '2', '14', '0:0:0:0:0:0:0:1', 'SITR', 'se_ordenservicio_deta_segui', 'UPD', 'SEGUIMIENTO VIAJE AUTOMATICO(FIN_CARGA)', '17/00000900-4', '2017-08-11 15:58:36', '{\"kmIni\":0.0,\"kmFin\":0.0,\"combusIni\":0.0,\"combusFin\":0.0,\"fhLlePtoCar\":\"Aug 11, 2017 3:57:00 PM\",\"fhIniCarga\":\"Aug 11, 2017 3:58:00 PM\",\"fhFinCarga\":\"Aug 11, 2017 3:58:00 PM\"}');
INSERT INTO `_bitacora` VALUES ('314', '2', '14', '0:0:0:0:0:0:0:1', 'SITR', 'se_ordenservicio_deta_segui', 'UPD', 'SEGUIMIENTO VIAJE ', '17/00000900-4', '2017-08-11 15:58:58', '{\"viaje\":4,\"nro_guiaT\":\"xema\"}');
INSERT INTO `_bitacora` VALUES ('315', '2', '14', '0:0:0:0:0:0:0:1', 'SITR', 'se_ordenservicio_deta_segui', 'UPD', 'SEGUIMIENTO VIAJE ', '17/00000900-4', '2017-08-11 16:03:07', '{\"viaje\":4,\"nro_guiaT\":\"xema\"}');
INSERT INTO `_bitacora` VALUES ('316', '2', '14', '0:0:0:0:0:0:0:1', 'SITR', 'se_ordenservicio_deta_segui', 'UPD', 'SEGUIMIENTO VIAJE ', '17/00000900-4', '2017-08-11 16:03:45', '{\"viaje\":4,\"nro_guiaT\":\"xema\"}');
INSERT INTO `_bitacora` VALUES ('317', '2', '14', '0:0:0:0:0:0:0:1', 'SITR', 'se_ordenservicio_deta_segui', 'UPD', 'SEGUIMIENTO VIAJE AUTOMATICO(LLE_PTO_CARGA)', '17/00000900-4', '2017-08-11 16:34:01', '{\"kmIni\":0.0,\"kmFin\":0.0,\"combusIni\":0.0,\"combusFin\":0.0,\"fhLlePtoCar\":\"Aug 11, 2017 4:34:00 PM\"}');
INSERT INTO `_bitacora` VALUES ('318', '2', '14', '0:0:0:0:0:0:0:1', 'SITR', 'se_ordenservicio_deta', 'UPD', 'SEGUIMIENTO VIAJE MANUAL', '17/00000900-4', '2017-08-11 16:34:29', '{\"id_control\":2,\"nro_orden\":\"17/00000900\",\"id_empleado\":0,\"ordenServicioDetaWS\":{\"viaje\":4,\"nro_guiaT\":\"\",\"ordenServicioDetaSeguiWS\":{\"kmIni\":0.0,\"kmFin\":0.0,\"combusIni\":0.0,\"combusFin\":0.0,\"fhLlePtoCar\":\"Aug 11, 2017 4:34:00 PM\",\"fhIniCarga\":\"Aug 11, 2017 1:00:00 PM\"},\"ordenServicioDetaCntWS\":{\"num_cnt_tras\":\"CAXU7435903\"}}}');
INSERT INTO `_bitacora` VALUES ('319', '2', '14', '0:0:0:0:0:0:0:1', 'SITR', 'se_ordenservicio_deta', 'UPD', 'SEGUIMIENTO VIAJE MANUAL', '17/00000900-4', '2017-08-11 16:34:54', '{\"id_control\":2,\"nro_orden\":\"17/00000900\",\"id_empleado\":0,\"ordenServicioDetaWS\":{\"viaje\":4,\"nro_guiaT\":\"xema\",\"ordenServicioDetaSeguiWS\":{\"kmIni\":0.0,\"kmFin\":0.0,\"combusIni\":0.0,\"combusFin\":0.0,\"fhLlePtoCar\":\"Aug 11, 2017 4:34:00 PM\",\"fhIniCarga\":\"Aug 11, 2017 1:00:00 PM\"},\"ordenServicioDetaCntWS\":{\"num_cnt_tras\":\"CAXU7435903\"}}}');
INSERT INTO `_bitacora` VALUES ('320', '2', '14', '0:0:0:0:0:0:0:1', 'SITR', 'se_ordenservicio_deta_segui', 'UPD', 'SEGUIMIENTO VIAJE AUTOMATICO(FIN_CARGA)', '17/00000900-4', '2017-08-11 16:35:28', '{\"kmIni\":0.0,\"kmFin\":0.0,\"combusIni\":0.0,\"combusFin\":0.0,\"fhLlePtoCar\":\"Aug 11, 2017 4:34:00 PM\",\"fhIniCarga\":\"Aug 11, 2017 1:00:00 PM\",\"fhFinCarga\":\"Aug 11, 2017 4:35:00 PM\"}');
INSERT INTO `_bitacora` VALUES ('321', '2', '14', '0:0:0:0:0:0:0:1', 'SITR', 'se_ordenservicio_deta', 'UPD', 'SEGUIMIENTO VIAJE MANUAL', '17/00000900-3', '2017-08-11 16:36:26', '{\"id_control\":2,\"nro_orden\":\"17/00000900\",\"id_empleado\":0,\"ordenServicioDetaWS\":{\"viaje\":3,\"nro_guiaT\":\"\",\"ordenServicioDetaSeguiWS\":{\"kmIni\":0.0,\"kmFin\":0.0,\"combusIni\":0.0,\"combusFin\":0.0,\"fhIniCarga\":\"Aug 17, 2017 10:00:00 AM\"},\"ordenServicioDetaCntWS\":{\"num_cnt_tras\":\"MSKU6477974\"}}}');
INSERT INTO `_bitacora` VALUES ('322', '2', '14', '0:0:0:0:0:0:0:1', 'SITR', 'se_ordenservicio_deta_segui', 'UPD', 'SEGUIMIENTO VIAJE AUTOMATICO(INI_CARGA)', '17/00000900-2', '2017-08-11 16:37:07', '{\"kmIni\":0.0,\"kmFin\":0.0,\"combusIni\":0.0,\"combusFin\":0.0,\"fhIniCarga\":\"Aug 11, 2017 4:37:00 PM\"}');
INSERT INTO `_bitacora` VALUES ('323', '2', '14', '0:0:0:0:0:0:0:1', 'SITR', 'se_ordenservicio_deta_segui', 'UPD', 'SEGUIMIENTO VIAJE AUTOMATICO(INI_CARGA)', '17/00000900-4', '2017-08-11 17:10:03', '{\"kmIni\":0.0,\"kmFin\":0.0,\"combusIni\":0.0,\"combusFin\":0.0,\"fhLlePtoCar\":\"Aug 11, 2017 4:34:00 PM\",\"fhIniCarga\":\"Aug 11, 2017 5:10:00 PM\",\"fhFinCarga\":\"Aug 11, 2017 4:35:00 PM\"}');
INSERT INTO `_bitacora` VALUES ('324', '2', '14', '0:0:0:0:0:0:0:1', 'SITR', 'se_ordenservicio_deta_segui', 'UPD', 'SEGUIMIENTO VIAJE ', '17/00000900-4', '2017-08-11 17:10:34', '{\"viaje\":4,\"nro_guiaT\":\"xema\",\"ordenServicioDetaCntWS\":{\"num_cnt_tras\":\"\"}}');
INSERT INTO `_bitacora` VALUES ('325', '2', '14', '0:0:0:0:0:0:0:1', 'SITR', 'se_ordenservicio_deta_segui', 'UPD', 'SEGUIMIENTO VIAJE ', '17/00000900-4', '2017-08-11 17:11:29', '{\"viaje\":4,\"nro_guiaT\":\"xema\",\"ordenServicioDetaCntWS\":{\"num_cnt_tras\":\"\"}}');
INSERT INTO `_bitacora` VALUES ('326', '2', '14', '0:0:0:0:0:0:0:1', 'SITR', 'se_ordenservicio_deta_segui', 'UPD', 'SEGUIMIENTO VIAJE ', '17/00000900-4', '2017-08-11 17:12:40', '{\"viaje\":4,\"nro_guiaT\":\"xema\",\"ordenServicioDetaCntWS\":{\"num_cnt_tras\":\"\"}}');
INSERT INTO `_bitacora` VALUES ('327', '2', '14', '0:0:0:0:0:0:0:1', 'SITR', 'se_ordenservicio_deta_segui', 'UPD', 'SEGUIMIENTO VIAJE ', '17/00000900-4', '2017-08-11 17:13:23', '{\"viaje\":4,\"nro_guiaT\":\"xema\",\"ordenServicioDetaCntWS\":{\"num_cnt_tras\":\"\"}}');
INSERT INTO `_bitacora` VALUES ('328', '2', '14', '0:0:0:0:0:0:0:1', 'SITR', 'se_ordenservicio_deta_segui', 'UPD', 'SEGUIMIENTO VIAJE ', '17/00000900-1', '2017-08-11 17:16:51', '{\"viaje\":1,\"nro_guiaT\":\"121\",\"ordenServicioDetaCntWS\":{\"num_cnt_tras\":\"MSKU6415777\"}}');
INSERT INTO `_bitacora` VALUES ('329', '2', '14', '0:0:0:0:0:0:0:1', 'SITR', 'se_ordenservicio_deta_segui', 'UPD', 'SEGUIMIENTO VIAJE ', '17/00000900-2', '2017-08-11 17:18:46', '{\"viaje\":2,\"nro_guiaT\":\"2\",\"ordenServicioDetaSeguiWS\":{\"kmIni\":0.0,\"kmFin\":0.0,\"combusIni\":0.0,\"combusFin\":0.0},\"ordenServicioDetaCntWS\":{\"num_cnt_tras\":\"\"}}');
INSERT INTO `_bitacora` VALUES ('330', '2', '14', '0:0:0:0:0:0:0:1', 'SITR', 'se_ordenservicio_deta_segui', 'UPD', 'SEGUIMIENTO VIAJE AUTOMATICO(LLE_PTO_CARGA)', '17/00000900-4', '2017-08-11 17:47:34', '{\"kmIni\":0.0,\"kmFin\":0.0,\"combusIni\":0.0,\"combusFin\":0.0,\"fhLlePtoCar\":\"Aug 11, 2017 5:47:00 PM\"}');
INSERT INTO `_bitacora` VALUES ('331', '2', '14', '0:0:0:0:0:0:0:1', 'SITR', 'se_ordenservicio_deta_segui', 'UPD', 'SEGUIMIENTO VIAJE ', '17/00000900-4', '2017-08-11 17:47:57', '{\"viaje\":4,\"nro_guiaT\":\"xema\",\"ordenServicioDetaSeguiWS\":{\"kmIni\":0.0,\"kmFin\":0.0,\"combusIni\":0.0,\"combusFin\":0.0},\"ordenServicioDetaCntWS\":{\"num_cnt_tras\":\"CAXU7435903\"}}');
INSERT INTO `_bitacora` VALUES ('332', '2', '14', '0:0:0:0:0:0:0:1', 'SITR', 'se_ordenservicio_deta_segui', 'UPD', 'SEGUIMIENTO VIAJE ', '17/00000900-4', '2017-08-11 17:48:29', '{\"viaje\":4,\"nro_guiaT\":\"EUNICE LARA\",\"ordenServicioDetaSeguiWS\":{\"kmIni\":0.0,\"kmFin\":0.0,\"combusIni\":0.0,\"combusFin\":0.0},\"ordenServicioDetaCntWS\":{\"num_cnt_tras\":\"CAXU7435903\"}}');
INSERT INTO `_bitacora` VALUES ('333', '2', '14', '0:0:0:0:0:0:0:1', 'SITR', 'se_ordenservicio_deta_segui', 'UPD', 'SEGUIMIENTO VIAJE AUTOMATICO(LLE_PTO_CARGA)', '17/00000900-1', '2017-08-11 17:54:53', '{\"kmIni\":0.0,\"kmFin\":0.0,\"combusIni\":0.0,\"combusFin\":0.0,\"fhLlePtoCar\":\"Aug 11, 2017 5:54:00 PM\"}');
INSERT INTO `_bitacora` VALUES ('334', '2', '14', '0:0:0:0:0:0:0:1', 'SITR', 'se_ordenservicio_deta_segui', 'UPD', 'SEGUIMIENTO VIAJE ', '17/00000900-1', '2017-08-11 17:55:12', '{\"viaje\":1,\"nro_guiaT\":\"LUN\",\"ordenServicioDetaSeguiWS\":{\"kmIni\":0.0,\"kmFin\":0.0,\"combusIni\":0.0,\"combusFin\":0.0},\"ordenServicioDetaCntWS\":{\"num_cnt_tras\":\"MSKU6415777\"}}');
INSERT INTO `_bitacora` VALUES ('335', '2', '14', '0:0:0:0:0:0:0:1', 'SITR', 'se_ordenservicio_deta_segui', 'UPD', 'SEGUIMIENTO VIAJE AUTOMATICO(INI_CARGA)', '17/00000900-1', '2017-08-11 17:55:35', '{\"kmIni\":0.0,\"kmFin\":0.0,\"combusIni\":0.0,\"combusFin\":0.0,\"fhLlePtoCar\":\"Aug 11, 2017 5:54:00 PM\",\"fhIniCarga\":\"Aug 11, 2017 5:55:00 PM\"}');

-- ----------------------------
-- Table structure for _empleado
-- ----------------------------
DROP TABLE IF EXISTS `_empleado`;
CREATE TABLE `_empleado` (
  `id_control` int(11) NOT NULL COMMENT 'ID DE LA EMPRESA DE TRANSPORTE',
  `id_empleado` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID DEL EMPLEADO',
  `documento` varchar(11) NOT NULL COMMENT 'NUMERO DE DOCUMENTO(DNI)',
  `nombres` varchar(70) NOT NULL COMMENT 'NOMBRES DE EMPLEADO',
  `paterno` varchar(100) NOT NULL COMMENT 'APELLIDO PATERNO DEL EMPLEADO',
  `materno` varchar(100) NOT NULL COMMENT 'APELLIDO MATERNO DEL EMPLEADO',
  `email` varchar(50) DEFAULT NULL COMMENT 'EMAIL DEL EMPLEADO',
  `nivel` enum('U','S') NOT NULL DEFAULT 'U' COMMENT 'NIVEL DEL EMPLEADO U -> Usuario\nS -> Supervisor',
  `telefono` varchar(40) DEFAULT NULL COMMENT 'TELEFONO DEL EMPLEADO',
  `movil1` varchar(20) DEFAULT NULL COMMENT 'CELULAR 1 DEL EMPLEADO',
  `movil2` varchar(20) DEFAULT NULL COMMENT 'CELULAR 2 DEL EMPELADO',
  `tip_trab` varchar(2) DEFAULT NULL COMMENT 'TIPO DE TRABAJADOR',
  `brevete` varchar(20) DEFAULT NULL COMMENT 'BREVETE DEL CHOFER',
  `est_emp` enum('1','0') NOT NULL DEFAULT '1' COMMENT 'ESTADO DEL EMPLEADO (1) ACTIVO ,(0) INACTIVO',
  PRIMARY KEY (`id_empleado`),
  KEY `fk_empleado___control` (`id_control`),
  CONSTRAINT `fk_empleado___control` FOREIGN KEY (`id_control`) REFERENCES `__control` (`id_control`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of _empleado
-- ----------------------------
INSERT INTO `_empleado` VALUES ('1', '1', '99999999', 'SINTAD', '1', '', '', 'S', '', '', '', '**', '', '1');
INSERT INTO `_empleado` VALUES ('1', '2', '20122337449', 'CLI PROYECTOS S.A.C.', '', '', '', 'S', '', '', '', '**', '', '1');
INSERT INTO `_empleado` VALUES ('1', '3', '10210735', 'JUAN JOSE', 'LUJAN', 'RAMOS', 'seguimiento_transporte@cliandina.com', 'U', '', '', '', null, 'Q10310735', '1');
INSERT INTO `_empleado` VALUES ('1', '4', '43723422', 'FRANCO REISER', 'CASTREJON', 'GALLARDO', 'seguimiento_transporte@cliandina.com', 'U', '', '', '', null, 'Q43729422', '1');
INSERT INTO `_empleado` VALUES ('1', '5', '41202936', 'JOSE ALBERTO', 'DURAN', 'VALENZUELA', 'seguimiento_transporte@cliandina.com', 'U', '', '940380994', '', null, 'Q41202936', '1');
INSERT INTO `_empleado` VALUES ('1', '6', '42241194', 'ALDO JIMMI', 'MARTOS', 'GALLARDO', 'seguimiento_transporte@cliandina.com', 'U', '', '', '', null, 'Q42241194', '1');
INSERT INTO `_empleado` VALUES ('1', '7', '9529299', 'CARLOS ALBERTO', 'ZELAYA', 'QUINECHI', 'seguimiento_transporte@cliandina.com', 'U', '', '', '', null, 'Q09529299', '1');
INSERT INTO `_empleado` VALUES ('1', '8', '09474978', 'HEBERT WILMAN', 'LAURA', 'ANDRADE', 'seguimiento_transporte@cliandina.com', 'U', '', '982562650', '', null, 'Q09474978', '1');
INSERT INTO `_empleado` VALUES ('1', '9', '08476965', 'JOSE CARLOS', 'VASQUEZ', 'CRUZ', 'seguimiento_transporte@cliandina.com', 'U', '', '', '', null, 'Q08476965', '1');
INSERT INTO `_empleado` VALUES ('1', '10', '25526578', 'RUBEN ALFONSO', 'PAREDES', 'ROCA', 'seguimiento_transporte@cliandina.com', 'U', '', '', '', null, 'Q25526578', '1');
INSERT INTO `_empleado` VALUES ('1', '11', '08554294', 'ELOY MAXIMO', 'LOPEZ', 'SALAZAR', 'seguimiento_transporte@cliandina.com', 'U', '5651501', '', '', null, 'Q08554294', '1');
INSERT INTO `_empleado` VALUES ('1', '12', '08150866', 'GUNTHER HARRY', 'TAPIA', 'ZANABRIA', 'seguimiento_transporte@cliandina.com', 'U', '7229364', '', '', null, 'Q08150866', '1');
INSERT INTO `_empleado` VALUES ('1', '13', '03836199', 'ROLANDO', 'MARTINEZ', 'PACHERRES', 'seguimiento_transporte@cliandina.com', 'U', '', '', '', null, 'Q03836199', '1');
INSERT INTO `_empleado` VALUES ('2', '14', '99999999', 'SINTAD', '2', '', '', 'S', '', '', '', null, '', '1');
INSERT INTO `_empleado` VALUES ('1', '15', '46815730', 'rafael', 'roman', 'matos', '', 'U', '01325196', '', '', null, '', '1');
INSERT INTO `_empleado` VALUES ('2', '16', '06661530', 'JUAN CARLOS', 'GILAA', 'CHAVEZ', 'seguimie@sintad.net', 'U', '1231232', '', '', null, 'Q06661530', '1');
INSERT INTO `_empleado` VALUES ('2', '17', '87887878787', 'xema', 'xema', 'xema', '', 'S', '', '', '', null, '', '0');
INSERT INTO `_empleado` VALUES ('2', '18', '1e356123123', 'qwqweqw12121', 'qweqweqw', 'wqeqweqw', '', 'U', '', '', '', null, '', '0');
INSERT INTO `_empleado` VALUES ('2', '19', '11111111111', '1123123', '12312', '123123', '', 'U', '', '', '', null, '', '0');
INSERT INTO `_empleado` VALUES ('2', '20', '54254823545', '242332', '234234', '234234', '234234', 'U', '', '', '', null, '', '1');
INSERT INTO `_empleado` VALUES ('2', '21', '99999999999', 'PPPPPPPPPP', 'UYIYUI', 'YUIYUIYU', '', 'U', '', '', '', null, '', '1');
INSERT INTO `_empleado` VALUES ('2', '22', 'hfgsdkfglsd', '423423432', '24234234234', '23423424234234', '', 'U', '', '', '', null, '', '1');
INSERT INTO `_empleado` VALUES ('2', '23', '22222111111', 'habla', 'pess', 'bayuli', '', 'U', '', '', '', null, '', '1');
INSERT INTO `_empleado` VALUES ('2', '24', 'aaaaaaaaaaa', '213123123123', '1231231231', '123123123123', '', 'S', '', '', '', null, '', '1');
INSERT INTO `_empleado` VALUES ('2', '25', '64782367823', 'prueb', 'prueba', 'slksajdlsad', 'asdasd', 'U', 'asd', 'asdas', 'd', null, 'asd', '1');
INSERT INTO `_empleado` VALUES ('2', '26', '88888888888', 'qweqew', 'qweqweqw', 'qweqw', '', 'S', '', '', '', null, '', '1');

-- ----------------------------
-- Table structure for _mercaderia
-- ----------------------------
DROP TABLE IF EXISTS `_mercaderia`;
CREATE TABLE `_mercaderia` (
  `tipo_merc` char(1) NOT NULL DEFAULT '' COMMENT 'CODIGO DEL TIPO DE MERCADERIA',
  `nombre` varchar(70) DEFAULT NULL COMMENT 'NOMBRE DEL TIPO DE MERCADERIA',
  `descrip` varchar(150) DEFAULT NULL COMMENT 'DESCRIPCION OPCIONAL DEL TIPO DE MERCADERIA',
  PRIMARY KEY (`tipo_merc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of _mercaderia
-- ----------------------------
INSERT INTO `_mercaderia` VALUES ('1', 'SECA', '');
INSERT INTO `_mercaderia` VALUES ('2', 'REFRIGERADA', '');
INSERT INTO `_mercaderia` VALUES ('3', 'PELIGROSA', '');
INSERT INTO `_mercaderia` VALUES ('4', 'NO PELIGROSA', '');
INSERT INTO `_mercaderia` VALUES ('5', 'OTRAS', '');
INSERT INTO `_mercaderia` VALUES ('6', 'GENERALES', '');

-- ----------------------------
-- Table structure for _role
-- ----------------------------
DROP TABLE IF EXISTS `_role`;
CREATE TABLE `_role` (
  `id_role` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID DEL ROLE',
  `codigo` char(3) DEFAULT NULL COMMENT 'CODIGO DEL ROLE',
  `role` varchar(50) DEFAULT NULL COMMENT 'DESCRIPCION DEL ROLE',
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of _role
-- ----------------------------
INSERT INTO `_role` VALUES ('1', 'ssa', 'Admin');
INSERT INTO `_role` VALUES ('2', 'usu', 'Usuario de Empresa de Transporte');

-- ----------------------------
-- Table structure for _servicio
-- ----------------------------
DROP TABLE IF EXISTS `_servicio`;
CREATE TABLE `_servicio` (
  `tipo_serv` varchar(2) NOT NULL DEFAULT '' COMMENT 'CODIGO DEL TIPO DE SERVICIO(MI,AI,ME,AE,ETC)',
  `nombre` varchar(70) DEFAULT NULL COMMENT 'NOMBRE DEL TIPO DE SERVICIO',
  `seudonimo` varchar(50) DEFAULT NULL COMMENT 'ALIAS DEL NOMBRE DEL SERVICIO',
  `descrip` varchar(150) DEFAULT NULL COMMENT 'DESCRIPCION OPCIONAL DEL TIPO DE SERVICIO',
  PRIMARY KEY (`tipo_serv`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of _servicio
-- ----------------------------
INSERT INTO `_servicio` VALUES ('**', 'OTROS', 'OTROS', '');
INSERT INTO `_servicio` VALUES ('AE', 'EXPORTACION AEREA', 'EXPO.AEREA', '');
INSERT INTO `_servicio` VALUES ('AI', 'IMPORTACION AEREA', 'IMPO.AEREA', '');
INSERT INTO `_servicio` VALUES ('DI', 'DISTRIBUCION', 'DISTRIBUCION', '');
INSERT INTO `_servicio` VALUES ('ME', 'EXPORTACION MARITIMA', 'EXPO.MARITIMA', '');
INSERT INTO `_servicio` VALUES ('MI', 'IMPORTACION MARITIMA', 'IMPO.MARITIMA', '');
INSERT INTO `_servicio` VALUES ('TR', 'TRASLADO', 'TRASLADO', '');

-- ----------------------------
-- Table structure for _user
-- ----------------------------
DROP TABLE IF EXISTS `_user`;
CREATE TABLE `_user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID DE LA CUENTA DE USUARIO',
  `id_empleado` int(11) NOT NULL COMMENT 'ID DEL EMPLEADO',
  `user` varchar(20) NOT NULL COMMENT 'NOMBRE USUARIO DEL LOGIN',
  `password` varchar(50) NOT NULL COMMENT 'CLAVE DEL USUARIO DEL LOGIN',
  `id_role` int(11) NOT NULL,
  `est_user` enum('1','0') NOT NULL DEFAULT '1' COMMENT 'ESTADO DE LA CUENTA (1) ACTIVO (0) INACTIVO',
  PRIMARY KEY (`id_user`),
  KEY `fk_user__empleado` (`id_empleado`),
  KEY `fk_user__role` (`id_role`),
  CONSTRAINT `fk_user__empleado` FOREIGN KEY (`id_empleado`) REFERENCES `_empleado` (`id_empleado`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_user__role` FOREIGN KEY (`id_role`) REFERENCES `_role` (`id_role`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of _user
-- ----------------------------
INSERT INTO `_user` VALUES ('1', '1', 'sintad', 'e995f72f9677fc31bd0a8605e4c3c794cc0c3736', '2', '1');
INSERT INTO `_user` VALUES ('2', '2', 'transporte', 'de601d9bde5a275e0f06012094580c6b957e52be', '1', '1');
INSERT INTO `_user` VALUES ('3', '3', 'jlujanr', '95c9062917a9cfba754bb37d4d3c93f459ad750e', '2', '1');
INSERT INTO `_user` VALUES ('4', '4', 'fcastrejong', 'c18d2e690aa50a8d615235c6e0343f1cf246bf06', '2', '1');
INSERT INTO `_user` VALUES ('5', '5', 'jduranv', 'bf7a90fa0eacdaaaa0d9269fad645ed418a66c58', '2', '1');
INSERT INTO `_user` VALUES ('6', '6', 'amartosg', '44a89ad2aa9e6546aa2f391c48802f78574f3f69', '2', '1');
INSERT INTO `_user` VALUES ('7', '7', 'czelayaq', '9cc4232d301c7a6c31340f431a913c7b7b6d773a', '2', '1');
INSERT INTO `_user` VALUES ('8', '8', 'hlauraa', '9ba3cb210ffe9a8becb262661ed4b26012a5dd22', '2', '1');
INSERT INTO `_user` VALUES ('9', '9', 'jvasquezc', '5a7e53035e4c1399a525ddf869df72f1e658d36f', '2', '1');
INSERT INTO `_user` VALUES ('10', '10', 'rparedesr', '7664489fbff4ae8f11cc87c3a0a35823e6471d65', '2', '1');
INSERT INTO `_user` VALUES ('11', '11', 'elopezs', 'af2b9609389495861de9b6781129ce841ef8c64c', '2', '1');
INSERT INTO `_user` VALUES ('12', '12', 'gtapiaz', 'c2506e841d58684a03f76f0ec0403f259bf2cf77', '2', '1');
INSERT INTO `_user` VALUES ('13', '13', 'rmartinezp', '63f8896b6f3bd220b0f6309e98ba56de74c130aa', '2', '1');
INSERT INTO `_user` VALUES ('14', '14', 'sintad2', 'e995f72f9677fc31bd0a8605e4c3c794cc0c3736', '2', '1');
INSERT INTO `_user` VALUES ('15', '16', 'freddy', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '2', '1');
INSERT INTO `_user` VALUES ('16', '16', 'xemita', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', '2', '0');
INSERT INTO `_user` VALUES ('17', '21', '342234234', '1410fbfb7f73e9fdad6d83cde0d936a764d65d12', '2', '1');
INSERT INTO `_user` VALUES ('18', '20', 'asdasdasd', '141f87be1330a105a87923f4ee6383bd7de46541', '2', '1');
INSERT INTO `_user` VALUES ('19', '16', 'qweqwe', '93556d499a5d22fa11d04e586f2661f7b9433b72', '2', '1');

-- ----------------------------
-- Table structure for __control
-- ----------------------------
DROP TABLE IF EXISTS `__control`;
CREATE TABLE `__control` (
  `id_control` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID DE LA EMPRESA DE TRANSPORTE',
  `ruc_clte` varchar(11) NOT NULL COMMENT 'RUC DE LA EMPRESA DE TRANSPORTE',
  `cod_agte` varchar(6) NOT NULL COMMENT 'CODIGO DE LA EMPRESA',
  `nombre` varchar(70) NOT NULL COMMENT 'NOMBRE DE LA EMPRESA DE TRANSPORTE',
  `direccion` varchar(255) NOT NULL COMMENT 'DIRECCION DE LA EMPRESA DE TRANSPORTE',
  `email` varchar(50) DEFAULT NULL COMMENT 'EMAIL DE LA EMPRESA DE TRANSPORTE',
  `telefono` varchar(40) DEFAULT NULL COMMENT 'TELEFONO DE LA EMPRESA DE TRANSPORTE',
  `tele_fax` varchar(40) DEFAULT NULL COMMENT 'FAX DE LA EMPRESA DE TRANSPORTE',
  `ger_gral` varchar(50) DEFAULT NULL COMMENT 'GERENTE GENERAL DE LA EMPRESA DE TRANSPORTE',
  `est_clte` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'ESTADO DE LA EMPRESA DE TRANSPORTE (1) ACTIVO, (0) INACTIVO',
  `fch_reg` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'FECHA DE REGISTRO',
  PRIMARY KEY (`id_control`),
  UNIQUE KEY `ruc_clte_UNIQUE` (`ruc_clte`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of __control
-- ----------------------------
INSERT INTO `__control` VALUES ('1', '20122337449', '0000', 'CLI PROYECTOS S.A.C.', 'AV. ELMER FAUCETT NRO. 2879 INT 328 LIMA CARGO CITY.PROV. CONST. DEL CALLAO', '', '', '', '', '1', '2016-10-07 12:34:23');
INSERT INTO `__control` VALUES ('2', '20550458285', '0000', 'ITAW TRANSPORTES S.A.C.', 'MZA. E LOTE. 1 URB. BACILIO LOPEZ SILVA (ALT CDRA 91 DE AV. NESTOR GAMBETTA)PROV. CONST. DEL CALLAO', null, null, null, null, '1', '2017-05-10 16:47:41');

-- ----------------------------
-- Procedure structure for spInsOrdenServicio
-- ----------------------------
DROP PROCEDURE IF EXISTS `spInsOrdenServicio`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsOrdenServicio`(
  IN pRucTransportista VARCHAR(20),
  IN pNroOrden VARCHAR(11),
  IN pDniEmpleado VARCHAR(20),
  IN pFHOrden VARCHAR(10),
  IN pNroOrdenA VARCHAR(11),
  IN pRucClte VARCHAR(20),
  IN pNameClte VARCHAR(100),
  IN pTipoServ VARCHAR(2),
  IN pTipoFlete CHAR(1),
  IN pResumerc TEXT,
  IN pObserv VARCHAR(255)
)
BEGIN
  SET @idConrol:= (SELECT id_control FROM __control WHERE ruc_clte=pRucTransportista);
  SET @idEmpleado:= (SELECT id_empleado FROM _empleado WHERE documento=pDniEmpleado AND id_control=@idConrol);
  INSERT INTO se_ordenservicio(id_control,nro_orden,id_empleado,fh_orden,nro_ordenA,ruc_clte,name_clte,tipo_serv,tipo_flete,resumerc,observacion) VALUES (@idConrol,pNroOrden,@idEmpleado,pFHOrden,pNroOrdenA,pRucClte,pNameClte,pTipoServ,pTipoFlete,pResumerc,pObserv);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for spInsOrdenServicioDet
-- ----------------------------
DROP PROCEDURE IF EXISTS `spInsOrdenServicioDet`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsOrdenServicioDet`(
  IN pRucTransportista VARCHAR(20),
  IN pNroOrden VARCHAR(11),
  IN pViaje INT,
  IN pChofer VARCHAR(20),
  IN pVehiculo VARCHAR(7),
  IN pTipoMerc CHAR(1),
  IN pNroGuiaT VARCHAR(11),
  IN pDepoCodP VARCHAR(6),
  IN pDepoNomP VARCHAR(70),
  IN pDireP VARCHAR(200),
  IN pUbigeoP VARCHAR(6),
  IN pDepoCodL VARCHAR(6),
  IN pDepoNomL VARCHAR(70),
  IN pDireL VARCHAR(200),
  IN pUbigeoL VARCHAR(6),
  IN pFhLlePtoEntP DATETIME
)
BEGIN
  SET @idConrol:= (SELECT id_control FROM __control WHERE ruc_clte=pRucTransportista);
  INSERT INTO se_ordenservicio_deta(id_control,nro_orden,viaje,chofer,vehiculo,tipo_merc,nro_guiaT,depoCod_P,depoNom_P,dire_P,ubigeo_P,depoCod_L,depoNom_L,dire_L,ubigeo_L,fh_lleptoent_p) 
  VALUES(@idConrol,pNroOrden,pViaje,pChofer,pVehiculo,pTipoMerc,pNroGuiaT,pDepoCodP,pDepoNomP,pDireP,pUbigeoP,pDepoCodL,pDepoNomL,pDireL,pUbigeoL,pFhLlePtoEntP);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for spInsOrdenServicioDetCnt
-- ----------------------------
DROP PROCEDURE IF EXISTS `spInsOrdenServicioDetCnt`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsOrdenServicioDetCnt`(
  IN pRucTransportista VARCHAR(20),
  IN pNroOrden VARCHAR(11),
  IN pViaje INT,
  IN pNumCnt VARCHAR(40),
  IN pCapaCnt VARCHAR(2),
  IN pTipoCnt VARCHAR(2)
)
BEGIN
  SET @idConrol:= (SELECT id_control FROM __control WHERE ruc_clte=pRucTransportista);
  INSERT INTO se_ordenservicio_deta_cnt(id_control,nro_orden,viaje,num_cnt,capa_cnt,tipo_cnt) VALUES (@idConrol,pNroOrden,pViaje,pNumCnt,pCapaCnt,pTipoCnt);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for spInsOrdenServicioDetCs
-- ----------------------------
DROP PROCEDURE IF EXISTS `spInsOrdenServicioDetCs`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsOrdenServicioDetCs`(
  IN pRucTransportista VARCHAR(20),
  IN pNroOrden VARCHAR(11),
  IN pViaje INT,
  IN pCantidad INT,
  IN pTipoBulto VARCHAR(150),
  IN pPesoBruto DOUBLE(13,3),
  IN pLargo DOUBLE(11,2),
  IN pAncho DOUBLE(11,2),
  IN pAlto DOUBLE(11,2),
  IN pPesoVol DOUBLE(11,2),
  IN pVolumen DOUBLE(11,2)  
)
BEGIN
  SET @idConrol:= (SELECT id_control FROM __control WHERE ruc_clte=pRucTransportista);
  INSERT INTO se_ordenservicio_deta_css(id_control,nro_orden,viaje,cantidad,tipo_bulto,peso_bruto,largo,ancho,alto,peso_vol,volumen) VALUES (@idConrol,pNroOrden,pViaje,pCantidad,pTipoBulto,pPesoBruto,pLargo,pAncho,pAlto,pPesoVol,pVolumen);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for spInsUpdAutoOrdenServicioDetSegui
-- ----------------------------
DROP PROCEDURE IF EXISTS `spInsUpdAutoOrdenServicioDetSegui`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsUpdAutoOrdenServicioDetSegui`(
  IN pIdControl INT,
  IN pNroOrden VARCHAR(11),
  IN pViaje INT,
  IN pEstado VARCHAR(15),
  IN pNroCntTras VARCHAR(40)
)
BEGIN
  IF( LENGTH( IFNULL(pNroCntTras,'')) > 0 )THEN
  UPDATE se_ordenservicio_deta_cnt SET num_cnt_tras=pNroCntTras WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje;
  END IF;
  IF (SELECT COUNT(*)=0 FROM se_ordenservicio_deta_segui WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje) THEN   
    IF ('LLE_PTO_CARGA' = pEstado) THEN
	  INSERT INTO se_ordenservicio_deta_segui(id_control,nro_orden,viaje,fh_LlePtoCar) VALUES (pIdControl,pNroOrden,pViaje,NOW());
    ELSEIF ('INI_CARGA' = pEstado) THEN	
	  INSERT INTO se_ordenservicio_deta_segui(id_control,nro_orden,viaje,fh_IniCarga) VALUES (pIdControl,pNroOrden,pViaje,NOW());
    ELSEIF ('FIN_CARGA' = pEstado) THEN		
	  INSERT INTO se_ordenservicio_deta_segui(id_control,nro_orden,viaje,fh_FinCarga) VALUES (pIdControl,pNroOrden,pViaje,NOW());
	ELSEIF ('SAL_PTO_CARGA' = pEstado) THEN	  
	  INSERT INTO se_ordenservicio_deta_segui(id_control,nro_orden,viaje,fh_SalPtoCar) VALUES (pIdControl,pNroOrden,pViaje,NOW());
	ELSEIF ('LLE_PTO_ENTREGA' = pEstado) THEN		
	  INSERT INTO se_ordenservicio_deta_segui(id_control,nro_orden,viaje,fh_LlePtoEnt) VALUES (pIdControl,pNroOrden,pViaje,NOW());	 
	ELSEIF ('INI_DESCARGA' = pEstado) THEN	  
	  INSERT INTO se_ordenservicio_deta_segui(id_control,nro_orden,viaje,fh_IniDescarga) VALUES (pIdControl,pNroOrden,pViaje,NOW());	  
	ELSEIF ('FIN_DESCARGA' = pEstado) THEN	  
	  INSERT INTO se_ordenservicio_deta_segui(id_control,nro_orden,viaje,fh_FinDescarga) VALUES (pIdControl,pNroOrden,pViaje,NOW());
	ELSEIF ('SAL_PTO_ENTREGA' = pEstado) THEN	  
	  INSERT INTO se_ordenservicio_deta_segui(id_control,nro_orden,viaje,fh_SalPtoEnt) VALUES (pIdControl,pNroOrden,pViaje,NOW());	  
    END IF;	
  ELSE
    IF ('LLE_PTO_CARGA' = pEstado) THEN
      UPDATE se_ordenservicio_deta_segui SET fh_LlePtoCar=NOW() WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje;	  
    ELSEIF ('INI_CARGA' = pEstado) THEN
      UPDATE se_ordenservicio_deta_segui SET fh_IniCarga=NOW() WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje;
	ELSEIF ('FIN_CARGA' = pEstado) THEN 
	  UPDATE se_ordenservicio_deta_segui SET fh_FinCarga=NOW() WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje;
	ELSEIF ('SAL_PTO_CARGA' = pEstado) THEN 
	  UPDATE se_ordenservicio_deta_segui SET fh_SalPtoCar=NOW() WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje;
	  IF (0!=(SELECT COUNT(*) FROM se_ordenservicio_deta_segui WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje AND (IFNULL(fh_SalPtoCar,'')<>'' AND IFNULL(fh_SalPtoEnt,'')<>''))) THEN
        UPDATE se_ordenservicio_deta SET status='1' WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje;  
      END IF;
	ELSEIF ('LLE_PTO_ENTREGA' = pEstado) THEN 	 	 
	  UPDATE se_ordenservicio_deta_segui SET fh_LlePtoEnt=NOW() WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje;
    ELSEIF ('INI_DESCARGA' = pEstado) THEN	
      UPDATE se_ordenservicio_deta_segui SET fh_IniDescarga=NOW() WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje;
	ELSEIF ('FIN_DESCARGA' = pEstado) THEN	 
	  UPDATE se_ordenservicio_deta_segui SET fh_FinDescarga=NOW() WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje;
	ELSEIF ('SAL_PTO_ENTREGA' = pEstado) THEN 
	  UPDATE se_ordenservicio_deta_segui SET fh_SalPtoEnt=NOW() WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje;
	  IF (0!=(SELECT COUNT(*) FROM se_ordenservicio_deta_segui WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje AND (IFNULL(fh_SalPtoCar,'')<>'' AND IFNULL(fh_SalPtoEnt,'')<>''))) THEN
        UPDATE se_ordenservicio_deta SET status='1' WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje;		
      END IF;
	END IF; 	 
  END IF;         
  SELECT fh_LlePtoCar,fh_IniCarga,fh_FinCarga,fh_SalPtoCar,fh_LlePtoEnt,fh_IniDescarga,fh_FinDescarga,fh_SalPtoEnt FROM se_ordenservicio_deta_segui WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for spInsUpdOrdenServicioDetSegui
-- ----------------------------
DROP PROCEDURE IF EXISTS `spInsUpdOrdenServicioDetSegui`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsUpdOrdenServicioDetSegui`(
  IN pIdControl INT,
  IN pNroOrden VARCHAR(11),
  IN pViaje INT,
  IN pFhLlePtoCar DATETIME,
  IN pFhIniCarga DATETIME,
  IN pFhFinCarga DATETIME,
  IN pFhSalPtoCar DATETIME,
  IN pFhLlePtoEnt DATETIME,
  IN pFhIniDescarga DATETIME,
  IN pFhFinDescarga DATETIME,
  IN pFhSalPtoEnt DATETIME,
  IN pGuiaRT VARCHAR(11),
  IN pIdUser INT
)
BEGIN
  UPDATE se_ordenservicio_deta SET nro_guiat=pGuiaRT WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje;  
  IF (SELECT COUNT(*)=0 FROM se_ordenservicio_deta_segui WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje) THEN
    INSERT INTO se_ordenservicio_deta_segui(id_control,nro_orden,viaje,fh_LlePtoCar,fh_IniCarga,fh_FinCarga,fh_SalPtoCar,fh_LlePtoEnt,fh_IniDescarga,fh_FinDescarga,fh_SalPtoEnt) VALUES (pIdControl,pNroOrden,pViaje,pFhLlePtoCar,pFhIniCarga,pFhFinCarga,pFhSalPtoCar,pFhLlePtoEnt,pFhIniDescarga,pFhFinDescarga,pFhSalPtoEnt);
  ELSE
    UPDATE se_ordenservicio_deta_segui SET fh_LlePtoCar=pFhLlePtoCar,fh_IniCarga=pFhIniCarga,fh_FinCarga=pFhFinCarga,fh_SalPtoCar=pFhSalPtoCar,fh_LlePtoEnt=pFhLlePtoEnt,fh_IniDescarga=pFhIniDescarga,fh_FinDescarga=pFhFinDescarga,fh_SalPtoEnt=pFhSalPtoEnt WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje;
  END IF;  
  IF (0!=(SELECT COUNT(*) FROM se_ordenservicio_deta_segui WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje AND (IFNULL(fh_SalPtoCar,'')<>'' AND IFNULL(fh_SalPtoEnt,'')<>''))) THEN
    UPDATE se_ordenservicio_deta SET status='1' WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje;
	INSERT INTO _bitacora(id_control,id_user,sistema,tabla,proceso,desc_proceso,documento) VALUES(pIdControl,pIdUser,'SITR','se_ordenservicio_deta','UPD','ESTADO VIAJE(CONCLUIDO)',CONCAT(pNroOrden,'-',pViaje));
  END IF;    
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for spInsUpdSeguiFchUSU
-- ----------------------------
DROP PROCEDURE IF EXISTS `spInsUpdSeguiFchUSU`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsUpdSeguiFchUSU`(
  IN pIdControl INT,
  IN pNroOrden VARCHAR(11),
  IN pViaje INT,
  IN pEstado VARCHAR(15),
  IN pNroCntTras VARCHAR(40)
)
BEGIN
  IF( LENGTH( IFNULL(pNroCntTras,'')) > 0 )THEN
  UPDATE se_ordenservicio_deta_cnt SET num_cnt_tras=pNroCntTras WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje;
  END IF;
  IF (SELECT COUNT(*)=0 FROM se_ordenservicio_deta_segui WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje) THEN   
    IF ('LLE_PTO_CARGA' = pEstado) THEN
	  INSERT INTO se_ordenservicio_deta_segui(id_control,nro_orden,viaje,fh_LlePtoCar) VALUES (pIdControl,pNroOrden,pViaje,NOW());
    ELSEIF ('INI_CARGA' = pEstado) THEN	
	  INSERT INTO se_ordenservicio_deta_segui(id_control,nro_orden,viaje,fh_IniCarga) VALUES (pIdControl,pNroOrden,pViaje,NOW());
    ELSEIF ('FIN_CARGA' = pEstado) THEN		
	  INSERT INTO se_ordenservicio_deta_segui(id_control,nro_orden,viaje,fh_FinCarga) VALUES (pIdControl,pNroOrden,pViaje,NOW());
	ELSEIF ('SAL_PTO_CARGA' = pEstado) THEN	  
	  INSERT INTO se_ordenservicio_deta_segui(id_control,nro_orden,viaje,fh_SalPtoCar) VALUES (pIdControl,pNroOrden,pViaje,NOW());
	ELSEIF ('LLE_PTO_ENTREGA' = pEstado) THEN		
	  INSERT INTO se_ordenservicio_deta_segui(id_control,nro_orden,viaje,fh_LlePtoEnt) VALUES (pIdControl,pNroOrden,pViaje,NOW());	 
	ELSEIF ('INI_DESCARGA' = pEstado) THEN	  
	  INSERT INTO se_ordenservicio_deta_segui(id_control,nro_orden,viaje,fh_IniDescarga) VALUES (pIdControl,pNroOrden,pViaje,NOW());	  
	ELSEIF ('FIN_DESCARGA' = pEstado) THEN	  
	  INSERT INTO se_ordenservicio_deta_segui(id_control,nro_orden,viaje,fh_FinDescarga) VALUES (pIdControl,pNroOrden,pViaje,NOW());
	ELSEIF ('SAL_PTO_ENTREGA' = pEstado) THEN	  
	  INSERT INTO se_ordenservicio_deta_segui(id_control,nro_orden,viaje,fh_SalPtoEnt) VALUES (pIdControl,pNroOrden,pViaje,NOW());	  
    END IF;	
  ELSE
    IF ('LLE_PTO_CARGA' = pEstado) THEN
      UPDATE se_ordenservicio_deta_segui SET fh_LlePtoCar=NOW() WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje;	  
    ELSEIF ('INI_CARGA' = pEstado) THEN
      UPDATE se_ordenservicio_deta_segui SET fh_IniCarga=NOW() WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje;
	ELSEIF ('FIN_CARGA' = pEstado) THEN 
	  UPDATE se_ordenservicio_deta_segui SET fh_FinCarga=NOW() WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje;
	ELSEIF ('SAL_PTO_CARGA' = pEstado) THEN 
	  UPDATE se_ordenservicio_deta_segui SET fh_SalPtoCar=NOW() WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje;
	  IF (0!=(SELECT COUNT(*) FROM se_ordenservicio_deta_segui WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje AND (IFNULL(fh_SalPtoCar,'')<>'' AND IFNULL(fh_SalPtoEnt,'')<>''))) THEN
        UPDATE se_ordenservicio_deta SET status='1' WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje;  
      END IF;
	ELSEIF ('LLE_PTO_ENTREGA' = pEstado) THEN 	 	 
	  UPDATE se_ordenservicio_deta_segui SET fh_LlePtoEnt=NOW() WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje;
    ELSEIF ('INI_DESCARGA' = pEstado) THEN	
      UPDATE se_ordenservicio_deta_segui SET fh_IniDescarga=NOW() WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje;
	ELSEIF ('FIN_DESCARGA' = pEstado) THEN	 
	  UPDATE se_ordenservicio_deta_segui SET fh_FinDescarga=NOW() WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje;
	ELSEIF ('SAL_PTO_ENTREGA' = pEstado) THEN 
	  UPDATE se_ordenservicio_deta_segui SET fh_SalPtoEnt=NOW() WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje;
	  IF (0!=(SELECT COUNT(*) FROM se_ordenservicio_deta_segui WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje AND (IFNULL(fh_SalPtoCar,'')<>'' AND IFNULL(fh_SalPtoEnt,'')<>''))) THEN
        UPDATE se_ordenservicio_deta SET status='1' WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje;		
      END IF;
	END IF; 	 
  END IF;         
  SELECT fh_LlePtoCar,fh_IniCarga,fh_FinCarga,fh_SalPtoCar,fh_LlePtoEnt,fh_IniDescarga,fh_FinDescarga,fh_SalPtoEnt FROM se_ordenservicio_deta_segui WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for spInsUpdSeguiOtherUSU
-- ----------------------------
DROP PROCEDURE IF EXISTS `spInsUpdSeguiOtherUSU`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsUpdSeguiOtherUSU`(
  IN pIdControl INT,
  IN pNroOrden VARCHAR(11),
  IN pViaje INT,  
  IN pGuiaRT VARCHAR(11),
  IN pIdUser INT
)
BEGIN
  UPDATE se_ordenservicio_deta SET nro_guiat=pGuiaRT WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje;      
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for spInsUpdSeguiSSA
-- ----------------------------
DROP PROCEDURE IF EXISTS `spInsUpdSeguiSSA`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsUpdSeguiSSA`(
  IN pIdControl INT,
  IN pNroOrden VARCHAR(11),
  IN pViaje INT,
  IN pFhLlePtoCar DATETIME,
  IN pFhIniCarga DATETIME,
  IN pFhFinCarga DATETIME,
  IN pFhSalPtoCar DATETIME,
  IN pFhLlePtoEnt DATETIME,
  IN pFhIniDescarga DATETIME,
  IN pFhFinDescarga DATETIME,
  IN pFhSalPtoEnt DATETIME,
  IN pGuiaRT VARCHAR(11),
  IN pIdUser INT
)
BEGIN
  UPDATE se_ordenservicio_deta SET nro_guiat=pGuiaRT WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje;  
  IF (SELECT COUNT(*)=0 FROM se_ordenservicio_deta_segui WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje) THEN
    INSERT INTO se_ordenservicio_deta_segui(id_control,nro_orden,viaje,fh_LlePtoCar,fh_IniCarga,fh_FinCarga,fh_SalPtoCar,fh_LlePtoEnt,fh_IniDescarga,fh_FinDescarga,fh_SalPtoEnt) VALUES (pIdControl,pNroOrden,pViaje,pFhLlePtoCar,pFhIniCarga,pFhFinCarga,pFhSalPtoCar,pFhLlePtoEnt,pFhIniDescarga,pFhFinDescarga,pFhSalPtoEnt);
  ELSE
    UPDATE se_ordenservicio_deta_segui SET fh_LlePtoCar=pFhLlePtoCar,fh_IniCarga=pFhIniCarga,fh_FinCarga=pFhFinCarga,fh_SalPtoCar=pFhSalPtoCar,fh_LlePtoEnt=pFhLlePtoEnt,fh_IniDescarga=pFhIniDescarga,fh_FinDescarga=pFhFinDescarga,fh_SalPtoEnt=pFhSalPtoEnt WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje;
  END IF;  
  IF (0!=(SELECT COUNT(*) FROM se_ordenservicio_deta_segui WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje AND (IFNULL(fh_SalPtoCar,'')<>'' AND IFNULL(fh_SalPtoEnt,'')<>''))) THEN
    UPDATE se_ordenservicio_deta SET status='1' WHERE id_control=pIdControl AND nro_orden=pNroOrden AND viaje=pViaje;
	INSERT INTO _bitacora(id_control,id_user,sistema,tabla,proceso,desc_proceso,documento) VALUES(pIdControl,pIdUser,'SITR','se_ordenservicio_deta','UPD','ESTADO VIAJE(CONCLUIDO)',CONCAT(pNroOrden,'-',pViaje));
  END IF;    
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for spUpdateOrdenServicioDetSegui
-- ----------------------------
DROP PROCEDURE IF EXISTS `spUpdateOrdenServicioDetSegui`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdateOrdenServicioDetSegui`(
  IN pNroOrden VARCHAR(11),
  IN pViaje INT,
  IN pFhLlePtoCar DATETIME,
  IN pFhIniCarga DATETIME,
  IN pFhFinCarga DATETIME,
  IN pFhSalPtoCar DATETIME,
  IN pFhLlePtoEnt DATETIME,
  IN pFhIniDescarga DATETIME,
  IN pFhFinDescarga DATETIME,
  IN pFhSalPtoEnt DATETIME,
  IN pGuiaRT VARCHAR(11),
  IN pNroCntTras VARCHAR(40)
)
BEGIN
  DECLARE tipoFlete CHAR(1);
  DECLARE nroContenedor VARCHAR(40);
  DECLARE placa VARCHAR(7);
  DECLARE codigoIncidT VARCHAR(5);
  DECLARE llePtoCargaInc VARCHAR(5);
  DECLARE iniCargaInc VARCHAR(5);
  DECLARE finCargaInc VARCHAR(5);
  DECLARE salPtoCargaInc VARCHAR(5);
  DECLARE llePtoEntregaInc VARCHAR(5);
  DECLARE iniDescargaInc VARCHAR(5);
  DECLARE finDescargaInc VARCHAR(5);
  DECLARE salPtoEntregaInc VARCHAR(5);
  
  IF(pNroCntTras IS NOT NULL) THEN
    IF(LENGTH(IFNULL(pNroCntTras,'')) > 0) THEN
	   UPDATE se_control_unidad SET num_cnt_tras=pNroCntTras WHERE nro_orden=pNroOrden AND viaje=pViaje;
	END IF;
  END IF;
  
  SET tipoFlete:=(SELECT tipo_flete FROM se_ordenservicio WHERE nro_orden=pNroOrden);
  SET nroContenedor:=(SELECT IFNULL(contenedor,'') FROM se_control_unidad WHERE nro_orden=pNroOrden AND viaje=pViaje);
  SET placa:=(SELECT IFNULL(vehiculo,'') FROM se_control_unidad WHERE nro_orden=pNroOrden AND viaje=pViaje);
  SET llePtoCargaInc:=(SELECT LLEPTOCARGA_INC FROM se_parametros);
  SET iniCargaInc:=(SELECT INICARGA_INC FROM se_parametros);
  SET finCargaInc:=(SELECT FINCARGA_INC FROM se_parametros);
  SET salPtoCargaInc:=(SELECT SALPTOCARGA_INC FROM se_parametros);
  SET llePtoEntregaInc:=(SELECT LLEPTOENTREGA_INC FROM se_parametros);
  SET iniDescargaInc:=(SELECT INIDESCARGA_INC FROM se_parametros);
  SET finDescargaInc:=(SELECT FINDESCARGA_INC FROM se_parametros);
  SET salPtoEntregaInc:=(SELECT SALPTOENTREGA_INC FROM se_parametros);  
  

  
  IF(pGuiaRT IS NOT NULL)THEN
    IF(LENGTH(IFNULL((SELECT viaje FROM se_control_unidad WHERE nro_orden=pNroOrden AND viaje=pViaje AND IFNULL(gremi_t,'')<>pGuiaRT),'')) > 0) THEN	
      UPDATE se_control_unidad SET gremi_t=pGuiaRT WHERE nro_orden=pNroOrden AND viaje=pViaje;
	  CALL spRegisterBitacora('SITR','se_control_unidad','SV - SEGUIMIENTO VIAJE',CONCAT(pNroOrden,'-',pViaje),'MR','ROBOTONLINE',NOW(),CONCAT('GUIA R.TRANSPORTISTA: ', pGuiaRT));
    END IF;
  END IF;
  
  IF(pFhLlePtoCar IS NOT NULL)THEN  	
	IF(LENGTH(IFNULL((SELECT viaje FROM se_control_unidad WHERE nro_orden=pNroOrden AND viaje=pViaje AND IFNULL(fh_LlePtoCar_R,NOW())<>pFhLlePtoCar),'')) > 0) THEN	
	  IF('1' = (SELECT IFNULL(llePtoCarga,'') FROM se_parametros))THEN
        CALL spInsIncidencia(pNroOrden,pViaje,llePtoCargaInc,(DATE_FORMAT(pFhLlePtoCar,'%Y/%m/%d')),(DATE_FORMAT(pFhLlePtoCar,'%H:%i')),(SELECT nombre FROM se_ocurrenc WHERE codigo=llePtoCargaInc),(IF(tipoFlete='1',CONCAT('CONTENEDOR: ',nroContenedor,' - UNIDAD: ',placa),CONCAT('NUMERO VIAJE: ',pViaje,' - UNIDAD: ',placa))),'ROBOTONLINE');	  
	    SET codigoIncidT:= llePtoCargaInc;
	  END IF;
	  CALL spRegisterBitacora('SITR','se_control_unidad','ME - ETAPAS VIAJE',CONCAT(pNroOrden,'-',pViaje),'MR','ROBOTONLINE',NOW(),CONCAT('FECHA Y HORA LLEGADA PUNTO CARGA: ', pFhLlePtoCar));
	END IF;
    UPDATE se_control_unidad SET fh_LlePtoCar_R=pFhLlePtoCar WHERE nro_orden=pNroOrden AND viaje=pViaje;	
  END IF;
  IF(pFhIniCarga IS NOT NULL)THEN
	IF(LENGTH(IFNULL((SELECT viaje FROM se_control_unidad WHERE nro_orden=pNroOrden AND viaje=pViaje AND IFNULL(fh_IniCarga,NOW())<>pFhIniCarga),'')) > 0) THEN
	  IF('1' = (SELECT IFNULL(inicarga,'') FROM se_parametros))THEN
        CALL spInsIncidencia(pNroOrden,pViaje,iniCargaInc,(DATE_FORMAT(pFhIniCarga,'%Y/%m/%d')),(DATE_FORMAT(pFhIniCarga,'%H:%i')),(SELECT nombre FROM se_ocurrenc WHERE codigo=iniCargaInc),(IF(tipoFlete='1',CONCAT('CONTENEDOR: ',nroContenedor,' - UNIDAD: ',placa),CONCAT('NUMERO VIAJE: ',pViaje,' - UNIDAD: ',placa))),'ROBOTONLINE');	  
	    SET codigoIncidT:= iniCargaInc;
	  END IF;	
	  CALL spRegisterBitacora('SITR','se_control_unidad','ME - ETAPAS VIAJE',CONCAT(pNroOrden,'-',pViaje),'MR','ROBOTONLINE',NOW(),CONCAT('FECHA Y HORA INICIO DE LA CARGA: ', pFhIniCarga));
	END IF;
	UPDATE se_control_unidad SET fh_IniCarga=pFhIniCarga WHERE nro_orden=pNroOrden AND viaje=pViaje;
  END IF;
  IF(pFhFinCarga IS NOT NULL)THEN      
	IF(LENGTH(IFNULL((SELECT viaje FROM se_control_unidad WHERE nro_orden=pNroOrden AND viaje=pViaje AND IFNULL(fh_FinCarga,NOW())<>pFhFinCarga),'')) > 0) THEN
	  IF('1' = (SELECT IFNULL(fincarga,'') FROM se_parametros))THEN
        CALL spInsIncidencia(pNroOrden,pViaje,finCargaInc,(DATE_FORMAT(pFhFinCarga,'%Y/%m/%d')),(DATE_FORMAT(pFhFinCarga,'%H:%i')),(SELECT nombre FROM se_ocurrenc WHERE codigo=finCargaInc),(IF(tipoFlete='1',CONCAT('CONTENEDOR: ',nroContenedor,' - UNIDAD: ',placa),CONCAT('NUMERO VIAJE: ',pViaje,' - UNIDAD: ',placa))),'ROBOTONLINE');	  
	    SET codigoIncidT:= finCargaInc;
	  END IF;
	  CALL spRegisterBitacora('SITR','se_control_unidad','ME - ETAPAS VIAJE',CONCAT(pNroOrden,'-',pViaje),'MR','ROBOTONLINE',NOW(),CONCAT('FECHA Y HORA FIN DE LA CARGA: ', pFhFinCarga));
	END IF;
	UPDATE se_control_unidad SET fh_FinCarga=pFhFinCarga WHERE nro_orden=pNroOrden AND viaje=pViaje;
  END IF;
  IF(pFhSalPtoCar IS NOT NULL)THEN         	
	IF(LENGTH(IFNULL((SELECT viaje FROM se_control_unidad WHERE nro_orden=pNroOrden AND viaje=pViaje AND IFNULL(fh_SalPtoCar,NOW())<>pFhSalPtoCar),'')) > 0) THEN
	  IF('1' = (SELECT IFNULL(salPtoCarga,'') FROM se_parametros))THEN
        CALL spInsIncidencia(pNroOrden,pViaje,salPtoCargaInc,(DATE_FORMAT(pFhSalPtoCar,'%Y/%m/%d')),(DATE_FORMAT(pFhSalPtoCar,'%H:%i')),(SELECT nombre FROM se_ocurrenc WHERE codigo=salPtoCargaInc),(IF(tipoFlete='1',CONCAT('CONTENEDOR: ',nroContenedor,' - UNIDAD: ',placa),CONCAT('NUMERO VIAJE: ',pViaje,' - UNIDAD: ',placa))),'ROBOTONLINE');	  
	    SET codigoIncidT:= salPtoCargaInc;
	  END IF;
	  CALL spRegisterBitacora('SITR','se_control_unidad','ME - ETAPAS VIAJE',CONCAT(pNroOrden,'-',pViaje),'MR','ROBOTONLINE',NOW(),CONCAT('FECHA Y HORA SALIDA PUNTO CARGA: ', pFhSalPtoCar));
	END IF;
	UPDATE se_control_unidad SET fh_SalPtoCar=pFhSalPtoCar WHERE nro_orden=pNroOrden AND viaje=pViaje;
  END IF;        
  IF(pFhLlePtoEnt IS NOT NULL)THEN     	
	IF(LENGTH(IFNULL((SELECT viaje FROM se_control_unidad WHERE nro_orden=pNroOrden AND viaje=pViaje AND IFNULL(fh_LlePtoEnt_R,NOW())<>pFhLlePtoEnt),'')) > 0) THEN
	  IF('1' = (SELECT IFNULL(llePtoEntrega,'') FROM se_parametros))THEN
        CALL spInsIncidencia(pNroOrden,pViaje,llePtoEntregaInc,(DATE_FORMAT(pFhLlePtoEnt,'%Y/%m/%d')),(DATE_FORMAT(pFhLlePtoEnt,'%H:%i')),(SELECT nombre FROM se_ocurrenc WHERE codigo=llePtoEntregaInc),(IF(tipoFlete='1',CONCAT('CONTENEDOR: ',nroContenedor,' - UNIDAD: ',placa),CONCAT('NUMERO VIAJE: ',pViaje,' - UNIDAD: ',placa))),'ROBOTONLINE');	  
	    SET codigoIncidT:= llePtoEntregaInc;
	  END IF;
	  CALL spRegisterBitacora('SITR','se_control_unidad','ME - ETAPAS VIAJE',CONCAT(pNroOrden,'-',pViaje),'MR','ROBOTONLINE',NOW(),CONCAT('FECHA Y HORA LLEGADA PUNTO ENTREGA: ', pFhLlePtoEnt));
	END IF;
	UPDATE se_control_unidad SET fh_LlePtoEnt_R=pFhLlePtoEnt WHERE nro_orden=pNroOrden AND viaje=pViaje; 
  END IF;    
  IF(pFhIniDescarga IS NOT NULL)THEN
	IF(LENGTH(IFNULL((SELECT viaje FROM se_control_unidad WHERE nro_orden=pNroOrden AND viaje=pViaje AND IFNULL(fh_IniDesca,NOW())<>pFhIniDescarga),'')) > 0) THEN
      IF('1' = (SELECT IFNULL(iniDescarga,'') FROM se_parametros))THEN
        CALL spInsIncidencia(pNroOrden,pViaje,iniDescargaInc,(DATE_FORMAT(pFhIniDescarga,'%Y/%m/%d')),(DATE_FORMAT(pFhIniDescarga,'%H:%i')),(SELECT nombre FROM se_ocurrenc WHERE codigo=iniDescargaInc),(IF(tipoFlete='1',CONCAT('CONTENEDOR: ',nroContenedor,' - UNIDAD: ',placa),CONCAT('NUMERO VIAJE: ',pViaje,' - UNIDAD: ',placa))),'ROBOTONLINE');	  
	    SET codigoIncidT:= iniDescargaInc;
	  END IF;
	  CALL spRegisterBitacora('SITR','se_control_unidad','ME - ETAPAS VIAJE',CONCAT(pNroOrden,'-',pViaje),'MR','ROBOTONLINE',NOW(),CONCAT('FECHA Y HORA INICIO DE LA DESCARGA: ', pFhIniDescarga));
	END IF;
	UPDATE se_control_unidad SET fh_IniDesca=pFhIniDescarga WHERE nro_orden=pNroOrden AND viaje=pViaje;	
  END IF;  
  IF(pFhFinDescarga IS NOT NULL)THEN    	
	IF(LENGTH(IFNULL((SELECT viaje FROM se_control_unidad WHERE nro_orden=pNroOrden AND viaje=pViaje AND IFNULL(fh_FinDesca,NOW())<>pFhFinDescarga),'')) > 0) THEN
	  IF('1' = (SELECT IFNULL(finDescarga,'') FROM se_parametros))THEN
        CALL spInsIncidencia(pNroOrden,pViaje,finDescargaInc,(DATE_FORMAT(pFhFinDescarga,'%Y/%m/%d')),(DATE_FORMAT(pFhFinDescarga,'%H:%i')),(SELECT nombre FROM se_ocurrenc WHERE codigo=finDescargaInc),(IF(tipoFlete='1',CONCAT('CONTENEDOR: ',nroContenedor,' - UNIDAD: ',placa),CONCAT('NUMERO VIAJE: ',pViaje,' - UNIDAD: ',placa))),'ROBOTONLINE');	  
	    SET codigoIncidT:= finDescargaInc;
	  END IF;
	  CALL spRegisterBitacora('SITR','se_control_unidad','ME - ETAPAS VIAJE',CONCAT(pNroOrden,'-',pViaje),'MR','ROBOTONLINE',NOW(),CONCAT('FECHA Y HORA FIN DE LA DESCARGA: ', pFhFinDescarga));
	END IF;
	UPDATE se_control_unidad SET fh_FinDesca=pFhFinDescarga WHERE nro_orden=pNroOrden AND viaje=pViaje;
  END IF;    
  IF(pFhSalPtoEnt IS NOT NULL)THEN
	IF(LENGTH(IFNULL((SELECT viaje FROM se_control_unidad WHERE nro_orden=pNroOrden AND viaje=pViaje AND IFNULL(fh_SalPtoEnt,NOW())<>pFhSalPtoEnt),'')) > 0) THEN
	  IF('1' = (SELECT IFNULL(salPtoEntrega,'') FROM se_parametros))THEN
        CALL spInsIncidencia(pNroOrden,pViaje,salPtoEntregaInc,(DATE_FORMAT(pFhSalPtoEnt,'%Y/%m/%d')),(DATE_FORMAT(pFhSalPtoEnt,'%H:%i')),(SELECT nombre FROM se_ocurrenc WHERE codigo=salPtoEntregaInc),(IF(tipoFlete='1',CONCAT('CONTENEDOR: ',nroContenedor,' - UNIDAD: ',placa),CONCAT('NUMERO VIAJE: ',pViaje,' - UNIDAD: ',placa))),'ROBOTONLINE');	  
	    SET codigoIncidT:= salPtoEntregaInc;
	  END IF;
	  CALL spRegisterBitacora('SITR','se_control_unidad','ME - ETAPAS VIAJE',CONCAT(pNroOrden,'-',pViaje),'MR','ROBOTONLINE',NOW(),CONCAT('FECHA Y HORA SALIDA PUNTO ENTREGA: ', pFhSalPtoEnt));
	END IF;
	UPDATE se_control_unidad SET fh_SalPtoEnt=pFhSalPtoEnt WHERE nro_orden=pNroOrden AND viaje=pViaje;
  END IF;
  
  IF(LENGTH(IFNULL((SELECT fh_SalPtoCar FROM se_control_unidad WHERE nro_orden=pNroOrden AND viaje=pViaje),''))>0)THEN
    IF(LENGTH(IFNULL((SELECT fh_SalPtoEnt FROM se_control_unidad WHERE nro_orden=pNroOrden AND viaje=pViaje),''))>0)THEN	
      IF(LENGTH(IFNULL((SELECT orden FROM se_status WHERE nro_orden=pNroOrden AND viaje=pViaje AND orden=4),'')) = 0)THEN
	    INSERT se_status VALUES(pNroOrden,pViaje,(SELECT codigo FROM _status WHERE orden=4),(SELECT detalle FROM _status WHERE orden=4),4,NOW(),CONCAT('ROBOTONLINE','*',DATE_FORMAT(NOW(), '%d/%m/%Y'),'*',DATE_FORMAT(now(),'%H:%i') ));
        UPDATE se_control_unidad SET estado=(SELECT codigo FROM _status WHERE orden=4) WHERE nro_orden=pNroOrden AND viaje=pViaje;
        CALL spInsIncidencia(pNroOrden,pViaje,'00083',CURDATE(),DATE_FORMAT(NOW(),'%H:%i:%s'),(SELECT nombre FROM se_ocurrenc WHERE codigo='00083'),'','ROBOTONLINE');
		CALL spRegisterBitacora('SITR','se_control_unidad','ME - ESTADO EJECUTADO',CONCAT(pNroOrden,'-',pViaje),'ME','ROBOTONLINE',NOW(),CONCAT('SALIDA PUNTO DE ENTREGA: ', pFhSalPtoEnt));
      END IF;
	END IF;
  END IF;
  
  SELECT codigoIncidT;
  
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for spUpdEmpleado
-- ----------------------------
DROP PROCEDURE IF EXISTS `spUpdEmpleado`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdEmpleado`(
    IN pIdControl INT,
	IN pIdEmpleado INT,
	IN pNombres VARCHAR(70),
	IN pPaterno VARCHAR(100),
	IN pMaterno VARCHAR(100),
	IN pEmail VARCHAR(50),
	IN pNivel CHAR(1),
	IN pTelefono VARCHAR(40),
	IN pMovil1 VARCHAR(20),
    IN pMovil2 VARCHAR(20),  
    IN pBrevete VARCHAR(20),
    IN pEstEmp CHAR(1)
  )
BEGIN
    IF (pNivel='S')THEN
	  UPDATE _user SET id_role=1 WHERE id_empleado=pIdEmpleado;
	ELSE
	  UPDATE _user SET id_role=2 WHERE id_empleado=pIdEmpleado;
	END IF;  
	UPDATE _empleado SET nombres=pNombres,paterno=pPaterno,materno=pMaterno,email=pEmail,nivel=pNivel,telefono=pTelefono,movil1=pMovil1,movil2=pMovil2,brevete=pBrevete,est_emp=pEstEmp WHERE id_empleado=pIdEmpleado AND id_control=pIdControl;
  END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for spUpdOrdenServicio
-- ----------------------------
DROP PROCEDURE IF EXISTS `spUpdOrdenServicio`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdOrdenServicio`(
  IN pRucTransportista VARCHAR(20),
  IN pNroOrden VARCHAR(11),
  IN pDniEmpleado VARCHAR(20),
  IN pFHOrden VARCHAR(10),
  IN pNroOrdenA VARCHAR(11),
  IN pRucClte VARCHAR(20),
  IN pNameClte VARCHAR(100),
  IN pTipoServ VARCHAR(2),
  IN pTipoFlete CHAR(1),
  IN pResumerc TEXT,
  IN pObserv VARCHAR(255)
)
BEGIN
  SET @idConrol:= (SELECT id_control FROM __control WHERE ruc_clte=pRucTransportista);
  SET @idEmpleado:= (SELECT id_empleado FROM _empleado WHERE documento=pDniEmpleado AND id_control=@idConrol);
  UPDATE se_ordenservicio SET id_empleado=@idEmpleado,fh_orden=pFHOrden,nro_ordenA=pNroOrdenA,ruc_clte=pRucClte,name_clte=pNameClte,tipo_serv=pTipoServ,tipo_flete=pTipoFlete,resumerc=pResumerc,observacion=pObserv WHERE id_control=@idConrol AND nro_orden=pNroOrden;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for spUpdOrdenServicioDet
-- ----------------------------
DROP PROCEDURE IF EXISTS `spUpdOrdenServicioDet`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdOrdenServicioDet`(
  IN pRucTransportista VARCHAR(20),
  IN pNroOrden VARCHAR(11),
  IN pViaje INT,
  IN pChofer VARCHAR(20),
  IN pVehiculo VARCHAR(7),
  IN pTipoMerc CHAR(1),
  IN pNroGuiaT VARCHAR(11),
  IN pDepoCodP VARCHAR(6),
  IN pDepoNomP VARCHAR(70),
  IN pDireP VARCHAR(200),
  IN pUbigeoP VARCHAR(6),
  IN pDepoCodL VARCHAR(6),
  IN pDepoNomL VARCHAR(70),
  IN pDireL VARCHAR(200),
  IN pUbigeoL VARCHAR(6),
  IN pFhLlePtoEntP DATETIME
)
BEGIN
  SET @idConrol:= (SELECT id_control FROM __control WHERE ruc_clte=pRucTransportista);
  UPDATE se_ordenservicio_deta SET chofer=pChofer,vehiculo=pVehiculo,tipo_merc=pTipoMerc,nro_guiaT=pNroGuiaT,depoCod_P=pDepoCodP,depoNom_P=pDepoNomP,dire_P=pDireP,ubigeo_P=pUbigeoP,depoCod_L=pDepoCodL,depoNom_L=pDepoNomL,dire_L=pDireL,ubigeo_L=pUbigeoL,fh_lleptoent_p=pFhLlePtoEntP WHERE id_control=@idConrol AND nro_orden=pNroOrden AND viaje=pViaje;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for spUpdOrdenServicioDetCnt
-- ----------------------------
DROP PROCEDURE IF EXISTS `spUpdOrdenServicioDetCnt`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdOrdenServicioDetCnt`(
  IN pRucTransportista VARCHAR(20),
  IN pNroOrden VARCHAR(11),
  IN pViaje INT,
  IN pNumCnt VARCHAR(40),
  IN pCapaCnt VARCHAR(2),
  IN pTipoCnt VARCHAR(2)
)
BEGIN
  SET @idConrol:= (SELECT id_control FROM __control WHERE ruc_clte=pRucTransportista);
  UPDATE se_ordenservicio_deta_cnt SET num_cnt=pNumCnt,capa_cnt=pCapaCnt,tipo_cnt=pTipoCnt WHERE id_control=@idConrol AND nro_orden=pNroOrden AND viaje=pViaje;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for spUpdOrdenServicioDetCs
-- ----------------------------
DROP PROCEDURE IF EXISTS `spUpdOrdenServicioDetCs`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdOrdenServicioDetCs`(
  IN pRucTransportista VARCHAR(20),
  IN pNroOrden VARCHAR(11),
  IN pViaje INT,
  IN pCantidad INT,
  IN pTipoBulto VARCHAR(150),
  IN pPesoBruto DOUBLE(13,3),
  IN pLargo DOUBLE(11,2),
  IN pAncho DOUBLE(11,2),
  IN pAlto DOUBLE(11,2),
  IN pPesoVol DOUBLE(11,2),
  IN pVolumen DOUBLE(11,2)
)
BEGIN
  SET @idConrol:= (SELECT id_control FROM __control WHERE ruc_clte=pRucTransportista);
  UPDATE se_ordenservicio_deta_css SET cantidad=pCantidad,tipo_bulto=pTipoBulto,peso_bruto=pPesoBruto,largo=pLargo,ancho=pAncho,alto=pAlto,peso_vol=pPesoVol,volumen=pVolumen WHERE id_control=@idConrol AND nro_orden=pNroOrden AND viaje=pViaje;
END
;;
DELIMITER ;
