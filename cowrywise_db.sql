-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: cowrywise-mysql
-- Generation Time: Aug 05, 2019 at 06:28 AM
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
(36, 'Can view member', 9, 'view_member');

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
(8, 'esusu', 'group'),
(9, 'esusu', 'member'),
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
(23, 'esusu', '0006_auto_20190802_0629', '2019-08-02 06:29:34.116112');

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
('h1k6u1n2aii9iw8889pt7sxkz7seq57v', 'YjZlZDMwNDBhOTE1ZDhiYmQ3ZDdlYzE3YWUwMmRhY2Q5YTEyMTc4Nzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkMWJlZWU4ZTExYjkwMDIyYjA4YWIyZjkwYjczMzdmM2NiMGJlOGQ5In0=', '2019-08-16 06:34:42.128318');

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
  `slot` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `esusu_group`
--

INSERT INTO `esusu_group` (`id`, `description`, `max_number`, `created_at`, `updated_at`, `user_id`, `is_searchable`, `slot`, `amount`, `name`) VALUES
(2, 'HEY', 10, '2019-08-02 06:35:17.832918', '2019-08-02 06:39:11.508907', 2, '1', NULL, '50000.00', 'GREATMEN'),
(3, 'People', 5, '2019-08-03 08:18:39.566851', '2019-08-03 08:18:39.566905', 2, '0', NULL, '50000.00', 'SYSSOFT'),
(5, 'FELLAS', 5, '2019-08-03 08:45:56.704213', '2019-08-03 08:45:56.704262', 2, '1', NULL, '10000.00', 'English'),
(6, 'HAPPY', 30, '2019-08-03 15:05:47.494652', '2019-08-03 15:05:47.494711', 2, '1', NULL, '500000.00', 'Zipp'),
(9, 'MEN', 10, '2019-08-03 15:13:49.509554', '2019-08-03 15:15:25.227478', 2, '1', NULL, '5000.00', 'MEN');

-- --------------------------------------------------------

--
-- Table structure for table `esusu_member`
--

CREATE TABLE `esusu_member` (
  `id` char(32) NOT NULL,
  `rank` int(11) DEFAULT NULL,
  `contribution` decimal(10,2) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `esusu_member`
--

INSERT INTO `esusu_member` (`id`, `rank`, `contribution`, `created_at`, `updated_at`, `group_id`, `user_id`) VALUES
('5e59d753d3acd416481fb63fcabd2d03', NULL, '50000.00', '2019-08-03 15:13:49.511037', '2019-08-03 15:15:25.231413', 9, 2),
('e59d753d3acd416481fb63fcabd2d032', NULL, NULL, '2019-08-03 17:22:58.227241', '2019-08-03 17:22:58.227317', NULL, 7),
('e59d753d3acd416481fb63fcabd2d037', NULL, '50000.00', '2019-08-02 06:35:17.831997', '2019-08-02 06:39:11.510269', 2, 2);

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
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `esusu_user`
--

INSERT INTO `esusu_user` (`id`, `password`, `last_login`, `is_superuser`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `username`, `email`) VALUES
(2, 'pbkdf2_sha256$150000$5NlH7Eatqavi$vyHRTySOteNeTcrn+B3K8grc8ZYGtlkYZqlyi6yrHso=', '2019-08-02 06:34:42.037627', 1, 'Mike', '', 1, 1, '2019-08-02 06:34:35.762451', 'MikeGreat', 'test@test.com'),
(3, 'pbkdf2_sha256$150000$9xHerXYrUSiJ$Zy/7I435ez71wWrYF/xXlgRjj9LH7nUZCc5ZKQD+JQA=', NULL, 0, '', '', 0, 1, '2019-08-03 16:41:26.440447', NULL, 'mioshine2011@gmail.com'),
(4, 'pbkdf2_sha256$150000$E8a1KE9wQHgW$t8OTVqNSu7EuebqKmfnJZqao/Lbn/FTC62h+Jfewhzw=', NULL, 0, '', '', 0, 1, '2019-08-03 16:48:08.010225', NULL, 'mioshine2000@gmail.com'),
(5, 'pbkdf2_sha256$150000$4mr1BAvwSV9J$Qql6ci3LkdajBpWdzI0tmYJr4Nhjk1Po/Wnnk5+cr80=', NULL, 0, '', '', 0, 1, '2019-08-03 16:57:07.241919', NULL, 'mioshine2008@gmail.com'),
(6, 'pbkdf2_sha256$150000$XmoCvfwFzmiD$yha3z/NKUfQvvm1C+bbP3nNCpSYV2ymzBS9imqwwnTQ=', NULL, 0, '', '', 0, 1, '2019-08-03 16:59:43.825423', NULL, 'mioshine2098@gmail.com'),
(7, 'pbkdf2_sha256$150000$u5dehWU9CBTA$zvXnvx9Ljr2xDU/MZqc/Or2PhQT8J2E0OMx2Ggcicok=', NULL, 0, '', '', 0, 1, '2019-08-03 17:05:46.450078', NULL, 'mioshine2001@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `esusu_userprofile`
--

CREATE TABLE `esusu_userprofile` (
  `id` int(11) NOT NULL,
  `title` varchar(5) DEFAULT NULL,
  `dob` date NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Indexes for table `esusu_group`
--
ALTER TABLE `esusu_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `esusu_group_name_20a7619b_uniq` (`name`),
  ADD KEY `esusu_group_user_id_a0553871_fk_esusu_user_id` (`user_id`);

--
-- Indexes for table `esusu_member`
--
ALTER TABLE `esusu_member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `esusu_member_group_id_d8f6faf1_fk_esusu_group_id` (`group_id`),
  ADD KEY `esusu_member_user_id_22aaac45_fk_esusu_user_id` (`user_id`);

--
-- Indexes for table `esusu_user`
--
ALTER TABLE `esusu_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `esusu_userprofile`
--
ALTER TABLE `esusu_userprofile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `esusu_group`
--
ALTER TABLE `esusu_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `esusu_user`
--
ALTER TABLE `esusu_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `esusu_userprofile`
--
ALTER TABLE `esusu_userprofile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
-- Constraints for table `esusu_userprofile`
--
ALTER TABLE `esusu_userprofile`
  ADD CONSTRAINT `esusu_userprofile_user_id_f72aefab_fk_esusu_user_id` FOREIGN KEY (`user_id`) REFERENCES `esusu_user` (`id`);

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
