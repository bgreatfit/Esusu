-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: cowrywise-mysql
-- Generation Time: Sep 04, 2019 at 12:42 AM
-- Server version: 5.6.43
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cowrywise_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
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
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add user profile', 7, 'add_userprofile'),
(26, 'Can change user profile', 7, 'change_userprofile'),
(27, 'Can delete user profile', 7, 'delete_userprofile'),
(28, 'Can view user profile', 7, 'view_userprofile'),
(29, 'Can add group', 8, 'add_group'),
(30, 'Can change group', 8, 'change_group'),
(31, 'Can delete group', 8, 'delete_group'),
(32, 'Can view group', 8, 'view_group'),
(33, 'Can add member', 9, 'add_member'),
(34, 'Can change member', 9, 'change_member'),
(35, 'Can delete member', 9, 'delete_member'),
(36, 'Can view member', 9, 'view_member'),
(37, 'Can add account', 10, 'add_account'),
(38, 'Can change account', 10, 'change_account'),
(39, 'Can delete account', 10, 'delete_account'),
(40, 'Can view account', 10, 'view_account'),
(41, 'Can add transaction', 11, 'add_transaction'),
(42, 'Can change transaction', 11, 'change_transaction'),
(43, 'Can delete transaction', 11, 'delete_transaction'),
(44, 'Can view transaction', 11, 'view_transaction');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(3, '2019-08-02 06:34:55.654302', '1', 'GREATMEN', 3, '', 8, 2),
(4, '2019-08-02 06:35:17.834049', '2', 'GREATMEN', 1, '[{\"added\": {}}]', 8, 2),
(5, '2019-08-02 06:39:11.513854', '2', 'GREATMEN', 2, '[{\"changed\": {\"name\": \"member\", \"object\": \"Member object (42df6bda-ebab-4018-b06d-9fcc7c56ad70)\", \"fields\": [\"contribution\"]}}]', 8, 2),
(6, '2019-08-03 08:18:39.570372', '3', 'SYSSOFT', 1, '[{\"added\": {}}]', 8, 2),
(7, '2019-08-03 08:45:56.706973', '5', 'English', 1, '[{\"added\": {}}]', 8, 2),
(8, '2019-08-03 15:05:47.496774', '6', 'Zipp', 1, '[{\"added\": {}}]', 8, 2),
(9, '2019-08-03 15:13:49.513827', '9', 'MEN', 1, '[{\"added\": {}}]', 8, 2),
(10, '2019-08-03 15:15:25.233994', '9', 'MEN', 2, '[{\"changed\": {\"name\": \"member\", \"object\": \"Member object (e59d753d-3acd-4164-81fb-63fcabd2d032)\", \"fields\": [\"contribution\"]}}]', 8, 2),
(11, '2019-08-04 04:52:20.990214', '10', 'UNIQUE', 3, '', 8, 2),
(12, '2019-08-04 04:52:21.026775', '10', 'UNIQUE', 3, '', 8, 2);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(10, 'esusu', 'account'),
(8, 'esusu', 'group'),
(9, 'esusu', 'member'),
(11, 'esusu', 'transaction'),
(6, 'esusu', 'user'),
(7, 'esusu', 'userprofile'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-08-02 05:02:04.799413'),
(2, 'contenttypes', '0002_remove_content_type_name', '2019-08-02 05:02:07.663651'),
(3, 'auth', '0001_initial', '2019-08-02 05:02:10.238803'),
(4, 'auth', '0002_alter_permission_name_max_length', '2019-08-02 05:02:19.110870'),
(5, 'auth', '0003_alter_user_email_max_length', '2019-08-02 05:02:19.239460'),
(6, 'auth', '0004_alter_user_username_opts', '2019-08-02 05:02:19.416613'),
(7, 'auth', '0005_alter_user_last_login_null', '2019-08-02 05:02:19.594721'),
(8, 'auth', '0006_require_contenttypes_0002', '2019-08-02 05:02:19.688970'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2019-08-02 05:02:19.783975'),
(10, 'auth', '0008_alter_user_username_max_length', '2019-08-02 05:02:19.872492'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2019-08-02 05:02:19.961244'),
(12, 'auth', '0010_alter_group_name_max_length', '2019-08-02 05:02:21.792824'),
(13, 'auth', '0011_update_proxy_permissions', '2019-08-02 05:02:21.912945'),
(14, 'esusu', '0001_initial', '2019-08-02 05:02:25.748601'),
(15, 'admin', '0001_initial', '2019-08-02 05:02:36.937146'),
(16, 'admin', '0002_logentry_remove_auto_add', '2019-08-02 05:02:40.936220'),
(17, 'admin', '0003_logentry_add_action_flag_choices', '2019-08-02 05:02:41.087517'),
(18, 'esusu', '0002_auto_20190731_0733', '2019-08-02 05:02:48.774200'),
(19, 'esusu', '0003_auto_20190801_0909', '2019-08-02 05:02:58.618419'),
(20, 'esusu', '0004_auto_20190801_1618', '2019-08-02 05:03:03.439204'),
(21, 'esusu', '0005_auto_20190802_0458', '2019-08-02 05:03:08.503637'),
(22, 'sessions', '0001_initial', '2019-08-02 05:03:13.965542'),
(23, 'esusu', '0006_auto_20190802_0629', '2019-08-02 06:29:34.116112'),
(24, 'esusu', '0007_auto_20190806_0419', '2019-08-06 04:21:08.827090'),
(25, 'esusu', '0008_auto_20190807_0602', '2019-08-13 05:16:53.571063'),
(26, 'esusu', '0009_auto_20190813_0514', '2019-08-13 05:16:53.905249'),
(27, 'esusu', '0010_remove_group_slug', '2019-08-13 05:16:55.454968'),
(28, 'esusu', '0011_auto_20190815_0555', '2019-08-15 05:55:38.322137'),
(29, 'esusu', '0012_auto_20190827_0610', '2019-08-27 06:10:56.384344'),
(30, 'esusu', '0013_auto_20190827_0637', '2019-08-27 06:37:43.678991'),
(31, 'esusu', '0014_account_transaction', '2019-09-02 04:10:59.973007'),
(32, 'esusu', '0015_auto_20190902_0448', '2019-09-02 04:49:00.833846'),
(33, 'esusu', '0016_user_amount', '2019-09-02 06:56:19.651653'),
(34, 'esusu', '0017_auto_20190902_0700', '2019-09-02 07:00:09.400397');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('2o2oynco51e11g30rxeejkd9hyfu0zl7', 'YjZlZDMwNDBhOTE1ZDhiYmQ3ZDdlYzE3YWUwMmRhY2Q5YTEyMTc4Nzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkMWJlZWU4ZTExYjkwMDIyYjA4YWIyZjkwYjczMzdmM2NiMGJlOGQ5In0=', '2019-09-07 09:40:43.733482'),
('7hfakxkhqgz7fe68f53nwr0comqqkdtc', 'YjZlZDMwNDBhOTE1ZDhiYmQ3ZDdlYzE3YWUwMmRhY2Q5YTEyMTc4Nzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkMWJlZWU4ZTExYjkwMDIyYjA4YWIyZjkwYjczMzdmM2NiMGJlOGQ5In0=', '2019-09-06 05:42:19.128824'),
('h1k6u1n2aii9iw8889pt7sxkz7seq57v', 'YjZlZDMwNDBhOTE1ZDhiYmQ3ZDdlYzE3YWUwMmRhY2Q5YTEyMTc4Nzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkMWJlZWU4ZTExYjkwMDIyYjA4YWIyZjkwYjczMzdmM2NiMGJlOGQ5In0=', '2019-08-21 05:51:31.997909');

-- --------------------------------------------------------

--
-- Table structure for table `esusu_account`
--

CREATE TABLE `esusu_account` (
  `account_id` char(32) NOT NULL,
  `balance` decimal(14,2) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `esusu_account`
--

INSERT INTO `esusu_account` (`account_id`, `balance`, `created_at`, `updated_at`, `user_id`) VALUES
('77a5b7e3bf6e4fcb9a1dff332ec01b3a', '500000.00', '2019-09-02 04:24:39.875506', '2019-09-02 04:24:39.875719', 16),
('7f4fe27729634328b21d20ebb5d74483', '500000.00', '2019-09-02 04:30:49.504185', '2019-09-02 04:30:49.504462', 17),
('c80b385b412446618424cf61c01c481e', '500000.00', '2019-09-02 04:32:01.897978', '2019-09-02 04:32:01.898321', 18);

-- --------------------------------------------------------

--
-- Table structure for table `esusu_group`
--

CREATE TABLE `esusu_group` (
  `id` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `max_number` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_searchable` varchar(1) NOT NULL,
  `max_amount` decimal(10,2) NOT NULL,
  `name` varchar(55) NOT NULL,
  `share_link` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `esusu_group`
--

INSERT INTO `esusu_group` (`id`, `description`, `max_number`, `created_at`, `updated_at`, `user_id`, `is_searchable`, `max_amount`, `name`, `share_link`) VALUES
(2, 'HEY', 10, '2019-08-02 06:35:17.832918', '2019-08-02 06:39:11.508907', 2, '1', '50000.00', 'GREATMEN', '4'),
(3, 'Great People', 5, '2019-08-03 08:18:39.566851', '2019-08-21 01:24:27.320614', 2, '0', '50000.00', 'syssoft', NULL),
(5, 'FELLAS', 5, '2019-08-03 08:45:56.704213', '2019-08-03 08:45:56.704262', 2, '1', '10000.00', 'English', NULL),
(6, 'HAPPY', 30, '2019-08-03 15:05:47.494652', '2019-08-03 15:05:47.494711', 7, '1', '500000.00', 'Zipp', NULL),
(9, 'MEN', 10, '2019-08-03 15:13:49.509554', '2019-08-03 15:15:25.227478', 3, '1', '5000.00', 'MEN', NULL),
(10, 'update hwt', 10, '2019-08-13 05:09:48.132944', '2019-08-18 16:18:42.910576', 2, '1', '10000.00', 'mennn', 'ABC'),
(11, 'HEY kenny', 10, '2019-08-15 06:26:37.903941', '2019-08-15 06:26:37.903987', 2, '1', '10000.00', 'KENNY', NULL),
(12, 'HEY kenny', 10, '2019-08-15 23:46:28.079920', '2019-08-16 05:01:11.541086', 2, '1', '10000.00', 'UNIQUE', NULL),
(13, 'HEY kenny', 10, '2019-08-15 23:48:46.756525', '2019-08-15 23:48:46.756594', 2, '1', '10000.00', '007', NULL),
(14, 'HEY Today', 10, '2019-08-16 05:06:51.392836', '2019-08-16 05:40:00.866113', 2, '1', '10000.00', 'TODAY', NULL),
(15, 'HEY Today', 10, '2019-08-16 05:40:35.965378', '2019-08-16 06:23:17.475669', 2, '1', '10000.00', 'sharp', NULL),
(16, 'HEY Today', 10, '2019-08-16 06:24:02.005898', '2019-08-16 06:33:33.749240', 2, '1', '10000.00', 'makeit123', NULL),
(17, 'HEY Today', 10, '2019-08-16 06:33:55.267819', '2019-08-16 06:36:06.442090', 2, '1', '10000.00', 'help', ''),
(22, 'HEY Today', 10, '2019-08-16 06:37:34.484220', '2019-08-16 06:37:34.484264', 2, '1', '10000.00', 'touched', NULL),
(23, 'HEY Today', 10, '2019-08-16 06:48:34.760974', '2019-08-16 06:48:55.461769', 2, '1', '10000.00', 'new', NULL),
(24, 'HEY Today', 10, '2019-08-16 06:50:46.928035', '2019-08-17 19:04:06.023582', 2, '1', '10000.00', 'try', NULL),
(25, 'HEY Today', 10, '2019-08-17 19:04:41.365507', '2019-08-17 19:25:49.991722', 2, '1', '10000.00', 'gsmo', 'ABCC'),
(26, 'HEY Today', 10, '2019-08-17 19:26:34.982984', '2019-08-17 19:33:19.468952', 3, '1', '10000.00', 'sos', '3'),
(27, 'update hwt', 10, '2019-08-18 16:19:44.723681', '2019-08-18 16:21:01.920624', 2, '1', '10000.00', 'tobi', NULL),
(28, 'update hwt', 10, '2019-08-18 16:21:19.453091', '2019-08-18 16:23:02.931187', 2, '1', '10000.00', 'ikk', 'ccc'),
(29, 'update hwt', 10, '2019-08-18 16:27:46.909233', '2019-08-18 16:27:46.909312', 2, '1', '10000.00', 'ooo', '<property objec'),
(30, 'update hwt', 10, '2019-08-18 16:29:15.819415', '2019-08-18 16:29:15.819455', 2, '1', '10000.00', 'oll', '<staticmethod o'),
(31, 'update hwt', 10, '2019-08-18 16:35:10.967948', '2019-08-18 16:35:10.968009', 2, '1', '10000.00', 'iiiiii', '{\'share_link\': '),
(32, 'update hwt', 10, '2019-08-18 16:36:02.578689', '2019-08-18 16:40:52.830090', 2, '1', '10000.00', 'hhhh', 'iqRz6lIBfvDHVi9'),
(33, 'update hwt', 10, '2019-08-18 16:41:44.671199', '2019-08-18 16:42:05.524391', 2, '1', '10000.00', 'eeeee', 'puUZP3jWMxRbCDn'),
(34, 'update hwt', 10, '2019-08-18 16:42:23.444658', '2019-08-18 16:43:28.265307', 2, '1', '10000.00', '77777', '7jnK3tS8133w9Jm'),
(35, 'Test', 1234567, '2019-08-24 06:00:39.250063', '2019-08-24 06:00:39.250121', 2, '1', '50000.00', 'test', '4GMDZxehJyeGFf7'),
(36, 'Beird', 1234567, '2019-08-25 16:49:33.276074', '2019-08-25 16:49:33.276187', 2, '1', '50000.00', 'beird', 'd8Mle7lqQwuhoQg');

-- --------------------------------------------------------

--
-- Table structure for table `esusu_member`
--

CREATE TABLE `esusu_member` (
  `id` int(11) NOT NULL,
  `rank` int(11) DEFAULT NULL,
  `contribution` decimal(10,2) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `esusu_member`
--

INSERT INTO `esusu_member` (`id`, `rank`, `contribution`, `created_at`, `updated_at`, `group_id`, `user_id`) VALUES
(1, NULL, '50000.00', '2019-08-03 15:13:49.511037', '2019-08-03 15:15:25.231413', 9, 2),
(2, NULL, '5000.00', '2019-08-03 17:22:58.227241', '2019-08-03 17:22:58.227317', 2, 7),
(3, NULL, '50000.00', '2019-08-02 06:35:17.831997', '2019-08-02 06:39:11.510269', 2, 2),
(4, NULL, '10000.00', '2019-08-15 23:48:46.850843', '2019-08-15 23:48:46.850902', 13, 2),
(5, NULL, '10000.00', '2019-08-16 05:06:51.535496', '2019-08-16 05:06:51.535534', 14, 2),
(6, NULL, '10000.00', '2019-08-16 05:40:36.552536', '2019-08-16 05:40:36.552656', 15, 2),
(7, NULL, '10000.00', '2019-08-16 06:24:02.120514', '2019-08-16 06:24:02.120555', 16, 2),
(8, NULL, '10000.00', '2019-08-16 06:33:55.377890', '2019-08-16 06:33:55.377953', 17, 2),
(9, NULL, '10000.00', '2019-08-16 06:37:34.634312', '2019-08-16 06:37:34.634377', 22, 2),
(10, NULL, '10000.00', '2019-08-16 06:48:34.868392', '2019-08-16 06:48:34.868461', 23, 2),
(11, NULL, '10000.00', '2019-08-16 06:50:47.034472', '2019-08-16 06:50:47.034529', 24, 2),
(12, NULL, '10000.00', '2019-08-17 19:04:41.482018', '2019-08-17 19:04:41.482063', 25, 2),
(13, NULL, '10000.00', '2019-08-17 19:26:35.168274', '2019-08-17 19:26:35.168340', 26, 3),
(14, NULL, '10000.00', '2019-08-18 10:21:34.957498', '2019-08-18 10:21:34.957545', 2, NULL),
(15, NULL, '10000.00', '2019-08-18 16:19:44.850348', '2019-08-18 16:19:44.850419', 27, 2),
(16, NULL, '10000.00', '2019-08-18 16:21:19.572373', '2019-08-18 16:21:19.572437', 28, 2),
(17, NULL, '10000.00', '2019-08-18 16:27:47.015000', '2019-08-18 16:27:47.015049', 29, 2),
(18, NULL, '10000.00', '2019-08-18 16:29:15.934757', '2019-08-18 16:29:15.934862', 30, 2),
(19, NULL, '10000.00', '2019-08-18 16:35:11.206427', '2019-08-18 16:35:11.206482', 31, 2),
(20, NULL, '10000.00', '2019-08-18 16:36:02.684736', '2019-08-18 16:36:02.684848', 32, 2),
(21, NULL, '10000.00', '2019-08-18 16:41:44.763838', '2019-08-18 16:41:44.763921', 33, 2),
(22, NULL, '10000.00', '2019-08-18 16:42:23.565342', '2019-08-18 16:42:23.565395', 34, 2),
(23, NULL, '0.00', '2019-08-21 02:02:14.288965', '2019-08-21 02:02:14.289014', 2, NULL),
(24, NULL, '0.00', '2019-08-21 02:03:52.497333', '2019-08-21 02:03:52.497400', 2, NULL),
(25, NULL, '0.00', '2019-08-21 02:04:52.905968', '2019-08-21 02:04:52.906395', 2, NULL),
(26, NULL, '0.00', '2019-08-21 02:08:53.690147', '2019-08-21 02:08:53.690222', 2, NULL),
(27, NULL, '50000.00', '2019-08-24 06:00:39.425545', '2019-08-24 06:00:39.425589', 35, 2),
(28, NULL, '50000.00', '2019-08-25 16:49:33.460653', '2019-08-25 16:49:33.460718', 36, 2);

-- --------------------------------------------------------

--
-- Table structure for table `esusu_transaction`
--

CREATE TABLE `esusu_transaction` (
  `trans_id` char(32) NOT NULL,
  `amount` decimal(14,2) NOT NULL,
  `receipt_no` varchar(15) NOT NULL,
  `trans_type` varchar(15) NOT NULL,
  `trans_date` datetime(6) NOT NULL,
  `response` longtext NOT NULL,
  `account_id_id` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `esusu_user`
--

CREATE TABLE `esusu_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `verification_uuid` char(32) NOT NULL,
  `pay_freq` varchar(1) NOT NULL,
  `contribution` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `esusu_user`
--

INSERT INTO `esusu_user` (`id`, `password`, `last_login`, `is_superuser`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `username`, `email`, `is_verified`, `verification_uuid`, `pay_freq`, `contribution`) VALUES
(2, 'pbkdf2_sha256$150000$5NlH7Eatqavi$vyHRTySOteNeTcrn+B3K8grc8ZYGtlkYZqlyi6yrHso=', '2019-08-24 09:40:43.632972', 1, 'Mike', '', 1, 1, '2019-08-02 06:34:35.762451', 'MikeGreat', 'test@test.com', 0, 'bb29a6009de04a0cb45697d39ec62d69', 'D', '10000.00'),
(3, 'pbkdf2_sha256$150000$9xHerXYrUSiJ$Zy/7I435ez71wWrYF/xXlgRjj9LH7nUZCc5ZKQD+JQA=', NULL, 0, '', '', 0, 1, '2019-08-03 16:41:26.440447', 'seun', 'mioshine2011@gmail.com', 0, 'bb29a6009de04a0cb45697d39ec62d69', 'D', '10000.00'),
(4, 'pbkdf2_sha256$150000$E8a1KE9wQHgW$t8OTVqNSu7EuebqKmfnJZqao/Lbn/FTC62h+Jfewhzw=', NULL, 0, '', '', 0, 1, '2019-08-03 16:48:08.010225', 'segun', 'mioshine2000@gmail.com', 0, 'bb29a6009de04a0cb45697d39ec62d69', 'D', '10000.00'),
(5, 'pbkdf2_sha256$150000$4mr1BAvwSV9J$Qql6ci3LkdajBpWdzI0tmYJr4Nhjk1Po/Wnnk5+cr80=', NULL, 0, '', '', 0, 1, '2019-08-03 16:57:07.241919', 'tosin', 'mioshine2008@gmail.com', 0, 'bb29a6009de04a0cb45697d39ec62d69', 'D', '10000.00'),
(6, 'pbkdf2_sha256$150000$XmoCvfwFzmiD$yha3z/NKUfQvvm1C+bbP3nNCpSYV2ymzBS9imqwwnTQ=', NULL, 0, '', '', 0, 1, '2019-08-03 16:59:43.825423', 'femi', 'mioshine2098@gmail.com', 0, 'bb29a6009de04a0cb45697d39ec62d69', 'D', '10000.00'),
(7, 'pbkdf2_sha256$150000$u5dehWU9CBTA$zvXnvx9Ljr2xDU/MZqc/Or2PhQT8J2E0OMx2Ggcicok=', NULL, 0, '', '', 0, 1, '2019-08-03 17:05:46.450078', 'cane', 'mioshine2001@gmail.com', 0, 'bb29a6009de04a0cb45697d39ec62d69', 'D', '10000.00'),
(8, 'pbkdf2_sha256$150000$CSLXtdenQaxw$+ZV3TqArVVfmHOZSGoseJby9P/yeGmWkbhdAQalnz8o=', NULL, 0, '', '', 0, 1, '2019-08-27 06:26:20.419189', 'Chief', 'mike@mike.com', 0, '8b499eea2be6404d92831d74f27c8ca3', 'D', '10000.00'),
(9, 'pbkdf2_sha256$150000$igHn32lJWgpy$p+89SisDBZJHek4IyP8nxp5v7mTjQMje+ujQQPGzngg=', NULL, 0, '', '', 0, 1, '2019-08-27 06:37:54.233672', 'Chief', 'mike@ken.com', 0, '7ffef979834c4e4c98b64e894adae7c6', 'D', '10000.00'),
(10, 'pbkdf2_sha256$150000$wR1ffRqnIXQp$+fHZ1bAI7ebqiBH07eI5xkdd7JBBAqwu4TBoaMdBCoU=', NULL, 0, '', '', 0, 1, '2019-08-27 06:44:00.940136', 'Chief', 'mike@tools.com', 0, '65b90c13519c4878a8628619be7170cd', 'D', '10000.00'),
(11, 'pbkdf2_sha256$150000$3mduv4aEg4kB$q+IOFt5oK0Ti6Gahgm/7cW1V5giDl0CqJS1X9he9Hjw=', NULL, 0, '', '', 0, 1, '2019-08-27 06:44:55.867081', 'Chief', 'mike@too.com', 0, 'f337c35b405c432e90ee2e1cfbbf0fbf', 'D', '10000.00'),
(12, 'pbkdf2_sha256$150000$N62H5vCFGoJT$GXA5wOV1MX9KfS9MRZDpjXxoAqx+US+RfzBdx06yR64=', NULL, 0, '', '', 0, 1, '2019-08-27 06:45:36.315570', 'Chief', 'mike@to.com', 1, '1d6d669b212e4e98993e1eb4ea179905', 'D', '10000.00'),
(13, 'pbkdf2_sha256$150000$tNL3nZTJzuLO$5njX3KZNTUdrw8J9iLlIrIbx4sJdvsEPNeJ8BfshJ3Q=', NULL, 0, '', '', 0, 1, '2019-08-27 06:55:27.246831', 'Chief', 'tu@to.com', 0, '0a7c7411885a426888aca3f95358c009', 'D', '10000.00'),
(14, 'pbkdf2_sha256$150000$h0wQXDuFV2hN$3v8kP9H3ui3VAPYMahruhmagzSMX9Fqxa2nshBhzG+U=', NULL, 0, '', '', 0, 1, '2019-08-27 23:05:14.773902', 'Chief', 'yuu@to.com', 0, '5d6efab2b0354632855b2a4230219688', 'D', '10000.00'),
(15, 'pbkdf2_sha256$150000$TkcSKqw0PpxK$yRwJGFQiIriURIbK/slvIxm4fWJUPD+zSRhxjk9D59Y=', NULL, 0, '', '', 0, 1, '2019-08-27 23:06:34.971951', 'Chief', 'hu@to.com', 0, 'ecde707d3b774918a37485132ba122ee', 'D', '10000.00'),
(16, 'pbkdf2_sha256$150000$WjE0shI4A6O0$o6qFxj3bIfiu9LRjz1sViWcXEvdirHhYyZsIfMfzibk=', NULL, 0, '', '', 0, 1, '2019-09-02 04:24:36.564275', 'Chairman', 'new@to.com', 0, '6f1f837479d143188ada5e4cf3ef6b6b', 'D', '10000.00'),
(17, 'pbkdf2_sha256$150000$IZ2e7g6RGBxS$9vr+kOt+ntDwJNI4WcSqeEW6YBHV935CMnhFdhmhjDI=', NULL, 0, '', '', 0, 1, '2019-09-02 04:30:46.539020', 'Susu', 'susu@to.com', 0, '5745090d5b4d4c929f64c7d7bf525c0d', 'D', '10000.00'),
(18, 'pbkdf2_sha256$150000$usFQuKC4T87G$fW26FGXyPJoo+egozvphBvjuZxEH8gQPJRaSqBjhKEE=', NULL, 0, '', '', 0, 1, '2019-09-02 04:31:59.168336', 'Sum', 'sumsum@to.com', 0, 'de3e07cc8fca4f5aa5de8e90d32fd953', 'D', '10000.00');

-- --------------------------------------------------------

--
-- Table structure for table `esusu_user_groups`
--

CREATE TABLE `esusu_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `esusu_user_user_permissions`
--

CREATE TABLE `esusu_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_esusu_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `esusu_account`
--
ALTER TABLE `esusu_account`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `esusu_account_user_id_d111dca7_fk_esusu_user_id` (`user_id`);

--
-- Indexes for table `esusu_group`
--
ALTER TABLE `esusu_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `esusu_group_name_20a7619b_uniq` (`name`),
  ADD UNIQUE KEY `share_link` (`share_link`),
  ADD KEY `esusu_group_user_id_a0553871_fk_esusu_user_id` (`user_id`);

--
-- Indexes for table `esusu_member`
--
ALTER TABLE `esusu_member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `esusu_member_group_id_d8f6faf1_fk_esusu_group_id` (`group_id`),
  ADD KEY `esusu_member_user_id_22aaac45_fk_esusu_user_id` (`user_id`);

--
-- Indexes for table `esusu_transaction`
--
ALTER TABLE `esusu_transaction`
  ADD PRIMARY KEY (`trans_id`),
  ADD KEY `esusu_transaction_account_id_id_517ed13a_fk_esusu_acc` (`account_id_id`);

--
-- Indexes for table `esusu_user`
--
ALTER TABLE `esusu_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `esusu_user_groups`
--
ALTER TABLE `esusu_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `esusu_user_groups_user_id_group_id_996e65ed_uniq` (`user_id`,`group_id`),
  ADD KEY `esusu_user_groups_group_id_6e4e6562_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `esusu_user_user_permissions`
--
ALTER TABLE `esusu_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `esusu_user_user_permissions_user_id_permission_id_0ef81b8e_uniq` (`user_id`,`permission_id`),
  ADD KEY `esusu_user_user_perm_permission_id_0624c550_fk_auth_perm` (`permission_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `esusu_group`
--
ALTER TABLE `esusu_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `esusu_member`
--
ALTER TABLE `esusu_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `esusu_user`
--
ALTER TABLE `esusu_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `esusu_user_groups`
--
ALTER TABLE `esusu_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `esusu_user_user_permissions`
--
ALTER TABLE `esusu_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_esusu_user_id` FOREIGN KEY (`user_id`) REFERENCES `esusu_user` (`id`);

--
-- Constraints for table `esusu_account`
--
ALTER TABLE `esusu_account`
  ADD CONSTRAINT `esusu_account_user_id_d111dca7_fk_esusu_user_id` FOREIGN KEY (`user_id`) REFERENCES `esusu_user` (`id`);

--
-- Constraints for table `esusu_group`
--
ALTER TABLE `esusu_group`
  ADD CONSTRAINT `esusu_group_user_id_a0553871_fk_esusu_user_id` FOREIGN KEY (`user_id`) REFERENCES `esusu_user` (`id`);

--
-- Constraints for table `esusu_member`
--
ALTER TABLE `esusu_member`
  ADD CONSTRAINT `esusu_member_group_id_d8f6faf1_fk_esusu_group_id` FOREIGN KEY (`group_id`) REFERENCES `esusu_group` (`id`),
  ADD CONSTRAINT `esusu_member_user_id_22aaac45_fk_esusu_user_id` FOREIGN KEY (`user_id`) REFERENCES `esusu_user` (`id`);

--
-- Constraints for table `esusu_transaction`
--
ALTER TABLE `esusu_transaction`
  ADD CONSTRAINT `esusu_transaction_account_id_id_517ed13a_fk_esusu_acc` FOREIGN KEY (`account_id_id`) REFERENCES `esusu_account` (`account_id`);

--
-- Constraints for table `esusu_user_groups`
--
ALTER TABLE `esusu_user_groups`
  ADD CONSTRAINT `esusu_user_groups_group_id_6e4e6562_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `esusu_user_groups_user_id_e845bd25_fk_esusu_user_id` FOREIGN KEY (`user_id`) REFERENCES `esusu_user` (`id`);

--
-- Constraints for table `esusu_user_user_permissions`
--
ALTER TABLE `esusu_user_user_permissions`
  ADD CONSTRAINT `esusu_user_user_perm_permission_id_0624c550_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `esusu_user_user_permissions_user_id_ecc850c1_fk_esusu_user_id` FOREIGN KEY (`user_id`) REFERENCES `esusu_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
