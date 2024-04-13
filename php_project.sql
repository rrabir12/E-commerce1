-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2024 at 06:00 PM
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
-- Database: `php_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `admin_email` text NOT NULL,
  `admin_password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(2, 'admin', 'admin@gmail.com', 'admin12345');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_cost` decimal(6,2) NOT NULL,
  `order_status` varchar(100) NOT NULL DEFAULT 'on_hold',
  `user_id` int(11) NOT NULL,
  `user_phone` int(10) NOT NULL,
  `user_city` varchar(255) NOT NULL,
  `user_address` varchar(255) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_cost`, `order_status`, `user_id`, `user_phone`, `user_city`, `user_address`, `order_date`) VALUES
(15, 140.00, 'shipped', 3, 985636535, 'brt', 'pkh', '2024-03-15 08:33:12'),
(16, 144.00, 'delivered', 3, 4546, 'brt', 'njk', '2024-03-15 17:01:08'),
(17, 284.00, 'paid', 3, 985636535, 'jk', 'njk', '2024-03-15 17:03:33'),
(18, 134.00, 'paid', 3, 983343432, 'birat', 'pokhara', '2024-03-15 17:25:12'),
(19, 105.00, 'delivered', 3, 985636535, 'brt', 'pkh', '2024-03-15 17:29:46'),
(20, 105.00, 'paid', 1, 985636535, 'jk', 'pokhara', '2024-03-15 18:00:00'),
(21, 500.00, 'not paid', 1, 983476334, 'jnk', 'jnk', '2024-03-29 15:00:00'),
(22, 420.00, 'not paid', 1, 983476334, 'brt', 'brt', '2024-03-29 16:00:00'),
(23, 60.00, 'paid', 1, 983476334, 'brt', 'jnk', '2024-03-29 18:00:00'),
(24, 50.00, 'paid', 1, 981655156, 'jnk', 'jnk', '2024-03-30 08:00:00'),
(25, 1000.00, 'not paid', 1, 981655156, 'brt', 'jnk', '2024-03-30 08:00:00'),
(26, 120.00, 'paid', 1, 981655156, 'brt', 'jnk', '2024-03-30 08:58:13'),
(27, 300.00, 'not paid', 1, 981655156, 'jnk', 'jnk', '2024-03-30 09:00:00'),
(28, 50.00, 'paid', 1, 579843, 'brt', 'bvc', '2024-03-30 09:22:51'),
(29, 65.00, 'paid', 1, 981655156, 'jnk', 'stk', '2024-04-04 13:57:09'),
(30, 105.00, 'paid', 1, 981655156, 'jnk', 'stk', '2024-04-04 18:00:31'),
(31, 130.00, 'paid', 1, 983476334, 'brt', 'brt', '2024-04-04 18:16:07'),
(32, 65.00, 'paid', 1, 747358, 'brt', 'bvc', '2024-04-04 18:19:16'),
(33, 130.00, 'paid', 4, 983476334, 'brt', 'jnk', '2024-04-04 18:52:56'),
(34, 105.00, 'paid', 4, 434432, 'brt', 'jnk', '2024-04-04 18:58:12'),
(35, 75.00, 'paid', 4, 981655156, 'brt', 'brtghj', '2024-04-06 03:57:04'),
(36, 50.00, 'paid', 4, 983476334, 'brt', 'jnk', '2024-04-06 04:04:37'),
(37, 105.00, 'paid', 4, 8986586, 'brt', 'jsd', '2024-04-06 05:23:14'),
(38, 105.00, 'paid', 4, 579843, 'brt', 'brtghj', '2024-04-06 09:24:51'),
(39, 60.00, 'paid', 4, 579843, 'brt', 'stk', '2024-04-06 14:41:23'),
(40, 60.00, 'paid', 4, 8986586, 'brt', 'stk', '2024-04-06 15:00:11'),
(41, 50.00, 'paid', 4, 434432, 'brt', 'jsd', '2024-04-06 16:08:50');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `product_price` decimal(6,2) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`item_id`, `order_id`, `product_id`, `product_name`, `product_image`, `product_price`, `product_quantity`, `user_id`, `order_date`) VALUES
(1, 2, '2', 'Lady Bags', 'f2.jpg', 105.00, 2, 1, '2024-02-19 05:25:09'),
(2, 2, '3', 'Nike Bags', 'f3.jpg', 140.00, 1, 1, '2024-02-19 05:25:09'),
(3, 3, '2', 'Lady Bags', 'f2.jpg', 105.00, 2, 1, '2024-02-19 07:55:40'),
(4, 4, '2', 'Lady Bags', 'f2.jpg', 105.00, 2, 1, '2024-02-19 07:57:49'),
(5, 5, '2', 'Lady Bags', 'f2.jpg', 105.00, 2, 1, '2024-02-21 17:00:50'),
(6, 6, '1', 'Sports Shoes', 'f1.webp', 144.00, 1, 1, '2024-03-13 16:52:07'),
(7, 6, '2', 'Lady Bags', 'f2.jpg', 105.00, 1, 1, '2024-03-13 16:52:07'),
(8, 6, '4', 'Nike Jackets', 'f4.jpg', 134.00, 1, 1, '2024-03-13 16:52:07'),
(9, 7, '1', 'Sports Shoes', 'f1.webp', 144.00, 1, 1, '2024-03-13 16:53:56'),
(10, 8, '1', 'Sports Shoes', 'f1.webp', 144.00, 1, 1, '2024-03-13 16:58:25'),
(11, 9, '1', 'Sports Shoes', 'f1.webp', 144.00, 1, 1, '2024-03-14 15:24:01'),
(12, 10, '2', 'Lady Bags', 'f2.jpg', 105.00, 1, 4, '2024-03-14 15:29:42'),
(13, 11, '2', 'Lady Bags', 'f2.jpg', 105.00, 1, 4, '2024-03-14 15:30:40'),
(14, 11, '3', 'Nike Bags', 'f3.jpg', 140.00, 1, 4, '2024-03-14 15:30:40'),
(15, 12, '2', 'Lady Bags', 'f2.jpg', 105.00, 1, 3, '2024-03-14 16:40:24'),
(16, 12, '3', 'Nike Bags', 'f3.jpg', 140.00, 2, 3, '2024-03-14 16:40:24'),
(17, 13, '1', 'Sports Shoes', 'f1.webp', 144.00, 1, 3, '2024-03-14 16:41:47'),
(18, 14, '3', 'Nike Bags', 'f3.jpg', 140.00, 1, 1, '2024-03-14 17:18:55'),
(19, 15, '3', 'Nike Bags', 'f3.jpg', 140.00, 1, 3, '2024-03-15 08:33:12'),
(20, 16, '1', 'Sports Shoes', 'f1.webp', 144.00, 1, 3, '2024-03-15 17:01:08'),
(21, 17, '1', 'Sports Shoes', 'f1.webp', 144.00, 1, 3, '2024-03-15 17:03:33'),
(22, 17, '3', 'Nike Bags', 'f3.jpg', 140.00, 1, 3, '2024-03-15 17:03:33'),
(23, 18, '4', 'Nike Jackets', 'f4.jpg', 134.00, 1, 3, '2024-03-15 17:25:12'),
(24, 19, '2', 'Lady Bags', 'f2.jpg', 105.00, 1, 3, '2024-03-15 17:29:46'),
(25, 20, '2', 'Lady Bags', 'f2.jpg', 105.00, 1, 1, '2024-03-15 18:00:00'),
(26, 21, '6', 'Short Coats', 'c2.webp', 500.00, 1, 1, '2024-03-29 15:00:00'),
(27, 22, '3', 'Nike Bags', 'f3.jpg', 140.00, 3, 1, '2024-03-29 16:00:00'),
(28, 23, '10', 'Lady watch', 'watch4.webp', 60.00, 1, 1, '2024-03-29 18:00:00'),
(29, 24, '13', 'Black shoe', 's1.avif', 50.00, 1, 1, '2024-03-30 08:00:00'),
(30, 25, '6', 'Short Coats', 'c2.webp', 500.00, 2, 1, '2024-03-30 08:00:00'),
(31, 26, '10', 'Lady watch', '0', 60.00, 2, 1, '2024-03-30 08:58:13'),
(32, 27, '8', 'short Coats', 'c4.jpg', 300.00, 1, 1, '2024-03-30 09:00:00'),
(33, 28, '13', 'Black shoe', 's1.avif', 50.00, 1, 1, '2024-03-30 09:22:51'),
(34, 29, '15', 'Blue shoe', 's3.webp', 65.00, 1, 1, '2024-04-04 13:57:09'),
(35, 30, '2', 'Lady Bags', 'f2.jpg', 105.00, 1, 1, '2024-04-04 18:00:31'),
(36, 31, '1', 'Sports Shoes', 'f1.webp', 130.00, 1, 1, '2024-04-04 18:16:07'),
(37, 32, '15', 'Blue shoe', 's3.webp', 65.00, 1, 1, '2024-04-04 18:19:16'),
(38, 33, '1', 'Sports Shoes', 'f1.webp', 130.00, 1, 4, '2024-04-04 18:52:56'),
(39, 34, '2', 'Lady Bags', 'f2.jpg', 105.00, 1, 4, '2024-04-04 18:58:12'),
(40, 35, '12', 'Black watch', 'watch3.avif', 75.00, 1, 4, '2024-04-06 03:57:04'),
(41, 36, '13', 'Black shoe', 's1.avif', 50.00, 1, 4, '2024-04-06 04:04:37'),
(42, 37, '2', 'Lady Bags', 'f2.jpg', 105.00, 1, 4, '2024-04-06 05:23:14'),
(43, 38, '2', 'Lady Bags', 'f2.jpg', 105.00, 1, 4, '2024-04-06 09:24:51'),
(44, 39, '14', 'White shoe', 's2.avif', 60.00, 1, 4, '2024-04-06 14:41:23'),
(45, 40, '10', 'Lady watch', 'watch4.webp', 60.00, 1, 4, '2024-04-06 15:00:11'),
(46, 41, '13', 'Black shoe', 's1.avif', 50.00, 1, 4, '2024-04-06 16:08:50');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `transaction_id` varchar(250) NOT NULL,
  `payment_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `order_id`, `user_id`, `transaction_id`, `payment_date`) VALUES
(1, 19, 3, '72457552', '2024-03-15 23:25:19'),
(2, 17, 3, '0', '2024-03-15 23:25:19'),
(3, 16, 3, '42H93053ET117091M', '2024-03-15 18:46:47'),
(4, 20, 1, '8J931285053354905', '2024-03-15 18:52:46'),
(5, 32, 32, '12', '2024-04-04 18:19:53'),
(6, 35, 35, '12', '2024-04-06 03:58:47'),
(7, 36, 36, 'undefined', '2024-04-06 05:15:14'),
(8, 39, 39, '13', '2024-04-06 14:50:45'),
(9, 38, 38, '13', '2024-04-06 15:03:26'),
(10, 37, 37, '13', '2024-04-06 15:05:59'),
(11, 40, 40, 'gCoN2q5Q7wiCg3XjozMQ3A', '2024-04-06 16:06:58'),
(12, 41, 41, '566PRciCziK6CHSTbNWFJJ', '2024-04-06 16:09:32');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_category` varchar(100) NOT NULL,
  `product_description` varchar(255) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `product_image2` varchar(255) NOT NULL,
  `product_image3` varchar(255) NOT NULL,
  `product_image4` varchar(255) NOT NULL,
  `product_price` decimal(6,2) NOT NULL,
  `product_special_offer` int(2) NOT NULL,
  `product_color` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_category`, `product_description`, `product_image`, `product_image2`, `product_image3`, `product_image4`, `product_price`, `product_special_offer`, `product_color`) VALUES
(1, 'Sports Shoes', 'shoes', 'awesome shoes', 'f1.webp', 'f1.webp', 'f1.webp', 'f1.webp', 130.00, 1, 'yellow'),
(2, 'Lady Bags', 'bags', 'awesome bags', 'f2.jpg', 'f2.jpg', 'f2.jpg', 'f2.jpg', 105.00, 0, 'black'),
(3, 'Nike Bags', 'bags', 'awesome bags', 'f3.jpg', 'f3.jpg', 'f3.jpg', 'f3.jpg', 140.00, 0, 'white'),
(4, 'Nike Jackets', 'jackets', 'awesome jackets', 'f4.jpg', 'f4.jpg', 'f4.jpg', 'f4.jpg', 134.00, 0, 'white'),
(5, 'Long Coats', 'coats', 'awesome coats', 'c1.webp', 'c1.webp', 'c1.webp', 'c1.webp', 544.00, 0, 'black'),
(6, 'Short Coats', 'coats', 'awesome coats', 'c2.webp', 'c2.webp', 'c2.webp', 'c2.webp', 500.00, 0, 'blue'),
(7, 'Ladies Coats', 'coats', 'awesome coats', 'c3.jpg', 'c3.jpg', 'c3.jpg', 'c3.jpg', 400.00, 0, 'White'),
(8, 'short Coats', 'coats', 'awesome coats', 'c4.jpg', 'c4.jpg', 'c4.jpg', 'c4.jpg', 300.00, 0, 'White'),
(9, 'Black watch', 'watches', 'Nice black watch', 'watches.webp', 'watches.webp', 'watches.webp', 'watches.webp', 80.00, 0, 'Black'),
(10, 'Lady watch', 'watches', 'awesome ladies watch', 'watch4.webp', 'watch4.webp', 'watch4.webp', 'watch4.webp', 60.00, 0, 'Grey'),
(11, 'Blue watch', 'watches', 'Nice blue mens watch', 'watch2.webp', 'watch2.webp', 'watch2.webp', 'watch2.webp', 85.00, 0, 'blue'),
(12, 'Black watch', 'watches', 'Nice mens watch', 'watch3.avif', 'watch3.avif', 'watch3.avif', 'watch3.avif', 75.00, 0, 'black'),
(13, 'Black shoe', 'shoes', 'Nice mens shoe', 's1.avif', 's1.avif', 's1.avif', 's1.avif', 50.00, 0, 'black'),
(14, 'White shoe', 'shoes', 'Nice mens shoe', 's2.avif', 's2.avif', 's2.avif', 's2.avif', 60.00, 0, 'white'),
(15, 'Blue shoe', 'shoes', 'Nice mens shoe', 's3.webp', 's3.webp', 's3.webp', 's3.webp', 65.00, 0, 'blue'),
(17, 'white shoes', 'shoes', 'Amazing white shoes', 'white shoes1.jpeg', 'white shoes2.jpeg', 'white shoes3.jpeg', 'white shoes4.jpeg', 85.00, 0, 'white'),
(18, 'Red shoe', 'shoes', 'Awesome red shoes', 'Red shoe1.jpeg', 'Red shoe2.jpeg', 'Red shoe3.jpeg', 'Red shoe4.jpeg', 95.00, 0, 'red'),
(19, 'Yellow bag', 'bags', 'Amazing yellow school bag, kids are liking this really', 'Yellow bag1.jpeg', 'Yellow bag2.jpeg', 'Yellow bag3.jpeg', 'Yellow bag4.jpeg', 50.00, 1, 'yellow');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_password`) VALUES
(1, 'ram', 'man23@gmail.com', 'rabi12345'),
(2, 'rama', 'jfnhf23@gmail.com', 'refdsa'),
(3, 'modi', 'modi123@gmail.com', 'modi12345'),
(4, 'raman singh', 'raman123@gmail.com', 'raman123'),
(5, 'moh', 'vgfui@gmail.com', 'mohan@12'),
(6, 'JKFNEmkm', 'ran23@gmail.com', 'ran123'),
(7, 'monu', 'monu12@gmail.com', 'monu123'),
(8, 'moni roy', 'moni12@gmail.com', 'moni123'),
(9, 'uday singh', 'uday12@gmail.com', 'uday123'),
(10, 'baman roy', 'baman12@gmail.com', 'baman123'),
(11, 'mantu roy', 'mantu12@gmail.com', 'mantu123'),
(12, 'hem ', 'hem12@gmail.com', 'hem123'),
(13, 'hemo', 'hem123@gmail.com', 'hem123'),
(14, 'sushil', 'sushil12@gmail.com', 'sushil12'),
(15, 'mo', 'mo12@gmail.com', 'mo12345');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `ux_constraint` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
