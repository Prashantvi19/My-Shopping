-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 25, 2024 at 11:00 PM
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
-- Database: `my_shopping_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `addressusers`
--

CREATE TABLE `addressusers` (
  `id` int(10) NOT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `mobileNumber` varchar(12) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `addressusers`
--

INSERT INTO `addressusers` (`id`, `address`, `city`, `state`, `country`, `mobileNumber`, `email`, `created_at`) VALUES
(6, '24, abc', 'indore', 'mp', 'india', '1234567890', 'prashantvish19@gmail.com', '2024-07-08 18:35:37'),
(7, '25, abc', 'indore', 'mp', 'india', '1234567890', 'prashantvish19@gmail.com', '2024-07-08 18:36:27'),
(19, '30 abc', 'indore', 'mp', 'india', '1234567890', 'prashantvish199@gmail.com', '2024-07-13 13:41:51'),
(20, '32abc', 'indore', 'mp', 'india', '1231238902', 'prashantvish199@gmail.com', '2024-07-13 13:42:42'),
(21, '12 abc', 'indore', 'mp', 'india', '1234556', 'prashantvish19@gmail.com', '2024-07-13 17:25:12');

-- --------------------------------------------------------

--
-- Table structure for table `contactus`
--

CREATE TABLE `contactus` (
  `id` int(10) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contactus`
--

INSERT INTO `contactus` (`id`, `email`, `subject`, `message`) VALUES
(7, 'prashantvish19@gmail.com', 'hello', 'test'),
(8, 'prashantvish19@gmail.com', 'test', 'hello'),
(9, 'prashantvish19@gmail.com', 'test', 'test3'),
(10, 'prashantvish19@gmail.com', 'test4', 'hello');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `feedback` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `name`, `email`, `feedback`) VALUES
(8, 'Prashant Vishwakarma', 'prashantvish19@gmail.com', 'hello'),
(9, 'prashant  vishwakarma', 'prashantvish199@gmail.com', 'test'),
(10, 'prashant  vishwakarma', 'prashantvish19@gmail.com', 'test3'),
(11, 'prashant ', 'prashantvish19@gmail.com', 'test'),
(12, 'prashant  vishwakarma', 'prashantvish19@gmail.com', 'test5');

-- --------------------------------------------------------

--
-- Table structure for table `orderbill`
--

CREATE TABLE `orderbill` (
  `id` int(10) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `orderDate` date DEFAULT NULL,
  `delivaryDate` date DEFAULT NULL,
  `payment` varchar(255) DEFAULT NULL,
  `paymentMethod` varchar(255) DEFAULT NULL,
  `billPaid` varchar(255) DEFAULT NULL,
  `discountPer` varchar(255) DEFAULT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `shippingCharge` varchar(255) DEFAULT NULL,
  `billNo` varchar(255) DEFAULT NULL,
  `transactionId` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `addressId` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderbill`
--

INSERT INTO `orderbill` (`id`, `email`, `orderDate`, `delivaryDate`, `payment`, `paymentMethod`, `billPaid`, `discountPer`, `discount`, `shippingCharge`, `billNo`, `transactionId`, `status`, `addressId`) VALUES
(52, 'prashantvish19@gmail.com', '2024-07-13', '2024-07-20', '1232.0', 'Cash On Delivery', '1201.04', '15.5', '190.96', '160.0', '20240713_225556', 'Cash', 'cancled', '6'),
(53, 'prashantvish19@gmail.com', '2024-07-13', '2024-07-20', '1232', 'Pay Online', '1201.04', '15.5', '190.96', '160.0', '20240713_225830', 'ref-12345234', 'Delivered', '6'),
(54, 'prashantvish19@gmail.com', '2024-07-16', '2024-07-23', '345', 'Cash On Delivery', '451.525', '15.5', '53.475', '160.0', '20240716_224407', 'Cash', 'Order is processing', '21'),
(55, 'prashantvish19@gmail.com', '2024-07-17', '2024-07-24', '234', 'Cash On Delivery', '357.73', '15.5', '36.27', '160.0', '20240717_230155', 'Cash', 'Order is processing', '21');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) NOT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `price` varchar(25) DEFAULT NULL,
  `activeStatus` varchar(255) DEFAULT NULL,
  `imageAddress` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `productName`, `category`, `price`, `activeStatus`, `imageAddress`) VALUES
(36, 'a', 'acb', '200', 'yes', '20240713_163447download (3).jpeg'),
(37, 'c', 'ccccccc', '1232', 'yes', '20240713_163519download (5).jpeg'),
(38, 'b', 'bb', '1232', 'yes', '20240713_163542download (6).jpeg'),
(39, 'd', 'ddd', '1234', 'yes', '20240713_171515download (7).jpeg'),
(59, 'e', 'e', '345', 'yes', '20240716_222515images (1).jpeg'),
(60, 'f', 'f', '234', 'yes', '20240717_165918images (5).jpeg'),
(61, 'h', 'h', '234', 'yes', '20240718_200222download (12).jpeg'),
(62, 'j', 'j', '345', 'yes', '20240718_202824images (8).jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobileNumber` varchar(12) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `mobileNumber`, `gender`, `question`, `answer`, `password`) VALUES
(11, 'Prashant Vishwakarma', 'prashantvish19@gmail.com', '1234567899', 'Male', 'In what town or city was your first full-time job?', 'Indore', '12345678'),
(15, 'Prashant Vishwakarma', 'prashantvish119@gmail.com', '1234567890', 'Male', 'What is your favorite movie?', 'om', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `usercards`
--

CREATE TABLE `usercards` (
  `id` int(10) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `product_id` int(10) DEFAULT NULL,
  `quantity` varchar(30) DEFAULT NULL,
  `price` varchar(40) DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL,
  `address_id` int(10) DEFAULT NULL,
  `billNo` varchar(255) DEFAULT NULL,
  `orderedDate` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usercards`
--

INSERT INTO `usercards` (`id`, `email`, `product_id`, `quantity`, `price`, `total`, `address_id`, `billNo`, `orderedDate`, `status`) VALUES
(110, 'prashantvish19@gmail.com', 37, '1', '1232', '1232', 6, '20240713_225556', '2024-07-13', 'cancled'),
(111, 'prashantvish19@gmail.com', 38, '1', '1232', '1232', 6, '20240713_225830', '2024-07-13', 'Delivered'),
(112, 'prashantvish19@gmail.com', 59, '1', '345', '345', 21, '20240716_224407', '2024-07-16', 'Order is processing'),
(113, 'prashantvish19@gmail.com', 60, '1', '234', '234', 21, '20240717_230155', '2024-07-17', 'Order is processing');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addressusers`
--
ALTER TABLE `addressusers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contactus`
--
ALTER TABLE `contactus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderbill`
--
ALTER TABLE `orderbill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `usercards`
--
ALTER TABLE `usercards`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addressusers`
--
ALTER TABLE `addressusers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `contactus`
--
ALTER TABLE `contactus`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orderbill`
--
ALTER TABLE `orderbill`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `usercards`
--
ALTER TABLE `usercards`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
