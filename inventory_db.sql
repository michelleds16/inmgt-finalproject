-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2026 at 03:57 PM
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
-- Database: `inventory_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `barcode` varchar(100) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stock_quantity` int(11) DEFAULT 0,
  `supplier_id` int(11) DEFAULT NULL,
  `low_stock_threshold` int(11) DEFAULT 10
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `barcode`, `category`, `price`, `stock_quantity`, `supplier_id`, `low_stock_threshold`) VALUES
(1, 'Wireless Mouse', '2234567890124', 'Electronics', 599.00, 45, NULL, 10),
(2, 'Gaming Keyboard', '1234567890123', 'Electronics', 2499.00, 15, NULL, 10),
(3, '24\" IPS Monitor', '6234567890128', 'Electronics', 8500.00, 8, NULL, 10),
(4, 'USB-C Hub', '8834567890129', 'Electronics', 1200.00, 30, NULL, 10),
(5, 'Bluetooth Speaker', '9934567890130', 'Electronics', 1800.00, 25, NULL, 10),
(6, 'Webcam 1080p', '7734567890131', 'Electronics', 1500.00, 12, NULL, 10),
(7, 'Potato Chips', '5550001112223', 'Groceries', 45.00, 100, NULL, 10),
(8, 'Energy Drink', '5550001112224', 'Groceries', 85.00, 150, NULL, 10),
(9, 'Chocolate Bar', '5550001112225', 'Groceries', 35.00, 200, NULL, 10),
(10, 'Instant Coffee', '5550001112226', 'Groceries', 250.00, 60, NULL, 10),
(11, 'A4 Paper Ream', '4440001112227', 'Office', 220.00, 50, NULL, 10),
(12, 'Ballpoint Pen (Box)', '4440001112228', 'Office', 150.00, 78, NULL, 10),
(13, 'Stapler', '4440001112229', 'Office', 180.00, 40, NULL, 10),
(14, 'Cotton T-Shirt', '3330001112230', 'Clothing', 350.00, 75, NULL, 10),
(15, 'Denim Jeans', '3330001112231', 'Clothing', 1200.00, 30, NULL, 10),
(16, 'Running Socks', '3330001112232', 'Clothing', 150.00, 60, NULL, 10);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(100) NOT NULL,
  `contact_person` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `supplier_name`, `contact_person`, `email`, `phone`, `address`, `created_at`) VALUES
(1, 'TechDistributors Inc.', 'John Doe', 'john@techdist.com', '0917-123-4567', 'Manila, Philippines', '2026-01-09 13:51:30'),
(2, 'Office Depot Supplies', 'Jane Smith', 'jane@officesupplies.com', '0918-987-6543', 'Quezon City, Philippines', '2026-01-09 13:51:30');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `transaction_type` varchar(50) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL,
  `receipt_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transaction_id`, `product_id`, `transaction_type`, `quantity`, `transaction_date`, `user_id`, `receipt_id`) VALUES
