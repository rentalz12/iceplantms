-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2026 at 05:27 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iceplantms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add customer', 1, 'add_customer'),
(2, 'Can change customer', 1, 'change_customer'),
(3, 'Can delete customer', 1, 'delete_customer'),
(4, 'Can view customer', 1, 'view_customer'),
(5, 'Can add inventory', 2, 'add_inventory'),
(6, 'Can change inventory', 2, 'change_inventory'),
(7, 'Can delete inventory', 2, 'delete_inventory'),
(8, 'Can view inventory', 2, 'view_inventory'),
(9, 'Can add order', 3, 'add_order'),
(10, 'Can change order', 3, 'change_order'),
(11, 'Can delete order', 3, 'delete_order'),
(12, 'Can view order', 3, 'view_order'),
(13, 'Can add order item', 4, 'add_orderitem'),
(14, 'Can change order item', 4, 'change_orderitem'),
(15, 'Can delete order item', 4, 'delete_orderitem'),
(16, 'Can view order item', 4, 'view_orderitem'),
(17, 'Can add log entry', 5, 'add_logentry'),
(18, 'Can change log entry', 5, 'change_logentry'),
(19, 'Can delete log entry', 5, 'delete_logentry'),
(20, 'Can view log entry', 5, 'view_logentry'),
(21, 'Can add permission', 6, 'add_permission'),
(22, 'Can change permission', 6, 'change_permission'),
(23, 'Can delete permission', 6, 'delete_permission'),
(24, 'Can view permission', 6, 'view_permission'),
(25, 'Can add group', 7, 'add_group'),
(26, 'Can change group', 7, 'change_group'),
(27, 'Can delete group', 7, 'delete_group'),
(28, 'Can view group', 7, 'view_group'),
(29, 'Can add user', 8, 'add_user'),
(30, 'Can change user', 8, 'change_user'),
(31, 'Can delete user', 8, 'delete_user'),
(32, 'Can view user', 8, 'view_user'),
(33, 'Can add content type', 9, 'add_contenttype'),
(34, 'Can change content type', 9, 'change_contenttype'),
(35, 'Can delete content type', 9, 'delete_contenttype'),
(36, 'Can view content type', 9, 'view_contenttype'),
(37, 'Can add session', 10, 'add_session'),
(38, 'Can change session', 10, 'change_session'),
(39, 'Can delete session', 10, 'delete_session'),
(40, 'Can view session', 10, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--


-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crud_customer`
--

CREATE TABLE `crud_customer` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `crud_customer`
--

INSERT INTO `crud_customer` (`id`, `name`, `address`, `phone`) VALUES
(1, 'Rodolfo Alvarado', 'Roxas City, Capiz', '09171230001'),
(2, 'Marites Fernandez', 'Panay, Capiz', '09171230002'),
(3, 'Joel Villanueva', 'Pontevedra, Capiz', '09171230003'),
(4, 'Lorna Diaz', 'Ivisan, Capiz', '09171230004'),
(5, 'Edgar Ramos', 'Panitan, Capiz', '09171230005'),
(6, 'Nelia Gutierrez', 'Dao, Capiz', '09171230006'),
(7, 'Rico Mendoza', 'Sigma, Capiz', '09171230007'),
(8, 'Cristina Lopez', 'Mambusao, Capiz', '09171230008');

-- --------------------------------------------------------

--
-- Table structure for table `crud_inventory`
--

CREATE TABLE `crud_inventory` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `size` varchar(50) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL CHECK (`quantity` >= 0),
  `last_updated` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `crud_inventory`
--

INSERT INTO `crud_inventory` (`id`, `name`, `size`, `price`, `quantity`, `last_updated`) VALUES
(1, 'Tube Ice', '10kg', 120.00, 6, '2026-05-21 15:26:05.316085'),
(2, 'Tube Ice', '20kg', 240.00, 11, '2026-05-21 15:26:16.063463'),
(3, 'Block Ice', '25kg', 320.00, 11, '2026-05-21 15:25:37.620012'),
(4, 'Block Ice', '50kg', 620.00, 12, '2026-05-21 15:25:35.683738'),
(5, 'Crushed Ice', '5kg', 75.00, 15, '2026-05-21 15:25:44.326792'),
(6, 'Crushed Ice', '10kg', 145.00, 11, '2026-05-21 15:25:41.222273'),
(7, 'Cube Ice', '5kg', 85.00, 16, '2026-05-21 15:25:46.869599'),
(8, 'Flake Ice', '10kg', 155.00, 0, '2026-05-21 15:25:51.007760'),
(9, 'Dry Ice', '2kg', 190.00, 9, '2026-05-21 15:25:18.036671');

-- --------------------------------------------------------

--
-- Table structure for table `crud_order`
--

CREATE TABLE `crud_order` (
  `id` bigint(20) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_phone` varchar(15) NOT NULL,
  `customer_address` varchar(255) NOT NULL,
  `status` varchar(20) NOT NULL,
  `order_date` datetime(6) NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `crud_order`
--

INSERT INTO `crud_order` (`id`, `customer_name`, `customer_phone`, `customer_address`, `status`, `order_date`, `customer_id`) VALUES
(1, 'Rodolfo Alvarado', '09171230001', 'Roxas City, Capiz', 'delivered', '2026-03-01 05:30:00.000000', 1),
(2, 'Rodolfo Alvarado', '09171230001', 'Roxas City, Capiz', 'delivered', '2026-03-05 04:45:00.000000', 1),
(3, 'Rodolfo Alvarado', '09171230001', 'Roxas City, Capiz', 'confirmed', '2026-03-12 06:10:00.000000', 1),
(4, 'Rodolfo Alvarado', '09171230001', 'Roxas City, Capiz', 'pending', '2026-03-18 05:20:00.000000', 1),
(5, 'Marites Fernandez', '09171230002', 'Panay, Capiz', 'delivered', '2026-03-02 07:15:00.000000', 2),
(6, 'Marites Fernandez', '09171230002', 'Panay, Capiz', 'delivered', '2026-03-08 07:00:00.000000', 2),
(7, 'Marites Fernandez', '09171230002', 'Panay, Capiz', 'confirmed', '2026-03-15 06:40:00.000000', 2),
(8, 'Joel Villanueva', '09171230003', 'Pontevedra, Capiz', 'delivered', '2026-03-03 03:50:00.000000', 3),
(9, 'Joel Villanueva', '09171230003', 'Pontevedra, Capiz', 'delivered', '2026-03-10 04:15:00.000000', 3),
(10, 'Joel Villanueva', '09171230003', 'Pontevedra, Capiz', 'confirmed', '2026-03-20 04:00:00.000000', 3),
(11, 'Lorna Diaz', '09171230004', 'Ivisan, Capiz', 'cancelled', '2026-03-06 08:30:00.000000', 4),
(12, 'Lorna Diaz', '09171230004', 'Ivisan, Capiz', 'delivered', '2026-03-14 08:00:00.000000', 4),
(13, 'Edgar Ramos', '09171230005', 'Panitan, Capiz', 'delivered', '2026-03-04 05:00:00.000000', 5),
(14, 'Edgar Ramos', '09171230005', 'Panitan, Capiz', 'pending', '2026-03-19 05:10:00.000000', 5),
(15, 'Nelia Gutierrez', '09171230006', 'Dao, Capiz', 'delivered', '2026-03-09 09:20:00.000000', 6),
(16, 'Nelia Gutierrez', '09171230006', 'Dao, Capiz', 'confirmed', '2026-03-17 09:00:00.000000', 6),
(17, 'Rico Mendoza', '09171230007', 'Sigma, Capiz', 'delivered', '2026-03-11 04:40:00.000000', 7),
(18, 'Rico Mendoza', '09171230007', 'Sigma, Capiz', 'pending', '2026-03-21 04:35:00.000000', 7),
(19, 'Cristina Lopez', '09171230008', 'Mambusao, Capiz', 'delivered', '2026-03-13 07:45:00.000000', 8),
(20, 'Cristina Lopez', '09171230008', 'Mambusao, Capiz', 'confirmed', '2026-03-22 07:50:00.000000', 8);

-- --------------------------------------------------------

--
-- Table structure for table `crud_orderitem`
--

CREATE TABLE `crud_orderitem` (
  `id` bigint(20) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL CHECK (`quantity` >= 0),
  `item_name` varchar(100) NOT NULL,
  `item_size` varchar(50) NOT NULL,
  `item_price` decimal(5,2) NOT NULL,
  `item_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `crud_orderitem`
--

INSERT INTO `crud_orderitem` (`id`, `quantity`, `item_name`, `item_size`, `item_price`, `item_id`, `order_id`) VALUES
(1, 5, 'Tube Ice', '20kg', 240.00, 2, 1),
(2, 2, 'Crushed Ice', '10kg', 145.00, 6, 1),
(3, 4, 'Tube Ice', '20kg', 240.00, 2, 2),
(4, 6, 'Tube Ice', '10kg', 120.00, 1, 3),
(5, 3, 'Cube Ice', '5kg', 85.00, 7, 3),
(6, 2, 'Block Ice', '25kg', 320.00, 3, 4),
(7, 3, 'Crushed Ice', '5kg', 75.00, 5, 5),
(8, 5, 'Crushed Ice', '10kg', 145.00, 6, 6),
(9, 4, 'Cube Ice', '5kg', 85.00, 7, 7),
(10, 8, 'Block Ice', '50kg', 620.00, 4, 8),
(11, 6, 'Tube Ice', '20kg', 240.00, 2, 9),
(12, 10, 'Tube Ice', '10kg', 120.00, 1, 10),
(13, 1, 'Dry Ice', '2kg', 190.00, 9, 11),
(14, 2, 'Cube Ice', '5kg', 85.00, 7, 12),
(15, 5, 'Flake Ice', '10kg', 155.00, 8, 13),
(16, 3, 'Tube Ice', '10kg', 120.00, 1, 14),
(17, 4, 'Crushed Ice', '5kg', 75.00, 5, 15),
(18, 2, 'Block Ice', '25kg', 320.00, 3, 16),
(19, 7, 'Tube Ice', '20kg', 240.00, 2, 17),
(20, 4, 'Cube Ice', '5kg', 85.00, 7, 18),
(21, 3, 'Flake Ice', '10kg', 155.00, 8, 19),
(22, 2, 'Dry Ice', '2kg', 190.00, 9, 20);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(5, 'admin', 'logentry'),
(7, 'auth', 'group'),
(6, 'auth', 'permission'),
(8, 'auth', 'user'),
(9, 'contenttypes', 'contenttype'),
(1, 'crud', 'customer'),
(2, 'crud', 'inventory'),
(3, 'crud', 'order'),
(4, 'crud', 'orderitem'),
(10, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2026-05-21 15:23:36.384056'),
(2, 'auth', '0001_initial', '2026-05-21 15:23:37.138278'),
(3, 'admin', '0001_initial', '2026-05-21 15:23:37.321296'),
(4, 'admin', '0002_logentry_remove_auto_add', '2026-05-21 15:23:37.334022'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2026-05-21 15:23:37.343030'),
(6, 'contenttypes', '0002_remove_content_type_name', '2026-05-21 15:23:37.433222'),
(7, 'auth', '0002_alter_permission_name_max_length', '2026-05-21 15:23:37.523156'),
(8, 'auth', '0003_alter_user_email_max_length', '2026-05-21 15:23:37.542424'),
(9, 'auth', '0004_alter_user_username_opts', '2026-05-21 15:23:37.556008'),
(10, 'auth', '0005_alter_user_last_login_null', '2026-05-21 15:23:37.635612'),
(11, 'auth', '0006_require_contenttypes_0002', '2026-05-21 15:23:37.640944'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2026-05-21 15:23:37.654501'),
(13, 'auth', '0008_alter_user_username_max_length', '2026-05-21 15:23:37.679251'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2026-05-21 15:23:37.700074'),
(15, 'auth', '0010_alter_group_name_max_length', '2026-05-21 15:23:37.721129'),
(16, 'auth', '0011_update_proxy_permissions', '2026-05-21 15:23:37.732511'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2026-05-21 15:23:37.751537'),
(18, 'crud', '0001_initial', '2026-05-21 15:23:38.155666'),
(19, 'sessions', '0001_initial', '2026-05-21 15:23:38.200894');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--


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
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `crud_customer`
--
ALTER TABLE `crud_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crud_inventory`
--
ALTER TABLE `crud_inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crud_order`
--
ALTER TABLE `crud_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crud_order_customer_id_939c7368_fk_crud_customer_id` (`customer_id`);

--
-- Indexes for table `crud_orderitem`
--
ALTER TABLE `crud_orderitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crud_orderitem_item_id_20c8014d_fk_crud_inventory_id` (`item_id`),
  ADD KEY `crud_orderitem_order_id_43915dbf_fk_crud_order_id` (`order_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crud_customer`
--
ALTER TABLE `crud_customer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `crud_inventory`
--
ALTER TABLE `crud_inventory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `crud_order`
--
ALTER TABLE `crud_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `crud_orderitem`
--
ALTER TABLE `crud_orderitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

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
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `crud_order`
--
ALTER TABLE `crud_order`
  ADD CONSTRAINT `crud_order_customer_id_939c7368_fk_crud_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `crud_customer` (`id`);

--
-- Constraints for table `crud_orderitem`
--
ALTER TABLE `crud_orderitem`
  ADD CONSTRAINT `crud_orderitem_item_id_20c8014d_fk_crud_inventory_id` FOREIGN KEY (`item_id`) REFERENCES `crud_inventory` (`id`),
  ADD CONSTRAINT `crud_orderitem_order_id_43915dbf_fk_crud_order_id` FOREIGN KEY (`order_id`) REFERENCES `crud_order` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
