-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 172.19.0.2
-- Generation Time: Aug 01, 2019 at 05:41 PM
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
(33, 'Can add group instance', 9, 'add_groupinstance'),
(34, 'Can change group instance', 9, 'change_groupinstance'),
(35, 'Can delete group instance', 9, 'delete_groupinstance'),
(36, 'Can view group instance', 9, 'view_groupinstance');

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
(1, '2019-07-27 10:37:07.827752', '1', 'mioshine2011@gmail.com', 2, '[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\"]}}, {\"added\": {\"name\": \"user profile\", \"object\": \"UserProfile object (1)\"}}]', 6, 1),
(2, '2019-08-01 12:18:15.054143', '1', 'GREATMAN', 1, '[{\"added\": {}}]', 8, 1),
(3, '2019-08-01 16:52:07.329518', '1', 'HERE', 2, '[{\"changed\": {\"fields\": [\"description\", \"name\", \"amount\"]}}]', 8, 1),
(4, '2019-08-01 16:52:28.642101', '1', 'HERE', 2, '[]', 8, 1),
(5, '2019-08-01 17:39:08.768627', '2', 'GReatmen', 1, '[{\"added\": {}}]', 8, 1);

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
(9, 'esusu', 'groupinstance'),
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
(1, 'contenttypes', '0001_initial', '2019-07-27 10:32:16.833101'),
(2, 'contenttypes', '0002_remove_content_type_name', '2019-07-27 10:32:19.751020'),
(3, 'auth', '0001_initial', '2019-07-27 10:32:22.591979'),
(4, 'auth', '0002_alter_permission_name_max_length', '2019-07-27 10:32:33.737050'),
(5, 'auth', '0003_alter_user_email_max_length', '2019-07-27 10:32:33.837632'),
(6, 'auth', '0004_alter_user_username_opts', '2019-07-27 10:32:34.067189'),
(7, 'auth', '0005_alter_user_last_login_null', '2019-07-27 10:32:34.189639'),
(8, 'auth', '0006_require_contenttypes_0002', '2019-07-27 10:32:34.304002'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2019-07-27 10:32:34.423002'),
(10, 'auth', '0008_alter_user_username_max_length', '2019-07-27 10:32:34.533014'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2019-07-27 10:32:34.707899'),
(12, 'auth', '0010_alter_group_name_max_length', '2019-07-27 10:32:36.640144'),
(13, 'auth', '0011_update_proxy_permissions', '2019-07-27 10:32:36.761887'),
(14, 'esusu', '0001_initial', '2019-07-27 10:32:40.364883'),
(15, 'admin', '0001_initial', '2019-07-27 10:32:53.898426'),
(16, 'admin', '0002_logentry_remove_auto_add', '2019-07-27 10:32:57.916156'),
(17, 'admin', '0003_logentry_add_action_flag_choices', '2019-07-27 10:32:58.013233'),
(18, 'sessions', '0001_initial', '2019-07-27 10:32:59.130851'),
(19, 'esusu', '0002_auto_20190731_0733', '2019-07-31 07:34:45.884726'),
(20, 'esusu', '0003_auto_20190801_0909', '2019-08-01 16:49:16.691097');

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
('3a4khd93m4wis8aiygmjfbajhr8b03du', 'YmIwMmU3OTNiNGRkZTFmYzI2MmRlZjQxMmRmZWViMzQwNzc5YWE3NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxNDE5MWM1Y2ZlYzlhNjhhNzZmYmRlZjUwNWI3ZWIzZDYyMzAzMDQ2In0=', '2019-08-15 10:49:38.106394'),
('schhs646wd2pf5bqnpzo903z54jaox83', 'YmIwMmU3OTNiNGRkZTFmYzI2MmRlZjQxMmRmZWViMzQwNzc5YWE3NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxNDE5MWM1Y2ZlYzlhNjhhNzZmYmRlZjUwNWI3ZWIzZDYyMzAzMDQ2In0=', '2019-08-10 10:35:32.770035');

-- --------------------------------------------------------

--
-- Table structure for table `esusu_group`
--

CREATE TABLE `esusu_group` (
  `id` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `max_number` int(11) NOT NULL,
  `slot` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_searchable` varchar(1) NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `esusu_group`
--

INSERT INTO `esusu_group` (`id`, `description`, `max_number`, `slot`, `created_at`, `updated_at`, `user_id`, `is_searchable`, `amount`, `name`) VALUES
(1, 'HERE', 10, '[7, 10, 3, 2, 9, 1, 6, 4, 5, 8]', '2019-08-01 12:18:15.049424', '2019-08-01 16:52:28.638759', 1, '1', '50000.00', 'GREATMEN'),
(2, 'GReatmen', 10, '[4, 10, 2, 3, 6, 8, 5, 7, 1, 9]', '2019-08-01 17:39:08.763549', '2019-08-01 17:39:08.763630', 6, '1', '45000.00', 'SYSSOFT');

-- --------------------------------------------------------

--
-- Table structure for table `esusu_groupinstance`
--

CREATE TABLE `esusu_groupinstance` (
  `id` char(32) NOT NULL,
  `contribution` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `rank` int(11) NOT NULL
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
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `esusu_user`
--

INSERT INTO `esusu_user` (`id`, `password`, `last_login`, `is_superuser`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `username`, `email`) VALUES
(1, 'pbkdf2_sha256$150000$DnkxTLvaDsns$blqHMEe6OdVtvfH92bx5WNl8blWhgKdQ/YfJbsaFuEk=', '2019-08-01 10:49:37.911153', 1, 'Micheal', 'Oj', 1, 1, '2019-07-27 10:34:12.000000', 'admin', 'mioshine2011@gmail.com'),
(2, 'pbkdf2_sha256$150000$PQ5lw3GbKes2$Q54agaVhkkOngpcCPw7d9dZkDbBwSm7WcgYygbYurD0=', NULL, 0, 'Micheal', '', 0, 1, '2019-07-29 05:03:40.191194', NULL, 'mioshine@gmail.com'),
(3, 'pbkdf2_sha256$150000$ZqlXa8QtH61f$TfBCRH1W0pipAUvisxNYD4Fc7EStNahB2qt1iTd4eLM=', NULL, 0, 'Micheal', '', 0, 1, '2019-07-29 05:05:13.314683', NULL, 'amin@gmail.com'),
(4, 'pbkdf2_sha256$150000$7IJSx7XNjM3t$Ysu2jktXp1xsnB0qDHCiLmwdbF4kzhRZmQOP05Fd4uU=', NULL, 0, 'mike', '', 0, 1, '2019-07-29 05:17:11.541448', NULL, 'moj@g.vom'),
(5, 'pbkdf2_sha256$150000$fUxCcQNXyHKi$dLPv45Kj3MCNK1RSeTwFhFZ0zjLH8+Lxb3J8J2pvty4=', NULL, 0, 'mike', '', 0, 1, '2019-07-29 05:21:36.295856', NULL, 'jj@g.vom'),
(6, 'pbkdf2_sha256$150000$YO6hBshO3mOi$cvz/5rCKpsAgfibzI34XpYUUzQvpovjYJTZsGrvYkvY=', NULL, 0, 'test', '', 0, 1, '2019-07-30 05:23:47.268395', NULL, 'test@test.com');

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

--
-- Dumping data for table `esusu_userprofile`
--

INSERT INTO `esusu_userprofile` (`id`, `title`, `dob`, `address`, `country`, `city`, `photo`, `user_id`) VALUES
(1, 'Mr', '2019-07-23', 'Jasojo Avenue', 'Nigeria', 'Lagos', 'uploads/IMG_4189.jpg', 1),
(2, '', '2019-07-29', '', '', '', '', 4),
(3, '', '2019-07-29', '', '', '', '', 5);

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
  ADD KEY `esusu_group_user_id_a0553871_fk_esusu_user_id` (`user_id`);

--
-- Indexes for table `esusu_groupinstance`
--
ALTER TABLE `esusu_groupinstance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `esusu_groupinstance_group_id_71a6cbbe_fk_esusu_group_id` (`group_id`),
  ADD KEY `esusu_groupinstance_member_id_dca705c3_fk_esusu_user_id` (`member_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `esusu_group`
--
ALTER TABLE `esusu_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `esusu_user`
--
ALTER TABLE `esusu_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `esusu_userprofile`
--
ALTER TABLE `esusu_userprofile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- Constraints for table `esusu_groupinstance`
--
ALTER TABLE `esusu_groupinstance`
  ADD CONSTRAINT `esusu_groupinstance_group_id_71a6cbbe_fk_esusu_group_id` FOREIGN KEY (`group_id`) REFERENCES `esusu_group` (`id`),
  ADD CONSTRAINT `esusu_groupinstance_member_id_dca705c3_fk_esusu_user_id` FOREIGN KEY (`member_id`) REFERENCES `esusu_user` (`id`);

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
