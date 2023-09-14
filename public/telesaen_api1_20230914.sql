-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 14, 2023 at 06:36 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `telesaen_api1`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address1` text DEFAULT NULL,
  `address2` text DEFAULT NULL,
  `country_name` varchar(100) DEFAULT NULL,
  `city_name` varchar(100) DEFAULT NULL,
  `zip_code` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `billings`
--

CREATE TABLE `billings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `address1` text DEFAULT NULL,
  `address2` text DEFAULT NULL,
  `city` int(11) DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carriers`
--

CREATE TABLE `carriers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `delevery_text` text DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `main_category_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `main_category_id`, `name`, `icon`, `creator`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Misubisi', 'uploads/category/2SUisW9eLwmRlnjG8gBvP36QvDDU1IU07PImMEhS.jpg', '1', 'misubisi', 1, '2023-02-07 15:01:43', '2023-02-07 15:01:43');

-- --------------------------------------------------------

--
-- Table structure for table `category_courses`
--

CREATE TABLE `category_courses` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_courses`
--

INSERT INTO `category_courses` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Khóa giao tiếp trong 3 tháng', 1, NULL, NULL),
(2, 'mini course', 1, NULL, '2023-06-07 04:42:36');

-- --------------------------------------------------------

--
-- Table structure for table `category_product`
--

CREATE TABLE `category_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `zip_code` varchar(100) DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `color_product`
--

CREATE TABLE `color_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `color_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'users.id - id of student',
  `created_time` datetime DEFAULT current_timestamp(),
  `updated_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `lesson_id`, `user_id`, `created_time`, `updated_time`) VALUES
(1, 35, 188, '2023-08-24 16:29:58', '2023-08-26 08:28:00'),
(2, 88, 214, '2023-08-24 23:34:05', '2023-08-26 08:13:00'),
(3, 38, 270, '2023-08-25 06:58:12', '2023-09-12 07:32:00'),
(4, 35, 269, '2023-08-25 08:34:10', '2023-08-26 08:14:00'),
(5, 188, 92, '2023-08-25 10:23:03', '2023-08-26 08:15:00'),
(6, 35, 92, '2023-08-25 12:17:23', '2023-08-30 08:20:00'),
(7, 101, 275, '2023-08-28 13:55:55', '2023-08-29 02:18:00'),
(8, 101, 276, '2023-08-28 14:02:10', '2023-08-31 04:59:00'),
(9, 90, 214, '2023-08-30 07:48:10', '2023-08-30 10:30:00'),
(10, 91, 214, '2023-08-30 07:50:00', '2023-08-30 09:57:00'),
(11, 35, 25, '2023-08-31 13:29:47', '2023-09-15 10:43:00'),
(12, 163, 94, '2023-09-03 21:02:52', '2023-09-04 09:02:00'),
(13, 37, 289, '2023-09-04 20:47:29', '2023-09-05 08:47:00'),
(14, 36, 289, '2023-09-04 20:48:34', '2023-09-05 10:00:00'),
(15, 38, 25, '2023-09-05 08:06:54', '2023-09-15 10:41:00'),
(16, 35, 293, '2023-09-14 21:16:31', '2023-09-15 09:59:00'),
(17, 38, 293, '2023-09-14 22:44:25', '2023-09-15 10:44:00'),
(18, 36, 25, '2023-09-14 22:55:44', '2023-09-15 11:33:00');

-- --------------------------------------------------------

--
-- Table structure for table `comment_detail`
--

CREATE TABLE `comment_detail` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reply_id` int(11) DEFAULT NULL,
  `comment_id` int(11) NOT NULL,
  `content` text DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `type` tinyint(4) DEFAULT 1 COMMENT '1 - text content\n2 - text file\n3 - audio\n4 - video\n5 - image',
  `created_time` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment_detail`
--

INSERT INTO `comment_detail` (`id`, `user_id`, `reply_id`, `comment_id`, `content`, `path`, `type`, `created_time`) VALUES
(1, 188, NULL, 1, 'test', NULL, 1, '2023-08-24 16:29:58'),
(3, 214, NULL, 2, 'I can’t send video my homework for Ms. Please can you help me', NULL, 1, '2023-08-24 23:34:05'),
(4, 214, NULL, 2, 'Dạ hiện tại em gửi được ảnh chứ kg gửi đc video mặc dù dung lượng mỗi video đc cho phép', NULL, 1, '2023-08-24 23:35:42'),
(5, 214, NULL, 2, 'Dạ khi em gửi ảnh , trên màn hình ghi done và đánh dấu tích xanh nhưng nhìn trên text box lại không thấy hình đã gửi mặc dù hệ thống đã báo done', NULL, 1, '2023-08-24 23:36:40'),
(6, 270, NULL, 3, 'Test student', NULL, 1, '2023-08-25 06:58:12'),
(8, 270, NULL, 3, 'karl-pawlowicz-QUHuwyNgSA0.jpg', 'http://api.telesaenglish.com/uploads/comments/3/nVF4nOd1vwPthcrTle5S-karl-pawlowicz-QUHuwyNgSA0.jpg', 5, '2023-08-25 06:59:20'),
(14, 270, NULL, 3, 'Test delete file', NULL, 1, '2023-08-25 07:10:30'),
(15, 269, NULL, 4, 'Erown', NULL, 1, '2023-08-25 08:34:10'),
(16, 269, NULL, 4, 'Mwore', NULL, 1, '2023-08-25 08:34:20'),
(17, 269, NULL, 4, 'Taylor', NULL, 1, '2023-08-25 08:34:25'),
(18, 269, NULL, 4, 'Anderson', NULL, 1, '2023-08-25 08:34:31'),
(19, 269, NULL, 4, 'Thomas', NULL, 1, '2023-08-25 08:34:35'),
(20, 269, NULL, 4, 'Atlanta', NULL, 1, '2023-08-25 08:34:41'),
(21, 269, NULL, 4, 'Geelog', NULL, 1, '2023-08-25 08:34:49'),
(22, 269, NULL, 4, 'Lipeipool', NULL, 1, '2023-08-25 08:35:26'),
(23, 269, NULL, 4, 'Orlando', NULL, 1, '2023-08-25 08:35:35'),
(24, 269, NULL, 4, 'Fremantle', NULL, 1, '2023-08-25 08:35:47'),
(31, 92, NULL, 5, 'Hi Ms, I am sending a file -date 47 homework', NULL, 1, '2023-08-25 10:23:03'),
(32, 92, NULL, 5, 'Date 47.docx', 'https://api.telesaenglish.com/uploads/comments/5/NaMUxQb7OHTUAD35aXeE-Date 47.docx', 2, '2023-08-25 11:00:35'),
(34, 92, NULL, 5, 'Xin chào', NULL, 1, '2023-08-25 11:02:41'),
(42, 92, NULL, 5, 'I\'ve recently replied to y', NULL, 1, '2023-08-25 12:00:59'),
(59, 75, NULL, 6, 'Screen_Recording_20230812_202604_Chrome.mp4', 'https://api.telesaenglish.com/uploads/comments/6/z3QfPCwtfQeUgOQNVhws-Screen_Recording_20230812_202604_Chrome.mp4', 4, '2023-08-25 20:40:16'),
(60, 75, NULL, 6, '20230825_175036.jpg', 'https://api.telesaenglish.com/uploads/comments/6/R4vxTTcK7y99HI7SNvmT-20230825_175036.jpg', 5, '2023-08-25 20:40:31'),
(66, 1, 269, 4, 'gần dc sử dụng rồi nè', NULL, 1, '2023-08-26 08:14:42'),
(69, 75, NULL, 1, 'agriculture.mp4', 'https://api.telesaenglish.com/uploads/comments/1/Bl53BX3b1DR69rVHoYU5-agriculture.mp4', 4, '2023-08-26 08:26:33'),
(70, 75, NULL, 1, 'AT-AIRPORT.mp4', 'https://api.telesaenglish.com/uploads/comments/1/t4xMQw3DqoLpKDbnNHnH-AT-AIRPORT.mp4', 4, '2023-08-26 08:28:30'),
(71, 275, NULL, 7, 'Hello teacher', NULL, 1, '2023-08-28 13:55:55'),
(72, 275, NULL, 7, 'Can u help me?', NULL, 1, '2023-08-28 13:56:28'),
(73, 274, NULL, 7, 'Hi', NULL, 1, '2023-08-28 13:59:27'),
(74, 276, NULL, 8, 'Hello teacher', NULL, 1, '2023-08-28 14:02:10'),
(75, 274, NULL, 8, 'Hi', NULL, 1, '2023-08-28 14:03:43'),
(78, 275, NULL, 7, 'test.mp4', 'https://api.telesaenglish.com/uploads/comments/7/0SsZiZRhI2guwxYqgh8U-test.mp4', 4, '2023-08-28 14:17:39'),
(79, 275, NULL, 7, 'test.doc', 'https://api.telesaenglish.com/uploads/comments/7/kELJFvHpJYCTNNiyYHyQ-test.doc', 2, '2023-08-28 14:18:25'),
(80, 275, NULL, 7, 'test.mp3', 'https://api.telesaenglish.com/uploads/comments/7/mXUBQk3t5b6bl6hFcx6P-test.mp3', 3, '2023-08-28 14:18:25'),
(85, 1, 92, 6, '20230826_194131.mp4', 'https://api.telesaenglish.com/uploads/comments/6/mPLtKOEbBWQhmsvpLNC9-20230826_194131.mp4', 4, '2023-08-30 08:20:57'),
(88, 214, NULL, 9, 'IMG_7509.MOV', 'https://api.telesaenglish.com/uploads/comments/9/GXKUzJyL8FwD3FZShgmy-IMG_7509.MOV', 4, '2023-08-30 09:36:25'),
(89, 214, NULL, 10, 'IMG_7510.MOV', 'https://api.telesaenglish.com/uploads/comments/10/6MAeECbJO6t0uLTAaIu5-IMG_7510.MOV', 4, '2023-08-30 09:42:10'),
(90, 214, NULL, 10, 'IMG_7496.MOV', 'https://api.telesaenglish.com/uploads/comments/10/OmkjxSyNXEv7tCdBkw85-IMG_7496.MOV', 4, '2023-08-30 09:43:01'),
(91, 214, NULL, 10, 'IMG_7503.MOV', 'https://api.telesaenglish.com/uploads/comments/10/sU3WLpgA6xRZBtb89EXE-IMG_7503.MOV', 4, '2023-08-30 09:43:29'),
(95, 1, 214, 9, 'final.mp4', 'https://api.telesaenglish.com/uploads/comments/9/35i2vm1HKalLxI8dEM6K-final.mp4', 4, '2023-08-30 10:30:11'),
(97, 1, 276, 8, 'New Recording 75.m4a', 'https://api.telesaenglish.com/uploads/comments/8/QKsU1Cl9KN1UQn2uW9mB-New Recording 75.m4a', 3, '2023-08-30 16:59:23'),
(98, 25, NULL, 11, 'Hi Ms, Tính Test gửi file nặng trên PC', NULL, 1, '2023-08-31 13:29:47'),
(99, 25, NULL, 11, 'Tính test trình duyệt ẩn danh', NULL, 1, '2023-08-31 13:35:35'),
(101, 25, NULL, 11, 'The MOST UPBEAT & FUN Background Music For Videos and YouTube.mp4', 'https://api.telesaenglish.com/uploads/comments/11/jat7gtThJCqhWBE0hvWN-The MOST UPBEAT & FUN Background Music For Videos and YouTube.mp4', 4, '2023-08-31 13:36:28'),
(102, 25, NULL, 11, '3472E445-947B-4AB5-B1D5-C0D6829FF6CB.MOV', 'https://api.telesaenglish.com/uploads/comments/11/7LvrtTVGRXOyz5qsgj6l-3472E445-947B-4AB5-B1D5-C0D6829FF6CB.MOV', 4, '2023-08-31 13:37:29'),
(103, 25, NULL, 11, 'Am-thanh-dem-nguoc-het-gio-www_tiengdong_com.mp3', 'https://api.telesaenglish.com/uploads/comments/11/0ayey6msMQi8bA8GPyNP-Am-thanh-dem-nguoc-het-gio-www_tiengdong_com.mp3', 3, '2023-08-31 13:37:43'),
(104, 274, NULL, 11, 'airplane_window.mp4', 'https://api.telesaenglish.com/uploads/comments/11/Z6tLwViqZs0mf9QXoKZf-airplane_window.mp4', 4, '2023-09-03 09:37:54'),
(105, 274, NULL, 11, 'airplane_window.mp4', 'https://api.telesaenglish.com/uploads/comments/11/tniJTdUnA9wema59FCCO-airplane_window.mp4', 4, '2023-09-03 09:42:03'),
(106, 274, NULL, 11, 'underwater_ripples.mp4', 'https://api.telesaenglish.com/uploads/comments/11/vnlxguWrNcWwD3Ar5dsK-underwater_ripples.mp4', 4, '2023-09-03 09:42:27'),
(107, 94, NULL, 12, 'Mưa dầm thấm lâu. I like this sentence', NULL, 1, '2023-09-03 21:02:52'),
(108, 289, NULL, 13, 'can not upload cô ơi', NULL, 1, '2023-09-04 20:47:29'),
(109, 289, NULL, 14, 'can not upload cô ơi', NULL, 1, '2023-09-04 20:48:34'),
(110, 1, 289, 14, 'oh', NULL, 1, '2023-09-04 22:00:00'),
(111, 25, NULL, 11, 'RPReplay_Final1693841589.mp4', 'http://api.telesaenglish.com/uploads/comments/11/VsZu1uYCgOV3tTL3rgZy-RPReplay_Final1693841589.mp4', 4, '2023-09-04 22:19:58'),
(112, 25, NULL, 11, 'Upload file video', NULL, 1, '2023-09-04 22:23:06'),
(113, 25, NULL, 11, 'RPReplay_Final1693841589.MP4', 'http://api.telesaenglish.com/uploads/comments/11/8oB0Y9gSDG1Z7O569uRb-RPReplay_Final1693841589.MP4', 4, '2023-09-04 22:23:45'),
(114, 25, NULL, 15, 'asdf', NULL, 1, '2023-09-05 08:06:54'),
(115, 2, NULL, 15, 'asf', NULL, 1, '2023-09-05 08:12:51'),
(116, 2, NULL, 3, 'hi , this is good', NULL, 1, '2023-09-05 11:15:28'),
(117, 1, 270, 3, 'gggggg', NULL, 1, '2023-09-11 19:32:38'),
(118, 25, NULL, 11, 'hello w', NULL, 1, '2023-09-14 20:47:04'),
(119, 25, NULL, 15, 'Morning day 2  user1', NULL, 1, '2023-09-14 21:06:23'),
(120, 25, NULL, 11, 'Morning day 1 user1', NULL, 1, '2023-09-14 21:07:10'),
(121, 2, 25, 11, 'Hii', NULL, 1, '2023-09-14 21:12:24'),
(122, 293, NULL, 16, 'morning day 1 user2', NULL, 1, '2023-09-14 21:16:31'),
(123, 2, 293, 16, 'nice', NULL, 1, '2023-09-14 21:59:22'),
(124, 2, 25, 15, 'test add new comment', NULL, 1, '2023-09-14 22:41:03'),
(125, 25, NULL, 11, 'user1 send', NULL, 1, '2023-09-14 22:42:59'),
(126, 25, NULL, 11, 'user1 send2', NULL, 1, '2023-09-14 22:43:19'),
(127, 293, NULL, 17, 'studen2 send', NULL, 1, '2023-09-14 22:44:25'),
(128, 293, NULL, 17, 'student2 send 2', NULL, 1, '2023-09-14 22:44:31'),
(129, 25, NULL, 18, 'user1', NULL, 1, '2023-09-14 22:55:44'),
(130, 2, 25, 18, 'teacher send u1', NULL, 1, '2023-09-14 22:56:28'),
(131, 2, 25, 18, 'teach send u1 one more time', NULL, 1, '2023-09-14 23:32:55'),
(132, 25, 25, 18, 'hi teacher', NULL, 1, '2023-09-14 23:33:51');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address1` text DEFAULT NULL,
  `address2` text DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `tin` int(11) DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `lat` varchar(100) DEFAULT NULL,
  `lng` varchar(100) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `currency` varchar(100) DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `price` bigint(20) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `category_id`, `name`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Khóa giao tiếp trong 3 tháng full', 1000000, 1, '2023-05-22 10:08:12', '2023-05-29 18:38:17'),
(4, 1, 'Khóa học thử', NULL, 1, '2023-05-29 08:45:08', '2023-05-29 08:45:08'),
(10, 2, 'Khóa Học Phát Âm', NULL, 1, '2023-06-11 17:51:08', '2023-06-11 17:51:08'),
(11, 2, 'Khóa Từ Vựng', NULL, 1, '2023-06-18 08:44:39', '2023-06-18 08:44:39');

-- --------------------------------------------------------

--
-- Table structure for table `course_lessons`
--

CREATE TABLE `course_lessons` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `sort_order` float DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_lessons`
--

INSERT INTO `course_lessons` (`id`, `course_id`, `lesson_id`, `sort_order`, `created_at`, `updated_at`) VALUES
(69, 7, 95, 69, '2023-05-30 05:25:51', '2023-06-09 12:36:58'),
(75, 8, 36, 75, '2023-05-30 06:06:53', '2023-06-09 12:36:58'),
(76, 8, 37, 76, '2023-05-30 06:06:53', '2023-06-09 12:36:58'),
(77, 8, 38, 77, '2023-05-30 06:06:53', '2023-06-09 12:36:58'),
(78, 8, 96, 78, '2023-05-30 06:06:53', '2023-06-09 12:36:58'),
(82, 9, 35, 82, '2023-06-05 10:37:05', '2023-06-09 12:36:58'),
(83, 9, 36, 83, '2023-06-05 10:37:05', '2023-06-09 12:36:58'),
(84, 9, 38, 84, '2023-06-05 10:37:05', '2023-06-09 12:36:58'),
(85, 9, 97, 85, '2023-06-05 10:37:05', '2023-06-09 12:36:58'),
(89, 4, 35, 90.5, '2023-06-07 04:36:18', '2023-06-09 14:40:03'),
(90, 4, 38, 90, '2023-06-07 04:36:18', '2023-06-09 12:36:58'),
(91, 4, 40, 91, '2023-06-07 04:36:18', '2023-06-09 12:36:58'),
(267, 10, 35, 1, '2023-06-12 14:46:07', '2023-06-12 14:46:07'),
(417, 11, 101, 1, '2023-06-19 07:40:27', '2023-06-19 07:40:27'),
(418, 11, 102, 1, '2023-06-19 07:40:27', '2023-06-19 07:40:27'),
(419, 11, 103, 1, '2023-06-19 07:40:27', '2023-06-19 07:40:27'),
(420, 11, 104, 1, '2023-06-19 07:40:27', '2023-06-19 07:40:27'),
(421, 11, 108, 1, '2023-06-19 07:40:27', '2023-06-19 07:40:27'),
(422, 11, 109, 1, '2023-06-19 07:40:27', '2023-06-19 07:40:27'),
(423, 11, 110, 1, '2023-06-19 07:40:27', '2023-06-19 07:40:27'),
(424, 11, 111, 1, '2023-06-19 07:40:27', '2023-06-19 07:40:27'),
(425, 11, 112, 1, '2023-06-19 07:40:27', '2023-06-19 07:40:27'),
(426, 11, 113, 1, '2023-06-19 07:40:27', '2023-06-19 07:40:27'),
(427, 11, 114, 1, '2023-06-19 07:40:27', '2023-06-19 07:40:27'),
(2957, 1, 35, 2957, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2958, 1, 36, 2958, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2959, 1, 37, 2959, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2960, 1, 38, 2960, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2961, 1, 39, 2961, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2962, 1, 40, 2962, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2963, 1, 41, 2963, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2964, 1, 42, 2964, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2965, 1, 43, 2965, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2966, 1, 44, 2966, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2967, 1, 45, 2967, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2968, 1, 46, 2968, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2969, 1, 47, 2969, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2970, 1, 48, 2970, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2971, 1, 50, 2971, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2972, 1, 51, 2972, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2973, 1, 52, 2973, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2974, 1, 53, 2974, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2975, 1, 54, 2975, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2976, 1, 55, 2976, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2977, 1, 56, 2977, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2978, 1, 57, 2978, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2979, 1, 58, 2979, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2980, 1, 59, 2980, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2981, 1, 60, 2981, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2982, 1, 61, 2982, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2983, 1, 62, 2983, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2984, 1, 63, 2984, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2985, 1, 64, 2985, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2986, 1, 65, 2986, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2987, 1, 66, 2987, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2988, 1, 67, 2988, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2989, 1, 68, 2989, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2990, 1, 69, 2990, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2991, 1, 70, 2991, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2992, 1, 71, 2992, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2993, 1, 72, 2993, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2994, 1, 73, 2994, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2995, 1, 75, 2995, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2996, 1, 76, 2996, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2997, 1, 77, 2997, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2998, 1, 78, 2998, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(2999, 1, 79, 2999, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3000, 1, 80, 3000, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3001, 1, 81, 3001, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3002, 1, 82, 3002, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3003, 1, 83, 3003, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3004, 1, 85, 3004, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3005, 1, 86, 3005, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3006, 1, 87, 3006, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3007, 1, 88, 3007, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3008, 1, 89, 3008, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3009, 1, 90, 3009, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3010, 1, 91, 3010, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3011, 1, 92, 3011, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3012, 1, 94, 3012, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3013, 1, 98, 2994.5, '2023-08-27 18:34:31', '2023-08-27 18:41:30'),
(3014, 1, 115, 3014, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3015, 1, 116, 3015, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3016, 1, 117, 3016, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3017, 1, 118, 3017, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3018, 1, 119, 3018, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3019, 1, 120, 3019, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3020, 1, 121, 3020, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3021, 1, 122, 3021, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3022, 1, 123, 3022, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3023, 1, 124, 3023, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3024, 1, 125, 3024, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3025, 1, 126, 3025, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3026, 1, 127, 3026, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3027, 1, 128, 3027, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3028, 1, 129, 3028, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3029, 1, 130, 3029, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3030, 1, 131, 3030, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3031, 1, 132, 3031, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3032, 1, 133, 3032, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3033, 1, 136, 3033, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3034, 1, 137, 3034, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3035, 1, 138, 3035, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3036, 1, 139, 3036, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3037, 1, 140, 3037, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3038, 1, 141, 3038, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3039, 1, 142, 3039, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3040, 1, 143, 3040, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3041, 1, 144, 3041, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3042, 1, 145, 3042, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3043, 1, 146, 3043, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3044, 1, 147, 3044, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3045, 1, 148, 3045, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3046, 1, 149, 3046, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3047, 1, 150, 3047, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3048, 1, 151, 3048, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3049, 1, 152, 3049, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3050, 1, 153, 3050, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3051, 1, 154, 3051, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3052, 1, 155, 3052, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3053, 1, 156, 3053, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3054, 1, 157, 3054, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3055, 1, 158, 3055, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3056, 1, 159, 3056, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3057, 1, 160, 3057, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3058, 1, 161, 3058, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3059, 1, 162, 3059, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3060, 1, 163, 3060, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3061, 1, 164, 3061, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3062, 1, 165, 3062, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3063, 1, 166, 3063, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3064, 1, 167, 3064, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3065, 1, 168, 3065, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3066, 1, 169, 3066, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3067, 1, 170, 3067, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3068, 1, 171, 3068, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3069, 1, 172, 3069, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3070, 1, 173, 3070, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3071, 1, 174, 3071, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3072, 1, 175, 3072, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3073, 1, 176, 3073, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3074, 1, 177, 3074, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3075, 1, 178, 3075, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3076, 1, 179, 3076, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3077, 1, 180, 3077, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3078, 1, 181, 3078, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3079, 1, 182, 3079, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3080, 1, 183, 3080, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3081, 1, 184, 3081, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3082, 1, 185, 3082, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3083, 1, 186, 3083, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3084, 1, 187, 3084, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3085, 1, 188, 3085, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3086, 1, 189, 3086, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3087, 1, 190, 3087, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3088, 1, 191, 3088, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3089, 1, 192, 3089, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3090, 1, 193, 3090, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3091, 1, 194, 3091, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3092, 1, 195, 3092, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3093, 1, 196, 3093, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3094, 1, 197, 3094, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3095, 1, 198, 3095, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3096, 1, 199, 3096, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3097, 1, 200, 3097, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3098, 1, 201, 3098, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3099, 1, 202, 3099, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3100, 1, 203, 3100, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3101, 1, 204, 3101, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3102, 1, 205, 3102, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3103, 1, 206, 3103, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3104, 1, 207, 3104, '2023-08-27 18:34:31', '2023-08-27 18:34:31'),
(3105, 1, 208, 3105, '2023-08-27 18:34:31', '2023-08-27 18:34:31');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file_resources`
--

CREATE TABLE `file_resources` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `pathfile` varchar(100) DEFAULT NULL,
  `type_file` varchar(20) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `file_resources`
--

INSERT INTO `file_resources` (`id`, `name`, `description`, `pathfile`, `type_file`, `status`, `created_at`, `updated_at`) VALUES
(6, 'Morning Date 1-file_01', NULL, 'uploads/lessons/morning-date-1/YSpCNmraIgcMhYIVFzDqgYUt8IHlZMFIsQGTFLNG.pdf', 'pdf', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(7, 'Morning Date 1-video01', NULL, 'uploads/lessons/morning-date-1/Xmqibs9u2QBaoSJ3iVKGw7TP5cYTxbFbS70GlsOJ.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(8, 'Midday Date 1-file_01', NULL, 'uploads/lessons/midday-date-1/MEb7NafG3BQVfXE4acOQR9uLuzOZOIYM9A8V1nD9.pdf', 'pdf', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(9, 'Midday Date 1-video01', NULL, 'uploads/lessons/midday-date-1/peBZCGXvhcn4Mw0DndfW1OXKOgFjoscLB5VH4QNr.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(10, 'Evening Date 1-file_01', NULL, 'uploads/lessons/evening-date-1/TaEcx7r5sUzNBUjC7PhD8X9X1Zxlh4zNbJTJAE5n.pdf', 'pdf', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(11, 'Evening Date 1-file02', NULL, 'uploads/lessons/evening-date-1/s0aGrfa4zjIZXcQGgbAwCxpa62YWv8Da3tOUqXU1.pdf', 'pdf', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(12, 'Evening Date 1-video01', NULL, 'uploads/lessons/evening-date-1/VhQqkSuHS0PQWBUKyAc0BkZSGWgs9HQwN3CPTUVe.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(13, 'Morning Date 2-file_01', NULL, 'uploads/lessons/morning-date-2/QCuyRzdL4qmyUVjMIkTtmJkwlIwQBwmnE7hcxyN3.pdf', 'pdf', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(14, 'Morning Date 2-video01', NULL, 'uploads/lessons/morning-date-2/rQ4xTiycr5ZP4MHI4iFG5X9bg3YA476odV1BDmkw.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(15, 'Midday Date 2-file_01', NULL, 'uploads/lessons/midday-date-2/Ynhw0KB6K3ERE5kKn1ytk95AZdtfHEV8ksNXpese.pdf', 'pdf', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(16, 'Midday Date 2-video01', NULL, 'uploads/lessons/midday-date-2/VE2Rk9NrsQqph44ZcJThfJ6wpEbZ7ZuxAlcATYds.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(17, 'Evening Date 2-file_01', NULL, 'uploads/lessons/evening-date-2/0b6sSM52xOVrrIJp8HDl5IkbguupfrfztPpBPrPd.pdf', 'pdf', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(18, 'Evening Date 2-video01', NULL, 'uploads/lessons/evening-date-2/bZmFxHuCAntqoq3D2MBfm4Wfcw5F6exRD3r6Rehz.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(19, 'Morning Date 3-file_01', NULL, 'uploads/lessons/morning-date-3/otnwzlPQgAD5U1zn7R4ixLgy2B0DjLAOxydIUhPb.pdf', 'pdf', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(20, 'Morning Date 3-video01', NULL, 'uploads/lessons/morning-date-3/YY9kosEn44Nh5httMIXabNANA1Nnsfj1VmLP2qhM.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(21, 'Midday Date 3-file_01', NULL, 'uploads/lessons/midday-date-3/6KnRYERU03rukn8O5jaG87aYC5uvc1XuDIzehtqb.pdf', 'pdf', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(22, 'Midday Date 3-video01', NULL, 'uploads/lessons/midday-date-3/TlFG6IbCsBxqhmbPQbVwyuuuDCDu4yup3OvpB6NS.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(23, 'Evening Date 3-video01', NULL, 'uploads/lessons/evening-date-3/rkjNSghLAyiYFueD1ZM54SKcurIOw8HzuAqdgMW4.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(24, 'Morning Date 4-file_01', NULL, 'uploads/lessons/morning-date-4/oMotq3T9TiJItnyIPHzHLS6cjeVqrisO3Ki4zZOz.pdf', 'pdf', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(25, 'Morning Date 4-video01', NULL, 'uploads/lessons/morning-date-4/WzMx7yNPTAAOWNuNtJUue9VdvCVurz1TEKUUulRJ.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(26, 'Midday Date 4-file_01', NULL, 'uploads/lessons/midday-date-4/hlxQIatE4one41gKjs9bBWh1tB0zcftUZLtd0hED.pdf', 'pdf', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(27, 'Midday Date 4-video01', NULL, 'uploads/lessons/midday-date-4/TwB9CKAWzZR2a1AxLXjjou34FhiTIsVLhy3EVe9g.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(28, 'Evening Date 4-file_01', NULL, 'uploads/lessons/evening-date-4/bNh3NgaqCu8IEV24DVRmD4wYsELptI1x0CuNVvCa.pdf', 'pdf', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(29, 'Evening Date 4-video01', NULL, 'uploads/lessons/evening-date-4/D2fcXj9BacA0KdWbEKaV36Da9kGCijVC4JsEHsDW.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(30, 'Morning Date 5-video01', NULL, 'uploads/lessons/morning-date-5/uvxuByYhKOUZPTZG33DSymmvQK0mP8JR221TquYR.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(31, 'Midday Date 5-video01', NULL, 'uploads/lessons/midday-date-5/DX7dz8vLNs6JLCq4cOOfuXT3Ei0h50hkQCpR9cW7.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(32, 'Evening Date 5-video01', NULL, 'uploads/lessons/evening-date-5/5Uqohbyennq8k0DDZYRDTSui1kKdHclksF8oieGp.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(33, 'Morning Date 6-video01', NULL, 'uploads/lessons/morning-date-6/zwJrdZO6wFEmMxKNtxZxTmaacFuOEdNAWFN2yLYu.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(34, 'Midday Date 6-video01', NULL, 'uploads/lessons/midday-date-6/pP3HIv1rzJMM4ZFRvnJuwfUYerFiCzrxcqoYmH01.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(35, 'Evening Date 6-video01', NULL, 'uploads/lessons/evening-date-6/wZmHd9SNHmOaKNQivE4F47XuanIaJu5Uz8J3pp8O.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(36, 'Date 7 - Recording-file_01', NULL, 'uploads/lessons/date-7-recording/ZioUtzKRk4zyWoAjsl6HxGrfWM2dwKvMn33xPSUD.jpg', 'pdf', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(37, 'Morning Date 8-video01', NULL, 'uploads/lessons/morning-date-8/UtqqKER0FdlsyEtdYzWdp7WbhyPRFN86gqFk2nU4.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(38, 'Midday Date 8-video01', NULL, 'uploads/lessons/midday-date-8/tAyM34w29Hg56p08SzDOi3tc4qX9XcLD0yY1QLUu.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(39, 'Evening  Date 8-video01', NULL, 'uploads/lessons/evening-8/e5AcLgHTNad27FoNRSx3O6mRuAbXFGl5A9LWeIh7.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(40, 'Morning Date 9-video01', NULL, 'uploads/lessons/morning-date-9/gc99E1xpFyYV9T2sPAKFAS7m2kMz3m1LnVi4dBJy.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(41, 'Midday Date 9-file_01', NULL, 'uploads/lessons/evening-date-9/ostP6n9ymkzOMtByQ26XnwgFlWs5WvTYIoVDndlt.pdf', 'pdf', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(42, 'Midday Date 9-video01', NULL, 'uploads/lessons/evening-date-9/IwlTNksiL1n31ecMgyTkLU24khVFXbMDt0jinYWV.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(43, 'Evening Date 9-file_01', NULL, 'uploads/lessons/evening-date-9/y3FQRg4fpkikVvE8Wmg8dzssqn2QX2XxpRgelkDg.pdf', 'pdf', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(44, 'Evening Date 9-video01', NULL, 'uploads/lessons/evening-date-9/EWUcwlNJxKZVaE2vDOd3ELBgjU0NGhgel8VVZZBR.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(45, 'Morning Date 10-file_01', NULL, 'uploads/lessons/morning-date-10/5EvWX607KTmXhiDIXCOM9b2esKQ4t9wD8IZ9Mt2s.mp4', 'pdf', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(46, 'Morning Date 10-video01', NULL, 'uploads/lessons/morning-date-10/NDdouitiikICHnF357DBkqCcOYYpR3DFqtQTTJLG.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(47, 'Midday Date 10-video01', NULL, 'uploads/lessons/midday-date-10/27YD2HLsPfQ4Mn5MbItIT4xyBfSHi7fJuFIIbu0P.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(48, 'Evening Date 10-video01', NULL, 'uploads/lessons/evening-date-10/LfFJU1JBVMZSzCZ05ZC8UcYjvbOXgCF4mb7L75aq.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(49, 'Morning Date 11-video01', NULL, 'uploads/lessons/morning-date-11/gdvUj11sQT0IVSJtmlSV0F5rbhbZAlw1v2U7YKaZ.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(50, 'Midday Date 11-video01', NULL, 'uploads/lessons/midday-date-11/wOyfzAcZQ1ko91Y8VZJay9f4leIgPS2N5naN6Cdy.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(51, 'Evening Date 11-video01', NULL, 'uploads/lessons/evening-date-11/VlCGM2ympiYch5FgvIiTHNiqmOKztaLgLR8wzi9c.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(52, 'Morning Date 12-video01', NULL, 'uploads/lessons/morning-date-12/HAd43qO9OxXm5T021eWZDpUDNfaQBlmIMHNaz1jD.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(53, 'Midday Date  12-video01', NULL, 'uploads/lessons/midday-12/qiC4Hj25BpUHGwuqjOmM8Yb4iMX1xfNwhCLRGFAI.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(54, 'Evening Date 12-video01', NULL, 'uploads/lessons/evening-date-12/qsIUFdV7g6Q4gc7IMcyFRrKN3P9nSMxUIlDWy0FG.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(55, 'Morning Date 13-video01', NULL, 'uploads/lessons/morning-date-13/wPxwF7szdbab3DQuh2VHjQsb2a3yxzJqgX8WKfhQ.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(56, 'Midday  Date 13-video01', NULL, 'uploads/lessons/midday-date-13/RJg0SmKmHtpH5Pyf7RCwXErvETZx6GjgVIJSz2sE.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(57, 'Evening Date 13-video01', NULL, 'uploads/lessons/evening-date-13/fg3gE4OtWijSw2MMB9JMWPrEbCb0grhmYWAJtpjO.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(58, 'Filming yourself - Date 14-file_01', NULL, 'uploads/lessons/filming-yourself-date-14/ShLVgcQJGcX8nn5uWlgYKIQBhXACI1woGtLH1Tr5.pdf', 'pdf', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(59, 'Morning Date 15-video01', NULL, 'uploads/lessons/morning-date-15/H6tkP5hXwLkQffhujrillQpSRBOEsXDzihJOtIZB.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(60, 'Midday- Date 15-video01', NULL, 'uploads/lessons/midday-date-15/3D6JBKIwv06NChnNwkiTHklguEbElIgdZogr0AZP.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(61, 'Evening Date 15-file_01', NULL, 'uploads/lessons/evening-date-15/UxNWMAtButaWyv6ahuYdPLDN7OVeGThLMsHXLtoV.jpg', 'pdf', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(62, 'Evening Date 15-video01', NULL, 'uploads/lessons/evening-date-15/TXGsK6pLWU2yZa0iRJBP4e0QYh2U5CjPtKB8y9v5.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(63, 'Morning Date 16-video01', NULL, 'uploads/lessons/morning-date-16/56kPXIDyRX3Ow5VL68NJtQxemqG81RPTGfMlp59P.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(64, 'Midday Date 16-video01', NULL, 'uploads/lessons/midday-date-16/CFH6qqfCj62fDP13cGoLWIOwiDLcDfxA9FPgDKo9.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(65, 'Evening Date 16-video01', NULL, 'uploads/lessons/evening-date-16/SxSj86qnbvLZ3FClCikvez68cmdmdXhOoPlHTvuw.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(66, 'Morning Date 17-video01', NULL, 'uploads/lessons/morning-date-17/lVZVKX3HqBk8hf6zZ1THvY1tV8PjgfgnkZR3SFsB.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(67, 'Midday Date 17-video01', NULL, 'uploads/lessons/midday-date-17/ysrf1Xfdi7sE9Gv9zvbTXUkU9Rh2aVBfxswfeDRm.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(68, 'Evening Date 17-video01', NULL, 'uploads/lessons/evening-date-17/CjZmceW1JPmAfpQW4RygXzmhEDtUATOBqIplbvlJ.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(69, 'Morning Date 18-video01', NULL, 'uploads/lessons/morning-date-18/omukIXZSbYSMWr9LR5leAh1AdekjEoYsZFU3sDZf.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(70, 'Morning Date 18-video01', NULL, 'uploads/lessons/morning-date-18/YaFtsIIdwAZKThkWNJhDeuvI2ZU6WEnTYCu9aJQn.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(71, 'Midday Date 18-video01', NULL, 'uploads/lessons/midday-date-18/qLWjM7Wq4XWz28bDJRGvQy0zVl9enFxEd1EL4ovW.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(72, 'Evening Date 18-video01', NULL, 'uploads/lessons/evening-date-18/lOBC1rQ4nN4IIEaPk3eB9SjDLqJQJ984iWYtkSGG.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(73, 'Morning Date 19-video01', NULL, 'uploads/lessons/morning-date-19/xjsDIBjMkWizEdXeJRJmqldV63Xkb4KBAb1u7Ymj.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(74, 'Midday Date 19-video01', NULL, 'uploads/lessons/midday-date-19/xDs5xrkAdrkXr4RcTCC39vY4oTnysjDr7d5gqkBm.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(75, 'Evening Date 19-file_01', NULL, 'uploads/lessons/evening-date-19/xxMRCdFqW6hbyqn0lOZu9jMFnPR565DCSXcgEWc5.pdf', 'pdf', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(76, 'Evening Date 19-video01', NULL, 'uploads/lessons/evening-date-20/H8u1MAsuPz0U5bmZCmZ3oqh6mrp4DeZHLX9De38q.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(77, 'Morning Date 20-video01', NULL, 'uploads/lessons/morning-date-20/qplXmOevLPlqtJrqqb3AsQL48uV8AKk58AGiHqXt.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(78, 'Midday Date 12-video01', NULL, 'uploads/lessons/midday-date-12/qggWf1V68kDABB7dLznb86HGEXfdwkwmKM6dl6Sx.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(79, 'Evening Date 20-video01', NULL, 'uploads/lessons/evening-date-20/otA2b8NQtj8j8LfMhgQvd0qGV1sl96cErkHHv8Gs.mp4', 'mp4', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(80, 'Filming yourself - Date 21-file_01', NULL, 'uploads/lessons/filming-yourself-date-21/xt4fBinmcq7nd9eeRPUd9DKRG1P4AZPvwtzTAdqq.pdf', 'pdf', 1, '2023-05-29 02:39:52', '2023-05-29 02:39:52'),
(89, 'pr1', '<p>pr1&nbsp;<br></p>', 'uploads/file/u5usHs7m2PRlYX34tIyCyg1Z2fFPA6jLNyaqpTW6.mp4', 'mp4', 1, '2023-06-04 22:46:41', '2023-06-04 22:46:42'),
(90, 'Morning Date 15 (2nd ver)', '<p>Morning Date 15</p>', 'uploads/file/cNOF2XqD0gWsBnH7yJ4w6wVoeCrYKs70XLPSNFwn.mp4', 'mp4', 1, '2023-06-05 05:06:47', '2023-06-06 23:08:37'),
(91, 'Pronunciaiton Les.01', '<p>Pronunciation Lession 1</p>', 'uploads/file/OsmtdXRHmNBss3Ll3ZmvVZVYayAJFwsaZiiLY36Q.mp4', 'mp4', 1, '2023-06-11 12:30:15', '2023-06-11 12:30:15'),
(92, 'Pronunciaiton Les.02', 'Pronunciation Lession 2', 'uploads/file/uuxQ9IxJQpzsIXM3CiQCOzhxLz48lyriLxtOhosK.mp4', 'mp4', 1, '2023-06-11 12:30:33', '2023-06-11 12:30:33'),
(93, 'Pronunciaiton Les.03', 'Pronunciation Lession 3', 'uploads/file/bgwIPODYLIoes0ynX1wwazuj13wHHV241fqtwIdA.mp4', 'mp4', 1, '2023-06-11 12:31:08', '2023-06-11 12:31:08'),
(94, 'Pronunciaiton Les.04', '<p>Pronunciation Lession 4<br></p>', 'uploads/file/W7eAAblTwsKooJcfKXnyHnFZ9eICxRn0jJGDQi2w.mp4', 'mp4', 1, '2023-06-11 12:32:18', '2023-06-11 12:32:18'),
(95, 'Pronunciaiton Les.05', 'Pronunciation Lession 5', 'uploads/file/BQBBAe98ZURFx1KWMU1ROluhEjJWUDwPLRB7vYnk.mp4', 'mp4', 1, '2023-06-11 12:32:36', '2023-06-11 12:32:36'),
(96, 'Pronunciaiton Les.06', 'Pronunciation Lession 6', 'uploads/file/MQWLltnp3FCY8YVbzKzZo3HLHbHBRWmkSDCYwYcx.mp4', 'mp4', 1, '2023-06-11 12:32:54', '2023-06-11 12:32:54'),
(97, 'Pronunciaiton Les.07', 'Pronunciation Lession 7', 'uploads/file/PxuCfC6eXphCXHMLH45TdPBDki3E8vyz6KjCpZek.mp4', 'mp4', 1, '2023-06-11 12:37:50', '2023-06-11 12:37:50'),
(98, 'Pronunciaiton Les.08', 'Pronunciation Lession 8', 'uploads/file/b8fJquguNUY1FhNK8bT5NpYKyroyGUdohQhSpiKW.mp4', 'mp4', 1, '2023-06-11 12:38:08', '2023-06-11 12:38:08'),
(99, 'Pronunciaiton Les.09', 'Pronunciation Lession 9', 'uploads/file/aJw6PSTdkGHym43uLQ3QJJETW0Q3XyOefFuDVMat.mp4', 'mp4', 1, '2023-06-11 12:38:26', '2023-06-11 12:38:26'),
(100, 'Pronunciaiton Les.10', 'Pronunciation Lession 10', 'uploads/file/CPrhylULhqYO7rKKLW2gwGgq62rdZ5nIOdIG5Rgp.mp4', 'mp4', 1, '2023-06-11 12:38:42', '2023-06-11 12:38:42'),
(101, 'Pronunciaiton Les.11', 'Pronunciation Lession 11', 'uploads/file/b9YQLN7FHX4zlVvdUCRESY5vnc0jTZp3MbqCVImM.mp4', 'mp4', 1, '2023-06-11 12:38:55', '2023-06-11 12:38:56'),
(102, 'Pronunciaiton Les.12', 'Pronunciation Lession 12', 'uploads/file/7ElJjKh7lNhBrgUmUE91uP12M8tn6deYacLl4BNq.mp4', 'mp4', 1, '2023-06-11 12:40:00', '2023-06-11 12:40:00'),
(103, 'Pronunciaiton Les.13', 'Pronunciation Lession 13', 'uploads/file/7Mgc1Axr8GizCdbIbGksp8llcnRzX6UTfp44gJUm.mp4', 'mp4', 1, '2023-06-11 12:40:20', '2023-06-11 12:40:20'),
(104, 'Pronunciation Les.15', '<p>Pronunciation Les.15<br></p>', 'uploads/file/RcIcC1KBrGcKr3RM6l5AL4YMnE8l5nnMavE5IfXw.mp4', 'mp4', 1, '2023-06-18 01:53:54', '2023-06-18 01:53:54'),
(105, 'Pronunciation Les.14', 'Pronunciation Les.14', 'uploads/file/goGZtwPwwWxkq8Uv1KCmAKuEGEojWixXP6VvywTT.mp4', 'mp4', 1, '2023-06-18 01:58:46', '2023-06-18 01:58:46'),
(106, 'Vocabulary Les 1', '<p>Vocabulary Les 1<br></p>', 'uploads/file/mRBlqa2bXaEYKT3qvBkdtNguBp761sw2g2rqa7Xm.mp4', 'mp4', 1, '2023-06-18 02:00:03', '2023-06-18 02:00:03'),
(107, 'Vocabulary Les 2', 'Vocabulary Les 2', 'uploads/file/UOKE10c2TxAeZU6aOfp6tPwDdglZS7xDSEIMnJXI.mp4', 'mp4', 1, '2023-06-18 02:00:19', '2023-06-18 02:00:19'),
(108, 'Vocabulary Les 3', 'Vocabulary Les 3', 'uploads/file/0cvpJWrc7LN2tNjCst8om0zL4kUKrCVFbF3HqevF.mp4', 'mp4', 1, '2023-06-18 02:01:05', '2023-06-18 02:01:05'),
(109, 'Vocabulary Les 4', '<p>Vocabulary Les 4&nbsp;&nbsp;&nbsp;&nbsp;</p>', 'uploads/file/dKcnxJf8cJDAwmmXhuJaRMXyLntvGu4iDuF8dbzi.mp4', 'mp4', 1, '2023-06-18 02:01:18', '2023-06-18 02:01:18'),
(110, 'Vocabulary Les 5', '<p>Vocabulary Les 5&nbsp;&nbsp;&nbsp;&nbsp;</p>', 'uploads/file/fBBW8R4Kq5Dltm9QihlKzVOd4KynlsvoQcFr9JdI.mp4', 'mp4', 1, '2023-06-18 02:01:43', '2023-06-18 02:01:43'),
(111, 'Vocabulary Les 6', 'Vocabulary Les 6', 'uploads/file/xNrgrqFrujq39qx7YsbamM6fq6WXRO7vKHPkyLfb.mp4', 'mp4', 1, '2023-06-18 02:02:05', '2023-06-18 02:02:05'),
(112, 'Vocabulary Les 7', 'Vocabulary Les 7', 'uploads/file/DfvdH2XzD8HfW9YYGV0m2rVrhcyrf6IAQQUZKvPY.mp4', 'mp4', 1, '2023-06-18 02:02:22', '2023-06-18 02:02:22'),
(113, 'Vocabulary Les 8', 'Vocabulary Les 8', 'uploads/file/TJdosbsNkgOPiJ3E6vjgledcgGcbNnNUWP1nCJVQ.mp4', 'mp4', 1, '2023-06-18 02:02:42', '2023-06-18 02:02:42'),
(114, 'Vocabulary Les 9', 'Vocabulary Les 9', 'uploads/file/gdJzG0nw9CXuOqJCPLryLKc1ZneN7np492ozy41n.mp4', 'mp4', 1, '2023-06-18 02:02:58', '2023-06-18 02:02:58'),
(115, 'Vocabulary Les 10', 'Vocabulary Les 10', 'uploads/file/Wfwzt2AJi2tPWN95BYKUKnzrWwpKQlX11t8GcRrk.mp4', 'mp4', 1, '2023-06-18 02:03:19', '2023-06-18 02:03:19'),
(116, 'Vocabulary Les 11', 'Vocabulary Les 11', 'uploads/file/XgwmhJAqIz7tDKf0SUAAlnc7iT643dOTadkvmlR6.mp4', 'mp4', 1, '2023-06-18 02:03:37', '2023-06-18 02:03:37'),
(117, 'Midday 20 Version 2', '<p>Midday 20 Version 2<br></p>', 'uploads/file/9Ngx6RoKtl2Kz2vjzZ5HtUG7Ne6sbVDB2ApKanlK', 'mp4', 1, '2023-06-18 02:51:03', '2023-06-18 02:51:03'),
(118, 'Morning Date 22', '<p>Morning Date 22<br></p>', 'uploads/file/e2Z2602y64u7wU2FjBGanXkrfmTdROu3iq0NBLhJ.mp4', 'mp4', 1, '2023-06-22 13:38:50', '2023-06-22 13:38:50'),
(119, 'Midday 22', 'Midday 22', 'uploads/file/TK9OQXqxjWbJrukPaGsSV5PT9nNfht4vYlQnaPkg.mp4', 'mp4', 1, '2023-06-22 13:48:21', '2023-06-22 13:48:21'),
(120, 'Everning Date 22', 'Everning Date 22', 'uploads/file/aePJu5wPzFjsCaQFSbasN8GaHDOlodCmPUWRi6be.mp4', 'mp4', 1, '2023-06-22 13:48:43', '2023-06-22 13:48:43'),
(121, 'Morning Date 23', '<p>Morning Date 23<br></p>', 'uploads/file/00yNZ0q0FrFVQCn7zVpwo2klB23l5U3bATDqXKCc.mp4', 'mp4', 1, '2023-06-22 13:54:34', '2023-06-22 13:54:34'),
(122, 'Mid date 23', 'Mid date 23', 'uploads/file/l9bRPPRzXVjmoqG3FwMAw7lgDRgeWxbN5kHGgOQL.mp4', 'mp4', 1, '2023-06-22 13:55:07', '2023-06-22 14:45:08'),
(123, 'Everning Date 23', '<p>Everning Date 23<br></p>', 'uploads/file/7cUbfUdXRsGu2wkQJsVQ6t7ytj74h9kPzYBwSqzW.mp4', 'mp4', 1, '2023-06-22 14:24:01', '2023-06-22 14:24:01'),
(124, 'Morning Date 24', '<p>Morning Date 24</p>', 'uploads/file/YLhirKm3qSah2DE3fON5UeMyssBwFcqxwjrUAv7B.mp4', 'mp4', 1, '2023-06-22 14:45:59', '2023-06-22 14:45:59'),
(125, 'Mid Date 24', 'Mid Date 24', 'uploads/file/nhEJs7aJv5Z0MKfv5eNnlpaTxT25jhoUoXHQI7S8.mp4', 'mp4', 1, '2023-06-22 14:46:26', '2023-06-22 14:46:26'),
(126, 'Everning Date 24', '<p>Everning Date 24<br></p>', 'uploads/file/zTaBzUicvm6RFQULaevI1EpsrxeHK985dqdTaGJa.mp4', 'mp4', 1, '2023-06-22 14:48:52', '2023-06-22 14:48:52'),
(127, 'Morning Date 25', 'Morning Date 25', 'uploads/file/5PQXeicmVRbxOsAdt805zq2FhV9jmLUTvRMs2LbJ.mp4', 'mp4', 1, '2023-06-22 14:49:20', '2023-06-22 14:49:20'),
(128, 'Morning Date 26', '<p>Morning Date 26<br></p>', 'uploads/file/6WE2gDgwKb89HOngofHyaK6YX2U5KAaMh2nPMFOU.mp4', 'mp4', 1, '2023-06-22 14:56:50', '2023-06-22 14:56:50'),
(129, 'Everning Date 26', 'Everning Date 26', 'uploads/file/D1LYx6sPqkMInLvT3VXpoEPRHa0sA9GIcRsMRFDN.mp4', 'mp4', 1, '2023-06-22 14:57:23', '2023-06-22 14:57:23'),
(130, 'Date 27 Morning', '<p>Date 27 Morning<br></p>', 'uploads/file/fKdtHbkzHtXyermHr2WcuT5laBO3fJLgvQ3mvtuM.mp4', 'mp4', 1, '2023-06-23 03:42:53', '2023-06-23 03:42:53'),
(131, 'Date 27 Midday', 'Date 27 Midday', 'uploads/file/j4VM0KxWgJwWwmXU5oUMHxt9mJP2BggXW82yCJsx.mp4', 'mp4', 1, '2023-06-23 03:43:56', '2023-06-23 03:43:56'),
(132, 'Date 27 Evening', '<p>Date 27 Evening<br></p>', 'uploads/file/bUDCXEqo2OJr3HxfTLGyF8rHr9PEeyZUwglk0pNa.mp4', 'mp4', 1, '2023-06-24 05:36:48', '2023-06-24 05:36:49'),
(133, 'Date 28 Morning (Updating)', 'Date 28 Morning', NULL, NULL, 1, '2023-06-24 05:38:10', '2023-06-24 05:38:10'),
(134, 'Date 28 Midday (Updating)', 'Date 28 Midday', NULL, NULL, 1, '2023-06-24 05:38:28', '2023-06-24 05:38:28'),
(135, 'Date 28 Evening (Updating)', 'Date 28 Evening (Updating)', NULL, NULL, 1, '2023-06-24 05:39:31', '2023-06-24 05:39:31'),
(136, 'Date 29 Morning', 'Date 29 Morning', 'uploads/file/kWlk0hLrFd005TzORmBEdgVYGP6z2gFFfYWIRdIf.mp4', 'mp4', 1, '2023-06-24 05:40:23', '2023-06-24 05:40:23'),
(137, 'Date 29 Midday', 'Date 29 Midday', 'uploads/file/1VncVQnKAaIMdIYfb7r2xqiFz4GP4urk3InjF2JO.mp4', 'mp4', 1, '2023-06-24 05:40:56', '2023-06-24 05:40:56'),
(138, 'Date 29 Evening', 'Date 29 Evening', 'uploads/file/szr8wJTjPcJNSSsvaXnunqXl0v3QqDGeyuA0QW8G.mp4', 'mp4', 1, '2023-06-24 05:41:54', '2023-06-24 05:41:54'),
(139, 'Date 30 Morning', 'Date 30 Morning', 'uploads/file/zQJqpoykcjhZzIuxXEaMJOzSNb9f48ip5mIEtXBd.mp4', 'mp4', 1, '2023-06-24 05:42:17', '2023-06-24 05:42:17'),
(140, 'Date 30 Midday', 'Date 30 Midday', 'uploads/file/wUH4220h1vBJEHwfntAYtSP47ChzdJW5feSHfu9u.mp4', 'mp4', 1, '2023-06-24 05:43:23', '2023-06-24 05:43:23'),
(141, 'Date 30 Evening', 'Date 30 Evening', 'uploads/file/w3uOkSUQTjMhruLZvQVs9kqsMnZDKVS4aRgEvfi1.mp4', 'mp4', 1, '2023-06-24 05:43:49', '2023-06-24 05:43:49'),
(142, 'Date 31 Morning', '<p>Date 31 Morning<br></p>', 'uploads/file/xsGwY3UUPTyS0BwbfRWlOGdahzupUPczqkD1E2YU.mp4', 'mp4', 1, '2023-06-24 05:44:34', '2023-06-24 05:44:34'),
(143, 'Date 31 Midday', 'Date 31 Midday', 'uploads/file/uVlKnBNIoJyJ0YrkYZOtHHlRkjIMNN92QXa4iuZB.mp4', 'mp4', 1, '2023-06-24 05:45:05', '2023-06-24 05:45:05'),
(144, 'Date 31 Evening', 'Date 31 Evening', 'uploads/file/EPjzZt667nUjwnrtGXRaO4Jokv1kqSYE7QH6fZRZ.mp4', 'mp4', 1, '2023-06-24 05:45:23', '2023-06-24 05:45:23'),
(145, 'Date 32 Morning', 'Date 32 Morning', 'uploads/file/Rx8bJ0vNCYOvew1NDQqk7Zm0lgCMz05BpN0k4I6Q.mp4', 'mp4', 1, '2023-06-24 05:45:54', '2023-06-24 05:45:54'),
(146, 'Date 32 Midday', 'Date 32 Midday', 'uploads/file/7o5zIEowvT3jq0jtZcnakbDK8tAtJC566hzLvEe6.mp4', 'mp4', 1, '2023-06-24 05:46:18', '2023-06-24 05:46:18'),
(147, 'Date 32 Evening', 'Date 32 Evening', 'uploads/file/qvLeReCj6C41CONWcexNd1rhMGjK4R3vjmvL5iIz.mp4', 'mp4', 1, '2023-06-24 05:46:53', '2023-06-24 05:46:53'),
(148, 'Date 33 Morning', 'Date 33 Morning', 'uploads/file/D3pC3RJIh6J8QS1KWP0FgCMQ5g1tpWNvozC6jVor.mp4', 'mp4', 1, '2023-06-24 05:47:15', '2023-06-24 05:47:15'),
(149, 'Date 33 Midday', 'Date 33 Midday', 'uploads/file/Bz8t5RTCVY43bkdZQScwLEdhV5oXj5OTswLyHbmC.mp4', 'mp4', 1, '2023-06-24 05:47:34', '2023-06-24 05:47:34'),
(150, 'Date 33 Evening', 'Date 33 Evening', 'uploads/file/6Ox6MQZdkLM3ajGx62DZedhgWWcGHuGMz8BBnX2s.mp4', 'mp4', 1, '2023-06-24 05:47:53', '2023-06-24 05:47:53'),
(151, 'Date 34 Morning', '<p>Date 34 Morning<br></p>', 'uploads/file/AYgQUEi4GAbj0XvgozFTZkf8hBGhrVmQdeTlDMcH.mp4', 'mp4', 1, '2023-06-24 05:48:26', '2023-06-24 05:48:26'),
(152, 'Date 34 Midday', 'Date 34 Midday', 'uploads/file/IeUQEXRfK0WdeyScp6BOvP14fkhc6tmeLxO5bes7.mp4', 'mp4', 1, '2023-06-24 05:48:55', '2023-06-24 05:48:55'),
(153, 'Date 34 Evening', 'Date 34 Evening', 'uploads/file/PBFVlphO9UO9yCt81Q1uWufFoWvySEaYZe1ZIhg3.mp4', 'mp4', 1, '2023-06-24 05:49:17', '2023-06-24 05:49:17'),
(154, 'Date 26 Midday (updating)', '<p>Date 26 Midday<br></p>', NULL, NULL, 1, '2023-06-24 05:51:33', '2023-06-24 05:51:33'),
(155, 'Date 25 Midday (Updating)', 'Date 25 Midday (Updating)', NULL, NULL, 1, '2023-06-24 05:51:56', '2023-06-24 05:51:56'),
(156, 'Date 25 Evening (Updating)', 'Date 25 Evening (Updating)', NULL, NULL, 1, '2023-06-24 05:52:16', '2023-06-24 05:52:16'),
(157, 'Morning Date 19', '<p>Morning Date 19</p><div><br></div>', 'uploads/file/mHpFB8JgsYAwNv3wakfsWzFfWPKP6Kc1GEOeQ5Bx.mp4', 'mp4', 1, '2023-06-30 01:29:29', '2023-06-30 01:29:30'),
(158, 'Evening Date 18 .2', '<p>Evening Date 18 .2<br></p>', 'uploads/file/63TqQ28etblLE7vhlkQvzpr611C6yJ5Wp8vPZbVN.mp4', 'mp4', 1, '2023-06-30 03:12:27', '2023-06-30 03:12:27'),
(159, 'Date 25 Midday', '<p>Date 25 Midday<br></p>', 'uploads/file/v9cjfMyXk2ErnS5mTomXFIf53g21Y1Qv39kgHTgU.mp4', 'mp4', 1, '2023-07-01 08:17:27', '2023-07-01 08:17:27'),
(160, 'Date 25 evening', 'Date 25 evening', 'uploads/file/TCGnJBFJOGda7LRNSRtlOQz3lCimGwUQ1rUnlwBB.mp4', 'mp4', 1, '2023-07-01 08:17:51', '2023-07-01 08:17:51'),
(161, 'Date 28- Filming yourself', '<p>Date 28- Filming yourself<br></p>', 'uploads/file/Pide2Hh0eXLgpvJ4eIa3jyfxHRNhMUiDlTRxXWyv.pdf', 'pdf', 1, '2023-07-02 07:17:39', '2023-07-02 07:17:39'),
(162, 'Date 35', '<p>Date 35<br></p>', 'uploads/file/hzMKSZPIg3SH9AwBqjFlZ9XH6vb7UGeEgdUke9Za.pdf', 'pdf', 1, '2023-07-14 09:30:09', '2023-07-14 09:30:09'),
(164, 'Morning class 36', '<p>Morning class 36<br></p>', 'uploads/file/BzS2fQa39opRxuZE7yaxsEqeI57JRbaQGYoDgYj2.mp4', 'mp4', 1, '2023-07-14 09:33:54', '2023-07-14 09:33:54'),
(165, 'Midday 36', 'Midday 36', 'uploads/file/nHUx4hKCui3487OmWk0aZNFEetVB206HJYqnT5kI.mp4', 'mp4', 1, '2023-07-14 09:37:22', '2023-07-14 09:37:22'),
(166, 'Evening Date 36', 'Evening Date 36', 'uploads/file/6EknCDpS94aVFC1q93egmfmiVhMYnHlqbelDWqNO.mp4', 'mp4', 1, '2023-07-14 09:37:44', '2023-07-14 09:37:44'),
(167, 'Morning Date 37', 'Morning Date 37', 'uploads/file/uXldpA1PuAAh0ghzNoSenx3pFChv1xU0016wYR8A.mp4', 'mp4', 1, '2023-07-14 09:40:18', '2023-07-14 09:40:18'),
(169, 'Evening Date 37', '<p>Evening Date 37<br></p>', 'uploads/file/66H93PiXEmThfbHpjRcGVG4LqqMEBYbekyb2rRCh.mp4', 'mp4', 1, '2023-07-14 09:41:51', '2023-07-14 09:41:51'),
(170, 'Morning Date 38', '<p>Morning Date 38<br></p>', 'uploads/file/UGV09JUF6Oow3Cw231HuOKN5lyuJ74uKNnzinXOR.mp4', 'mp4', 1, '2023-07-14 09:47:36', '2023-07-14 09:47:36'),
(171, 'Midday 38', 'Midday 38', 'uploads/file/ZbgZDOnLOBDE1JUVR808rxU3l5mNGTKV91DZyDPQ.mp4', 'mp4', 1, '2023-07-14 09:50:40', '2023-07-14 09:50:40'),
(172, 'Evening Date 38', 'Evening Date 38', 'uploads/file/ffriWipKjQIU7rmCRhWlhfgwUKiiQzmZVnvE3y4X.mp4', 'mp4', 1, '2023-07-14 09:51:23', '2023-07-14 09:51:23'),
(173, 'Morning Date 39', '<p>Morning Date 39<br></p>', 'uploads/file/4DbVyPeYfzbRyyCEiKjTVZFx4HttTuUZYIFFFiSc.mp4', 'mp4', 1, '2023-07-14 09:53:41', '2023-07-14 09:53:41'),
(174, 'Date 37 Midday', '<p>Date 37 Midday<br></p>', 'uploads/file/YqGgwPT15PCb6Rm7utX93ETejbmMZ7poHscKB5wX.mp4', 'mp4', 1, '2023-07-16 07:10:40', '2023-07-16 07:10:41'),
(175, 'Day 39 Midday', '<p>Day 39 Midday<br></p>', 'uploads/file/PCUWxyBd2qrwKLoEwIhjDp5PNxQNYCzFY75QGPzc.mp4', 'mp4', 1, '2023-07-23 13:49:55', '2023-07-23 13:49:55'),
(176, 'Date 39 Evening', 'Date 39 Evening', 'uploads/file/vohw22DO5kM8DrHll9GOFX0nUetGLaFuIcq0RPQq.mp4', 'mp4', 1, '2023-07-23 13:50:27', '2023-07-23 13:50:27'),
(177, 'Date 40 Midday', '<p>Date 40 Midday<br></p>', 'uploads/file/8Bbd1RZPt2ahOZp0WP7AZolrdLG3DU5uqk6fkKRc.mp4', 'mp4', 1, '2023-07-23 14:32:46', '2023-07-23 14:32:46'),
(179, 'Date 41 Morning', '<p>Date 41 Morning<br></p>', 'uploads/file/fFaLCHEO7t0Z5dC74RFwvyofjnkh71KkiT8Gychv.mp4', 'mp4', 1, '2023-07-23 14:34:57', '2023-07-23 14:34:57'),
(180, 'Date 41 Evening', 'Date 41 Evening', 'uploads/file/dsGwYDvMGrKP7k92VO7yZ7HjIG6vFNNcZo1aF8uE.mp4', 'mp4', 1, '2023-07-23 14:35:37', '2023-08-03 12:04:39'),
(181, 'Date 40 Evening', '<p>Date 40 Evening<br></p>', 'uploads/file/gAkVdIIzkCCui6aTl9hZKd8qlegxF3durvpMA8ta.mp4', 'mp4', 1, '2023-07-24 01:29:52', '2023-07-24 01:29:53'),
(182, 'Date 41 Midday', '<p>Date 41 Midday<br></p>', 'uploads/file/DPkUSrIwTE7diMFETARMlnGpVgCqu5NgdPHvzlqV.mp4', 'mp4', 1, '2023-07-27 09:25:11', '2023-07-27 09:25:12'),
(184, 'Date 43 Midday', '<p>Date 43 Midday<br></p>', 'uploads/file/rWmzMZKt45iOnTCdBDTjEdU1lU6B3wsXrmuXCtxq.mp4', 'mp4', 1, '2023-07-27 09:47:59', '2023-07-27 09:47:59'),
(185, 'Day 38 Midday', '<p>Day 38 Midday<br></p>', 'uploads/file/5r4DS13WUcvk0iqxHbIr6h4wdBtbklScZm7pIA2t.mp4', 'mp4', 1, '2023-07-27 12:20:17', '2023-07-27 12:20:17'),
(187, 'Date 42 - Filming', '<p>Date 42 - Filming<br></p>', 'uploads/file/Ig0b0Cl2O2AyOazo48tvDsPsEisOFgdnNaXcQIS2.pdf', 'pdf', 1, '2023-07-27 12:40:34', '2023-07-27 12:40:34'),
(188, 'Date 43 Morning', '<p>Date 43 Morning<br></p>', 'uploads/file/0OSB2z7BJHGZYmrM9ylDTSGKTOv12wpEbdi6jcvn.mp4', 'mp4', 1, '2023-07-28 05:03:43', '2023-07-28 05:03:43'),
(189, 'Date 44 Morning', '<p>Date 44 Morning<br></p>', 'uploads/file/TwAfxymgPawHCk2YGgh0lidFpeIGiAiuYk2YPAFs.mp4', 'mp4', 1, '2023-07-31 05:49:13', '2023-07-31 05:49:14'),
(190, 'Date 6 Evening - 02', '<p>Date 6 Evening - 02<br></p>', 'uploads/file/R7fdT4pBMmnuBKk6TqfTVpeN4N2yOJL4bA3Uqqfu.mp4', 'mp4', 1, '2023-07-31 10:14:37', '2023-07-31 10:14:37'),
(191, 'Date 26 Midday', '<p>Date 26 Midday<br></p>', 'uploads/file/W7TRbVHXFll5vNm54QqbH86nClFEUeF8Vya7J0OJ.mp4', 'mp4', 1, '2023-08-05 12:07:16', '2023-08-05 12:07:17'),
(192, 'Date 43 Evening', '<p>Date 43 Evening<br></p>', 'uploads/file/X36kbdAZkqAXbj3cwqHOjOPoNIsgolub106eLT23.mp4', 'mp4', 1, '2023-08-06 07:00:13', '2023-08-06 07:00:14'),
(193, 'Date 49 Midday', '<p>Date 49 Midday<br></p>', 'uploads/file/5itR1YGiYhPqgiwhj1q2Ucy1VbQpWoNkqJdL0p34.mp4', 'mp4', 1, '2023-08-06 11:25:04', '2023-08-06 11:25:05'),
(194, 'Date 50 Midday', 'Date 50 Midday', 'uploads/file/g8Vqfo4IRtdsiF2JqauVENqm0nYLtvPHZcXNJrwq.mp4', 'mp4', 1, '2023-08-06 11:25:59', '2023-08-06 11:25:59'),
(195, 'Day 44 Evening', '<p>Day 44 Evening<br></p>', 'uploads/file/f78XD1j4II5coN9ACuS5JefDM0yUJYxJ0P2qJXyP.mp4', 'mp4', 1, '2023-08-14 06:47:21', '2023-08-14 06:47:21'),
(196, 'Day 45 Midday', 'Day 45 Midday', 'uploads/file/EjX93GO0MGpJrQhvUHEgXM5P5Ds5nfTRw4Fi36fb.mp4', 'mp4', 1, '2023-08-14 06:47:38', '2023-08-14 07:07:14'),
(197, 'Day 44 Midday', '<p>Day 44 Midday<br></p>', 'uploads/file/VuFCIsARwwdxB9huljLgISglhOe2sthxNIKtFt8u.mp4', 'mp4', 1, '2023-08-14 07:01:05', '2023-08-14 07:01:05'),
(198, 'Day 46 Midday', 'Day 46 Midday', 'uploads/file/qB5y58agPZ0ynvD5lkYJD7Mi0yySCsOx6CETvjM9.mp4', 'mp4', 1, '2023-08-14 07:02:48', '2023-08-14 07:02:48'),
(199, 'Day 47 Morning', '<p>Day 47 Morning<br></p>', 'uploads/file/OmqasRVFZsoiX00oXb3GWKodjZyCyCvqtYl6OTNW.mp4', 'mp4', 1, '2023-08-15 02:44:18', '2023-08-15 02:44:18'),
(200, 'Day 40 Morning', 'Day 40 Morning', 'uploads/file/4Ef3thqqj1lalmuHM7Zcv4wEITdX6MWQBvSR0mfL.mp4', 'mp4', 1, '2023-08-15 02:44:33', '2023-08-15 02:44:33'),
(201, 'Day 45 Evening', 'Day 45 Evening', 'uploads/file/0VMs0FJkHYtgskinCUgFLgDf5PtmEMEzNlYdwOLH.mp4', 'mp4', 1, '2023-08-15 02:44:49', '2023-08-15 02:44:49'),
(202, 'Day 45 Morning', '<p>Day 45 Morning<br></p>', 'uploads/file/hPA7XnNTbP1z3YYH1SbAuaWYrRcGfVsikVTiusW2.mp4', 'mp4', 1, '2023-08-15 07:41:02', '2023-08-15 07:41:02'),
(203, 'Day 46 Morning', '<p>Day 46 Morning<br></p>', 'uploads/file/d3YB6QKqLEdHHruztb7U3gc62V3t8CLRu05qHnKU.mp4', 'mp4', 1, '2023-08-16 13:58:03', '2023-08-16 13:58:03'),
(204, 'Day 46 Evening', 'Day 46 Evening', 'uploads/file/I1YjvBpDL8DObFMRm4UlUJ84rKYaUnORjAhuQ0cR.mp4', 'mp4', 1, '2023-08-16 13:58:24', '2023-08-16 13:58:24'),
(205, 'Day 47 Midday', '<p>Day 47 Midday<br></p>', 'uploads/file/DTXkRKw4EwHmDrqWtC3yjWotkbxvAFJHHhaRXn6y.mp4', 'mp4', 1, '2023-08-18 14:35:43', '2023-08-18 14:35:43'),
(206, 'Day 47 Evening', 'Day 47 Evening', 'uploads/file/D6cI32pki98GxAUpLNzo0UFN2id4Aq0Iv8I6ly4a.mp4', 'mp4', 1, '2023-08-18 14:36:07', '2023-08-18 14:36:07'),
(214, 'Day 48', '<p>Day 48</p>', 'uploads/file/B58BpfeFbWqiNDmyZEulWKdqkUgnYj4JH84GjlgJ.pdf', 'pdf', 1, '2023-08-25 12:15:56', '2023-08-25 12:15:56'),
(215, 'Day 49 Morning', '<p>Day 49 Morning<br></p>', 'uploads/file/Y7FZzwaO09JANRizU7dJ1bfKgB44GrphGeK3NMfz.mp4', 'mp4', 1, '2023-08-27 10:31:05', '2023-08-27 10:31:06'),
(216, 'Day 49 Evening', 'Day 49 Evening', 'uploads/file/Hg6Ab6yr7JCbARgwdODT43vr4kf73KOMi2fGNLRx.mp4', 'mp4', 1, '2023-08-27 10:31:25', '2023-08-27 10:31:25'),
(217, 'Day 51 Evening', '<p>Day 51 Evening<br></p>', 'uploads/file/Ar28MoS8tZXf4Yrk1kmIhsQwnOpWjdRzeXFrAedp.mp4', 'mp4', 1, '2023-08-27 11:24:42', '2023-08-27 11:24:42'),
(218, 'Day 55- Filming talking about your job', 'Day 55- Filming talking about your job', 'uploads/file/2DIXAvYVkrCZn5z94SSayKpUtujzc8A96HfbTp1F.pdf', 'pdf', 1, '2023-08-27 11:25:51', '2023-08-27 11:25:51'),
(219, 'Day 51 Midday', '<p>Day 51 Midday<br></p>', 'uploads/file/CC81Ov2yjrgcupU4iaXXTJWqOixojzUqjNzdQZRO.mp4', 'mp4', 1, '2023-08-27 13:10:40', '2023-08-27 13:10:40'),
(220, 'Day 52 Morning', 'Day 52 Morning', 'uploads/file/m1Taa8s87VQlmOH63F6o5sUlPyUVV07v5COKHoAf.mp4', 'mp4', 1, '2023-08-27 13:10:58', '2023-08-27 13:10:58'),
(221, 'Day 53 Morning', '<p>Day 53 Morning<br></p>', 'uploads/file/qPDezFS5Azm3XFJCe1cmUPDqaHbcRp2rcZGQGsL7.mp4', 'mp4', 1, '2023-08-28 06:21:54', '2023-08-28 06:21:54'),
(222, 'Day 50 Morning', '<p>Day 50 Morning<br></p>', 'uploads/file/bc6dmtNJzQPYs2RWGaVOo8OblNnbEJWVNJrpWDUk.mp4', 'mp4', 1, '2023-09-02 03:14:53', '2023-09-02 03:14:54'),
(223, 'Day 50 Evening', 'Day 50 Evening', 'uploads/file/8iyyFj13kDHchO5fjM47i9HVxYJ1lnXoJRNIyxsF.mp4', 'mp4', 1, '2023-09-02 03:15:13', '2023-09-02 03:15:13'),
(224, 'Day 54 Evening', 'Day 54 Evening', 'uploads/file/OPYHNwjVjEZkQVlJvf4nKhMzriDSug5gYXkn18zh.mp4', 'mp4', 1, '2023-09-02 03:15:41', '2023-09-02 03:15:41');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `image_product`
--

CREATE TABLE `image_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `labels`
--

CREATE TABLE `labels` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `255` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `main_categories`
--

CREATE TABLE `main_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `main_categories`
--

INSERT INTO `main_categories` (`id`, `name`, `sequence`, `icon`, `creator`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Tủ lạnh', NULL, 'uploads/maincategory/TW8v0CNDc4Fdcok0ANgGiH6ORIFkkF2IkxUFEfhW.png', '1', 'tu-lanh', 1, '2023-02-07 15:01:15', '2023-02-07 15:01:15');

-- --------------------------------------------------------

--
-- Table structure for table `main_category_product`
--

CREATE TABLE `main_category_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `main_category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_03_04_082108_create_user_roles_table', 1),
(5, '2021_03_10_064759_create_countries_table', 1),
(6, '2021_03_10_064949_create_companies_table', 1),
(7, '2021_03_10_065150_create_cities_table', 1),
(8, '2021_03_10_065241_create_addresses_table', 1),
(9, '2021_03_10_065604_create_main_categories_table', 1),
(10, '2021_03_10_065658_create_categories_table', 1),
(11, '2021_03_10_065734_create_sub_categories_table', 1),
(12, '2021_03_10_070113_create_brands_table', 1),
(13, '2021_03_10_070228_create_colors_table', 1),
(14, '2021_03_10_070322_create_sizes_table', 1),
(15, '2021_03_10_070432_create_units_table', 1),
(16, '2021_03_10_070627_create_products_table', 1),
(17, '2021_03_10_071228_create_images_table', 1),
(18, '2021_03_10_071531_create_statuses_table', 1),
(19, '2021_03_10_071900_create_orders_table', 1),
(20, '2021_03_10_072021_create_carriers_table', 1),
(21, '2021_03_10_072301_create_shippings_table', 1),
(22, '2021_03_10_072513_create_billings_table', 1),
(23, '2021_03_10_072835_create_notifications_table', 1),
(24, '2021_03_10_072953_create_settings_table', 1),
(25, '2021_03_10_073524_create_reviews_table', 1),
(26, '2021_03_14_064352_create_writers_table', 1),
(27, '2021_03_14_064535_create_publications_table', 1),
(28, '2021_03_19_152738_create_vendors_table', 1),
(29, '2021_05_08_233520_create_order_products_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `carrier_id` int(11) DEFAULT NULL,
  `invoice_id` varchar(100) DEFAULT NULL,
  `invoice_date` varchar(100) DEFAULT NULL,
  `delivery_date` varchar(100) DEFAULT NULL,
  `total_discount` double DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `shipping` double DEFAULT NULL,
  `shipping_tax` double DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_code` int(11) DEFAULT NULL,
  `product_name` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `color` int(11) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `tax` varchar(100) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `sku` varchar(100) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `expiration_date` varchar(100) DEFAULT NULL,
  `minimum_amount` varchar(100) DEFAULT NULL,
  `free_delivery` varchar(100) DEFAULT NULL,
  `total_view` varchar(100) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `features` longtext DEFAULT NULL,
  `thumb_image` varchar(100) DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL,
  `slug` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_publication`
--

CREATE TABLE `product_publication` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `publication_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_size`
--

CREATE TABLE `product_size` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_sub_category`
--

CREATE TABLE `product_sub_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `sub_category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_unit`
--

CREATE TABLE `product_unit` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_vendor`
--

CREATE TABLE `product_vendor` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_writer`
--

CREATE TABLE `product_writer` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `writer_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `publications`
--

CREATE TABLE `publications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rattings` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo1` varchar(100) DEFAULT NULL,
  `logo2` varchar(100) DEFAULT NULL,
  `logo3` varchar(100) DEFAULT NULL,
  `watermark_logo` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `city` text DEFAULT NULL,
  `zip_code` text DEFAULT NULL,
  `map` text DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `address1` text DEFAULT NULL,
  `address2` text DEFAULT NULL,
  `city` int(11) DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `serial` int(11) DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `main_category_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `main_category_id`, `category_id`, `name`, `icon`, `creator`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2 cánh', 'uploads/category/5pzLaM5tXta1WiSEZWp4iWkueHrg5DVhzyj7s9lv.jpg', '1', '2-canh', 1, '2023-02-07 15:01:59', '2023-02-07 15:01:59');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT 4,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `address` text DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `first_name`, `last_name`, `username`, `photo`, `phone`, `email`, `address`, `email_verified_at`, `password`, `creator`, `slug`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'Mr.Super', 'Admin', 'super_admin', 'avatar.png', '+880 123654789', 'superadmin@gmail.com', NULL, NULL, '$2a$12$FkUg6OfskzgFf7oyCFL4fuX9w3UTOzltj8ar4EKggAAhXrmv/vKvC', NULL, 'super_admin', 1, 'cCoho3aEQM60kMCF88vwmopceq5NYjvH2rt6nGqJCS1W3fSaMYjEZ7AN5r0q', '2023-02-07 12:54:20', '2023-02-07 12:54:20'),
(2, 2, 'Teacher', 'Admin', 'admin', 'avatar.png', '+880 123654789', 'admin@gmail.com', NULL, NULL, '$2a$12$FkUg6OfskzgFf7oyCFL4fuX9w3UTOzltj8ar4EKggAAhXrmv/vKvC', '1', 'admin', 1, 'j6MnG8FOVVYvUnhfKIFdw8qMHrXCOZLkKk3jGhTZhREhLKr2rarXKXhSFM4A', '2023-02-07 12:54:20', '2023-09-05 00:56:38'),
(3, 3, 'Mr. vua', 'modarator', 'modarator', 'avatar.png', '+880 123654789', 'modarator@gmail.com', NULL, NULL, '$2y$10$TufLu/pJ7hGBtKRDYh8blum52Krfie0ay31MkWTvO.aw9aOGeBHuK', '1', 'modarator', 0, NULL, '2023-02-07 12:54:20', '2023-03-18 10:05:49'),
(4, 4, 'Mr. vua', 'user', 'user', 'avatar.png', '+880 123654789', 'user@gmail.com', NULL, NULL, '$2y$10$lMGWOf9ud7pOuPs2mH.5R..akq5I.nNSpFbt9MtJLQ7m6c1YtLaDS', '1', 'user', 0, NULL, '2023-02-07 12:54:20', '2023-03-18 10:05:35'),
(5, 5, 'Mr. vua', 'subscriber', 'subscriber', 'avatar.png', '+880 123654789', 'subscriber@gmail.com', NULL, NULL, '$2y$10$A3nycBu6E/ydNS0ZalOETO3Sqg0pXu5b2RLTlENqHMKg9ZvzhmTsC', '1', 'subscriber', 0, NULL, '2023-02-07 12:54:20', '2023-03-18 10:05:28'),
(20, 4, 'test', 'dev', 'contact', NULL, '0363264392', 'contact@hubert5555.xyz', NULL, NULL, '$2y$10$iKznuRcknJtmNpepsqBJderapMtJWp1uk2Vnzc.EPF8BdJm1DKxmi', '1', '201063e45a70a1309', 0, NULL, '2023-02-09 01:29:04', '2023-03-18 10:05:21'),
(21, 4, 'test 02', '03', 'thaihoanganh.1990', NULL, '0363108133', 'thaihoanganh.1990@gmail.com', NULL, NULL, '$2y$10$v5F7EwqIf4MGiE5lXNp6d.jfLz9PnFqxpbclidckqqgBcs7kD.t9C', '1', '211063e45dec75ed8', 0, NULL, '2023-02-09 01:43:56', '2023-03-18 10:05:11'),
(22, 4, 'Hồng Ngọc', 'Nguyễn', 'nguyenhongngochd1995', NULL, '0967645797', 'nguyenhongngochd1995@gmail.com', NULL, NULL, '$2y$10$4ARi2Zm.dlCHKe.DfjucX.J01QlOzG7UE6wurd0YsEfvgwn9FczgW', '1', '221063f57a72af790', 1, NULL, '2023-02-22 01:14:10', '2023-03-18 12:09:46'),
(24, 4, 'Giang', 'Lê', 'giangleth04', NULL, '0388556419', 'giangleth04@gmail.com', NULL, NULL, '$2y$10$dVi9DJEf6csAWiqoK91JwenPP9jv92p1O9jxn3n.0c0MSKjLjXa9i', NULL, '241063f783ece068b', 1, NULL, '2023-02-23 14:19:08', '2023-02-23 14:19:08'),
(25, 5, 'Student', '01', 'student01', 'uploads/user/46KIAGtQptqkKwHY4afTwDjb2Vt9KP4Xh7OetZok.png', NULL, 'student01@gmail.com', NULL, NULL, '$2a$12$FkUg6OfskzgFf7oyCFL4fuX9w3UTOzltj8ar4EKggAAhXrmv/vKvC', '1', '2510640bdb7540295', 1, 'NpUzsHv7XCdOol9lPmXn1ZrAQWFv8jAsXFixoUCSB54wnxYfMjIxSleuGzHi', '2023-03-11 00:37:57', '2023-06-08 22:53:35'),
(26, 4, 'Nguyễn', 'Hoài', 'hoainguyenthi18', NULL, '0337839498', 'hoainguyenthi18@icloud.com', NULL, NULL, '$2y$10$MF.e3ohSVZnCAIUvwIg37u6/K5dY3nQLsq21y64cozudfbi6r1o22', NULL, '2610641122368e6d8', 1, NULL, '2023-03-15 00:41:10', '2023-03-15 00:41:10'),
(27, 4, 'Flora', 'Duong', 'Tungdung0601', NULL, '0394671332', 'Tungdung0601@gmail.com', NULL, NULL, '$2y$10$aQYb36bebUOPlEutFPzLAeuPM1jBBFu93KjgXVBtrCq1kGt/HMdfy', NULL, '271064151670762d3', 1, NULL, '2023-03-18 00:40:00', '2023-03-18 00:40:00'),
(29, 5, 'Anh', 'Lê Dũng', 'camcheptuankhoa@gmail.com', 'uploads/user/W70EcD5naCSxj4W6IfVKTwvyIPUoh1aPvct6aBH5.png', '0965272830', 'camcheptuankhoa@gmail.com', NULL, NULL, '$2y$10$m2cR.uYK0e9EdLUex4XAROXSUr0verxQ85FFUdSsCQEP6Z2dfCJHG', '1', '291064152be246871', 1, '9amEwDDldKZN1nl8FPxExDbGDy0JOruun4aZ61pFZQsg3T0RszjgGKvcQMeu', '2023-03-18 02:11:30', '2023-03-18 11:26:10'),
(33, 4, 'Chị', 'Tường Như', 'tuongnhu1999@icloud.com', 'uploads/user/FhUS4iaecmcNGb5s9i6S4lrNzYmdB1BVDkOSEyFT.png', '07038357274', 'tuongnhu1999@icloud.com', NULL, NULL, '$2y$10$9KPe7X/SWf1h0j2gp0h6tulLcd16D/3ao.KFiVrQ8UMuN24jxGbcm', '1', '331064159de8278a3', 1, '7n96D5ZldhDhKufARj4gJc98yOGYm5ei925tuhpt1SPDKlNzOxB7R3lCqSJ7', '2023-03-18 10:18:00', '2023-03-27 02:57:26'),
(34, 5, 'Anh', 'Văn Bình', 'Binhnguyenhue.1999@gmail.com', 'uploads/user/fQbbqTv3d1T3NoTzyeKE2oNDi95aoN0MgMicrnUG.png', '0347557203', 'Binhnguyenhue.1999@gmail.com', NULL, NULL, '$2y$10$YY0Wq1pUPrZayNomBptIPuXXPobR.NDnpVz.6T3Dk7ua7jG5UjgLK', '1', '34106415b6a9598ba', 1, NULL, '2023-03-18 12:03:37', '2023-03-18 12:03:37'),
(35, 4, 'Chị', 'Thuỳ Trang', 'thuytrangvo061983@gmail.com', 'uploads/user/u4wxZMl7Gscv9afTJ4URiVVlFRAXiZDLP86gsonx.jpg', '0909906104', 'thuytrangvo061983@gmail.com', NULL, NULL, '$2y$10$8L6ZUcn8Af1r3fG9Be/Gmu90Ql2OStWqRVo3JZIJqdA5bonqgTHXK', '1', '35106415c2f108b55', 1, 'fRpJYH1IIugYxR12qHO1sa2WOwBVZzMiTNN1Prd5GEMbsn37BFId67T6hsBl', '2023-03-18 12:56:01', '2023-03-27 02:57:06'),
(36, 5, 'Chị', 'Hồng Hạnh', 'Betho.hyuhnh@gmail.com', 'uploads/user/yDUTyp22gU3nAjwKBqJBdZzEqnbUJNdpUzpLOrxf.jpg', '0905194381', 'Betho.hyuhnh@gmail.com', NULL, NULL, '$2y$10$tlnO6qdB1Z2KKeMAvoiiMuPK29aP5KG9y42oAXioIpYS9f0womHP2', '1', '36106415d557e91d6', 1, 'TfrJDUKVpUdGBhuvKXDt0XGshhvDu902JQpHanEpLJxA7cDpDAzdCorKrJvP', '2023-03-18 14:14:31', '2023-03-18 14:14:32'),
(37, 4, 'Chị', 'Tranthanhnhan10122003@gmail.com', 'Tranthanhnhan10122003@gmail.com', 'uploads/user/rHI5J8lGfTold3bsWYjdkx5YsjNo0cwaqkITQlUp.jpg', '0342240590', 'Tranthanhnhan10122003@gmail.com', NULL, NULL, '$2y$10$8TD8dGaya.w3gEBx6pAN4uKRKW34eIrqLXVsDBjH1b6st975bhO2a', '1', '3710641d2e6ea98c6', 1, NULL, '2023-03-24 04:00:30', '2023-08-06 08:29:51'),
(38, 5, 'Anh', 'Đại Nghĩa', 'dainghia210604@gmail.com', NULL, NULL, 'dainghia210604@gmail.com', NULL, NULL, '$2y$10$0i3G6CMaGU.fpyHyMLE17eD6VKtkjKt0wu02Wts1BBSTCUKvfa03y', '1', '381064218dcc8cdf6', 1, NULL, '2023-03-27 11:36:28', '2023-03-27 11:36:28'),
(39, 4, 'chgvhg', 'gjhbhj', 'kutebuk113', NULL, '0857812936', 'kutebuk113@gmail.com', NULL, NULL, '$2y$10$S.ueKX7UATuOMXO.nT0dC.SkXT/0H0N6aPGqaLwPZ/hJcgRYBVHsO', NULL, '39106428366cc851f', 1, NULL, '2023-04-01 12:49:32', '2023-04-01 12:49:32'),
(40, 4, 'Cẩm', 'Nhi', 'camnhi', NULL, '0866185267', 'camnhi@gmail.com', NULL, NULL, '$2y$10$JIkzijPfajDzII4hrYNJyeWE7JhptbnsX1igO3upjTHWlav.LiB6a', NULL, '401064300b9a53971', 1, NULL, '2023-04-07 11:24:58', '2023-04-07 11:24:58'),
(43, 4, 'Chị', 'Loan', 'Loanthao2412@gmail.com', NULL, '0934241289', 'Loanthao2412@gmail.com', NULL, NULL, '$2y$10$eb2BYF4z/0Wz0I7fTTu0VOTYFROQgEuatlJCklJXd5n37uiHRPxXC', '1', '43106435608ea8945', 1, 'ApNHWfissbwWP3Le0vSJY0qZaOIzlWurnhI22TZieXhQzEXcsrRedUwFgh2V', '2023-04-11 12:28:46', '2023-04-12 23:57:14'),
(44, 4, 'Phú', 'Nguyễn', 'phu2387912', NULL, '0916037918', 'phu2387912@gmail.com', NULL, NULL, '$2y$10$X9SEIp.mJHN9F861W/t4M.GoY0L9nMraTNZ6gmSPA7gDpKrJkjUf6', NULL, '4410643ac09f8327c', 1, NULL, '2023-04-15 14:19:59', '2023-04-15 14:19:59'),
(46, 4, 'đỗ', 'hung', 'hungcter01', NULL, '0918912742', 'hungcter01@gmail.com', NULL, NULL, '$2y$10$vGh0w3mJAVAzcA99EjOvxu3O3GU.zvQwZOWgkjVEIzTRKuFZbagY.', NULL, '4610643bc4d463436', 1, NULL, '2023-04-16 08:50:12', '2023-04-16 08:50:12'),
(47, 4, 'Diệu', 'Lại', 'laidieu2509.', NULL, '0933449055', 'laidieu2509.@gmail.com', NULL, NULL, '$2y$10$pRN0rND.edDo4f46jMzHCuchwLwps1op9boi.rbXDLYMEpCPefe0e', NULL, '4710643d1c88d565b', 1, NULL, '2023-04-17 09:16:40', '2023-04-17 09:16:40'),
(48, 4, 'Diệu', 'Lại', 'laidieu25098.', NULL, '0933449055', 'laidieu25098.@gmail.com', NULL, NULL, '$2y$10$sHvO06qLBu9Iuq.BUOEc9.V/CFITSTy9cUX7xqCwj.t0eGUR09iz6', NULL, '4810643d1c99062ee', 1, NULL, '2023-04-17 09:16:57', '2023-04-17 09:16:57'),
(49, 4, 'Uyen', 'Nguyen', 'uyennguyenn1996', NULL, '3468551055', 'uyennguyenn1996@gmail.com', NULL, NULL, '$2y$10$.kcxSFXaOWbFFRbv0ijLG.tEmsjVY2d/mtn5fe4AromUigCJY2IB.', NULL, '4910643da1c2c3852', 1, NULL, '2023-04-17 18:45:06', '2023-04-17 18:45:06'),
(52, 5, 'Chị', 'Huyen Tram', 'hathu682005@gmail.com', NULL, '0396122282', 'hathu682005@gmail.com', NULL, NULL, '$2y$10$JivnFfvsa4N8165CfvljG.GpCd0sgYAu8Y8mdzuJ.N3wQMyAOIpzK', '1', '5210643fbd07f3c0c', 1, '0uvqPq8um81GqvVCgLFxN8jWP9MZgMnOJOmTSWQt3MLNEZPc4JvtRba28i8s', '2023-04-19 09:05:59', '2023-04-19 09:05:59'),
(53, 4, 'Nguyen', 'Anh', 'nttuanh00', NULL, '0396661831', 'nttuanh00@gmail.com', NULL, NULL, '$2y$10$K7Vmc6SI.4otTfb0aRYfzOuFFFPHxJYL.m.AdthwleO9zguFS2lx.', NULL, '5310644497e99f1e9', 1, NULL, '2023-04-23 01:28:57', '2023-04-23 01:28:57'),
(54, 4, 'Chi', 'Nghi Quach', 'baonghi240795@gmail.com', NULL, 'baonghi240795@gmail.com', 'baonghi240795@gmail.com', NULL, NULL, '$2y$10$MbANBXdNMdXgjb7XJqbqFe4bhEAXTKLDV7Ut.akj3NOzTXutoVjny', '1', '54106457bad918452', 1, 'h0MLKvvolQyl9OR39gIyZJFaIivOrtAjg8OtcvyNJ72MO8JYQwfrIEFrY9il', '2023-05-07 13:51:05', '2023-06-01 06:21:57'),
(55, 5, 'Chị', 'Tram Nha sĩ', 'caothuyytramrhm2008@gmail.com', NULL, '0356173996', 'caothuyytramrhm2008@gmail.com', NULL, NULL, '$2y$10$Lx25FI6alU6v0Rumt/R6Bu6CTPt80MCBhvb28QU16KDvlbZpV2XS.', '1', '55106464634abbb69', 1, 'TdwQru9RZOARE4ZxeEmJMNeVG0dTUiU1I16DSic12BkdThIrvCdlZk8zXe7c', '2023-05-17 04:16:58', '2023-07-10 06:50:34'),
(56, 4, 'Hạ', 'Trân', 'hatran130408', NULL, '0924305932', 'hatran130408@gmail.com', NULL, NULL, '$2y$10$4JUcBNAyI3FWds4NbBnDp.e3en23GCBvS0WdMB8UoCMx3FymSlozi', NULL, '561064648d2c3b4df', 1, NULL, '2023-05-17 07:15:40', '2023-05-17 07:15:40'),
(58, 5, 'Chị', 'Gno', 'Diepne2608@gmail.com', NULL, '0776570118', 'Diepne2608@gmail.com', NULL, NULL, '$2y$10$3eJE.Achr6o1bQfLOCFq0.nVxJ8EYau/p7o3s3B65uYc1Ms9U1qiC', '1', '58106478400a54a3f', 1, 'YfrfqovocwTdBD3K22XO4LRp8i7fbRV3YORZptzkXGQmZxp9ZOJW5ayeodzy', '2023-06-01 05:51:54', '2023-06-01 06:00:29'),
(59, 4, 'Nguyễn Đình', 'Quí Nhân', 'Quinhan1234', NULL, '0369955027', 'Quinhan1234@icloud.com', NULL, NULL, '$2y$10$6kU156O6rZCSIMNE.lqAY.xDiVGQQpCq/5LfKyHKpA1iKLh3B/MGC', NULL, '5910647af31c8f69f', 1, NULL, '2023-06-03 07:00:28', '2023-06-03 07:00:28'),
(73, 5, 'Chị', 'Lan Oanh', 'Lanoanh121020@gmail.com', NULL, '1246 289 3955', 'Lanoanh121020@gmail.com', NULL, NULL, '$2y$10$ZfpbUwIQbTUUlemV0bEQ4OwawB6nJhUg0HI6hjnDArMQYkpQmXFCm', '1', '7310647d29b3c7c51', 1, '4WVnlKOccFbVtC2uUd4YiZTxUMG7zzhdQSbpnci7aeqyC8hyYyV5KGu1S2ZO', '2023-06-04 23:17:55', '2023-06-04 23:20:44'),
(74, 5, 'Chị', 'A', 'A121020@gmail.com', NULL, NULL, 'A121020@gmail.com', NULL, NULL, '$2y$10$QT.9S6BteQUFe4Ci.N/9iOR1PGpUqfkaXZRwuH4XseDbc6Wi3muYK', '1', '7410647d697869ed3', 1, NULL, '2023-06-05 03:50:00', '2023-06-05 03:50:00'),
(75, 2, 'Tester', '01', 'tester@gmail.com', NULL, NULL, 'tester@gmail.com', NULL, NULL, '$2y$10$z/zxN9be4yNdR0qBY3OqleZugIAQFW.JMAfUDWmDe6Q4m.FE3Ws3y', '1', '7510647dee3740f69', 1, 'lFFq6R3LOmtmw8mtKkUZvHZdaqyhWRNTxwNozuxrvJ4UhrNkikqhCnkLsrub', '2023-06-05 13:16:23', '2023-08-03 01:26:20'),
(76, 5, 'Huỳnh Hà', 'Ngọc Dung', 'huynhhangocdung240801@gmail.com', NULL, '0931653687', 'huynhhangocdung240801@gmail.com', NULL, NULL, '$2y$10$1uiCq7IvGzn8H57Kvl5JBeNdmj/x2qQh8gIF33x6MuGiKVm.rIE0e', '1', '7610648421c6aafd8', 1, 'Ydr4ZzxSE8tquD7K678Em8ZyyGwghM2Bf6O7KoCxG2S8gtyYX7rbKQUWEPXC', '2023-06-10 06:09:58', '2023-06-10 06:09:58'),
(77, 5, 'Nguyễn', 'Vân', 'camvanvn0212@gmail.com', NULL, '0342624725', 'camvanvn0212@gmail.com', NULL, NULL, '$2y$10$S8ZgIL3kBdZevWRG7KAPw.U7.FfT0W7XZAzHA7C88r7n0dhhD/OpK', '1', '7710648422b60ed4f', 1, 'nI9xCf0y4b0BgUkUWw2qKxoK1PwW9aY3iObftgXSftY4I8gyyb30wtOhXUeI', '2023-06-10 06:13:58', '2023-06-10 06:13:58'),
(78, 5, 'Mỹ', 'Khanh', 'nguyenthimykhanh0999@gmail.com', NULL, '0969990999', 'nguyenthimykhanh0999@gmail.com', NULL, NULL, '$2y$10$sJ9i7uRTm14csghZBBKvd.Hxvl1PhEwi8irx3EdV2Earn/1AE38wC', '1', '7810648423cbd0910', 1, '3VpVGVCqweBwiXBCSifrYuxHUJ5wxEyhqC9q08GPn0tKZS6AKEGvxsftLgM3', '2023-06-10 06:18:35', '2023-06-10 06:18:35'),
(79, 5, 'Rose', 'Rose', 'chautranthimy989@gmail.com', NULL, '0937430293', 'chautranthimy989@gmail.com', NULL, NULL, '$2y$10$QCahixQ8MrC4JDNiNgwN3ONSfV8tLDAl/gAiLtKeVWj.wSaVm9rVm', '1', '7910648424f3594eb', 1, NULL, '2023-06-10 06:23:31', '2023-06-10 06:23:31'),
(80, 5, 'Yến', 'Nhi', 'ynhi29061994@gmail.com', NULL, '0967031823', 'ynhi29061994@gmail.com', NULL, NULL, '$2y$10$Wv2P8duGE4TZmoFnuJ5V1ewjZheRfGs8sg3Ew42wGTDtjSif/47H.', '1', '8010648425361df41', 1, '7xEhuJbASwPehzFsbutVCKpLJGvTJITy3X9H2jd4KQhCI9VrZbHFT3fcFpqH', '2023-06-10 06:24:38', '2023-06-12 07:52:33'),
(81, 5, 'Thanh', 'Ngân', 'thanhngan01012020@gmail.com', NULL, '0764967261', 'thanhngan01012020@gmail.com', NULL, NULL, '$2y$10$ATEr0JzMgGxau97hz55m9OS8WNEh90r75WLdNFBimAsGNsH7oCvi2', '1', '8110648425790a92e', 1, '4fzPEy7Kw6J60lwf8aQKmH0E5mSAnTCCfayd2eU2rJb1rQVlqIeyJCPLK1iC', '2023-06-10 06:25:45', '2023-06-10 06:25:45'),
(82, 5, 'NGO', 'ANH', 'ngoanhpari@gmail.com', NULL, '0906743641', 'ngoanhpari@gmail.com', NULL, NULL, '$2y$10$qd8fMNL/fd4p2HxduNFAZ.o6CBCT8x8ji5imkQjfrx9i0regFzMym', '1', '8210648427aa78426', 1, 'H95qeaU4c95VfHLh5cSbeEkWRAzq9w4393dHMKlClZpxaGnxfLCJ3hKe2aqf', '2023-06-10 06:35:06', '2023-06-10 06:35:06'),
(83, 5, 'Hồng', 'Nhung', 'phannguyenhongnhung042000@gmail.com', NULL, '0349063920', 'phannguyenhongnhung042000@gmail.com', NULL, NULL, '$2y$10$2HOCxV0s8/MbWlRYuyVaMO6bArUdg9GMI8l97XIaMkTzgMG8tk32a', '1', '831064843bfb4ef64', 1, NULL, '2023-06-10 08:01:47', '2023-06-10 08:01:47'),
(84, 5, 'Moni', 'Huynh', 'cat_lovely52@yahoo.com', NULL, '0937234621', 'cat_lovely52@yahoo.com', NULL, NULL, '$2y$10$xzyJXIEPmfC2qXktd6o/nea8Ju4Zb5KS8h6wysCqOzpfvPzj9LQLe', '1', '84106488550f65202', 1, 'ewYwUBBoNFZzWNrmUJ4KaA4eafrko9LHDDagMlrLUTshGMHfntLWpAx6fJOi', '2023-06-13 10:37:51', '2023-06-13 11:07:56'),
(85, 4, 'Linh', 'Truc', 'lehotruclinh25', NULL, '0339547540', 'lehotruclinh25@gmail.com', NULL, NULL, '$2y$10$B9fyhvZ9S3gePDCY6D8Mnuoc5h4t/gtDHIP6QZgS0CgWkvqc0YEgy', NULL, '851064893091c4cc9', 1, NULL, '2023-06-14 02:14:25', '2023-06-14 02:14:25'),
(86, 5, 'Hoàng', 'Anh', 'dinhthihoanganh160680@gmail.com', NULL, '0903612420', 'dinhthihoanganh160680@gmail.com', NULL, NULL, '$2y$10$LcqeRI4Rn4eSaWPXGZI5quJqz5wsYNjClGEfn2vMEc5o5YGb//zMO', '1', '861064898a41aec9e', 1, 'GWP7U9qgwtgzS3aTZBXVfOjqCH8bg4nQoCpUfsLxqWSxhlfMaAnwGHnTQSKa', '2023-06-14 08:37:05', '2023-06-14 08:37:05'),
(87, 5, 'Chị', 'Loan', 'loanlykp@gmail.com', NULL, '0908297888', 'loanlykp@gmail.com', NULL, NULL, '$2y$10$oeUkFIN4gP400MiN4LV8.eJVH1tIE0prMKT38NeetoZ22Re3m3uxy', '1', '871064898a6f94459', 1, 'wh3TEAalzPZD0dKZvnWRlyugfM98UcW3KMP8d5eemMnLgdrYRXA7Mf015N3t', '2023-06-14 08:37:51', '2023-06-14 08:37:51'),
(88, 4, 'Huyền', 'Nữ', 'Tnhuetri@gmail.com', NULL, '0375659795', 'Tnhuetri@gmail.com', NULL, NULL, '$2y$10$CEteBYAhW.2j7rOZTqRwsulDGBI0tuHLh.V1elJR39YyIamSTbEFy', '1', '8810648bbbfca79a2', 1, NULL, '2023-06-16 00:33:48', '2023-06-29 07:49:26'),
(89, 5, 'Đại', 'Thành', 'Daithanh240722@gmail.com', NULL, NULL, 'Daithanh240722@gmail.com', NULL, NULL, '$2y$10$6efe5gGOarE/u1zLa/jmw.vnR2j/vZXnlgKjpjio8Uak3S3Z6QHY6', '1', '8910648d3f828c46c', 1, NULL, '2023-06-17 04:07:14', '2023-06-17 04:07:14'),
(90, 5, 'Anh', 'Hảnh', 'hoantrachqb@gmail.com', NULL, '0869053192', 'hoantrachqb@gmail.com', NULL, NULL, '$2y$10$vKyoc1Oo5bro.5XwpVYlyudSosWrvjNNXwC7Iaaxa8Kaegtk5g.0K', '1', '9010648d43f2c0230', 1, 'fe2v8CGC6DIaWrSxVSwLY9D77R82jqFBcLDu6Z150OS7gzNPaF3BTlvQFhmX', '2023-06-17 04:26:10', '2023-06-18 02:09:16'),
(91, 5, 'Nhu', 'Phuong', 'nhuphuong@telesaenglish.com', NULL, NULL, 'nhuphuong@telesaenglish.com', NULL, NULL, '$2y$10$sreSzZ/XgxHnBggJtbf0muTNGL7FtysxMEzCmMp7nsZM5UVR4pz1a', '1', '911064901f824a183', 1, 'ZcH5eDjMum7Vbi0wGvQBDQ1MxZiLgiKEwgSMAQx9fhQYktKqfhm0W6Qjzw1E', '2023-06-19 08:27:30', '2023-06-19 08:27:30'),
(92, 5, 'Lê Thị', 'Thu Năm', 'lethithuna1804@gmail.com', NULL, '0348539969', 'lethithuna1804@gmail.com', NULL, NULL, '$2y$10$sqRSojiJnFAxxMRU5Kjb1ut1JveABkVkHwzA5bGNHtCDekf0c8aBS', '1', '9210649036d9e6b2d', 1, 'toQOVO4tRz1l9hcirEFX1HIG7ghq5ZFu5gYRfXKoIu3kj52B06xpFW0ohCCP', '2023-06-19 10:07:05', '2023-06-19 10:07:05'),
(93, 5, 'Alex', 'Hoàng', 'Alexhoang2811@gmail.com', NULL, '0985849075', 'Alexhoang2811@gmail.com', NULL, NULL, '$2y$10$xMxYBfUi9AhkPJd5LbmJaO2fP8/4h1lWo.xOVOVZcH.8wRYB2VuFK', '1', '931064915885188ca', 1, 'cNr82il7nZmndVyOT0Dd9vbB3Diy7kwrH9m0JmHioXoKL8yfY3pp10NpWLvd', '2023-06-20 06:43:01', '2023-06-20 06:43:01'),
(94, 5, 'Nguyễn Văn', 'Tâm', 'ngvantamispace@gmail.com', NULL, '0907 449 087', 'ngvantamispace@gmail.com', NULL, NULL, '$2y$10$n8ql0rCam9q/NUKhga8vbOacjjcXpWIDUvExfEWqgTRWFIUKfBCYq', '1', '941064916c97d36a9', 1, 'mQ2Z4FAwMfA5cGbeg8vC2PmDkikVstLXfu6u00qOSNVYreaJhqjtm7hkElJc', '2023-06-20 08:08:39', '2023-06-20 08:08:39'),
(95, 5, 'yunying', 'Yunying', 'yunyingdesign@gmail.com', NULL, '0934029786', 'yunyingdesign@gmail.com', NULL, NULL, '$2y$10$LCyhMXq6g178R5uq8O88vOY3f7Av09wDFZpxZHnWM0AuLW7Tx/G82', '1', '951064952aecdb5ed', 1, 'cUjtyweNkEk1F3IEwlH3TGO3gn5TENDLeaG28rYkvA13qIW1b0CcLW9JDxcf', '2023-06-23 04:17:32', '2023-06-23 04:17:32'),
(96, 5, 'Ngo', 'My', 'Chigia490@gmail.com', NULL, '0986995315', 'Chigia490@gmail.com', NULL, NULL, '$2y$10$kgR8FbFgjIcnMgYEEKqtIOQuaYZxs1pg7Jayrx3L/g.PKViAznK5.', '1', '961064952b450ca22', 1, 'qax5HhaJP5Ly92mYK09lgEiBPiuz3ZwsKv1SOxylW3LqM67ntKKOG2y7rzWR', '2023-06-23 04:19:01', '2023-06-23 04:19:01'),
(97, 5, 'Lê', 'Hoàng Anh', 'hoanganh5dcvl@gmail.com', NULL, NULL, 'hoanganh5dcvl@gmail.com', NULL, NULL, '$2y$10$uHLg3BMYmA/o6dsCwC26Q.6Advy9rOiWYSzMcpmTIVgP5cLwk3C1u', '1', '9710649652feb7d90', 1, NULL, '2023-06-24 01:20:46', '2023-06-24 01:20:46'),
(98, 5, 'Vũ', 'Chính', 'Nhakhoaphuongdong@gmail.com', NULL, '0985366688', 'Nhakhoaphuongdong@gmail.com', NULL, NULL, '$2y$10$p8mlKlEeCslpHAuqQXNcPudg/4ACAIOOpOEq1aJjt3pHBodPzpGfS', '1', '9810649653305bd9e', 1, 'TW09B9MCnsd95qOhaWBnkzpKqLIzjb4EAPMBwPsJOsGUQGMB6aeP3pncJYhB', '2023-06-24 01:21:36', '2023-07-06 02:56:11'),
(99, 4, 'Lê', 'Phương Vy', 'Phuongmai2089', NULL, '0562847890', 'Phuongmai2089@gmail.com', NULL, NULL, '$2y$10$iMHeE43McGApQ4/JQT0UOemtlx3mWaTq5v.8t8i/DWhY3J.tcBM22', NULL, '99106496d20fe68f1', 1, NULL, '2023-06-24 10:22:55', '2023-06-24 10:22:55'),
(100, 4, 'Lê Phương', 'Vy', 'dawngthiphuongmai', NULL, '0562847890', 'dawngthiphuongmai@gmail.com', NULL, NULL, '$2y$10$GwXy3as/EhERC70W8p9exeti1OX.pE0/dOq5wqnAWD.KK6iitemia', NULL, '100106497b6a3f25b0', 1, NULL, '2023-06-25 02:38:11', '2023-06-25 02:38:11'),
(104, 4, 'Thư', 'Minh', 'Nguyenthiminhthu.nqd', NULL, '0966993201', 'Nguyenthiminhthu.nqd@gmail.com', NULL, NULL, '$2y$10$Oj6VeX1j0mLcNdxv/Ca1jujTDh/XZfRJbfgGblnUvZAUP8dBdF0gy', NULL, '104106497fe189b691', 1, NULL, '2023-06-25 07:43:04', '2023-06-25 07:43:04'),
(105, 4, 'Đặng', 'Thị phương mai', 'dawngthiphuongmai.fptshop', NULL, '0962927119', 'dawngthiphuongmai.fptshop@gmail.com', NULL, NULL, '$2y$10$tRnmehDd64pSY.6T0IYM0.DaC5/S2vZM17t5fPUrGlrPlNjSlgi1i', NULL, '10510649832565afdb', 1, NULL, '2023-06-25 11:25:58', '2023-06-25 11:25:58'),
(107, 4, 'Thìn', 'Huỳnh', 'huynhthithuthin1906', NULL, '0962641300', 'huynhthithuthin1906@gmail.com', NULL, NULL, '$2y$10$Cvjlrc/qmZDwjrl4AHMTO.v454vqNY8tHn81VPY1hXO0fIa4n.7Q.', NULL, '10710649b170be4132', 1, NULL, '2023-06-27 16:06:19', '2023-06-27 16:06:19'),
(108, 5, 'Chị', 'Teacher phuong', 'teacherphuong@gmail.com', NULL, '090157586970', 'teacherphuong@gmail.com', NULL, NULL, '$2y$10$B0bjJNDHkTR8ZZS6BYhxKuM1J0bmLla2oKue0iq.lkV84edQ1eNNi', '1', '10810649baeb92e27d', 1, 'RtBdtUzSKFvThFNttcdmiAxL6NbD6jectkeA7b03MbsHePfpBNY351h0WQNZ', '2023-06-28 02:53:29', '2023-06-28 02:53:29'),
(109, 4, 'Ky', 'Doan', 'kykhanhdoan472', NULL, '0764336126', 'kykhanhdoan472@gmail.com', NULL, NULL, '$2y$10$63O7lgTiuO6.iD0hHA5QweQaggASMI93l2r/LV7XdpUkBxUZyap76', NULL, '10910649d0ccc3fffe', 1, NULL, '2023-06-29 03:47:08', '2023-06-29 03:47:08'),
(110, 4, 'Boi Tram', 'Tran', 'boitramtran', NULL, '0888108105', 'boitramtran@gmail.com', NULL, NULL, '$2y$10$vHv471Q9.I8d28/o/tJRVOwwYv0gZRuJjj7HoJMoyboZIMwS.LNkq', NULL, '11010649d70cbb3c85', 1, NULL, '2023-06-29 10:53:47', '2023-06-29 10:53:47'),
(111, 4, 'Boi Tram', 'Tran', 'zoetran.telesaenglish', NULL, '888108105', 'zoetran.telesaenglish@gmail.com', NULL, NULL, '$2y$10$W2xN5ddjnaFt1JslDfVOw.7rOnHcXlnjCllfPUlHK2CKyUWZlP46m', NULL, '11110649d715217765', 1, NULL, '2023-06-29 10:56:02', '2023-06-29 10:56:02'),
(112, 4, 'Thu', 'Ngan', 'Hothungan0708', NULL, '0358188416', 'Hothungan0708@gmail.com', NULL, NULL, '$2y$10$cGRp9mNv74Zd4gSedXn6WeNR1OKsJUr097Ke0RZYzrmknHlDkSjTi', NULL, '11210649e24727fcd1', 1, NULL, '2023-06-29 23:40:18', '2023-06-29 23:40:18'),
(113, 4, 'Linh', 'Ngọc', 'nlinhkt986', NULL, '0981893396', 'nlinhkt986@gmail.com', NULL, NULL, '$2y$10$73/F1bQ2.1H2Pe5uOdr4w.V1SYq1F.tphgZ6x9cHadVYb8rBL9I8e', NULL, '11310649e260eb20e0', 1, NULL, '2023-06-29 23:47:10', '2023-06-29 23:47:10'),
(114, 5, 'Phuc', 'nguyen', 'hanhthi92', NULL, '0395841162', 'hanhthi92@gmail.com', NULL, NULL, '$2y$10$MXtlVJjJAEM15x/4ScVA.O/znDopp4AWeclILHgs1gDYYW2mUAPyu', '1', '11410649f740119038', 1, NULL, '2023-06-30 23:32:01', '2023-07-01 02:00:12'),
(120, 4, 'Trần', 'Linh', 'linhlinh.pm266', NULL, '0762590762', 'linhlinh.pm266@gmail.com', NULL, NULL, '$2y$10$MRzwrGHP9hz1AhUo.JFpBOGR4KW9fy9MEWrFAxtVhpLbGx9l5..I.', NULL, '12010649f7749cdbb1', 1, NULL, '2023-06-30 23:46:01', '2023-06-30 23:46:01'),
(123, 5, 'Anh', 'Ba', 'caubacaonhi73@gmail.com', NULL, '0389898168', 'caubacaonhi73@gmail.com', NULL, NULL, '$2y$10$cOIkyNVKX5SGJzmJuY3m9O3vrFDNU2ucyaJZRfyuhtS29dL/0aUkm', '1', '12310649f936b9c2a9', 1, NULL, '2023-07-01 01:46:03', '2023-07-01 01:46:03'),
(124, 5, 'Coach', 'Tuấn Anh', 'Coachericngo@gmail.com', NULL, '0909481094', 'Coachericngo@gmail.com', NULL, NULL, '$2y$10$ZBGW.inYH9OpsmGMx7uwF.CsA10Z2ZUTEgpBr/D52o3a.JDesEmj2', '1', '12410649f9390e9204', 1, NULL, '2023-07-01 01:46:40', '2023-07-01 01:46:40'),
(125, 4, 'Đoàn', 'Khanh', 'Khanhdoans21140', NULL, '0316080467', 'Khanhdoans21140@gmail.com', NULL, NULL, '$2y$10$ccjEYhdD0OZjJDSlHlGEIuvJlPGDp/axn46kmFdx3FDSz2wwWqJI.', NULL, '1251064a02b1f66443', 1, NULL, '2023-07-01 12:33:19', '2023-07-01 12:33:19'),
(126, 5, 'Duo', 'Jenny', 'myduyenduong030827', NULL, '0408283963', 'myduyenduong030827@gmail.com', NULL, NULL, '$2y$10$MGZpy.Rut6KjnlDARdbDteW6EQQkFYfmR4EYKZTVYMTyJf0UBusNa', '1', '1261064a36a56a6e80', 1, NULL, '2023-07-03 23:39:50', '2023-07-04 23:56:36'),
(147, 4, 'Lê', 'Tâm', 'letam3123', NULL, '0346813293', 'letam3123@gmail.com', NULL, NULL, '$2y$10$UkTELL7wm5GBdhmuEwRO2.ngPAUmdL8Sbib8cZOTL0c.ibTyhp8q2', NULL, '1471064a4311b337d5', 1, NULL, '2023-07-04 13:47:55', '2023-07-04 13:47:55'),
(148, 4, 'Andy', 'Nguyen', 'andynguyen2585', NULL, '0908479495', 'andynguyen2585@icloud.com', NULL, NULL, '$2y$10$ZkfNeoq1hcxBDPTFTIgFfumn2mff8DeeoN5ibdBImuT9yNa6xSFF6', NULL, '1481064a484ca606d6', 1, NULL, '2023-07-04 19:44:58', '2023-07-04 19:44:58'),
(152, 4, 'Tien Tung Nguyen', 'Nguyễn', 'tungcuonganh9', NULL, '0886586588', 'tungcuonganh9@gmail.com', NULL, NULL, '$2y$10$7Mb9qINienZHhpJv333uT.GLEyOtAKU/mglvcbMDiiC.tJw.bP4Uu', NULL, '1521064a4a63c10ae4', 1, NULL, '2023-07-04 22:07:40', '2023-07-04 22:07:40'),
(153, 4, 'Do', 'Thi My Hanh', 'myhanh090686', NULL, '0949661188', 'myhanh090686@gmail.com', NULL, NULL, '$2y$10$0hmeDwawISPBBrUcQXq1UOiyTBAUT7HlczMtOko7LwdJGB2.1tuj6', NULL, '1531064a4aa7c4470c', 1, NULL, '2023-07-04 22:25:48', '2023-07-04 22:25:48'),
(155, 5, 'Phương', 'Thúy', 'thuymp2005@gmail.com', NULL, '0974616367', 'thuymp2005@gmail.com', NULL, NULL, '$2y$10$EVRBvj8.GoS6HZq2Bga1u.pxqlBxNpeRuN8ZMZhsOjyEy1J15Ardi', '1', '1551064a4bf1482dc6', 1, 'zflkLtMuli5XPdtGXrRWqbD39rn7UnvLZDXvogNZ3znm8YfclH9EQ9ezHZtK', '2023-07-04 23:53:40', '2023-07-04 23:53:40'),
(156, 5, 'Huyền', 'Trang', 'Huyentrangul98@gmail.com', NULL, '0343161777', 'Huyentrangul98@gmail.com', NULL, NULL, '$2y$10$kBqt5Pzkp.gI3adBdI1GE.zirpzvbrg8BuGKhKmSmFJ00tLTHP7He', '1', '1561064a4bf380aec2', 1, '7mlkl0BxZCfZwH02Kk8KJ1wLHhm59STg3KTIFS7kGIt4iDHDlAAUBnmiYfgs', '2023-07-04 23:54:16', '2023-07-04 23:54:16'),
(157, 4, 'Minh Như', 'Huỳnh', 'Hminhnhu04', NULL, '0912196178', 'Hminhnhu04@gmail.com', NULL, NULL, '$2y$10$9CEGhR0vC0utbvr0lIJlwOdIc./TbVpboGLSLfDVjN7J4ordJAQDO', NULL, '1571064a4c3a45473c', 1, NULL, '2023-07-05 00:13:08', '2023-07-05 00:13:08'),
(158, 4, 'Nguyễn', 'Ngân', 'ngan.nguyen311298', NULL, '0854752257', 'ngan.nguyen311298@gmail.com', NULL, NULL, '$2y$10$4rBq/kmbMkcJk/6I4Tq3lOyMW3ht69MkYGEPhbHAYnWfdqa2i0Q5W', NULL, '1581064a4ec71d0561', 1, NULL, '2023-07-05 03:07:13', '2023-07-05 03:07:13'),
(159, 4, 'PHAM THAI', 'SON', '17146182', NULL, '0792610954', '17146182@student.hcmute.edu.vn', NULL, NULL, '$2y$10$jNPNNpAPYa8ah7Kfg9kyveMxGRHA42ROWA2I7NgqPLEZX0S71Ve1a', NULL, '1591064a4f79d82204', 1, NULL, '2023-07-05 03:54:53', '2023-07-05 03:54:53'),
(160, 4, 'Yến', 'Mai', 'Mhyen164', NULL, '0928005348', 'Mhyen164@gmail.com', NULL, NULL, '$2y$10$Hh7jSIQvx6BlAuiSokLED.lfMXpYo2r9yB2G/UjwY1LqMuj3IzSKy', NULL, '1601064a51b37b5041', 1, NULL, '2023-07-05 06:26:47', '2023-07-05 06:26:47'),
(161, 5, 'Tran', 'Jimmy', 'jimmytran0704999119@gmail.com', NULL, '0704999119', 'jimmytran0704999119@gmail.com', NULL, NULL, '$2y$10$qoxMav4V4kuAKhLSsKnJG.5.obmcnTcvbdFwvWX8A9exGWLUE81Ay', '1', '1611064a528ed39f7d', 1, 'MyJ2HFOhXBtwxoQnlw7R6UWLxvUaNOked7BkI0icThF3RUcjchVFS9J13yEo', '2023-07-05 07:25:17', '2023-07-05 07:25:17'),
(162, 5, 'Mỹ', 'Thuận', 'Thuanprob14@gmail.com', NULL, '0975841850', 'Thuanprob14@gmail.com', NULL, NULL, '$2y$10$UDRxuuDMuPtYmD4I20ds7ePYQ9t1VVIWkTzR1j5kG3esGZNLjoHH2', '1', '1621064a55f116cde2', 1, 'KAxZqK41nTr8dK3atIr4yQUXs5FrPxFEiu2WKrPnbZTkLXd6wtm8ylJzEmaA', '2023-07-05 11:16:17', '2023-07-05 11:16:17'),
(163, 5, 'Hải', 'Yến', 'zinzinyen352006@gmail.com', NULL, '0971297206', 'zinzinyen352006@gmail.com', NULL, NULL, '$2y$10$bY/.WiwGsx1W2OrPKzCMBO6UBvfwanSEW4GT7HKEuk16IEh5AGXoK', '1', '1631064a55f313256f', 1, 'Qq5yed7zlNc1i7fgMTCweFhby2Z04QgiINyUtUV8a9EEzWbPa7UfUzM15p1Q', '2023-07-05 11:16:49', '2023-07-05 11:16:49'),
(164, 4, 'Diep', 'thanh', 'dieptuyetthanh1082', NULL, '0937560660', 'dieptuyetthanh1082@gmail.com', NULL, NULL, '$2y$10$Dm62MXT66RXj9uVPfy5leeU.NMhvL6aD0wzy6Vzz20QePhVtN7xe2', NULL, '1641064a58397502fe', 1, NULL, '2023-07-05 13:52:07', '2023-07-05 13:52:07'),
(165, 4, 'Thanh', 'Bình', 'lotus.binh', NULL, '0903064180', 'lotus.binh@gmail.com', NULL, NULL, '$2y$10$3e0Lt1TNILZZd2JZmZUZFeMxaY.nqfhlwwxUMpiihGo1S8gvclkE.', NULL, '1651064a5fe5a33d82', 1, NULL, '2023-07-05 22:35:54', '2023-07-05 22:35:54'),
(167, 4, 'Nghia', 'Le', 'Nghiale14', NULL, '0933709784', 'Nghiale14@gmail.com', NULL, NULL, '$2y$10$hYCnbKHR8syLHCbpJL58AO.l/5pR1P3/oByqQmIM8Xdc6VsCRdJqy', NULL, '1671064a604abdb386', 1, NULL, '2023-07-05 23:02:51', '2023-07-05 23:02:51'),
(170, 5, 'Le', 'Cat Tuong', 'lecattuong123456789@gmail.com', NULL, '0938979539', 'lecattuong123456789@gmail.com', NULL, NULL, '$2y$10$I/MOvNQUa0rF0SGaulD06OuXPnsPPAgWHYjqQAJFBBw3yvGQoZs2u', '1', '1701064a619b530a57', 1, 'LW4VRFixdIVsAtQcSpN522cxCPTo6bYt3cgKAld2V9SSaDtHbizzke48oUHs', '2023-07-06 00:32:37', '2023-07-06 00:32:37'),
(171, 3, 'Pham', 'Lien', 'thuylienpham09@gmail.com', NULL, NULL, 'thuylienpham09@gmail.com', NULL, NULL, '$2y$10$LlwK05N/H2lKhcAg3nLJVu1T8wT9kkPGTvcyPND5ZuexBea0Fg80q', '1', '1711064a61c1b59c7b', 1, 'GZSIF11GQxO08jofKiVZIcauvAj2CAi2KubBhYpdgr6tJ89SG0p5sMWmnQ8S', '2023-07-06 00:42:51', '2023-07-24 10:14:58'),
(172, 4, 'Hương', 'Vo', 'lyhuong.a23', NULL, '0775993479', 'lyhuong.a23@gmail.com', NULL, NULL, '$2y$10$A30lMdWPSATJi9nEfFXba.Eu6UWabctHRDKSBGBDz2kP1NtraeACu', NULL, '1721064a77101a5a2f', 1, NULL, '2023-07-07 00:57:21', '2023-07-07 00:57:21'),
(173, 4, 'Trang', 'Pham', 'phamhuyentrang3010', NULL, '0789464522', 'phamhuyentrang3010@gmail.com', NULL, NULL, '$2y$10$lo9w8G5xvdtyG3a7tq3tvuXiDoOkbUvS6q4/lHenmY/gV6do4w0kW', NULL, '1731064a7fc2e2348f', 1, NULL, '2023-07-07 10:51:10', '2023-07-07 10:51:10'),
(174, 4, 'Trần Thị Ngoc Thuyên', 'Thi Ngọc Thuyên', 'thuyenttn.hr', NULL, '0987972970', 'thuyenttn.hr@gmail.com', NULL, NULL, '$2y$10$9fujdpt7MIzUgFLRDda6fu/.ceoLwLn9XEqpolfmgvXA92wBaWWAq', NULL, '1741064a81a4c108c4', 1, NULL, '2023-07-07 12:59:40', '2023-07-07 12:59:40'),
(175, 5, 'Vu Trieu', 'Nhung', 'vutrieunhung@gmail.com', NULL, '07026835743', 'vutrieunhung@gmail.com', NULL, NULL, '$2y$10$t/NFh81MeAnKn0LZTIvOUuSrHdkZ4gndJVsTp2jKIeH0l6CWPNOA.', '1', '1751064a8296c30eb0', 1, 'A8F7LblOuyicLlMGqPQZXQ3HsWPYW1nTDI8BlpskQsEqz2myRsytIuaa0D6w', '2023-07-07 14:04:12', '2023-07-07 14:04:12'),
(176, 5, 'Phạm Yến', 'Vy', 'phamyenvykkt@gmail.com', NULL, '094.636.0057', 'phamyenvykkt@gmail.com', NULL, NULL, '$2y$10$Ag8SVMvdI/lXA8Bjuag0O.ddhw/x/TagqXrTcDnNc8Pp8eP8pzcHW', '1', '1761064a8f6e239ee2', 1, NULL, '2023-07-08 04:40:50', '2023-07-08 04:40:50'),
(177, 4, 'Trung', 'Nguyen', 'trungst', NULL, '0908002299', 'trungst@gmail.com', NULL, NULL, '$2y$10$oo094oADMD0/bFwwVNedd.wNx6AVGwrB4mlYJlodF/cg/jR4TlGly', NULL, '1771064a9460e699de', 1, NULL, '2023-07-08 10:18:38', '2023-07-08 10:18:38'),
(178, 4, 'Vì Hoa', 'Diep', 'thuysinhhoa13', NULL, '3366093966', 'thuysinhhoa13@gmail.com', NULL, NULL, '$2y$10$TmhnM33144ROIJXB5dJ7KevwH1wZf9PZN.ugO9lESb3iqKB0bfUuO', NULL, '1781064a9bfabaac9e', 1, NULL, '2023-07-08 18:57:31', '2023-07-08 18:57:31'),
(180, 4, 'Bui', 'Quynh', 'buinguyetquynh', NULL, '0366111828', 'buinguyetquynh@gmail.com', NULL, NULL, '$2y$10$qtT8BBWTxIJRsVBe9HKsN.Q8q.NUJ.a9llqmgIoh3gd/w6CiLZRru', NULL, '1801064a9f32e42055', 1, NULL, '2023-07-08 22:37:18', '2023-07-08 22:37:18'),
(182, 4, 'Hà', 'Nguyễn', 'hantt254', NULL, '0934047918', 'hantt254@gmail.com', NULL, NULL, '$2y$10$mwQ8lEaBWoRuq8oExbsLlO6e3tR10yAbY62JNBbm64R2EiKjqo7Am', NULL, '1821064aadf8c6e757', 1, NULL, '2023-07-09 15:25:48', '2023-07-09 15:25:48'),
(183, 4, 'Long', 'Nguyễn', 'Longtiger6868', NULL, '0968074639', 'Longtiger6868@gmail.com', NULL, NULL, '$2y$10$/7uejWHoZKOCocv2wP0jJO5mLobkGLq8nZIeFrCqO/PHzq48nD7qm', NULL, '1831064aaefb93f4b2', 1, NULL, '2023-07-09 16:34:49', '2023-07-09 16:34:49'),
(184, 4, 'Khong', 'Tu Quynh', 'khongtuquynh@telesaenglish.com', NULL, '0973005543', 'khongtuquynh@telesaenglish.com', NULL, NULL, '$2y$10$0hSD5aMQhD/7aX.5A40K2ebD6L1JeD43xHkv/W1mqUf2GFv5h/T7W', '1', '1841064ab7c05316e9', 1, 'IdRwZhhOBmjG6GpfIAgfYb3ZwmLPFbCxZSzI711AcI2kuf696FG6bwnbikpE', '2023-07-10 02:33:25', '2023-07-23 03:26:23'),
(185, 4, 'Nguyễn Thị Như', 'Thảo', 'haithao299', NULL, '0979415640', 'haithao299@gmail.com', NULL, NULL, '$2y$10$1lOvnJnSPPRYL1y0687T1eJ33XyzizGZrG56SC82hq0z1s2E54wa6', NULL, '1851064aba548d3301', 1, NULL, '2023-07-10 05:29:28', '2023-07-10 05:29:28'),
(186, 5, 'Miki', 'Hà', 'Ha.oatside@gmail.com', NULL, '0902526023', 'Ha.oatside@gmail.com', NULL, NULL, '$2y$10$BEwtZq5a6W5OP6mOyjxGzevjPif/5T1R6rGbcO1LjlU1c6isjHL/S', '1', '1861064abacbb39af1', 1, NULL, '2023-07-10 06:01:15', '2023-07-10 06:01:15'),
(187, 4, 'NGUYEN', 'LIEN', 'ngocliencnshe', NULL, '0963859014', 'ngocliencnshe@gmail.com', NULL, NULL, '$2y$10$/tnO.ENiYWB5gx288OBVn.KvXDGETjSaNA1bsixUHrN0sexRJhwMu', NULL, '1871064abbda2bd28c', 1, NULL, '2023-07-10 07:13:22', '2023-07-10 07:13:22'),
(188, 5, 'Le', 'Katrina', 'thuy.an.lucbinh@gmail.com', NULL, '+6583491900', 'thuy.an.lucbinh@gmail.com', NULL, NULL, '$2y$10$Duk9oaQw4VQZhWYeab1jKO0R7WavlwUgvQLf2zxaLKpwO4cQV5jAK', '1', '1881064ac010caf868', 1, 'GvsXNTGwaP6CIbajzf2Vr4LBsdkcNYoDg8BgqnqfdGKQn7YP1MftQZVxvOQY', '2023-07-10 12:01:00', '2023-07-10 12:01:19'),
(189, 5, 'Uyen', 'Linh', 'linda1121974@gmail.com', NULL, '6822303500', 'linda1121974@gmail.com', NULL, NULL, '$2y$10$s8VqN.4jGWkF7E4De24ClOyDqB8VIa7njXewSuwJTPJD02PBWvBNa', '1', '1891064acc688839d4', 1, 'nUtpwa2WJdof9Q8H67fpqjHCTExtkxwVsWBytYbJiR0UoSOxxwQV96HZjgdL', '2023-07-11 02:03:36', '2023-07-11 02:03:36'),
(190, 5, 'Kim', 'Tuyen', 'hkt280401@gmail.com', NULL, '0708274021', 'hkt280401@gmail.com', NULL, NULL, '$2y$10$ZbbQplmJ9I3B20vHU4vEVOCeQkTzdZvznG4k5nWpmW9S/ss.70gey', '1', '1901064acc6aea2790', 1, 'gjCVmyim50vC7swE4ZG1mJGakYxr2a5VhCuvaSqbv1J3KLw1QVNL5dPuiqLj', '2023-07-11 02:04:14', '2023-07-11 02:04:14'),
(191, 5, 'Le', 'Thao Trinh', 'lethaotrinh01@gmail.com', NULL, '0785525348', 'lethaotrinh01@gmail.com', NULL, NULL, '$2y$10$/IPGaf27Nw6NeWYk7xjS9.nUF4pjBd3ovAglqzlG3sYPTAAEuCZue', '1', '1911064acf13c36f95', 1, 'XDYZ2lVddliItN7ZIkHoFCKdqVebS5DQiH0ujRHf4YscW89vS6W9TUuMBrtZ', '2023-07-11 05:05:48', '2023-07-11 05:05:48'),
(192, 4, 'Nguyễn', 'Oanh', 'oanhngu1991', NULL, '0274397109', 'oanhngu1991@gmail.com', NULL, NULL, '$2y$10$krKCE3xMfPNXFgr54Um5VOcPyEeg206knFjIpbGEQZA77ZbGE3l6e', NULL, '1921064ad2488cda8b', 1, NULL, '2023-07-11 08:44:40', '2023-07-11 08:44:40'),
(193, 5, 'Như', 'Ý', 'nguyenthinhuy8a5nqt@gmail.com', NULL, NULL, 'nguyenthinhuy8a5nqt@gmail.com', NULL, NULL, '$2y$10$tE3A.KpPaHbCpZxPsUSjV.e4gIaD2acew0hMtQC86AsJCbHmqfMAW', '1', '1931064ad38be905ec', 1, 'SunKkMiPcYNRuARtB9YbEdQKkUhxagchJ2g3irZP2eziONYt58nb5ttIWiFg', '2023-07-11 10:10:54', '2023-07-11 10:10:54'),
(194, 4, 'Đinh', 'thị Quang anh', 'ghetahnha', NULL, '0769358885', 'ghetahnha@gmail.com', NULL, NULL, '$2y$10$2Yj01Fb84RGi2gvS9yscxOZrGsEnHP6.pRXKYW5s6Qtn8YXZmZ72S', NULL, '1941064ae341c5f15f', 1, NULL, '2023-07-12 04:03:24', '2023-07-12 04:03:24'),
(195, 5, 'Phuong', 'Thao', 'luongthiphuongthaovt@gmail.com', NULL, '0389896271', 'luongthiphuongthaovt@gmail.com', NULL, NULL, '$2y$10$IidCHTrfW7.H2eyTJ7nghuwscCxH9NtuUQWt5SuLq9WNwincAbHQW', '1', '1951064ae73a1af8d6', 1, '1Jm4FkA9IFQMluAG0nIv909pwpLYO99xNb2DA2jhAoJuQZC1D9xSBvWbPDNL', '2023-07-12 08:34:25', '2023-07-12 08:34:25'),
(196, 5, 'Nguyen', 'Tuoi', 'nguyenthituoisang.ng@gmail.com', NULL, NULL, 'nguyenthituoisang.ng@gmail.com', NULL, NULL, '$2y$10$.Bpgq9R36VaxZJ8SN.FWXOMFUYl5VsGbrqKudMPMDtQ0YnG/ic2te', '1', '1961064b0d82b5dd25', 1, 'yPbk3I1V9DnRabR5XzsqN9t5KoO3XnVvdrYk8a8USIxljVn1x8kVXnKUOktY', '2023-07-14 04:07:55', '2023-07-14 04:07:55'),
(197, 4, 'Quyên', 'Nguyễn', 'sygia557', NULL, '0703300003', 'sygia557@gmail.com', NULL, NULL, '$2y$10$b3O9gR2lzz1Hx5Gvod2XJOvhn1B3WBcFHmsh8JStAcTwP1t/7Vt.G', NULL, '1971064b12a29a8d6d', 1, NULL, '2023-07-14 09:57:45', '2023-07-14 09:57:45'),
(198, 4, 'Giau', 'Nguyen', 'Ngocgiau19891989', NULL, '0777025787', 'Ngocgiau19891989@gmail.con', NULL, NULL, '$2y$10$0ffoMjefPL/fpnJYAns.FOS7crW3R3FvIV1wXJMY.BLeCXucDZp8i', NULL, '1981064b12a2bca799', 1, NULL, '2023-07-14 09:57:47', '2023-07-14 09:57:47'),
(199, 4, 'An', 'Vo', 'An.vo0204', NULL, '0949485539', 'An.vo0204@gmail.com', NULL, NULL, '$2y$10$00QONBX2If.grJudcAEY.uC5PvxVIXTnnBILSz6Na2GQ980bWi1I2', NULL, '1991064b2579168ac7', 1, NULL, '2023-07-15 07:23:45', '2023-07-15 07:23:45'),
(201, 4, 'Tram', 'Bui', 'buithibichtram04111992', NULL, '0858125157', 'buithibichtram04111992@gmail.com', NULL, NULL, '$2y$10$sROuOg048GEUiZXnYbozM.WnP4nbqc9RUM3MptX6N1JWz0uZdZWuK', NULL, '2011064b26ad56d72d', 1, NULL, '2023-07-15 08:45:57', '2023-07-15 08:45:57'),
(203, 5, 'Manh', 'Tuan', 'Tuantellu@gmail.com', NULL, '0916243638', 'Tuantellu@gmail.com', NULL, NULL, '$2y$10$jhRuhvjk6iHVuR5F41fKSeU9BLkEu80jOiLSl.LOMnQTTTtXHWuQW', '1', '2031064b36ece4add9', 1, 'mErPCLFpKBqxGznjAAuCG11uvCL20hB3hgze2XYWQRg7aqS2WnoK7JBzInPB', '2023-07-16 03:15:10', '2023-07-16 03:15:10'),
(204, 5, 'Phương', 'Ngọc', 'hophuongoc@gmail.com', NULL, NULL, 'hophuongoc@gmail.com', NULL, NULL, '$2y$10$rYcPQFd6HCepYgGcQzhnruU5EvhTtc.12.BH1MQSU54b3DUv7TUYa', '1', '2041064b3849f0af9f', 1, 'UEl6G6gfs1mIZHS9wgwLMwPrjOTAdQ63KDmAE6PyZHIxOvDjs63OXRTkxMnI', '2023-07-16 04:48:15', '2023-07-16 04:48:15'),
(205, 5, 'Bui', 'Nhung', 'nhungbt1711@gmail.com', NULL, '0987373575', 'nhungbt1711@gmail.com', NULL, NULL, '$2y$10$7QeGucwtYc7/dzKhqG46ouNrLiqdPq.uIhUf3MAaakOu3Nl5eaRJS', '1', '2051064b50df919014', 1, 'TfoPjBDftxqDIkgPo6kqZwus7aOSvCw3sicd8r2RuK9SKm7jzAPltbVzVUcw', '2023-07-17 08:46:33', '2023-07-17 08:46:33'),
(206, 4, 'Loc', 'Nguyen', 'nhloc87.ct', NULL, '0838757555', 'nhloc87.ct@gmail.com', NULL, NULL, '$2y$10$dX31mG4PZGOTVWsaKARPMuQlxBNjPyYUzfXs6ArXizA/kbvhUBSqW', NULL, '2061064b516f6a6556', 1, NULL, '2023-07-17 09:24:54', '2023-07-17 09:24:54'),
(207, 5, 'Su', 'Hao', 'Tranchauquynhthu.gl@gmail.com', NULL, '0985622643', 'Tranchauquynhthu.gl@gmail.com', NULL, NULL, '$2y$10$GQTxAekEuzwIjJrIwZAWDui1y7c62Bm7FSE4ONGyLxbD/YLSRA.e.', '1', '2071064b66ce468c80', 1, NULL, '2023-07-18 09:43:48', '2023-07-18 09:43:48'),
(208, 5, 'Le', 'Mina', 'mina.le1527@gmail.com', NULL, '0858125157', 'mina.le1527@gmail.com', NULL, NULL, '$2y$10$jGu0o5aAyizWLUTM.FoKgeo6fOuCll18wIJUz5DrZmlrUanEhcVwK', '1', '2081064b8a617197a4', 1, 'VhJpAWXyCEy4AoJ7gjZnWTBFZsxHqWhG08oDzAJ5i7wGDpgnLu1jaEScKD84', '2023-07-20 02:12:23', '2023-07-20 02:12:23'),
(209, 5, 'Thu', 'Truong', 'thutruong1712@gmail.com', NULL, '0945402522', 'thutruong1712@gmail.com', NULL, NULL, '$2y$10$3lh1KNmn3BfqK8Yi.SzwFebcsH2hkp/MckQ51wWEuCYd.OTlGHyd6', '1', '2091064b8c707cacd9', 1, 'higUfVTrASRf5axmo3L2sh1DCLVnS19Wwzo2SEpQ0Ot83XcC1x2eHW1Y7ovP', '2023-07-20 04:32:55', '2023-07-20 04:32:55'),
(210, 4, 'Lê', 'Thị Hoa', 'thinghiale62', NULL, '0399957529', 'thinghiale62@gmail.com', NULL, NULL, '$2y$10$z5FqQRPY1UtqAm2ANTM0MuVGIOCLnoS4zi3NSEzXbe3dVpFKklm7W', NULL, '2101064b921e7049fe', 1, NULL, '2023-07-20 11:00:39', '2023-07-20 11:00:39'),
(211, 4, 'Nbao', 'Qw', 'nbao8949', NULL, '0397748274', 'nbao8949@gmail.com', NULL, NULL, '$2y$10$FfpTdphLusHdnGrGVtLX1e8sSCBVfpwN5PH7425erU0yoJWR2FaKS', NULL, '2111064b9565305baf', 1, NULL, '2023-07-20 14:44:19', '2023-07-20 14:44:19'),
(212, 5, 'Nhat', 'Le', 'dinhnhatle.hp@gmail.com', NULL, '0904093357', 'dinhnhatle.hp@gmail.com', NULL, NULL, '$2y$10$/JrFL1BQFAWpDchveEI3wOVvIuyngkl/HrNy5cfvAvGtn2MCcqR5e', '1', '2121064b9e1a91b2a6', 1, 'UxFVNJpxnRogc2RVxLrIvmBvqVtwIj5dMpTHTZDsV9rIYGlsFD9pHvdArsQ9', '2023-07-21 00:38:49', '2023-07-21 00:39:18'),
(213, 4, 'Thảo', 'Nguyễn', 'ntpphuongthao99', NULL, '0786133374', 'ntpphuongthao99@gmail.com', NULL, NULL, '$2y$10$0yorU5KjnvOZWcPQ8zhGq.4NY5LHGKuyDnebq49yfPZhJEiyGGYCq', NULL, '2131064bb5533b1462', 1, NULL, '2023-07-22 03:04:03', '2023-07-22 03:04:03'),
(214, 5, 'Hoai', 'Linh', 'Hoailinh30121997@gmail.com', NULL, '0928199616', 'Hoailinh30121997@gmail.com', NULL, NULL, '$2y$10$EyUGXlpuuXwczKXrzHH0seyPPQEH/FDro6Oaep/cH/WNjEtHJmlS6', '1', '2141064bb6cb4b1c96', 1, 'TSLzmay2da6u28LblqWgoK0r1Itn2f3woHrdQCDevUtLo8KgI9aLiClVYWiu', '2023-07-22 04:44:20', '2023-07-22 04:44:20'),
(215, 5, 'Thắng', 'Võ', 'hoangthang020805', NULL, '0378789682', 'hoangthang020805@gmail.com', NULL, NULL, '$2y$10$gVCGMefzzJsL2/RLb2MlqOwWxnGkIUWQsy9AJo46dq8M3gOpE2bf2', '1', '2151064bbff72e8c6a', 1, 'FeH3GqatfsReUppzvpzcSzny3GzS7Jjn6fKF3qRBDk8BPWnjHd0lNLUswBoM', '2023-07-22 15:10:26', '2023-07-26 12:18:53'),
(216, 4, 'Thảo', 'Thành', 'huongnguyenbg1508', NULL, '0346340248', 'huongnguyenbg1508@gmail.com', NULL, NULL, '$2y$10$iP0jEz4N4sSd127ufCMaau7x60eiZxDeeh75ytPzzq2UkcX9jUmPm', NULL, '2161064bc8642000a9', 1, NULL, '2023-07-23 00:45:37', '2023-07-23 00:45:38'),
(217, 4, 'Thảo', 'Thành', 'huongnguyenbg1508', NULL, '0346340248', 'huongnguyenbg1508@gamil.com', NULL, NULL, '$2y$10$BZjgyTxFF48jIcEXxER18euPpNefENqM6L3rdxAfXeWMmz744VJQe', NULL, '2171064bc86951ac1e', 1, NULL, '2023-07-23 00:47:01', '2023-07-23 00:47:01'),
(218, 5, 'Anh', 'Kiet', 'caoanhkiet2910@gmail.com', NULL, NULL, 'caoanhkiet2910@gmail.com', NULL, NULL, '$2y$10$1p9Ebg3eHsx4Xu7xVleg0OL6jZN.QgmLNWgwY1/P8n3Y0f3Bek91K', '1', '2181064bc8dfae081c', 1, 'T7kY11TPuxUa9PjXeeV2FNtbZnmPDhWPJEMcrqFHuGcwcZ2rP5nQxtzmNuhm', '2023-07-23 01:18:34', '2023-07-23 01:18:34'),
(219, 5, 'Kim', 'Hue', 'Kimhuele060897@gmail.com', NULL, '0931615719', 'Kimhuele060897@gmail.com', NULL, NULL, '$2y$10$1Vm6YHgBBAmamPMzvC/D9uvk2EiBjW/Z358xUhjbRMI5rMlYmdXc6', '1', '2191064bca8feb29bc', 1, 'BCWlMbvpXygEDeKmcBq4RhUzr4nr2Jm8JknwfxcYEf2bZeBSgPWAYp57c4wC', '2023-07-23 03:13:50', '2023-07-23 03:13:50'),
(220, 5, 'Minh', 'Hue', 'minhhue1812@gmail.com', NULL, '0965593763', 'minhhue1812@gmail.com', NULL, NULL, '$2y$10$p.lwSTpkVhEfdJB6H3TDj.tZVBmHp9z6bTugsmcLJ2TXmcvjDuJFG', '1', '2201064bcd743aa7d1', 1, NULL, '2023-07-23 06:31:15', '2023-07-23 06:31:15'),
(221, 4, 'Hiền', 'Trần', 'hitasol1111', NULL, '0858979843', 'hitasol1111@gmail.com', NULL, NULL, '$2y$10$s/Xk.bDK6wjcWapXwsmR4uBWPMfj0g1Z2BFQOSrMmnOMPBMAa0VDi', NULL, '2211064be190226f7d', 1, NULL, '2023-07-24 05:24:02', '2023-07-24 05:24:02'),
(222, 5, 'Cong', 'Vinh', 'ncvinh37@gmail.com', NULL, '0347703607', 'ncvinh37@gmail.com', NULL, NULL, '$2y$10$vzr9JeJTXnSPMGtPWyAVteCdc/hBbOkUQbscjLqz5bJZf7fCKipmi', '1', '2221064be50ebb70df', 1, 's7BmU12polBAV2z6jad5kLcgx0dpWGZK0d209zQLST1rX7lVak9M1LKjGoB5', '2023-07-24 09:22:35', '2023-07-24 09:22:35'),
(223, 5, 'Thu', 'Ha', 'Maimoi4291@gmail.com', NULL, '0975097613', 'Maimoi4291@gmail.com', NULL, NULL, '$2y$10$jRUOaRtWxd0SJArMssXwbefCGf1we/L2CDcdZLQpyciAhRx1iz4ki', '1', '2231064be72d1e9458', 1, NULL, '2023-07-24 11:47:13', '2023-07-24 11:47:13'),
(224, 2, 'Teacher01', 'test', 'teacher01@gmail.com', NULL, NULL, 'teacher01@gmail.com', NULL, NULL, '$2y$10$fKCmN9bRn.Sct/HRxb96HO5dKHdvQ.fRjd32wh3RywJsZmdz1o7m.', '1', '2241064bfd2bedd6f2', 1, NULL, '2023-07-25 12:48:46', '2023-07-25 12:50:20'),
(225, 5, 'Tai', 'Linh', 'dangthitailinh@gmail.com', NULL, '0393832872', 'dangthitailinh@gmail.com', NULL, NULL, '$2y$10$orIkq/qQwNKGnInBepo0BO4BH/Oe8wLIiKb7WAiJoboDe/ZP.3j9a', '1', '2251064c1167323094', 1, '1Q54G5bWmJ9McD6k0RMoUiCeE8VLwJT2KcRckbqxJHelng11B2RG4qVdIIyA', '2023-07-26 11:49:55', '2023-07-26 11:49:55'),
(226, 4, 'Tài', 'Chí', 'Truongchitai', NULL, '0389964686', 'Truongchitai@gmail.com', NULL, NULL, '$2y$10$D9Op1f5PF3v1vO52GFB5QuxA2Ck7Nk1ZKe13zvDUizQA3rf.55hnu', NULL, '2261064c1c465a6330', 1, NULL, '2023-07-27 00:12:05', '2023-07-27 00:12:05'),
(227, 5, 'Hoang', 'Anh', 'hoanganh0202.vn@gmail.com', NULL, '0961815059', 'hoanganh0202.vn@gmail.com', NULL, NULL, '$2y$10$ftiwWe9xYuoTVtHfMqqaGud8k.0Lo9m2YVDqFV0ozFl3eOGNLVxF2', '1', '2271064c21a0d57657', 1, 'NeiCuhRIT3u8AWac3FzvOBMqc3K8jnZaCrMDLYYUKN5Tg6aoUSVAhnp0IQp4', '2023-07-27 06:17:33', '2023-07-27 06:17:33'),
(228, 5, 'Phan Van', 'Ben', 'phanvanben1965@gmail.com', NULL, '08064317262', 'phanvanben1965@gmail.com', NULL, NULL, '$2y$10$Zk3t8M2faFEdEz5WfJrFzO7uGaK.HaH6Q5YoS1kvIGceESsJe5say', '1', '2281064c3af1013d14', 1, 's7WwqTL73qecV0uoWXWQtMtP7LvhZxYBEd6cLOH19Nbo51Togv9zENt5NmUo', '2023-07-28 11:05:36', '2023-07-28 11:05:36'),
(229, 4, 'PHAM THAI', 'SON', 'sonmup46', NULL, '0792610954', 'sonmup46@gmail.com', NULL, NULL, '$2y$10$N0AF0Iwsrxn14yaqrHuAm.t4UXkp9.Qzkkl05qQr3u3mowzzajsm.', NULL, '2291064c3cb98daaf3', 1, NULL, '2023-07-28 13:07:20', '2023-07-28 13:07:20'),
(231, 5, 'Thanh', 'Ha', 'ntthnguyenthanhha@gmail.com', NULL, '0393267479', 'ntthnguyenthanhha@gmail.com', NULL, NULL, '$2y$10$/o5LRN5//7RUstBALPE0tOfmqE2NaPC.09v0Y6uPY/CL3AguI/nrO', '1', '2311064c3e43d66008', 1, 'fvYHPZteq9vcuAVs3wUdZNYB74uFk1ygW5HicT2sRxG7QidyIV1zbLUvz08w', '2023-07-28 14:52:29', '2023-07-28 14:52:29'),
(232, 5, 'Thu', 'Trang', 'hathithutrangdl@gmail.com', NULL, '0933646387', 'hathithutrangdl@gmail.com', NULL, NULL, '$2y$10$B.OJAzTNWY2qnzgb476Vu.HjSNfV6v4MY2z5/LxlKB.ayIV3JhjQC', '1', '2321064c4da0adb46a', 1, 'I9dGORglJg5CHIzCHbeD6FHGCA9oZdIeQrHNkrsXawEEZUyO1MPRBmdxcvdw', '2023-07-29 08:21:14', '2023-07-29 08:21:14'),
(233, 5, 'Phong', 'Thai', 'vuphongthai@gmail.com', NULL, '0948356611', 'vuphongthai@gmail.com', NULL, NULL, '$2y$10$tKYJLgTWf7BeWPAccIujv.v2VAPkjWuj5.On9aQpTQOUkWyveo0l2', '1', '2331064c75842b018a', 1, 'GHTEHbmHzHxNusiy2Vw9n4zLr1NIxyX6sojR3bd22J7kPPlUuEMsp3kpg3ui', '2023-07-31 05:44:18', '2023-07-31 05:44:18'),
(234, 5, 'Tu', 'Chinh', 'tuchinhathlete97@gmail.com', NULL, '0785689828', 'tuchinhathlete97@gmail.com', NULL, NULL, '$2y$10$8qApc/ktYjuwkO8tlCsgaOLa4tR0r8b4k5wNHf1pw9FFzHsYFsc0i', '1', '2341064c7589750555', 1, 'uxxMk3mez3uhMP7D0HeIdJKtHiCqIsWrImFOfebs6org6uHKAmOFMCNUNRij', '2023-07-31 05:45:43', '2023-07-31 05:45:43'),
(235, 5, 'Thao', 'Le', 'thaole595620@gmail.com', NULL, '0357537896', 'thaole595620@gmail.com', NULL, NULL, '$2y$10$PuCepVw0o3h61nPgxs4LmuPsjIXFlSMFdaNFHNaL8VfXpp6D78ZgC', '1', '2351064c78038ef4a3', 1, 'l4nw8Mcedc43XDmDRAW8q20grrBfVwDGfyoeC3vWkTlUqYMyONbEDqxyFrfk', '2023-07-31 08:34:48', '2023-07-31 08:34:48'),
(236, 4, 'Lệ', 'Nguyễn', 'milenguyen993', NULL, '0792417789', 'milenguyen993@gmail.com', NULL, NULL, '$2y$10$DmVoW6igLhgyqSn5hGGG1.IyJH1Rf0KR.r/71L29UIw2Hw9QmP2sW', NULL, '2361064c7c56831087', 1, NULL, '2023-07-31 13:30:00', '2023-07-31 13:30:00'),
(237, 4, 'Tâm', 'Lê', 'leethihongtam', NULL, '0773274548', 'leethihongtam@gmail.com', NULL, NULL, '$2y$10$yBICU9amy.b.DbH7RUZa5umrZuog8EjKZ0/Tev/I2DfiLCaNZ13qS', NULL, '2371064c859180275f', 1, NULL, '2023-08-01 00:00:08', '2023-08-01 00:00:08'),
(241, 5, 'Huynh', 'Chien', 'huynhchien.cao@outlook.com', NULL, '0919580116', 'huynhchien.cao@outlook.com', NULL, NULL, '$2y$10$PTQDKk.DUzF3bqGEGbW.q.CewKrJ.gBBj98EL2OekQ80Bj/dYd5GG', '1', '2411064c904b2d2304', 1, 'uBs6Xg2QDJCXrFQKSMTPxthCUpMf2QBmiJ1CQmKeztIpwJRF91VZwiS6gP0X', '2023-08-01 12:12:18', '2023-08-01 12:12:18'),
(242, 4, 'Khắc Tường', 'Đỗ', 'khactuongdo', NULL, '0898007128', 'khactuongdo@gmail.com', NULL, NULL, '$2y$10$y2j2XMqeLlIuLC7qVevY2.JL5oCgnSzZstxS619K85tW/7.gJsbxe', NULL, '2421064cdb48694f50', 1, NULL, '2023-08-05 01:31:34', '2023-08-05 01:31:34'),
(245, 5, 'Long', 'Phung', 'danglongphung1989@gmail.com', NULL, '0946423999', 'danglongphung1989@gmail.com', NULL, NULL, '$2y$10$GPYOxjMvO6m8oxHYxmuwNOlrjZ0d1MVAobSbnFmxQe3naOHIgSv0G', '1', '2451064ce753381492', 1, 'YqNQjgRKYv6BX6Ucz4iNIn85Tfjk5Au4AeFqFuBtKqZUd6HPicDUkjJ2ykEw', '2023-08-05 15:13:39', '2023-08-05 15:13:39'),
(246, 5, 'Thu', 'Huyen', 'nguyenthithuhuyen0812@gmail.com', NULL, '0375301928', 'nguyenthithuhuyen0812@gmail.com', NULL, NULL, '$2y$10$UWeLCiSyoUGwK4NHDBcxZOyLcpaJU0U9iErCp2f9flQwzxEy2Ic9G', '1', '2461064cf4e19f2369', 1, 'LtKjyBEdiOTRwyT2oJIxrgHMsyyvX57qqDOXxR8sFuhvlXytBx33tnhF02Lm', '2023-08-06 06:39:05', '2023-08-06 06:39:05'),
(247, 5, 'hiam', 'solei', 'hiamsolei@gmail.com', NULL, '0395017940', 'hiamsolei@gmail.com', NULL, NULL, '$2y$10$bPe3M9pbDq/1Zu3NasZCxOmEjKJaCfCDeSfF.0eUhaJnkD1Stj636', '1', '2471064cfcb6ca2109', 1, '3A3ZmumDdiNIaP7acnzjCpjj6gx0VKhWhOkjF82YulaXTJxnj0WAXavo9Xav', '2023-08-06 15:33:48', '2023-08-06 15:34:04'),
(248, 5, 'Ngoc', 'Lan', 'ngoclan03091985@gmail.com', NULL, NULL, 'ngoclan03091985@gmail.com', NULL, NULL, '$2y$10$IkaRocBonzrB3DOvk/BhQ.gnOOxCKYyBhE6Bprcj6cVK.sPOI/vU.', '1', '2481064d07e0051ee6', 1, 'UT7MCJ2LpGbWAJJNDydIlkFaFCsZ6naICCHmuecujzxtwnHf1aSjNLOOk0WV', '2023-08-07 04:15:44', '2023-08-07 04:15:44'),
(249, 4, 'Huynh', 'Thanh', 'thanhthanh1288', NULL, '0933512533', 'thanhthanh1288@gmail.com', NULL, NULL, '$2y$10$fdEBZdInyS2tN2PgblB7quSsmmQVyXaJlyN14M9.iJhAAdqyPX7xy', NULL, '2491064d23fb3a8a62', 1, NULL, '2023-08-08 12:14:27', '2023-08-08 12:14:27'),
(250, 4, 'Văn', 'Hoàng', 'hoangdk11345', NULL, '0362926765', 'hoangdk11345@gmail.com', NULL, NULL, '$2y$10$9Y54gsgb2iYeBbVrKZHSKuqNRocf1NiUS85HTaXoZyRxxmHta0UDW', NULL, '2501064d37999f239d', 1, NULL, '2023-08-09 10:33:45', '2023-08-09 10:33:45'),
(251, 5, 'Nghi', 'Han', 'Nguyen.nghihan@gmail.com', NULL, '0937 060 022', 'Nguyen.nghihan@gmail.com', NULL, NULL, '$2y$10$aVVHEiANzsyKH8D6ur6YquQR/nQl5w97S6fAzz0rVLlLIN5PD/8Ka', '1', '2511064d4519eb681e', 1, '13blB7texdJzha1PI8O4YqWB6op9tNykhqy55f30whfWs47hdZRc9kvjkwEL', '2023-08-10 01:55:26', '2023-08-10 01:55:26'),
(252, 5, 'BS', 'Tuan', 'leminhtuan896@gmail.com', NULL, NULL, 'leminhtuan896@gmail.com', NULL, NULL, '$2y$10$g.5nRBCtMz7qY5RvZEMgf.mXgm012DNtoCy.iN4LeVLdN0wiCaYP2', '1', '2521064d451c4f262d', 1, 'CRTkdKi2gUEQNf36YRIlu7dgbenf5W7Q9zyMuLWmMiPhKVMsH4yXcnyXCGL9', '2023-08-10 01:56:04', '2023-08-10 01:56:04'),
(253, 5, 'Luc', 'Nga', 'locthinga221287@gmail.com', NULL, '0367531836', 'locthinga221287@gmail.com', NULL, NULL, '$2y$10$Z9eZP.t3kJtC5yVhEzoBCeeOaW1nOyB/hMXO6JXBv9oUjIwYmTNHe', '1', '2531064d451df61fca', 1, 'LlMbcRHijLHK5Obfae2BH1SSaJxWpzVpsFvRqA5HBNo6qbymqKDugaWWnjwU', '2023-08-10 01:56:31', '2023-08-10 01:56:31'),
(254, 5, 'Kim', 'Yen', 'huynhthikimyen01@gmail.com', NULL, NULL, 'huynhthikimyen01@gmail.com', NULL, NULL, '$2y$10$oy/3YdXzBinI.er/nJXYi.M486lnrV6M6OR4vijbUCdpvpy7I4gmK', '1', '2541064d460ed2a15c', 1, '6fB8CcswEFC3Lt4UqT7dXObdjF2Ym5ptdOWKXDbFkWzWdf3Ue7IwoZbiJQP3', '2023-08-10 03:00:45', '2023-08-10 03:00:45'),
(255, 5, 'Thuy', 'Dung', 'thuydungcl45@gmail.com', NULL, NULL, 'thuydungcl45@gmail.com', NULL, NULL, '$2y$10$uNRub8wX//LhBrR8Lq5LOO7NV8GAQSOEgAaKtYNnbGcIgvhDuFUP.', '1', '2551064d4d05ebfea8', 1, 'eVu5LbJklgGsmpU2sSVupQhgMnL1eVWslwdsB0IB3pZpH8TCXEE6lIpvyuqd', '2023-08-10 10:56:14', '2023-08-10 10:56:14'),
(256, 5, 'Giang', 'Thanh', 'giangthanh2301@gmail.com', NULL, '0896409092', 'giangthanh2301@gmail.com', NULL, NULL, '$2y$10$nOD6RKx9dJ6WOmmnmalmNuVGDD6IWQ1iOJuHteXJ2myAg1SbqVnXa', '1', '2561064d50c3bd9d65', 1, 'gnq9RkUDGNfBcJCSTHcLyYx7ZHogkKDEVyG4Dy3llXcI2k3mAcRnYUXNPQLe', '2023-08-10 15:11:39', '2023-08-10 15:11:59'),
(257, 5, 'Anh', 'Vũ phạm', 'Vupham12101988@gmail.com', NULL, NULL, 'Vupham12101988@gmail.com', NULL, NULL, '$2y$10$hWPKTtv8wLMs9AmLskAbrOXc.KeIdBp1vUPkUss1ugrAEs1Vsdukm', '1', '2571064d6dd508fd70', 1, 'qOf59ky94hfodBWdGBOXnNZO7hjW0akcmV6orGQbpiZrx8KO3tskFzWsCr3K', '2023-08-12 00:16:00', '2023-08-12 01:49:46'),
(258, 5, 'Ngoc', 'Yen', 'tranthingocyen2122@gmail.com', NULL, '0835226502', 'tranthingocyen2122@gmail.com', NULL, NULL, '$2y$10$cQ8pn8IqyERx9O7y/.dpxuDQiS.Bu/1DN.o8O9dkwFCJrlHr37Fcm', '1', '2581064d7aca56bb09', 1, 'Zl6wSKFOT9Q3vFI8udz2NFdQEEohZTyEk3bFFHICYCm9kpD1hxP1sOZwjoaJ', '2023-08-12 15:00:37', '2023-08-12 15:00:37'),
(259, 4, 'Hieu', 'Pham', 'phamhieu77d1', NULL, '0971987697', 'phamhieu77d1@gmail.com', NULL, NULL, '$2y$10$o8fz6V92G2b5Qr8xkczoT.uBrLarD7tRqWsqNcxZ38JC9DAhvHJ.G', NULL, '2591064d83ded5e76e', 1, NULL, '2023-08-13 01:20:29', '2023-08-13 01:20:29'),
(260, 5, 'NTT', 'Nhung', 'nttnhung95@gmail.com', NULL, '080 7505 7979', 'nttnhung95@gmail.com', NULL, NULL, '$2y$10$TNfnrMAUx4pSoTg.80EsLOMl/OOObH7ansHJB87ecJvzL44ncz8U2', '1', '2601064d8bfee965ec', 1, 'msnXxAKv4voHuJSfLlxjk9e2DqDpHjkA1TBv28RgXf0HrTs8x2UI3dTDClYu', '2023-08-13 10:35:10', '2023-08-13 10:35:27'),
(261, 5, 'Su', 'Su', 'suubanhbao@gmail.com', NULL, '0878125825', 'suubanhbao@gmail.com', NULL, NULL, '$2y$10$.tAg09m6ltIS1jNKf3TH6e27844dXMG.orH.wWhClKaPLxeXcg..a', '1', '2611064d9e862ddb36', 1, NULL, '2023-08-14 07:40:02', '2023-08-14 07:40:02'),
(262, 5, 'Lee', 'Thy', 'thylee2508@gmail.com', NULL, '0703943678', 'thylee2508@gmail.com', NULL, NULL, '$2y$10$JsWMqJwOM1Za7xPrqaU4w.sIIWMevM/gDcnq9pQasUHYCcoFTULle', '1', '2621064da41bf5e0de', 1, 'Ig1WBRsECg0hKEZkmlMPOyjG0kszCl5yLAB3lLZdP1YhWEO6CQXVNXKiZIdF', '2023-08-14 14:01:19', '2023-08-14 14:01:19');
INSERT INTO `users` (`id`, `role_id`, `first_name`, `last_name`, `username`, `photo`, `phone`, `email`, `address`, `email_verified_at`, `password`, `creator`, `slug`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(263, 5, 'Phuong', 'Thao', 'tp5835620@gmail.com', NULL, '0373639208', 'tp5835620@gmail.com', NULL, NULL, '$2y$10$YUgBov2px7jt1aSqmXA.muwD3Peg5YNLsauzbmLCuRozW5YIGPtTm', '1', '2631064db1d8a21610', 1, NULL, '2023-08-15 05:39:06', '2023-08-15 05:39:06'),
(264, 5, 'Phuong', 'Chi', 'nngphuongchi@gmail.com', NULL, '0797202785', 'nngphuongchi@gmail.com', NULL, NULL, '$2y$10$VEq7VFwqnXRgHhAtEWrnseehLbq1QBVIHC1dyncuDRvJSh5W2m/Xu', '1', '2641064e042f7a3f08', 1, 'OJnJ2k5yNrYDDYj8N9mvWMVSUXAG6I6MLSI0B8CUORVxnTeGgixM5f64q1BZ', '2023-08-19 03:20:07', '2023-08-19 03:20:07'),
(265, 5, 'My', 'Linh', 'ktml20112000@gmail.com', NULL, '0337353846', 'ktml20112000@gmail.com', NULL, NULL, '$2y$10$37f8Cy17Kp2dnZbiaKpyGOsHWTgmaw/CEZsMsB8lCqjz.A.lE.dB6', '1', '2651064e1ab7580eb3', 1, 'xkJLIwC1fXDloFJL5eGewR4Fw34gmV2xu4izROk6fQsezFpQAggogo35rkwc', '2023-08-20 04:58:13', '2023-08-20 04:58:13'),
(266, 5, 'Truong', 'Thuy', 'jadetruonh59@gmail.com', NULL, '0973466263', 'jadetruonh59@gmail.com', NULL, NULL, '$2y$10$7JeCAnYknxbDOkPgkbnH0eBitgxSg6eV/B1ODla0U1fiyN8l.F5MK', '1', '2661064e32265d6ae6', 1, 'maQPoxfF7VI4TBy4RBGxb9I2eDUQOLoN5Qiw1Aj3fK5puPPEDAdeTDs1UJvB', '2023-08-21 07:37:57', '2023-08-21 07:37:57'),
(267, 5, 'Tran', 'Ti', 'Titran3838@gmail.com', NULL, '0767783838', 'Titran3838@gmail.com', NULL, NULL, '$2y$10$JNLxE80PPrl9PoXKMwTr5OqjTY4YyUdeEk67ewq5XQCU6myVHNSlO', '1', '2671064e3825e53092', 1, 'd1ft7PkIXx3BFZgz11StmfuRrGeG8TFTIkk1kcqydy1sdcEAphg4pPD0nujr', '2023-08-21 14:27:26', '2023-08-21 14:27:26'),
(268, 5, 'NT', 'Phi', 'ntphi010101@gmail.com', NULL, '0386505215', 'ntphi010101@gmail.com', NULL, NULL, '$2y$10$IXUKQpw/pQ.uQRzSqh4LX.ArxLNW6N2zM4k7ymVBf4IGGmWqdYT7q', '1', '2681064e4ca4fad411', 1, 'UQ0ETFdpvI2ikboDIBhFSJNVmRO7N7vtnZpPcVdFHOnVtHn8wNua1a6561QA', '2023-08-22 13:46:39', '2023-08-22 13:46:39'),
(269, 5, 'Thy', 'Lan', 'lan.70222067tpe1@oude.edu.vn', NULL, '0396050009', 'lan.70222067tpe1@oude.edu.vn', NULL, NULL, '$2y$10$UVeHY5ov0WsrTPGbjLsS..1Rmzi8Gql6wmXEq3q8hdCNFUuLgTtJy', '1', '2691064e6d5131aa77', 1, 'iUmYgexKwSZj00S6vn2KkLsUCWKySVFiv8B7vas6mtP7DH1jhusQxyaLZgCW', '2023-08-24 02:57:07', '2023-08-24 02:57:07'),
(270, 5, 'Test', 'Student', 'test.student@gmail.com', NULL, NULL, 'test.student@gmail.com', NULL, NULL, '$2y$10$ayamuPsh5C8vkqmrwVOmy.KsFx6zpKEO2ZLgeQbidHt8rTaM5//oi', '1', '2701064e7ee6b3762b', 1, NULL, '2023-08-24 23:57:31', '2023-08-25 02:00:03'),
(271, 5, 'Cao', 'Thang', 'Caothang832002@gmail.com', NULL, '0978888989', 'Caothang832002@gmail.com', NULL, NULL, '$2y$10$TJi6VnGOaaAcLMcuZP88KuQMuWUdH134fTG3ZuMSbwgTrwsOe4d4i', '1', '2711064e80325a0831', 1, 'pM4uHn7YKX6l1dJ0etgaLDSSX0iaAAbFRBaOnGviIjmZZg2rllExwmsq7IKb', '2023-08-25 01:25:57', '2023-08-25 01:25:57'),
(272, 4, 'Nhung', 'Nguyễn', 'baomy1711', NULL, '0358567849', 'baomy1711@gmail.com', NULL, NULL, '$2y$10$WYdJybrEZcp.pCgT411q.OQalp5zD29xFxIVUfEHYvrti/DyRxTbG', NULL, '2721064eac2b7bc332', 1, NULL, '2023-08-27 03:27:51', '2023-08-27 03:27:51'),
(273, 5, 'Kim', 'Hoang', 'hoangnguyenngockim12a421@gmail.com', NULL, '0915768795', 'hoangnguyenngockim12a421@gmail.com', NULL, NULL, '$2y$10$ODdulxX6FYP2JMFC1m91SOt9i2/Vt/k2QiTZQWT8WNPmvKge4sG7i', '1', '2731064eb12380c5d1', 1, 'NTWkl2MGVq5SioEu1y1n2yQzgdFCl5RMeZoYMGoinjAGam3W2zrwe7n5AqZT', '2023-08-27 09:07:04', '2023-08-27 09:07:04'),
(274, 2, 'Teacher', 'test', 'teacher02@gmail.com', NULL, NULL, 'teacher02@gmail.com', NULL, NULL, '$2y$10$m8GFNnokSHgGi60P/EFYD.Jw1EUD1OPh.5c6ui.OFMbm3EyWTWTDW', '1', '2741064ec2be22dff6', 1, NULL, '2023-08-28 05:08:50', '2023-08-28 05:09:27'),
(275, 5, 'Hoc Sinh', 'Hoc Sinh', 'dany.dang90@gmail.com', NULL, '0868339608', 'dany.dang90@gmail.com', NULL, NULL, '$2y$10$jgMSAx0ZLtniXoXmpjpEIu4B/6pgkXX4Brj.cIJqFts3TxP69gv4y', '1', '2751064ec4369de0f1', 1, NULL, '2023-08-28 06:49:13', '2023-08-28 06:53:56'),
(276, 5, 'Duc', 'Dang', 'studentduc@gmail.com', NULL, '0868339608', 'studentduc@gmail.com', NULL, NULL, '$2y$10$NlAWKS9S08ZPw.DHCHaw6.BuehEGTNyFexkBk4sI.LypjZ5xv60v.', '1', '2761064ec463b1edfa', 1, NULL, '2023-08-28 07:01:15', '2023-08-28 07:01:15'),
(277, 5, 'Tran', 'Minh', 'tranvanminh05081986@gmail.com', NULL, '0985737636', 'tranvanminh05081986@gmail.com', NULL, NULL, '$2y$10$1B.5JsgydckmXDvqB86Fze/f5AVgqff9ea51bVs872ajP55C2XRea', '1', '2771064ed54ff95c99', 1, 'Emmz1CMYG43qlLDqqUCvaWQMO0zmRfxQgau5Qz9zP9RfzFf7oVnj7A1VMeQS', '2023-08-29 02:16:31', '2023-08-29 02:16:31'),
(278, 5, 'Nguyen', 'Thanh', 'nguyenvu.hoaithanh110@gmail.com', NULL, '0906889835', 'nguyenvu.hoaithanh110@gmail.com', NULL, NULL, '$2y$10$LD7tWSIPNFI/4YWPIe7wkeUd7ivs.r86mP/CMXJvC4HQhWmgrw6HK', '1', '2781064ed744929e42', 1, 'teyMEHoB08CXbJHtWh9D2ARGLATZVUetTGJrkyfKdQX3OyVdCXmbQGD1kgoX', '2023-08-29 04:30:01', '2023-08-29 04:30:01'),
(279, 4, 'Trịnh Hồng', 'Ánh', 'thiengiap84', NULL, '0394849337', 'thiengiap84@gmail.com', NULL, NULL, '$2y$10$xtGFyJHf/BZ8Hmq2EMfbYOLp/ZzWHZ7KIhUjDqQthVgN4bKQlClV6', NULL, '2791064efd20106f89', 1, NULL, '2023-08-30 23:34:25', '2023-08-30 23:34:25'),
(281, 4, 'Thành', 'Vũ Hải', 'thanhpkhsx', NULL, '0904166869', 'thanhpkhsx@gmail.com', NULL, NULL, '$2y$10$JEvvvn2YyWmediNq3tE4Yedav716Pg3jPUYEX2NPgh.baqloc840a', NULL, '2811064f074cc82003', 1, NULL, '2023-08-31 11:09:00', '2023-08-31 11:09:00'),
(283, 5, 'Truong', 'Van', 'nttruongvan1012@gmail.com', NULL, '0939280256', 'nttruongvan1012@gmail.com', NULL, NULL, '$2y$10$UXV5zi7XG5FU0FL.GEU/KuLYrefU7KfHkQ.IeboVtbkOyYZ1iK4hm', '1', '2831064f0a7ea0769b', 1, NULL, '2023-08-31 14:47:06', '2023-08-31 14:47:06'),
(284, 4, 'Nguyen', 'Ngan', 'nguyenthikimngan19031997', NULL, '0359855212', 'nguyenthikimngan19031997@gmail.com', NULL, NULL, '$2y$10$4d/J9DtV0Coh3iyIcFjkOO.eLdrvp6s5DYTjmFaMRtUk8D95OGYqe', NULL, '2841064f12f6b7f9d8', 1, NULL, '2023-09-01 00:25:15', '2023-09-01 00:25:15'),
(286, 5, 'Tuan', 'Hung', 'Phantuanhung11062004@gmail.com', NULL, '0963362168', 'Phantuanhung11062004@gmail.com', NULL, NULL, '$2y$10$Y6yP9SqQK6bWsOsrBNCds.ML0x2O.C9vGc0/6HC5DPZC1YB66FX/a', '1', '2861064f14b0cd1e10', 1, '2zqScFmXuZENCBnJyKYWxKtzuk202yMZ3PcwLicg15djdrce0ekOdAaGVeh7', '2023-09-01 02:23:08', '2023-09-01 02:23:08'),
(287, 5, 'Thuan', 'Nguyen', 'thuannguyen11081999@gmail.com', NULL, '0365827149', 'thuannguyen11081999@gmail.com', NULL, NULL, '$2y$10$StAelPpsGbHaVI8hOy75.eo4xHef59Jk6sAgZ.SYyAZj/HcOqUTTa', '1', '2871064f184623ee6d', 1, '93vCvBtx0rfM5LAt6ssIZb0LpLV7Ar3Qq4LRRtNnuu3U01tYyCbImSSXSJrd', '2023-09-01 06:27:46', '2023-09-01 06:27:46'),
(288, 4, 'Kim Hoang', 'Tran', 'Hoangtran254', NULL, '0918343134', 'Hoangtran254@gmail.com', NULL, NULL, '$2y$10$4I80gSIPf.9Ct1Qb6tKkLOxAtBnCAwkwoeoD9.VB0KOv3blLq1idG', NULL, '2881064f2d3d4e073a', 1, NULL, '2023-09-02 06:19:00', '2023-09-02 06:19:00'),
(289, 5, 'Nguyen', 'Luc', 'nguyen.luc@dmt.co.jp', NULL, NULL, 'nguyen.luc@dmt.co.jp', NULL, NULL, '$2y$10$I930DtRR.6AyJwj0CdhJtuIxgmcDEpYV0VmMoUmG3k1LzhCQu84bq', '1', '2891064f30a4cb3761', 1, NULL, '2023-09-02 10:11:24', '2023-09-02 10:11:24'),
(290, 4, 'Dư anh', 'bình', 'duanhbinh', NULL, '0948611111', 'duanhbinh@gmail.com', NULL, NULL, '$2y$10$78AeMf6nFp4kLtSMvJdrDebjX1tLQEJdBmKlr804ShxTxnJ72m/uG', NULL, '2901064f40033a50b9', 1, NULL, '2023-09-03 03:40:35', '2023-09-03 03:40:35'),
(292, 4, 'Tuan', 'Hoang', 'Hoangtuan', NULL, '0915685681', 'Hoangtuan@ecomled.vn', NULL, NULL, '$2y$10$82/jc1oPaUQW1MgYV32ZJ.ohOI/BbKF.SQcVl9KkM7Rua0.6xe4Jq', NULL, '2921064f495b51d392', 1, NULL, '2023-09-03 14:18:29', '2023-09-03 14:18:29'),
(293, 5, 'student', '02', 'student02@gmail.com', NULL, '0347091922', 'student02@gmail.com', NULL, NULL, '$2y$10$5InlKTVVufwPtdoa3rUHwelbPq.i/2m0d0xV6LKOsOmrsiUOAU1yS', '1', '2931065031559f0cb3', 1, NULL, '2023-09-14 14:14:49', '2023-09-14 14:14:49');

-- --------------------------------------------------------

--
-- Table structure for table `user_comments`
--

CREATE TABLE `user_comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `new_comment` tinyint(1) DEFAULT 1 COMMENT '1 - new comment\n0 - old coment',
  `updated_time` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_comments`
--

INSERT INTO `user_comments` (`id`, `user_id`, `comment_id`, `new_comment`, `updated_time`) VALUES
(246, 2, 2, 1, '2023-08-26 08:13:58'),
(247, 75, 2, 1, '2023-08-26 08:13:58'),
(248, 224, 2, 1, '2023-08-26 08:13:58'),
(277, 188, 1, 1, '2023-08-26 08:28:30'),
(351, 92, 6, 1, '2023-08-30 08:20:57'),
(352, 2, 6, 1, '2023-08-30 08:20:57'),
(353, 75, 6, 1, '2023-08-30 08:20:57'),
(354, 224, 6, 1, '2023-08-30 08:20:57'),
(355, 274, 6, 1, '2023-08-30 08:20:57'),
(387, 2, 10, 1, '2023-08-30 09:57:39'),
(388, 75, 10, 1, '2023-08-30 09:57:39'),
(389, 224, 10, 1, '2023-08-30 09:57:39'),
(390, 274, 10, 1, '2023-08-30 09:57:39'),
(411, 276, 8, 1, '2023-08-30 16:59:23'),
(467, 2, 13, 1, '2023-09-04 20:47:29'),
(468, 75, 13, 1, '2023-09-04 20:47:29'),
(469, 224, 13, 1, '2023-09-04 20:47:29'),
(470, 274, 13, 1, '2023-09-04 20:47:29'),
(511, 270, 3, 1, '2023-09-11 19:32:38'),
(542, 1, 16, 1, '2023-09-14 21:59:22'),
(547, 1, 15, 1, '2023-09-14 22:41:03'),
(548, 75, 15, 1, '2023-09-14 22:41:03'),
(549, 224, 15, 1, '2023-09-14 22:41:03'),
(550, 274, 15, 1, '2023-09-14 22:41:03'),
(556, 1, 11, 1, '2023-09-14 22:43:19'),
(557, 2, 11, 1, '2023-09-14 22:43:19'),
(558, 75, 11, 1, '2023-09-14 22:43:19'),
(559, 224, 11, 1, '2023-09-14 22:43:19'),
(560, 274, 11, 1, '2023-09-14 22:43:19'),
(566, 1, 17, 1, '2023-09-14 22:44:31'),
(586, 1, 18, 1, '2023-09-14 23:33:51'),
(587, 2, 18, 1, '2023-09-14 23:33:51'),
(588, 75, 18, 1, '2023-09-14 23:33:51'),
(589, 224, 18, 1, '2023-09-14 23:33:51'),
(590, 274, 18, 1, '2023-09-14 23:33:51');

-- --------------------------------------------------------

--
-- Table structure for table `user_courses`
--

CREATE TABLE `user_courses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_courses`
--

INSERT INTO `user_courses` (`id`, `user_id`, `course_id`, `created_at`, `updated_at`) VALUES
(13, 22, 3, '2023-05-29 10:18:41', '2023-05-29 10:18:41'),
(14, 22, 2, '2023-05-29 10:18:41', '2023-05-29 10:18:41'),
(15, 22, 1, '2023-05-29 10:18:41', '2023-05-29 10:18:41'),
(18, 52, 1, '2023-05-29 18:39:28', '2023-05-29 18:39:28'),
(19, 38, 1, '2023-05-29 18:39:38', '2023-05-29 18:39:38'),
(20, 36, 1, '2023-05-29 18:39:43', '2023-05-29 18:39:43'),
(21, 34, 1, '2023-05-29 18:39:48', '2023-05-29 18:39:48'),
(22, 29, 1, '2023-05-29 18:39:53', '2023-05-29 18:39:53'),
(33, 58, 1, '2023-06-01 13:00:29', '2023-06-01 13:00:29'),
(36, 54, 1, '2023-06-01 13:21:57', '2023-06-01 13:21:57'),
(39, 73, 1, '2023-06-05 06:20:44', '2023-06-05 06:20:44'),
(40, 74, 9, '2023-06-05 10:50:00', '2023-06-05 10:50:00'),
(56, 25, 4, '2023-06-09 05:53:35', '2023-06-09 05:53:35'),
(57, 25, 1, '2023-06-09 05:53:35', '2023-06-09 05:53:35'),
(58, 76, 1, '2023-06-10 13:09:58', '2023-06-10 13:09:58'),
(59, 77, 1, '2023-06-10 13:13:58', '2023-06-10 13:13:58'),
(60, 78, 1, '2023-06-10 13:18:35', '2023-06-10 13:18:35'),
(61, 79, 1, '2023-06-10 13:23:31', '2023-06-10 13:23:31'),
(63, 81, 1, '2023-06-10 13:25:45', '2023-06-10 13:25:45'),
(64, 82, 1, '2023-06-10 13:35:06', '2023-06-10 13:35:06'),
(65, 83, 1, '2023-06-10 15:01:47', '2023-06-10 15:01:47'),
(73, 80, 1, '2023-06-12 14:52:33', '2023-06-12 14:52:33'),
(78, 84, 1, '2023-06-13 18:07:56', '2023-06-13 18:07:56'),
(79, 86, 1, '2023-06-14 15:37:05', '2023-06-14 15:37:05'),
(80, 87, 1, '2023-06-14 15:37:51', '2023-06-14 15:37:51'),
(82, 89, 1, '2023-06-17 11:07:14', '2023-06-17 11:07:14'),
(86, 90, 11, '2023-06-18 09:09:16', '2023-06-18 09:09:16'),
(87, 91, 1, '2023-06-19 15:27:30', '2023-06-19 15:27:30'),
(88, 92, 1, '2023-06-19 17:07:05', '2023-06-19 17:07:05'),
(89, 93, 1, '2023-06-20 13:43:01', '2023-06-20 13:43:01'),
(90, 94, 1, '2023-06-20 15:08:39', '2023-06-20 15:08:39'),
(91, 95, 1, '2023-06-23 11:17:32', '2023-06-23 11:17:32'),
(92, 96, 1, '2023-06-23 11:19:01', '2023-06-23 11:19:01'),
(93, 97, 1, '2023-06-24 08:20:46', '2023-06-24 08:20:46'),
(95, 108, 1, '2023-06-28 09:53:29', '2023-06-28 09:53:29'),
(99, 88, 1, '2023-06-29 14:49:26', '2023-06-29 14:49:26'),
(100, 123, 1, '2023-07-01 08:46:03', '2023-07-01 08:46:03'),
(101, 124, 1, '2023-07-01 08:46:40', '2023-07-01 08:46:40'),
(104, 114, 1, '2023-07-01 09:00:12', '2023-07-01 09:00:12'),
(105, 155, 1, '2023-07-05 06:53:40', '2023-07-05 06:53:40'),
(106, 156, 1, '2023-07-05 06:54:16', '2023-07-05 06:54:16'),
(108, 126, 1, '2023-07-05 06:56:36', '2023-07-05 06:56:36'),
(109, 161, 1, '2023-07-05 14:25:17', '2023-07-05 14:25:17'),
(110, 162, 1, '2023-07-05 18:16:17', '2023-07-05 18:16:17'),
(111, 163, 1, '2023-07-05 18:16:49', '2023-07-05 18:16:49'),
(112, 170, 1, '2023-07-06 07:32:37', '2023-07-06 07:32:37'),
(113, 171, 1, '2023-07-06 07:42:51', '2023-07-06 07:42:51'),
(115, 98, 1, '2023-07-06 09:56:11', '2023-07-06 09:56:11'),
(116, 175, 1, '2023-07-07 21:04:12', '2023-07-07 21:04:12'),
(117, 176, 1, '2023-07-08 11:40:50', '2023-07-08 11:40:50'),
(118, 184, 1, '2023-07-10 09:33:25', '2023-07-10 09:33:25'),
(119, 186, 1, '2023-07-10 13:01:15', '2023-07-10 13:01:15'),
(124, 55, 1, '2023-07-10 13:50:34', '2023-07-10 13:50:34'),
(125, 188, 1, '2023-07-10 19:01:19', '2023-07-10 19:01:19'),
(126, 189, 1, '2023-07-11 09:03:36', '2023-07-11 09:03:36'),
(127, 190, 1, '2023-07-11 09:04:14', '2023-07-11 09:04:14'),
(128, 191, 1, '2023-07-11 12:05:48', '2023-07-11 12:05:48'),
(129, 193, 1, '2023-07-11 17:10:54', '2023-07-11 17:10:54'),
(130, 195, 1, '2023-07-12 15:34:25', '2023-07-12 15:34:25'),
(131, 196, 1, '2023-07-14 11:07:55', '2023-07-14 11:07:55'),
(132, 203, 1, '2023-07-16 10:15:10', '2023-07-16 10:15:10'),
(133, 204, 1, '2023-07-16 11:48:15', '2023-07-16 11:48:15'),
(134, 205, 1, '2023-07-17 15:46:33', '2023-07-17 15:46:33'),
(135, 207, 1, '2023-07-18 16:43:48', '2023-07-18 16:43:48'),
(136, 208, 1, '2023-07-20 09:12:23', '2023-07-20 09:12:23'),
(137, 209, 1, '2023-07-20 11:32:55', '2023-07-20 11:32:55'),
(138, 212, 1, '2023-07-21 07:39:18', '2023-07-21 07:39:18'),
(139, 214, 1, '2023-07-22 11:44:20', '2023-07-22 11:44:20'),
(140, 218, 1, '2023-07-23 08:18:34', '2023-07-23 08:18:34'),
(141, 219, 1, '2023-07-23 10:13:50', '2023-07-23 10:13:50'),
(142, 220, 1, '2023-07-23 13:31:15', '2023-07-23 13:31:15'),
(143, 222, 1, '2023-07-24 16:22:35', '2023-07-24 16:22:35'),
(144, 223, 1, '2023-07-24 18:47:13', '2023-07-24 18:47:13'),
(149, 225, 1, '2023-07-26 18:49:55', '2023-07-26 18:49:55'),
(150, 215, 1, '2023-07-26 19:18:53', '2023-07-26 19:18:53'),
(151, 227, 1, '2023-07-27 13:17:33', '2023-07-27 13:17:33'),
(152, 228, 1, '2023-07-28 18:05:36', '2023-07-28 18:05:36'),
(153, 231, 1, '2023-07-28 21:52:29', '2023-07-28 21:52:29'),
(154, 232, 1, '2023-07-29 15:21:14', '2023-07-29 15:21:14'),
(155, 233, 1, '2023-07-31 12:44:18', '2023-07-31 12:44:18'),
(156, 234, 1, '2023-07-31 12:45:43', '2023-07-31 12:45:43'),
(157, 235, 1, '2023-07-31 15:34:48', '2023-07-31 15:34:48'),
(158, 241, 1, '2023-08-01 19:12:18', '2023-08-01 19:12:18'),
(161, 75, 4, '2023-08-03 08:26:20', '2023-08-03 08:26:20'),
(162, 245, 1, '2023-08-05 22:13:39', '2023-08-05 22:13:39'),
(163, 246, 1, '2023-08-06 13:39:05', '2023-08-06 13:39:05'),
(165, 247, 1, '2023-08-06 22:34:04', '2023-08-06 22:34:04'),
(166, 248, 1, '2023-08-07 11:15:44', '2023-08-07 11:15:44'),
(167, 251, 1, '2023-08-10 08:55:26', '2023-08-10 08:55:26'),
(168, 252, 1, '2023-08-10 08:56:04', '2023-08-10 08:56:04'),
(169, 253, 1, '2023-08-10 08:56:31', '2023-08-10 08:56:31'),
(170, 254, 1, '2023-08-10 10:00:45', '2023-08-10 10:00:45'),
(171, 255, 1, '2023-08-10 17:56:14', '2023-08-10 17:56:14'),
(173, 256, 1, '2023-08-10 22:11:59', '2023-08-10 22:11:59'),
(179, 257, 1, '2023-08-12 08:49:46', '2023-08-12 08:49:46'),
(180, 258, 1, '2023-08-12 22:00:37', '2023-08-12 22:00:37'),
(181, 260, 1, '2023-08-13 17:35:27', '2023-08-13 17:35:27'),
(182, 261, 1, '2023-08-14 14:40:02', '2023-08-14 14:40:02'),
(183, 262, 1, '2023-08-14 21:01:19', '2023-08-14 21:01:19'),
(184, 263, 1, '2023-08-15 12:39:06', '2023-08-15 12:39:06'),
(185, 264, 1, '2023-08-19 10:20:07', '2023-08-19 10:20:07'),
(186, 265, 1, '2023-08-20 11:58:13', '2023-08-20 11:58:13'),
(187, 266, 1, '2023-08-21 14:37:57', '2023-08-21 14:37:57'),
(188, 267, 1, '2023-08-21 21:27:26', '2023-08-21 21:27:26'),
(189, 268, 1, '2023-08-22 20:46:39', '2023-08-22 20:46:39'),
(190, 269, 1, '2023-08-24 09:57:07', '2023-08-24 09:57:07'),
(192, 271, 1, '2023-08-25 08:25:57', '2023-08-25 08:25:57'),
(193, 270, 4, '2023-08-25 09:00:03', '2023-08-25 09:00:03'),
(194, 273, 1, '2023-08-27 16:07:04', '2023-08-27 16:07:04'),
(199, 275, 11, '2023-08-28 13:53:56', '2023-08-28 13:53:56'),
(200, 276, 11, '2023-08-28 14:01:15', '2023-08-28 14:01:15'),
(201, 277, 1, '2023-08-29 09:16:31', '2023-08-29 09:16:31'),
(202, 278, 1, '2023-08-29 11:30:01', '2023-08-29 11:30:01'),
(203, 286, 1, '2023-09-01 09:23:08', '2023-09-01 09:23:08'),
(204, 287, 1, '2023-09-01 13:27:46', '2023-09-01 13:27:46'),
(205, 289, 1, '2023-09-02 17:11:24', '2023-09-02 17:11:24'),
(206, 293, 1, '2023-09-14 21:14:49', '2023-09-14 21:14:49');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `serial` int(11) DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `name`, `serial`, `creator`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'super_admin', 1, NULL, 'super_admin', 1, '2023-02-07 12:54:42', '2023-02-07 12:54:42'),
(2, 'Teacher', 2, '1', 'admin', 1, '2023-02-07 12:54:42', '2023-08-25 02:03:28'),
(3, 'Tài Khoản bị khóa', 3, '1', 'modarator', 1, '2023-02-07 12:54:42', '2023-03-27 01:59:10'),
(4, 'Người dùng vãng lai', 4, '1', 'user', 1, '2023-02-07 12:54:42', '2023-03-18 09:54:15'),
(5, 'Học sinh có tài khoản', 5, '1', 'subscriber', 1, '2023-02-07 12:54:42', '2023-03-18 09:54:53');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `audio01` varchar(100) DEFAULT NULL,
  `audio02` varchar(100) DEFAULT NULL,
  `audio03` varchar(100) DEFAULT NULL,
  `file01` varchar(100) DEFAULT NULL,
  `file02` varchar(100) DEFAULT NULL,
  `file03` varchar(100) DEFAULT NULL,
  `video01` varchar(100) DEFAULT NULL,
  `video02` varchar(100) DEFAULT NULL,
  `video03` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `name`, `description`, `image`, `audio01`, `audio02`, `audio03`, `file01`, `file02`, `file03`, `video01`, `video02`, `video03`, `status`, `created_at`, `updated_at`) VALUES
(35, 'Morning Day 1', '<p>Morning Day 1<br></p>', NULL, NULL, NULL, NULL, 'uploads/lessons/morning-date-1/YSpCNmraIgcMhYIVFzDqgYUt8IHlZMFIsQGTFLNG.pdf', NULL, NULL, 'uploads/lessons/morning-date-1/Xmqibs9u2QBaoSJ3iVKGw7TP5cYTxbFbS70GlsOJ.mp4', NULL, NULL, 1, '2023-03-16 01:18:25', '2023-08-07 02:40:04'),
(36, 'Midday Day 1', '<p>Midday Day 1<br></p>', NULL, NULL, NULL, NULL, 'uploads/lessons/midday-date-1/MEb7NafG3BQVfXE4acOQR9uLuzOZOIYM9A8V1nD9.pdf', NULL, NULL, 'uploads/lessons/midday-date-1/peBZCGXvhcn4Mw0DndfW1OXKOgFjoscLB5VH4QNr.mp4', NULL, NULL, 1, '2023-03-16 02:26:20', '2023-08-07 02:40:27'),
(37, 'Evening Day 1', 'Evening Day 1', NULL, NULL, NULL, NULL, 'uploads/lessons/evening-date-1/TaEcx7r5sUzNBUjC7PhD8X9X1Zxlh4zNbJTJAE5n.pdf', 'uploads/lessons/evening-date-1/s0aGrfa4zjIZXcQGgbAwCxpa62YWv8Da3tOUqXU1.pdf', NULL, 'uploads/lessons/evening-date-1/VhQqkSuHS0PQWBUKyAc0BkZSGWgs9HQwN3CPTUVe.mp4', NULL, NULL, 1, '2023-03-16 02:30:59', '2023-08-07 02:40:45'),
(38, 'Morning Day 2', '<p>Morning Day 2<br></p>', NULL, NULL, NULL, NULL, 'uploads/lessons/morning-date-2/QCuyRzdL4qmyUVjMIkTtmJkwlIwQBwmnE7hcxyN3.pdf', NULL, NULL, 'uploads/lessons/morning-date-2/rQ4xTiycr5ZP4MHI4iFG5X9bg3YA476odV1BDmkw.mp4', NULL, NULL, 1, '2023-03-18 01:43:29', '2023-08-07 02:44:00'),
(39, 'Midday Day 2', '<p>Midday Day 2<br></p>', NULL, NULL, NULL, NULL, 'uploads/lessons/midday-date-2/Ynhw0KB6K3ERE5kKn1ytk95AZdtfHEV8ksNXpese.pdf', NULL, NULL, 'uploads/lessons/midday-date-2/VE2Rk9NrsQqph44ZcJThfJ6wpEbZ7ZuxAlcATYds.mp4', NULL, NULL, 1, '2023-03-18 01:49:36', '2023-08-07 02:47:30'),
(40, 'Evening Date 2', '<p>Evening Date 2<br></p>', NULL, NULL, NULL, NULL, 'uploads/lessons/evening-date-2/0b6sSM52xOVrrIJp8HDl5IkbguupfrfztPpBPrPd.pdf', NULL, NULL, 'uploads/lessons/evening-date-2/bZmFxHuCAntqoq3D2MBfm4Wfcw5F6exRD3r6Rehz.mp4', NULL, NULL, 1, '2023-03-18 01:53:45', '2023-03-18 01:53:46'),
(41, 'Morning Day 3', '<p>Morning Day 3<br></p>', NULL, NULL, NULL, NULL, 'uploads/lessons/morning-date-3/otnwzlPQgAD5U1zn7R4ixLgy2B0DjLAOxydIUhPb.pdf', NULL, NULL, 'uploads/lessons/morning-date-3/YY9kosEn44Nh5httMIXabNANA1Nnsfj1VmLP2qhM.mp4', NULL, NULL, 1, '2023-03-18 01:56:14', '2023-08-07 02:47:51'),
(42, 'Midday Day 3', '<p>Midday Day 3<br></p>', NULL, NULL, NULL, NULL, 'uploads/lessons/midday-date-3/6KnRYERU03rukn8O5jaG87aYC5uvc1XuDIzehtqb.pdf', NULL, NULL, 'uploads/lessons/midday-date-3/TlFG6IbCsBxqhmbPQbVwyuuuDCDu4yup3OvpB6NS.mp4', NULL, NULL, 1, '2023-03-18 02:01:09', '2023-08-07 02:48:24'),
(43, 'Evening Day 3', '<p>Evening Day 3<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/lessons/evening-date-3/rkjNSghLAyiYFueD1ZM54SKcurIOw8HzuAqdgMW4.mp4', NULL, NULL, 1, '2023-03-18 02:03:16', '2023-08-07 02:49:02'),
(44, 'Morning Day 4', '<p>Morning Day 4<br></p>', NULL, NULL, NULL, NULL, 'uploads/lessons/morning-date-4/oMotq3T9TiJItnyIPHzHLS6cjeVqrisO3Ki4zZOz.pdf', NULL, NULL, 'uploads/lessons/morning-date-4/WzMx7yNPTAAOWNuNtJUue9VdvCVurz1TEKUUulRJ.mp4', NULL, NULL, 1, '2023-03-20 04:12:07', '2023-08-07 02:49:24'),
(45, 'Midday Day 4', 'Midday Day 4', NULL, NULL, NULL, NULL, 'uploads/lessons/midday-date-4/hlxQIatE4one41gKjs9bBWh1tB0zcftUZLtd0hED.pdf', NULL, NULL, 'uploads/lessons/midday-date-4/TwB9CKAWzZR2a1AxLXjjou34FhiTIsVLhy3EVe9g.mp4', NULL, NULL, 1, '2023-03-20 04:15:16', '2023-08-07 02:50:50'),
(46, 'Evening Day 4', '<p>Evening Day 4<br></p>', NULL, NULL, NULL, NULL, 'uploads/lessons/evening-date-4/bNh3NgaqCu8IEV24DVRmD4wYsELptI1x0CuNVvCa.pdf', NULL, NULL, 'uploads/lessons/evening-date-4/D2fcXj9BacA0KdWbEKaV36Da9kGCijVC4JsEHsDW.mp4', NULL, NULL, 1, '2023-03-20 04:38:29', '2023-08-07 02:51:02'),
(47, 'Morning Day 5', '<p>Morning Day 5<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/lessons/morning-date-5/uvxuByYhKOUZPTZG33DSymmvQK0mP8JR221TquYR.mp4', NULL, NULL, 1, '2023-03-20 05:46:56', '2023-08-07 02:53:21'),
(48, 'Midday Day 5', '<p>Midday Day 5<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/lessons/midday-date-5/DX7dz8vLNs6JLCq4cOOfuXT3Ei0h50hkQCpR9cW7.mp4', NULL, NULL, 1, '2023-03-20 06:28:50', '2023-08-07 02:56:10'),
(50, 'Evening Day 5', 'Evening Day 5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/lessons/evening-date-5/5Uqohbyennq8k0DDZYRDTSui1kKdHclksF8oieGp.mp4', NULL, NULL, 1, '2023-03-20 07:20:38', '2023-08-07 02:56:23'),
(51, 'Morning Day 6', '<p>Morning Day 6<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/lessons/morning-date-6/zwJrdZO6wFEmMxKNtxZxTmaacFuOEdNAWFN2yLYu.mp4', NULL, NULL, 1, '2023-03-27 11:21:52', '2023-08-07 02:56:40'),
(52, 'Midday Day 6', 'Midday Day 6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/lessons/midday-date-6/pP3HIv1rzJMM4ZFRvnJuwfUYerFiCzrxcqoYmH01.mp4', NULL, NULL, 1, '2023-03-27 11:29:45', '2023-08-07 03:07:06'),
(53, 'Evening Day 6', 'Evening Day 6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/R7fdT4pBMmnuBKk6TqfTVpeN4N2yOJL4bA3Uqqfu.mp4', NULL, NULL, 1, '2023-03-27 11:31:29', '2023-08-07 03:08:11'),
(54, 'Day 7 - Recording', '<p>Day 7 - Recording<br></p>', NULL, NULL, NULL, NULL, 'uploads/lessons/date-7-recording/ZioUtzKRk4zyWoAjsl6HxGrfWM2dwKvMn33xPSUD.jpg', NULL, NULL, NULL, NULL, NULL, 1, '2023-03-27 14:08:14', '2023-08-07 03:08:26'),
(55, 'Morning Day 8', '<p>Morning Day 8<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/lessons/morning-date-8/UtqqKER0FdlsyEtdYzWdp7WbhyPRFN86gqFk2nU4.mp4', NULL, NULL, 1, '2023-04-01 02:01:53', '2023-08-07 03:10:41'),
(56, 'Midday Day 8', '<p>Midday Day 8<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/lessons/midday-date-8/tAyM34w29Hg56p08SzDOi3tc4qX9XcLD0yY1QLUu.mp4', NULL, NULL, 1, '2023-04-01 02:32:37', '2023-08-07 03:10:56'),
(57, 'Evening  Day 8', '<p>Evening&nbsp; Day 8<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/lessons/evening-8/e5AcLgHTNad27FoNRSx3O6mRuAbXFGl5A9LWeIh7.mp4', NULL, NULL, 1, '2023-04-01 02:38:14', '2023-08-07 03:11:08'),
(58, 'Morning Day 9', '<p>Morning Day 9<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/lessons/morning-date-9/gc99E1xpFyYV9T2sPAKFAS7m2kMz3m1LnVi4dBJy.mp4', NULL, NULL, 1, '2023-04-01 02:44:35', '2023-08-07 03:11:23'),
(59, 'Midday Day 9', '<p>Midday Day 9<br></p>', NULL, NULL, NULL, NULL, 'uploads/lessons/evening-date-9/ostP6n9ymkzOMtByQ26XnwgFlWs5WvTYIoVDndlt.pdf', NULL, NULL, 'uploads/lessons/evening-date-9/IwlTNksiL1n31ecMgyTkLU24khVFXbMDt0jinYWV.mp4', NULL, NULL, 1, '2023-04-01 04:11:08', '2023-08-07 03:11:39'),
(60, 'Evening Day 9', '<p>Evening Day 9<br></p>', NULL, NULL, NULL, NULL, 'uploads/lessons/evening-date-9/y3FQRg4fpkikVvE8Wmg8dzssqn2QX2XxpRgelkDg.pdf', NULL, NULL, 'uploads/lessons/evening-date-9/EWUcwlNJxKZVaE2vDOd3ELBgjU0NGhgel8VVZZBR.mp4', NULL, NULL, 1, '2023-04-07 09:01:29', '2023-08-07 03:11:53'),
(61, 'Morning Date 10', '<p>Morning Date 10<br></p>', NULL, NULL, NULL, NULL, 'uploads/lessons/morning-date-10/5EvWX607KTmXhiDIXCOM9b2esKQ4t9wD8IZ9Mt2s.mp4', NULL, NULL, 'uploads/lessons/morning-date-10/NDdouitiikICHnF357DBkqCcOYYpR3DFqtQTTJLG.mp4', NULL, NULL, 1, '2023-04-07 10:50:25', '2023-04-07 10:56:39'),
(62, 'Midday Day 10', 'Midday Day 10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/lessons/midday-date-10/27YD2HLsPfQ4Mn5MbItIT4xyBfSHi7fJuFIIbu0P.mp4', NULL, NULL, 1, '2023-04-07 10:52:18', '2023-08-07 03:24:02'),
(63, 'Evening Day 10', '<p>Evening Day 10<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/lessons/evening-date-10/LfFJU1JBVMZSzCZ05ZC8UcYjvbOXgCF4mb7L75aq.mp4', NULL, NULL, 1, '2023-04-08 02:01:12', '2023-08-07 03:24:09'),
(64, 'Morning Day 11', 'Morning Day 11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/lessons/morning-date-11/gdvUj11sQT0IVSJtmlSV0F5rbhbZAlw1v2U7YKaZ.mp4', NULL, NULL, 1, '2023-04-08 02:07:13', '2023-08-07 03:24:21'),
(65, 'Midday Day 11', '<p>Midday Day 11<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/lessons/midday-date-11/wOyfzAcZQ1ko91Y8VZJay9f4leIgPS2N5naN6Cdy.mp4', NULL, NULL, 1, '2023-04-14 10:39:06', '2023-08-07 03:24:28'),
(66, 'Evening Day 11', '<p>Evening Day 11<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/lessons/evening-date-11/VlCGM2ympiYch5FgvIiTHNiqmOKztaLgLR8wzi9c.mp4', NULL, NULL, 1, '2023-04-14 10:49:52', '2023-08-07 03:25:19'),
(67, 'Morning Day 12', '<p>Morning Day 12<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/lessons/morning-date-12/HAd43qO9OxXm5T021eWZDpUDNfaQBlmIMHNaz1jD.mp4', NULL, NULL, 1, '2023-04-14 11:01:53', '2023-08-07 03:25:29'),
(68, 'Midday Day 12', 'Midday Day 12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/lessons/midday-12/qiC4Hj25BpUHGwuqjOmM8Yb4iMX1xfNwhCLRGFAI.mp4', NULL, NULL, 1, '2023-04-14 11:23:25', '2023-08-07 03:25:35'),
(69, 'Evening Day 12', '<p>Evening Day 12<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/lessons/evening-date-12/qsIUFdV7g6Q4gc7IMcyFRrKN3P9nSMxUIlDWy0FG.mp4', NULL, NULL, 1, '2023-04-14 13:57:12', '2023-08-07 03:25:42'),
(70, 'Morning Day 13', 'Morning Day 13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/lessons/morning-date-13/wPxwF7szdbab3DQuh2VHjQsb2a3yxzJqgX8WKfhQ.mp4', NULL, NULL, 1, '2023-04-14 13:58:03', '2023-08-07 03:25:50'),
(71, 'Midday  Day 13', 'Midday&nbsp; Day 13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/lessons/midday-date-13/RJg0SmKmHtpH5Pyf7RCwXErvETZx6GjgVIJSz2sE.mp4', NULL, NULL, 1, '2023-04-14 13:59:44', '2023-08-07 03:25:57'),
(72, 'Evening Day 13', '<p>Evening Day 13<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/lessons/evening-date-13/fg3gE4OtWijSw2MMB9JMWPrEbCb0grhmYWAJtpjO.mp4', NULL, NULL, 1, '2023-04-15 00:27:27', '2023-08-07 03:26:05'),
(73, 'Filming yourself - Day 14', '<p>Filming yourself - Day 14<br></p>', NULL, NULL, NULL, NULL, 'uploads/lessons/filming-yourself-date-14/ShLVgcQJGcX8nn5uWlgYKIQBhXACI1woGtLH1Tr5.pdf', NULL, NULL, NULL, NULL, NULL, 1, '2023-04-26 07:12:35', '2023-08-07 03:26:20'),
(75, 'Midday- Day 15', '<p>Midday- Day 15<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/lessons/midday-date-15/3D6JBKIwv06NChnNwkiTHklguEbElIgdZogr0AZP.mp4', NULL, NULL, 1, '2023-04-26 07:36:09', '2023-08-07 03:26:30'),
(76, 'Evening Day 15', '<p>Evening Day 15<br></p>', NULL, NULL, NULL, NULL, 'uploads/lessons/evening-date-15/UxNWMAtButaWyv6ahuYdPLDN7OVeGThLMsHXLtoV.jpg', NULL, NULL, 'uploads/lessons/evening-date-15/TXGsK6pLWU2yZa0iRJBP4e0QYh2U5CjPtKB8y9v5.mp4', NULL, NULL, 1, '2023-04-26 08:21:30', '2023-08-07 03:26:37'),
(77, 'Morning Day 16', '<p>Morning Day 16<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/lessons/morning-date-16/56kPXIDyRX3Ow5VL68NJtQxemqG81RPTGfMlp59P.mp4', NULL, NULL, 1, '2023-04-26 08:37:23', '2023-08-07 03:29:47'),
(78, 'Midday Day 16', '<p>Midday Day 16<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/lessons/midday-date-16/CFH6qqfCj62fDP13cGoLWIOwiDLcDfxA9FPgDKo9.mp4', NULL, NULL, 1, '2023-04-26 08:58:17', '2023-08-07 03:29:55'),
(79, 'Evening Day 16', '<p>Evening Day 16<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/lessons/evening-date-16/SxSj86qnbvLZ3FClCikvez68cmdmdXhOoPlHTvuw.mp4', NULL, NULL, 1, '2023-04-26 08:59:27', '2023-08-07 03:30:04'),
(80, 'Morning Day 17', 'Morning Day 17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/lessons/morning-date-17/lVZVKX3HqBk8hf6zZ1THvY1tV8PjgfgnkZR3SFsB.mp4', NULL, NULL, 1, '2023-04-26 09:10:07', '2023-08-07 03:30:12'),
(81, 'Midday Day 17', '<p>Midday Day 17<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/lessons/midday-date-17/ysrf1Xfdi7sE9Gv9zvbTXUkU9Rh2aVBfxswfeDRm.mp4', NULL, NULL, 1, '2023-04-26 09:31:54', '2023-08-07 03:30:20'),
(82, 'Evening Day 17', 'Evening Day 17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/lessons/evening-date-17/CjZmceW1JPmAfpQW4RygXzmhEDtUATOBqIplbvlJ.mp4', NULL, NULL, 1, '2023-04-26 09:55:41', '2023-08-07 03:30:27'),
(83, 'Morning Day 18', '<p>Morning Day 18<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/lessons/morning-date-18/omukIXZSbYSMWr9LR5leAh1AdekjEoYsZFU3sDZf.mp4', NULL, NULL, 1, '2023-04-26 10:04:46', '2023-08-07 03:30:33'),
(85, 'Midday Day 18', '<p>Midday Day 18<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/lessons/midday-date-18/qLWjM7Wq4XWz28bDJRGvQy0zVl9enFxEd1EL4ovW.mp4', NULL, NULL, 1, '2023-04-26 10:30:46', '2023-08-07 03:30:41'),
(86, 'Evening Day 18', 'Evening Day 18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/63TqQ28etblLE7vhlkQvzpr611C6yJ5Wp8vPZbVN.mp4', 'uploads/file/63TqQ28etblLE7vhlkQvzpr611C6yJ5Wp8vPZbVN.mp4', NULL, 1, '2023-04-26 10:31:24', '2023-08-07 03:30:56'),
(87, 'Morning Day 19', '<p>Morning Day 19<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/mHpFB8JgsYAwNv3wakfsWzFfWPKP6Kc1GEOeQ5Bx.mp4', NULL, NULL, 1, '2023-04-26 10:39:00', '2023-08-07 03:31:06'),
(88, 'Midday Day 19', 'Midday Day 19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/lessons/midday-date-19/xDs5xrkAdrkXr4RcTCC39vY4oTnysjDr7d5gqkBm.mp4', NULL, NULL, 1, '2023-04-26 10:50:08', '2023-08-07 03:32:13'),
(89, 'Evening Day 19', '<p>Evening Day 20<br></p>', NULL, NULL, NULL, NULL, 'uploads/lessons/evening-date-19/xxMRCdFqW6hbyqn0lOZu9jMFnPR565DCSXcgEWc5.pdf', NULL, NULL, 'uploads/lessons/evening-date-20/H8u1MAsuPz0U5bmZCmZ3oqh6mrp4DeZHLX9De38q.mp4', NULL, NULL, 1, '2023-04-26 11:10:48', '2023-08-07 03:32:21'),
(90, 'Morning Day 20', '<p>Morning Day 20<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/lessons/morning-date-20/qplXmOevLPlqtJrqqb3AsQL48uV8AKk58AGiHqXt.mp4', NULL, NULL, 1, '2023-04-26 11:37:52', '2023-08-07 03:32:35'),
(91, 'Midday Day 20', 'Midday Day 12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/lessons/midday-date-12/qggWf1V68kDABB7dLznb86HGEXfdwkwmKM6dl6Sx.mp4', NULL, NULL, 1, '2023-04-26 11:50:54', '2023-08-07 03:33:08'),
(92, 'Evening Day 20', 'Evening Day 20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/lessons/evening-date-20/otA2b8NQtj8j8LfMhgQvd0qGV1sl96cErkHHv8Gs.mp4', NULL, NULL, 1, '2023-04-26 11:53:01', '2023-08-07 03:33:31'),
(94, 'Filming yourself - Day 21', '<p>Filming yourself - Day 21<br></p>', NULL, NULL, NULL, NULL, 'uploads/lessons/filming-yourself-date-21/xt4fBinmcq7nd9eeRPUd9DKRG1P4AZPvwtzTAdqq.pdf', NULL, NULL, NULL, NULL, NULL, 1, '2023-04-27 06:14:09', '2023-08-07 03:33:39'),
(98, 'Morning Day 15', '<p><span style=\"color: rgba(255, 255, 255, 0.85); font-family: Roboto, sans-serif; font-size: 15px; white-space: nowrap; background-color: rgba(0, 0, 0, 0.2);\">Morning Day 15</span><br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/cNOF2XqD0gWsBnH7yJ4w6wVoeCrYKs70XLPSNFwn.mp4', NULL, NULL, 1, '2023-06-06 23:12:41', '2023-08-07 03:33:46'),
(99, 'pronunciation 1', '<p>Pronunciation 1</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/OsmtdXRHmNBss3Ll3ZmvVZVYayAJFwsaZiiLY36Q.mp4', NULL, NULL, 1, '2023-06-18 23:34:13', '2023-06-18 23:34:13'),
(100, 'Pronunciation 2', '<p>Pronunciation 2&nbsp;<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/uuxQ9IxJQpzsIXM3CiQCOzhxLz48lyriLxtOhosK.mp4', NULL, NULL, 1, '2023-06-18 23:37:39', '2023-06-18 23:37:39'),
(101, 'Vocabulary  Lesson 1', '<p>Vocabulary  Les 1<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/mRBlqa2bXaEYKT3qvBkdtNguBp761sw2g2rqa7Xm.mp4', NULL, NULL, 1, '2023-06-18 23:39:05', '2023-06-19 00:47:03'),
(102, 'Vocabulary lesson 2', '<p>Vocabulary lesson 2<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/UOKE10c2TxAeZU6aOfp6tPwDdglZS7xDSEIMnJXI.mp4', NULL, NULL, 1, '2023-06-18 23:41:34', '2023-06-18 23:41:34'),
(103, 'Vocabulary Lesson 3', '<p>Vocabulary Lesson 3<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/0cvpJWrc7LN2tNjCst8om0zL4kUKrCVFbF3HqevF.mp4', NULL, NULL, 1, '2023-06-18 23:44:26', '2023-06-19 00:07:27'),
(104, 'Vocabulary Lesson 4', 'Vocabulary Lesson 4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/W7eAAblTwsKooJcfKXnyHnFZ9eICxRn0jJGDQi2w.mp4', NULL, NULL, 1, '2023-06-18 23:45:14', '2023-06-19 00:08:06'),
(105, 'Pronunciation Lesson 5', 'Pronunciation Lesson 5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/BQBBAe98ZURFx1KWMU1ROluhEjJWUDwPLRB7vYnk.mp4', NULL, NULL, 1, '2023-06-18 23:45:52', '2023-06-19 00:09:38'),
(106, 'Pronunciation  Lesson 6', 'Pronunciation  6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/MQWLltnp3FCY8YVbzKzZo3HLHbHBRWmkSDCYwYcx.mp4', NULL, NULL, 1, '2023-06-18 23:46:34', '2023-06-19 00:46:43'),
(107, 'Pronunciation Les  7', 'Pronunciation Les&nbsp; 7&nbsp;', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/PxuCfC6eXphCXHMLH45TdPBDki3E8vyz6KjCpZek.mp4', NULL, NULL, 1, '2023-06-18 23:47:14', '2023-06-18 23:47:14'),
(108, 'Vocabulary Lesson 5', '<p>VOCABULARY 5</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/fBBW8R4Kq5Dltm9QihlKzVOd4KynlsvoQcFr9JdI.mp4', NULL, NULL, 1, '2023-06-19 00:28:32', '2023-06-19 00:28:32'),
(109, 'Vocabulary Lesson 6', 'Vocabulary Lesson 6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/xNrgrqFrujq39qx7YsbamM6fq6WXRO7vKHPkyLfb.mp4', NULL, NULL, 1, '2023-06-19 00:30:10', '2023-06-19 00:41:16'),
(110, 'Vocabulary Lesson 7', 'Vocabulary Lesson 7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/DfvdH2XzD8HfW9YYGV0m2rVrhcyrf6IAQQUZKvPY.mp4', NULL, NULL, 1, '2023-06-19 00:30:44', '2023-06-19 00:30:44'),
(111, 'Vocabulary Lesson 8', 'Vocabulary Lesson 8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/TJdosbsNkgOPiJ3E6vjgledcgGcbNnNUWP1nCJVQ.mp4', NULL, NULL, 1, '2023-06-19 00:31:36', '2023-06-19 00:31:36'),
(112, 'Vocabulary Lesson 9', '<p>Vocabulary Lesson 9<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/gdJzG0nw9CXuOqJCPLryLKc1ZneN7np492ozy41n.mp4', NULL, NULL, 1, '2023-06-19 00:37:48', '2023-06-19 00:37:48'),
(113, 'vocabulary Lesson 10', 'vocabulary Lesson 10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/Wfwzt2AJi2tPWN95BYKUKnzrWwpKQlX11t8GcRrk.mp4', NULL, NULL, 1, '2023-06-19 00:39:17', '2023-06-19 00:39:17'),
(114, 'Vocabulary Lesson 11', 'Vocabulary Lesson 11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/XgwmhJAqIz7tDKf0SUAAlnc7iT643dOTadkvmlR6.mp4', NULL, NULL, 1, '2023-06-19 00:40:01', '2023-06-19 00:40:01'),
(115, 'Day 22 Morning', '<p>&nbsp;Day 22 Morning<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/e2Z2602y64u7wU2FjBGanXkrfmTdROu3iq0NBLhJ.mp4', NULL, NULL, 1, '2023-06-22 15:53:15', '2023-08-07 03:35:18'),
(116, 'Day 22 Midday', '&nbsp;Day 22 Midday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/TK9OQXqxjWbJrukPaGsSV5PT9nNfht4vYlQnaPkg.mp4', NULL, NULL, 1, '2023-06-22 15:54:00', '2023-08-07 03:36:05'),
(117, 'Everning Day 22', 'Everning Day 22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/aePJu5wPzFjsCaQFSbasN8GaHDOlodCmPUWRi6be.mp4', NULL, NULL, 1, '2023-06-22 15:54:26', '2023-08-07 03:36:13'),
(118, 'Morning Day 23', 'Morning Day 23&nbsp;', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/00yNZ0q0FrFVQCn7zVpwo2klB23l5U3bATDqXKCc.mp4', NULL, NULL, 1, '2023-06-22 15:54:52', '2023-08-07 03:36:20'),
(119, 'Day 23 Midday', '<p>Day 23 Midday<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/l9bRPPRzXVjmoqG3FwMAw7lgDRgeWxbN5kHGgOQL.mp4', NULL, NULL, 1, '2023-06-22 15:55:27', '2023-08-07 03:36:28'),
(120, 'Day 23 Everning', 'Everning Day 23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/7cUbfUdXRsGu2wkQJsVQ6t7ytj74h9kPzYBwSqzW.mp4', NULL, NULL, 1, '2023-06-22 15:55:40', '2023-08-07 03:36:43'),
(121, 'Day 24 Morning', '&nbsp;Day 24 Morning', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/YLhirKm3qSah2DE3fON5UeMyssBwFcqxwjrUAv7B.mp4', NULL, NULL, 1, '2023-06-22 15:56:00', '2023-08-07 03:36:54'),
(122, 'Day 24 Midday', 'Day 24 Midday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/nhEJs7aJv5Z0MKfv5eNnlpaTxT25jhoUoXHQI7S8.mp4', NULL, NULL, 1, '2023-06-22 15:56:18', '2023-08-07 03:43:00'),
(123, 'Day 24 Evening', '&nbsp;Day 24 Evening', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/zTaBzUicvm6RFQULaevI1EpsrxeHK985dqdTaGJa.mp4', NULL, NULL, 1, '2023-06-22 15:56:34', '2023-08-07 03:43:14'),
(124, 'Day 25 Morning', '&nbsp;Day 25 Morning', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/5PQXeicmVRbxOsAdt805zq2FhV9jmLUTvRMs2LbJ.mp4', NULL, NULL, 1, '2023-06-22 15:56:47', '2023-08-07 03:43:24'),
(125, 'Day 25 Midday', '&nbsp;Day 25 Midday&nbsp;', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/v9cjfMyXk2ErnS5mTomXFIf53g21Y1Qv39kgHTgU.mp4', NULL, NULL, 1, '2023-06-22 15:57:21', '2023-08-07 03:43:45'),
(126, 'Day 25 Eveningy', '&nbsp;Day 25 Evening', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/TCGnJBFJOGda7LRNSRtlOQz3lCimGwUQ1rUnlwBB.mp4', NULL, NULL, 1, '2023-06-22 15:57:39', '2023-08-07 03:44:15'),
(127, 'Day 26 Morning', '&nbsp;Day 26 Morning', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/6WE2gDgwKb89HOngofHyaK6YX2U5KAaMh2nPMFOU.mp4', NULL, NULL, 1, '2023-06-22 15:58:01', '2023-08-07 03:44:34'),
(128, 'Day 26 Midday', '&nbsp;Day 26 Midday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/W7TRbVHXFll5vNm54QqbH86nClFEUeF8Vya7J0OJ.mp4', NULL, NULL, 1, '2023-06-22 15:58:17', '2023-08-07 03:44:49'),
(129, 'Day 26 Evening', '&nbsp;Day 26 Evening', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/D1LYx6sPqkMInLvT3VXpoEPRHa0sA9GIcRsMRFDN.mp4', NULL, NULL, 1, '2023-06-22 15:58:28', '2023-08-07 03:45:00'),
(130, 'Day 27 Morning', '<p>Day 27 Morning<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/fKdtHbkzHtXyermHr2WcuT5laBO3fJLgvQ3mvtuM.mp4', NULL, NULL, 1, '2023-06-24 05:56:26', '2023-08-07 03:45:11'),
(131, 'Day 27 Midday', 'Day 27 Midday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/j4VM0KxWgJwWwmXU5oUMHxt9mJP2BggXW82yCJsx.mp4', NULL, NULL, 1, '2023-06-24 05:56:52', '2023-08-07 03:47:05'),
(132, 'Day 27 Evening', 'Day 27 Evening', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/bUDCXEqo2OJr3HxfTLGyF8rHr9PEeyZUwglk0pNa.mp4', NULL, NULL, 1, '2023-06-24 05:57:12', '2023-08-07 03:47:56'),
(133, 'Day 28- Filming yourself', '<p>Day 28<br></p>', NULL, NULL, NULL, NULL, 'uploads/file/Pide2Hh0eXLgpvJ4eIa3jyfxHRNhMUiDlTRxXWyv.pdf', NULL, NULL, NULL, NULL, NULL, 1, '2023-06-24 05:59:46', '2023-08-07 03:48:02'),
(136, 'Day 29 Morning', 'Day 29 Morning', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/kWlk0hLrFd005TzORmBEdgVYGP6z2gFFfYWIRdIf.mp4', NULL, NULL, 1, '2023-06-24 06:00:45', '2023-08-07 03:48:08'),
(137, 'Day 29 Midday', 'Day 29 Midday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/1VncVQnKAaIMdIYfb7r2xqiFz4GP4urk3InjF2JO.mp4', NULL, NULL, 1, '2023-06-24 06:01:03', '2023-08-07 03:48:15'),
(138, 'Day 29 Evening', 'Day 29 Evening', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/szr8wJTjPcJNSSsvaXnunqXl0v3QqDGeyuA0QW8G.mp4', NULL, NULL, 1, '2023-06-24 06:01:16', '2023-08-07 03:48:24'),
(139, 'Date 30 Morning', 'Date 30 Morning', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/zQJqpoykcjhZzIuxXEaMJOzSNb9f48ip5mIEtXBd.mp4', NULL, NULL, 1, '2023-06-24 06:01:31', '2023-06-24 06:01:31'),
(140, 'Date 30 Midday', 'Date 30 Midday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/wUH4220h1vBJEHwfntAYtSP47ChzdJW5feSHfu9u.mp4', NULL, NULL, 1, '2023-06-24 06:01:44', '2023-06-24 06:01:44'),
(141, 'Date 30 Evening', 'Date 30 Evening', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/w3uOkSUQTjMhruLZvQVs9kqsMnZDKVS4aRgEvfi1.mp4', NULL, NULL, 1, '2023-06-24 06:01:54', '2023-06-24 06:01:54'),
(142, 'Day 31 Morning', 'Day 31 Morning', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/xsGwY3UUPTyS0BwbfRWlOGdahzupUPczqkD1E2YU.mp4', NULL, NULL, 1, '2023-06-24 06:02:09', '2023-06-24 06:02:09'),
(143, 'Day 31 Midday', 'Day 31 Midday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/uVlKnBNIoJyJ0YrkYZOtHHlRkjIMNN92QXa4iuZB.mp4', NULL, NULL, 1, '2023-06-24 06:02:17', '2023-06-24 06:02:17'),
(144, 'Day 31 Evening', 'Day 31 Evening', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/EPjzZt667nUjwnrtGXRaO4Jokv1kqSYE7QH6fZRZ.mp4', NULL, NULL, 1, '2023-06-24 06:02:27', '2023-06-24 06:02:27'),
(145, 'Day 32 Morning', 'Day 32 Morning', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/Rx8bJ0vNCYOvew1NDQqk7Zm0lgCMz05BpN0k4I6Q.mp4', NULL, NULL, 1, '2023-06-24 06:02:38', '2023-08-07 03:52:22'),
(146, 'Day 32 Midday', 'Day 32 Midday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/7o5zIEowvT3jq0jtZcnakbDK8tAtJC566hzLvEe6.mp4', NULL, NULL, 1, '2023-06-24 06:02:56', '2023-08-07 03:52:32'),
(147, 'Day 32 Evening', 'Day 32 Evening', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/qvLeReCj6C41CONWcexNd1rhMGjK4R3vjmvL5iIz.mp4', NULL, NULL, 1, '2023-06-24 06:03:03', '2023-08-07 03:52:39'),
(148, 'Day 33 Morning', 'Day 33 Morning', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/D3pC3RJIh6J8QS1KWP0FgCMQ5g1tpWNvozC6jVor.mp4', NULL, NULL, 1, '2023-06-24 06:03:14', '2023-08-07 03:52:45'),
(149, 'Day 33 Midday', 'Day 33 Midday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/Bz8t5RTCVY43bkdZQScwLEdhV5oXj5OTswLyHbmC.mp4', NULL, NULL, 1, '2023-06-24 06:03:36', '2023-08-07 03:52:52'),
(150, 'Day 33 Evening', 'Day 33 Evening', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/6Ox6MQZdkLM3ajGx62DZedhgWWcGHuGMz8BBnX2s.mp4', NULL, NULL, 1, '2023-06-24 06:03:49', '2023-08-07 03:53:01'),
(151, 'Day 34 Morning', 'Day 34 Morning', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/AYgQUEi4GAbj0XvgozFTZkf8hBGhrVmQdeTlDMcH.mp4', NULL, NULL, 1, '2023-06-24 06:04:01', '2023-08-07 03:53:08'),
(152, 'Day 34 Midday', 'Day 34 Midday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/IeUQEXRfK0WdeyScp6BOvP14fkhc6tmeLxO5bes7.mp4', NULL, NULL, 1, '2023-06-24 06:04:13', '2023-08-07 03:52:16'),
(153, 'Day 34 Evening', 'Day 34 Evening', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/PBFVlphO9UO9yCt81Q1uWufFoWvySEaYZe1ZIhg3.mp4', NULL, NULL, 1, '2023-06-24 06:04:22', '2023-08-07 03:53:17'),
(154, 'Day 35 - Film Yourself', '<p>Day 35 - Film Yourself<br></p>', NULL, NULL, NULL, NULL, 'uploads/file/hzMKSZPIg3SH9AwBqjFlZ9XH6vb7UGeEgdUke9Za.pdf', NULL, NULL, NULL, NULL, NULL, 1, '2023-07-14 09:58:42', '2023-08-07 03:56:21'),
(155, 'Day 36 Morning', 'Day 36 Morning', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/BzS2fQa39opRxuZE7yaxsEqeI57JRbaQGYoDgYj2.mp4', NULL, NULL, 1, '2023-07-14 09:59:28', '2023-08-07 03:56:35'),
(156, 'Day 36 Midday', '<p>Day 36 Midday<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/nHUx4hKCui3487OmWk0aZNFEetVB206HJYqnT5kI.mp4', NULL, NULL, 1, '2023-07-14 09:59:45', '2023-08-07 03:56:56'),
(157, 'Day 36 Evening', 'Day 36 Evening', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/6EknCDpS94aVFC1q93egmfmiVhMYnHlqbelDWqNO.mp4', NULL, NULL, 1, '2023-07-14 09:59:59', '2023-08-07 03:57:21'),
(158, 'Day 37 Morning', 'Day 37 Morning', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/uXldpA1PuAAh0ghzNoSenx3pFChv1xU0016wYR8A.mp4', NULL, NULL, 1, '2023-07-14 10:00:14', '2023-08-07 03:57:32'),
(159, 'Day 37 Midday', 'Day 37 Midday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/YqGgwPT15PCb6Rm7utX93ETejbmMZ7poHscKB5wX.mp4', NULL, NULL, 1, '2023-07-14 10:00:29', '2023-08-07 03:57:40'),
(160, 'Day 37 Evening', 'Day 37 Evening', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/66H93PiXEmThfbHpjRcGVG4LqqMEBYbekyb2rRCh.mp4', NULL, NULL, 1, '2023-07-14 10:00:44', '2023-08-07 03:57:47'),
(161, 'Day 38 Morning', 'Day 38 Morning', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/UGV09JUF6Oow3Cw231HuOKN5lyuJ74uKNnzinXOR.mp4', NULL, NULL, 1, '2023-07-14 10:01:04', '2023-08-07 03:58:31'),
(162, 'Day 38 Midday', 'Day 38 Midday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/5r4DS13WUcvk0iqxHbIr6h4wdBtbklScZm7pIA2t.mp4', NULL, NULL, 1, '2023-07-14 10:01:12', '2023-08-07 03:58:56'),
(163, 'Day 38 Evening', 'Day 38 Evening', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/ffriWipKjQIU7rmCRhWlhfgwUKiiQzmZVnvE3y4X.mp4', NULL, NULL, 1, '2023-07-14 10:01:23', '2023-08-07 03:59:07'),
(164, 'Day 39 Morning', 'Day 39 Morning', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/4DbVyPeYfzbRyyCEiKjTVZFx4HttTuUZYIFFFiSc.mp4', NULL, NULL, 1, '2023-07-14 10:01:34', '2023-08-07 04:00:38'),
(165, 'Day 39 Midday', '<p>Day 39 Midday&nbsp;<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/PCUWxyBd2qrwKLoEwIhjDp5PNxQNYCzFY75QGPzc.mp4', NULL, NULL, 1, '2023-07-23 14:36:34', '2023-08-07 04:00:48'),
(166, 'Day 39 evening', 'Day 39 evening', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/vohw22DO5kM8DrHll9GOFX0nUetGLaFuIcq0RPQq.mp4', NULL, NULL, 1, '2023-07-23 14:36:47', '2023-08-07 04:00:55'),
(167, 'Day 40 Morning', 'Date 40 Morning', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/4Ef3thqqj1lalmuHM7Zcv4wEITdX6MWQBvSR0mfL.mp4', NULL, NULL, 1, '2023-07-23 14:37:17', '2023-08-15 02:45:19'),
(168, 'Day 40 Midday', 'Day 40 Midday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/8Bbd1RZPt2ahOZp0WP7AZolrdLG3DU5uqk6fkKRc.mp4', NULL, NULL, 1, '2023-07-23 14:37:31', '2023-08-07 04:03:19'),
(169, 'Day 40 Evening', 'Day 40 Evening', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/gAkVdIIzkCCui6aTl9hZKd8qlegxF3durvpMA8ta.mp4', NULL, NULL, 1, '2023-07-23 14:37:44', '2023-08-07 04:03:32'),
(170, 'Day 41 Morning', 'Day 41 Morning', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/fFaLCHEO7t0Z5dC74RFwvyofjnkh71KkiT8Gychv.mp4', NULL, NULL, 1, '2023-07-23 14:37:59', '2023-08-07 04:04:17'),
(171, 'Date 41 Midday', 'Date 41 Midday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/DPkUSrIwTE7diMFETARMlnGpVgCqu5NgdPHvzlqV.mp4', NULL, NULL, 1, '2023-07-23 14:38:15', '2023-08-07 04:05:10'),
(172, 'Day 41 Evening', 'Day 41 Evening', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/dsGwYDvMGrKP7k92VO7yZ7HjIG6vFNNcZo1aF8uE.mp4', NULL, NULL, 1, '2023-07-23 14:38:27', '2023-08-07 04:05:17'),
(173, 'Day 42 - Fliming yourself', '<p>Day 42 - Fliming yourself<br></p>', NULL, NULL, NULL, NULL, 'uploads/file/Ig0b0Cl2O2AyOazo48tvDsPsEisOFgdnNaXcQIS2.pdf', NULL, NULL, NULL, NULL, NULL, 1, '2023-07-27 09:37:12', '2023-08-07 04:05:46'),
(174, 'Day 43 Morning', '<p>Day 43 Morning<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/0OSB2z7BJHGZYmrM9ylDTSGKTOv12wpEbdi6jcvn.mp4', NULL, NULL, 1, '2023-07-27 09:48:32', '2023-08-07 04:10:53'),
(175, 'Day 43 Midday', 'Day 43 Midday&nbsp;', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/rWmzMZKt45iOnTCdBDTjEdU1lU6B3wsXrmuXCtxq.mp4', NULL, NULL, 1, '2023-07-27 09:48:46', '2023-08-07 04:11:01'),
(176, 'Day 43 Evening', 'Day 43 Evening', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/X36kbdAZkqAXbj3cwqHOjOPoNIsgolub106eLT23.mp4', NULL, NULL, 1, '2023-07-27 09:48:55', '2023-08-07 04:11:16'),
(177, 'Day 44 Morning', '<p>Day 44 Morning<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/TwAfxymgPawHCk2YGgh0lidFpeIGiAiuYk2YPAFs.mp4', NULL, NULL, 1, '2023-07-31 05:49:50', '2023-08-07 04:11:29'),
(178, 'Day 44 Midday', 'Day 44 Midday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/VuFCIsARwwdxB9huljLgISglhOe2sthxNIKtFt8u.mp4', NULL, NULL, 1, '2023-07-31 05:50:09', '2023-08-14 07:03:15'),
(179, 'Day 44 Evening', 'Day 44 Evening ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/f78XD1j4II5coN9ACuS5JefDM0yUJYxJ0P2qJXyP.mp4', NULL, NULL, 1, '2023-07-31 05:50:25', '2023-08-14 07:03:41'),
(180, 'Day 45 Morrning', '<p>Day 45 Morrning<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/hPA7XnNTbP1z3YYH1SbAuaWYrRcGfVsikVTiusW2.mp4', NULL, NULL, 1, '2023-08-06 11:44:47', '2023-08-15 07:41:23'),
(181, 'Day 45 Midday', 'Day 45 Midday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/EjX93GO0MGpJrQhvUHEgXM5P5Ds5nfTRw4Fi36fb.mp4', NULL, NULL, 1, '2023-08-06 11:45:06', '2023-08-14 07:07:28'),
(182, 'Day 45 Evening', 'Day 45 Evening ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/0VMs0FJkHYtgskinCUgFLgDf5PtmEMEzNlYdwOLH.mp4', NULL, NULL, 1, '2023-08-06 11:45:18', '2023-08-15 02:45:45'),
(183, 'Day 46 Morning', '<p>Day 46 Morning<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/d3YB6QKqLEdHHruztb7U3gc62V3t8CLRu05qHnKU.mp4', NULL, NULL, 1, '2023-08-06 11:48:57', '2023-08-16 13:59:39'),
(184, 'Day 46 Midday', '<p>Day 46 Midday <br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/qB5y58agPZ0ynvD5lkYJD7Mi0yySCsOx6CETvjM9.mp4', NULL, NULL, 1, '2023-08-06 12:09:33', '2023-08-14 07:09:38'),
(185, 'Day 46 Evening', 'Day 46 Evening', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/I1YjvBpDL8DObFMRm4UlUJ84rKYaUnORjAhuQ0cR.mp4', NULL, NULL, 1, '2023-08-06 12:09:52', '2023-08-16 13:59:01'),
(186, 'Day 47 Morning', 'Day 47 Morning', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/OmqasRVFZsoiX00oXb3GWKodjZyCyCvqtYl6OTNW.mp4', NULL, NULL, 1, '2023-08-06 12:11:22', '2023-08-15 02:46:08'),
(187, 'Day 47 Midday', 'Day 47 Midday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/DTXkRKw4EwHmDrqWtC3yjWotkbxvAFJHHhaRXn6y.mp4', NULL, NULL, 1, '2023-08-06 12:11:39', '2023-08-18 14:36:35'),
(188, 'Day 47 Evening', 'Day 47 Evening ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/D6cI32pki98GxAUpLNzo0UFN2id4Aq0Iv8I6ly4a.mp4', NULL, NULL, 1, '2023-08-06 12:11:51', '2023-08-18 14:36:50'),
(189, 'Day 48', 'Day 48', NULL, NULL, NULL, NULL, 'uploads/file/B58BpfeFbWqiNDmyZEulWKdqkUgnYj4JH84GjlgJ.pdf', NULL, NULL, NULL, NULL, NULL, 1, '2023-08-06 12:12:16', '2023-08-25 12:16:15'),
(190, 'Day 49 Morning', '<p>Day 49 Morning<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/Y7FZzwaO09JANRizU7dJ1bfKgB44GrphGeK3NMfz.mp4', NULL, NULL, 1, '2023-08-27 10:26:15', '2023-08-27 10:31:43'),
(191, 'Day 49 Midday', 'Day 49 Midday ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/5itR1YGiYhPqgiwhj1q2Ucy1VbQpWoNkqJdL0p34.mp4', NULL, NULL, 1, '2023-08-27 10:26:32', '2023-08-27 10:32:01'),
(192, 'Date 49 Evening', 'Date 49 Evening', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/Hg6Ab6yr7JCbARgwdODT43vr4kf73KOMi2fGNLRx.mp4', NULL, NULL, 1, '2023-08-27 10:26:41', '2023-08-27 10:32:14'),
(193, 'Day 50 Morning', '<p>Day 50 Morning<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/bc6dmtNJzQPYs2RWGaVOo8OblNnbEJWVNJrpWDUk.mp4', NULL, NULL, 1, '2023-08-27 10:35:45', '2023-09-02 03:16:28'),
(194, 'Day 50 Midday', 'Day 50 Midday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/g8Vqfo4IRtdsiF2JqauVENqm0nYLtvPHZcXNJrwq.mp4', NULL, NULL, 1, '2023-08-27 10:36:00', '2023-08-27 10:36:00'),
(195, 'Day 50 Evening', 'Day 50 Evening ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/8iyyFj13kDHchO5fjM47i9HVxYJ1lnXoJRNIyxsF.mp4', NULL, NULL, 1, '2023-08-27 10:36:15', '2023-09-02 03:16:07'),
(196, 'Day 51 Morning (Updating)', '<p>Day 51 Morning<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-08-27 11:26:40', '2023-08-27 11:26:40'),
(197, 'Day 51 Midday', '<b>Day 51 Midday </b>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/CC81Ov2yjrgcupU4iaXXTJWqOixojzUqjNzdQZRO.mp4', NULL, NULL, 1, '2023-08-27 11:26:57', '2023-08-27 13:11:28'),
(198, 'Day 51 Evening', 'Day 51 Evening&nbsp;', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/Ar28MoS8tZXf4Yrk1kmIhsQwnOpWjdRzeXFrAedp.mp4', NULL, NULL, 1, '2023-08-27 11:27:12', '2023-08-27 11:27:12'),
(199, 'Day 52 Morning', 'Day 52 Morning', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/m1Taa8s87VQlmOH63F6o5sUlPyUVV07v5COKHoAf.mp4', NULL, NULL, 1, '2023-08-27 11:27:34', '2023-08-27 13:11:45'),
(200, 'Day 52 Midday(Updating)', 'Day 52 Midday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-08-27 11:27:55', '2023-08-27 11:27:55'),
(201, 'Day 52  Evening (Updating)', 'Day 52&nbsp; Evening (Updating)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-08-27 11:28:05', '2023-08-27 11:28:05'),
(202, 'Day 53  Morning', 'Day 53&nbsp; Morning&nbsp;', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/qPDezFS5Azm3XFJCe1cmUPDqaHbcRp2rcZGQGsL7.mp4', NULL, NULL, 1, '2023-08-27 11:28:28', '2023-08-28 06:22:12'),
(203, 'Day 53  Midday (Updating)', 'Day 53&nbsp; Midday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-08-27 11:28:40', '2023-08-27 11:28:40'),
(204, 'Day 53 Evening (Updating)', 'Day 53 Evening&nbsp;', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-08-27 11:28:58', '2023-08-27 11:28:58'),
(205, 'Day 54 Morning', '<p>Day 54 Morning<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/file/OPYHNwjVjEZkQVlJvf4nKhMzriDSug5gYXkn18zh.mp4', NULL, NULL, 1, '2023-08-27 11:31:15', '2023-09-02 03:16:54'),
(206, 'Day 54 Midday (Updating)', '<p>Day 54 Midday&nbsp;<br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-08-27 11:33:14', '2023-08-27 11:33:14'),
(207, 'Day 54 Evening (Updating)', 'Day 54 Evening', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-08-27 11:33:28', '2023-08-27 11:33:28'),
(208, 'Day 55 - Film yourself', 'Day 55 Filming talking about your job', NULL, NULL, NULL, NULL, 'uploads/file/2DIXAvYVkrCZn5z94SSayKpUtujzc8A96HfbTp1F.pdf', NULL, NULL, NULL, NULL, NULL, 1, '2023-08-27 11:33:55', '2023-08-27 11:33:55');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_users`
--

CREATE TABLE `vendor_users` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendor_users`
--

INSERT INTO `vendor_users` (`id`, `user_id`, `lesson_id`, `created_at`, `updated_at`) VALUES
(28, 25, 35, '2023-04-03 22:02:36', '2023-04-03 22:02:36'),
(29, 25, 36, '2023-04-03 22:03:51', '2023-04-03 22:03:51'),
(33, 43, 35, '2023-04-11 19:34:58', '2023-04-11 19:34:58'),
(35, 52, 36, '2023-04-20 10:01:27', '2023-04-20 10:01:27'),
(36, 52, 35, '2023-04-20 10:23:34', '2023-04-20 10:23:34'),
(37, 52, 37, '2023-04-20 20:06:56', '2023-04-20 20:06:56'),
(39, 52, 38, '2023-04-21 04:35:35', '2023-04-21 04:35:35'),
(40, 36, 35, '2023-04-21 22:47:33', '2023-04-21 22:47:33'),
(41, 36, 36, '2023-04-21 22:47:36', '2023-04-21 22:47:36'),
(42, 36, 37, '2023-04-21 22:53:14', '2023-04-21 22:53:14'),
(44, 52, 39, '2023-04-22 17:08:25', '2023-04-22 17:08:25'),
(45, 52, 40, '2023-04-22 17:25:24', '2023-04-22 17:25:24'),
(46, 52, 41, '2023-04-23 15:54:13', '2023-04-23 15:54:13'),
(47, 52, 42, '2023-04-24 19:45:22', '2023-04-24 19:45:22'),
(48, 52, 43, '2023-04-24 20:04:23', '2023-04-24 20:04:23'),
(49, 36, 38, '2023-04-24 21:04:52', '2023-04-24 21:04:52'),
(50, 36, 39, '2023-04-24 21:05:16', '2023-04-24 21:05:16'),
(51, 52, 44, '2023-04-26 17:13:54', '2023-04-26 17:13:54'),
(52, 52, 45, '2023-04-30 15:42:30', '2023-04-30 15:42:30'),
(53, 52, 46, '2023-05-03 20:16:48', '2023-05-03 20:16:48'),
(54, 52, 47, '2023-05-07 16:15:49', '2023-05-07 16:15:49'),
(56, 54, 35, '2023-05-08 16:23:05', '2023-05-08 16:23:05'),
(57, 54, 36, '2023-05-08 17:05:52', '2023-05-08 17:05:52'),
(58, 54, 37, '2023-05-08 17:44:16', '2023-05-08 17:44:16'),
(60, 25, 37, '2023-05-10 13:20:20', '2023-05-10 13:20:20'),
(61, 25, 38, '2023-05-10 13:20:22', '2023-05-10 13:20:22'),
(62, 25, 39, '2023-05-10 13:20:25', '2023-05-10 13:20:25'),
(63, 25, 40, '2023-05-10 13:20:27', '2023-05-10 13:20:27'),
(64, 54, 38, '2023-05-10 20:33:15', '2023-05-10 20:33:15'),
(65, 54, 39, '2023-05-10 20:47:42', '2023-05-10 20:47:42'),
(66, 54, 40, '2023-05-10 20:52:47', '2023-05-10 20:52:47'),
(67, 54, 41, '2023-05-10 20:53:11', '2023-05-10 20:53:11'),
(68, 54, 42, '2023-05-10 21:03:19', '2023-05-10 21:03:19'),
(69, 54, 43, '2023-05-10 21:04:37', '2023-05-10 21:04:37'),
(71, 55, 35, '2023-05-17 12:27:02', '2023-05-17 12:27:02'),
(72, 55, 36, '2023-05-17 13:22:17', '2023-05-17 13:22:17'),
(73, 55, 37, '2023-05-17 13:27:25', '2023-05-17 13:27:25'),
(74, 55, 38, '2023-05-18 14:58:55', '2023-05-18 14:58:55'),
(75, 55, 39, '2023-05-18 14:58:57', '2023-05-18 14:58:57'),
(76, 55, 40, '2023-05-18 15:23:23', '2023-05-18 15:23:23'),
(77, 55, 41, '2023-05-19 12:15:29', '2023-05-19 12:15:29'),
(78, 55, 42, '2023-05-19 13:33:58', '2023-05-19 13:33:58'),
(79, 55, 43, '2023-05-19 20:04:20', '2023-05-19 20:04:20'),
(80, 55, 44, '2023-05-20 14:59:57', '2023-05-20 14:59:57'),
(81, 55, 45, '2023-05-20 15:04:04', '2023-05-20 15:04:04'),
(82, 55, 46, '2023-05-20 15:06:58', '2023-05-20 15:06:58'),
(83, 52, 48, '2023-05-22 09:39:27', '2023-05-22 09:39:27'),
(84, 52, 50, '2023-05-22 09:39:31', '2023-05-22 09:39:31'),
(86, 55, 47, '2023-05-23 12:41:44', '2023-05-23 12:41:44'),
(87, 55, 48, '2023-05-23 12:45:25', '2023-05-23 12:45:25'),
(88, 55, 50, '2023-05-23 12:50:14', '2023-05-23 12:50:14'),
(89, 55, 51, '2023-05-23 15:08:06', '2023-05-23 15:08:06'),
(90, 55, 52, '2023-05-23 15:15:21', '2023-05-23 15:15:21'),
(91, 55, 53, '2023-05-23 15:16:53', '2023-05-23 15:16:53'),
(92, 55, 54, '2023-05-23 15:26:26', '2023-05-23 15:26:26'),
(93, 55, 55, '2023-05-23 15:27:22', '2023-05-23 15:27:22'),
(95, 55, 56, '2023-05-27 20:04:25', '2023-05-27 20:04:25'),
(96, 55, 57, '2023-05-27 20:04:26', '2023-05-27 20:04:26'),
(97, 55, 58, '2023-05-27 20:04:27', '2023-05-27 20:04:27'),
(98, 55, 59, '2023-05-27 20:04:29', '2023-05-27 20:04:29'),
(99, 55, 60, '2023-05-27 20:04:32', '2023-05-27 20:04:32'),
(100, 55, 61, '2023-05-27 20:06:51', '2023-05-27 20:06:51'),
(101, 55, 62, '2023-05-27 20:23:46', '2023-05-27 20:23:46'),
(102, 55, 63, '2023-05-27 20:23:48', '2023-05-27 20:23:48'),
(103, 52, 23, '2023-05-30 11:16:20', '2023-05-30 11:16:20'),
(104, 52, 8, '2023-05-30 16:30:45', '2023-05-30 16:30:45'),
(105, 52, 9, '2023-05-30 16:30:46', '2023-05-30 16:30:46'),
(106, 52, 10, '2023-05-30 16:30:46', '2023-05-30 16:30:46'),
(107, 52, 11, '2023-05-30 16:30:51', '2023-05-30 16:30:51'),
(108, 52, 12, '2023-05-30 16:30:54', '2023-05-30 16:30:54'),
(109, 52, 13, '2023-05-30 16:30:55', '2023-05-30 16:30:55'),
(110, 52, 14, '2023-05-30 16:30:58', '2023-05-30 16:30:58'),
(111, 52, 15, '2023-05-30 16:30:59', '2023-05-30 16:30:59'),
(112, 52, 16, '2023-05-30 16:31:02', '2023-05-30 16:31:02'),
(113, 52, 17, '2023-05-30 16:31:02', '2023-05-30 16:31:02'),
(114, 52, 22, '2023-05-30 16:31:10', '2023-05-30 16:31:10'),
(115, 52, 18, '2023-05-30 16:31:13', '2023-05-30 16:31:13'),
(116, 52, 20, '2023-05-30 16:31:16', '2023-05-30 16:31:16'),
(117, 52, 19, '2023-05-30 16:31:18', '2023-05-30 16:31:18'),
(118, 52, 21, '2023-05-30 16:31:19', '2023-05-30 16:31:19'),
(119, 52, 24, '2023-05-30 16:31:25', '2023-05-30 16:31:25'),
(120, 52, 25, '2023-05-31 14:23:21', '2023-05-31 14:23:21'),
(121, 75, 82, '2023-06-05 20:22:49', '2023-06-05 20:22:49'),
(126, 76, 209, '2023-06-12 22:58:41', '2023-06-12 22:58:41'),
(127, 83, 209, '2023-06-13 06:47:47', '2023-06-13 06:47:47'),
(130, 80, 210, '2023-06-13 09:46:32', '2023-06-13 09:46:32'),
(131, 83, 210, '2023-06-13 11:06:14', '2023-06-13 11:06:14'),
(133, 78, 209, '2023-06-13 13:33:04', '2023-06-13 13:33:04'),
(134, 78, 210, '2023-06-13 13:33:05', '2023-06-13 13:33:05'),
(135, 78, 211, '2023-06-13 13:48:25', '2023-06-13 13:48:25'),
(136, 80, 211, '2023-06-13 17:27:51', '2023-06-13 17:27:51'),
(137, 80, 209, '2023-06-13 17:36:05', '2023-06-13 17:36:05'),
(138, 25, 209, '2023-06-13 17:51:55', '2023-06-13 17:51:55'),
(139, 83, 212, '2023-06-13 19:20:11', '2023-06-13 19:20:11'),
(140, 84, 209, '2023-06-14 05:24:55', '2023-06-14 05:24:55'),
(141, 83, 213, '2023-06-14 05:53:52', '2023-06-14 05:53:52'),
(142, 83, 214, '2023-06-14 05:53:55', '2023-06-14 05:53:55'),
(143, 78, 212, '2023-06-14 08:45:12', '2023-06-14 08:45:12'),
(144, 78, 213, '2023-06-14 11:55:01', '2023-06-14 11:55:01'),
(145, 78, 214, '2023-06-14 11:55:09', '2023-06-14 11:55:09'),
(146, 84, 210, '2023-06-14 15:01:14', '2023-06-14 15:01:14'),
(147, 84, 211, '2023-06-14 15:48:12', '2023-06-14 15:48:12'),
(148, 76, 210, '2023-06-14 17:45:12', '2023-06-14 17:45:12'),
(149, 76, 212, '2023-06-14 17:47:41', '2023-06-14 17:47:41'),
(150, 76, 211, '2023-06-14 17:47:42', '2023-06-14 17:47:42'),
(151, 83, 215, '2023-06-14 18:13:40', '2023-06-14 18:13:40'),
(152, 84, 212, '2023-06-14 19:06:56', '2023-06-14 19:06:56'),
(153, 83, 216, '2023-06-15 06:49:41', '2023-06-15 06:49:41'),
(154, 83, 218, '2023-06-15 10:57:08', '2023-06-15 10:57:08'),
(155, 76, 214, '2023-06-15 11:52:35', '2023-06-15 11:52:35'),
(156, 76, 213, '2023-06-15 11:52:38', '2023-06-15 11:52:38'),
(157, 76, 215, '2023-06-15 11:52:44', '2023-06-15 11:52:44'),
(158, 78, 215, '2023-06-15 13:35:33', '2023-06-15 13:35:33'),
(159, 55, 216, '2023-06-15 14:27:04', '2023-06-15 14:27:04'),
(160, 55, 217, '2023-06-15 14:35:41', '2023-06-15 14:35:41'),
(161, 55, 218, '2023-06-15 14:39:50', '2023-06-15 14:39:50'),
(162, 55, 219, '2023-06-15 14:43:03', '2023-06-15 14:43:03'),
(163, 78, 216, '2023-06-15 14:46:24', '2023-06-15 14:46:24'),
(164, 55, 220, '2023-06-15 14:59:38', '2023-06-15 14:59:38'),
(165, 55, 221, '2023-06-15 15:10:24', '2023-06-15 15:10:24'),
(166, 55, 222, '2023-06-15 15:16:05', '2023-06-15 15:16:05'),
(167, 55, 223, '2023-06-15 15:22:05', '2023-06-15 15:22:05'),
(168, 78, 217, '2023-06-15 18:02:32', '2023-06-15 18:02:32'),
(169, 76, 216, '2023-06-15 18:04:06', '2023-06-15 18:04:06'),
(170, 78, 218, '2023-06-15 18:47:54', '2023-06-15 18:47:54'),
(171, 84, 213, '2023-06-15 21:38:18', '2023-06-15 21:38:18'),
(172, 84, 214, '2023-06-15 21:43:27', '2023-06-15 21:43:27'),
(173, 84, 215, '2023-06-16 05:03:49', '2023-06-16 05:03:49'),
(174, 76, 217, '2023-06-16 07:36:34', '2023-06-16 07:36:34'),
(175, 55, 224, '2023-06-16 08:41:01', '2023-06-16 08:41:01'),
(176, 55, 225, '2023-06-16 08:46:19', '2023-06-16 08:46:19'),
(177, 76, 218, '2023-06-16 08:46:59', '2023-06-16 08:46:59'),
(178, 55, 226, '2023-06-16 08:48:12', '2023-06-16 08:48:12'),
(179, 76, 219, '2023-06-16 08:54:32', '2023-06-16 08:54:32'),
(180, 55, 227, '2023-06-16 08:56:48', '2023-06-16 08:56:48'),
(181, 55, 228, '2023-06-16 08:57:11', '2023-06-16 08:57:11'),
(182, 55, 229, '2023-06-16 09:01:11', '2023-06-16 09:01:11'),
(183, 55, 230, '2023-06-16 09:42:19', '2023-06-16 09:42:19'),
(184, 76, 220, '2023-06-16 11:17:30', '2023-06-16 11:17:30'),
(185, 78, 220, '2023-06-16 11:59:32', '2023-06-16 11:59:32'),
(186, 78, 219, '2023-06-16 11:59:32', '2023-06-16 11:59:32'),
(187, 84, 216, '2023-06-16 18:18:15', '2023-06-16 18:18:15'),
(188, 83, 219, '2023-06-16 19:17:52', '2023-06-16 19:17:52'),
(190, 83, 221, '2023-06-16 20:44:24', '2023-06-16 20:44:24'),
(191, 83, 222, '2023-06-17 11:18:46', '2023-06-17 11:18:46'),
(192, 83, 224, '2023-06-17 13:05:52', '2023-06-17 13:05:52'),
(193, 83, 225, '2023-06-17 13:10:07', '2023-06-17 13:10:07'),
(194, 83, 226, '2023-06-17 13:19:41', '2023-06-17 13:19:41'),
(195, 83, 227, '2023-06-17 13:34:39', '2023-06-17 13:34:39'),
(196, 55, 231, '2023-06-17 13:56:41', '2023-06-17 13:56:41'),
(197, 55, 232, '2023-06-17 13:57:07', '2023-06-17 13:57:07'),
(198, 55, 233, '2023-06-17 13:57:08', '2023-06-17 13:57:08'),
(199, 55, 234, '2023-06-17 13:57:08', '2023-06-17 13:57:08'),
(201, 78, 221, '2023-06-17 18:48:43', '2023-06-17 18:48:43'),
(202, 78, 222, '2023-06-17 19:37:32', '2023-06-17 19:37:32'),
(203, 78, 223, '2023-06-17 19:37:39', '2023-06-17 19:37:39'),
(204, 76, 221, '2023-06-17 21:22:36', '2023-06-17 21:22:36'),
(205, 76, 222, '2023-06-17 21:25:42', '2023-06-17 21:25:42'),
(206, 83, 223, '2023-06-17 21:43:12', '2023-06-17 21:43:12'),
(207, 77, 209, '2023-06-17 23:26:44', '2023-06-17 23:26:44'),
(208, 77, 210, '2023-06-17 23:36:55', '2023-06-17 23:36:55'),
(209, 78, 283, '2023-06-18 10:17:22', '2023-06-18 10:17:22'),
(210, 78, 282, '2023-06-18 10:17:22', '2023-06-18 10:17:22'),
(211, 78, 281, '2023-06-18 10:17:22', '2023-06-18 10:17:22'),
(212, 78, 280, '2023-06-18 10:17:23', '2023-06-18 10:17:23'),
(213, 78, 279, '2023-06-18 10:17:23', '2023-06-18 10:17:23'),
(214, 76, 269, '2023-06-18 11:00:43', '2023-06-18 11:00:43'),
(215, 76, 270, '2023-06-18 11:00:44', '2023-06-18 11:00:44'),
(216, 76, 271, '2023-06-18 11:00:44', '2023-06-18 11:00:44'),
(217, 76, 273, '2023-06-18 11:00:47', '2023-06-18 11:00:47'),
(218, 76, 274, '2023-06-18 11:00:47', '2023-06-18 11:00:47'),
(219, 76, 272, '2023-06-18 11:00:48', '2023-06-18 11:00:48'),
(220, 76, 275, '2023-06-18 11:00:51', '2023-06-18 11:00:51'),
(221, 76, 276, '2023-06-18 11:00:51', '2023-06-18 11:00:51'),
(222, 76, 278, '2023-06-18 11:00:51', '2023-06-18 11:00:51'),
(223, 76, 277, '2023-06-18 11:00:54', '2023-06-18 11:00:54'),
(224, 76, 279, '2023-06-18 11:00:57', '2023-06-18 11:00:57'),
(225, 76, 280, '2023-06-18 11:00:59', '2023-06-18 11:00:59'),
(226, 76, 282, '2023-06-18 11:01:00', '2023-06-18 11:01:00'),
(227, 76, 281, '2023-06-18 11:01:00', '2023-06-18 11:01:00'),
(228, 76, 283, '2023-06-18 11:01:04', '2023-06-18 11:01:04'),
(229, 76, 284, '2023-06-18 11:01:05', '2023-06-18 11:01:05'),
(230, 76, 285, '2023-06-18 11:01:05', '2023-06-18 11:01:05'),
(231, 78, 284, '2023-06-18 13:09:07', '2023-06-18 13:09:07'),
(232, 78, 285, '2023-06-18 18:52:11', '2023-06-18 18:52:11'),
(233, 84, 269, '2023-06-19 04:37:10', '2023-06-19 04:37:10'),
(234, 84, 270, '2023-06-19 04:37:11', '2023-06-19 04:37:11'),
(235, 84, 271, '2023-06-19 04:37:13', '2023-06-19 04:37:13'),
(236, 84, 272, '2023-06-19 04:37:14', '2023-06-19 04:37:14'),
(237, 84, 273, '2023-06-19 04:37:17', '2023-06-19 04:37:17'),
(238, 84, 274, '2023-06-19 04:37:19', '2023-06-19 04:37:19'),
(239, 84, 275, '2023-06-19 04:37:24', '2023-06-19 04:37:24'),
(240, 84, 276, '2023-06-19 04:37:28', '2023-06-19 04:37:28'),
(242, 90, 418, '2023-06-19 11:00:53', '2023-06-19 11:00:53'),
(244, 90, 420, '2023-06-19 11:05:17', '2023-06-19 11:05:17'),
(245, 90, 421, '2023-06-19 11:08:54', '2023-06-19 11:08:54'),
(246, 90, 422, '2023-06-19 11:15:02', '2023-06-19 11:15:02'),
(247, 90, 423, '2023-06-19 11:18:59', '2023-06-19 11:18:59'),
(248, 76, 346, '2023-06-19 17:28:23', '2023-06-19 17:28:23'),
(249, 83, 347, '2023-06-19 19:04:27', '2023-06-19 19:04:27'),
(250, 83, 348, '2023-06-19 19:04:28', '2023-06-19 19:04:28'),
(251, 83, 346, '2023-06-19 19:04:36', '2023-06-19 19:04:36'),
(252, 90, 417, '2023-06-19 19:33:22', '2023-06-19 19:33:22'),
(253, 90, 419, '2023-06-19 19:33:23', '2023-06-19 19:33:23'),
(254, 84, 327, '2023-06-19 19:59:28', '2023-06-19 19:59:28'),
(255, 84, 328, '2023-06-19 19:59:30', '2023-06-19 19:59:30'),
(256, 84, 329, '2023-06-19 19:59:31', '2023-06-19 19:59:31'),
(257, 84, 330, '2023-06-19 19:59:34', '2023-06-19 19:59:34'),
(258, 84, 331, '2023-06-19 19:59:36', '2023-06-19 19:59:36'),
(259, 84, 332, '2023-06-19 19:59:40', '2023-06-19 19:59:40'),
(260, 84, 333, '2023-06-19 19:59:43', '2023-06-19 19:59:43'),
(261, 84, 334, '2023-06-19 19:59:46', '2023-06-19 19:59:46'),
(262, 84, 335, '2023-06-19 19:59:50', '2023-06-19 19:59:50'),
(263, 84, 336, '2023-06-20 06:08:50', '2023-06-20 06:08:50'),
(265, 92, 327, '2023-06-20 09:44:20', '2023-06-20 09:44:20'),
(266, 84, 337, '2023-06-20 11:12:20', '2023-06-20 11:12:20'),
(268, 89, 327, '2023-06-20 16:24:13', '2023-06-20 16:24:13'),
(269, 89, 328, '2023-06-20 16:24:14', '2023-06-20 16:24:14'),
(270, 89, 329, '2023-06-20 16:24:14', '2023-06-20 16:24:14'),
(271, 89, 331, '2023-06-20 16:24:20', '2023-06-20 16:24:20'),
(272, 89, 332, '2023-06-20 16:24:21', '2023-06-20 16:24:21'),
(273, 89, 330, '2023-06-20 16:24:27', '2023-06-20 16:24:27'),
(274, 89, 333, '2023-06-20 17:12:25', '2023-06-20 17:12:25'),
(275, 89, 334, '2023-06-20 17:12:29', '2023-06-20 17:12:29'),
(276, 89, 335, '2023-06-20 17:12:33', '2023-06-20 17:12:33'),
(277, 92, 328, '2023-06-20 18:25:04', '2023-06-20 18:25:04'),
(278, 83, 349, '2023-06-20 19:52:01', '2023-06-20 19:52:01'),
(279, 83, 350, '2023-06-20 19:52:04', '2023-06-20 19:52:04'),
(280, 83, 351, '2023-06-20 19:52:08', '2023-06-20 19:52:08'),
(281, 84, 338, '2023-06-21 04:12:29', '2023-06-21 04:12:29'),
(282, 84, 339, '2023-06-21 04:45:19', '2023-06-21 04:45:19'),
(283, 92, 329, '2023-06-21 09:02:49', '2023-06-21 09:02:49'),
(284, 84, 340, '2023-06-21 10:12:30', '2023-06-21 10:12:30'),
(285, 78, 346, '2023-06-21 13:14:38', '2023-06-21 13:14:38'),
(286, 78, 347, '2023-06-21 14:03:56', '2023-06-21 14:03:56'),
(287, 78, 348, '2023-06-21 14:41:28', '2023-06-21 14:41:28'),
(288, 94, 327, '2023-06-21 19:10:00', '2023-06-21 19:10:00'),
(289, 94, 328, '2023-06-21 20:21:08', '2023-06-21 20:21:08'),
(290, 94, 329, '2023-06-21 20:22:41', '2023-06-21 20:22:41'),
(291, 84, 341, '2023-06-22 04:29:57', '2023-06-22 04:29:57'),
(292, 84, 342, '2023-06-22 04:56:05', '2023-06-22 04:56:05'),
(293, 92, 330, '2023-06-22 04:57:29', '2023-06-22 04:57:29'),
(294, 92, 331, '2023-06-22 04:58:42', '2023-06-22 04:58:42'),
(295, 92, 332, '2023-06-22 04:58:46', '2023-06-22 04:58:46'),
(296, 84, 343, '2023-06-22 05:01:32', '2023-06-22 05:01:32'),
(297, 94, 330, '2023-06-22 05:36:24', '2023-06-22 05:36:24'),
(298, 92, 333, '2023-06-22 16:48:45', '2023-06-22 16:48:45'),
(299, 92, 334, '2023-06-22 16:48:46', '2023-06-22 16:48:46'),
(300, 92, 335, '2023-06-22 17:03:53', '2023-06-22 17:03:53'),
(302, 89, 337, '2023-06-22 18:31:59', '2023-06-22 18:31:59'),
(303, 89, 338, '2023-06-22 18:32:01', '2023-06-22 18:32:01'),
(304, 89, 339, '2023-06-22 18:39:38', '2023-06-22 18:39:38'),
(305, 89, 340, '2023-06-22 18:39:38', '2023-06-22 18:39:38'),
(306, 83, 352, '2023-06-22 19:27:26', '2023-06-22 19:27:26'),
(307, 83, 353, '2023-06-22 19:27:30', '2023-06-22 19:27:30'),
(308, 83, 354, '2023-06-22 19:27:34', '2023-06-22 19:27:34'),
(309, 94, 331, '2023-06-22 19:55:54', '2023-06-22 19:55:54'),
(310, 94, 332, '2023-06-22 20:08:58', '2023-06-22 20:08:58'),
(311, 94, 333, '2023-06-22 20:34:42', '2023-06-22 20:34:42'),
(312, 84, 344, '2023-06-23 05:46:34', '2023-06-23 05:46:34'),
(313, 84, 345, '2023-06-23 05:47:21', '2023-06-23 05:47:21'),
(314, 76, 328, '2023-06-23 16:41:36', '2023-06-23 16:41:36'),
(315, 76, 327, '2023-06-23 16:41:36', '2023-06-23 16:41:36'),
(316, 76, 329, '2023-06-23 16:41:37', '2023-06-23 16:41:37'),
(317, 83, 355, '2023-06-23 20:11:23', '2023-06-23 20:11:23'),
(318, 83, 356, '2023-06-23 20:19:55', '2023-06-23 20:19:55'),
(319, 83, 358, '2023-06-23 22:19:04', '2023-06-23 22:19:04'),
(320, 83, 359, '2023-06-23 22:53:29', '2023-06-23 22:53:29'),
(321, 83, 360, '2023-06-23 23:07:35', '2023-06-23 23:07:35'),
(322, 94, 334, '2023-06-24 07:45:18', '2023-06-24 07:45:18'),
(323, 94, 335, '2023-06-24 08:30:20', '2023-06-24 08:30:20'),
(324, 94, 336, '2023-06-24 08:31:42', '2023-06-24 08:31:42'),
(325, 76, 331, '2023-06-24 11:38:39', '2023-06-24 11:38:39'),
(326, 76, 330, '2023-06-24 11:38:39', '2023-06-24 11:38:39'),
(327, 76, 333, '2023-06-24 11:38:40', '2023-06-24 11:38:40'),
(328, 76, 332, '2023-06-24 11:38:40', '2023-06-24 11:38:40'),
(329, 76, 334, '2023-06-24 11:38:44', '2023-06-24 11:38:44'),
(330, 76, 335, '2023-06-24 11:38:44', '2023-06-24 11:38:44'),
(331, 76, 336, '2023-06-24 11:38:45', '2023-06-24 11:38:45'),
(332, 76, 337, '2023-06-24 11:38:49', '2023-06-24 11:38:49'),
(333, 76, 338, '2023-06-24 11:38:50', '2023-06-24 11:38:50'),
(334, 76, 339, '2023-06-24 11:38:50', '2023-06-24 11:38:50'),
(335, 76, 340, '2023-06-24 11:38:51', '2023-06-24 11:38:51'),
(336, 76, 341, '2023-06-24 11:38:51', '2023-06-24 11:38:51'),
(337, 76, 342, '2023-06-24 11:38:54', '2023-06-24 11:38:54'),
(338, 76, 343, '2023-06-24 11:38:54', '2023-06-24 11:38:54'),
(339, 76, 344, '2023-06-24 11:38:57', '2023-06-24 11:38:57'),
(340, 76, 345, '2023-06-24 11:38:58', '2023-06-24 11:38:58'),
(341, 76, 347, '2023-06-24 11:39:03', '2023-06-24 11:39:03'),
(342, 76, 348, '2023-06-24 11:39:04', '2023-06-24 11:39:04'),
(343, 76, 349, '2023-06-24 11:39:04', '2023-06-24 11:39:04'),
(344, 76, 350, '2023-06-24 11:39:05', '2023-06-24 11:39:05'),
(345, 76, 351, '2023-06-24 11:39:08', '2023-06-24 11:39:08'),
(346, 76, 352, '2023-06-24 11:39:11', '2023-06-24 11:39:11'),
(347, 76, 353, '2023-06-24 11:39:11', '2023-06-24 11:39:11'),
(348, 76, 354, '2023-06-24 11:39:15', '2023-06-24 11:39:15'),
(349, 76, 355, '2023-06-24 11:39:15', '2023-06-24 11:39:15'),
(350, 76, 356, '2023-06-24 11:39:19', '2023-06-24 11:39:19'),
(351, 76, 357, '2023-06-24 11:39:25', '2023-06-24 11:39:25'),
(352, 76, 358, '2023-06-24 11:39:26', '2023-06-24 11:39:26'),
(353, 76, 359, '2023-06-24 11:39:27', '2023-06-24 11:39:27'),
(354, 92, 336, '2023-06-24 15:31:27', '2023-06-24 15:31:27'),
(355, 92, 337, '2023-06-24 15:31:33', '2023-06-24 15:31:33'),
(356, 92, 338, '2023-06-24 15:31:34', '2023-06-24 15:31:34'),
(357, 76, 360, '2023-06-24 16:48:15', '2023-06-24 16:48:15'),
(358, 76, 361, '2023-06-24 16:48:18', '2023-06-24 16:48:18'),
(359, 76, 362, '2023-06-24 16:48:21', '2023-06-24 16:48:21'),
(360, 89, 336, '2023-06-24 18:09:01', '2023-06-24 18:09:01'),
(361, 89, 341, '2023-06-24 18:09:11', '2023-06-24 18:09:11'),
(362, 78, 383, '2023-06-24 18:14:35', '2023-06-24 18:14:35'),
(363, 78, 382, '2023-06-24 18:14:36', '2023-06-24 18:14:36'),
(364, 78, 380, '2023-06-24 18:14:40', '2023-06-24 18:14:40'),
(365, 78, 379, '2023-06-24 18:14:40', '2023-06-24 18:14:40'),
(366, 78, 378, '2023-06-24 18:14:40', '2023-06-24 18:14:40'),
(367, 78, 335, '2023-06-24 18:22:24', '2023-06-24 18:22:24'),
(368, 92, 339, '2023-06-24 19:03:31', '2023-06-24 19:03:31'),
(369, 83, 361, '2023-06-24 21:21:39', '2023-06-24 21:21:39'),
(370, 83, 362, '2023-06-24 21:35:37', '2023-06-24 21:35:37'),
(371, 83, 363, '2023-06-24 22:58:03', '2023-06-24 22:58:03'),
(372, 92, 340, '2023-06-25 07:54:55', '2023-06-25 07:54:55'),
(373, 92, 341, '2023-06-25 07:54:58', '2023-06-25 07:54:58'),
(374, 92, 344, '2023-06-25 07:55:03', '2023-06-25 07:55:03'),
(375, 92, 343, '2023-06-25 08:00:42', '2023-06-25 08:00:42'),
(376, 92, 342, '2023-06-25 08:00:42', '2023-06-25 08:00:42'),
(377, 87, 327, '2023-06-25 09:02:57', '2023-06-25 09:02:57'),
(378, 87, 328, '2023-06-25 10:18:17', '2023-06-25 10:18:17'),
(379, 87, 329, '2023-06-25 10:25:06', '2023-06-25 10:25:06'),
(380, 94, 337, '2023-06-25 12:27:37', '2023-06-25 12:27:37'),
(382, 94, 338, '2023-06-25 14:56:16', '2023-06-25 14:56:16'),
(383, 78, 352, '2023-06-25 17:07:22', '2023-06-25 17:07:22'),
(385, 89, 342, '2023-06-25 17:20:20', '2023-06-25 17:20:20'),
(386, 89, 344, '2023-06-25 17:20:31', '2023-06-25 17:20:31'),
(387, 89, 343, '2023-06-25 17:20:31', '2023-06-25 17:20:31'),
(388, 89, 345, '2023-06-25 17:21:05', '2023-06-25 17:21:05'),
(389, 78, 354, '2023-06-26 09:05:59', '2023-06-26 09:05:59'),
(390, 76, 363, '2023-06-26 12:25:12', '2023-06-26 12:25:12'),
(391, 78, 355, '2023-06-26 15:07:49', '2023-06-26 15:07:49'),
(392, 78, 356, '2023-06-26 15:43:56', '2023-06-26 15:43:56'),
(393, 55, 333, '2023-06-26 17:00:26', '2023-06-26 17:00:26'),
(394, 55, 334, '2023-06-26 17:05:25', '2023-06-26 17:05:25'),
(395, 89, 346, '2023-06-26 17:08:00', '2023-06-26 17:08:00'),
(396, 55, 335, '2023-06-26 17:13:25', '2023-06-26 17:13:25'),
(397, 55, 336, '2023-06-26 17:21:52', '2023-06-26 17:21:52'),
(398, 55, 337, '2023-06-26 17:26:20', '2023-06-26 17:26:20'),
(399, 89, 348, '2023-06-26 17:43:27', '2023-06-26 17:43:27'),
(400, 89, 347, '2023-06-26 17:43:34', '2023-06-26 17:43:34'),
(401, 89, 349, '2023-06-26 17:48:33', '2023-06-26 17:48:33'),
(402, 80, 327, '2023-06-26 18:48:17', '2023-06-26 18:48:17'),
(403, 80, 328, '2023-06-26 18:48:18', '2023-06-26 18:48:18'),
(404, 80, 329, '2023-06-26 18:48:19', '2023-06-26 18:48:19'),
(405, 80, 330, '2023-06-26 18:48:23', '2023-06-26 18:48:23'),
(406, 80, 331, '2023-06-26 18:48:28', '2023-06-26 18:48:28'),
(407, 80, 332, '2023-06-26 18:57:22', '2023-06-26 18:57:22'),
(408, 80, 333, '2023-06-26 18:57:22', '2023-06-26 18:57:22'),
(409, 94, 339, '2023-06-26 19:45:44', '2023-06-26 19:45:44'),
(410, 94, 340, '2023-06-26 20:21:02', '2023-06-26 20:21:02'),
(411, 55, 330, '2023-06-27 06:41:06', '2023-06-27 06:41:06'),
(412, 55, 331, '2023-06-27 06:54:28', '2023-06-27 06:54:28'),
(413, 55, 332, '2023-06-27 06:54:28', '2023-06-27 06:54:28'),
(414, 89, 438, '2023-06-27 17:59:45', '2023-06-27 17:59:45'),
(415, 89, 428, '2023-06-27 17:59:57', '2023-06-27 17:59:57'),
(416, 89, 429, '2023-06-27 17:59:58', '2023-06-27 17:59:58'),
(417, 89, 430, '2023-06-27 17:59:58', '2023-06-27 17:59:58'),
(418, 89, 431, '2023-06-27 17:59:59', '2023-06-27 17:59:59'),
(419, 89, 432, '2023-06-27 17:59:59', '2023-06-27 17:59:59'),
(420, 89, 433, '2023-06-27 18:00:00', '2023-06-27 18:00:00'),
(421, 89, 434, '2023-06-27 18:00:04', '2023-06-27 18:00:04'),
(422, 89, 435, '2023-06-27 18:00:04', '2023-06-27 18:00:04'),
(423, 89, 436, '2023-06-27 18:00:05', '2023-06-27 18:00:05'),
(424, 89, 437, '2023-06-27 18:00:05', '2023-06-27 18:00:05'),
(425, 89, 439, '2023-06-27 18:00:14', '2023-06-27 18:00:14'),
(426, 89, 440, '2023-06-27 18:00:14', '2023-06-27 18:00:14'),
(427, 89, 441, '2023-06-27 18:00:15', '2023-06-27 18:00:15'),
(428, 89, 442, '2023-06-27 18:00:16', '2023-06-27 18:00:16'),
(429, 89, 443, '2023-06-27 18:00:16', '2023-06-27 18:00:16'),
(430, 89, 444, '2023-06-27 18:00:16', '2023-06-27 18:00:16'),
(431, 89, 445, '2023-06-27 18:00:17', '2023-06-27 18:00:17'),
(432, 89, 446, '2023-06-27 18:00:17', '2023-06-27 18:00:17'),
(433, 89, 447, '2023-06-27 18:00:21', '2023-06-27 18:00:21'),
(434, 89, 448, '2023-06-27 18:00:26', '2023-06-27 18:00:26'),
(435, 89, 449, '2023-06-27 18:00:26', '2023-06-27 18:00:26'),
(436, 89, 450, '2023-06-27 18:00:29', '2023-06-27 18:00:29'),
(437, 89, 451, '2023-06-27 18:07:21', '2023-06-27 18:07:21'),
(438, 94, 441, '2023-06-27 20:37:18', '2023-06-27 20:37:18'),
(439, 94, 442, '2023-06-27 21:09:24', '2023-06-27 21:09:24'),
(440, 84, 428, '2023-06-28 05:01:46', '2023-06-28 05:01:46'),
(441, 84, 429, '2023-06-28 05:01:46', '2023-06-28 05:01:46'),
(442, 84, 430, '2023-06-28 05:01:47', '2023-06-28 05:01:47'),
(443, 84, 431, '2023-06-28 05:01:49', '2023-06-28 05:01:49'),
(445, 84, 433, '2023-06-28 05:01:50', '2023-06-28 05:01:50'),
(446, 84, 434, '2023-06-28 05:01:54', '2023-06-28 05:01:54'),
(447, 84, 435, '2023-06-28 05:01:54', '2023-06-28 05:01:54'),
(448, 84, 436, '2023-06-28 05:01:55', '2023-06-28 05:01:55'),
(449, 84, 437, '2023-06-28 05:01:58', '2023-06-28 05:01:58'),
(450, 84, 438, '2023-06-28 05:02:04', '2023-06-28 05:02:04'),
(451, 84, 439, '2023-06-28 05:02:05', '2023-06-28 05:02:05'),
(452, 84, 440, '2023-06-28 05:02:07', '2023-06-28 05:02:07'),
(453, 84, 441, '2023-06-28 05:02:08', '2023-06-28 05:02:08'),
(454, 84, 442, '2023-06-28 05:02:09', '2023-06-28 05:02:09'),
(455, 84, 443, '2023-06-28 05:02:12', '2023-06-28 05:02:12'),
(456, 84, 444, '2023-06-28 05:02:12', '2023-06-28 05:02:12'),
(457, 84, 445, '2023-06-28 05:02:13', '2023-06-28 05:02:13'),
(458, 84, 446, '2023-06-28 05:02:17', '2023-06-28 05:02:17'),
(459, 84, 447, '2023-06-28 05:02:21', '2023-06-28 05:02:21'),
(460, 84, 448, '2023-06-28 05:08:19', '2023-06-28 05:08:19'),
(463, 55, 440, '2023-06-29 09:18:05', '2023-06-29 09:18:05'),
(464, 55, 441, '2023-06-29 09:18:06', '2023-06-29 09:18:06'),
(465, 55, 442, '2023-06-29 09:18:09', '2023-06-29 09:18:09'),
(467, 55, 438, '2023-06-29 09:38:47', '2023-06-29 09:38:47'),
(468, 55, 439, '2023-06-29 09:38:50', '2023-06-29 09:38:50'),
(469, 76, 473, '2023-06-29 11:38:17', '2023-06-29 11:38:17'),
(470, 90, 424, '2023-06-29 14:39:57', '2023-06-29 14:39:57'),
(471, 90, 425, '2023-06-29 14:39:58', '2023-06-29 14:39:58'),
(472, 90, 426, '2023-06-29 14:40:03', '2023-06-29 14:40:03'),
(473, 90, 427, '2023-06-29 14:40:09', '2023-06-29 14:40:09'),
(474, 89, 452, '2023-06-29 17:20:34', '2023-06-29 17:20:34'),
(475, 89, 453, '2023-06-29 17:42:49', '2023-06-29 17:42:49'),
(476, 89, 454, '2023-06-29 17:42:49', '2023-06-29 17:42:49'),
(477, 89, 455, '2023-06-29 18:04:39', '2023-06-29 18:04:39'),
(479, 94, 445, '2023-06-29 19:17:22', '2023-06-29 19:17:22'),
(480, 94, 444, '2023-06-29 19:17:28', '2023-06-29 19:17:28'),
(481, 94, 446, '2023-06-29 19:27:41', '2023-06-29 19:27:41'),
(482, 76, 472, '2023-06-30 07:02:49', '2023-06-30 07:02:49'),
(483, 76, 471, '2023-06-30 07:02:49', '2023-06-30 07:02:49'),
(484, 76, 469, '2023-06-30 07:02:50', '2023-06-30 07:02:50'),
(486, 76, 467, '2023-06-30 07:02:53', '2023-06-30 07:02:53'),
(487, 76, 468, '2023-06-30 07:02:54', '2023-06-30 07:02:54'),
(488, 76, 470, '2023-06-30 07:02:54', '2023-06-30 07:02:54'),
(489, 76, 474, '2023-06-30 07:35:42', '2023-06-30 07:35:42'),
(490, 76, 475, '2023-06-30 07:35:43', '2023-06-30 07:35:43'),
(491, 84, 432, '2023-06-30 23:13:56', '2023-06-30 23:13:56'),
(492, 84, 449, '2023-06-30 23:14:07', '2023-06-30 23:14:07'),
(493, 84, 450, '2023-06-30 23:23:34', '2023-06-30 23:23:34'),
(494, 94, 447, '2023-07-01 07:25:06', '2023-07-01 07:25:06'),
(495, 94, 440, '2023-07-01 07:29:15', '2023-07-01 07:29:15'),
(496, 94, 439, '2023-07-01 07:29:16', '2023-07-01 07:29:16'),
(497, 94, 438, '2023-07-01 07:29:19', '2023-07-01 07:29:19'),
(498, 94, 443, '2023-07-01 07:29:20', '2023-07-01 07:29:20'),
(499, 94, 428, '2023-07-01 07:29:29', '2023-07-01 07:29:29'),
(500, 94, 429, '2023-07-01 07:29:30', '2023-07-01 07:29:30'),
(501, 94, 430, '2023-07-01 07:29:33', '2023-07-01 07:29:33'),
(502, 94, 431, '2023-07-01 07:29:34', '2023-07-01 07:29:34'),
(503, 94, 432, '2023-07-01 07:29:37', '2023-07-01 07:29:37'),
(504, 94, 433, '2023-07-01 07:29:39', '2023-07-01 07:29:39'),
(505, 94, 434, '2023-07-01 07:29:43', '2023-07-01 07:29:43'),
(506, 94, 435, '2023-07-01 07:29:47', '2023-07-01 07:29:47'),
(507, 94, 436, '2023-07-01 07:29:47', '2023-07-01 07:29:47'),
(508, 94, 437, '2023-07-01 07:30:02', '2023-07-01 07:30:02'),
(509, 94, 448, '2023-07-01 07:30:08', '2023-07-01 07:30:08'),
(510, 94, 449, '2023-07-01 07:47:54', '2023-07-01 07:47:54'),
(511, 78, 458, '2023-07-01 13:34:18', '2023-07-01 13:34:18'),
(512, 94, 450, '2023-07-01 20:02:52', '2023-07-01 20:02:52'),
(513, 94, 451, '2023-07-01 20:08:24', '2023-07-01 20:08:24'),
(514, 94, 452, '2023-07-01 20:49:19', '2023-07-01 20:49:19'),
(515, 94, 453, '2023-07-01 20:51:44', '2023-07-01 20:51:44'),
(516, 94, 454, '2023-07-01 21:01:55', '2023-07-01 21:01:55'),
(517, 94, 455, '2023-07-01 21:02:14', '2023-07-01 21:02:14'),
(518, 94, 456, '2023-07-01 21:03:45', '2023-07-01 21:03:45'),
(519, 78, 459, '2023-07-02 15:45:59', '2023-07-02 15:45:59'),
(520, 89, 456, '2023-07-02 16:48:04', '2023-07-02 16:48:04'),
(521, 89, 457, '2023-07-02 16:53:01', '2023-07-02 16:53:01'),
(522, 89, 458, '2023-07-02 17:13:13', '2023-07-02 17:13:13'),
(523, 84, 451, '2023-07-03 04:31:10', '2023-07-03 04:31:10'),
(524, 84, 452, '2023-07-03 04:31:13', '2023-07-03 04:31:13'),
(525, 89, 459, '2023-07-03 16:53:59', '2023-07-03 16:53:59'),
(526, 89, 460, '2023-07-03 17:00:16', '2023-07-03 17:00:16'),
(527, 89, 461, '2023-07-03 17:04:24', '2023-07-03 17:04:24'),
(528, 94, 457, '2023-07-03 21:00:07', '2023-07-03 21:00:07'),
(529, 94, 458, '2023-07-03 21:00:24', '2023-07-03 21:00:24'),
(530, 94, 459, '2023-07-03 21:01:51', '2023-07-03 21:01:51'),
(531, 94, 460, '2023-07-03 21:02:44', '2023-07-03 21:02:44'),
(532, 94, 461, '2023-07-03 21:04:12', '2023-07-03 21:04:12'),
(533, 94, 462, '2023-07-03 21:05:03', '2023-07-03 21:05:03'),
(534, 94, 463, '2023-07-03 21:26:58', '2023-07-03 21:26:58'),
(535, 84, 453, '2023-07-04 05:08:00', '2023-07-04 05:08:00'),
(536, 84, 454, '2023-07-04 05:31:46', '2023-07-04 05:31:46'),
(537, 80, 438, '2023-07-04 08:33:20', '2023-07-04 08:33:20'),
(538, 80, 437, '2023-07-04 09:39:40', '2023-07-04 09:39:40'),
(539, 80, 428, '2023-07-04 09:39:44', '2023-07-04 09:39:44'),
(540, 80, 429, '2023-07-04 09:39:46', '2023-07-04 09:39:46'),
(541, 80, 430, '2023-07-04 09:39:49', '2023-07-04 09:39:49'),
(542, 80, 431, '2023-07-04 09:39:51', '2023-07-04 09:39:51'),
(543, 80, 432, '2023-07-04 09:39:54', '2023-07-04 09:39:54'),
(544, 80, 433, '2023-07-04 09:39:57', '2023-07-04 09:39:57'),
(545, 80, 439, '2023-07-04 09:40:13', '2023-07-04 09:40:13'),
(546, 80, 440, '2023-07-04 09:49:55', '2023-07-04 09:49:55'),
(547, 80, 442, '2023-07-04 13:27:36', '2023-07-04 13:27:36'),
(548, 80, 441, '2023-07-04 13:27:36', '2023-07-04 13:27:36'),
(549, 80, 435, '2023-07-04 13:56:41', '2023-07-04 13:56:41'),
(550, 80, 434, '2023-07-04 13:56:44', '2023-07-04 13:56:44'),
(551, 80, 436, '2023-07-04 13:56:49', '2023-07-04 13:56:49'),
(552, 89, 462, '2023-07-04 17:56:52', '2023-07-04 17:56:52'),
(553, 89, 463, '2023-07-04 18:12:02', '2023-07-04 18:12:02'),
(554, 89, 464, '2023-07-04 18:23:37', '2023-07-04 18:23:37'),
(555, 55, 453, '2023-07-05 07:27:56', '2023-07-05 07:27:56'),
(556, 55, 454, '2023-07-05 07:30:48', '2023-07-05 07:30:48'),
(557, 55, 455, '2023-07-05 08:42:05', '2023-07-05 08:42:05'),
(558, 78, 461, '2023-07-05 15:37:43', '2023-07-05 15:37:43'),
(559, 78, 460, '2023-07-05 15:38:14', '2023-07-05 15:38:14'),
(560, 94, 464, '2023-07-05 20:32:07', '2023-07-05 20:32:07'),
(561, 94, 465, '2023-07-05 20:36:43', '2023-07-05 20:36:43'),
(562, 94, 485, '2023-07-05 20:37:20', '2023-07-05 20:37:20'),
(563, 94, 466, '2023-07-05 20:41:47', '2023-07-05 20:41:47'),
(564, 93, 428, '2023-07-06 08:56:38', '2023-07-06 08:56:38'),
(565, 80, 443, '2023-07-06 13:51:25', '2023-07-06 13:51:25'),
(566, 80, 444, '2023-07-06 13:51:25', '2023-07-06 13:51:25'),
(567, 80, 445, '2023-07-06 14:21:50', '2023-07-06 14:21:50'),
(568, 80, 447, '2023-07-06 14:21:54', '2023-07-06 14:21:54'),
(569, 80, 449, '2023-07-06 16:23:51', '2023-07-06 16:23:51'),
(570, 80, 448, '2023-07-06 16:23:53', '2023-07-06 16:23:53'),
(571, 84, 455, '2023-07-07 04:28:11', '2023-07-07 04:28:11'),
(572, 163, 428, '2023-07-07 05:08:30', '2023-07-07 05:08:30'),
(573, 163, 429, '2023-07-07 05:16:05', '2023-07-07 05:16:05'),
(574, 36, 428, '2023-07-07 11:50:26', '2023-07-07 11:50:26'),
(575, 36, 429, '2023-07-07 11:50:27', '2023-07-07 11:50:27'),
(576, 36, 430, '2023-07-07 11:50:27', '2023-07-07 11:50:27'),
(577, 36, 431, '2023-07-07 12:03:24', '2023-07-07 12:03:24'),
(578, 36, 432, '2023-07-07 12:03:24', '2023-07-07 12:03:24'),
(579, 55, 459, '2023-07-07 13:28:53', '2023-07-07 13:28:53'),
(580, 55, 460, '2023-07-07 13:28:53', '2023-07-07 13:28:53'),
(581, 55, 461, '2023-07-07 13:28:54', '2023-07-07 13:28:54'),
(582, 55, 462, '2023-07-07 13:29:56', '2023-07-07 13:29:56'),
(583, 55, 463, '2023-07-07 13:34:26', '2023-07-07 13:34:26'),
(584, 55, 464, '2023-07-07 13:39:11', '2023-07-07 13:39:11'),
(585, 92, 428, '2023-07-07 17:14:28', '2023-07-07 17:14:28'),
(586, 92, 429, '2023-07-07 17:14:29', '2023-07-07 17:14:29'),
(587, 92, 430, '2023-07-07 17:14:34', '2023-07-07 17:14:34'),
(588, 92, 431, '2023-07-07 17:14:36', '2023-07-07 17:14:36'),
(589, 92, 432, '2023-07-07 17:14:38', '2023-07-07 17:14:38'),
(590, 92, 433, '2023-07-07 17:14:42', '2023-07-07 17:14:42'),
(591, 92, 434, '2023-07-07 17:14:45', '2023-07-07 17:14:45'),
(592, 92, 435, '2023-07-07 17:14:47', '2023-07-07 17:14:47'),
(593, 92, 436, '2023-07-07 17:14:49', '2023-07-07 17:14:49'),
(594, 92, 437, '2023-07-07 17:14:54', '2023-07-07 17:14:54'),
(595, 92, 438, '2023-07-07 17:14:59', '2023-07-07 17:14:59'),
(596, 92, 439, '2023-07-07 17:15:02', '2023-07-07 17:15:02'),
(597, 92, 440, '2023-07-07 17:15:05', '2023-07-07 17:15:05'),
(598, 92, 441, '2023-07-07 17:15:07', '2023-07-07 17:15:07'),
(599, 92, 442, '2023-07-07 17:15:11', '2023-07-07 17:15:11'),
(600, 92, 443, '2023-07-07 17:15:14', '2023-07-07 17:15:14'),
(601, 92, 444, '2023-07-07 17:15:17', '2023-07-07 17:15:17'),
(602, 92, 445, '2023-07-07 17:15:20', '2023-07-07 17:15:20'),
(603, 92, 446, '2023-07-07 17:15:25', '2023-07-07 17:15:25'),
(604, 92, 447, '2023-07-07 17:15:28', '2023-07-07 17:15:28'),
(605, 92, 448, '2023-07-07 17:15:37', '2023-07-07 17:15:37'),
(606, 92, 449, '2023-07-07 17:15:38', '2023-07-07 17:15:38'),
(607, 92, 450, '2023-07-07 17:15:41', '2023-07-07 17:15:41'),
(608, 92, 451, '2023-07-07 17:15:47', '2023-07-07 17:15:47'),
(609, 92, 452, '2023-07-07 17:15:50', '2023-07-07 17:15:50'),
(610, 92, 453, '2023-07-07 17:15:52', '2023-07-07 17:15:52'),
(611, 92, 454, '2023-07-07 17:15:55', '2023-07-07 17:15:55'),
(612, 92, 455, '2023-07-07 17:15:58', '2023-07-07 17:15:58'),
(613, 92, 456, '2023-07-07 17:16:02', '2023-07-07 17:16:02'),
(614, 92, 457, '2023-07-07 17:16:05', '2023-07-07 17:16:05'),
(615, 92, 458, '2023-07-07 17:16:14', '2023-07-07 17:16:14'),
(616, 92, 459, '2023-07-07 17:16:18', '2023-07-07 17:16:18'),
(617, 92, 460, '2023-07-07 17:16:21', '2023-07-07 17:16:21'),
(618, 92, 461, '2023-07-07 17:16:24', '2023-07-07 17:16:24'),
(619, 92, 462, '2023-07-07 17:16:27', '2023-07-07 17:16:27'),
(620, 92, 463, '2023-07-07 17:16:31', '2023-07-07 17:16:31'),
(621, 92, 464, '2023-07-07 17:16:34', '2023-07-07 17:16:34'),
(622, 92, 465, '2023-07-07 17:16:37', '2023-07-07 17:16:37'),
(623, 92, 485, '2023-07-07 17:16:41', '2023-07-07 17:16:41'),
(624, 92, 466, '2023-07-07 17:16:45', '2023-07-07 17:16:45'),
(625, 92, 467, '2023-07-07 17:16:53', '2023-07-07 17:16:53'),
(626, 92, 468, '2023-07-07 17:16:56', '2023-07-07 17:16:56'),
(627, 92, 469, '2023-07-07 17:16:59', '2023-07-07 17:16:59'),
(628, 92, 470, '2023-07-07 17:17:02', '2023-07-07 17:17:02'),
(629, 92, 471, '2023-07-07 17:17:05', '2023-07-07 17:17:05'),
(630, 92, 472, '2023-07-07 17:17:08', '2023-07-07 17:17:08'),
(631, 92, 473, '2023-07-07 17:17:13', '2023-07-07 17:17:13'),
(632, 92, 474, '2023-07-07 17:17:17', '2023-07-07 17:17:17'),
(633, 92, 475, '2023-07-07 17:17:20', '2023-07-07 17:17:20'),
(634, 92, 476, '2023-07-07 17:17:23', '2023-07-07 17:17:23'),
(635, 92, 477, '2023-07-07 17:36:41', '2023-07-07 17:36:41'),
(636, 163, 430, '2023-07-07 20:52:39', '2023-07-07 20:52:39'),
(637, 84, 456, '2023-07-08 04:43:59', '2023-07-08 04:43:59'),
(638, 78, 462, '2023-07-08 04:48:13', '2023-07-08 04:48:13'),
(639, 163, 431, '2023-07-08 05:19:44', '2023-07-08 05:19:44'),
(640, 163, 432, '2023-07-08 12:46:13', '2023-07-08 12:46:13'),
(641, 80, 455, '2023-07-08 13:28:24', '2023-07-08 13:28:24'),
(642, 80, 454, '2023-07-08 13:28:24', '2023-07-08 13:28:24'),
(643, 78, 463, '2023-07-08 14:02:40', '2023-07-08 14:02:40'),
(644, 78, 464, '2023-07-08 15:11:24', '2023-07-08 15:11:24'),
(645, 78, 465, '2023-07-08 15:11:30', '2023-07-08 15:11:30'),
(646, 92, 478, '2023-07-08 16:07:50', '2023-07-08 16:07:50'),
(647, 92, 479, '2023-07-08 16:07:53', '2023-07-08 16:07:53'),
(648, 92, 480, '2023-07-08 16:29:09', '2023-07-08 16:29:09'),
(650, 89, 465, '2023-07-08 17:00:31', '2023-07-08 17:00:31'),
(651, 89, 485, '2023-07-08 17:00:31', '2023-07-08 17:00:31'),
(652, 89, 466, '2023-07-08 17:29:13', '2023-07-08 17:29:13'),
(655, 89, 467, '2023-07-08 17:42:37', '2023-07-08 17:42:37'),
(656, 163, 433, '2023-07-08 18:08:49', '2023-07-08 18:08:49'),
(657, 163, 434, '2023-07-09 08:09:06', '2023-07-09 08:09:06'),
(658, 163, 435, '2023-07-09 09:17:19', '2023-07-09 09:17:19'),
(659, 94, 467, '2023-07-09 13:52:40', '2023-07-09 13:52:40'),
(660, 94, 468, '2023-07-09 14:01:50', '2023-07-09 14:01:50'),
(661, 94, 469, '2023-07-09 14:07:46', '2023-07-09 14:07:46'),
(662, 92, 481, '2023-07-09 17:46:19', '2023-07-09 17:46:19'),
(663, 92, 482, '2023-07-09 18:02:18', '2023-07-09 18:02:18'),
(665, 163, 436, '2023-07-09 20:53:20', '2023-07-09 20:53:20'),
(666, 92, 483, '2023-07-09 20:58:01', '2023-07-09 20:58:01'),
(667, 163, 438, '2023-07-10 08:22:00', '2023-07-10 08:22:00'),
(668, 78, 466, '2023-07-10 11:40:09', '2023-07-10 11:40:09'),
(669, 76, 511, '2023-07-10 14:28:07', '2023-07-10 14:28:07'),
(670, 55, 465, '2023-07-10 14:54:38', '2023-07-10 14:54:38'),
(671, 55, 485, '2023-07-10 14:57:08', '2023-07-10 14:57:08'),
(672, 55, 466, '2023-07-10 15:01:18', '2023-07-10 15:01:18'),
(673, 55, 467, '2023-07-10 15:18:14', '2023-07-10 15:18:14'),
(674, 163, 437, '2023-07-10 18:35:23', '2023-07-10 18:35:23'),
(675, 163, 439, '2023-07-10 18:35:26', '2023-07-10 18:35:26'),
(676, 163, 440, '2023-07-11 07:18:23', '2023-07-11 07:18:23'),
(677, 92, 486, '2023-07-11 08:35:25', '2023-07-11 08:35:25'),
(678, 92, 487, '2023-07-11 08:35:25', '2023-07-11 08:35:25'),
(679, 92, 488, '2023-07-11 09:07:36', '2023-07-11 09:07:36'),
(680, 55, 468, '2023-07-11 12:39:34', '2023-07-11 12:39:34'),
(681, 55, 469, '2023-07-11 12:44:31', '2023-07-11 12:44:31'),
(682, 55, 470, '2023-07-11 12:47:29', '2023-07-11 12:47:29'),
(683, 76, 515, '2023-07-11 14:25:30', '2023-07-11 14:25:30'),
(684, 76, 514, '2023-07-11 14:25:38', '2023-07-11 14:25:38'),
(685, 76, 513, '2023-07-11 14:25:38', '2023-07-11 14:25:38'),
(686, 76, 512, '2023-07-11 14:25:38', '2023-07-11 14:25:38'),
(687, 76, 510, '2023-07-11 14:25:39', '2023-07-11 14:25:39'),
(688, 163, 441, '2023-07-11 17:21:04', '2023-07-11 17:21:04'),
(689, 163, 442, '2023-07-11 17:21:05', '2023-07-11 17:21:05'),
(691, 84, 457, '2023-07-12 04:32:06', '2023-07-12 04:32:06'),
(692, 84, 458, '2023-07-12 04:52:00', '2023-07-12 04:52:00'),
(693, 92, 489, '2023-07-12 08:51:23', '2023-07-12 08:51:23'),
(694, 92, 490, '2023-07-12 09:12:41', '2023-07-12 09:12:41'),
(695, 92, 491, '2023-07-12 09:14:56', '2023-07-12 09:14:56'),
(696, 55, 471, '2023-07-12 09:26:48', '2023-07-12 09:26:48'),
(697, 55, 472, '2023-07-12 09:36:03', '2023-07-12 09:36:03'),
(698, 55, 473, '2023-07-12 09:41:08', '2023-07-12 09:41:08'),
(699, 55, 474, '2023-07-12 09:47:15', '2023-07-12 09:47:15'),
(700, 55, 475, '2023-07-12 09:50:15', '2023-07-12 09:50:15'),
(701, 55, 476, '2023-07-12 09:53:53', '2023-07-12 09:53:53'),
(702, 163, 443, '2023-07-12 09:54:24', '2023-07-12 09:54:24'),
(703, 163, 444, '2023-07-12 09:54:29', '2023-07-12 09:54:29'),
(704, 55, 477, '2023-07-12 09:56:24', '2023-07-12 09:56:24'),
(705, 76, 517, '2023-07-12 10:15:53', '2023-07-12 10:15:53'),
(706, 76, 516, '2023-07-12 10:15:53', '2023-07-12 10:15:53'),
(707, 163, 445, '2023-07-12 14:00:39', '2023-07-12 14:00:39'),
(708, 94, 470, '2023-07-12 19:42:49', '2023-07-12 19:42:49'),
(709, 76, 518, '2023-07-13 09:16:25', '2023-07-13 09:16:25'),
(710, 76, 519, '2023-07-13 09:16:26', '2023-07-13 09:16:26'),
(711, 76, 520, '2023-07-13 09:29:48', '2023-07-13 09:29:48'),
(712, 76, 521, '2023-07-13 10:23:32', '2023-07-13 10:23:32'),
(713, 55, 478, '2023-07-13 18:15:19', '2023-07-13 18:15:19'),
(714, 55, 479, '2023-07-13 18:17:38', '2023-07-13 18:17:38'),
(715, 163, 446, '2023-07-14 10:40:12', '2023-07-14 10:40:12'),
(716, 163, 447, '2023-07-14 10:40:15', '2023-07-14 10:40:15'),
(717, 191, 428, '2023-07-14 11:39:41', '2023-07-14 11:39:41'),
(718, 191, 429, '2023-07-14 11:39:41', '2023-07-14 11:39:41'),
(719, 191, 430, '2023-07-14 11:39:42', '2023-07-14 11:39:42'),
(720, 191, 431, '2023-07-14 11:39:46', '2023-07-14 11:39:46'),
(721, 191, 432, '2023-07-14 11:39:49', '2023-07-14 11:39:49'),
(722, 191, 433, '2023-07-14 11:39:53', '2023-07-14 11:39:53'),
(723, 191, 434, '2023-07-14 11:39:57', '2023-07-14 11:39:57'),
(724, 191, 435, '2023-07-14 11:40:01', '2023-07-14 11:40:01'),
(725, 25, 428, '2023-07-14 12:47:02', '2023-07-14 12:47:02'),
(726, 55, 480, '2023-07-14 12:52:32', '2023-07-14 12:52:32'),
(727, 55, 481, '2023-07-14 12:59:51', '2023-07-14 12:59:51'),
(728, 55, 482, '2023-07-14 13:03:15', '2023-07-14 13:03:15'),
(729, 76, 522, '2023-07-14 14:47:30', '2023-07-14 14:47:30'),
(730, 76, 523, '2023-07-14 14:47:30', '2023-07-14 14:47:30'),
(731, 76, 524, '2023-07-14 14:47:30', '2023-07-14 14:47:30'),
(732, 92, 492, '2023-07-14 15:09:08', '2023-07-14 15:09:08'),
(733, 92, 493, '2023-07-14 15:09:11', '2023-07-14 15:09:11'),
(734, 92, 494, '2023-07-14 15:28:10', '2023-07-14 15:28:10'),
(735, 163, 1229, '2023-07-14 17:37:12', '2023-07-14 17:37:12'),
(736, 163, 1231, '2023-07-14 17:37:12', '2023-07-14 17:37:12'),
(737, 163, 1230, '2023-07-14 17:37:15', '2023-07-14 17:37:15'),
(738, 163, 1232, '2023-07-14 17:37:18', '2023-07-14 17:37:18'),
(739, 163, 1233, '2023-07-14 17:37:21', '2023-07-14 17:37:21'),
(740, 163, 1234, '2023-07-14 17:37:29', '2023-07-14 17:37:29'),
(741, 163, 1235, '2023-07-14 17:37:32', '2023-07-14 17:37:32'),
(742, 163, 1236, '2023-07-14 17:37:35', '2023-07-14 17:37:35'),
(743, 163, 1237, '2023-07-14 17:37:38', '2023-07-14 17:37:38'),
(744, 163, 1238, '2023-07-14 17:37:42', '2023-07-14 17:37:42'),
(745, 163, 1239, '2023-07-14 17:38:08', '2023-07-14 17:38:08'),
(746, 163, 1240, '2023-07-14 17:38:12', '2023-07-14 17:38:12'),
(747, 163, 1220, '2023-07-14 17:39:29', '2023-07-14 17:39:29'),
(748, 188, 1219, '2023-07-14 19:52:36', '2023-07-14 19:52:36'),
(749, 195, 1219, '2023-07-14 20:28:21', '2023-07-14 20:28:21'),
(750, 188, 1220, '2023-07-14 20:29:56', '2023-07-14 20:29:56'),
(751, 94, 1261, '2023-07-14 20:47:09', '2023-07-14 20:47:09'),
(752, 94, 1262, '2023-07-14 20:51:19', '2023-07-14 20:51:19'),
(754, 195, 1220, '2023-07-15 04:27:47', '2023-07-15 04:27:47'),
(755, 94, 1263, '2023-07-15 06:15:11', '2023-07-15 06:15:11'),
(756, 94, 1264, '2023-07-15 06:31:34', '2023-07-15 06:31:34'),
(757, 89, 1219, '2023-07-15 08:16:21', '2023-07-15 08:16:21'),
(758, 89, 1220, '2023-07-15 08:16:21', '2023-07-15 08:16:21'),
(759, 89, 1221, '2023-07-15 08:16:22', '2023-07-15 08:16:22'),
(760, 89, 1222, '2023-07-15 08:16:22', '2023-07-15 08:16:22'),
(761, 89, 1223, '2023-07-15 08:16:23', '2023-07-15 08:16:23'),
(762, 89, 1224, '2023-07-15 08:16:23', '2023-07-15 08:16:23'),
(763, 89, 1225, '2023-07-15 08:16:24', '2023-07-15 08:16:24'),
(764, 89, 1226, '2023-07-15 08:16:24', '2023-07-15 08:16:24'),
(765, 89, 1227, '2023-07-15 08:16:28', '2023-07-15 08:16:28'),
(766, 89, 1228, '2023-07-15 08:16:28', '2023-07-15 08:16:28'),
(767, 89, 1239, '2023-07-15 08:16:32', '2023-07-15 08:16:32'),
(768, 89, 1240, '2023-07-15 08:16:33', '2023-07-15 08:16:33'),
(769, 89, 1241, '2023-07-15 08:16:33', '2023-07-15 08:16:33'),
(770, 89, 1242, '2023-07-15 08:16:34', '2023-07-15 08:16:34'),
(771, 89, 1243, '2023-07-15 08:16:35', '2023-07-15 08:16:35'),
(772, 89, 1244, '2023-07-15 08:16:35', '2023-07-15 08:16:35'),
(773, 89, 1245, '2023-07-15 08:16:36', '2023-07-15 08:16:36'),
(774, 89, 1247, '2023-07-15 08:16:40', '2023-07-15 08:16:40'),
(775, 89, 1246, '2023-07-15 08:16:40', '2023-07-15 08:16:40'),
(776, 89, 1248, '2023-07-15 08:16:41', '2023-07-15 08:16:41'),
(777, 89, 1249, '2023-07-15 08:16:45', '2023-07-15 08:16:45'),
(778, 89, 1250, '2023-07-15 08:16:45', '2023-07-15 08:16:45'),
(779, 89, 1251, '2023-07-15 08:16:46', '2023-07-15 08:16:46'),
(781, 89, 1252, '2023-07-15 08:16:47', '2023-07-15 08:16:47'),
(782, 89, 1253, '2023-07-15 08:16:48', '2023-07-15 08:16:48'),
(783, 89, 1254, '2023-07-15 08:16:48', '2023-07-15 08:16:48'),
(784, 89, 1255, '2023-07-15 08:16:49', '2023-07-15 08:16:49'),
(785, 89, 1256, '2023-07-15 08:16:49', '2023-07-15 08:16:49'),
(786, 89, 1257, '2023-07-15 08:16:52', '2023-07-15 08:16:52'),
(787, 89, 1258, '2023-07-15 08:16:53', '2023-07-15 08:16:53'),
(788, 89, 1259, '2023-07-15 08:16:57', '2023-07-15 08:16:57'),
(792, 89, 1261, '2023-07-15 09:18:20', '2023-07-15 09:18:20'),
(793, 163, 1241, '2023-07-15 11:22:57', '2023-07-15 11:22:57'),
(794, 196, 1219, '2023-07-15 11:35:00', '2023-07-15 11:35:00'),
(795, 196, 1220, '2023-07-15 11:35:01', '2023-07-15 11:35:01'),
(796, 196, 1221, '2023-07-15 11:35:04', '2023-07-15 11:35:04'),
(797, 196, 1222, '2023-07-15 11:35:06', '2023-07-15 11:35:06'),
(798, 89, 1260, '2023-07-15 18:08:11', '2023-07-15 18:08:11'),
(799, 89, 1262, '2023-07-15 18:08:12', '2023-07-15 18:08:12'),
(800, 163, 1219, '2023-07-15 18:39:16', '2023-07-15 18:39:16'),
(801, 163, 1221, '2023-07-15 18:39:21', '2023-07-15 18:39:21'),
(802, 163, 1242, '2023-07-15 18:39:26', '2023-07-15 18:39:26'),
(803, 163, 1243, '2023-07-15 18:39:29', '2023-07-15 18:39:29'),
(804, 94, 1265, '2023-07-15 20:23:51', '2023-07-15 20:23:51'),
(805, 94, 1266, '2023-07-15 20:30:22', '2023-07-15 20:30:22'),
(806, 94, 1267, '2023-07-15 20:30:48', '2023-07-15 20:30:48'),
(807, 94, 1268, '2023-07-15 20:33:29', '2023-07-15 20:33:29'),
(808, 196, 1223, '2023-07-16 10:48:46', '2023-07-16 10:48:46'),
(809, 196, 1224, '2023-07-16 10:48:47', '2023-07-16 10:48:47'),
(810, 196, 1225, '2023-07-16 10:52:42', '2023-07-16 10:52:42'),
(811, 163, 1244, '2023-07-16 14:12:06', '2023-07-16 14:12:06'),
(812, 163, 1245, '2023-07-16 14:23:42', '2023-07-16 14:23:42'),
(813, 163, 1246, '2023-07-16 14:23:45', '2023-07-16 14:23:45'),
(814, 195, 1221, '2023-07-16 15:50:30', '2023-07-16 15:50:30'),
(815, 195, 1222, '2023-07-16 16:31:53', '2023-07-16 16:31:53'),
(816, 195, 1224, '2023-07-16 16:48:45', '2023-07-16 16:48:45'),
(817, 195, 1223, '2023-07-16 16:48:45', '2023-07-16 16:48:45'),
(818, 94, 1269, '2023-07-16 19:03:16', '2023-07-16 19:03:16'),
(819, 94, 1270, '2023-07-16 19:05:58', '2023-07-16 19:05:58'),
(820, 196, 1226, '2023-07-16 21:23:20', '2023-07-16 21:23:20'),
(821, 196, 1227, '2023-07-16 21:42:20', '2023-07-16 21:42:20'),
(823, 163, 1222, '2023-07-17 07:53:58', '2023-07-17 07:53:58'),
(824, 89, 1263, '2023-07-17 08:21:42', '2023-07-17 08:21:42'),
(825, 89, 1264, '2023-07-17 08:22:54', '2023-07-17 08:22:54'),
(826, 163, 1247, '2023-07-17 08:48:16', '2023-07-17 08:48:16'),
(827, 163, 1248, '2023-07-17 08:49:10', '2023-07-17 08:49:10'),
(828, 92, 1279, '2023-07-17 09:00:54', '2023-07-17 09:00:54'),
(829, 92, 1280, '2023-07-17 09:00:56', '2023-07-17 09:00:56'),
(830, 92, 1281, '2023-07-17 09:00:58', '2023-07-17 09:00:58'),
(831, 92, 1286, '2023-07-17 09:01:13', '2023-07-17 09:01:13'),
(832, 92, 1287, '2023-07-17 09:01:17', '2023-07-17 09:01:17'),
(833, 92, 1288, '2023-07-17 09:01:20', '2023-07-17 09:01:20'),
(834, 170, 1219, '2023-07-17 13:25:47', '2023-07-17 13:25:47'),
(835, 170, 1220, '2023-07-17 13:25:58', '2023-07-17 13:25:58'),
(836, 170, 1221, '2023-07-17 13:26:00', '2023-07-17 13:26:00'),
(837, 170, 1222, '2023-07-17 13:26:04', '2023-07-17 13:26:04'),
(838, 170, 1223, '2023-07-17 13:26:07', '2023-07-17 13:26:07'),
(839, 170, 1224, '2023-07-17 13:26:10', '2023-07-17 13:26:10'),
(840, 170, 1225, '2023-07-17 13:26:13', '2023-07-17 13:26:13'),
(841, 170, 1226, '2023-07-17 13:26:17', '2023-07-17 13:26:17'),
(842, 170, 1227, '2023-07-17 13:26:20', '2023-07-17 13:26:20'),
(843, 170, 1228, '2023-07-17 13:26:23', '2023-07-17 13:26:23'),
(844, 170, 1229, '2023-07-17 13:26:28', '2023-07-17 13:26:28'),
(845, 170, 1230, '2023-07-17 13:26:30', '2023-07-17 13:26:30'),
(847, 196, 1228, '2023-07-18 05:43:34', '2023-07-18 05:43:34'),
(848, 195, 1225, '2023-07-18 10:43:35', '2023-07-18 10:43:35'),
(849, 195, 1226, '2023-07-18 10:43:40', '2023-07-18 10:43:40'),
(850, 196, 1229, '2023-07-18 12:09:08', '2023-07-18 12:09:08'),
(851, 196, 1230, '2023-07-18 12:09:14', '2023-07-18 12:09:14'),
(852, 196, 1232, '2023-07-18 12:11:58', '2023-07-18 12:11:58'),
(853, 196, 1233, '2023-07-18 12:11:58', '2023-07-18 12:11:58'),
(854, 196, 1231, '2023-07-18 12:12:02', '2023-07-18 12:12:02'),
(855, 196, 1234, '2023-07-18 12:28:59', '2023-07-18 12:28:59'),
(856, 196, 1235, '2023-07-18 12:29:09', '2023-07-18 12:29:09'),
(857, 205, 1219, '2023-07-18 14:57:22', '2023-07-18 14:57:22'),
(858, 163, 1249, '2023-07-18 17:51:23', '2023-07-18 17:51:23'),
(859, 163, 1250, '2023-07-18 17:51:28', '2023-07-18 17:51:28'),
(860, 163, 1251, '2023-07-18 18:02:17', '2023-07-18 18:02:17'),
(861, 92, 1292, '2023-07-19 10:55:58', '2023-07-19 10:55:58'),
(862, 92, 1293, '2023-07-19 10:56:01', '2023-07-19 10:56:01'),
(863, 92, 1294, '2023-07-19 10:56:05', '2023-07-19 10:56:05'),
(864, 89, 1265, '2023-07-19 18:00:29', '2023-07-19 18:00:29'),
(865, 163, 1252, '2023-07-19 18:18:00', '2023-07-19 18:18:00'),
(866, 163, 1253, '2023-07-19 18:18:06', '2023-07-19 18:18:06'),
(867, 163, 1254, '2023-07-19 18:31:34', '2023-07-19 18:31:34'),
(868, 163, 1255, '2023-07-19 20:26:48', '2023-07-19 20:26:48'),
(869, 188, 1221, '2023-07-20 08:07:21', '2023-07-20 08:07:21'),
(870, 196, 1236, '2023-07-20 13:17:03', '2023-07-20 13:17:03'),
(872, 195, 1227, '2023-07-20 15:20:28', '2023-07-20 15:20:28'),
(874, 195, 1228, '2023-07-20 15:20:37', '2023-07-20 15:20:37'),
(875, 195, 1229, '2023-07-20 15:28:07', '2023-07-20 15:28:07'),
(876, 195, 1230, '2023-07-20 15:28:18', '2023-07-20 15:28:18'),
(877, 76, 1313, '2023-07-20 16:40:23', '2023-07-20 16:40:23'),
(878, 76, 1312, '2023-07-20 16:40:23', '2023-07-20 16:40:23'),
(879, 76, 1314, '2023-07-20 16:40:24', '2023-07-20 16:40:24'),
(880, 163, 1223, '2023-07-20 17:48:27', '2023-07-20 17:48:27'),
(881, 89, 1269, '2023-07-20 19:27:21', '2023-07-20 19:27:21'),
(882, 89, 1270, '2023-07-20 19:31:30', '2023-07-20 19:31:30'),
(883, 89, 1271, '2023-07-20 19:49:11', '2023-07-20 19:49:11'),
(884, 94, 1271, '2023-07-20 20:31:39', '2023-07-20 20:31:39'),
(885, 94, 1272, '2023-07-20 20:42:57', '2023-07-20 20:42:57'),
(886, 163, 1256, '2023-07-21 18:11:50', '2023-07-21 18:11:50'),
(887, 163, 1257, '2023-07-21 19:00:09', '2023-07-21 19:00:09'),
(888, 84, 1249, '2023-07-22 04:20:14', '2023-07-22 04:20:14'),
(889, 84, 1250, '2023-07-22 04:20:15', '2023-07-22 04:20:15'),
(890, 84, 1251, '2023-07-22 04:20:18', '2023-07-22 04:20:18'),
(891, 84, 1252, '2023-07-22 04:20:24', '2023-07-22 04:20:24'),
(892, 84, 1253, '2023-07-22 04:20:27', '2023-07-22 04:20:27'),
(893, 52, 1238, '2023-07-22 05:51:12', '2023-07-22 05:51:12'),
(894, 188, 1222, '2023-07-22 07:40:31', '2023-07-22 07:40:31'),
(895, 76, 1316, '2023-07-22 11:58:25', '2023-07-22 11:58:25'),
(896, 76, 1317, '2023-07-22 11:58:25', '2023-07-22 11:58:25'),
(897, 76, 1315, '2023-07-22 11:58:30', '2023-07-22 11:58:30'),
(898, 76, 1318, '2023-07-22 11:58:31', '2023-07-22 11:58:31'),
(899, 76, 1309, '2023-07-22 11:58:33', '2023-07-22 11:58:33'),
(900, 76, 1310, '2023-07-22 11:58:33', '2023-07-22 11:58:33'),
(901, 76, 1311, '2023-07-22 11:58:34', '2023-07-22 11:58:34'),
(902, 89, 1272, '2023-07-22 17:53:41', '2023-07-22 17:53:41'),
(903, 89, 1273, '2023-07-22 18:02:41', '2023-07-22 18:02:41');
INSERT INTO `vendor_users` (`id`, `user_id`, `lesson_id`, `created_at`, `updated_at`) VALUES
(904, 89, 1274, '2023-07-22 18:38:10', '2023-07-22 18:38:10'),
(905, 163, 1259, '2023-07-22 19:06:59', '2023-07-22 19:06:59'),
(906, 163, 1260, '2023-07-22 21:12:43', '2023-07-22 21:12:43'),
(907, 163, 1261, '2023-07-22 21:12:50', '2023-07-22 21:12:50'),
(908, 163, 1224, '2023-07-22 21:33:31', '2023-07-22 21:33:31'),
(909, 163, 1225, '2023-07-22 21:33:53', '2023-07-22 21:33:53'),
(910, 163, 1226, '2023-07-22 21:45:15', '2023-07-22 21:45:15'),
(911, 163, 1227, '2023-07-22 21:47:30', '2023-07-22 21:47:30'),
(912, 163, 1228, '2023-07-22 21:48:50', '2023-07-22 21:48:50'),
(913, 163, 1262, '2023-07-23 18:49:46', '2023-07-23 18:49:46'),
(914, 163, 1263, '2023-07-23 19:09:17', '2023-07-23 19:09:17'),
(915, 163, 1264, '2023-07-23 19:11:45', '2023-07-23 19:11:45'),
(916, 84, 1360, '2023-07-24 17:13:09', '2023-07-24 17:13:09'),
(917, 163, 1372, '2023-07-24 19:00:25', '2023-07-24 19:00:25'),
(918, 214, 1326, '2023-07-25 17:35:16', '2023-07-25 17:35:16'),
(919, 214, 1325, '2023-07-25 17:41:37', '2023-07-25 17:41:37'),
(920, 214, 1327, '2023-07-25 17:41:38', '2023-07-25 17:41:38'),
(921, 163, 1375, '2023-07-25 19:51:28', '2023-07-25 19:51:28'),
(922, 84, 1361, '2023-07-26 04:28:50', '2023-07-26 04:28:50'),
(923, 163, 1492, '2023-07-27 17:40:58', '2023-07-27 17:40:58'),
(924, 89, 1497, '2023-07-27 17:50:08', '2023-07-27 17:50:08'),
(925, 94, 1500, '2023-07-27 20:34:58', '2023-07-27 20:34:58'),
(926, 94, 1501, '2023-07-27 20:42:32', '2023-07-27 20:42:32'),
(927, 55, 1489, '2023-07-29 14:07:03', '2023-07-29 14:07:03'),
(928, 55, 1490, '2023-07-29 14:07:05', '2023-07-29 14:07:05'),
(929, 55, 1491, '2023-07-29 14:07:07', '2023-07-29 14:07:07'),
(930, 55, 1492, '2023-07-29 14:07:09', '2023-07-29 14:07:09'),
(931, 55, 1493, '2023-07-29 14:07:13', '2023-07-29 14:07:13'),
(932, 55, 1494, '2023-07-29 14:07:17', '2023-07-29 14:07:17'),
(933, 163, 1497, '2023-07-30 07:40:35', '2023-07-30 07:40:35'),
(934, 78, 1595, '2023-08-01 08:06:02', '2023-08-01 08:06:02'),
(935, 232, 1557, '2023-08-01 14:08:12', '2023-08-01 14:08:12'),
(936, 232, 1558, '2023-08-01 14:08:18', '2023-08-01 14:08:18'),
(937, 163, 1621, '2023-08-01 19:06:50', '2023-08-01 19:06:50'),
(938, 52, 1579, '2023-08-02 06:44:07', '2023-08-02 06:44:07'),
(939, 195, 1557, '2023-08-02 08:55:41', '2023-08-02 08:55:41'),
(940, 195, 1558, '2023-08-02 08:55:43', '2023-08-02 08:55:43'),
(941, 195, 1559, '2023-08-02 08:57:01', '2023-08-02 08:57:01'),
(943, 195, 1561, '2023-08-02 08:57:20', '2023-08-02 08:57:20'),
(944, 195, 1562, '2023-08-02 08:57:29', '2023-08-02 08:57:29'),
(945, 195, 1560, '2023-08-02 08:58:06', '2023-08-02 08:58:06'),
(946, 195, 1563, '2023-08-02 08:58:43', '2023-08-02 08:58:43'),
(947, 195, 1564, '2023-08-02 08:59:42', '2023-08-02 08:59:42'),
(949, 195, 1565, '2023-08-02 09:00:36', '2023-08-02 09:00:36'),
(950, 195, 1566, '2023-08-02 09:00:47', '2023-08-02 09:00:47'),
(951, 195, 1567, '2023-08-02 09:01:35', '2023-08-02 09:01:35'),
(952, 195, 1568, '2023-08-02 09:02:55', '2023-08-02 09:02:55'),
(953, 234, 1557, '2023-08-02 09:42:55', '2023-08-02 09:42:55'),
(954, 78, 1596, '2023-08-02 13:25:35', '2023-08-02 13:25:35'),
(955, 232, 1559, '2023-08-02 14:18:37', '2023-08-02 14:18:37'),
(956, 232, 1560, '2023-08-02 14:33:08', '2023-08-02 14:33:08'),
(957, 232, 1561, '2023-08-02 15:13:20', '2023-08-02 15:13:20'),
(958, 163, 1624, '2023-08-02 17:52:27', '2023-08-02 17:52:27'),
(959, 227, 1557, '2023-08-02 19:47:11', '2023-08-02 19:47:11'),
(960, 227, 1558, '2023-08-02 21:24:59', '2023-08-02 21:24:59'),
(961, 78, 1597, '2023-08-03 06:49:34', '2023-08-03 06:49:34'),
(962, 232, 1562, '2023-08-03 11:22:57', '2023-08-03 11:22:57'),
(963, 232, 1563, '2023-08-03 11:27:33', '2023-08-03 11:27:33'),
(964, 232, 1564, '2023-08-03 11:30:40', '2023-08-03 11:30:40'),
(965, 78, 1598, '2023-08-03 12:13:37', '2023-08-03 12:13:37'),
(966, 78, 1599, '2023-08-03 12:14:28', '2023-08-03 12:14:28'),
(967, 195, 1569, '2023-08-03 14:20:34', '2023-08-03 14:20:34'),
(968, 195, 1570, '2023-08-03 14:20:34', '2023-08-03 14:20:34'),
(969, 195, 1571, '2023-08-03 14:20:35', '2023-08-03 14:20:35'),
(970, 195, 1572, '2023-08-03 14:20:41', '2023-08-03 14:20:41'),
(971, 195, 1573, '2023-08-03 14:34:52', '2023-08-03 14:34:52'),
(972, 195, 1574, '2023-08-03 14:35:38', '2023-08-03 14:35:38'),
(973, 234, 1558, '2023-08-03 15:32:22', '2023-08-03 15:32:22'),
(974, 234, 1559, '2023-08-03 15:32:22', '2023-08-03 15:32:22'),
(975, 234, 1561, '2023-08-03 16:51:28', '2023-08-03 16:51:28'),
(976, 234, 1562, '2023-08-03 16:51:28', '2023-08-03 16:51:28'),
(977, 234, 1560, '2023-08-03 16:51:32', '2023-08-03 16:51:32'),
(978, 163, 1627, '2023-08-03 19:02:54', '2023-08-03 19:02:54'),
(979, 227, 1559, '2023-08-03 20:12:21', '2023-08-03 20:12:21'),
(981, 227, 1560, '2023-08-03 21:12:31', '2023-08-03 21:12:31'),
(982, 227, 1561, '2023-08-03 21:12:38', '2023-08-03 21:12:38'),
(983, 227, 1562, '2023-08-04 09:35:47', '2023-08-04 09:35:47'),
(984, 232, 1565, '2023-08-04 15:09:53', '2023-08-04 15:09:53'),
(985, 232, 1566, '2023-08-04 15:31:11', '2023-08-04 15:31:11'),
(986, 232, 1567, '2023-08-04 15:35:27', '2023-08-04 15:35:27'),
(987, 232, 1568, '2023-08-04 15:49:21', '2023-08-04 15:49:21'),
(988, 163, 1630, '2023-08-04 21:17:07', '2023-08-04 21:17:07'),
(989, 98, 1566, '2023-08-05 04:18:05', '2023-08-05 04:18:05'),
(990, 232, 1569, '2023-08-05 09:37:36', '2023-08-05 09:37:36'),
(991, 232, 1570, '2023-08-05 10:04:11', '2023-08-05 10:04:11'),
(992, 232, 1803, '2023-08-05 10:17:50', '2023-08-05 10:17:50'),
(993, 232, 1804, '2023-08-05 10:17:56', '2023-08-05 10:17:56'),
(995, 78, 1998, '2023-08-06 19:21:42', '2023-08-06 19:21:42'),
(996, 233, 1955, '2023-08-06 19:34:01', '2023-08-06 19:34:01'),
(997, 233, 1956, '2023-08-06 19:34:03', '2023-08-06 19:34:03'),
(998, 233, 1957, '2023-08-06 19:34:09', '2023-08-06 19:34:09'),
(999, 233, 1958, '2023-08-06 19:42:03', '2023-08-06 19:42:03'),
(1000, 94, 2017, '2023-08-06 20:16:46', '2023-08-06 20:16:46'),
(1001, 94, 2018, '2023-08-06 20:34:49', '2023-08-06 20:34:49'),
(1002, 227, 1955, '2023-08-06 21:12:29', '2023-08-06 21:12:29'),
(1003, 227, 1956, '2023-08-06 21:12:32', '2023-08-06 21:12:32'),
(1004, 227, 1957, '2023-08-06 21:12:33', '2023-08-06 21:12:33'),
(1005, 227, 1958, '2023-08-06 21:12:37', '2023-08-06 21:12:37'),
(1006, 227, 1959, '2023-08-06 21:12:38', '2023-08-06 21:12:38'),
(1007, 227, 1960, '2023-08-06 21:12:39', '2023-08-06 21:12:39'),
(1008, 227, 1961, '2023-08-06 21:12:44', '2023-08-06 21:12:44'),
(1009, 227, 1962, '2023-08-06 21:34:04', '2023-08-06 21:34:04'),
(1010, 227, 1963, '2023-08-06 21:46:07', '2023-08-06 21:46:07'),
(1011, 232, 1965, '2023-08-07 09:57:18', '2023-08-07 09:57:18'),
(1012, 232, 1966, '2023-08-07 09:57:19', '2023-08-07 09:57:19'),
(1013, 232, 1967, '2023-08-07 09:57:21', '2023-08-07 09:57:21'),
(1014, 232, 1968, '2023-08-07 09:57:26', '2023-08-07 09:57:26'),
(1015, 232, 1969, '2023-08-07 09:57:27', '2023-08-07 09:57:27'),
(1016, 232, 1955, '2023-08-07 09:57:36', '2023-08-07 09:57:36'),
(1017, 232, 1956, '2023-08-07 09:57:37', '2023-08-07 09:57:37'),
(1018, 232, 1957, '2023-08-07 09:57:37', '2023-08-07 09:57:37'),
(1019, 232, 1958, '2023-08-07 09:57:38', '2023-08-07 09:57:38'),
(1020, 232, 1959, '2023-08-07 09:57:43', '2023-08-07 09:57:43'),
(1021, 232, 1960, '2023-08-07 09:57:43', '2023-08-07 09:57:43'),
(1022, 232, 1961, '2023-08-07 09:57:48', '2023-08-07 09:57:48'),
(1023, 232, 1962, '2023-08-07 09:57:53', '2023-08-07 09:57:53'),
(1024, 232, 1963, '2023-08-07 09:57:54', '2023-08-07 09:57:54'),
(1025, 232, 1964, '2023-08-07 09:57:54', '2023-08-07 09:57:54'),
(1026, 232, 1970, '2023-08-07 10:21:07', '2023-08-07 10:21:07'),
(1027, 232, 1971, '2023-08-07 10:21:13', '2023-08-07 10:21:13'),
(1028, 232, 1972, '2023-08-07 10:43:32', '2023-08-07 10:43:32'),
(1029, 232, 1973, '2023-08-07 10:53:40', '2023-08-07 10:53:40'),
(1030, 156, 1955, '2023-08-07 16:07:37', '2023-08-07 16:07:37'),
(1031, 156, 1956, '2023-08-07 16:07:38', '2023-08-07 16:07:38'),
(1032, 156, 1957, '2023-08-07 16:07:42', '2023-08-07 16:07:42'),
(1033, 156, 1958, '2023-08-07 16:07:46', '2023-08-07 16:07:46'),
(1034, 156, 1959, '2023-08-07 16:07:49', '2023-08-07 16:07:49'),
(1035, 156, 1960, '2023-08-07 16:07:53', '2023-08-07 16:07:53'),
(1036, 156, 1961, '2023-08-07 16:07:58', '2023-08-07 16:07:58'),
(1037, 156, 1962, '2023-08-07 16:08:02', '2023-08-07 16:08:02'),
(1038, 156, 1963, '2023-08-07 16:08:07', '2023-08-07 16:08:07'),
(1039, 156, 1964, '2023-08-07 16:08:12', '2023-08-07 16:08:12'),
(1040, 156, 1965, '2023-08-07 16:08:18', '2023-08-07 16:08:18'),
(1041, 156, 1966, '2023-08-07 16:08:23', '2023-08-07 16:08:23'),
(1042, 78, 1999, '2023-08-07 16:35:33', '2023-08-07 16:35:33'),
(1043, 156, 1967, '2023-08-07 19:30:59', '2023-08-07 19:30:59'),
(1044, 78, 2000, '2023-08-07 20:03:39', '2023-08-07 20:03:39'),
(1045, 156, 1968, '2023-08-07 20:12:24', '2023-08-07 20:12:24'),
(1046, 196, 1955, '2023-08-07 21:26:32', '2023-08-07 21:26:32'),
(1047, 196, 1956, '2023-08-07 21:26:35', '2023-08-07 21:26:35'),
(1048, 196, 1957, '2023-08-07 21:26:38', '2023-08-07 21:26:38'),
(1049, 247, 1955, '2023-08-08 09:15:39', '2023-08-08 09:15:39'),
(1050, 247, 1956, '2023-08-08 10:26:41', '2023-08-08 10:26:41'),
(1051, 247, 1957, '2023-08-08 10:26:42', '2023-08-08 10:26:42'),
(1052, 232, 1974, '2023-08-08 13:49:08', '2023-08-08 13:49:08'),
(1053, 232, 1975, '2023-08-08 14:04:38', '2023-08-08 14:04:38'),
(1054, 232, 1976, '2023-08-08 14:04:43', '2023-08-08 14:04:43'),
(1055, 163, 2037, '2023-08-08 16:25:14', '2023-08-08 16:25:14'),
(1056, 232, 2215, '2023-08-09 13:59:37', '2023-08-09 13:59:37'),
(1057, 232, 2216, '2023-08-09 13:59:42', '2023-08-09 13:59:42'),
(1058, 232, 2205, '2023-08-09 13:59:52', '2023-08-09 13:59:52'),
(1059, 232, 2206, '2023-08-09 13:59:56', '2023-08-09 13:59:56'),
(1060, 232, 2207, '2023-08-09 14:00:01', '2023-08-09 14:00:01'),
(1061, 232, 2208, '2023-08-09 14:00:06', '2023-08-09 14:00:06'),
(1062, 232, 2209, '2023-08-09 14:00:07', '2023-08-09 14:00:07'),
(1063, 232, 2210, '2023-08-09 14:00:12', '2023-08-09 14:00:12'),
(1064, 232, 2211, '2023-08-09 14:00:21', '2023-08-09 14:00:21'),
(1065, 232, 2212, '2023-08-09 14:00:26', '2023-08-09 14:00:26'),
(1066, 232, 2213, '2023-08-09 14:00:31', '2023-08-09 14:00:31'),
(1067, 232, 2214, '2023-08-09 14:00:38', '2023-08-09 14:00:38'),
(1068, 232, 2217, '2023-08-09 14:19:33', '2023-08-09 14:19:33'),
(1069, 247, 2195, '2023-08-10 07:38:01', '2023-08-10 07:38:01'),
(1070, 247, 2196, '2023-08-10 07:38:05', '2023-08-10 07:38:05'),
(1071, 247, 2197, '2023-08-10 07:38:06', '2023-08-10 07:38:06'),
(1072, 247, 2198, '2023-08-10 07:38:09', '2023-08-10 07:38:09'),
(1073, 247, 2199, '2023-08-10 07:38:12', '2023-08-10 07:38:12'),
(1074, 247, 2200, '2023-08-10 07:38:16', '2023-08-10 07:38:16'),
(1075, 247, 2201, '2023-08-10 07:47:54', '2023-08-10 07:47:54'),
(1076, 227, 2204, '2023-08-10 08:18:07', '2023-08-10 08:18:07'),
(1077, 94, 2261, '2023-08-10 08:20:08', '2023-08-10 08:20:08'),
(1078, 247, 2202, '2023-08-10 08:20:10', '2023-08-10 08:20:10'),
(1079, 94, 2262, '2023-08-10 08:28:02', '2023-08-10 08:28:02'),
(1080, 78, 2240, '2023-08-10 08:58:37', '2023-08-10 08:58:37'),
(1081, 94, 2263, '2023-08-10 09:11:54', '2023-08-10 09:11:54'),
(1082, 227, 2205, '2023-08-10 14:53:54', '2023-08-10 14:53:54'),
(1083, 227, 2206, '2023-08-10 15:22:11', '2023-08-10 15:22:11'),
(1084, 232, 2218, '2023-08-10 15:32:42', '2023-08-10 15:32:42'),
(1085, 232, 2219, '2023-08-10 15:32:46', '2023-08-10 15:32:46'),
(1086, 232, 2220, '2023-08-10 15:32:54', '2023-08-10 15:32:54'),
(1087, 232, 2221, '2023-08-10 15:42:02', '2023-08-10 15:42:02'),
(1088, 232, 2222, '2023-08-10 15:59:19', '2023-08-10 15:59:19'),
(1089, 247, 2203, '2023-08-10 18:00:16', '2023-08-10 18:00:16'),
(1090, 253, 2195, '2023-08-10 18:55:04', '2023-08-10 18:55:04'),
(1093, 253, 2284, '2023-08-10 19:34:44', '2023-08-10 19:34:44'),
(1094, 253, 2279, '2023-08-10 19:35:07', '2023-08-10 19:35:07'),
(1095, 94, 2264, '2023-08-10 19:54:53', '2023-08-10 19:54:53'),
(1096, 253, 2198, '2023-08-10 20:07:21', '2023-08-10 20:07:21'),
(1097, 253, 2196, '2023-08-10 20:23:14', '2023-08-10 20:23:14'),
(1098, 94, 2267, '2023-08-11 03:35:40', '2023-08-11 03:35:40'),
(1099, 94, 2268, '2023-08-11 03:57:50', '2023-08-11 03:57:50'),
(1100, 55, 2232, '2023-08-11 09:04:57', '2023-08-11 09:04:57'),
(1101, 55, 2233, '2023-08-11 09:06:43', '2023-08-11 09:06:43'),
(1102, 55, 2234, '2023-08-11 09:07:28', '2023-08-11 09:07:28'),
(1103, 227, 2207, '2023-08-11 10:36:25', '2023-08-11 10:36:25'),
(1104, 227, 2208, '2023-08-11 10:54:33', '2023-08-11 10:54:33'),
(1105, 227, 2209, '2023-08-11 11:22:04', '2023-08-11 11:22:04'),
(1106, 232, 2225, '2023-08-11 17:41:41', '2023-08-11 17:41:41'),
(1107, 232, 2223, '2023-08-11 17:47:47', '2023-08-11 17:47:47'),
(1108, 232, 2224, '2023-08-11 17:51:43', '2023-08-11 17:51:43'),
(1110, 247, 2204, '2023-08-12 08:01:28', '2023-08-12 08:01:28'),
(1111, 247, 2205, '2023-08-12 08:01:32', '2023-08-12 08:01:32'),
(1112, 247, 2206, '2023-08-12 08:01:33', '2023-08-12 08:01:33'),
(1113, 247, 2207, '2023-08-12 08:36:41', '2023-08-12 08:36:41'),
(1114, 78, 2243, '2023-08-12 15:47:00', '2023-08-12 15:47:00'),
(1115, 247, 2208, '2023-08-12 18:01:31', '2023-08-12 18:01:31'),
(1116, 247, 2209, '2023-08-12 18:03:01', '2023-08-12 18:03:01'),
(1117, 232, 2228, '2023-08-13 15:17:04', '2023-08-13 15:17:04'),
(1118, 232, 2229, '2023-08-13 15:17:09', '2023-08-13 15:17:09'),
(1119, 232, 2230, '2023-08-13 15:27:12', '2023-08-13 15:27:12'),
(1120, 232, 2231, '2023-08-13 15:39:14', '2023-08-13 15:39:14'),
(1121, 232, 2226, '2023-08-13 15:43:46', '2023-08-13 15:43:46'),
(1122, 227, 2210, '2023-08-13 20:23:29', '2023-08-13 20:23:29'),
(1123, 227, 2211, '2023-08-13 21:07:56', '2023-08-13 21:07:56'),
(1124, 94, 2269, '2023-08-14 04:10:59', '2023-08-14 04:10:59'),
(1127, 262, 2558, '2023-08-14 22:11:10', '2023-08-14 22:11:10'),
(1128, 262, 2559, '2023-08-15 08:00:41', '2023-08-15 08:00:41'),
(1129, 262, 2560, '2023-08-15 08:41:31', '2023-08-15 08:41:31'),
(1130, 262, 2561, '2023-08-15 09:11:28', '2023-08-15 09:11:28'),
(1131, 247, 2558, '2023-08-15 18:47:36', '2023-08-15 18:47:36'),
(1132, 247, 2578, '2023-08-16 08:32:41', '2023-08-16 08:32:41'),
(1133, 195, 2558, '2023-08-16 10:58:47', '2023-08-16 10:58:47'),
(1134, 195, 2559, '2023-08-16 10:58:55', '2023-08-16 10:58:55'),
(1136, 195, 2560, '2023-08-16 10:59:02', '2023-08-16 10:59:02'),
(1138, 195, 2561, '2023-08-16 10:59:25', '2023-08-16 10:59:25'),
(1140, 195, 2562, '2023-08-16 10:59:29', '2023-08-16 10:59:29'),
(1141, 195, 2563, '2023-08-16 10:59:33', '2023-08-16 10:59:33'),
(1142, 195, 2564, '2023-08-16 10:59:36', '2023-08-16 10:59:36'),
(1143, 195, 2565, '2023-08-16 10:59:39', '2023-08-16 10:59:39'),
(1144, 195, 2566, '2023-08-16 10:59:43', '2023-08-16 10:59:43'),
(1147, 195, 2568, '2023-08-16 10:59:55', '2023-08-16 10:59:55'),
(1150, 195, 2569, '2023-08-16 11:00:03', '2023-08-16 11:00:03'),
(1151, 195, 2570, '2023-08-16 11:00:07', '2023-08-16 11:00:07'),
(1152, 195, 2571, '2023-08-16 11:00:11', '2023-08-16 11:00:11'),
(1155, 195, 2572, '2023-08-16 11:00:16', '2023-08-16 11:00:16'),
(1157, 195, 2573, '2023-08-16 11:00:21', '2023-08-16 11:00:21'),
(1158, 227, 2577, '2023-08-16 15:41:26', '2023-08-16 15:41:26'),
(1159, 195, 2567, '2023-08-16 19:13:14', '2023-08-16 19:13:14'),
(1160, 195, 2574, '2023-08-16 19:31:29', '2023-08-16 19:31:29'),
(1162, 232, 2614, '2023-08-17 12:37:54', '2023-08-17 12:37:54'),
(1163, 232, 2596, '2023-08-17 12:56:38', '2023-08-17 12:56:38'),
(1165, 232, 2597, '2023-08-17 13:12:17', '2023-08-17 13:12:17'),
(1167, 195, 2575, '2023-08-17 15:29:02', '2023-08-17 15:29:02'),
(1169, 195, 2576, '2023-08-17 15:29:10', '2023-08-17 15:29:10'),
(1171, 232, 2598, '2023-08-18 13:24:12', '2023-08-18 13:24:12'),
(1172, 232, 2599, '2023-08-18 13:33:50', '2023-08-18 13:33:50'),
(1173, 232, 2600, '2023-08-18 13:48:17', '2023-08-18 13:48:17'),
(1175, 195, 2577, '2023-08-19 08:00:48', '2023-08-19 08:00:48'),
(1176, 227, 2578, '2023-08-19 12:00:50', '2023-08-19 12:00:50'),
(1177, 195, 2578, '2023-08-19 12:04:12', '2023-08-19 12:04:12'),
(1178, 247, 2559, '2023-08-19 19:37:35', '2023-08-19 19:37:35'),
(1179, 247, 2560, '2023-08-19 19:37:36', '2023-08-19 19:37:36'),
(1180, 247, 2561, '2023-08-19 19:37:36', '2023-08-19 19:37:36'),
(1181, 247, 2567, '2023-08-19 19:37:49', '2023-08-19 19:37:49'),
(1182, 232, 2601, '2023-08-19 20:35:19', '2023-08-19 20:35:19'),
(1183, 232, 2602, '2023-08-19 20:41:03', '2023-08-19 20:41:03'),
(1184, 232, 2603, '2023-08-19 20:41:11', '2023-08-19 20:41:11'),
(1185, 232, 2604, '2023-08-21 13:07:37', '2023-08-21 13:07:37'),
(1186, 232, 2605, '2023-08-21 13:19:23', '2023-08-21 13:19:23'),
(1187, 232, 2606, '2023-08-21 13:19:28', '2023-08-21 13:19:28'),
(1188, 195, 2579, '2023-08-21 13:21:09', '2023-08-21 13:21:09'),
(1190, 94, 2630, '2023-08-21 17:15:32', '2023-08-21 17:15:32'),
(1191, 247, 2566, '2023-08-22 12:03:40', '2023-08-22 12:03:40'),
(1192, 247, 2562, '2023-08-22 12:03:43', '2023-08-22 12:03:43'),
(1193, 247, 2563, '2023-08-22 12:03:45', '2023-08-22 12:03:45'),
(1194, 247, 2564, '2023-08-22 12:03:52', '2023-08-22 12:03:52'),
(1195, 247, 2565, '2023-08-22 12:03:59', '2023-08-22 12:03:59'),
(1196, 247, 2568, '2023-08-22 12:04:08', '2023-08-22 12:04:08'),
(1197, 247, 2569, '2023-08-22 12:04:10', '2023-08-22 12:04:10'),
(1198, 247, 2570, '2023-08-22 12:04:12', '2023-08-22 12:04:12'),
(1199, 247, 2571, '2023-08-22 12:04:14', '2023-08-22 12:04:14'),
(1200, 247, 2572, '2023-08-22 12:04:17', '2023-08-22 12:04:17'),
(1201, 247, 2573, '2023-08-22 12:04:19', '2023-08-22 12:04:19'),
(1202, 247, 2574, '2023-08-22 12:04:21', '2023-08-22 12:04:21'),
(1203, 247, 2576, '2023-08-22 12:04:32', '2023-08-22 12:04:32'),
(1205, 247, 2577, '2023-08-22 12:04:44', '2023-08-22 12:04:44'),
(1206, 247, 2575, '2023-08-22 12:04:49', '2023-08-22 12:04:49'),
(1207, 247, 2579, '2023-08-22 12:04:58', '2023-08-22 12:04:58'),
(1208, 247, 2580, '2023-08-22 12:05:01', '2023-08-22 12:05:01'),
(1209, 247, 2581, '2023-08-22 12:05:03', '2023-08-22 12:05:03'),
(1210, 247, 2582, '2023-08-22 12:05:04', '2023-08-22 12:05:04'),
(1211, 247, 2583, '2023-08-22 12:05:08', '2023-08-22 12:05:08'),
(1212, 247, 2584, '2023-08-22 12:05:10', '2023-08-22 12:05:10'),
(1213, 247, 2586, '2023-08-22 12:05:14', '2023-08-22 12:05:14'),
(1214, 247, 2587, '2023-08-22 12:05:19', '2023-08-22 12:05:19'),
(1215, 247, 2585, '2023-08-22 12:05:24', '2023-08-22 12:05:24'),
(1216, 247, 2588, '2023-08-22 12:05:42', '2023-08-22 12:05:42'),
(1217, 247, 2589, '2023-08-22 12:05:45', '2023-08-22 12:05:45'),
(1218, 247, 2590, '2023-08-22 12:05:47', '2023-08-22 12:05:47'),
(1219, 247, 2591, '2023-08-22 12:05:49', '2023-08-22 12:05:49'),
(1220, 247, 2592, '2023-08-22 12:05:51', '2023-08-22 12:05:51'),
(1221, 247, 2593, '2023-08-22 12:05:54', '2023-08-22 12:05:54'),
(1222, 247, 2594, '2023-08-22 12:05:56', '2023-08-22 12:05:56'),
(1223, 247, 2595, '2023-08-22 12:06:55', '2023-08-22 12:06:55'),
(1224, 215, 2577, '2023-08-22 13:26:29', '2023-08-22 13:26:29'),
(1225, 163, 2662, '2023-08-22 15:24:36', '2023-08-22 15:24:36'),
(1226, 195, 2580, '2023-08-22 18:56:42', '2023-08-22 18:56:42'),
(1229, 247, 2614, '2023-08-23 08:38:11', '2023-08-23 08:38:11'),
(1230, 247, 2596, '2023-08-23 09:59:03', '2023-08-23 09:59:03'),
(1231, 232, 2607, '2023-08-23 13:17:10', '2023-08-23 13:17:10'),
(1232, 232, 2610, '2023-08-23 13:29:21', '2023-08-23 13:29:21'),
(1233, 232, 2611, '2023-08-23 13:29:24', '2023-08-23 13:29:24'),
(1234, 232, 2608, '2023-08-23 13:30:03', '2023-08-23 13:30:03'),
(1235, 232, 2609, '2023-08-23 13:46:10', '2023-08-23 13:46:10'),
(1236, 247, 2597, '2023-08-23 17:58:47', '2023-08-23 17:58:47'),
(1237, 163, 2667, '2023-08-23 18:05:44', '2023-08-23 18:05:44'),
(1238, 195, 2581, '2023-08-24 18:55:20', '2023-08-24 18:55:20'),
(1239, 195, 2582, '2023-08-24 18:55:25', '2023-08-24 18:55:25'),
(1240, 247, 2598, '2023-08-24 20:05:55', '2023-08-24 20:05:55'),
(1241, 247, 2599, '2023-08-24 20:35:40', '2023-08-24 20:35:40'),
(1242, 269, 2558, '2023-08-25 08:16:42', '2023-08-25 08:16:42'),
(1243, 269, 2559, '2023-08-25 08:40:18', '2023-08-25 08:40:18'),
(1244, 269, 2560, '2023-08-25 08:46:46', '2023-08-25 08:46:46'),
(1245, 227, 2580, '2023-08-25 11:52:32', '2023-08-25 11:52:32'),
(1246, 247, 2600, '2023-08-25 15:16:41', '2023-08-25 15:16:41'),
(1247, 232, 2612, '2023-08-25 15:40:16', '2023-08-25 15:40:16'),
(1248, 247, 2601, '2023-08-25 16:38:36', '2023-08-25 16:38:36'),
(1249, 247, 2602, '2023-08-25 16:54:45', '2023-08-25 16:54:45'),
(1250, 269, 2561, '2023-08-26 08:45:09', '2023-08-26 08:45:09'),
(1251, 269, 2562, '2023-08-26 08:55:13', '2023-08-26 08:55:13'),
(1252, 269, 2563, '2023-08-26 08:55:35', '2023-08-26 08:55:35'),
(1253, 247, 2603, '2023-08-26 19:20:30', '2023-08-26 19:20:30'),
(1254, 247, 2604, '2023-08-26 19:20:37', '2023-08-26 19:20:37'),
(1255, 247, 2605, '2023-08-26 19:32:38', '2023-08-26 19:32:38'),
(1256, 247, 2612, '2023-08-26 20:28:40', '2023-08-26 20:28:40'),
(1257, 247, 2606, '2023-08-26 20:35:26', '2023-08-26 20:35:26'),
(1258, 269, 2564, '2023-08-27 14:37:27', '2023-08-27 14:37:27'),
(1259, 247, 2870, '2023-08-27 18:23:03', '2023-08-27 18:23:03'),
(1260, 269, 2957, '2023-08-27 18:48:39', '2023-08-27 18:48:39'),
(1261, 269, 2958, '2023-08-27 18:48:39', '2023-08-27 18:48:39'),
(1262, 269, 2959, '2023-08-27 18:48:40', '2023-08-27 18:48:40'),
(1263, 269, 2960, '2023-08-27 18:48:40', '2023-08-27 18:48:40'),
(1264, 269, 2961, '2023-08-27 18:48:41', '2023-08-27 18:48:41'),
(1265, 269, 2962, '2023-08-27 18:48:41', '2023-08-27 18:48:41'),
(1266, 269, 2963, '2023-08-27 18:48:47', '2023-08-27 18:48:47'),
(1267, 269, 2964, '2023-08-27 18:48:51', '2023-08-27 18:48:51'),
(1268, 247, 2871, '2023-08-27 19:03:25', '2023-08-27 19:03:25'),
(1269, 247, 3006, '2023-08-27 19:09:59', '2023-08-27 19:09:59'),
(1270, 247, 3007, '2023-08-27 19:10:02', '2023-08-27 19:10:02'),
(1271, 247, 3008, '2023-08-27 19:10:06', '2023-08-27 19:10:06'),
(1272, 269, 2965, '2023-08-27 19:17:29', '2023-08-27 19:17:29'),
(1273, 247, 3009, '2023-08-27 19:34:30', '2023-08-27 19:34:30'),
(1274, 225, 2957, '2023-08-27 23:09:54', '2023-08-27 23:09:54'),
(1275, 262, 2959, '2023-08-28 11:45:59', '2023-08-28 11:45:59'),
(1276, 262, 2960, '2023-08-28 11:46:00', '2023-08-28 11:46:00'),
(1277, 262, 2961, '2023-08-28 11:46:00', '2023-08-28 11:46:00'),
(1278, 262, 2962, '2023-08-28 11:46:01', '2023-08-28 11:46:01'),
(1279, 262, 2963, '2023-08-28 11:46:02', '2023-08-28 11:46:02'),
(1280, 262, 2957, '2023-08-28 11:46:06', '2023-08-28 11:46:06'),
(1281, 262, 2958, '2023-08-28 11:46:07', '2023-08-28 11:46:07'),
(1282, 275, 417, '2023-08-28 13:55:10', '2023-08-28 13:55:10'),
(1283, 269, 2966, '2023-08-28 14:48:57', '2023-08-28 14:48:57'),
(1284, 269, 2967, '2023-08-28 15:32:39', '2023-08-28 15:32:39'),
(1285, 269, 2968, '2023-08-28 15:32:43', '2023-08-28 15:32:43'),
(1286, 232, 2996, '2023-08-28 15:58:19', '2023-08-28 15:58:19'),
(1287, 232, 2998, '2023-08-28 16:07:16', '2023-08-28 16:07:16'),
(1288, 269, 2969, '2023-08-29 15:32:12', '2023-08-29 15:32:12'),
(1289, 269, 2970, '2023-08-29 15:32:15', '2023-08-29 15:32:15'),
(1290, 264, 2957, '2023-08-29 19:52:44', '2023-08-29 19:52:44'),
(1291, 264, 2958, '2023-08-29 19:52:45', '2023-08-29 19:52:45'),
(1293, 278, 2957, '2023-08-30 13:33:16', '2023-08-30 13:33:16'),
(1294, 278, 2958, '2023-08-30 13:33:19', '2023-08-30 13:33:19'),
(1295, 278, 2959, '2023-08-30 13:33:21', '2023-08-30 13:33:21'),
(1296, 195, 2957, '2023-08-30 16:30:11', '2023-08-30 16:30:11'),
(1297, 195, 2958, '2023-08-30 16:30:15', '2023-08-30 16:30:15'),
(1298, 195, 2959, '2023-08-30 16:30:17', '2023-08-30 16:30:17'),
(1299, 195, 2960, '2023-08-30 16:30:19', '2023-08-30 16:30:19'),
(1300, 195, 2961, '2023-08-30 16:30:22', '2023-08-30 16:30:22'),
(1301, 195, 2962, '2023-08-30 16:30:24', '2023-08-30 16:30:24'),
(1302, 195, 2963, '2023-08-30 16:30:28', '2023-08-30 16:30:28'),
(1303, 195, 2964, '2023-08-30 16:30:31', '2023-08-30 16:30:31'),
(1304, 195, 2965, '2023-08-30 16:30:34', '2023-08-30 16:30:34'),
(1305, 195, 2966, '2023-08-30 16:30:38', '2023-08-30 16:30:38'),
(1306, 195, 2967, '2023-08-30 16:30:44', '2023-08-30 16:30:44'),
(1307, 195, 2968, '2023-08-30 16:30:46', '2023-08-30 16:30:46'),
(1308, 195, 2969, '2023-08-30 16:30:49', '2023-08-30 16:30:49'),
(1309, 195, 2970, '2023-08-30 16:30:53', '2023-08-30 16:30:53'),
(1310, 195, 2971, '2023-08-30 16:30:55', '2023-08-30 16:30:55'),
(1311, 195, 2972, '2023-08-30 16:30:57', '2023-08-30 16:30:57'),
(1312, 195, 2973, '2023-08-30 16:31:01', '2023-08-30 16:31:01'),
(1313, 195, 2974, '2023-08-30 16:31:05', '2023-08-30 16:31:05'),
(1314, 195, 2975, '2023-08-30 16:31:08', '2023-08-30 16:31:08'),
(1315, 195, 2976, '2023-08-30 16:31:11', '2023-08-30 16:31:11'),
(1316, 195, 2977, '2023-08-30 16:31:17', '2023-08-30 16:31:17'),
(1317, 195, 2978, '2023-08-30 16:31:19', '2023-08-30 16:31:19'),
(1318, 195, 2979, '2023-08-30 16:31:21', '2023-08-30 16:31:21'),
(1319, 195, 2980, '2023-08-30 16:31:23', '2023-08-30 16:31:23'),
(1320, 195, 2981, '2023-08-30 16:31:26', '2023-08-30 16:31:26'),
(1321, 195, 2982, '2023-08-30 17:02:03', '2023-08-30 17:02:03'),
(1322, 195, 2983, '2023-08-30 17:02:04', '2023-08-30 17:02:04'),
(1323, 195, 2984, '2023-08-30 17:02:08', '2023-08-30 17:02:08'),
(1324, 269, 2971, '2023-08-30 19:53:53', '2023-08-30 19:53:53'),
(1325, 269, 2972, '2023-08-30 20:22:52', '2023-08-30 20:22:52'),
(1326, 269, 2973, '2023-08-30 20:22:54', '2023-08-30 20:22:54'),
(1327, 269, 2974, '2023-08-30 20:22:56', '2023-08-30 20:22:56'),
(1328, 278, 2960, '2023-08-31 13:36:46', '2023-08-31 13:36:46'),
(1329, 278, 2961, '2023-08-31 13:36:50', '2023-08-31 13:36:50'),
(1330, 278, 2962, '2023-08-31 13:36:55', '2023-08-31 13:36:55'),
(1331, 94, 3027, '2023-08-31 21:46:03', '2023-08-31 21:46:03'),
(1332, 94, 3031, '2023-08-31 21:46:22', '2023-08-31 21:46:22'),
(1333, 94, 3032, '2023-08-31 21:50:43', '2023-08-31 21:50:43'),
(1334, 94, 3039, '2023-09-01 15:25:23', '2023-09-01 15:25:23'),
(1335, 94, 3040, '2023-09-01 15:33:49', '2023-09-01 15:33:49'),
(1336, 94, 3041, '2023-09-01 15:34:23', '2023-09-01 15:34:23'),
(1337, 94, 3042, '2023-09-01 15:46:20', '2023-09-01 15:46:20'),
(1338, 94, 3043, '2023-09-01 16:25:46', '2023-09-01 16:25:46'),
(1339, 55, 3000, '2023-09-01 16:27:46', '2023-09-01 16:27:46'),
(1340, 94, 3044, '2023-09-01 16:30:02', '2023-09-01 16:30:02'),
(1341, 94, 3045, '2023-09-01 20:13:02', '2023-09-01 20:13:02'),
(1342, 94, 3047, '2023-09-01 20:28:44', '2023-09-01 20:28:44'),
(1343, 94, 3046, '2023-09-01 21:01:44', '2023-09-01 21:01:44'),
(1345, 286, 2957, '2023-09-02 09:26:03', '2023-09-02 09:26:03'),
(1346, 278, 2963, '2023-09-02 11:38:07', '2023-09-02 11:38:07'),
(1347, 278, 2964, '2023-09-02 11:38:11', '2023-09-02 11:38:11'),
(1348, 278, 2965, '2023-09-02 11:38:14', '2023-09-02 11:38:14'),
(1350, 287, 2957, '2023-09-02 21:11:40', '2023-09-02 21:11:40'),
(1351, 286, 2958, '2023-09-02 21:13:36', '2023-09-02 21:13:36'),
(1352, 286, 2959, '2023-09-02 21:13:40', '2023-09-02 21:13:40'),
(1353, 287, 2958, '2023-09-02 21:20:37', '2023-09-02 21:20:37'),
(1354, 287, 2959, '2023-09-02 21:20:44', '2023-09-02 21:20:44'),
(1355, 94, 3050, '2023-09-03 10:55:15', '2023-09-03 10:55:15'),
(1356, 94, 3056, '2023-09-03 19:22:13', '2023-09-03 19:22:13'),
(1357, 94, 3055, '2023-09-03 19:37:13', '2023-09-03 19:37:13'),
(1358, 94, 3057, '2023-09-03 19:37:47', '2023-09-03 19:37:47'),
(1359, 94, 3058, '2023-09-03 19:47:54', '2023-09-03 19:47:54'),
(1360, 287, 2960, '2023-09-03 19:53:19', '2023-09-03 19:53:19'),
(1361, 94, 3059, '2023-09-03 20:42:30', '2023-09-03 20:42:30'),
(1362, 94, 3060, '2023-09-03 20:58:30', '2023-09-03 20:58:30'),
(1363, 269, 2975, '2023-09-03 22:11:08', '2023-09-03 22:11:08'),
(1364, 269, 2976, '2023-09-03 22:15:03', '2023-09-03 22:15:03'),
(1365, 269, 2977, '2023-09-03 22:15:09', '2023-09-03 22:15:09'),
(1366, 269, 2978, '2023-09-03 23:00:54', '2023-09-03 23:00:54'),
(1367, 269, 2979, '2023-09-03 23:00:57', '2023-09-03 23:00:57'),
(1368, 269, 2980, '2023-09-03 23:10:09', '2023-09-03 23:10:09'),
(1369, 278, 2966, '2023-09-04 10:45:34', '2023-09-04 10:45:34'),
(1370, 278, 2967, '2023-09-04 10:45:40', '2023-09-04 10:45:40'),
(1371, 278, 2968, '2023-09-04 10:45:42', '2023-09-04 10:45:42'),
(1372, 278, 2969, '2023-09-04 10:45:44', '2023-09-04 10:45:44'),
(1373, 278, 2970, '2023-09-04 10:45:45', '2023-09-04 10:45:45'),
(1374, 278, 2971, '2023-09-04 10:45:48', '2023-09-04 10:45:48'),
(1375, 278, 2972, '2023-09-04 11:22:12', '2023-09-04 11:22:12'),
(1376, 278, 2973, '2023-09-04 11:25:52', '2023-09-04 11:25:52'),
(1377, 278, 2974, '2023-09-04 11:59:41', '2023-09-04 11:59:41'),
(1378, 289, 2957, '2023-09-04 20:33:28', '2023-09-04 20:33:28'),
(1379, 289, 2958, '2023-09-04 20:41:04', '2023-09-04 20:41:04'),
(1380, 289, 2959, '2023-09-04 20:47:52', '2023-09-04 20:47:52'),
(1381, 287, 2961, '2023-09-04 21:55:50', '2023-09-04 21:55:50'),
(1382, 287, 2962, '2023-09-04 22:00:25', '2023-09-04 22:00:25'),
(1383, 25, 90, '2023-09-05 08:06:47', '2023-09-05 08:06:47'),
(1384, 269, 2981, '2023-09-05 14:52:24', '2023-09-05 14:52:24'),
(1385, 269, 2982, '2023-09-05 15:16:08', '2023-09-05 15:16:08'),
(1386, 269, 2983, '2023-09-05 15:16:10', '2023-09-05 15:16:10'),
(1387, 269, 2984, '2023-09-05 15:16:13', '2023-09-05 15:16:13');

-- --------------------------------------------------------

--
-- Table structure for table `writers`
--

CREATE TABLE `writers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billings`
--
ALTER TABLE `billings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carriers`
--
ALTER TABLE `carriers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_courses`
--
ALTER TABLE `category_courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `color_product`
--
ALTER TABLE `color_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_user_lesson` (`lesson_id`,`user_id`) USING BTREE;

--
-- Indexes for table `comment_detail`
--
ALTER TABLE `comment_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_lessons`
--
ALTER TABLE `course_lessons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `file_resources`
--
ALTER TABLE `file_resources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `image_product`
--
ALTER TABLE `image_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `labels`
--
ALTER TABLE `labels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_categories`
--
ALTER TABLE `main_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_category_product`
--
ALTER TABLE `main_category_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_publication`
--
ALTER TABLE `product_publication`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_size`
--
ALTER TABLE `product_size`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_sub_category`
--
ALTER TABLE `product_sub_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_unit`
--
ALTER TABLE `product_unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_vendor`
--
ALTER TABLE `product_vendor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_writer`
--
ALTER TABLE `product_writer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `publications`
--
ALTER TABLE `publications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_comments`
--
ALTER TABLE `user_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_courses`
--
ALTER TABLE `user_courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_users`
--
ALTER TABLE `vendor_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `writers`
--
ALTER TABLE `writers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `billings`
--
ALTER TABLE `billings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carriers`
--
ALTER TABLE `carriers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category_courses`
--
ALTER TABLE `category_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category_product`
--
ALTER TABLE `category_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `color_product`
--
ALTER TABLE `color_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `comment_detail`
--
ALTER TABLE `comment_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `course_lessons`
--
ALTER TABLE `course_lessons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3106;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file_resources`
--
ALTER TABLE `file_resources`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=225;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `image_product`
--
ALTER TABLE `image_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `labels`
--
ALTER TABLE `labels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `main_categories`
--
ALTER TABLE `main_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `main_category_product`
--
ALTER TABLE `main_category_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_publication`
--
ALTER TABLE `product_publication`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_size`
--
ALTER TABLE `product_size`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_sub_category`
--
ALTER TABLE `product_sub_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_unit`
--
ALTER TABLE `product_unit`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_vendor`
--
ALTER TABLE `product_vendor`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_writer`
--
ALTER TABLE `product_writer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `publications`
--
ALTER TABLE `publications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=294;

--
-- AUTO_INCREMENT for table `user_comments`
--
ALTER TABLE `user_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=591;

--
-- AUTO_INCREMENT for table `user_courses`
--
ALTER TABLE `user_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT for table `vendor_users`
--
ALTER TABLE `vendor_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1388;

--
-- AUTO_INCREMENT for table `writers`
--
ALTER TABLE `writers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
