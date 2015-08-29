DROP TABLE IF EXISTS `c_constituency`;

CREATE TABLE `c_constituency` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `c_constituency` WRITE;
/*!40000 ALTER TABLE `c_constituency` DISABLE KEYS */;

INSERT INTO `c_constituency` (`id`, `name`)
VALUES
	(1,'ADARSH NAGAR'),
	(2,'AMBEDKAR NAGAR'),
	(3,'BABARPUR'),
	(4,'BADARPUR'),
	(5,'BADLI'),
	(6,'BALLIMARAN'),
	(7,'BAWANA'),
	(8,'BIJWASAN'),
	(9,'BURARI'),
	(10,'CHANDNI CHOWK'),
	(11,'CHHATARPUR'),
	(12,'DELHI CANTT'),
	(13,'DEOLI'),
	(14,'DWARKA'),
	(15,'GANDHI NAGAR'),
	(16,'GHONDA'),
	(17,'GOKALPUR'),
	(18,'GREATER KAILASH'),
	(19,'HARI NAGAR'),
	(20,'JANAKPURI'),
	(21,'JANGPURA'),
	(22,'KALKAJI'),
	(23,'KARAWAL NAGAR'),
	(24,'KAROL BAGH'),
	(25,'KASTURBA NAGAR'),
	(26,'KIRARI'),
	(27,'KONDLI'),
	(28,'KRISHNA NAGAR'),
	(29,'LAXMI NAGAR'),
	(30,'MADIPUR'),
	(31,'MALVIYA NAGAR'),
	(32,'MANGOL PURI'),
	(33,'MATIA MAHAL'),
	(34,'MATIALA'),
	(35,'MEHRAULI'),
	(36,'MODEL TOWN'),
	(37,'MOTI NAGAR'),
	(38,'MUNDKA'),
	(39,'MUSTAFABAD'),
	(40,'NAJAFGARH'),
	(41,'NANGLOI JAT'),
	(42,'NERELA'),
	(43,'NEW DELHI'),
	(44,'OKHLA'),
	(45,'PALAM'),
	(46,'PATEL NAGAR'),
	(47,'PATPARGANJ'),
	(48,'R K PURAM'),
	(49,'RAJINDER NAGAR'),
	(50,'RAJOURI GARDEN'),
	(51,'RITHALA'),
	(52,'ROHINI'),
	(53,'ROHTAS NAGAR'),
	(54,'SADAR BAZAR'),
	(55,'SANGAM VIHAR'),
	(56,'SEELAMPUR'),
	(57,'SEEMA PURI'),
	(58,'SHAHDARA'),
	(59,'SHAKUR BASTI'),
	(60,'SHALIMAR BAGH'),
	(61,'SULTANPUR MAJRA'),
	(62,'TILAK NAGAR'),
	(63,'TIMARPUR'),
	(64,'TRI NAGAR'),
	(65,'TRILOKPURI'),
	(66,'TUGHLAKABAD'),
	(67,'UTTAM NAGAR'),
	(68,'VIKASPURI'),
	(69,'VISHWAS NAGAR'),
	(70,'WAZIRPUR');

/*!40000 ALTER TABLE `c_constituency` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table c_party
# ------------------------------------------------------------

DROP TABLE IF EXISTS `c_party`;

CREATE TABLE `c_party` (
  `id` tinyint(3) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `abbreviation` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `c_party` WRITE;
/*!40000 ALTER TABLE `c_party` DISABLE KEYS */;

INSERT INTO `c_party` (`id`, `name`, `abbreviation`)
VALUES
	(1,'Aam Aadmi Party','AAP'),
	(2,'Bharatiya Janata Party','BJP');

/*!40000 ALTER TABLE `c_party` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table c_politician
# ------------------------------------------------------------

DROP TABLE IF EXISTS `c_politician`;

CREATE TABLE `c_politician` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `constituency_id` bigint(20) NOT NULL,
  `party_id` tinyint(3) NOT NULL,
  `education` varchar(255) DEFAULT NULL,
  `totalAssets` bigint(20) DEFAULT NULL,
  `liabilities` bigint(20) DEFAULT NULL,
  `criminal_cases_pending` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `constituency_id` (`constituency_id`),
  KEY `party_id` (`party_id`),
  CONSTRAINT `c_politician_ibfk_1` FOREIGN KEY (`constituency_id`) REFERENCES `c_constituency` (`id`),
  CONSTRAINT `c_politician_ibfk_2` FOREIGN KEY (`party_id`) REFERENCES `c_party` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