(1, 11, 'Purchase', 5, '2026-01-05 13:38:09', NULL, NULL),
(2, 12, 'Sale', 2, '2026-01-08 13:38:09', NULL, NULL),
(3, 1, 'Sale', 1, '2025-12-23 13:38:09', NULL, NULL),
(4, 6, 'Sale', 2, '2026-01-02 13:38:09', NULL, NULL),
(5, 8, 'Sale', 3, '2025-12-24 13:38:09', NULL, NULL),
(6, 14, 'Sale', 4, '2025-12-25 13:38:09', NULL, NULL),
(7, 7, 'Sale', 5, '2025-12-18 13:38:09', NULL, NULL),
(8, 3, 'Purchase', 5, '2025-12-27 13:38:09', NULL, NULL),
(9, 4, 'Sale', 1, '2025-12-20 13:38:09', NULL, NULL),
(10, 13, 'Sale', 2, '2026-01-08 13:38:09', NULL, NULL),
(11, 2, 'Sale', 3, '2026-01-02 13:38:09', NULL, NULL),
(12, 4, 'Sale', 3, '2025-12-23 13:38:09', NULL, NULL),
(13, 12, 'Sale', 3, '2025-12-12 13:38:09', NULL, NULL),
(14, 13, 'Sale', 3, '2025-12-28 13:38:09', NULL, NULL),
(15, 13, 'Sale', 4, '2026-01-04 13:38:09', NULL, NULL),
(16, 12, 'Sale', 3, '2025-12-18 13:38:09', NULL, NULL),
(17, 6, 'Sale', 1, '2026-01-08 13:38:09', NULL, NULL),
(18, 12, 'Sale', 5, '2025-12-31 13:38:09', NULL, NULL),
(19, 11, 'Sale', 3, '2026-01-05 13:38:09', NULL, NULL),
(20, 1, 'Purchase', 4, '2026-01-04 13:38:09', NULL, NULL),
(21, 5, 'Sale', 3, '2026-01-05 13:38:09', NULL, NULL),
(22, 11, 'Sale', 5, '2025-12-18 13:38:09', NULL, NULL),
(23, 3, 'Sale', 3, '2026-01-07 13:38:09', NULL, NULL),
(24, 2, 'Purchase', 4, '2026-01-06 13:38:09', NULL, NULL),
(25, 8, 'Sale', 5, '2025-12-13 13:38:09', NULL, NULL),
(26, 10, 'Sale', 1, '2025-12-13 13:38:09', NULL, NULL),
(27, 11, 'Sale', 2, '2026-01-05 13:38:09', NULL, NULL),
(28, 15, 'Sale', 5, '2025-12-23 13:38:09', NULL, NULL),
(29, 5, 'Purchase', 1, '2025-12-25 13:38:09', NULL, NULL),
(30, 7, 'Sale', 4, '2025-12-14 13:38:09', NULL, NULL),
(31, 14, 'Sale', 5, '2025-12-25 13:38:09', NULL, NULL),
(32, 13, 'Sale', 3, '2025-12-14 13:38:09', NULL, NULL),
(33, 16, 'Sale', 3, '2025-12-18 13:38:09', NULL, NULL),
(34, 10, 'Sale', 2, '2026-01-03 13:38:09', NULL, NULL),
(35, 1, 'Sale', 3, '2025-12-24 13:38:09', NULL, NULL),
(36, 9, 'Purchase', 5, '2025-12-16 13:38:09', NULL, NULL),
(37, 9, 'Sale', 3, '2025-12-28 13:38:09', NULL, NULL),
(38, 11, 'Sale', 2, '2026-01-03 13:38:09', NULL, NULL),
(39, 6, 'Sale', 3, '2025-12-29 13:38:09', NULL, NULL),
(40, 10, 'Sale', 5, '2025-12-14 13:38:09', NULL, NULL),
(41, 14, 'Sale', 2, '2025-12-15 13:38:09', NULL, NULL),
(42, 15, 'Sale', 5, '2025-12-22 13:38:09', NULL, NULL),
(43, 11, 'Purchase', 1, '2026-01-01 13:38:09', NULL, NULL),
(44, 6, 'Sale', 1, '2025-12-14 13:38:09', NULL, NULL),
(45, 7, 'Sale', 5, '2025-12-21 13:38:09', NULL, NULL),
(46, 14, 'Sale', 1, '2025-12-27 13:38:09', NULL, NULL),
(47, 4, 'Purchase', 5, '2026-01-03 13:38:09', NULL, NULL),
(48, 6, 'Sale', 4, '2025-12-20 13:38:09', NULL, NULL),
(49, 4, 'Sale', 1, '2025-12-12 13:38:09', NULL, NULL),
(50, 11, 'Purchase', 1, '2025-12-16 13:38:09', NULL, NULL),
(51, 13, 'Sale', 1, '2025-12-12 13:38:09', NULL, NULL),
(52, 15, 'Purchase', 3, '2026-01-03 13:38:09', NULL, NULL),
(53, 9, 'Sale', 2, '2025-12-20 13:38:09', NULL, NULL),
(54, 7, 'Sale', 1, '2025-12-24 13:38:09', NULL, NULL),
(55, 7, 'Sale', 4, '2026-01-09 13:38:09', NULL, NULL),
(56, 15, 'Sale', 3, '2025-12-18 13:38:09', NULL, NULL),
(57, 2, 'Sale', 1, '2025-12-16 13:38:09', NULL, NULL),
(58, 10, 'Sale', 2, '2025-12-16 13:38:09', NULL, NULL),
(59, 2, 'Sale', 1, '2025-12-16 13:38:09', NULL, NULL),
(60, 14, 'Purchase', 5, '2025-12-20 13:38:09', NULL, NULL),
(61, 10, 'Sale', 3, '2026-01-03 13:38:09', NULL, NULL),
(62, 16, 'Sale', 1, '2025-12-28 13:38:09', NULL, NULL),
(63, 9, 'Sale', 1, '2025-12-25 13:38:09', NULL, NULL),
(64, 2, 'Sale', 4, '2025-12-17 13:38:09', NULL, NULL),
(65, 10, 'Sale', 1, '2026-01-03 13:38:09', NULL, NULL),
(66, 14, 'Sale', 1, '2025-12-16 13:38:09', NULL, NULL),
(67, 7, 'Sale', 3, '2026-01-09 13:38:09', NULL, NULL),
(68, 1, 'Sale', 1, '2025-12-11 13:38:09', NULL, NULL),
(69, 11, 'Sale', 2, '2025-12-27 13:38:09', NULL, NULL),
(70, 8, 'Sale', 1, '2025-12-16 13:38:09', NULL, NULL),
(71, 14, 'Purchase', 4, '2025-12-19 13:38:09', NULL, NULL),
(72, 6, 'Purchase', 2, '2026-01-01 13:38:09', NULL, NULL),
(73, 2, 'Sale', 4, '2025-12-17 13:38:09', NULL, NULL),
(74, 16, 'Sale', 1, '2026-01-09 13:38:09', NULL, NULL),
(75, 6, 'Sale', 1, '2026-01-08 13:38:09', NULL, NULL),
(76, 6, 'Sale', 3, '2025-12-18 13:38:09', NULL, NULL),
(77, 11, 'Sale', 3, '2026-01-08 13:38:09', NULL, NULL),
(78, 14, 'Sale', 4, '2025-12-29 13:38:09', NULL, NULL),
(79, 11, 'Sale', 2, '2025-12-28 13:38:09', NULL, NULL),
(80, 2, 'Sale', 3, '2025-12-19 13:38:09', NULL, NULL),
(81, 8, 'Sale', 1, '2025-12-17 13:38:09', NULL, NULL),
(82, 14, 'Sale', 3, '2025-12-27 13:38:09', NULL, NULL),
(83, 11, 'Sale', 3, '2025-12-20 13:38:09', NULL, NULL),
(84, 2, 'Sale', 2, '2026-01-05 13:38:09', NULL, NULL),
(85, 8, 'Sale', 2, '2025-12-15 13:38:09', NULL, NULL),
(86, 14, 'Sale', 1, '2025-12-27 13:38:09', NULL, NULL),
(87, 4, 'Sale', 2, '2025-12-29 13:38:09', NULL, NULL),
(88, 5, 'Purchase', 5, '2025-12-26 13:38:09', NULL, NULL),
(89, 8, 'Sale', 2, '2025-12-21 13:38:09', NULL, NULL),
(90, 16, 'Sale', 4, '2025-12-13 13:38:09', NULL, NULL),
(91, 6, 'Purchase', 3, '2025-12-20 13:38:09', NULL, NULL),
(92, 15, 'Sale', 4, '2025-12-14 13:38:09', NULL, NULL),
(93, 4, 'Sale', 5, '2025-12-12 13:38:09', NULL, NULL),
(94, 15, 'Sale', 4, '2025-12-31 13:38:09', NULL, NULL),
(95, 7, 'Sale', 3, '2026-01-04 13:38:09', NULL, NULL),
(96, 3, 'Sale', 5, '2026-01-06 13:38:09', NULL, NULL),
(97, 12, 'Sale', 2, '2025-12-26 13:38:09', NULL, NULL),
(98, 4, 'Sale', 3, '2026-01-02 13:38:09', NULL, NULL),
(99, 16, 'Sale', 5, '2025-12-31 13:38:09', NULL, NULL),
(100, 7, 'Sale', 2, '2025-12-19 13:38:09', NULL, NULL),
(101, 12, 'Sale', 1, '2026-01-09 14:47:05', 1, 'RCPT-1767970024367'),
(102, 12, 'Sale', 1, '2026-01-09 14:47:05', 1, 'RCPT-1767970025365');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'Staff',
  `fullname` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `role`, `fullname`, `created_at`) VALUES
(1, 'admin', 'admin123', 'Admin', 'System Administrator', '2026-01-09 13:51:30'),
(2, 'staff', 'staff123', 'Staff', 'Sales Staff', '2026-01-09 13:51:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `barcode` (`barcode`),
  ADD KEY `fk_supplier` (`supplier_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`) ON DELETE SET NULL;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
