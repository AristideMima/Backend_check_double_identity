-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  jeu. 03 juin 2021 à 06:18
-- Version du serveur :  5.7.28
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `identity`
--

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add client', 7, 'add_client'),
(26, 'Can change client', 7, 'change_client'),
(27, 'Can delete client', 7, 'delete_client'),
(28, 'Can view client', 7, 'view_client'),
(29, 'Can add auth token', 8, 'add_authtoken'),
(30, 'Can change auth token', 8, 'change_authtoken'),
(31, 'Can delete auth token', 8, 'delete_authtoken'),
(32, 'Can view auth token', 8, 'view_authtoken');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$150000$pr0tXicwUw96$gdET3lYUUqwwPKhI4Ns4I9gZSyofFJxTb1Un1tL50us=', NULL, 0, 'username', '', '', 'email@email.com', 0, 1, '2021-05-19 08:39:58.322479'),
(2, 'pbkdf2_sha256$150000$sbSXA5WrIVZS$VabSE9j9MgDAZ/8M/P/sOZ96KOJ1D54o2+dFADuy460=', NULL, 0, 'newName', '', '', 'email@email.com', 0, 1, '2021-05-19 08:42:23.591000'),
(3, 'pbkdf2_sha256$150000$AXqrxOFCMH1x$VCUbEhZz+AuBo1jxzyWnLV9kt1NqrvR9Ajkq76oWQLw=', NULL, 0, 'client', '', '', 'email@email.com', 0, 1, '2021-05-19 08:43:38.370703'),
(4, 'pbkdf2_sha256$260000$uc9BDvHTAB6y3CkNTbtzlw$w2jZAa/HMsBNrccG5cgOIRqkWqBcXHpFHgG9W2pNN6E=', NULL, 0, 'client_sec', '', '', 'email@email.com', 0, 1, '2021-05-19 12:35:25.831258'),
(5, 'pbkdf2_sha256$150000$dDu7ou78g29M$xM7DM3CipMrXYg3PD5UK07O/jvly/2ZbVkSO0DYUs8s=', NULL, 0, 'client_new', '', '', 'cl@gmail.com', 0, 1, '2021-05-19 17:20:23.176361');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'identity', 'client'),
(8, 'knox', 'authtoken');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-05-18 08:15:57.809933'),
(2, 'auth', '0001_initial', '2021-05-18 08:15:58.407782'),
(3, 'admin', '0001_initial', '2021-05-18 08:15:59.853623'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-05-18 08:16:00.145316'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-05-18 08:16:00.153321'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-05-18 08:16:00.312628'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-05-18 08:16:00.465749'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-05-18 08:16:00.552141'),
(9, 'auth', '0004_alter_user_username_opts', '2021-05-18 08:16:00.562145'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-05-18 08:16:00.649724'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-05-18 08:16:00.651721'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-05-18 08:16:00.661723'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-05-18 08:16:00.830723'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-05-18 08:16:00.984261'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-05-18 08:16:01.057596'),
(16, 'auth', '0011_update_proxy_permissions', '2021-05-18 08:16:01.068592'),
(17, 'identity', '0001_initial', '2021-05-18 08:16:01.151546'),
(18, 'sessions', '0001_initial', '2021-05-18 08:16:01.241600'),
(19, 'identity', '0002_client_created_at', '2021-05-19 07:24:29.320985'),
(20, 'knox', '0001_initial', '2021-05-19 08:03:16.125058'),
(21, 'knox', '0002_auto_20150916_1425', '2021-05-19 08:03:16.618059'),
(22, 'knox', '0003_auto_20150916_1526', '2021-05-19 08:03:16.996057'),
(23, 'knox', '0004_authtoken_expires', '2021-05-19 08:03:17.100059'),
(24, 'knox', '0005_authtoken_token_key', '2021-05-19 08:03:17.220059'),
(25, 'knox', '0006_auto_20160818_0932', '2021-05-19 08:03:17.957059'),
(26, 'knox', '0007_auto_20190111_0542', '2021-05-19 08:03:18.073059'),
(27, 'auth', '0012_alter_user_first_name_max_length', '2021-05-26 06:53:52.859370');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `identity_client`
--

DROP TABLE IF EXISTS `identity_client`;
CREATE TABLE IF NOT EXISTS `identity_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_number` varchar(11) NOT NULL,
  `firstName` varchar(200) NOT NULL,
  `lastName` varchar(200) NOT NULL,
  `town` varchar(50) NOT NULL,
  `sex` varchar(1) NOT NULL,
  `born_year` date NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_number` (`account_number`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `identity_client`
--

INSERT INTO `identity_client` (`id`, `account_number`, `firstName`, `lastName`, `town`, `sex`, `born_year`, `created_at`) VALUES
(21, '00039391052', 'WAMBA', 'Guillaume', 'Bamenda', 'M', '1999-06-28', '2021-05-28 10:07:27.199974'),
(20, '00028581051', 'KOUEKEM DJOUNO', 'Rosaline', 'Yaoundé', 'F', '1963-10-28', '2021-05-28 09:59:27.429380'),
(18, '00010951002', 'SILINOU', 'JULIENNE', 'Douala', 'M', '2013-06-12', '2021-05-28 09:53:59.878528'),
(19, '00011591051', 'TANKIO', 'ELISE', 'Ngaoundéré', 'F', '1965-10-10', '2021-05-28 09:56:20.304360'),
(22, '00621451051', 'WOUOFO TAJOUO', 'ANGELE SOPHIE', 'Garoua', 'F', '1975-08-07', '2021-05-28 13:05:46.237175'),
(23, '04961881051', 'FAPOWO', 'ELVIS', 'Bamenda', 'M', '1992-02-18', '2021-05-28 13:07:46.463930'),
(24, '06576441051', 'SIEYAPDGE', 'YVETTE', 'YAOUNDE', 'F', '1981-08-25', '2021-05-28 13:08:55.536531');

-- --------------------------------------------------------

--
-- Structure de la table `knox_authtoken`
--

DROP TABLE IF EXISTS `knox_authtoken`;
CREATE TABLE IF NOT EXISTS `knox_authtoken` (
  `digest` varchar(128) NOT NULL,
  `salt` varchar(16) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `expiry` datetime(6) DEFAULT NULL,
  `token_key` varchar(8) NOT NULL,
  PRIMARY KEY (`digest`),
  UNIQUE KEY `salt` (`salt`),
  KEY `knox_authtoken_user_id_e5a5d899` (`user_id`),
  KEY `knox_authtoken_token_key_8f4f7d47` (`token_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `knox_authtoken`
--

INSERT INTO `knox_authtoken` (`digest`, `salt`, `created`, `user_id`, `expiry`, `token_key`) VALUES
('cc53211fd6c9196dd1f53b57e8b990adc046ed80b5b95c9cc995a29aefd206e3e088fb1414b207e82df4e57f599d7ba48439f377ddbc2bfd18e79675e1df3d5b', '2a4f42ba89cfdd93', '2021-05-19 08:40:00.287204', 1, '2021-05-19 18:40:00.287204', '5a9380e3'),
('f9bea1e6c0cc52049e57bc0ad576e54e3a403b066527a5e38eaa15f4c376a99ff5903cf46c3d193f02b530b8a31fcb2f03c6143631a7c456875db07f0340ddfa', 'ed12dc2e17f08870', '2021-05-19 08:42:23.955963', 2, '2021-05-19 18:42:23.954962', '897e7504'),
('60a5803b2e4716dcbb8bde28ccbe74bedb6a5415c93c7a5a6f974632a43a11a060f2c632658d72a94f923914ef10021d477f6cb32d6da05f7c2c57e4d783c92e', '1814c39e5849846f', '2021-05-19 08:43:39.056697', 3, '2021-05-19 18:43:39.056697', 'e3035196'),
('0dcb5926e17b530399e8ff4d0a62119c9d5f679f60d34f311691954a925ced088571c565f469545ca900c6874e7e52e3af02e56d6aa93774160fe9516a776631', 'd83f97d2f9532aef', '2021-05-19 08:52:49.696992', 3, '2021-05-19 18:52:49.696992', '85222d1d'),
('cbd5da36d6059330c208f4f571595f515b80469618a901cc02bbe0e34b4c96a31c55f74f5ade9b5506e03e470847fcbaf0a21da15fd7b0bf0610d399cfbfa79f', '2323347769c4bafd', '2021-05-19 08:53:04.966462', 3, '2021-05-19 18:53:04.966462', '2eebd906'),
('e5e5645ab3d76e59acc37498ae649d901ea029300ed5794a0dccd2f4c6662ab4d9b19e64a4f00118605e24c50fc6c85fb47cd497ba88496c520cb536ef776362', '397329c738029831', '2021-05-19 09:01:09.281450', 3, '2021-05-19 19:01:09.281450', '545c648b'),
('06216de0a402872e135d164e98da354a970dc89e5884615e884facc63e1ec95ac76ab1156793a9ac29e46bbf2b752334ad3776084f5b80de47d5b96f8357190a', '92542278e3da1e93', '2021-06-02 06:01:45.987988', 4, '2021-06-02 16:01:45.986987', '0707f49a'),
('9eca9ada8167968000780937ef416e9890e4542150edb28d9ee666d3c5e05e566dcf475d3822a0848dc3eea1094c100bac38f18c63a88276f793698e9f318212', 'd37622633774b137', '2021-05-19 15:12:10.712672', 3, '2021-05-20 01:12:10.711668', '67aef45e'),
('14525eaf0cb0044abae212e9888ac40f334c4341e5a115c3c74ce437efc2cd4d9332c373818cc3760a577e88dd25d21a7c9dd643c998b0e3fa56b3b7f071ebd7', '081818e412bafd66', '2021-05-19 15:12:28.671839', 3, '2021-05-20 01:12:28.671839', 'd920e5c7'),
('63682bdae52bb2396d72adbec1f45054704fa948bc1baff242627b55ccb2df3b336eec47d4591ed0aa2e936f23477e586899ca2e8f0021f5e0f8b03cd278934c', '9fac4b810ef57a6d', '2021-05-19 15:12:43.442355', 3, '2021-05-20 01:12:43.441353', '9ab3b4be'),
('3290c57d3028685f52cd5d64748a81013eeadb42b64890107ae1617d96937a5ef3017f7c80ad1dba34cc27edafe8e2a6ac624028837e9f44bd3e5052d70c71d7', '9b8267c002858f7c', '2021-05-19 15:13:16.905331', 3, '2021-05-20 01:13:16.905331', 'd8079013'),
('719aac7da15a978e77076dcd5a6bc3a1f0c9173c7f27ca9872353de03ec659114f71556e3f1c8414dd7c6fcf8366644bbcb74db0c1d17992305625efeb97ab16', 'fb684c7800cf0822', '2021-05-19 15:15:12.113956', 3, '2021-05-20 01:15:12.113956', '361b2c1d'),
('684ab8043dc819817cbfe17a79c6649db44bd4c696f78419bb153a8f49b875fc29117938a88daa8a916de3c610c91dd8afb3b4c1b877f8b80f80901ab549a4fc', 'af7629b498506a34', '2021-05-19 16:23:40.643377', 3, '2021-05-20 02:23:40.643377', '7e0b8476'),
('abf75ca4175cae45396e0abea9daae4442e5a03d758a5aac56fbee596c1555cd1aee1a20320625b31eb4bd1107bac4e0510fb0140cb8fd86ba09e69d918a6be9', '10150437922cef97', '2021-05-19 17:20:23.597621', 5, '2021-05-20 03:20:23.597621', '91b59428');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
