-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 24, 2023 at 01:11 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ci4`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_access_tokens`
--

CREATE TABLE `auth_access_tokens` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used_at` datetime DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_password_resets`
--

CREATE TABLE `auth_password_resets` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(15, '2020-12-28-223112', 'App\\Database\\Migrations\\CreateAuthTables', 'default', 'App', 1687138526, 1),
(16, '2023-04-04-191551', 'App\\Database\\Migrations\\Wisata', 'default', 'App', 1687138526, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tiket`
--

CREATE TABLE `tiket` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `wisata_id` int(11) UNSIGNED NOT NULL,
  `transaksi_id` int(11) UNSIGNED NOT NULL,
  `kode` varchar(255) NOT NULL,
  `claimed_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tiket`
--

INSERT INTO `tiket` (`id`, `user_id`, `wisata_id`, `transaksi_id`, `kode`, `claimed_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 1, 2, '2106', '2023-07-22 17:14:50', '2023-07-04 06:28:33', '2023-07-22 17:14:50', NULL),
(2, 3, 1, 3, '2136', NULL, '2023-07-04 06:32:58', '2023-07-04 06:32:58', NULL),
(3, 3, 1, 3, '2137', NULL, '2023-07-04 06:32:58', '2023-07-04 06:32:58', NULL),
(4, 3, 1, 3, '2138', NULL, '2023-07-04 06:32:58', '2023-07-04 06:32:58', NULL),
(5, 3, 1, 4, '2148', NULL, '2023-07-04 07:49:51', '2023-07-04 07:49:51', NULL),
(6, 3, 1, 4, '2149', NULL, '2023-07-04 07:49:51', '2023-07-04 07:49:51', NULL),
(7, 3, 1, 5, '2135', NULL, '2023-07-10 05:59:23', '2023-07-10 05:59:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `wisata_id` int(11) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'new',
  `midtrans_result` longtext DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `slug`, `user_id`, `wisata_id`, `amount`, `status`, `midtrans_result`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2112', 3, 1, 20000, 'pending', NULL, '2023-06-19 01:39:21', '2023-06-19 01:39:21', NULL),
(2, '2114', 3, 1, 5000, 'pending', '{\"status_code\":\"200\",\"transaction_id\":\"d917dd24-4cec-4287-8d4b-475e69cc9d7b\",\"gross_amount\":\"5000.00\",\"currency\":\"IDR\",\"order_id\":\"2114\",\"payment_type\":\"bank_transfer\",\"signature_key\":\"ef636ead55a25745eee40372c8939806fac88dedfadccf0bb34f5cb12f6d286a28205bf0a2b1427c145729969b5597e98597b910bdea6f0c42f5d6c94377765f\",\"transaction_status\":\"settlement\",\"fraud_status\":\"accept\",\"status_message\":\"Success, transaction is found\",\"merchant_id\":\"G664737186\",\"va_numbers\":[{\"bank\":\"bca\",\"va_number\":\"37186446316\"}],\"payment_amounts\":[],\"transaction_time\":\"2023-07-04 13:27:47\",\"settlement_time\":\"2023-07-04 13:28:22\",\"expiry_time\":\"2023-07-05 13:27:47\"}', '2023-07-04 06:24:47', '2023-07-04 06:28:33', NULL),
(3, '2122', 3, 1, 15000, 'pending', '{\"status_code\":\"200\",\"transaction_id\":\"8853cc2a-5748-4cb3-b0c8-0a29fe8d6d55\",\"gross_amount\":\"15000.00\",\"currency\":\"IDR\",\"order_id\":\"2122\",\"payment_type\":\"bank_transfer\",\"signature_key\":\"0db9f76005db41ffb96a6aa64b99bc5a4d18523c4d0030f590988c53acc6dfbb5b8f3239683c8b63478e474a8998932ace9e52169815433f8f3c49e46297e37e\",\"transaction_status\":\"settlement\",\"fraud_status\":\"accept\",\"status_message\":\"Success, transaction is found\",\"merchant_id\":\"G664737186\",\"va_numbers\":[{\"bank\":\"bca\",\"va_number\":\"37186889969\"}],\"payment_amounts\":[],\"transaction_time\":\"2023-07-04 13:32:17\",\"settlement_time\":\"2023-07-04 13:32:38\",\"expiry_time\":\"2023-07-05 13:32:17\"}', '2023-07-04 06:29:50', '2023-07-04 06:32:58', NULL),
(4, '2124', 3, 1, 10000, 'pending', '{\"status_code\":\"200\",\"transaction_id\":\"d6f10d26-a5f3-4eab-a307-aa1cbdd8b9cb\",\"gross_amount\":\"10000.00\",\"currency\":\"IDR\",\"order_id\":\"2124\",\"payment_type\":\"bank_transfer\",\"signature_key\":\"b6bfde7478e0f21e1ac66974cb0d459a07de0fad2a2cf110f02a5d3a11c87d2e16566fb7dbd8be14716245a672ba955b7281d5312107611cca5a9acef4208d49\",\"transaction_status\":\"settlement\",\"fraud_status\":\"accept\",\"status_message\":\"Success, transaction is found\",\"merchant_id\":\"G664737186\",\"va_numbers\":[{\"bank\":\"bca\",\"va_number\":\"37186285520\"}],\"payment_amounts\":[],\"transaction_time\":\"2023-07-04 14:49:11\",\"settlement_time\":\"2023-07-04 14:49:35\",\"expiry_time\":\"2023-07-05 14:49:10\"}', '2023-07-04 07:47:33', '2023-07-04 07:49:51', NULL),
(5, '2110', 3, 1, 5000, 'pending', '{\"status_code\":\"200\",\"transaction_id\":\"35b2b746-a10c-4e35-8025-0692d519dad1\",\"gross_amount\":\"5000.00\",\"currency\":\"IDR\",\"order_id\":\"2110\",\"payment_type\":\"bank_transfer\",\"signature_key\":\"f0f76e3f588c959be146f3cbbef6120b9f19fd1418dd21ff73c5a97882e49266cd1acbe63f41df204d5ca1067d9b8a995797686991261e01fd770905988b56bf\",\"transaction_status\":\"settlement\",\"fraud_status\":\"accept\",\"status_message\":\"Success, transaction is found\",\"merchant_id\":\"G664737186\",\"va_numbers\":[{\"bank\":\"bca\",\"va_number\":\"37186075434\"}],\"payment_amounts\":[],\"transaction_time\":\"2023-07-10 12:58:13\",\"settlement_time\":\"2023-07-10 12:58:51\",\"expiry_time\":\"2023-07-11 12:58:13\"}', '2023-07-10 05:57:05', '2023-07-10 05:59:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `role` varchar(10) NOT NULL DEFAULT 'user',
  `password` varchar(255) NOT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `role`, `password`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'super@admin.com', 'admin dinas pariwisata', 'super', '$2y$10$QKKJTEbpJeEn6vPKG2M1K.NSJbHrTB9XfF.KJGrqB7cKUDBVJAz8O', NULL, '71c3b013b4a503f02418461ddce69b15301b11b6', '2023-06-19 01:36:43', '2023-07-22 16:42:16', NULL),
(2, 'dwiayuni@gmail.com', 'ayuni', 'admin', '$2y$10$uQxB6pbThhD3YxX7r1BzyOkrbzDy3usA/mN5aQARA6cQrf1eOVKhC', NULL, '420e6be01c5bc10e8654f08dc1bfd0982b17a54e', '2023-06-19 01:37:39', '2023-07-22 18:11:10', NULL),
(3, 'ayuniroh@gmail.com', 'Dwi Ayuni', 'user', '$2y$10$VWIJKwKguQIzNaQ7J5.E8.yR91PSmDu2kboy7Ls3yhWa/VLJX6Iwy', NULL, 'fdb1ea22e106d3ed353884242311407a355dedb0', '2023-06-19 01:39:01', '2023-07-10 06:34:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wisata`
--

CREATE TABLE `wisata` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `harga` int(11) NOT NULL,
  `photo_path` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wisata`
--

INSERT INTO `wisata` (`id`, `nama`, `harga`, `photo_path`, `alamat`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'nongko ijo', 5000, 'http://localhost:8080/uploads/1687138715_13e231d91c126e7f889f.jpg', 'kare', '2023-06-19 01:38:35', '2023-06-19 01:38:35', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_access_tokens`
--
ALTER TABLE `auth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`);

--
-- Indexes for table `auth_password_resets`
--
ALTER TABLE `auth_password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tiket`
--
ALTER TABLE `tiket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `wisata`
--
ALTER TABLE `wisata`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_access_tokens`
--
ALTER TABLE `auth_access_tokens`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_password_resets`
--
ALTER TABLE `auth_password_resets`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tiket`
--
ALTER TABLE `tiket`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wisata`
--
ALTER TABLE `wisata`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
