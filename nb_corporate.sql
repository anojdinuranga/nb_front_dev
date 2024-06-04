-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2024 at 08:17 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nb_corporate`
--

-- --------------------------------------------------------

--
-- Table structure for table `amex_test`
--

CREATE TABLE `amex_test` (
  `id` int(11) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `appointment_booking`
--

CREATE TABLE `appointment_booking` (
  `id` int(11) NOT NULL,
  `first_name` varchar(200) NOT NULL DEFAULT '',
  `last_name` varchar(200) NOT NULL DEFAULT '',
  `email` varchar(200) NOT NULL DEFAULT '',
  `phone` varchar(20) NOT NULL DEFAULT '',
  `address` varchar(600) NOT NULL DEFAULT '',
  `reason` varchar(1000) NOT NULL DEFAULT '',
  `invoice_no` varchar(100) NOT NULL DEFAULT '',
  `reason_note` varchar(1000) NOT NULL DEFAULT '',
  `appointment_date` varchar(10) NOT NULL,
  `stating_time` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `added_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment_booking`
--

INSERT INTO `appointment_booking` (`id`, `first_name`, `last_name`, `email`, `phone`, `address`, `reason`, `invoice_no`, `reason_note`, `appointment_date`, `stating_time`, `status`, `added_time`) VALUES
(8, 'anoj', 'dinuranga', 'ad2001dinuranga@gmail.com', '0713656552', 'address', 'Place an order', '', '', '2024-01-19', 10, 1, '2024-01-14 09:01:41'),
(39, 'Sashini ', 'De Silva ', 'sashinidesilva25@gmail.com', '94766755375', 'No 14,Nalandarama Road, Pathiragoda, Maharagama ', 'Other', '', 'My wedding is on this year & I\'m looking for wedding dress.', '2024-02-10', 10, 1, '2024-02-07 17:02:57'),
(40, 'Sashini ', 'De Silva ', 'sashinidesilva25@gmail.com', '94766755375', 'No 14,Nalandarama Road, Pathiragoda, Maharagama ', 'Other', '', 'My wedding is on this year & I\'m looking for wedding dress.', '2024-02-10', 10, 3, '2024-02-07 17:05:19'),
(41, 'Nadeesha', 'Gamaarachchi', 'nadeeshadk@gmail.com', '94773048119', '97', 'Place an order', '', 'check', '2024-02-18', 11, 2, '2024-02-14 02:53:58'),
(42, 'Nadeesha', 'Gama', 'nadeeshadk@gmail.com', '94773048119', '97 galhena mawala wadduwa', 'Place an order', '', 'test', '2024-02-19', 11, 2, '2024-02-14 02:57:29'),
(43, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '94760358784', '237, Adawelayaya', 'Place an order', '', 'wd', '2024-04-01', 10, 2, '2024-02-14 03:01:00'),
(44, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '94760358784', '237, Adawelayaya', 'QK Wedding Exhibition 2024', '', '6fdr', '2024-05-01', 10, 2, '2024-02-14 03:05:28');

-- --------------------------------------------------------

--
-- Table structure for table `appointment_booking_status`
--

CREATE TABLE `appointment_booking_status` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment_booking_status`
--

INSERT INTO `appointment_booking_status` (`id`, `name`) VALUES
(1, 'Pending'),
(2, 'Active'),
(3, 'Admin Approved'),
(4, 'Admin Canceled');

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `image_url` varchar(1000) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL,
  `added_by` int(11) NOT NULL,
  `added_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`id`, `name`, `image_url`, `status`, `added_by`, `added_time`, `updated_by`, `updated_time`) VALUES
(4, 'HNB 1', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/1.jpg-1717475323490-.jpg', 1, 1, '2024-06-03 21:57:08', 1, '2024-06-03 22:58:43'),
(6, 'BOC', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/Artboard-1%404x.png-1717471718268-.png', 1, 1, '2024-06-03 21:58:38', 1, '2024-06-03 22:58:06');

-- --------------------------------------------------------

--
-- Table structure for table `booking_request`
--

CREATE TABLE `booking_request` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(360) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `address` varchar(500) NOT NULL DEFAULT '',
  `country` varchar(200) NOT NULL DEFAULT '',
  `city` varchar(200) NOT NULL DEFAULT '',
  `postalcode` varchar(200) NOT NULL DEFAULT '',
  `table_id` int(11) NOT NULL,
  `seat_count` int(11) NOT NULL,
  `per_sheet_price` double NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `event` int(11) NOT NULL DEFAULT 0,
  `voucher_id` int(11) DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `added_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_request`
--

INSERT INTO `booking_request` (`id`, `first_name`, `last_name`, `email`, `mobile`, `address`, `country`, `city`, `postalcode`, `table_id`, `seat_count`, `per_sheet_price`, `status`, `event`, `voucher_id`, `added_by`, `added_time`) VALUES
(22, 'LASANTHA', 'HANSI', 'lasanthachamaraa@gmail.com', '0774460451', '', '', '', '', 54, 2, 20000, 2, 10, NULL, 1, '2023-12-27 10:21:56'),
(23, 'RAJEEWA', 'RASANGIKA', 'ran@tillmax.co.uk', '0774555555', '', '', '', '', 54, 2, 20000, 1, 10, NULL, 1, '2023-12-27 11:47:28'),
(24, 'PIYUMAL', 'SHARALA', 'piyumaljayasinghe@aol.com', '0774880109', '', '', '', '', 54, 2, 20000, 1, 10, NULL, 1, '2023-12-27 11:50:08'),
(25, 'DEVIN', 'JUDID', 'peirisguna@gmail.com', '0773522750', '', '', '', '', 57, 2, 20000, 1, 10, NULL, 1, '2023-12-27 12:06:02'),
(26, 'THILAK', 'ANUSHA', 'thilaksilva007@gmail.com', '0773817991', '', '', '', '', 57, 2, 20000, 1, 10, NULL, 1, '2023-12-27 12:10:35'),
(27, 'LAKINDU', 'MAHEEMA', 'lakindusanthathi911@gmail.com', '0768412104', '', '', '', '', 57, 2, 20000, 2, 10, NULL, 1, '2023-12-27 12:13:31'),
(28, 'PRASAD', 'CHATHU ', 'chathu.manage94@gmail.com', '0712835761', '', '', '', '', 60, 2, 20000, 1, 10, NULL, 1, '2023-12-27 12:16:52'),
(29, 'SHANUKA', 'DISSARA', 'shanukadesilva@hotmail.com', '0777008991', '', '', '', '', 60, 2, 20000, 1, 10, NULL, 1, '2023-12-27 12:19:37'),
(30, 'SUMITH ', 'DAMAYANTHI ', 'dhgsp101@gmail.com', '0765201838', '', '', '', '', 60, 2, 20000, 1, 10, NULL, 1, '2023-12-27 12:22:17'),
(32, 'CHAMEEN', 'MADHAVI ', 'chameen.kavinda@gmail.com', '0718835535', '', '', '', '', 64, 2, 20000, 1, 10, NULL, 1, '2023-12-27 12:29:04'),
(33, 'RUSHAN ', 'NAVODYA ', 'rvranathunga96@gmail.com', '0764243439', '', '', '', '', 64, 2, 20000, 2, 10, NULL, 1, '2023-12-27 12:31:36'),
(34, 'DILSHAN', 'THAKSHANA', 'dilshandananjaya16@gmail.com', '0713999969', '', '', '', '', 65, 2, 20000, 1, 10, NULL, 1, '2023-12-27 12:35:29'),
(35, 'NILUSHA ', 'HASARA ', 'nilushachamal@gmail.com', '0718152136', '', '', '', '', 65, 2, 20000, 1, 10, NULL, 1, '2023-12-27 12:39:14'),
(36, 'DUSHAN', 'BINGUNI', 'dushan120@gmail.com', '0779203622', '', '', '', '', 65, 2, 20000, 1, 10, NULL, 1, '2023-12-27 12:42:32'),
(37, 'JALITHA ', 'AYASANA', 'phjnarthana@gmail.com', '0771080520', '', '', '', '', 66, 2, 20000, 1, 10, NULL, 1, '2023-12-27 12:59:20'),
(38, 'SHERON', 'CHAMODI ', 'sheron.senevirathne@outlook.com', '94776863308', '', '', '', '', 66, 2, 20000, 1, 10, NULL, 1, '2023-12-27 13:02:36'),
(39, 'MALEESHA', 'OSHADEE', 'nishaliwarnasuriya@gmail.com', '0767568164', '', '', '', '', 66, 2, 20000, 2, 10, NULL, 1, '2023-12-27 13:05:09'),
(43, 'PASIDU', 'KRISHANI', 'pasindunavarathna@gmail.com', '0771188873', '', '', '', '', 53, 2, 15000, 1, 10, NULL, 1, '2023-12-27 13:16:43'),
(44, 'MENAKA ', 'MALSHA', 'mashihansani21@gmail.com', '0776515571', '', '', '', '', 53, 2, 15000, 1, 10, NULL, 1, '2023-12-27 13:24:35'),
(45, 'PULASTHI', 'THAKSHILA', 'kdspulasthi@gmail.com', '0771786652', '', '', '', '', 53, 2, 15000, 1, 10, NULL, 1, '2023-12-27 13:26:09'),
(46, 'KAVINDU ', 'HIMADI ', 'kavindumadhawa123@gmail.com', '0772072137', '', '', '', '', 56, 2, 15000, 1, 10, NULL, 1, '2023-12-27 13:27:56'),
(47, 'THEJANA ', 'FIONA ', 'fiona.dimithri@gmail.com', '0715194334', '', '', '', '', 56, 2, 15000, 1, 10, NULL, 1, '2023-12-27 13:30:39'),
(48, 'SAMINDA', 'MISHARA', 'samindaminima125s@gmail.com', '0765364178', '', '', '', '', 56, 2, 15000, 1, 10, NULL, 1, '2023-12-27 13:32:25'),
(49, 'YASHITH ', 'GAWRAWEE', 'yashith@med.sab.ac.lk', '0716215825', '', '', '', '', 59, 2, 15000, 1, 10, NULL, 1, '2023-12-27 13:34:46'),
(50, 'YASITHA', '-', 'yasitha92@gmail.com', '0715556131', '', '', '', '', 59, 2, 15000, 1, 10, NULL, 1, '2023-12-27 13:36:37'),
(51, 'SHEHANI', 'JAYASINGHE', 'pasansemage8@gmail.com', '94772816241', '', '', '', '', 64, 2, 20000, 1, 10, NULL, 1, '2023-12-30 08:01:32'),
(59, 'Arvindh', 'Fernando', '0763524195i@gmail.com', '0742067470', '', '', '', '', 55, 1, 30000, 1, 10, NULL, 1, '2024-01-01 13:56:57'),
(60, 'Avanthi', 'De Zoysa', '0763524195i@gmail.com', '0770427568', '', '', '', '', 55, 1, 30000, 1, 10, NULL, 1, '2024-01-01 14:11:49'),
(61, 'Nirupa', 'Peiris', '0763524195i@gmail.com', '0773219898', '', '', '', '', 55, 1, 30000, 2, 10, NULL, 1, '2024-01-01 14:14:05'),
(62, 'Ramesh', 'Schafrter', '0763524195i@gmail.com', '94742082796', '', '', '', '', 55, 1, 30000, 1, 10, NULL, 1, '2024-01-01 14:15:23'),
(63, 'Naveed', 'Cader', '0763524195i@gmail.com', '94777636998', '', '', '', '', 55, 1, 30000, 1, 10, NULL, 1, '2024-01-01 14:16:32'),
(64, 'Suresh', 'Tissaratchy', '0763524195i@gmail.com', '94777726792', '', '', '', '', 55, 1, 30000, 1, 10, NULL, 1, '2024-01-01 14:18:35'),
(65, 'Sanjeewa', 'Dasanayaka', '0763524195i@gmail.com', '94777362330', '', '', '', '', 55, 1, 30000, 1, 10, NULL, 1, '2024-01-01 14:19:57'),
(67, 'Thariq', 'Dole', '0763524195i@gmail.com', '94773071419', '', '', '', '', 55, 1, 30000, 1, 10, NULL, 1, '2024-01-01 15:11:29'),
(68, 'Krishanth', 'Jayarajah', '0763524195i@gmail.com', '94777544988', '', '', '', '', 58, 1, 30000, 1, 10, NULL, 1, '2024-01-01 15:13:39'),
(69, 'Ashanthi', 'Weerasinghe', '0763524195i@gmail.com', '94773228778', '', '', '', '', 58, 1, 30000, 1, 10, NULL, 1, '2024-01-01 15:15:06'),
(70, 'Dinesh', 'Dilshan', 'dineshdilshanhanthi@gmail.com', '0777769999', '', '', '', '', 63, 2, 30000, 1, 10, NULL, 1, '2024-01-03 13:37:46'),
(71, 'Chamindi', 'Ekanayake', 'chamindi@nithyapartners.com', '0776161475', '', '', '', '', 63, 2, 30000, 1, 10, NULL, 1, '2024-01-03 13:39:29'),
(73, 'Berty ', 'Widanagamage', 'tokyoexp03@gmail.com', '0777770400', '', '', '', '', 63, 1, 30000, 2, 10, NULL, 1, '2024-01-03 14:00:22'),
(74, 'Gayansa ', 'Nethushali', 'srikantha.jewellers@gmail.com', '0777372573', '', '', '', '', 63, 2, 30000, 1, 10, NULL, 1, '2024-01-03 14:05:40'),
(77, 'Shuvo', 'Hridayesh', '0763524195i@gmail.com', '0773508894', '', '', '', '', 67, 4, 20000, 1, 10, NULL, 1, '2024-01-04 06:53:27'),
(78, 'Chiranthi', 'Cooray', '0763524195i@gmail.com', '0707776977', '', '', '', '', 67, 4, 20000, 1, 10, NULL, 1, '2024-01-04 06:58:51'),
(80, 'Tracy', 'Benton', '0763524195i@gmail.com', '0774763980‬', '', '', '', '', 67, 2, 20000, 1, 10, NULL, 1, '2024-01-04 07:09:00'),
(81, 'Malaika', 'De Silva', '0763524195i@gmail.com', '0759646789', '', '', '', '', 66, 3, 20000, 1, 10, NULL, 1, '2024-01-04 07:14:22'),
(82, 'Mohan', 'De Silva', '0763524195i@gmail.com', '0777305733', '', '', '', '', 65, 2, 20000, 1, 10, NULL, 1, '2024-01-04 07:20:34'),
(83, 'Alastair', 'Alastair', '0763524195i@gmail.com', '+447971282269', '', '', '', '', 66, 1, 20000, 1, 10, NULL, 1, '2024-01-04 08:03:48'),
(85, 'Champika', 'Piyadasa', '0763524195i@gmail.com', '07770887', '', '', '', '', 60, 2, 20000, 1, 10, NULL, 1, '2024-01-04 11:20:18'),
(86, 'Shanil ', 'Gunasekara', '0763524195i@gmail.com', '0777901619', '', '', '', '', 63, 3, 30000, 2, 10, NULL, 1, '2024-01-04 12:26:16'),
(87, 'G', 'Vishakan', '0763524195i@gmail.com', '0713950221', '', '', '', '', 62, 1, 15000, 1, 10, NULL, 1, '2024-01-04 12:31:35'),
(88, 'Induwara', 'Wickramasinghe', 'manilkadilsha1994@gmail.com', '0763524195', '190/53 E , Weera Gardens', 'Sri Lanka', 'Pannipitiya', '10230', 55, 1, 30000, 2, 10, NULL, NULL, '2024-01-04 13:25:53');

-- --------------------------------------------------------

--
-- Table structure for table `booking_request_status`
--

CREATE TABLE `booking_request_status` (
  `id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_request_status`
--

INSERT INTO `booking_request_status` (`id`, `status`) VALUES
(1, 'approved'),
(2, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `card_discount`
--

CREATE TABLE `card_discount` (
  `id` int(11) NOT NULL,
  `bank` int(11) NOT NULL,
  `card_type` int(11) NOT NULL,
  `discount_type` int(11) NOT NULL,
  `amount` double NOT NULL,
  `valid_date_start` varchar(10) NOT NULL,
  `valid_date_end` varchar(10) NOT NULL,
  `max_saving_amount` double NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL,
  `added_by` int(11) NOT NULL,
  `added_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `card_discount`
--

INSERT INTO `card_discount` (`id`, `bank`, `card_type`, `discount_type`, `amount`, `valid_date_start`, `valid_date_end`, `max_saving_amount`, `status`, `added_by`, `added_time`, `updated_by`, `updated_time`) VALUES
(1, 6, 1, 1, 14000, '06/04/2024', '07/24/2024', 0, 1, 1, '2024-06-03 22:30:53', NULL, '2024-06-04 04:00:53'),
(2, 6, 2, 2, 10, '06/04/2024', '07/24/2024', 0, 1, 1, '2024-06-03 22:31:17', NULL, '2024-06-04 04:01:17'),
(3, 6, 1, 1, 1000, '06/04/2024', '06/04/2024', 700, 1, 1, '2024-06-03 23:04:35', 1, '2024-06-03 23:38:06');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL DEFAULT '',
  `last_name` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(300) NOT NULL DEFAULT '',
  `phone` varchar(20) NOT NULL DEFAULT '',
  `reason_type` varchar(600) NOT NULL DEFAULT '',
  `message` varchar(3000) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `first_name`, `last_name`, `email`, `phone`, `reason_type`, `message`, `status`) VALUES
(1, 'Developer ', 'Testing', 'developer_testing@mail.com', '0711234567', 'Test', 'This is a test message', 1),
(2, 'Induwara', 'Wickramasinghe', '0763524195i@gmail.com', '0763524195', 'TEST', 'TEST 001', 1);

-- --------------------------------------------------------

--
-- Table structure for table `custom_product_type`
--

CREATE TABLE `custom_product_type` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `custom_product_type`
--

INSERT INTO `custom_product_type` (`id`, `name`) VALUES
(1, 'Waistcoat '),
(2, 'Suit'),
(3, 'Trouser'),
(4, 'Arya Sinhala');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(500) NOT NULL DEFAULT '',
  `date` varchar(10) DEFAULT NULL,
  `gate_open_time` varchar(5) NOT NULL,
  `gate_close_time` varchar(5) NOT NULL,
  `event_start_time` varchar(5) NOT NULL,
  `location` varchar(100) NOT NULL,
  `image_url` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `added_by` int(11) NOT NULL DEFAULT 0,
  `added_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `title`, `description`, `date`, `gate_open_time`, `gate_close_time`, `event_start_time`, `location`, `image_url`, `status`, `added_by`, `added_time`, `updated_by`, `updated_time`) VALUES
(9, 'QK FASHION SHOW 2024', 'Experience high fashion, couture elegance, and trendsetting styles at our exclusive runway showcase', '2024-01-04', '17:30', '18:30', '19:00', 'LEVEL 20, MIREKA TOWER, 324 Havelock Rd, Colombo 05', NULL, 403, 1, '2023-12-22 04:24:25', NULL, '2023-12-22 04:24:25'),
(10, 'QK FASHION SHOW 2024', 'Experience high fashion, couture elegance, and trendsetting styles at our exclusive runway showcase', '2024-01-04', '17:30', '18:30', '19:00', 'LEVEL 20, MIREKA TOWER, 324 Havelock Rd, Colombo 05.', NULL, 1, 1, '2023-12-27 09:30:06', NULL, '2023-12-27 09:30:06');

-- --------------------------------------------------------

--
-- Table structure for table `event_status`
--

CREATE TABLE `event_status` (
  `id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event_status`
--

INSERT INTO `event_status` (`id`, `status`) VALUES
(1, 'active'),
(2, 'deactive'),
(403, 'deactive');

-- --------------------------------------------------------

--
-- Table structure for table `event_ticket_category`
--

CREATE TABLE `event_ticket_category` (
  `id` int(11) NOT NULL,
  `ticket_category` int(11) NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `event` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `added_by` int(11) NOT NULL DEFAULT 0,
  `added_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event_ticket_category`
--

INSERT INTO `event_ticket_category` (`id`, `ticket_category`, `price`, `event`, `status`, `added_by`, `added_time`, `updated_by`, `updated_time`) VALUES
(14, 31, 25000, 9, 1, 1, '2023-12-22 04:24:25', NULL, '2023-12-22 04:24:25'),
(15, 30, 20000, 9, 1, 1, '2023-12-22 04:24:25', NULL, '2023-12-22 04:24:25'),
(16, 29, 15000, 9, 1, 1, '2023-12-22 04:24:25', NULL, '2023-12-22 04:24:25'),
(17, 28, 10000, 9, 1, 1, '2023-12-22 04:24:25', NULL, '2023-12-22 04:24:25'),
(18, 30, 30000, 10, 1, 1, '2023-12-27 09:30:06', NULL, '2023-12-27 09:30:06'),
(19, 29, 20000, 10, 1, 1, '2023-12-27 09:30:06', NULL, '2023-12-27 09:30:06'),
(20, 28, 15000, 10, 1, 1, '2023-12-27 09:30:06', NULL, '2023-12-27 09:30:06');

-- --------------------------------------------------------

--
-- Table structure for table `event_ticket_category_seat`
--

CREATE TABLE `event_ticket_category_seat` (
  `id` int(11) NOT NULL,
  `sheet_no` varchar(11) NOT NULL,
  `event_ticket_category_table` int(11) NOT NULL DEFAULT 0,
  `booking_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `added_by` int(11) NOT NULL DEFAULT 0,
  `added_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event_ticket_category_seat`
