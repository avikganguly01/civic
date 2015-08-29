DROP TABLE IF EXISTS `c_constituency`;

CREATE TABLE `c_constituency` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `c_politician` (`id`, `name`, `constituency_id`, `party_id`, `education`, `totalAssets`, `liabilities`, `criminal_cases_pending`)
VALUES
	(355,'Pawan Kumar Sharma',1,1,'12th Pass',10996895,256710,1),
	(356,'Ajay Dutt',2,1,'Post Graduate',23427501,2972000,0),
	(357,'Gopal Rai',3,1,'Post Graduate',5239843,0,2),
	(358,'Narayan Dutt Sharma',4,1,'12th Pass',6178144,50000,0),
	(359,'Ajesh Yadav',5,1,'Graduate',145047653,15404944,0),
	(360,'Imran Hussain',6,1,'Graduate',7397824,750000,1),
	(361,'Ved Parkash',7,1,'Graduate',11782955,554074,1),
	(362,'Col Devinder Sehrawat',8,1,'Post Graduate',22936566,480000,2),
	(363,'Sanjeev Jha',9,1,'Graduate',827915,0,0),
	(364,'Alka Lamba',10,1,'Post Graduate',14012477,0,0),
	(365,'Kartar Singh Tanwar',11,1,'Others',176512596,92433052,1),
	(366,'Surender Singh',12,1,'Graduate',7629527,0,0),
	(367,'Prakash',13,1,'Post Graduate',46740,16436,1),
	(368,'Adarsh Shastri',14,1,'Post Graduate',22138623,5107118,0),
	(369,'Anil Kumar Bajpai',15,1,'Graduate',447001,0,0),
	(370,'Shri Dutt Sharma',16,1,'12th Pass',140108017,10440607,0),
	(371,'Fateh Singh',17,1,'Graduate',72646007,200000,0),
	(372,'Saurabh Bharadwaj',18,1,'Graduate Professional',10229151,0,1),
	(373,'Jagdeep Singh',19,1,'12th Pass',18589244,531170,3),
	(374,'Rajesh Rishi',20,1,'Graduate',1423939,0,4),
	(375,'Praveen Kumar',21,1,'Post Graduate',807000,0,0),
	(376,'Avtar Singh',22,1,'8th Pass',577958,0,0),
	(377,'Kapil Mishra',23,1,'Post Graduate',4600637,1999864,0),
	(378,'Vishesh Ravi',24,1,'12th Pass',717000,35000,0),
	(379,'Madan Lal',25,1,'Post Graduate',26829444,1924841,0),
	(380,'Rituraj Govind',26,1,'Others',37933,0,0),
	(381,'Manoj Kumar',27,1,'10th Pass',946186,79082,0),
	(382,'S K Bagga',28,1,'Post Graduate',74141683,5303529,0),
	(383,'Nitin Tyagi',29,1,'Post Graduate',14339460,384000,0),
	(384,'Girish Soni',30,1,'10th Pass',12688397,1269467,0),
	(385,'Somnath Bharti',31,1,'Post Graduate',13981720,2096655,1),
	(386,'Rakhi Birla',32,1,'Post Graduate',18000,290000,2),
	(387,'Asim Ahmed Khan',33,1,'Graduate',65349988,1633760,0),
	(388,'Gulab Singh',34,1,'12th Pass',57030400,2053382,10),
	(389,'Naresh Yadav',35,1,'Graduate Professional',268080564,27350000,0),
	(390,'Akhilesh Pati Tripathi',36,1,'Post Graduate',188118,0,1),
	(391,'Shiv Charan Goel',37,1,'12th Pass',181462602,41300000,0),
	(392,'Sukhvir Singh',38,1,'Post Graduate',181096152,827809,0),
	(393,'Jagdish Pradhan',39,2,'10th Pass',139974291,1760325,0),
	(394,'Kailash Gahlot',40,1,'Post Graduate',374541806,85525139,0),
	(395,'Raghuvinder Shokeen',41,1,'Graduate',62297490,2282122,0),
	(396,'Sharad Kumar',42,1,'10th Pass',25953409,0,0),
	(397,'Arvind Kejriwal',43,1,'Graduate Professional',20985366,4100000,10),
	(398,'Amanatullah Khan',44,1,'12th Pass',20073316,0,1),
	(399,'Bhavna Gaur',45,1,'Graduate Professional',269570,0,0),
	(400,'Hazari Lal Chauhan',46,1,'8th Pass',26112537,33000,0),
	(401,'Manish Sisodia',47,1,'Others',4166133,0,6),
	(402,'Parmila Tokas',48,1,'12th Pass',879098874,121596944,0),
	(403,'Vijender Garg Vijay',49,1,'Graduate',23604194,0,0),
	(404,'Jarnail Singh',50,1,'Post Graduate',11974780,155000,3),
	(405,'Mohinder Goyal',51,1,'10th Pass',29958454,563044,0),
	(406,'Vijender Gupta',52,2,'Post Graduate',85886067,11560502,2),
	(407,'Sarita Singh',53,1,'Post Graduate',118280,0,0),
	(408,'Som Dutt',54,1,'Graduate',1079433,0,0),
	(409,'Dinesh Mohaniya',55,1,'12th Pass',2260631,0,2),
	(410,'Mohd. Ishraque',56,1,'5th Pass',27300738,0,0),
	(411,'Rajendra Pal Gautam',57,1,'Graduate Professional',6349317,0,0),
	(412,'Ram Niwas Goel',58,1,'Graduate',43968000,3481000,2),
	(413,'Satyendar Kumar Jain',59,1,'Graduate',80841007,11705000,0),
	(414,'Bandana Kumari',60,1,'Graduate',88771227,445709,1),
	(415,'Sandeep Kumar',61,1,'Graduate Professional',1316629,0,0),
	(416,'Jarnail Singh',62,1,'12th Pass',18889333,500452,2),
	(417,'Pankaj Pushkar',63,1,'Post Graduate',14880949,571442,0),
	(418,'Jitender Singh Tomar',64,1,'Graduate Professional',10724369,746950,0),
	(419,'Raju Dhingan',65,1,'8th Pass',1010862,23605,0),
	(420,'Sahi Ram',66,1,'10th Pass',9406703,0,3),
	(421,'Naresh Balyan',67,1,'8th Pass',581182557,1806000,0),
	(422,'Mahinder Yadav',68,1,'10th Pass',21532814,0,0),
	(423,'Om Prakash Sharma',69,2,'Graduate',192576370,41341948,0),
	(424,'Rajesh Gupta',70,1,'12th Pass',1652676,109795,0);