--

INSERT INTO `event_ticket_category_seat` (`id`, `sheet_no`, `event_ticket_category_table`, `booking_id`, `status`, `added_by`, `added_time`, `updated_by`, `updated_time`) VALUES
(1, '1', 34, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(2, '1', 35, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(3, '1', 36, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(4, '1', 37, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(5, '2', 34, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(6, '2', 35, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(7, '2', 36, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(8, '2', 37, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(9, '3', 34, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(10, '3', 36, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(11, '3', 35, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(12, '4', 34, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(13, '4', 36, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(14, '3', 37, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(15, '5', 34, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(16, '5', 36, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(17, '4', 35, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(18, '6', 34, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(19, '6', 36, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(20, '5', 35, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(21, '4', 37, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(22, '7', 34, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(23, '7', 36, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(24, '6', 35, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(25, '5', 37, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(26, '1', 38, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(27, '7', 35, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(28, '2', 38, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(29, '6', 37, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(30, '3', 38, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(31, '1', 40, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(32, '1', 39, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(33, '4', 38, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(34, '2', 40, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(35, '7', 37, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(36, '5', 38, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(37, '3', 40, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(38, '2', 39, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(39, '8', 37, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(40, '6', 38, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(41, '3', 39, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(42, '4', 40, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(43, '7', 38, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(44, '4', 39, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(45, '9', 37, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(46, '5', 39, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(47, '10', 37, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(48, '5', 40, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(49, '1', 41, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(50, '6', 39, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(51, '6', 40, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(52, '2', 41, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(53, '7', 39, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(54, '7', 40, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(55, '3', 41, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(56, '4', 41, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(57, '1', 42, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(58, '1', 43, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(59, '5', 41, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(60, '2', 42, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(61, '6', 41, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(62, '2', 43, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(63, '7', 41, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(64, '3', 42, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(65, '3', 43, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(66, '4', 42, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(67, '1', 44, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(68, '4', 43, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(69, '5', 42, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(70, '2', 44, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(71, '6', 42, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(72, '3', 44, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(73, '5', 43, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(74, '7', 42, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(75, '4', 44, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(76, '5', 44, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(77, '6', 43, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(78, '1', 45, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(79, '6', 44, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(80, '2', 45, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(81, '7', 43, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(82, '3', 45, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(83, '7', 44, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(84, '4', 45, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(85, '1', 46, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(86, '1', 47, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(87, '5', 45, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(88, '2', 46, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(89, '2', 47, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(90, '6', 45, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(91, '3', 47, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(92, '3', 46, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(93, '4', 47, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(94, '7', 45, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(95, '5', 47, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(96, '4', 46, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(97, '6', 47, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(98, '5', 46, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(99, '7', 47, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(100, '6', 46, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(101, '7', 46, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(102, '1', 48, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(103, '2', 48, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(104, '1', 49, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(105, '3', 48, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(106, '2', 49, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(107, '4', 48, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(108, '3', 49, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(109, '5', 48, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(110, '4', 49, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(111, '6', 48, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(112, '5', 49, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(113, '7', 48, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(114, '6', 49, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(115, '7', 49, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(116, '1', 50, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(117, '2', 50, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(118, '1', 51, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(119, '3', 50, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(120, '2', 51, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(121, '4', 50, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(122, '3', 51, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(123, '5', 50, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(124, '4', 51, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(125, '6', 50, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(126, '5', 51, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(127, '7', 50, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(128, '6', 51, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(129, '7', 51, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(130, '1', 52, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(131, '2', 52, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(132, '3', 52, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(133, '4', 52, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(134, '5', 52, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(135, '6', 52, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(136, '7', 52, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(137, '1', 53, 43, 2, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(138, '2', 53, 43, 2, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(139, '3', 53, 44, 2, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(140, '1', 54, 22, 2, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(141, '1', 55, 59, 2, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(142, '4', 53, 44, 2, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(143, '2', 54, 22, 2, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(144, '2', 55, 60, 2, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(145, '5', 53, 45, 2, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(146, '3', 54, 23, 2, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(147, '3', 55, 61, 2, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(148, '6', 53, 45, 2, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(149, '4', 54, 23, 2, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(150, '4', 55, 62, 2, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(151, '7', 53, NULL, 1, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(152, '5', 54, 24, 2, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(153, '5', 55, 63, 2, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(154, '1', 56, 46, 2, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(155, '6', 54, 24, 2, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(156, '6', 55, 64, 2, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(157, '2', 56, 46, 2, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(158, '7', 54, NULL, 1, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(159, '7', 55, 65, 2, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(160, '3', 56, 47, 2, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(161, '4', 56, 47, 2, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(162, '5', 56, 48, 2, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(163, '1', 57, 25, 2, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(164, '1', 58, 68, 2, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(165, '6', 56, 48, 2, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(166, '2', 57, 25, 2, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(167, '7', 56, NULL, 1, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(168, '2', 58, 69, 2, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(169, '3', 57, 26, 2, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(170, '3', 58, NULL, 1, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(171, '4', 57, 26, 2, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(172, '4', 58, NULL, 1, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(173, '1', 59, 49, 2, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(174, '5', 57, 27, 2, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(175, '5', 58, NULL, 1, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(176, '2', 59, 49, 2, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(177, '6', 57, 27, 2, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(178, '6', 58, NULL, 1, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(179, '3', 59, 50, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(180, '7', 57, NULL, 1, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(181, '7', 58, NULL, 1, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(182, '4', 59, 50, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(183, '5', 59, NULL, 1, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(184, '1', 60, 28, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(185, '1', 61, NULL, 1, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(186, '6', 59, NULL, 1, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(187, '2', 60, 28, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(188, '2', 61, NULL, 1, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(189, '7', 59, NULL, 1, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(190, '3', 61, NULL, 1, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(191, '3', 60, 29, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(192, '4', 61, NULL, 1, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(193, '4', 60, 29, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(194, '1', 62, 87, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(195, '5', 61, NULL, 1, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(196, '5', 60, 30, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(197, '2', 62, NULL, 1, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(198, '6', 61, NULL, 1, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(199, '6', 60, 30, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(200, '3', 62, NULL, 1, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(201, '7', 61, NULL, 1, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(202, '7', 60, 85, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(203, '4', 62, NULL, 1, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(204, '5', 62, NULL, 1, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(205, '1', 63, 70, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(206, '1', 64, 51, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(207, '6', 62, NULL, 1, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(208, '2', 63, 70, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(209, '2', 64, 51, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(210, '7', 62, NULL, 1, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(211, '3', 63, 71, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(212, '3', 64, 32, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(213, '4', 63, 71, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(214, '4', 64, 32, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(215, '5', 63, 73, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(216, '5', 64, 33, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(217, '6', 63, 74, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(218, '6', 64, 33, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(219, '7', 63, 74, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(220, '7', 64, NULL, 1, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(221, '1', 65, 34, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(222, '2', 65, 34, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(223, '3', 65, 35, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(224, '4', 65, 35, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(225, '5', 65, 36, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(226, '6', 65, 36, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(227, '7', 65, 82, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(228, '1', 66, 37, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(229, '2', 66, 37, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(230, '3', 66, 38, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(231, '4', 66, 38, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(232, '5', 66, 39, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(233, '6', 66, 39, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(234, '7', 66, 81, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(235, '1', 67, 77, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(236, '2', 67, 77, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(237, '3', 67, 77, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(238, '4', 67, 77, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(239, '5', 67, 78, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(240, '6', 67, 78, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(241, '7', 67, 78, 2, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(242, '8', 63, 86, 2, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(243, '8', 61, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(244, '8', 58, NULL, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(245, '8', 55, 67, 2, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(246, '8', 62, NULL, 1, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(247, '9', 62, NULL, 1, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(248, '10', 62, NULL, 1, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(249, '8', 59, NULL, 1, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(250, '9', 59, NULL, 1, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(251, '10', 59, NULL, 1, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(252, '8', 56, NULL, 1, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(253, '9', 56, NULL, 1, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(254, '10', 56, NULL, 1, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(255, '8', 53, NULL, 1, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(256, '9', 53, NULL, 1, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(257, '10', 53, NULL, 1, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(258, '8', 67, 78, 2, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(259, '9', 67, 80, 2, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(260, '10', 67, 80, 2, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(261, '8', 66, 81, 2, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(262, '9', 66, 81, 2, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(263, '10', 66, 83, 2, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(264, '8', 65, 82, 2, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(265, '9', 65, NULL, 1, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(266, '10', 65, NULL, 1, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(267, '8', 64, NULL, 1, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(268, '9', 64, NULL, 1, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(269, '10', 64, NULL, 1, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(270, '8', 60, 85, 2, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(271, '9', 60, NULL, 1, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(272, '10', 60, NULL, 1, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(273, '8', 57, NULL, 1, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(274, '9', 57, NULL, 1, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(275, '10', 57, NULL, 1, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(276, '8', 54, NULL, 1, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(277, '9', 54, NULL, 1, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(278, '10', 54, NULL, 1, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(279, '9', 63, 86, 2, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(280, '10', 63, 86, 2, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(281, '9', 61, NULL, 1, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(282, '10', 61, NULL, 1, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(283, '9', 58, NULL, 1, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(284, '10', 58, NULL, 1, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(285, '9', 55, 88, 2, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53'),
(286, '10', 55, NULL, 1, 1, '2023-12-22 09:55:53', NULL, '2023-12-22 09:55:53');

-- --------------------------------------------------------

--
-- Table structure for table `event_ticket_category_table`
--

CREATE TABLE `event_ticket_category_table` (
  `id` int(11) NOT NULL,
  `table_number` varchar(20) NOT NULL DEFAULT '',
  `event_ticket_category` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `added_by` int(11) NOT NULL DEFAULT 0,
  `added_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event_ticket_category_table`
--

INSERT INTO `event_ticket_category_table` (`id`, `table_number`, `event_ticket_category`, `status`, `added_by`, `added_time`, `updated_by`, `updated_time`) VALUES
(34, '1', 17, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(35, '1', 16, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(36, '1', 15, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(37, '1', 14, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(38, '2', 17, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(39, '2', 15, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(40, '2', 16, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(41, '3', 17, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(42, '3', 15, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(43, '3', 16, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(44, '4', 17, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(45, '4', 15, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(46, '4', 16, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(47, '5', 17, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(48, '6', 17, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(49, '5', 16, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(50, '7', 17, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(51, '6', 16, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(52, '7', 16, 1, 1, '2023-12-22 04:25:53', NULL, '2023-12-22 04:25:53'),
(53, '1', 20, 1, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(54, '1', 19, 1, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(55, '1', 18, 1, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(56, '2', 20, 1, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(57, '2', 19, 1, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(58, '2', 18, 1, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(59, '3', 20, 1, 1, '2023-12-27 09:31:44', NULL, '2023-12-27 09:31:44'),
(60, '3', 19, 1, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(61, '3', 18, 1, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(62, '4', 20, 1, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(63, '4', 18, 1, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(64, '4', 19, 1, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(65, '5', 19, 1, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(66, '6', 19, 1, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45'),
(67, '7', 19, 1, 1, '2023-12-27 09:31:45', NULL, '2023-12-27 09:31:45');

-- --------------------------------------------------------

--
-- Table structure for table `fabric`
--

CREATE TABLE `fabric` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL DEFAULT '',
  `category` varchar(200) NOT NULL,
  `type` int(11) NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `wraps` int(11) NOT NULL DEFAULT 0,
  `wrapt` int(11) NOT NULL DEFAULT 0,
  `stiching_color` varchar(20) NOT NULL DEFAULT '',
  `btn_color` varchar(20) NOT NULL DEFAULT '',
  `fabric_image_url` varchar(1000) NOT NULL DEFAULT '',
  `fabric_preview_image_url` varchar(1000) NOT NULL DEFAULT '',
  `lining_image` varchar(1000) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT 1,
  `added_by` int(11) NOT NULL,
  `added_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fabric`
--

INSERT INTO `fabric` (`id`, `name`, `category`, `type`, `price`, `wraps`, `wrapt`, `stiching_color`, `btn_color`, `fabric_image_url`, `fabric_preview_image_url`, `lining_image`, `status`, `added_by`, `added_time`, `updated_by`, `updated_time`) VALUES
(2, 'example', 'example', 1, 1, 1, 1, 'example', 'example', '', '', '', 1, 1, '2024-02-25 22:10:35', 1, '2024-02-25 22:19:59');

-- --------------------------------------------------------

--
-- Table structure for table `gift_voucher`
--

CREATE TABLE `gift_voucher` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL DEFAULT '',
  `category` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `amount` double NOT NULL,
  `details` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `added_by` int(11) DEFAULT NULL,
  `added_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gift_voucher`
--

INSERT INTO `gift_voucher` (`id`, `name`, `category`, `count`, `amount`, `details`, `status`, `added_by`, `added_time`, `updated_by`, `updated_time`) VALUES
(1, 'example', 1, 1, 2, 'example', 1, 1, '2024-04-04 04:13:47', 1, '2024-04-04 04:14:15');

-- --------------------------------------------------------

--
-- Table structure for table `gift_voucher_booking`
--

CREATE TABLE `gift_voucher_booking` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL DEFAULT '',
  `last_name` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(300) NOT NULL DEFAULT '',
  `phone` varchar(20) NOT NULL DEFAULT '',
  `address` varchar(600) NOT NULL DEFAULT '',
  `country` varchar(100) NOT NULL DEFAULT '',
  `city` varchar(100) NOT NULL DEFAULT '',
  `postal_code` varchar(20) NOT NULL DEFAULT '',
  `shipping_first_name` varchar(100) NOT NULL DEFAULT '',
  `shipping_last_name` varchar(100) NOT NULL DEFAULT '',
  `shipping_email` varchar(300) NOT NULL DEFAULT '',
  `shipping_phone` varchar(20) NOT NULL DEFAULT '',
  `shipping_address` varchar(600) NOT NULL DEFAULT '',
  `shipping_country` varchar(100) NOT NULL DEFAULT '',
  `shipping_city` varchar(100) NOT NULL DEFAULT '',
  `shipping_postal_code` varchar(20) NOT NULL DEFAULT '',
  `payment_type` int(11) NOT NULL DEFAULT 1 COMMENT '1 - Amex, 2- Visa / master card',
  `shipping_type` int(11) NOT NULL DEFAULT 1 COMMENT '1 - Purchase address, 2 - shipping address',
  `delivery_method` int(11) NOT NULL DEFAULT 1 COMMENT '1- Delivery, 2 - Pickup',
  `tracking_code` varchar(100) NOT NULL DEFAULT '',
  `file_attached` varchar(1000) NOT NULL DEFAULT '',
  `curia_name` varchar(100) NOT NULL DEFAULT '',
  `curia_nic_or_id` varchar(20) NOT NULL DEFAULT '',
  `curia_contact_number` varchar(20) NOT NULL DEFAULT '',
  `order_amount` double NOT NULL DEFAULT 0,
  `currency` varchar(3) NOT NULL DEFAULT 'USD',
  `paid_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `added_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `added_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gift_voucher_booking`
--

INSERT INTO `gift_voucher_booking` (`id`, `first_name`, `last_name`, `email`, `phone`, `address`, `country`, `city`, `postal_code`, `shipping_first_name`, `shipping_last_name`, `shipping_email`, `shipping_phone`, `shipping_address`, `shipping_country`, `shipping_city`, `shipping_postal_code`, `payment_type`, `shipping_type`, `delivery_method`, `tracking_code`, `file_attached`, `curia_name`, `curia_nic_or_id`, `curia_contact_number`, `order_amount`, `currency`, `paid_time`, `added_time`, `added_by`, `status`) VALUES
(55, 'example text', 'example text', 'sample@example.com', '0760358784', 'example text', 'example text', 'example text', 'example text', 'example text', 'example text', 'sample@example.com', '0760358784', 'example text', 'example text', 'example text', 'example text', 1, 1, 1, '', '', '', '', '', 0.02, 'USD', '2024-04-10 05:26:33', '2024-04-09 23:56:33', 18, 1),
(56, 'example text', 'example text', 'sample@example.com', '0760358784', 'example text', 'example text', 'example text', 'example text', 'example text', 'example text', 'sample@example.com', '0760358784', 'example text', 'example text', 'example text', 'example text', 1, 1, 1, '', '', '', '', '', 0.02, 'USD', '2024-04-10 05:48:43', '2024-04-10 00:18:43', 18, 1);

-- --------------------------------------------------------

--
-- Table structure for table `gift_voucher_booking_items`
--

CREATE TABLE `gift_voucher_booking_items` (
  `id` int(11) NOT NULL,
  `local_id` varchar(100) NOT NULL DEFAULT '',
  `gift_voucher_booking_id` int(11) NOT NULL,
  `gift_voucher_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 1,
  `price` double NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gift_voucher_booking_items`
--

INSERT INTO `gift_voucher_booking_items` (`id`, `local_id`, `gift_voucher_booking_id`, `gift_voucher_id`, `qty`, `price`, `status`) VALUES
(1, 'example text', 55, 1, 1, 0.02, 1),
(2, '', 56, 1, 1, 0.02, 1);

-- --------------------------------------------------------

--
-- Table structure for table `gift_voucher_booking_status`
--

CREATE TABLE `gift_voucher_booking_status` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gift_voucher_booking_status`
--

INSERT INTO `gift_voucher_booking_status` (`id`, `name`) VALUES
(1, 'pending'),
(2, 'processing'),
(3, 'Delivered'),
(4, 'Canceled'),
(5, 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `gift_voucher_status`
--

CREATE TABLE `gift_voucher_status` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gift_voucher_status`
--

INSERT INTO `gift_voucher_status` (`id`, `name`) VALUES
(1, 'Active'),
(2, 'Disabled');

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` int(11) NOT NULL,
  `date` varchar(10) NOT NULL,
  `reason` varchar(5000) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

CREATE TABLE `newsletter` (
  `id` int(11) NOT NULL,
  `email` varchar(360) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `added_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `newsletter`
--

INSERT INTO `newsletter` (`id`, `email`, `status`, `added_time`) VALUES
(1, 'developer_testing@mail.com', 1, '2024-01-19 18:05:18'),
(2, '0763524195i@gmail.com', 1, '2024-01-20 04:09:42');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `order_biil_id` int(11) DEFAULT NULL,
  `text` varchar(1000) NOT NULL,
  `type` int(11) NOT NULL,
  `added_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `product_id`, `order_biil_id`, `text`, `type`, `added_time`) VALUES
(2, NULL, 1, 'Order  with ID \"2024-01-2 1 has been confirmed', 2, '2024-03-22 02:32:05'),
(3, NULL, 2, 'Order  with ID \"2024-02-12 2 has been confirmed', 2, '2024-03-22 02:35:35'),
(4, NULL, 72, 'Order  with ID 2024-04-29 72 has been confirmed', 2, '2024-04-29 22:23:15'),
(5, NULL, 73, 'Order  with ID 2024-04-29 73 has been confirmed', 2, '2024-04-29 22:28:46'),
(6, NULL, 78, 'Order  with ID 2024-05-21 78 has been confirmed', 2, '2024-05-21 04:08:50');

-- --------------------------------------------------------

--
-- Table structure for table `order_bill`
--

CREATE TABLE `order_bill` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL DEFAULT '',
  `last_name` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(300) NOT NULL DEFAULT '',
  `phone` varchar(20) NOT NULL DEFAULT '',
  `address` varchar(600) NOT NULL DEFAULT '',
  `country` varchar(100) NOT NULL DEFAULT '',
  `city` varchar(100) NOT NULL DEFAULT '',
  `payment_type` int(11) NOT NULL DEFAULT 1 COMMENT '1 - Amex, 2- Visa / master card',
  `postal_code` varchar(20) NOT NULL DEFAULT '',
  `shipping_type` int(11) NOT NULL DEFAULT 1 COMMENT '1 - Purchase \r\n address, 2 - shipping address',
  `shipping_first_name` varchar(100) NOT NULL DEFAULT '',
  `shipping_last_name` varchar(100) NOT NULL DEFAULT '',
  `shipping_email` varchar(300) NOT NULL DEFAULT '',
  `shipping_phone` varchar(20) NOT NULL DEFAULT '',
  `shipping_address` varchar(600) NOT NULL DEFAULT '',
  `shipping_country` varchar(100) NOT NULL DEFAULT '',
  `shipping_city` varchar(100) NOT NULL DEFAULT '',
  `shipping_postal_code` varchar(20) NOT NULL DEFAULT '',
  `delivery_method` int(11) NOT NULL DEFAULT 1 COMMENT '1- Delivery, 2 - Pickup',
  `tracking_code` varchar(100) NOT NULL DEFAULT '',
  `file_attached` varchar(1000) NOT NULL DEFAULT '',
  `curia_name` varchar(100) NOT NULL DEFAULT '',
  `curia_nic_or_id` varchar(20) NOT NULL DEFAULT '',
  `curia_contact_number` varchar(20) NOT NULL DEFAULT '',
  `order_amount` double NOT NULL DEFAULT 0,
  `currency` varchar(3) NOT NULL DEFAULT 'USD',
  `paid_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `success_indicator` varchar(100) DEFAULT NULL,
  `added_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `added_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_bill`
--

INSERT INTO `order_bill` (`id`, `first_name`, `last_name`, `email`, `phone`, `address`, `country`, `city`, `payment_type`, `postal_code`, `shipping_type`, `shipping_first_name`, `shipping_last_name`, `shipping_email`, `shipping_phone`, `shipping_address`, `shipping_country`, `shipping_city`, `shipping_postal_code`, `delivery_method`, `tracking_code`, `file_attached`, `curia_name`, `curia_nic_or_id`, `curia_contact_number`, `order_amount`, `currency`, `paid_time`, `success_indicator`, `added_time`, `added_by`, `status`) VALUES
(1, 'anoj', 'dinuranga', 'knimesh.work@gmail.com', '94760358784', 'test address', 'sri lanka', 'kurunegala', 1, '60000', 1, '', '', '', '', '', '', '', '', 1, 'example text', '', 'example text', 'example text', '0760358784', 1234, 'USD', '2024-03-22 02:32:02', NULL, '2024-01-22 13:14:09', 9, 4),
(2, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '760358784', '237, Adawelayaya', 'tes', 'rwe', 0, 'ew', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 0.1, 'USD', '2024-03-22 02:35:31', NULL, '2024-02-12 08:54:40', 11, 5),
(3, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '760358784', '237, Adawelayaya', 'Adawelayaya', 'Adawelayaya', 0, 'Adawelayaya', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 0.1, 'USD', '2024-02-16 09:31:47', NULL, '2024-02-13 05:37:02', 11, 6),
(4, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '760358784', '237, Adawelayaya', 'Adawelayaya', 'Adawelayaya', 0, 'Adawelayaya', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 0.1, 'USD', '2024-02-16 09:31:47', NULL, '2024-02-13 05:37:07', 11, 6),
(5, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '760358784', '237, Adawelayaya', 'Adawelayaya', 'Adawelayaya', 0, 'Adawelayaya', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 0.1, 'USD', '2024-02-16 09:31:47', NULL, '2024-02-13 05:37:47', 11, 6),
(6, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '760358784', '237, Adawelayaya', 'Adawelayaya', 'Adawelayaya', 0, 'Adawelayaya', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 10, 'LKR', '2024-02-16 09:31:47', NULL, '2024-02-13 05:42:38', 11, 6),
(7, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '760358784', '237, Adawelayaya', 'Adawelayaya', 'Adawelayaya', 0, 'Adawelayaya', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 10, 'LKR', '2024-02-16 09:31:47', NULL, '2024-02-13 05:43:27', 11, 6),
(8, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '760358784', '237, Adawelayaya', 'forgot_password', 'forgot_password', 0, 'forgot_password', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 315, 'LKR', '2024-02-16 09:31:47', NULL, '2024-02-13 06:26:57', 11, 6),
(9, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '760358784', '237, Adawelayaya', 'test', 'test', 0, 'test', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 315, 'LKR', '2024-02-16 09:31:47', NULL, '2024-02-13 06:54:09', 11, 6),
(10, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '760358784', '237, Adawelayaya', 'Adawelayaya', 'Adawelayaya', 0, 'Adawelayaya', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 10, 'LKR', '2024-02-16 09:31:47', NULL, '2024-02-13 11:02:23', 11, 6),
(11, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '760358784', '237, Adawelayaya', 'Adawelayaya', 'Adawelayaya', 0, 'Adawelayaya', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 10, 'LKR', '2024-02-16 09:31:47', NULL, '2024-02-13 11:05:03', 11, 6),
(12, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '760358784', '237, Adawelayaya', 'Adawelayaya', 'Wellawaya', 0, '91206', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 10, 'LKR', '2024-02-16 09:31:47', NULL, '2024-02-13 13:36:50', 11, 6),
(13, 'Induwara', 'Wickramasinghe', '0763524195i@gmail.com', '763524195', '190/53 E , Weera GardensDepanama', 'Sri Lanka', 'Pannipitiya', 0, '10230', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 10, 'LKR', '2024-02-16 09:31:47', NULL, '2024-02-13 14:24:24', 23, 6),
(14, 'Induwara', 'Wickramasinghe', '0763524195i@gmail.com', '763524195', '190/53 E , Weera Gardens', 'Sri Lanka', 'Pannipitiya', 0, '10230', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 10, 'LKR', '2024-02-16 09:31:47', NULL, '2024-02-13 14:25:19', 23, 6),
(15, 'Induwara', 'Wickramasinghe', '0763524195i@gmail.com', '763524195', '190/53 E , Weera GardensDepanama', 'Sri LAnka', 'Pannipitiya', 0, '10230', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 10, 'LKR', '2024-02-16 09:31:47', NULL, '2024-02-14 05:16:10', 23, 6),
(26, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '714550538', '237, Adawelayaya', 'SL', 'wwe', 0, 'wer', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 2, 'LKR', '2024-02-16 09:31:47', NULL, '2024-02-16 07:42:55', 18, 6),
(27, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '714550538', '237, Adawelayaya', 'SL', 'rerf', 0, 'erer', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 1, 'LKR', '2024-02-16 09:31:47', NULL, '2024-02-16 07:46:34', 18, 6),
(28, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '714550538', '237, Adawelayaya', 'SL', 'SL', 0, 'SL', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 2, 'LKR', '2024-02-16 09:31:47', NULL, '2024-02-16 07:48:19', 18, 6),
(29, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '714550538', '237, Adawelayaya', 'SL', 'SL', 0, 'SL', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 2, 'LKR', '2024-02-16 09:31:47', NULL, '2024-02-16 08:26:09', 18, 6),
(30, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '714550538', '237, Adawelayaya', 'LK', 'we', 0, 'ee', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 2, 'LKR', '2024-02-16 09:31:47', NULL, '2024-02-16 09:17:09', 18, 6),
(31, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '714550538', '237, Adawelayaya', 'LK', 'LK', 0, 'LK', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 2, 'LKR', '2024-02-16 09:31:47', NULL, '2024-02-16 09:31:29', 18, 5),
(32, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '714550538', '237, Adawelayaya', 'LK', 'LK', 0, 'LK', 1, '', '', '', '', '', '', '', '', 1, '001', '', 'Ruchira Lakmal', '0001', '0772677237', 2, 'LKR', '2024-02-16 09:39:07', NULL, '2024-02-16 09:38:24', 18, 2),
(33, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '714550538', '237, Adawelayaya', 'LK', 'LK', 0, 'LK', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 2, 'LKR', '2024-02-16 09:40:35', NULL, '2024-02-16 09:40:35', 18, 6),
(34, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '714550538', '237, Adawelayaya', 'LK', 'LK', 0, 'LK', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 2, 'LKR', '2024-02-16 10:28:01', NULL, '2024-02-16 10:27:18', 18, 3),
(35, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '714550538', '237, Adawelayaya', 'LK', 'wellawaya', 0, 'yyy', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 2, 'LKR', '2024-02-17 04:31:54', NULL, '2024-02-17 04:31:54', 18, 6),
(37, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '760358784', '237, Adawelayaya', 'AU', 'Wellawaya', 0, '91206', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 0.02, 'USD', '2024-02-21 13:17:46', NULL, '2024-02-21 07:47:46', 11, 6),
(38, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '+94760358784', '237, Adawelayaya', 'AU', 'Wellawaya', 0, '91206', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 0.02, 'USD', '2024-02-21 13:23:48', NULL, '2024-02-21 07:53:48', 11, 6),
(39, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '+94760358784', '237, Adawelayaya', 'AU', 'Wellawaya', 0, '91206', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 0.02, 'USD', '2024-02-21 13:24:48', NULL, '2024-02-21 07:54:47', 11, 6),
(40, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '+94760358784', '237, Adawelayaya', 'AU', 'Wellawaya', 0, '91206', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 0.02, 'USD', '2024-02-21 13:26:26', NULL, '2024-02-21 07:56:26', 11, 6),
(41, 'Kavindu', 'Nimesh', 'kani.kntech@gmail.com', '760358784', 'kani.kntech@gmail.com', 'AU', 'kan', 0, 'tttt', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 0.02, 'USD', '2024-03-07 06:02:03', NULL, '2024-03-07 00:32:03', 27, 6),
(42, 'Kavindu', 'Nimesh', 'kani.kntech@gmail.com', '760358784', 'fwe', 'CA', 'wellawaya', 0, '434', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 0.02, 'USD', '2024-03-07 06:02:53', NULL, '2024-03-07 00:32:53', 27, 6),
(43, 'Kavindu', 'Nimesh', 'kani.kntech@gmail.com', '760358784', 'fwe', 'AU', 'wellawaya', 0, '434', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 0.02, 'USD', '2024-03-07 06:05:10', NULL, '2024-03-07 00:35:10', 27, 6),
(44, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '0760358784', '237, Adawelayaya', 'CA', 'Wellawaya', 0, '91206', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 0.02, 'USD', '2024-03-18 06:37:14', NULL, '2024-03-18 01:07:14', 18, 6),
(45, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '0760358784', '237, Adawelayaya', 'AU', 'Wellawaya', 0, '91206', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 0.02, 'USD', '2024-03-18 06:40:41', NULL, '2024-03-18 01:10:41', 18, 6),
(46, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '0760358784', '237, Adawelayaya', 'CA', 'Wellawaya', 0, '91206', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 0.02, 'USD', '2024-03-18 06:50:55', NULL, '2024-03-18 01:20:55', 18, 6),
(47, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '0760358784', '237, Adawelayaya', 'AU', 'Wellawaya', 0, '91206', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 0.02, 'USD', '2024-03-18 06:54:06', NULL, '2024-03-18 01:24:06', 18, 6),
(48, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '0760358784', '237, Adawelayaya', 'CA', 'Wellawaya', 0, '91206', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 0.02, 'USD', '2024-03-18 06:54:30', NULL, '2024-03-18 01:24:30', 18, 6),
(49, 'Kavindu', 'Nimesh', 'kani.kntech@gmail.com', '760358784', 'fwe', 'AU', 'wellawaya', 0, '434', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 0.02, 'USD', '2024-03-22 04:07:32', NULL, '2024-03-21 22:37:32', 27, 6),
(50, 'Kavindu', 'Nimesh', 'kani.kntech@gmail.com', '760358784', 'fwe', 'AU', 'wellawaya', 0, '434', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 0.02, 'USD', '2024-03-22 04:16:19', NULL, '2024-03-21 22:46:19', 27, 6),
(51, 'Kavindu', 'Nimesh', 'kani.kntech@gmail.com', '760358784', 'fwe', 'LK', 'wellawaya', 0, '434', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 0.02, 'USD', '2024-03-22 04:23:43', NULL, '2024-03-21 22:53:43', 27, 6),
(52, 'Kavindu', 'Nimesh', 'kani.kntech@gmail.com', '760358784', 'fwe', 'FR', 'wellawaya', 0, '434', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 0.02, 'USD', '2024-03-22 04:23:59', NULL, '2024-03-21 22:53:59', 27, 6),
(53, 'Kavindu', 'Nimesh', 'kani.kntech@gmail.com', '760358784', 'fwe', 'FR', 'wellawaya', 1, '434', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 0.02, 'USD', '2024-03-22 07:45:14', NULL, '2024-03-22 02:15:14', 27, 6),
(54, 'Kavindu', 'Nimesh', 'kani.kntech@gmail.com', '760358784', 'fwe', 'CA', 'wellawaya', 2, '434', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 0.02, 'USD', '2024-03-22 07:50:15', NULL, '2024-03-22 02:20:15', 27, 6),
(55, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '760358784', '237, Adawelayaya', 'LK', 'Wellawaya', 1, '91206', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 0.02, 'USD', '2024-04-09 11:05:21', NULL, '2024-04-09 05:35:20', 18, 6),
(56, 'test', 'user', 'knimesh.work@gmail.com', '714550538', '237, Adawelayaya', 'LK', 'wellawaya', 1, '91206', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 0.02, 'USD', '2024-04-10 11:59:13', NULL, '2024-04-10 06:29:13', 18, 6),
(57, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '0760358784', '237, Adawelayaya', 'LK', 'Wellawaya', 1, '91206', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', 0.02, 'USD', '2024-04-10 12:02:30', NULL, '2024-04-10 06:32:30', 18, 6),
(58, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '0760358784', '237, Adawelayaya', 'AU', 'Wellawaya', 1, '91206', 1, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '0760358784', '237, Adawelayaya', 'AU', 'Wellawaya', '91206', 1, '', '', '', '', '', 0.02, 'USD', '2024-04-25 04:16:47', NULL, '2024-04-24 22:46:47', 18, 6),
(59, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '0760358784', '237, Adawelayaya', 'AU', 'Wellawaya', 1, '91206', 1, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '0760358784', '237, Adawelayaya', 'AU', 'Wellawaya', '91206', 1, '', '', '', '', '', 0.02, 'USD', '2024-04-25 04:20:52', NULL, '2024-04-24 22:50:52', 18, 6),
(60, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '0760358784', '237, Adawelayaya', 'FR', 'Wellawaya', 1, '91206', 1, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '0760358784', '237, Adawelayaya', 'FR', 'Wellawaya', '91206', 1, '', '', '', '', '', 0.02, 'USD', '2024-04-25 04:55:54', NULL, '2024-04-24 23:25:54', 18, 6),
(61, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '0760358784', '237, Adawelayaya', 'FR', 'Wellawaya', 1, '91206', 1, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '0760358784', '237, Adawelayaya', 'FR', 'Wellawaya', '91206', 1, '', '', '', '', '', 0.02, 'USD', '2024-04-25 04:59:36', NULL, '2024-04-24 23:29:36', 18, 6),
(62, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '0760358784', '237, Adawelayaya', 'CA', 'Wellawaya', 1, '91206', 1, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '0760358784', '237, Adawelayaya', 'CA', 'Wellawaya', '91206', 1, '', '', '', '', '', 0.02, 'USD', '2024-04-29 16:02:06', NULL, '2024-04-29 10:02:06', 18, 6),
(63, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '0760358784', '237, Adawelayaya', 'AU', 'Wellawaya', 1, '91206', 1, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '0760358784', '237, Adawelayaya', 'AU', 'Wellawaya', '91206', 1, '', '', '', '', '', 0.02, 'USD', '2024-04-29 16:03:30', NULL, '2024-04-29 10:03:30', 18, 6),
(64, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '0760358784', '237, Adawelayaya', 'FR', 'Wellawaya', 1, '91206', 1, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '0760358784', '237, Adawelayaya', 'FR', 'Wellawaya', '91206', 1, '', '', '', '', '', 0.02, 'USD', '2024-04-29 16:04:16', NULL, '2024-04-29 10:04:16', 18, 6),
(65, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '0760358784', '237, Adawelayaya', 'AU', 'Wellawaya', 1, '91206', 1, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '0760358784', '237, Adawelayaya', 'AU', 'Wellawaya', '91206', 1, '', '', '', '', '', 0.02, 'USD', '2024-04-29 16:06:36', NULL, '2024-04-29 10:06:35', 18, 6),
(66, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '0760358784', '237, Adawelayaya', 'FR', 'Wellawaya', 1, '91206', 1, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '0760358784', '237, Adawelayaya', 'FR', 'Wellawaya', '91206', 1, '', '', '', '', '', 0.02, 'USD', '2024-04-29 16:07:26', NULL, '2024-04-29 10:07:26', 18, 6),
(67, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '0760358784', '237, Adawelayaya', 'LK', 'Wellawaya', 1, '91206', 1, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '0760358784', '237, Adawelayaya', 'LK', 'Wellawaya', '91206', 1, '', '', '', '', '', 0.02, 'USD', '2024-04-30 02:45:57', NULL, '2024-04-29 20:45:57', 18, 6),
(68, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '0760358784', '237, Adawelayaya', 'NL', 'Wellawaya', 1, '91206', 1, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '0760358784', '237, Adawelayaya', 'NL', 'Wellawaya', '91206', 1, '', '', '', '', '', 0.02, 'USD', '2024-04-30 02:55:36', NULL, '2024-04-29 20:55:36', 18, 6),
(69, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '0760358784', '237, Adawelayaya', 'AU', 'Wellawaya', 1, '91206', 1, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '0760358784', '237, Adawelayaya', 'AU', 'Wellawaya', '91206', 1, '', '', '', '', '', 0.02, 'USD', '2024-04-30 03:17:20', '725ee772f71048a4', '2024-04-29 21:17:20', 18, 6),
(70, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '0760358784', '237, Adawelayaya', 'CA', 'Wellawaya', 1, '91206', 1, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '0760358784', '237, Adawelayaya', 'CA', 'Wellawaya', '91206', 1, '', '', '', '', '', 0.02, 'USD', '2024-04-30 03:51:57', '', '2024-04-29 21:51:57', 18, 6),
(71, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '0760358784', '237, Adawelayaya', 'AU', 'Wellawaya', 1, '91206', 1, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '0760358784', '237, Adawelayaya', 'AU', 'Wellawaya', '91206', 1, '', '', '', '', '', 0.02, 'USD', '2024-04-30 03:52:45', '', '2024-04-29 21:52:45', 18, 6),
(72, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '0760358784', '237, Adawelayaya', 'FR', 'Wellawaya', 1, '91206', 1, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '0760358784', '237, Adawelayaya', 'FR', 'Wellawaya', '91206', 1, '', '', '', '', '', 0.02, 'USD', '2024-04-29 22:23:09', '8c78394d234e4fee', '2024-04-29 21:53:25', 18, 5),
(73, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '0760358784', '237, Adawelayaya', 'FR', 'Wellawaya', 1, '91206', 1, 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '0760358784', '237, Adawelayaya', 'FR', 'Wellawaya', '91206', 1, '', '', '', '', '', 3.15, 'USD', '2024-04-29 22:28:41', 'a4131de561ed4ffc', '2024-04-29 22:27:17', 18, 2),
(74, 'Ruchira', 'Lakmal', 'ruchira@ion-groups.com', '940772677237', '24 2/1 P B Alwis Perera Mawatha', 'LK', 'Moratuwa', 1, '10400', 1, 'Ruchira', 'Lakmal', 'ruchira@ion-groups.com', '0772677237', '24 2/1 P B Alwis Perera Mawatha', 'LK', 'Moratuwa', '10400', 1, '', '', '', '', '', 0.02, 'USD', '2024-05-21 07:03:13', 'a98cf32f41fd44ba', '2024-05-21 01:33:13', 9, 6),
(75, 'Ruchira', 'Lakmal', 'ruchira@ion-groups.com', '940772677237', '24 2/1 P B Alwis Perera Mawatha', 'AU', 'Moratuwa', 2, '10400', 1, 'Ruchira', 'Lakmal', 'ruchira@ion-groups.com', '0772677237', '24 2/1 P B Alwis Perera Mawatha', 'AU', 'Moratuwa', '10400', 1, '', '', '', '', '', 0.02, 'USD', '2024-05-21 07:09:55', NULL, '2024-05-21 01:39:55', 9, 6),
(76, 'Ruchira', 'Lakmal', 'ruchira@ion-groups.com', '940772677237', '24 2/1 P B Alwis Perera Mawatha', 'LK', 'Moratuwa', 1, '10400', 1, 'Ruchira', 'Lakmal', 'ruchira@ion-groups.com', '0772677237', '24 2/1 P B Alwis Perera Mawatha', 'LK', 'Moratuwa', '10400', 1, '', '', '', '', '', 0.02, 'USD', '2024-05-21 07:10:17', '2c2538e8a7a64cef', '2024-05-21 01:40:17', 9, 6),
(77, 'Ruchira', 'Lakmal', 'ruchira@ion-groups.com', '940772677237', '24 2/1 P B Alwis Perera Mawatha', 'LK', 'Moratuwa', 1, '10400', 1, 'Ruchira', 'Lakmal', 'ruchira@ion-groups.com', '0772677237', '24 2/1 P B Alwis Perera Mawatha', 'LK', 'Moratuwa', '10400', 1, '', '', '', '', '', 0.02, 'USD', '2024-05-21 08:40:14', 'c8e0b9c9afa547ee', '2024-05-21 03:10:14', 9, 6),
(78, 'Ruchira', 'Lakmal', 'ruchira@ion-groups.com', '940772677237', '24 2/1 P B Alwis Perera Mawatha', 'LK', 'data', 1, '10400', 1, 'Ruchira', 'Lakmal', 'ruchira@ion-groups.com', '0772677237', '24 2/1 P B Alwis Perera Mawatha', 'LK', 'data', '10400', 1, '', '', '', '', '', 0.02, 'USD', '2024-05-21 04:08:46', '686538cb0661447c', '2024-05-21 04:04:23', 9, 2);

-- --------------------------------------------------------

--
-- Table structure for table `order_bill_custom`
--

CREATE TABLE `order_bill_custom` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL DEFAULT '',
  `last_name` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(300) NOT NULL DEFAULT '',
  `phone` varchar(20) NOT NULL DEFAULT '',
  `address` varchar(600) NOT NULL DEFAULT '',
  `country` varchar(100) NOT NULL DEFAULT '',
  `city` varchar(100) NOT NULL DEFAULT '',
  `postal_code` varchar(20) NOT NULL DEFAULT '',
  `order_amount` double NOT NULL DEFAULT 0,
  `currency` varchar(3) NOT NULL DEFAULT 'USD',
  `paid_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `added_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `added_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_bill_custom`
--

INSERT INTO `order_bill_custom` (`id`, `first_name`, `last_name`, `email`, `phone`, `address`, `country`, `city`, `postal_code`, `order_amount`, `currency`, `paid_time`, `added_time`, `added_by`, `status`) VALUES
(1, 'example text', 'example text', 'sample@example.com', '0760358784', 'example text', 'example text', 'example text', 'example text', 1, 'LKR', '2024-03-04 03:57:21', '2024-03-03 22:27:21', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_bill_items`
--

CREATE TABLE `order_bill_items` (
  `id` int(11) NOT NULL,
  `order_bill_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  `attribute_name` varchar(100) NOT NULL DEFAULT '',
  `qty` int(11) NOT NULL DEFAULT 1,
  `price` double NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `color` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_bill_items`
--

INSERT INTO `order_bill_items` (`id`, `order_bill_id`, `product_id`, `attribute_id`, `attribute_name`, `qty`, `price`, `status`, `color`) VALUES
(1, 1, 76, 14, 'L', 1, 1234, 1, 24),
(2, 2, 115, 7, '46', 1, 0.1, 1, 27),
(3, 3, 115, 7, '46', 1, 0.1, 1, 27),
(4, 4, 115, 7, '46', 1, 0.1, 1, 27),
(5, 5, 115, 7, '46', 1, 0.1, 1, 27),
(6, 6, 115, 7, '46', 1, 10, 1, 27),
(7, 7, 115, 7, '46', 1, 10, 1, 27),
(8, 8, 102, 7, '46', 1, 315, 1, 26),
(9, 9, 103, 7, '46', 1, 315, 1, 23),
(10, 10, 103, 7, '46', 1, 10, 1, 23),
(11, 11, 103, 7, '46', 1, 10, 1, 23),
(12, 12, 103, 7, '46', 1, 10, 1, 23),
(13, 13, 103, 7, '46', 1, 10, 1, 23),
(14, 14, 103, 7, '46', 1, 10, 1, 23),
(15, 15, 103, 7, '46', 1, 10, 1, 23),
(26, 26, 103, 7, '46', 1, 2, 1, 23),
(27, 27, 103, 7, '46', 1, 1, 1, 23),
(28, 28, 103, 7, '46', 1, 2, 1, 23),
(29, 29, 103, 7, '46', 1, 2, 1, 23),
(30, 30, 103, 7, '46', 1, 2, 1, 23),
(31, 31, 103, 7, '46', 1, 2, 1, 23),
(32, 32, 103, 7, '46', 1, 2, 1, 23),
(33, 33, 103, 7, '46', 1, 2, 1, 23),
(34, 34, 103, 7, '46', 1, 2, 1, 23),
(35, 35, 103, 7, '46', 1, 2, 1, 23),
(37, 37, 103, 7, '46', 1, 0.02, 1, 23),
(38, 38, 103, 7, '46', 1, 0.02, 1, 23),
(39, 39, 103, 7, '46', 1, 0.02, 1, 23),
(40, 40, 103, 7, '46', 1, 0.02, 1, 23),
(41, 41, 103, 7, '46', 1, 0.02, 1, 23),
(42, 42, 103, 7, '46', 1, 0.02, 1, 23),
(43, 43, 103, 7, '46', 1, 0.02, 1, 23),
(44, 44, 103, 7, '46', 1, 0.02, 1, 23),
(45, 45, 103, 7, '46', 1, 0.02, 1, 23),
(46, 46, 103, 7, '46', 1, 0.02, 1, 23),
(47, 47, 103, 7, '46', 1, 0.02, 1, 23),
(48, 48, 103, 7, '46', 1, 0.02, 1, 23),
(49, 49, 103, 7, '46', 1, 0.02, 1, 23),
(50, 50, 103, 7, '46', 1, 0.02, 1, 23),
(51, 51, 103, 7, '46', 1, 0.02, 1, 23),
(52, 52, 103, 7, '46', 1, 0.02, 1, 23),
(53, 53, 103, 7, '46', 1, 0.02, 1, 23),
(54, 54, 103, 7, '46', 1, 0.02, 1, 23),
(55, 55, 103, 7, '46', 1, 0.02, 1, 23),
(56, 56, 103, 7, '46', 1, 0.02, 1, 23),
(57, 57, 103, 7, '46', 1, 0.02, 1, 23),
(58, 58, 103, 7, '46', 1, 0.02, 1, 23),
(59, 59, 103, 7, '46', 1, 0.02, 1, 23),
(60, 60, 103, 7, '46', 1, 0.02, 1, 23),
(61, 61, 103, 7, '46', 1, 0.02, 1, 23),
(62, 62, 103, 7, '46', 1, 0.02, 1, 23),
(63, 63, 103, 7, '46', 1, 0.02, 1, 23),
(64, 64, 103, 7, '46', 1, 0.02, 1, 23),
(65, 65, 103, 7, '46', 1, 0.02, 1, 23),
(66, 66, 103, 7, '46', 1, 0.02, 1, 23),
(67, 67, 103, 7, '46', 1, 0.02, 1, 23),
(68, 68, 103, 7, '46', 1, 0.02, 1, 23),
(69, 69, 103, 7, '46', 1, 0.02, 1, 23),
(70, 70, 103, 7, '46', 1, 0.02, 1, 23),
(71, 71, 103, 7, '46', 1, 0.02, 1, 23),
(72, 72, 103, 7, '46', 1, 0.02, 1, 23),
(73, 73, 102, 7, '46', 1, 3.15, 1, 26),
(74, 74, 103, 7, '46', 1, 0.02, 1, 23),
(75, 75, 103, 7, '46', 1, 0.02, 1, 23),
(76, 76, 103, 7, '46', 1, 0.02, 1, 23),
(77, 77, 103, 7, '46', 1, 0.02, 1, 23),
(78, 78, 103, 7, '46', 1, 0.02, 1, 23);

-- --------------------------------------------------------

--
-- Table structure for table `order_bill_items_custom`
--

CREATE TABLE `order_bill_items_custom` (
  `id` int(11) NOT NULL,
  `order_bill_id` int(11) NOT NULL,
  `product_type` int(11) NOT NULL,
  `styles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '[]' CHECK (json_valid(`styles`)),
  `qty` int(11) NOT NULL DEFAULT 1,
  `price` double NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `size` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_bill_items_custom`
--

INSERT INTO `order_bill_items_custom` (`id`, `order_bill_id`, `product_type`, `styles`, `qty`, `price`, `status`, `size`) VALUES
(41, 1, 1, '[{\"name\":\"test\",\"value\":\"test\"}]', 1, 1, 1, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `order_bill_items_custom_fabric`
--

CREATE TABLE `order_bill_items_custom_fabric` (
  `id` int(11) NOT NULL,
  `order_bill_item_id` int(11) NOT NULL,
  `fabric_id` int(11) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_bill_items_custom_fabric`
--

INSERT INTO `order_bill_items_custom_fabric` (`id`, `order_bill_item_id`, `fabric_id`, `price`) VALUES
(1, 41, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_custom_status`
--

CREATE TABLE `order_custom_status` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_custom_status`
--

INSERT INTO `order_custom_status` (`id`, `name`) VALUES
(1, 'pending'),
(2, 'processing'),
(3, 'Delivered'),
(4, 'Canceled'),
(5, 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `name`) VALUES
(1, 'pending'),
(2, 'processing'),
(3, 'Delivered'),
(4, 'Canceled'),
(5, 'Paid'),
(6, 'pending-qty-restored');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `title` varchar(500) NOT NULL DEFAULT '',
  `category` int(11) NOT NULL DEFAULT 0,
  `sub_category` int(11) DEFAULT NULL,
  `price` double NOT NULL DEFAULT 0,
  `discount_type` int(11) NOT NULL DEFAULT 1 COMMENT '1 - percentage, 2 - amount',
  `discount_percentage` double NOT NULL DEFAULT 0,
  `discount_amount` double NOT NULL DEFAULT 0,
  `color` int(11) NOT NULL DEFAULT 0,
  `short_description` varchar(5000) NOT NULL DEFAULT '',
  `long_description` text NOT NULL DEFAULT '',
  `size_and_fit` text NOT NULL DEFAULT '',
  `features` text NOT NULL DEFAULT '',
  `feature_image_url` varchar(500) NOT NULL DEFAULT '',
  `size_image_url` varchar(1000) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT 0,
  `added_by` int(11) NOT NULL DEFAULT 0,
  `added_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `title`, `category`, `sub_category`, `price`, `discount_type`, `discount_percentage`, `discount_amount`, `color`, `short_description`, `long_description`, `size_and_fit`, `features`, `feature_image_url`, `size_image_url`, `status`, `added_by`, `added_time`, `updated_by`, `updated_time`) VALUES
(26, 'Suit Sample 01', 16, NULL, 165100, 1, 0, 0, 24, 'Alpaca Wool Polyamide by NB, Sri Lanka', '<table class=\"pdp-accordion__table\" style=\"width: 30.6698%; height: 179.125px;\">\n<tbody>\n<tr style=\"height: 22.3906px;\">\n<th style=\"width: 48.6709%; height: 22.3906px;\">Product Code</th>\n<td style=\"width: 40.3736%; height: 22.3906px;\">P6731</td>\n</tr>\n<tr style=\"height: 22.3906px;\">\n<th style=\"width: 48.6709%; height: 22.3906px;\">Material</th>\n<td style=\"width: 40.3736%; height: 22.3906px;\">Pure Wool</td>\n</tr>\n<tr style=\"height: 22.3906px;\">\n<th style=\"width: 48.6709%; height: 22.3906px;\">Composition</th>\n<td style=\"width: 40.3736%; height: 22.3906px;\">100% Wool</td>\n</tr>\n<tr style=\"height: 22.3906px;\">\n<th style=\"width: 48.6709%; height: 22.3906px;\">Fabric Code</th>\n<td style=\"width: 40.3736%; height: 22.3906px;\">324601/1</td>\n</tr>\n<tr style=\"height: 44.7812px;\">\n<th style=\"width: 48.6709%; height: 44.7812px;\">Woven by</th>\n<td style=\"width: 40.3736%; height: 44.7812px;\">E.Thomas, Italy</td>\n</tr>\n<tr style=\"height: 44.7812px;\">\n<th style=\"width: 48.6709%; height: 44.7812px;\">Care Instructions</th>\n<td style=\"width: 40.3736%; height: 44.7812px;\">Dry Clean Only</td>\n</tr>\n</tbody>\n</table>', '<ul>\n<li>Slim cut whilst retaining comfortable mobility</li>\n<li>Made to wear with, without or over a jacket</li>\n<li>Model is wearing size US 38</li>\n<li>Model measures: chest 38\" , height 6.1\"</li>\n</ul>', '<ul>\n<li>High collar</li>\n<li>5-Button closure</li>\n<li>Welted pockets</li>\n<li>Water Repellent</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/image_1703219901854.avif', '', 403, 1, '2023-12-22 04:38:21', NULL, '2023-12-22 04:38:21'),
(27, 'Suit Sample 02', 16, NULL, 165100, 1, 0, 0, 22, 'Alpaca Wool Polyamide by NB, Sri Lanka', '<table class=\"pdp-accordion__table\" style=\"width: 83.6548%; height: 168.5px;\">\n<tbody>\n<tr style=\"height: 39.375px;\">\n<th style=\"width: 48.7187%; text-align: left; height: 39.375px;\">Product Code</th>\n<td style=\"width: 51.2813%; height: 39.375px;\">P6731</td>\n</tr>\n<tr style=\"height: 41.375px;\">\n<th style=\"width: 48.7187%; text-align: left; height: 41.375px;\">Material</th>\n<td style=\"width: 51.2813%; height: 41.375px;\">Pure Wool</td>\n</tr>\n<tr style=\"height: 50.375px;\">\n<th style=\"width: 48.7187%; text-align: left; height: 50.375px;\">Composition</th>\n<td style=\"width: 51.2813%; height: 50.375px;\">100% Wool</td>\n</tr>\n<tr style=\"height: 37.375px;\">\n<th style=\"width: 48.7187%; text-align: left; height: 37.375px;\">Fabric Code</th>\n<td style=\"width: 51.2813%; height: 37.375px;\">324601/1</td>\n</tr>\n</tbody>\n</table>', '<ul>\n<li>Slim cut whilst retaining comfortable mobility</li>\n<li>Made to wear with, without or over a jacket</li>\n<li>Model is wearing size US 38</li>\n<li>Model measures: chest 38\" , height 6.1\"</li>\n</ul>', '<ul>\n<li>High collar</li>\n<li>5-Button closure</li>\n<li>Welted pockets</li>\n<li>Water Repellent</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/image_1703221468720.avif', '', 403, 1, '2023-12-22 05:04:28', 1, '2023-12-22 05:08:00'),
(36, 'Ultra Jet Blue Italian Tropical', 16, 3, 440100, 1, 0, 0, 24, 'Ultra jet blue', '<table class=\"pdp-accordion__table\" style=\"height: 107px; width: 80.4061%;\">\n<tbody>\n<tr>\n<th style=\"width: 44.1682%; text-align: justify;\">Product Code</th>\n<td style=\"width: 52.2254%;\">MS24D1</td>\n</tr>\n<tr>\n<th style=\"width: 44.1682%; text-align: justify;\">Material</th>\n<td style=\"width: 52.2254%;\">Ultra jet blue</td>\n</tr>\n<tr>\n<th style=\"width: 44.1682%; text-align: justify;\">Fabric Code</th>\n<td style=\"width: 52.2254%;\">&nbsp;</td>\n</tr>\n</tbody>\n</table>', '<ul>\n<li>Classic and sophisticated style of formalwear</li>\n<li>Made to wear with, without bow</li>\n<li>Model is wearing size US 38</li>\n<li>Model measures: chest 38\", height 6.1\"</li>\n</ul>', '<ul>\n<li>Classic style shawl lapel</li>\n<li>1-Button closure</li>\n<li>Reguler pockets with flaps</li>\n<li>Side vents</li>\n<li>Double breasted waistcoat with 6x2&nbsp;classic style shawl lapel</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d1-2-F.avif', '', 1, 1, '2023-12-23 08:02:26', 1, '2024-01-19 15:28:31'),
(37, 'Ultra Jet Black Lycra', 16, 3, 440100, 1, 0, 0, 22, 'Lycra black', '<table class=\"pdp-accordion__table\" style=\"height: 107px; width: 80.4061%;\">\n<tbody>\n<tr>\n<th style=\"width: 44.1682%; text-align: justify;\">Product Code</th>\n<td style=\"width: 52.2254%;\">MS24D2</td>\n</tr>\n<tr>\n<th style=\"width: 44.1682%; text-align: justify;\">Material</th>\n<td style=\"width: 52.2254%;\">Lycra black</td>\n</tr>\n<tr>\n<th style=\"width: 44.1682%; text-align: justify;\">Fabric Code</th>\n<td style=\"width: 52.2254%;\">&nbsp;</td>\n</tr>\n</tbody>\n</table>', '<ul>\n<li>Slim cut 1 button</li>\n<li>Made to wear with bow</li>\n<li>Classic and sophisticated style of formalwear</li>\n<li>Model is wearing size US 38</li>\n<li>Model measures: chest 38\", height 6.1\"</li>\n</ul>', '<ul>\n<li>Shawl lapel strait cut</li>\n<li>1-Button closure</li>\n<li>Welt breast pockets</li>\n<li>Double breasted waistcoat with shawl lapel</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d2-2-F.avif', '', 1, 1, '2023-12-23 08:05:40', 1, '2024-01-14 17:33:18'),
(38, 'Black Damask Jacquard Fabric', 16, 3, 418100, 1, 0, 0, 22, 'Damask jacquard fabric', '<table class=\"pdp-accordion__table\" style=\"height: 107px; width: 80.4061%;\">\n<tbody>\n<tr>\n<th style=\"width: 44.1682%; text-align: justify;\">Product Code</th>\n<td style=\"width: 52.2254%;\">MS24D3</td>\n</tr>\n<tr>\n<th style=\"width: 44.1682%; text-align: justify;\">Material</th>\n<td style=\"width: 52.2254%;\">Damask jacquard</td>\n</tr>\n<tr>\n<th style=\"width: 44.1682%; text-align: justify;\">Fabric Code</th>\n<td style=\"width: 52.2254%;\">&nbsp;</td>\n</tr>\n</tbody>\n</table>', '<ul>\n<li>Slim cut double breasted 6x2 buttons</li>\n<li>Made to wear with tie</li>\n<li>Model is wearing size US 38</li>\n<li>Model measures: chest 38\", height 6.1\"</li>\n</ul>', '<ul>\n<li>Classic peack lapel</li>\n<li>6x2-Button closure</li>\n<li>Jetted pocket with flaps</li>\n<li>Double breasted</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d3-4-F.avif', '', 1, 1, '2023-12-23 08:08:32', 1, '2024-01-14 17:33:36'),
(39, 'Diamante Embellishment ', 16, 3, 440100, 1, 0, 0, 22, 'Black acetate and wool blend with lurex effect', '<table class=\"pdp-accordion__table\" style=\"height: 107px; width: 80.4061%;\">\n<tbody>\n<tr>\n<th style=\"width: 44.1682%; text-align: justify;\">Product Code</th>\n<td style=\"width: 52.2254%;\">MS24D4</td>\n</tr>\n<tr>\n<th style=\"width: 44.1682%; text-align: justify;\">Material</th>\n<td style=\"width: 52.2254%;\">Wool blend with lurex effect</td>\n</tr>\n<tr>\n<th style=\"width: 44.1682%; text-align: justify;\">Fabric Code</th>\n<td style=\"width: 52.2254%;\">&nbsp;</td>\n</tr>\n</tbody>\n</table>', '<ul>\n<li>Slim cut single breasted 2 buttons</li>\n<li>Made to wear with tie</li>\n<li>Model is wearing size US 38</li>\n<li>Model measures: chest 38\", height 6.1\"</li>\n</ul>', '<ul>\n<li>Slim peack Lapel Reguler</li>\n<li>2-Button closure</li>\n<li>Jetted Pocket</li>\n<li>Side vent</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d4-3F.avif', '', 1, 1, '2023-12-23 08:11:27', 1, '2024-01-20 04:16:55'),
(40, 'Midnight Blue Velvet', 16, 3, 495100, 1, 0, 0, 24, 'Midnight Blue Velvet', '<table class=\"pdp-accordion__table\" style=\"height: 107px; width: 80.4061%;\">\n<tbody>\n<tr>\n<th style=\"width: 44.1682%; text-align: justify;\">Product Code</th>\n<td style=\"width: 52.2254%;\">MS24D5</td>\n</tr>\n<tr>\n<th style=\"width: 44.1682%; text-align: justify;\">Material</th>\n<td style=\"width: 52.2254%;\">Midnight Blue Velvet</td>\n</tr>\n<tr>\n<th style=\"width: 44.1682%; text-align: justify;\">Fabric Code</th>\n<td style=\"width: 52.2254%;\">&nbsp;</td>\n</tr>\n</tbody>\n</table>', '<ul>\n<li>Single breasted slim 1 button&nbsp;</li>\n<li>Made to wear with bow or tie</li>\n<li>Model is wearing size US 38</li>\n<li>Model measures: chest 38\", height 6.1\"</li>\n</ul>', '<ul>\n<li>Shawl lapel slim with hilighted black</li>\n<li>1-Button closure</li>\n<li>Reguler pockets with flaps &amp; ticket pocket</li>\n<li>Double breasted waistcoat</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d5-3-F.avif', '', 1, 1, '2023-12-23 08:14:38', 1, '2024-01-14 17:34:41'),
(41, 'Royal Blue Mohair Blend', 16, 3, 495100, 1, 0, 0, 24, 'Damask Jacquard Fabric', '<table class=\"pdp-accordion__table\" style=\"height: 107px; width: 80.4061%;\">\n<tbody>\n<tr>\n<th style=\"width: 44.1682%; text-align: justify;\">Product Code</th>\n<td style=\"width: 52.2254%;\">MS24D6</td>\n</tr>\n<tr>\n<th style=\"width: 44.1682%; text-align: justify;\">Material</th>\n<td style=\"width: 52.2254%;\">Damask Jacquard Fabric</td>\n</tr>\n<tr>\n<th style=\"width: 44.1682%; text-align: justify;\">Fabric Code</th>\n<td style=\"width: 52.2254%;\">&nbsp;</td>\n</tr>\n</tbody>\n</table>', '<ul>\n<li>Double breasted with half belt</li>\n<li>Made to wear with bow or tie</li>\n<li>Model is wearing size US 38</li>\n<li>Model measures: chest 38\", height 6.1\"</li>\n</ul>', '<ul>\n<li>Classic shawl lapel&nbsp;</li>\n<li>Half belt wiht 2 buttons</li>\n<li>Slant side jetted</li>\n<li>Highlighted handcuff</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d6F-2-F.avif', '', 1, 1, '2023-12-23 08:17:01', 1, '2024-01-14 15:26:41'),
(42, 'Rever lance Ivory Baroque ', 16, 3, 418100, 1, 0, 0, 25, ' Ivory Baroque ', '<table class=\"pdp-accordion__table\" style=\"height: 107px; width: 80.4061%;\">\n<tbody>\n<tr>\n<th style=\"width: 44.1682%; text-align: justify;\">Product Code</th>\n<td style=\"width: 52.2254%;\">MS24D7</td>\n</tr>\n<tr>\n<th style=\"width: 44.1682%; text-align: justify;\">Material</th>\n<td style=\"width: 52.2254%;\">Ivory Baroque&nbsp;</td>\n</tr>\n<tr>\n<th style=\"width: 44.1682%; text-align: justify;\">Fabric Code</th>\n<td style=\"width: 52.2254%;\">&nbsp;</td>\n</tr>\n</tbody>\n</table>', '<ul>\n<li>Short-tailed groom suit in gold shantung</li>\n<li>Single breasted design</li>\n<li>Model is wearing size US 38</li>\n<li>Model measures: chest 38\", height 6.1\"</li>\n</ul>', '<ul>\n<li>Peak lapel without pockets</li>\n<li>6x2-Button closure</li>\n<li>Single breasted point bottom 4 buttons</li>\n<li>Length of jacket is typically suitable from the groom</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d7-2-F.avif', '', 2, 1, '2023-12-23 08:18:24', 1, '2024-01-14 17:37:16'),
(43, 'Fashion Electric Blue', 16, 3, 495100, 1, 0, 0, 24, 'Blue hound\'s wool blend', '<table class=\"pdp-accordion__table\" style=\"height: 107px; width: 80.4061%;\">\n<tbody>\n<tr>\n<th style=\"width: 44.1682%; text-align: justify;\">Product Code</th>\n<td style=\"width: 52.2254%;\">MS24D8</td>\n</tr>\n<tr>\n<th style=\"width: 44.1682%; text-align: justify;\">Material</th>\n<td style=\"width: 52.2254%;\"><span lang=\"EN-US\" style=\"font-size: 12.0pt; font-family: \'Calibri\',sans-serif; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: Calibri; mso-fareast-theme-font: minor-latin; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: \'Arial Unicode MS\'; mso-ansi-language: EN-US; mso-fareast-language: EN-US; mso-bidi-language: SI-LK;\">Blue hound\'s wool blend</span></td>\n</tr>\n<tr>\n<th style=\"width: 44.1682%; text-align: justify;\">Fabric Code</th>\n<td style=\"width: 52.2254%;\">&nbsp;</td>\n</tr>\n</tbody>\n</table>', '<ul>\n<li>Slim cut double breasted 6x2 buttons</li>\n<li>Made to wear with, without bow or tie</li>\n<li>Model is wearing size US 38</li>\n<li>Model measures: chest 38\", height 6.1\"</li>\n</ul>', '<ul>\n<li>Shawl lapel slim</li>\n<li>6x2-Button closure</li>\n<li>Jetted pocket with flaps</li>\n<li>Double breasted</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d8-3-F.avif', '', 1, 1, '2023-12-23 08:20:23', 1, '2024-01-14 15:27:11'),
(45, 'Blue Jacquard Fabric with Honeycomb ', 16, 3, 495100, 1, 0, 0, 24, 'Blue Jacquard Fabric', '<table class=\"pdp-accordion__table\" style=\"height: 67.1952px; width: 80.4376%;\">\n<tbody>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Product Code</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">MS24D10</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Material</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">Blue Jacquard Fabric</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Fabric Code</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">&nbsp;</td>\n</tr>\n</tbody>\n</table>', '<ul>\n<li>Slim cut 1 button</li>\n<li>Made to wear with, without bow</li>\n<li>Model is wearing size US 38</li>\n<li>Model measures: chest 38\", height 6.1\"</li>\n</ul>', '<ul>\n<li>Shawl lapel slim</li>\n<li>1-Button closure</li>\n<li>Reguler pockets with flaps</li>\n<li>Side vents</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d10-3-F.avif', '', 1, 1, '2023-12-23 08:22:59', 1, '2024-01-20 04:16:15'),
(46, 'Redingote Green Wool Blend', 16, 3, 385100, 1, 0, 0, 26, 'Green wool blend fabric ', '<table class=\"pdp-accordion__table\" style=\"height: 107px; width: 80.4376%;\">\n<tbody>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">Product Code</th>\n<td style=\"width: 54.1884%;\">MS24D11</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">Material</th>\n<td style=\"width: 54.1884%;\">Wool blend</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">Fabric Code</th>\n<td style=\"width: 54.1884%;\">&nbsp;</td>\n</tr>\n</tbody>\n</table>', '<ul>\n<li>Slim cut double breasted 2x1 buttons</li>\n<li>Made to wear with, bow or tie</li>\n<li>Model is wearing size US 38</li>\n<li>Model measures: chest 38\", height 6.1\"</li>\n</ul>', '<ul>\n<li>Classic peack lapel&nbsp;</li>\n<li>2x1-button closure</li>\n<li>Side patch pocket</li>\n<li>Side vents</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d11-2-F.avif', '', 1, 1, '2023-12-23 08:24:52', 1, '2024-01-14 17:38:21'),
(48, 'White Rhinestone Ivory', 16, 2, 522600, 1, 0, 0, 25, 'French Brocade Fabric in Ivory Colour', '<table class=\"pdp-accordion__table\" style=\"height: 107px; width: 80.4376%;\">\n<tbody>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">Product Code</th>\n<td style=\"width: 54.1884%;\">MS24D13</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">Material</th>\n<td style=\"width: 54.1884%;\">French brocade</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">Fabric Code</th>\n<td style=\"width: 54.1884%;\">&nbsp;</td>\n</tr>\n</tbody>\n</table>', '<ul>\n<li>Modern fit Arya Sinhala dress</li>\n<li>Front open with 06 golden buttons</li>\n<li>Model is wearing size US 38</li>\n<li>Model measures: chest 38\", height 6.1\"</li>\n</ul>', '<ul>\n<li>Point mandarin collar</li>\n<li>6-Button closure</li>\n<li>Highlighted handcuff</li>\n<li>Latte colour sarong</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms2413-4-F.avif', '', 1, 1, '2023-12-23 08:30:56', 1, '2024-01-14 15:23:52'),
(49, 'Crystal Trimmings Baroque', 16, 2, 440100, 1, 0, 0, 26, 'Lace Colour Damask Fabric', '<table class=\"pdp-accordion__table\" style=\"height: 107px; width: 80.4376%;\">\n<tbody>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">Product Code</th>\n<td style=\"width: 54.1884%;\">MS24D14</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">Material</th>\n<td style=\"width: 54.1884%;\">Damask Fabric</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">Fabric Code</th>\n<td style=\"width: 54.1884%;\">&nbsp;</td>\n</tr>\n</tbody>\n</table>', '<ul>\n<li>Modern fit Arya Sinhala dress</li>\n<li>Front open with 06 golden buttons</li>\n<li>Model is wearing size US 38</li>\n<li>Model measures: chest 38\", height 6.1\"</li>\n</ul>', '<ul>\n<li>Point mandarin collar</li>\n<li>6-Button closure</li>\n<li>Tie belt on waist</li>\n<li>Latte colour Sarong</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d14-2-F.avif', '', 1, 1, '2023-12-23 08:35:58', 1, '2024-01-14 15:23:32'),
(54, 'Mohair Royal Deep Blue', 16, 3, 495100, 1, 0, 0, 24, 'Acetate Electric Blue', '<table class=\"pdp-accordion__table\" style=\"height: 107px; width: 80.4376%;\">\n<tbody>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">Product Code</th>\n<td style=\"width: 54.1884%;\">MS24D12</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">Material</th>\n<td style=\"width: 54.1884%;\">Acetate Electric Blue</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">Fabric Code</th>\n<td style=\"width: 54.1884%;\">&nbsp;</td>\n</tr>\n</tbody>\n</table>', '<ul>\n<li>Double breasted 1 button</li>\n<li>Made to wear with or without bow&nbsp;</li>\n<li>Model is wearing size US 38</li>\n<li>Model measures: chest 38\", height 6.1\"</li>\n</ul>', '<ul>\n<li>Notch Lapel Reguler</li>\n<li>1-Button</li>\n<li>Jetted Pocket</li>\n<li>Double breasted</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d12-2-F.avif', '', 1, 1, '2023-12-23 13:14:04', 1, '2024-01-14 17:36:48'),
(55, 'White Ivory Baroque', 16, 3, 102, 1, 0, 0, 23, 'Golden Brocade Linen', '<table class=\"pdp-accordion__table\" style=\"height: 107px; width: 80.4376%;\">\n<tbody>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">Product Code</th>\n<td style=\"width: 54.1884%;\">MS24D9</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">Material</th>\n<td style=\"width: 54.1884%;\">Golden Brocade Linen</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">Fabric Code</th>\n<td style=\"width: 54.1884%;\">&nbsp;</td>\n</tr>\n</tbody>\n</table>', '<ul>\n<li>Slim cut double breasted 6x2 buttons</li>\n<li>Made to wear with, bow or tie</li>\n<li>Model is wearing size US 38</li>\n<li>Model measures: chest 38\", height 6.1\"</li>\n</ul>', '<ul>\n<li>Peack Lapel Reguler</li>\n<li>6x2-Button closure</li>\n<li>Jetted Pocket</li>\n<li>Double breasted</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d9-2-F.avif', '', 1, 1, '2023-12-23 13:32:47', 1, '2024-01-14 15:28:06'),
(58, 'The Langley Backpack', 16, 5, 47950, 1, 0, 0, 22, 'Genuine Vintage Leather Backpack', '<table class=\"pdp-accordion__table\" style=\"height: 45.5859px; width: 80.4376%;\">\n<tbody>\n<tr style=\"height: 23.1875px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 23.1875px;\">Product Code</th>\n<td style=\"width: 54.1884%; height: 23.1875px;\">QKLB0019</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">Colour</th>\n<td style=\"width: 54.1884%;\">Black</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Material</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">Genuine Leather</td>\n</tr>\n</tbody>\n</table>', '<ul>\n<li>Made of high-quality crazy leather</li>\n<li>Front zippered pocket for smaller items.</li>\n<li>2 exterior side pockets.</li>\n<li>Suitabe for laptop</li>\n<li><span style=\"font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Oxygen, Ubuntu, Cantarell, \'Open Sans\', \'Helvetica Neue\', sans-serif;\">Grab handle and adjustable shoulder straps.</span></li>\n</ul>', '<ul>\n<li>Genuine Vintage Leather Backpack.</li>\n<li>Handcrafted to suit your daily needs.</li>\n<li>The Langley Backpack is a multifunctional.</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKLB0019-BK1-F.avif', '', 1, 1, '2024-01-14 16:52:14', 1, '2024-01-15 08:24:55'),
(59, 'Vintage Messenger Bag', 16, 5, 76000, 1, 0, 0, 27, 'The Faust Leather Bag', '<table class=\"pdp-accordion__table\" style=\"height: 67.9843px; width: 80.4376%;\">\n<tbody>\n<tr style=\"height: 23.1875px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 23.1875px;\">Product Code</th>\n<td style=\"width: 54.1884%; height: 23.1875px;\">QKLBTP0018</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Colour</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">Brown</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Material</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">Genuine Leather</td>\n</tr>\n</tbody>\n</table>', '<ul>\n<li>2x exterior clasp pockets.</li>\n<li>1 large central compartment.</li>\n<li>2x side interior sleeves</li>\n<li>Shoulder Strap</li>\n<li>Handstrap</li>\n</ul>', '<p><em>Please note that this bag is made of natural material,</em><br><em>therefore each bag is unique with a slightly different color.</em></p>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKLBTP0018-BR1-F.avif', '', 1, 1, '2024-01-14 17:17:32', 1, '2024-01-24 11:17:45'),
(65, 'Vintage Messenger Bag', 16, 5, 76000, 1, 0, 0, 28, 'The Faust Leather Camera Bag', '<table class=\"pdp-accordion__table\" style=\"height: 45.5859px; width: 80.4376%;\">\n<tbody>\n<tr style=\"height: 23.1875px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 23.1875px;\">Product Code</th>\n<td style=\"width: 54.1884%; height: 23.1875px;\">QKLBTP0018</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">Colour</th>\n<td style=\"width: 54.1884%;\">Wine Red</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Material</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">Genuine Leather</td>\n</tr>\n</tbody>\n</table>', '<ul>\n<li>2x exterior clasp pockets.</li>\n<li>1 large central compartment.</li>\n<li>2x side interior sleeves</li>\n<li>Shoulder Strap</li>\n<li>Handstrap&nbsp;</li>\n</ul>', '<p>Please note that this bag is made of natural material,<br>therefore each bag is unique with a slightly different color.</p>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKLBTP0018-DBR1-F.avif', '', 1, 1, '2024-01-14 17:27:28', 1, '2024-01-15 08:22:03'),
(66, 'Handcrafted Leather Oxford', 16, 4, 76000, 1, 0, 0, 22, '.Men\'s Conference Business Shoes', '<table class=\"pdp-accordion__table\" style=\"height: 45.5859px; width: 80.4376%;\">\n<tbody>\n<tr style=\"height: 23.1875px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 23.1875px;\">Product Code</th>\n<td style=\"width: 54.1884%; height: 23.1875px;\">QKSHB716</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">Colour</th>\n<td style=\"width: 54.1884%;\">Black</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Material</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">Genuine Leather</td>\n</tr>\n</tbody>\n</table>', '<p>The perfect choice for formal occasions,<br>from weddings to black tie events.&nbsp;</p>', '<ul>\n<li>Blake-stitched construction</li>\n<li>Premium leather lining</li>\n<li>Embossed detailing</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHB716-BKL2-F.avif', '', 1, 1, '2024-01-14 18:01:34', 1, '2024-01-15 08:20:15'),
(67, 'British Style Men\'s Genuine Leather', 16, 4, 43000, 1, 0, 0, 28, 'High-end Banquet Dress Shoes', '<table class=\"pdp-accordion__table\" style=\"height: 45.5859px; width: 80.4376%;\">\n<tbody>\n<tr style=\"height: 23.1875px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 23.1875px;\">Product Code</th>\n<td style=\"width: 54.1884%; height: 23.1875px;\">QKSHB717</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">Colour</th>\n<td style=\"width: 54.1884%;\">Wine Rad</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Material</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">Genuine Leather</td>\n</tr>\n</tbody>\n</table>', '<p>The perfect choice for formal occasions,<br>from weddings to black tie events.&nbsp;</p>', '<ul>\n<li>Blake-stitched construction</li>\n<li>Premium leather lining</li>\n<li>Embossed detailing</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHB717-WRB2-F.avif', '', 1, 1, '2024-01-15 08:04:16', 1, '2024-01-15 09:02:07'),
(68, ' Pointed Oxford Wedding Shoes ', 16, 4, 54000, 1, 0, 0, 27, 'High-end Banquet Dress Shoes', '<table class=\"pdp-accordion__table\" style=\"height: 45.5859px; width: 80.4376%;\">\n<tbody>\n<tr style=\"height: 23.1875px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 23.1875px;\">Product Code</th>\n<td style=\"width: 54.1884%; height: 23.1875px;\">QKSHK66</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">Colour</th>\n<td style=\"width: 54.1884%;\">Brown</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Material</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">Genuine Leather</td>\n</tr>\n</tbody>\n</table>', '<p>The perfect choice for formal occasions,<br>from weddings to black tie events.&nbsp;</p>', '<ul>\n<li>Blake-stitched construction</li>\n<li>Premium leather lining</li>\n<li>Embossed detailing</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHK66-LBRL2-F.avif', '', 1, 1, '2024-01-15 08:11:59', 1, '2024-01-15 08:19:27'),
(69, 'Business Formal Wear Shoe', 16, 4, 54000, 1, 0, 0, 22, 'Breathable Soft Leather', '<table class=\"pdp-accordion__table\" style=\"height: 45.5859px; width: 80.4376%;\">\n<tbody>\n<tr style=\"height: 23.1875px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 23.1875px;\">Product Code</th>\n<td style=\"width: 54.1884%; height: 23.1875px;\">QKSHK66</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">Colour</th>\n<td style=\"width: 54.1884%;\">Black</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Material</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">Genuine Leather</td>\n</tr>\n</tbody>\n</table>', '<p>The perfect choice for formal occasions,<br>from weddings to black tie events.&nbsp;</p>', '<ul>\n<li>Blake-stitched construction</li>\n<li>Premium leather lining</li>\n<li>Embossed detailing</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHK66-BKL2-F.avif', '', 1, 1, '2024-01-15 08:18:31', 1, '2024-01-15 08:19:00'),
(70, 'Sipriks Luxury Wedding Shoes', 16, 4, 54000, 1, 0, 0, 28, 'High-end Banquet Dress Shoes', '<table class=\"pdp-accordion__table\" style=\"height: 67.9843px; width: 80.4376%;\">\n<tbody>\n<tr style=\"height: 23.1875px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 23.1875px;\">Product Code</th>\n<td style=\"width: 54.1884%; height: 23.1875px;\">QKSHK66</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Colour</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">Wine Red</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Material</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">Genuine Leather</td>\n</tr>\n</tbody>\n</table>', '<p>The perfect choice for formal occasions,<br>from weddings to black tie events.&nbsp;</p>', '<ul>\n<li>Blake-stitched construction</li>\n<li>Premium leather lining</li>\n<li>Embossed detailing</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHK66-WRL2-F.avif', '', 1, 1, '2024-01-15 08:31:16', 1, '2024-01-15 08:58:55'),
(71, 'British Style Men\'s Genuine Leather', 16, 4, 76000, 1, 0, 0, 27, 'High-end Banquet Dress Shoes', '<table class=\"pdp-accordion__table\" style=\"height: 45.5859px; width: 80.4376%;\">\n<tbody>\n<tr style=\"height: 23.1875px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 23.1875px;\">Product Code</th>\n<td style=\"width: 54.1884%; height: 23.1875px;\">QKSHB716</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">Colour</th>\n<td style=\"width: 54.1884%;\">Brown</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Material</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">Genuine Leather</td>\n</tr>\n</tbody>\n</table>', '<p>The perfect choice for formal occasions,<br>from weddings to black tie events.&nbsp;</p>', '<ul>\n<li>Blake-stitched construction</li>\n<li>Premium leather lining</li>\n<li>Embossed detailing</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHB716-BRL2-F.avif', '', 1, 1, '2024-01-15 09:06:42', 1, '2024-01-15 09:07:07'),
(72, 'Single Monk Strap Loafers', 16, 4, 43000, 1, 0, 0, 27, 'High-end Banquet Dress Shoes', '<table class=\"pdp-accordion__table\" style=\"height: 45.5859px; width: 80.4376%;\">\n<tbody>\n<tr style=\"height: 23.1875px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 23.1875px;\">Product Code</th>\n<td style=\"width: 54.1884%; height: 23.1875px;\">QKSHB717</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">Colour</th>\n<td style=\"width: 54.1884%;\">Brown</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Material</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">Genuine Leather</td>\n</tr>\n</tbody>\n</table>', '<p>The perfect choice for formal occasions,<br>from weddings to black tie events.&nbsp;</p>', '<ul>\n<li>Blake-stitched construction</li>\n<li>Premium leather lining</li>\n<li>Embossed detailing</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHB717-BRB2-F.avif', '', 1, 1, '2024-01-15 09:11:49', 1, '2024-02-12 06:56:20'),
(73, 'British Style Men\'s Genuine Leather', 16, 4, 76000, 1, 0, 0, 28, 'High-end Banquet Dress Shoes', '<table class=\"pdp-accordion__table\" style=\"height: 45.5859px; width: 80.4376%;\">\n<tbody>\n<tr style=\"height: 23.1875px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 23.1875px;\">Product Code</th>\n<td style=\"width: 54.1884%; height: 23.1875px;\">QKSHB716</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">Colour</th>\n<td style=\"width: 54.1884%;\">Wins Red</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Material</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">Genuine Leather</td>\n</tr>\n</tbody>\n</table>', '<p>The perfect choice for formal occasions,<br>from weddings to black tie events.&nbsp;</p>', '<ul>\n<li>Blake-stitched construction</li>\n<li>Premium leather lining</li>\n<li>Embossed detailing</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHB716-WRL2-F2.avif', '', 1, 1, '2024-01-15 09:16:29', NULL, '2024-01-15 09:16:29'),
(74, 'Black Loafers for Men', 16, 4, 43000, 1, 0, 0, 22, 'High-end Banquet Dress Shoes', '<table class=\"pdp-accordion__table\" style=\"height: 45.5859px; width: 80.4376%;\">\n<tbody>\n<tr style=\"height: 23.1875px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 23.1875px;\">Product Code</th>\n<td style=\"width: 54.1884%; height: 23.1875px;\">QKSHB716</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">Colour</th>\n<td style=\"width: 54.1884%;\">Brown</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Material</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">Genuine Leather</td>\n</tr>\n</tbody>\n</table>', '<p>The perfect choice for formal occasions,<br>from weddings to black tie events.&nbsp;</p>', '<ul>\n<li>Blake-stitched construction</li>\n<li>Premium leather lining</li>\n<li>Embossed detailing</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHB717-BKB2-F2.avif', '', 1, 1, '2024-01-15 09:20:20', 1, '2024-01-18 14:16:59'),
(76, 'Men\'s Formal Shirt', 16, 8, 16050, 1, 0, 0, 24, 'SLIM / REGULAR FIT', '<table class=\"pdp-accordion__table\" style=\"height: 67.9843px; width: 80.4376%;\">\n<tbody>\n<tr style=\"height: 23.1875px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 23.1875px;\">Product Code</th>\n<td style=\"width: 54.1884%; height: 23.1875px;\">2401-MT-706</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">&nbsp;</th>\n<td style=\"width: 54.1884%;\">[QKMT813]</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Colour</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">Check Blue</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Material</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">96% Cotten</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">&nbsp;</th>\n<td style=\"width: 54.1884%;\">4% Spandex</td>\n</tr>\n</tbody>\n</table>', '<p>.</p>', '<ul>\n<li>Non ironing</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKLBTP0018-BR2F.avif', '', 1, 1, '2024-01-19 18:06:44', 1, '2024-01-23 12:43:59'),
(88, 'Men\'s Formal Shirt', 16, 8, 11089, 1, 0, 0, 24, 'SLIM / REGULAR FIT', '<table class=\"pdp-accordion__table\" style=\"height: 67.9843px; width: 80.4376%;\">\n<tbody>\n<tr style=\"height: 23.1875px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 23.1875px;\">Product Code</th>\n<td style=\"width: 54.1884%; height: 23.1875px;\">2401-MT-706</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">&nbsp;</th>\n<td style=\"width: 54.1884%;\">[QKMT813]</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Colour</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">Check Blue</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Material</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">66.7% Polyacetate Fifer</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">&nbsp;</th>\n<td style=\"width: 54.1884%;\">13.1% Spandex</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">&nbsp;</th>\n<td style=\"width: 54.1884%;\">17.8% Fiber</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">&nbsp;</th>\n<td style=\"width: 54.1884%;\">2.4% Mulbery Silk</td>\n</tr>\n</tbody>\n</table>', '<p>.</p>', '<ul>\n<li>Knitted Fabric</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-ZT70-06-2F.avif', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/product.avif', 1, 1, '2024-01-23 14:37:24', 1, '2024-01-23 16:06:20'),
(90, 'Men\'s Formal Shirt', 16, 8, 9725, 1, 0, 0, 24, 'SLIM / REGULAR FIT', '<table class=\"pdp-accordion__table\" style=\"height: 67.9843px; width: 80.4376%;\">\n<tbody>\n<tr style=\"height: 23.1875px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 23.1875px;\">Product Code</th>\n<td style=\"width: 54.1884%; height: 23.1875px;\">2401-SG-05</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">&nbsp;</th>\n<td style=\"width: 54.1884%;\">[QKMT813]</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Colour</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">Baby Blue</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Material</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">100% Polyester</td>\n</tr>\n</tbody>\n</table>', '<p>.</p>', '<ul>\n<li>Stripe design</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-SG-05-F.avif', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/product.avif', 1, 1, '2024-01-23 16:17:10', NULL, '2024-01-23 16:17:10'),
(91, 'Men\'s Formal Shirt', 16, 8, 9725, 1, 0, 0, 29, 'SLIM / REGULAR FIT', '<table class=\"pdp-accordion__table\" style=\"height: 67.9843px; width: 80.4376%;\">\n<tbody>\n<tr style=\"height: 23.1875px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 23.1875px;\">Product Code</th>\n<td style=\"width: 54.1884%; height: 23.1875px;\">2401-SG-02</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">&nbsp;</th>\n<td style=\"width: 54.1884%;\">[QKMT813]</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Colour</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">Purple</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Material</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">100% Polyester</td>\n</tr>\n</tbody>\n</table>', '<p>.</p>', '<ul>\n<li>Check design</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-SG-02-F.avif', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/product.avif', 1, 1, '2024-01-23 16:24:46', 1, '2024-01-23 16:26:16'),
(92, 'Men\'s Formal Shirt', 16, 8, 12750, 1, 0, 0, 26, 'Water proof, Oil and stain proof', '<table class=\"pdp-accordion__table\" style=\"height: 67.9843px; width: 80.4376%;\">\n<tbody>\n<tr style=\"height: 23.1875px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 23.1875px;\">Product Code</th>\n<td style=\"width: 54.1884%; height: 23.1875px;\">2401-3F-05</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">&nbsp;</th>\n<td style=\"width: 54.1884%;\">[QKMT813]</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Colour</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">Happy Sky</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Material</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">56.5% Viscose</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">&nbsp;</th>\n<td style=\"width: 54.1884%;\">38.7% Polyacetate</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">&nbsp;</th>\n<td style=\"width: 54.1884%;\">4.8% Ammonia Wheel</td>\n</tr>\n</tbody>\n</table>', '<p>.</p>', '<ul>\n<li>Water proof</li>\n<li>Oil and stain proof</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-3F-05-F.avif', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/product.avif', 1, 1, '2024-01-23 16:39:34', 1, '2024-01-23 16:46:21'),
(93, 'Men\'s Formal Shirt', 16, 8, 9725, 1, 0, 0, 24, 'SLIM / REGULAR FIT', '<table class=\"pdp-accordion__table\" style=\"height: 67.9843px; width: 80.4376%;\">\n<tbody>\n<tr style=\"height: 23.1875px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 23.1875px;\">Product Code</th>\n<td style=\"width: 54.1884%; height: 23.1875px;\">2401-SG-03</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">&nbsp;</th>\n<td style=\"width: 54.1884%;\">[QKMT813]</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Colour</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">Ukla Baby Blue</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Material</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">100% Polyester</td>\n</tr>\n</tbody>\n</table>', '<p>.</p>', '<ul>\n<li>Check design</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-SG-03-F.avif', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/product.avif', 1, 1, '2024-01-23 16:45:35', NULL, '2024-01-23 16:45:35'),
(94, 'Men\'s Formal Shirt', 16, 8, 12750, 1, 0, 0, 23, 'Water proof, Oil and stain proof', '<table class=\"pdp-accordion__table\" style=\"height: 67.9843px; width: 80.4376%;\">\n<tbody>\n<tr style=\"height: 23.1875px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 23.1875px;\">Product Code</th>\n<td style=\"width: 54.1884%; height: 23.1875px;\">2401-3F-01</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">&nbsp;</th>\n<td style=\"width: 54.1884%;\">[QKMT813]</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Colour</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">White</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Material</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">56.5% Viscose</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">&nbsp;</th>\n<td style=\"width: 54.1884%;\">38.7% Polyacetate</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">&nbsp;</th>\n<td style=\"width: 54.1884%;\">4.8% Ammonia Wheel</td>\n</tr>\n</tbody>\n</table>', '<p>.</p>', '<ul>\n<li>Water proof</li>\n<li>Oil and stain proof</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-3F-01-F.avif', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/product.avif', 1, 1, '2024-01-23 16:50:50', NULL, '2024-01-23 16:50:50'),
(95, 'Men\'s Formal Shirt', 16, 8, 16545, 1, 0, 0, 22, 'Ultra Jet Black', '<table class=\"pdp-accordion__table\" style=\"height: 67.9843px; width: 80.4376%;\">\n<tbody>\n<tr style=\"height: 23.1875px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 23.1875px;\">Product Code</th>\n<td style=\"width: 54.1884%; height: 23.1875px;\">2401-ZT110-02</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">&nbsp;</th>\n<td style=\"width: 54.1884%;\">[QKMT813]</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Colour</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">Jet Black</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Material</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">94% Cotton</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">&nbsp;</th>\n<td style=\"width: 54.1884%;\">6% Spandex</td>\n</tr>\n</tbody>\n</table>', '<p>.</p>', '<ul>\n<li>Knitted Fabric</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-ZT110-02-F.avif', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/product.avif', 1, 1, '2024-01-23 17:09:02', NULL, '2024-01-23 17:09:02'),
(96, 'Men\'s Formal Shirt', 16, 8, 11089, 1, 0, 0, 24, 'SLIM / REGULAR FIT', '<table class=\"pdp-accordion__table\" style=\"height: 157.578px; width: 80.4376%;\">\n<tbody>\n<tr style=\"height: 23.1875px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 23.1875px;\">Product Code</th>\n<td style=\"width: 54.1884%; height: 23.1875px;\">2401-ZT70-07</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">&nbsp;</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">[QKMT813]</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Colour</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">Aqua Blue</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Material</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">66.7% Polyacetate Fifer</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">&nbsp;</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">13.1% Spandex</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">&nbsp;</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">17.8% Fiber</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">&nbsp;</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">2.4% Mulbery Silk</td>\n</tr>\n</tbody>\n</table>', '<p>.</p>', '<ul>\n<li>Knitted Fabric</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-ZT70-07-F.avif', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/product.avif', 1, 1, '2024-01-23 17:22:37', NULL, '2024-01-23 17:22:37'),
(98, 'Men\'s Formal Shirt', 16, 8, 16545, 1, 0, 0, 24, 'SLIM / REGULAR FIT', '<table class=\"pdp-accordion__table\" style=\"height: 112.781px; width: 80.4376%;\">\n<tbody>\n<tr style=\"height: 23.1875px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 23.1875px;\">Product Code</th>\n<td style=\"width: 54.1884%; height: 23.1875px;\">2401-ZT110-08</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">&nbsp;</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">[QKMT813]</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Colour</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">Dark Navy</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Material</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">94% Cotton</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">&nbsp;</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">6% Spandex</td>\n</tr>\n</tbody>\n</table>', '<p>.</p>', '<ul>\n<li>Knitted Fabric</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-ZT110-08-F.avif', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/product.png', 1, 1, '2024-01-23 17:32:30', 1, '2024-01-24 02:20:02'),
(99, 'Men\'s Formal Shirt', 16, 8, 16545, 1, 0, 0, 27, 'SLIM / REGULAR FIT', '<table class=\"pdp-accordion__table\" style=\"height: 67.9843px; width: 80.4376%;\">\n<tbody>\n<tr style=\"height: 23.1875px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 23.1875px;\">Product Code</th>\n<td style=\"width: 54.1884%; height: 23.1875px;\">2401-ZT110-05</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">&nbsp;</th>\n<td style=\"width: 54.1884%;\">[QKMT813]</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Colour</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">Blush</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Material</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">94% Cotton</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">&nbsp;</th>\n<td style=\"width: 54.1884%;\">6% Spandex</td>\n</tr>\n</tbody>\n</table>', '<p>.</p>', '<ul>\n<li>Knitted Fabric</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-ZT110-05-F.avif', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/product.avif', 1, 1, '2024-01-24 02:19:11', NULL, '2024-01-24 02:19:11'),
(100, 'Men\'s Formal Shirt', 16, 8, 16050, 1, 0, 0, 23, 'Non Ironing - SLIM / REGULAR FIT', '<table class=\"pdp-accordion__table\" style=\"height: 67.9843px; width: 80.4376%;\">\n<tbody>\n<tr style=\"height: 23.1875px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 23.1875px;\">Product Code</th>\n<td style=\"width: 54.1884%; height: 23.1875px;\">2401-MT-708</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">&nbsp;</th>\n<td style=\"width: 54.1884%;\">[QKMT813]</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Colour</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">White</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Material</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">94% Cotton</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">&nbsp;</th>\n<td style=\"width: 54.1884%;\">6% Spandex</td>\n</tr>\n</tbody>\n</table>', '<p>.</p>', '<ul>\n<li>Non Ironing</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-MT-708-2.avif', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/product.avif', 1, 1, '2024-01-24 02:25:24', 1, '2024-01-24 02:26:16');
INSERT INTO `product` (`id`, `title`, `category`, `sub_category`, `price`, `discount_type`, `discount_percentage`, `discount_amount`, `color`, `short_description`, `long_description`, `size_and_fit`, `features`, `feature_image_url`, `size_image_url`, `status`, `added_by`, `added_time`, `updated_by`, `updated_time`) VALUES
(101, 'Men\'s Formal Shirt', 16, 8, 16545, 1, 0, 0, 24, 'SLIM / REGULAR FIT', '<table class=\"pdp-accordion__table\" style=\"height: 113.773px; width: 80.4376%;\">\n<tbody>\n<tr style=\"height: 23.1875px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 23.1875px;\">Product Code</th>\n<td style=\"width: 54.1884%; height: 23.1875px;\">2401-ZT110-11</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">&nbsp;</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">[QKMT813]</td>\n</tr>\n<tr style=\"height: 23.3906px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 23.3906px;\">Colour</th>\n<td style=\"width: 54.1884%; height: 23.3906px;\">Baby Blue</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Material</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">94% Cotton</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">&nbsp;</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">6% Spandex</td>\n</tr>\n</tbody>\n</table>', '<p>.</p>', '<ul>\n<li>Knitted Fabric</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-ZT110-11-F.avif', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/product.avif', 1, 1, '2024-01-24 02:32:31', NULL, '2024-01-24 02:32:31'),
(102, 'Men\'s Formal Shirt', 16, 4, 446, 1, 0, 0, 26, 'SLIM / REGULAR FIT', '<table class=\"pdp-accordion__table\" style=\"height: 67.9843px; width: 80.4376%;\">\n<tbody>\n<tr style=\"height: 23.1875px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 23.1875px;\">Product Code</th>\n<td style=\"width: 54.1884%; height: 23.1875px;\">2401-ZT110-03</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">&nbsp;</th>\n<td style=\"width: 54.1884%;\">[QKMT813]</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Colour</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">Teal</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Material</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">94% Cotton</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">&nbsp;</th>\n<td style=\"width: 54.1884%;\">6% Spandex</td>\n</tr>\n</tbody>\n</table>', '<p>.</p>', '<ul>\n<li>Knitted Fabric</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-ZT110-03-F.avif', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/product.avif', 1, 1, '2024-01-24 02:43:50', 1, '2024-02-13 06:20:57'),
(103, 'Men\'s Formal Shirt', 16, 4, 102, 1, 0, 0, 23, 'SLIM / REGULAR FIT', '<table class=\"pdp-accordion__table\" style=\"height: 67.9843px; width: 80.4376%;\">\n<tbody>\n<tr style=\"height: 23.1875px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 23.1875px;\">Product Code</th>\n<td style=\"width: 54.1884%; height: 23.1875px;\">2401-ZT110-01</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">&nbsp;</th>\n<td style=\"width: 54.1884%;\">[QKMT813]</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Colour</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">white</td>\n</tr>\n<tr style=\"height: 22.3984px;\">\n<th style=\"width: 45.8517%; text-align: justify; height: 22.3984px;\">Material</th>\n<td style=\"width: 54.1884%; height: 22.3984px;\">94% Cotton</td>\n</tr>\n<tr>\n<th style=\"width: 45.8517%; text-align: justify;\">&nbsp;</th>\n<td style=\"width: 54.1884%;\">6% Spandex</td>\n</tr>\n</tbody>\n</table>', '<p>.</p>', '<ul>\n<li>Knitted Fabric</li>\n</ul>', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-ZT110-01-F.avif', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/product.avif', 1, 1, '2024-01-24 02:47:45', 1, '2024-02-16 07:47:50'),
(115, 'test product', 16, 4, 111, 1, 0, 0, 27, 'currency', '<p>currency</p>', '<p>currency</p>', '<p>currency</p>', '', '', 403, 1, '2024-02-12 08:49:39', 1, '2024-02-13 06:18:50');

-- --------------------------------------------------------

--
-- Table structure for table `product_assigned_attributes`
--

CREATE TABLE `product_assigned_attributes` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_assigned_attributes`
--

INSERT INTO `product_assigned_attributes` (`id`, `product_id`, `attribute_id`, `qty`) VALUES
(33, 74, 7, 5),
(34, 74, 6, 5),
(35, 74, 5, 5),
(36, 74, 4, 5),
(52, 72, 7, 12),
(61, 115, 7, 74),
(62, 102, 7, 112),
(67, 103, 7, 714);

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `sub_category` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_attributes`
--

INSERT INTO `product_attributes` (`id`, `name`, `sub_category`, `status`) VALUES
(4, '46', 4, 1),
(5, '48', 4, 1),
(6, '47', 4, 1),
(7, '46', 4, 1),
(12, 'S', 10, 1),
(13, 'M', 10, 1),
(14, 'L', 10, 1),
(15, 'XL', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT 0,
  `added_by` int(11) NOT NULL DEFAULT 0,
  `added_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`id`, `name`, `status`, `added_by`, `added_time`, `updated_by`, `updated_time`) VALUES
(16, 'Gents Wear', 1, 1, '2023-12-22 04:32:35', 1, '2024-01-14 15:17:50'),
(17, 'Ladies Wear', 1, 1, '2023-12-23 08:34:30', 1, '2024-01-14 15:18:06');

-- --------------------------------------------------------

--
-- Table structure for table `product_color`
--

CREATE TABLE `product_color` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `code` varchar(50) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT 0,
  `added_by` int(11) DEFAULT 0,
  `added_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_time` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_color`
--

INSERT INTO `product_color` (`id`, `name`, `code`, `status`, `added_by`, `added_time`, `updated_by`, `updated_time`) VALUES
(22, 'Black', '#000000', 1, 1, '2023-12-22 04:29:37', NULL, '2023-12-22 04:29:37'),
(23, 'White', '#EDEDED', 1, 1, '2023-12-22 04:31:33', NULL, '2023-12-22 04:31:33'),
(24, 'Blue', '#1F3487', 1, 1, '2023-12-22 04:31:59', NULL, '2023-12-22 04:31:59'),
(25, 'Beige', '#fbe7c5', 1, 1, '2024-01-02 11:03:09', NULL, '2024-01-02 11:03:09'),
(26, 'Green', '#1e2e29', 1, 1, '2024-01-02 11:07:27', NULL, '2024-01-02 11:07:27'),
(27, 'Brown', '#964B00', 1, 1, '2024-01-14 15:32:18', NULL, '2024-01-14 15:32:18'),
(28, 'Wine Red', '#7B0323', 1, 1, '2024-01-14 15:33:15', NULL, '2024-01-14 15:33:15'),
(29, 'Purple', '#800080', 1, 1, '2024-01-23 16:25:57', NULL, '2024-01-23 16:25:57');

-- --------------------------------------------------------

--
-- Table structure for table `product_image`
--

CREATE TABLE `product_image` (
  `id` int(11) NOT NULL,
  `image_url` varchar(500) NOT NULL DEFAULT '',
  `product_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_image`
--

INSERT INTO `product_image` (`id`, `image_url`, `product_id`) VALUES
(9, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/image_1703219903320.avif', 26),
(10, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/image_1703219903774.avif', 26),
(11, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/image_1703219904038.avif', 26),
(12, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/image_1703219903969.avif', 26),
(13, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/image_1703221469906.avif', 27),
(14, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/image_1703221470133.avif', 27),
(15, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/image_1703221470275.avif', 27),
(16, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/image_1703221470300.avif', 27),
(75, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d1-2-F.avif', 36),
(76, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d1-3.avif', 36),
(77, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d1-1.avif', 36),
(78, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d1-5.avif', 36),
(79, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d1-4.avif', 36),
(80, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d2-3.avif', 37),
(81, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d2-2-F.avif', 37),
(82, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d2-5.avif', 37),
(83, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d2-4.avif', 37),
(84, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d2-1.avif', 37),
(85, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d3-3.avif', 38),
(86, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d3-2.avif', 38),
(87, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d3-5.avif', 38),
(88, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d3-1.avif', 38),
(89, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d3-4-F.avif', 38),
(90, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d4-5.avif', 39),
(91, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d4-1.avif', 39),
(92, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d4-2.avif', 39),
(93, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d4-3F.avif', 39),
(94, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d4-4.avif', 39),
(95, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d5-4.avif', 40),
(96, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d5-2.avif', 40),
(97, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d5-3-F.avif', 40),
(98, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d5-1.avif', 40),
(99, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d6F-2-F.avif', 41),
(100, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d6F-3.avif', 41),
(101, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d6F-5.avif', 41),
(102, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d6F-1.avif', 41),
(103, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d6F-4.avif', 41),
(104, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d7-3.avif', 42),
(105, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d7-5.avif', 42),
(106, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d7-2-F.avif', 42),
(107, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d7-1.avif', 42),
(108, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d7-4.avif', 42),
(123, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms2413-4-F.avif', 48),
(124, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms2413-2.avif', 48),
(125, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms2413-3.avif', 48),
(126, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms2413-5.avif', 48),
(127, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms2413-1.avif', 48),
(128, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d14-2-F.avif', 49),
(129, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d14-5.avif', 49),
(130, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d14-1.avif', 49),
(131, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d14-3.avif', 49),
(149, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d12-2-F.avif', 54),
(150, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d12-3.avif', 54),
(151, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d12-4.avif', 54),
(152, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d12-5.avif', 54),
(153, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d12-1.avif', 54),
(154, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d11-2-F.avif', 46),
(155, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d11-4.avif', 46),
(156, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d11-3.avif', 46),
(157, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d11-1.avif', 46),
(158, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d10-3.avif', 45),
(159, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d10-5.avif', 45),
(160, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d10-4.avif', 45),
(161, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d10-1.avif', 45),
(162, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d10-2-F.avif', 45),
(163, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d8-2-F.avif', 43),
(164, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d8-3.avif', 43),
(165, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d8-6.avif', 43),
(166, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d8-5.avif', 43),
(167, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d8-4.avif', 43),
(168, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d8-1.avif', 43),
(170, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d9-5.avif', 55),
(171, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d9-2-F.avif', 55),
(172, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d9-4.avif', 55),
(173, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d9-3.avif', 55),
(174, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/ms24d9-1.avif', 55),
(176, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKLB0019-BK2.avif', 58),
(177, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKLB0019-BK3.avif', 58),
(178, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKLB0019-BK1-F.avif', 58),
(180, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKLBTP0018-BR3.avif', 59),
(181, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKLBTP0018-BR1-F.avif', 59),
(182, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKLBTP0018-DBR2.avif', 65),
(183, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKLBTP0018-DBR3.avif', 65),
(184, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKLBTP0018-DBR1-F.avif', 65),
(185, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHB716-BKL1.avif', 66),
(186, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHB716-BKL4.avif', 66),
(187, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHB716-BKL3.avif', 66),
(188, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHB716-BKL2-F.avif', 66),
(189, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHB717-WRB1.avif', 67),
(190, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHB717-WRB2-F.avif', 67),
(191, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHB717-WRB5.avif', 67),
(192, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHB717-WRB3.avif', 67),
(193, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHB717-WRB4.avif', 67),
(194, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHK66-LBRL2-F.avif', 68),
(195, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHK66-LBRL4.avif', 68),
(196, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHK66-LBRL1.avif', 68),
(197, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHK66-LBRL3.avif', 68),
(198, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHK66-BKL2-F.avif', 69),
(199, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHK66-BKL3.avif', 69),
(200, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHK66-BKL4.avif', 69),
(206, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHK66-WRL2-F.avif', 70),
(207, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHK66-WRL1.avif', 70),
(208, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHK66-WRL5.avif', 70),
(209, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHK66-WRL3.avif', 70),
(210, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHK66-WRL4.avif', 70),
(211, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHB716-BRL1.avif', 71),
(212, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHB716-BRL3.avif', 71),
(213, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHB716-BRL4.avif', 71),
(214, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHB716-BRL2-F.avif', 71),
(215, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHB717-BRB1.avif', 72),
(216, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHB717-BRB5.avif', 72),
(217, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHB717-BRB2-F.avif', 72),
(218, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHB717-BRB3.avif', 72),
(219, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHB717-BRB4.avif', 72),
(220, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHB716-WRL1.avif', 73),
(221, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHB716-WRL4.avif', 73),
(222, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHB716-WRL3.avif', 73),
(223, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHB716-WRL2-F.avif', 73),
(224, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHB717-BKB1.avif', 74),
(225, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHB717-BKB2-F.avif', 74),
(226, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHB717-BKB3.avif', 74),
(227, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHB717-BKB4.avif', 74),
(228, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKSHB717-BKB5.avif', 74),
(232, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKLBTP0018-BR1.avif', 76),
(233, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/QKLBTP0018-BR2.avif', 76),
(245, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-ZT70-06-2.avif', 88),
(246, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-ZT70-06-1.avif', 88),
(253, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-SG-05-2.avif', 90),
(254, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-SG-05-1.avif', 90),
(255, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-SG-02-2.avif', 91),
(256, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-SG-02-1.avif', 91),
(257, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-3F-05-2.avif', 92),
(258, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-3F-05-1.avif', 92),
(259, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-SG-03-1.avif', 93),
(260, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-SG-03-2.avif', 93),
(261, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-3F-01-1.avif', 94),
(262, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-ZT110-02-2.avif', 95),
(263, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-ZT110-02-1.avif', 95),
(264, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-ZT70-07-2.avif', 96),
(265, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-ZT70-07-1.avif', 96),
(266, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-ZT110-08-2.avif', 98),
(267, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-ZT110-08-1.avif', 98),
(268, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-ZT110-05-2.avif', 99),
(269, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-ZT110-05-1.avif', 99),
(270, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-MT-708-1.avif', 100),
(271, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-ZT110-11-2.avif', 101),
(272, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-ZT110-11-1.avif', 101),
(273, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-ZT110-03-2.avif', 102),
(274, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-ZT110-03-1.avif', 102),
(275, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/2401-ZT110-01-1.avif', 103);

-- --------------------------------------------------------

--
-- Table structure for table `product_related_sub_category`
--

CREATE TABLE `product_related_sub_category` (
  `id` int(11) NOT NULL,
  `sub_category_id` int(11) NOT NULL,
  `related_sub_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_related_sub_category`
--

INSERT INTO `product_related_sub_category` (`id`, `sub_category_id`, `related_sub_category`) VALUES
(11, 11, 5),
(12, 11, 4),
(13, 11, 2),
(17, 3, 4),
(18, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `product_status`
--

CREATE TABLE `product_status` (
  `id` int(11) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_status`
--

INSERT INTO `product_status` (`id`, `status`) VALUES
(1, 'active'),
(2, 'deactive'),
(403, 'Deleted');

-- --------------------------------------------------------

--
-- Table structure for table `product_sub_category`
--

CREATE TABLE `product_sub_category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `img_url` varchar(500) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `added_by` int(11) DEFAULT NULL,
  `added_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_sub_category`
--

INSERT INTO `product_sub_category` (`id`, `name`, `img_url`, `category`, `status`, `added_by`, `added_time`, `updated_by`, `updated_time`) VALUES
(2, 'Arya Sinhala', 'sample url', 16, 1, 1, '2024-01-14 15:21:38', NULL, '2024-01-14 15:21:38'),
(3, 'Suit', 'sample url', 16, 1, 1, '2024-01-14 15:21:54', 1, '2024-02-24 00:36:52'),
(4, 'Formal Shoes', 'sample url', 16, 1, 1, '2024-01-14 15:28:14', 1, '2024-01-18 14:16:49'),
(5, 'Leather Bag', 'sample url', 16, 1, 1, '2024-01-14 16:41:17', NULL, '2024-01-14 16:41:17'),
(6, 'Umbrella', 'sample url', 17, 1, 1, '2024-01-15 09:34:45', 1, '2024-01-18 14:50:43'),
(8, 'Shirts', 'sample url', 16, 1, 1, '2024-01-19 17:51:09', 1, '2024-01-23 13:03:03'),
(10, 'TEST', 'sample url', 16, 403, 1, '2024-01-22 05:37:02', 1, '2024-01-22 05:38:18'),
(11, 'test', 'sample url', 16, 1, 1, '2024-02-12 06:37:28', 1, '2024-02-24 00:13:32');

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `dollar_rate` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `dollar_rate`) VALUES
(1, 100);

-- --------------------------------------------------------

--
-- Table structure for table `site_content_brand_video`
--

CREATE TABLE `site_content_brand_video` (
  `id` int(11) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `image_url` varchar(1000) NOT NULL DEFAULT '',
  `view_link` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `site_content_brand_video`
--

INSERT INTO `site_content_brand_video` (`id`, `description`, `image_url`, `view_link`) VALUES
(1, '\"Queen Kuweni\" is a premier ladies and gents clothing brand, combining timeless elegance with modern style. From regal formal wear to casual chic, our collections embody sophistication and cultural richness.', 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/Home-banner.jpg-Thu%20Jan%2025%202024%2016%3A27%3A26%20GMT%2B0000%20%28Coordinated%20Universal%20Time%29-.jpg', 'https://player.vimeo.com/video/906422976?h=6c319ff009&autoplay=1&title=0&byline=0&portrait=0');

-- --------------------------------------------------------

--
-- Table structure for table `site_content_live_show`
--

CREATE TABLE `site_content_live_show` (
  `id` int(11) NOT NULL,
  `image_url` varchar(1000) NOT NULL DEFAULT '',
  `live_url` varchar(1000) NOT NULL,
  `event_name` varchar(1000) NOT NULL,
  `starting_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `site_content_live_show`
--

INSERT INTO `site_content_live_show` (`id`, `image_url`, `live_url`, `event_name`, `starting_at`) VALUES
(1, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/live-fashion-banner.jpg', 'https://www.youtube.com/embed/aNfmz_GH8yA?si=9La86fHVNFmuBN-G;', 'QK FASHION SHOW 2024', '...');

-- --------------------------------------------------------

--
-- Table structure for table `site_content_new_arrivals_product`
--

CREATE TABLE `site_content_new_arrivals_product` (
  `id` int(11) NOT NULL,
  `image_url` varchar(1000) NOT NULL DEFAULT '',
  `path` varchar(1000) NOT NULL DEFAULT '',
  `title` varchar(1000) NOT NULL DEFAULT '',
  `section` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `site_content_new_arrivals_product`
--

INSERT INTO `site_content_new_arrivals_product` (`id`, `image_url`, `path`, `title`, `section`) VALUES
(1, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/home-ms24d6-1.jpg', '/new-arrivals', 'Royal Blue Mohair Blend', 2),
(2, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/home-ms2413-1.jpg', '/new-arrivals', 'White Rhinestone Ivory', 2),
(3, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/home-ms24d9-1.jpg', '/new-arrivals', 'White Ivory Baroque', 4),
(4, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/home-ms24d12-1.jpg', '/new-arrivals', 'Mohair Royal Deep Blue', 4);

-- --------------------------------------------------------

--
-- Table structure for table `site_content_slider`
--

CREATE TABLE `site_content_slider` (
  `id` int(11) NOT NULL,
  `image_url` varchar(1000) NOT NULL DEFAULT '',
  `alt` varchar(400) NOT NULL DEFAULT '',
  `title` varchar(400) NOT NULL DEFAULT '',
  `description` varchar(6000) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `site_content_slider`
--

INSERT INTO `site_content_slider` (`id`, `image_url`, `alt`, `title`, `description`) VALUES
(4, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/3A7A1741-1.avif-1706235507224-.avif', '', '', ''),
(6, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/3A7A1742-1.avif-1706236360817-.avif', '', '', ''),
(7, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/3A7A1743-1.avif-Thu%20Jan%2025%202024%2017%3A14%3A46%20GMT%2B0000%20%28Coordinated%20Universal%20Time%29-.avif', '', '', ''),
(10, 'https://nbc-storage.s3.ap-southeast-1.amazonaws.com/images/3A7A1744_1.avif-1706234830372-.avif', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_category`
--

CREATE TABLE `ticket_category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `color` varchar(100) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT 0,
  `added_by` int(11) NOT NULL DEFAULT 0,
  `added_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_by` int(11) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticket_category`
--

INSERT INTO `ticket_category` (`id`, `name`, `color`, `status`, `added_by`, `added_time`, `update_by`, `update_time`) VALUES
(28, 'Gold', '#E3B13E', 1, 1, '2023-12-22 04:22:03', NULL, '2023-12-22 04:22:03'),
(29, 'Platinum', '#80B2CC', 1, 1, '2023-12-22 04:22:19', NULL, '2023-12-22 04:22:19'),
(30, 'Diamond', '#FEF4F8', 1, 1, '2023-12-22 04:22:40', NULL, '2023-12-22 04:22:40'),
(31, 'Diamond Plus', '#D8D8D8', 403, 1, '2023-12-22 04:22:55', NULL, '2023-12-22 04:22:55');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_category_status`
--

CREATE TABLE `ticket_category_status` (
  `id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticket_category_status`
--

INSERT INTO `ticket_category_status` (`id`, `status`) VALUES
(1, 'active'),
(2, 'deactive'),
(403, 'Deleted');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL DEFAULT '',
  `first_name` varchar(100) NOT NULL DEFAULT '',
  `last_name` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(320) NOT NULL DEFAULT '',
  `temp_key` varchar(100) NOT NULL DEFAULT '',
  `company` varchar(500) NOT NULL DEFAULT '',
  `address` varchar(500) NOT NULL DEFAULT '',
  `mobile_code` varchar(4) NOT NULL DEFAULT '+94',
  `mobile` varchar(15) NOT NULL DEFAULT '',
  `mobile_verify` int(11) NOT NULL DEFAULT 0,
  `password` varchar(200) NOT NULL DEFAULT '',
  `image_url` varchar(1000) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT 0,
  `role` int(11) NOT NULL DEFAULT 0,
  `added_by` int(11) DEFAULT NULL,
  `added_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `user_name`, `first_name`, `last_name`, `email`, `temp_key`, `company`, `address`, `mobile_code`, `mobile`, `mobile_verify`, `password`, `image_url`, `status`, `role`, `added_by`, `added_time`, `updated_by`, `updated_time`) VALUES
(1, 'admin', '', '', 'admin@example.com', '', '', '', '+94', '0719850755', 0, '$2a$10$ceeb2bcf773c7cd2c40b1ulv6jbu5AU7f7EiSkKpqwiOtjj0yuxF.', '', 1, 1, 1, '2023-12-08 03:21:36', 1, '2023-12-08 03:21:36'),
(3, 'Supplier', '', '', 'supplier@example.com', '', '', '', '+94', '0719850755', 0, '$2a$10$ceeb2bcf773c7cd2c40b1uatuB3DuIyFpA3PTe2Dl/uTqWwmP5Pti', '', 1, 2, 1, '2023-12-08 03:21:36', 1, '2023-12-08 03:21:36'),
(9, '', 'anoj', 'dinuranga', 'ad2001dinuranga@gmail.com', '', '', 'test address', '94', '788100728', 689599, '$2a$10$ceeb2bcf773c7cd2c40b1ulv6jbu5AU7f7EiSkKpqwiOtjj0yuxF.', '', 1, 3, NULL, '2024-01-22 13:13:26', NULL, '2024-01-22 13:13:26'),
(10, '', 'Ruchira', 'Lakmal', 'ruchira@ion-groups.com', '', '', '1234', '94', '772677237', 670082, '$2a$10$ceeb2bcf773c7cd2c40b1uzLX05b1gWfkNRVu8Cwzx8cAYhWsyniK', '', 1, 3, NULL, '2024-02-02 08:50:28', NULL, '2024-02-02 08:50:28'),
(11, '', 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '', 'test', '237, Adawelayaya', '94', '76035878', 269147, '$2a$10$ceeb2bcf773c7cd2c40b1uVUqPSF4axAIqiB4R/ycmW/ZvzOy6QPi', '', 1, 3, NULL, '2024-02-12 06:57:02', NULL, '2024-02-12 06:57:02'),
(12, '', 'venuri', 'wijekoon', 'ven@gmail.com', '', 'vbv', 'ghg-gg', '94', '714300890', 882991, '$2a$10$ceeb2bcf773c7cd2c40b1uqAPa3gj833OqEfskfVeZ0rTMo5a2ke2', '', 3, 3, NULL, '2024-02-13 07:33:48', NULL, '2024-02-13 07:33:48'),
(18, '', 'Kavindu', 'Nimesh', 'knimesh.work@gmail.com', '', 'test', '237, Adawelayaya', '94', '714550538', 781022, '$2a$10$ceeb2bcf773c7cd2c40b1u7LmGrFvNlHrn7jIa3zg0oFMW5xZ9Fd2', '', 1, 3, NULL, '2024-02-13 12:21:32', NULL, '2024-02-13 12:21:32'),
(23, '', 'Induwara', 'Wickramasinghe', '0763524195i@gmail.com', '4aded4a0-c5a0-48b8-9b62-8ee53c19e0b5', 'ION Groups', '190/53 E , Weera Gardens\nDepanama', '94', '763524195', 543868, '$2a$10$ceeb2bcf773c7cd2c40b1uE4Ex06SW2E9511sWufL1n6aloky9eU2', '', 1, 3, NULL, '2024-02-13 14:13:32', NULL, '2024-02-13 14:13:32'),
(24, '', 'example text', 'example text', 'sample@example.com', '', '', 'retr', '+94', 'example text', 0, '$2a$10$ceeb2bcf773c7cd2c40b1ulv6jbu5AU7f7EiSkKpqwiOtjj0yuxF.', '', 1, 4, 1, '2024-03-02 23:32:20', 1, '2024-03-27 20:42:34'),
(26, '', 'hio hhi', '', 'hhhi34723@gmail.com', '', '', '', '+94', '', 0, '', '', 1, 3, NULL, '2024-03-04 10:15:44', NULL, '2024-03-04 15:45:44'),
(27, '', 'Kavindu', 'Nimesh', 'kani.kntech@gmail.com', '', 'Similater', 'kani.kntech@gmail.com', '94', '760358784', 334957, '$2a$10$ceeb2bcf773c7cd2c40b1uIvt2ycVDo7gWEBL58MfyRKsPGxTkUIC', '', 1, 3, NULL, '2024-03-07 00:30:56', NULL, '2024-03-07 06:00:56'),
(28, '', 'Ruchira', 'Lakmal', 'ruchira@ion-groups.com', '', 'I O N Groups Pvt Ltd', '24 2/1 P B Alwis Perera Mawatha', '94', '713656552', 158894, '$2a$10$ceeb2bcf773c7cd2c40b1ulv6jbu5AU7f7EiSkKpqwiOtjj0yuxF.', '', 3, 3, NULL, '2024-06-02 22:32:14', NULL, '2024-06-03 04:02:14');

-- --------------------------------------------------------

--
-- Table structure for table `user_auth`
--

CREATE TABLE `user_auth` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key_name` varchar(200) NOT NULL,
  `access` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_auth`
--

INSERT INTO `user_auth` (`id`, `user_id`, `key_name`, `access`) VALUES
(164, 24, 'holiday_management', 1),
(165, 24, 'paid_order_management', 1),
(166, 24, 'product_management', 1),
(167, 24, 'canceled_order_management', 1),
(168, 24, 'delivered_order_management', 1),
(169, 24, 'user_management', 1),
(170, 24, 'notification_center', 1),
(171, 24, 'processing_order_management', 1),
(172, 24, 'seat_attendance_management', 1),
(173, 24, 'pending_order_management', 1),
(174, 24, 'product_color_management', 1),
(175, 24, 'product_category_management', 1),
(176, 24, 'sub_category_management', 1),
(177, 24, 'newsletters_list_access', 1),
(178, 24, 'contact_us_list_access', 1),
(179, 24, 'fabrics_management', 1),
(180, 24, 'home_content_management', 1),
(181, 24, 'site_Settings_access', 1),
(182, 24, 'invoice', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'admin'),
(2, 'user'),
(3, 'client'),
(4, 'Moderator');

-- --------------------------------------------------------

--
-- Table structure for table `user_status`
--

CREATE TABLE `user_status` (
  `id` int(11) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_status`
--

INSERT INTO `user_status` (`id`, `status`) VALUES
(1, 'active'),
(2, 'deactive'),
(3, 'pendding');

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

CREATE TABLE `voucher` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `event_ticket_category` int(11) NOT NULL,
  `seat_count` int(11) NOT NULL DEFAULT 0,
  `amount` double NOT NULL DEFAULT 0,
  `extra_details` varchar(8000) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT 1,
  `added_by` int(11) NOT NULL,
  `added_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `voucher`
--

INSERT INTO `voucher` (`id`, `event_id`, `event_ticket_category`, `seat_count`, `amount`, `extra_details`, `status`, `added_by`, `added_time`, `updated_by`, `updated_time`) VALUES
(9, 10, 18, 2, 100000, '-, -', 1, 1, '2023-12-27 09:32:55', 1, '2024-01-26 04:45:00'),
(10, 10, 19, 2, 50000, '-, -', 1, 1, '2023-12-27 09:33:20', 1, '2024-01-26 04:44:31'),
(11, 10, 20, 2, 25000, '-, -', 1, 1, '2023-12-27 09:33:46', 1, '2024-01-26 04:44:10');

-- --------------------------------------------------------

--
-- Table structure for table `voucher_category`
--

CREATE TABLE `voucher_category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `color` varchar(20) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT 1,
  `added_by` int(11) DEFAULT NULL,
  `added_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `voucher_category`
--

INSERT INTO `voucher_category` (`id`, `name`, `color`, `status`, `added_by`, `added_time`, `updated_by`, `updated_time`) VALUES
(1, 'example text', 'example', 1, 1, '2024-04-04 03:53:09', 1, '2024-04-04 03:53:17');

-- --------------------------------------------------------

--
-- Table structure for table `voucher_category_status`
--

CREATE TABLE `voucher_category_status` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `voucher_category_status`
--

INSERT INTO `voucher_category_status` (`id`, `name`) VALUES
(1, 'Active'),
(2, 'Disabled');

-- --------------------------------------------------------

--
-- Table structure for table `voucher_status`
--

CREATE TABLE `voucher_status` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `voucher_status`
--

INSERT INTO `voucher_status` (`id`, `name`) VALUES
(1, 'active'),
(2, 'inactive'),
(403, 'deleted');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `amex_test`
--
ALTER TABLE `amex_test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointment_booking`
--
ALTER TABLE `appointment_booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointment_booking_status` (`status`);

--
-- Indexes for table `appointment_booking_status`
--
ALTER TABLE `appointment_booking_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bank_added_by` (`added_by`),
  ADD KEY `bank_updated_by` (`updated_by`);

--
-- Indexes for table `booking_request`
--
ALTER TABLE `booking_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_request_added_by` (`added_by`),
  ADD KEY `booking_request_status` (`status`),
  ADD KEY `booking_request_event` (`event`),
  ADD KEY `booking_request_voucher_id` (`voucher_id`);

--
-- Indexes for table `booking_request_status`
--
ALTER TABLE `booking_request_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `card_discount`
--
ALTER TABLE `card_discount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_product_type`
--
ALTER TABLE `custom_product_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_added_by` (`added_by`),
  ADD KEY `event_updated_by` (`updated_by`),
  ADD KEY `event_status` (`status`);

--
-- Indexes for table `event_status`
--
ALTER TABLE `event_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_ticket_category`
--
ALTER TABLE `event_ticket_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_ticket_category_added_by` (`added_by`),
  ADD KEY `event_ticket_category_updated_by` (`updated_by`),
  ADD KEY `event_ticket_category_event` (`event`),
  ADD KEY `event_ticket_category_ticket_category` (`ticket_category`),
  ADD KEY `event_ticket_category_status` (`status`);

--
-- Indexes for table `event_ticket_category_seat`
--
ALTER TABLE `event_ticket_category_seat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_ticket_category_seat_added_by` (`added_by`),
  ADD KEY `event_ticket_category_seat_updated_by` (`updated_by`),
  ADD KEY `event_ticket_category_seat_event_ticket_category_table` (`event_ticket_category_table`),
  ADD KEY `event_ticket_category_seat_status` (`status`);

--
-- Indexes for table `event_ticket_category_table`
--
ALTER TABLE `event_ticket_category_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vent_ticket_category_table_added_by` (`added_by`),
  ADD KEY `vent_ticket_category_table_updated_by` (`updated_by`),
  ADD KEY `vent_ticket_category_table_event_ticket_category` (`event_ticket_category`),
  ADD KEY `vent_ticket_category_table_status` (`status`);

--
-- Indexes for table `fabric`
--
ALTER TABLE `fabric`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fabric_added_by` (`added_by`),
  ADD KEY `fabric_updated_by` (`updated_by`);

--
-- Indexes for table `gift_voucher`
--
ALTER TABLE `gift_voucher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gift_voucher_status` (`status`),
  ADD KEY `gift_voucher_added_by` (`added_by`),
  ADD KEY `gift_voucher_updated_by` (`updated_by`),
  ADD KEY `gift_voucher_category` (`category`);

--
-- Indexes for table `gift_voucher_booking`
--
ALTER TABLE `gift_voucher_booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gift_voucher_booking_status` (`status`),
  ADD KEY `gift_voucher_booking_added_by` (`added_by`);

--
-- Indexes for table `gift_voucher_booking_items`
--
ALTER TABLE `gift_voucher_booking_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gift_voucher_booking_items_booking_id` (`gift_voucher_booking_id`),
  ADD KEY `gift_voucher_booking_items_voucher_id` (`gift_voucher_id`);

--
-- Indexes for table `gift_voucher_booking_status`
--
ALTER TABLE `gift_voucher_booking_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gift_voucher_status`
--
ALTER TABLE `gift_voucher_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_bill`
--
ALTER TABLE `order_bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_bill_status` (`status`),
  ADD KEY `order_bill_added_by` (`added_by`);

--
-- Indexes for table `order_bill_custom`
--
ALTER TABLE `order_bill_custom`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_bill_custom_status` (`status`),
  ADD KEY `order_bill_custom_added_by` (`added_by`);

--
-- Indexes for table `order_bill_items`
--
ALTER TABLE `order_bill_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_bill_items_attribute` (`attribute_id`),
  ADD KEY `order_bill_items_product` (`product_id`),
  ADD KEY `order_bill_items_order_bill_id` (`order_bill_id`);

--
-- Indexes for table `order_bill_items_custom`
--
ALTER TABLE `order_bill_items_custom`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_bill_items_custom_order_bill_id` (`order_bill_id`),
  ADD KEY `order_bill_items_custom_product_type` (`product_type`);

--
-- Indexes for table `order_bill_items_custom_fabric`
--
ALTER TABLE `order_bill_items_custom_fabric`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_bill_items_custom_fabric_item_id` (`order_bill_item_id`),
  ADD KEY `order_bill_items_custom_fabric_id` (`fabric_id`);

--
-- Indexes for table `order_custom_status`
--
ALTER TABLE `order_custom_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_added_by` (`added_by`),
  ADD KEY `product_updated_by` (`updated_by`),
  ADD KEY `product_category` (`category`),
  ADD KEY `product_color` (`color`),
  ADD KEY `product_status` (`status`),
  ADD KEY `product_sub_category` (`sub_category`);

--
-- Indexes for table `product_assigned_attributes`
--
ALTER TABLE `product_assigned_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_assigned_attributes_product_id` (`product_id`),
  ADD KEY `product_assigned_attributes_attribute_id` (`attribute_id`);

--
-- Indexes for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_attributes_sub_category` (`sub_category`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `products_category_added_by` (`added_by`),
  ADD KEY `products_category_updated_by` (`updated_by`),
  ADD KEY `products_category_status` (`status`);

--
-- Indexes for table `product_color`
--
ALTER TABLE `product_color`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `products_color_added_by` (`added_by`),
  ADD KEY `products_color_updated_by` (`updated_by`),
  ADD KEY `products_color_status` (`status`);

--
-- Indexes for table `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_image_product_id` (`product_id`);

--
-- Indexes for table `product_related_sub_category`
--
ALTER TABLE `product_related_sub_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_related_sub_category_main` (`sub_category_id`),
  ADD KEY `product_related_sub_category_related` (`related_sub_category`);

--
-- Indexes for table `product_status`
--
ALTER TABLE `product_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_sub_category`
--
ALTER TABLE `product_sub_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Structureproduct_sub_category_added_by` (`added_by`),
  ADD KEY `Structureproduct_sub_category_updated_by` (`updated_by`),
  ADD KEY `Structureproduct_sub_category_category` (`category`),
  ADD KEY `Structureproduct_sub_category_status` (`status`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_content_brand_video`
--
ALTER TABLE `site_content_brand_video`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_content_live_show`
--
ALTER TABLE `site_content_live_show`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_content_new_arrivals_product`
--
ALTER TABLE `site_content_new_arrivals_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_content_slider`
--
ALTER TABLE `site_content_slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_category`
--
ALTER TABLE `ticket_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `ticket_category_added_by` (`added_by`),
  ADD KEY `ticket_category_updated_by` (`update_by`),
  ADD KEY `ticket_category_status_status` (`status`);

--
-- Indexes for table `ticket_category_status`
--
ALTER TABLE `ticket_category_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_user_role` (`role`),
  ADD KEY `user_user_status` (`status`),
  ADD KEY `user_added_by` (`added_by`),
  ADD KEY `user_updated_by` (`updated_by`);

--
-- Indexes for table `user_auth`
--
ALTER TABLE `user_auth`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_auth_user_id` (`user_id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_status`
--
ALTER TABLE `user_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `voucher_event_id` (`event_id`),
  ADD KEY `voucher_event_category_id` (`event_ticket_category`),
  ADD KEY `voucher_added_by` (`added_by`),
  ADD KEY `voucher_updated_by` (`updated_by`),
  ADD KEY `voucher_status` (`status`);

--
-- Indexes for table `voucher_category`
--
ALTER TABLE `voucher_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `voucher_category_added_by` (`added_by`),
  ADD KEY `voucher_category_updated_by` (`updated_by`),
  ADD KEY `voucher_category_status` (`status`);

--
-- Indexes for table `voucher_category_status`
--
ALTER TABLE `voucher_category_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voucher_status`
--
ALTER TABLE `voucher_status`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `amex_test`
--
ALTER TABLE `amex_test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `appointment_booking`
--
ALTER TABLE `appointment_booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `appointment_booking_status`
--
ALTER TABLE `appointment_booking_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `booking_request`
--
ALTER TABLE `booking_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `booking_request_status`
--
ALTER TABLE `booking_request_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `card_discount`
--
ALTER TABLE `card_discount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `custom_product_type`
--
ALTER TABLE `custom_product_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `event_status`
--
ALTER TABLE `event_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=404;

--
-- AUTO_INCREMENT for table `event_ticket_category`
--
ALTER TABLE `event_ticket_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `event_ticket_category_seat`
--
ALTER TABLE `event_ticket_category_seat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=287;

--
-- AUTO_INCREMENT for table `event_ticket_category_table`
--
ALTER TABLE `event_ticket_category_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `fabric`
--
ALTER TABLE `fabric`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `gift_voucher`
--
ALTER TABLE `gift_voucher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gift_voucher_booking`
--
ALTER TABLE `gift_voucher_booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `gift_voucher_booking_items`
--
ALTER TABLE `gift_voucher_booking_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `gift_voucher_booking_status`
--
ALTER TABLE `gift_voucher_booking_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `gift_voucher_status`
--
ALTER TABLE `gift_voucher_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order_bill`
--
ALTER TABLE `order_bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `order_bill_custom`
--
ALTER TABLE `order_bill_custom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_bill_items`
--
ALTER TABLE `order_bill_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `order_bill_items_custom`
--
ALTER TABLE `order_bill_items_custom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `order_bill_items_custom_fabric`
--
ALTER TABLE `order_bill_items_custom_fabric`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_custom_status`
--
ALTER TABLE `order_custom_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `product_assigned_attributes`
--
ALTER TABLE `product_assigned_attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `product_color`
--
ALTER TABLE `product_color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `product_image`
--
ALTER TABLE `product_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=310;

--
-- AUTO_INCREMENT for table `product_related_sub_category`
--
ALTER TABLE `product_related_sub_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `product_status`
--
ALTER TABLE `product_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=404;

--
-- AUTO_INCREMENT for table `product_sub_category`
--
ALTER TABLE `product_sub_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `site_content_brand_video`
--
ALTER TABLE `site_content_brand_video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `site_content_live_show`
--
ALTER TABLE `site_content_live_show`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `site_content_new_arrivals_product`
--
ALTER TABLE `site_content_new_arrivals_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `site_content_slider`
--
ALTER TABLE `site_content_slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ticket_category`
--
ALTER TABLE `ticket_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `ticket_category_status`
--
ALTER TABLE `ticket_category_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=404;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `user_auth`
--
ALTER TABLE `user_auth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_status`
--
ALTER TABLE `user_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `voucher`
--
ALTER TABLE `voucher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `voucher_category`
--
ALTER TABLE `voucher_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `voucher_category_status`
--
ALTER TABLE `voucher_category_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `voucher_status`
--
ALTER TABLE `voucher_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=404;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment_booking`
--
ALTER TABLE `appointment_booking`
  ADD CONSTRAINT `appointment_booking_status` FOREIGN KEY (`status`) REFERENCES `appointment_booking_status` (`id`);

--
-- Constraints for table `bank`
--
ALTER TABLE `bank`
  ADD CONSTRAINT `bank_added_by` FOREIGN KEY (`added_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `bank_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `booking_request`
--
ALTER TABLE `booking_request`
  ADD CONSTRAINT `booking_request_added_by` FOREIGN KEY (`added_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `booking_request_event` FOREIGN KEY (`event`) REFERENCES `event` (`id`),
  ADD CONSTRAINT `booking_request_status` FOREIGN KEY (`status`) REFERENCES `booking_request_status` (`id`),
  ADD CONSTRAINT `booking_request_voucher_id` FOREIGN KEY (`voucher_id`) REFERENCES `voucher` (`id`);

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_added_by` FOREIGN KEY (`added_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `event_status` FOREIGN KEY (`status`) REFERENCES `event_status` (`id`),
  ADD CONSTRAINT `event_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `event_ticket_category`
--
ALTER TABLE `event_ticket_category`
  ADD CONSTRAINT `event_ticket_category_added_by` FOREIGN KEY (`added_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `event_ticket_category_event` FOREIGN KEY (`event`) REFERENCES `event` (`id`),
  ADD CONSTRAINT `event_ticket_category_status` FOREIGN KEY (`status`) REFERENCES `event_status` (`id`),
  ADD CONSTRAINT `event_ticket_category_ticket_category` FOREIGN KEY (`ticket_category`) REFERENCES `ticket_category` (`id`),
  ADD CONSTRAINT `event_ticket_category_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `event_ticket_category_seat`
--
ALTER TABLE `event_ticket_category_seat`
  ADD CONSTRAINT `event_ticket_category_seat_added_by` FOREIGN KEY (`added_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `event_ticket_category_seat_event_ticket_category_table` FOREIGN KEY (`event_ticket_category_table`) REFERENCES `event_ticket_category_table` (`id`),
  ADD CONSTRAINT `event_ticket_category_seat_status` FOREIGN KEY (`status`) REFERENCES `event_status` (`id`),
  ADD CONSTRAINT `event_ticket_category_seat_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `event_ticket_category_table`
--
ALTER TABLE `event_ticket_category_table`
  ADD CONSTRAINT `vent_ticket_category_table_added_by` FOREIGN KEY (`added_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `vent_ticket_category_table_event_ticket_category` FOREIGN KEY (`event_ticket_category`) REFERENCES `event_ticket_category` (`id`),
  ADD CONSTRAINT `vent_ticket_category_table_status` FOREIGN KEY (`status`) REFERENCES `event_status` (`id`),
  ADD CONSTRAINT `vent_ticket_category_table_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `fabric`
--
ALTER TABLE `fabric`
  ADD CONSTRAINT `fabric_added_by` FOREIGN KEY (`added_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `fabric_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `gift_voucher`
--
ALTER TABLE `gift_voucher`
  ADD CONSTRAINT `gift_voucher_added_by` FOREIGN KEY (`added_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `gift_voucher_category` FOREIGN KEY (`category`) REFERENCES `voucher_category` (`id`),
  ADD CONSTRAINT `gift_voucher_status` FOREIGN KEY (`status`) REFERENCES `gift_voucher` (`id`),
  ADD CONSTRAINT `gift_voucher_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `gift_voucher_booking`
--
ALTER TABLE `gift_voucher_booking`
  ADD CONSTRAINT `gift_voucher_booking_added_by` FOREIGN KEY (`added_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `gift_voucher_booking_status` FOREIGN KEY (`status`) REFERENCES `gift_voucher_booking_status` (`id`);

--
-- Constraints for table `gift_voucher_booking_items`
--
ALTER TABLE `gift_voucher_booking_items`
  ADD CONSTRAINT `gift_voucher_booking_items_booking_id` FOREIGN KEY (`gift_voucher_booking_id`) REFERENCES `gift_voucher_booking` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `gift_voucher_booking_items_voucher_id` FOREIGN KEY (`gift_voucher_id`) REFERENCES `gift_voucher` (`id`);

--
-- Constraints for table `order_bill`
--
ALTER TABLE `order_bill`
  ADD CONSTRAINT `order_bill_added_by` FOREIGN KEY (`added_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `order_bill_status` FOREIGN KEY (`status`) REFERENCES `order_status` (`id`);

--
-- Constraints for table `order_bill_custom`
--
ALTER TABLE `order_bill_custom`
  ADD CONSTRAINT `order_bill_custom_added_by` FOREIGN KEY (`added_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `order_bill_custom_status` FOREIGN KEY (`status`) REFERENCES `order_custom_status` (`id`);

--
-- Constraints for table `order_bill_items`
--
ALTER TABLE `order_bill_items`
  ADD CONSTRAINT `order_bill_items_attribute` FOREIGN KEY (`attribute_id`) REFERENCES `product_attributes` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `order_bill_items_order_bill_id` FOREIGN KEY (`order_bill_id`) REFERENCES `order_bill` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_bill_items_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `order_bill_items_custom`
--
ALTER TABLE `order_bill_items_custom`
  ADD CONSTRAINT `order_bill_items_custom_order_bill_id` FOREIGN KEY (`order_bill_id`) REFERENCES `order_bill_custom` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_bill_items_custom_product_type` FOREIGN KEY (`product_type`) REFERENCES `custom_product_type` (`id`);

--
-- Constraints for table `order_bill_items_custom_fabric`
--
ALTER TABLE `order_bill_items_custom_fabric`
  ADD CONSTRAINT `order_bill_items_custom_fabric_id` FOREIGN KEY (`fabric_id`) REFERENCES `fabric` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_bill_items_custom_fabric_item_id` FOREIGN KEY (`order_bill_item_id`) REFERENCES `order_bill_items_custom` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_added_by` FOREIGN KEY (`added_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `product_category` FOREIGN KEY (`category`) REFERENCES `product_category` (`id`),
  ADD CONSTRAINT `product_color` FOREIGN KEY (`color`) REFERENCES `product_color` (`id`),
  ADD CONSTRAINT `product_status` FOREIGN KEY (`status`) REFERENCES `product_status` (`id`),
  ADD CONSTRAINT `product_sub_category` FOREIGN KEY (`sub_category`) REFERENCES `product_sub_category` (`id`),
  ADD CONSTRAINT `product_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `product_assigned_attributes`
--
ALTER TABLE `product_assigned_attributes`
  ADD CONSTRAINT `product_assigned_attributes_attribute_id` FOREIGN KEY (`attribute_id`) REFERENCES `product_attributes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_assigned_attributes_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD CONSTRAINT `product_attributes_sub_category` FOREIGN KEY (`sub_category`) REFERENCES `product_sub_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_category`
--
ALTER TABLE `product_category`
  ADD CONSTRAINT `products_category_added_by` FOREIGN KEY (`added_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `products_category_status` FOREIGN KEY (`status`) REFERENCES `product_status` (`id`),
  ADD CONSTRAINT `products_category_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `product_color`
--
ALTER TABLE `product_color`
  ADD CONSTRAINT `products_color_added_by` FOREIGN KEY (`added_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `products_color_status` FOREIGN KEY (`status`) REFERENCES `product_status` (`id`),
  ADD CONSTRAINT `products_color_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `product_image`
--
ALTER TABLE `product_image`
  ADD CONSTRAINT `product_image_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_related_sub_category`
--
ALTER TABLE `product_related_sub_category`
  ADD CONSTRAINT `product_related_sub_category_main` FOREIGN KEY (`sub_category_id`) REFERENCES `product_sub_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_related_sub_category_related` FOREIGN KEY (`related_sub_category`) REFERENCES `product_sub_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_sub_category`
--
ALTER TABLE `product_sub_category`
  ADD CONSTRAINT `Structureproduct_sub_category_added_by` FOREIGN KEY (`added_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `Structureproduct_sub_category_category` FOREIGN KEY (`category`) REFERENCES `product_category` (`id`),
  ADD CONSTRAINT `Structureproduct_sub_category_status` FOREIGN KEY (`status`) REFERENCES `product_status` (`id`),
  ADD CONSTRAINT `Structureproduct_sub_category_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `ticket_category`
--
ALTER TABLE `ticket_category`
  ADD CONSTRAINT `ticket_category_added_by` FOREIGN KEY (`added_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `ticket_category_status_status` FOREIGN KEY (`status`) REFERENCES `ticket_category_status` (`id`),
  ADD CONSTRAINT `ticket_category_updated_by` FOREIGN KEY (`update_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_added_by` FOREIGN KEY (`added_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `user_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `user_user_role` FOREIGN KEY (`role`) REFERENCES `user_role` (`id`),
  ADD CONSTRAINT `user_user_status` FOREIGN KEY (`status`) REFERENCES `user_status` (`id`);

--
-- Constraints for table `user_auth`
--
ALTER TABLE `user_auth`
  ADD CONSTRAINT `user_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `voucher`
--
ALTER TABLE `voucher`
  ADD CONSTRAINT `voucher_added_by` FOREIGN KEY (`added_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `voucher_event_category_id` FOREIGN KEY (`event_ticket_category`) REFERENCES `event_ticket_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `voucher_event_id` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `voucher_status` FOREIGN KEY (`status`) REFERENCES `voucher_status` (`id`),
  ADD CONSTRAINT `voucher_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `voucher_category`
--
ALTER TABLE `voucher_category`
  ADD CONSTRAINT `voucher_category_added_by` FOREIGN KEY (`added_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `voucher_category_status` FOREIGN KEY (`status`) REFERENCES `voucher_category_status` (`id`),
  ADD CONSTRAINT `voucher_category_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
