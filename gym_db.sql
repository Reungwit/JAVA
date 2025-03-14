-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2025 at 05:29 AM
-- Server version: 8.0.41
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gym_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `checkin_log`
--

CREATE TABLE `checkin_log` (
  `log_id` int NOT NULL,
  `member_id` int DEFAULT NULL,
  `member_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `checkin_time` time DEFAULT NULL,
  `checkout_time` time DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `checkin_log`
--

INSERT INTO `checkin_log` (`log_id`, `member_id`, `member_name`, `checkin_time`, `checkout_time`, `date`) VALUES
(15, 2, '', '02:29:00', NULL, '2025-03-13 00:29:19'),
(16, 2, 'hhh', '00:29:00', '00:35:00', '2025-03-13 00:29:41'),
(17, 2, 'Boss', '03:15:00', '03:38:00', '2025-03-13 00:39:34');

-- --------------------------------------------------------

--
-- Table structure for table `gym_setting`
--

CREATE TABLE `gym_setting` (
  `setting_id` int NOT NULL,
  `max_capacity` int DEFAULT NULL,
  `current_capacity` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gym_setting`
--

INSERT INTO `gym_setting` (`setting_id`, `max_capacity`, `current_capacity`) VALUES
(1, 50, 0);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `member_id` int NOT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gender` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `package_id` int DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`member_id`, `firstname`, `lastname`, `gender`, `phone`, `email`, `join_date`, `expire_date`, `package_id`, `status`) VALUES
(2, 'Guest', 'Member', '-', '-', '-', '2024-12-29', '2024-12-29', 1, 'Active'),
(4, 'Liam', 'Smith', 'Male', '+314-5692345', 'liam.smith@example.com', '2021-06-12', '2023-08-14', 2, 'Active'),
(5, 'Emma', 'Johnson', 'Female', '+402-9876543', 'emma.johnson@example.com', '2019-12-29', '2023-12-31', 2, 'Active'),
(6, 'Noah', 'Brown', 'Male', '+523-7654321', 'noah.brown@example.com', '2022-01-10', '2025-05-09', 2, 'Active'),
(7, 'Olivia', 'Williams', 'Female', '+698-3456789', 'olivia.williams@example.com', '2023-01-01', '2023-12-31', 2, 'Active'),
(8, 'James', 'Taylor', 'Male', '+785-1239876', 'james.taylor@example.com', '2021-11-29', '2023-07-30', 3, 'Active'),
(9, 'Sophia', 'Anderson', 'Female', '+876-5432198', 'sophia.anderson@example.com', '2020-05-18', '2022-09-22', 3, 'Expired'),
(10, 'William', 'Martinez', 'Male', '+432-9081723', 'william.martinez@example.com', '2022-12-05', '2024-06-18', 2, 'Active'),
(11, 'Isabella', 'Garcia', 'Female', '+312-7584932', 'isabella.garcia@example.com', '2023-07-19', '2024-11-29', 3, 'Expired'),
(12, 'Ethan', 'Rodriguez', 'Male', '+542-8675349', 'ethan.rodriguez@example.com', '2021-03-22', '2023-10-05', 3, 'Active'),
(13, 'Mia', 'Harris', 'Female', '+689-2345678', 'mia.harris@example.com', '2020-11-09', '2022-05-30', 2, 'Expired'),
(14, 'test', 'dddd', 'Male', '5555', 'yyyy', '2024-12-29', '2024-12-29', 2, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `package_id` int NOT NULL,
  `package_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`package_id`, `package_name`, `duration`, `price`) VALUES
(1, 'Daily', 1, 60.00),
(2, 'Monthly', 30, 2700.00),
(3, 'Yearly', 365, 30000.00);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int NOT NULL,
  `member_id` int DEFAULT NULL,
  `package_id` int DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `amount_received` decimal(10,2) NOT NULL,
  `amount_change` decimal(10,2) NOT NULL,
  `payment_method` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `receipt_pdf_path` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `member_id`, `package_id`, `payment_date`, `amount`, `amount_received`, `amount_change`, `payment_method`, `receipt_pdf_path`) VALUES
(11, 2, 1, '2025-03-12 18:41:46', 107.00, 110.00, 3.00, 'Mobile Banking', 'D:\\Work KUMTNB\\java oop\\project\\code\\JAVA\\NetBeansProjects\\JavaApplication2\\receipts\\receipt_11.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `revenue_report`
--

CREATE TABLE `revenue_report` (
  `report_id` int NOT NULL,
  `report_date` date DEFAULT NULL,
  `daily_income` decimal(10,2) DEFAULT NULL,
  `monthly_income` decimal(10,2) DEFAULT NULL,
  `yearly_income` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_password`) VALUES
(1, 'admin', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `checkin_log`
--
ALTER TABLE `checkin_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `gym_setting`
--
ALTER TABLE `gym_setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`member_id`),
  ADD KEY `member_id` (`package_id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`package_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `package_id` (`package_id`);

--
-- Indexes for table `revenue_report`
--
ALTER TABLE `revenue_report`
  ADD PRIMARY KEY (`report_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `checkin_log`
--
ALTER TABLE `checkin_log`
  MODIFY `log_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `member_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `package_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `revenue_report`
--
ALTER TABLE `revenue_report`
  MODIFY `report_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `checkin_log`
--
ALTER TABLE `checkin_log`
  ADD CONSTRAINT `checkin_log_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`);

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `member_id` FOREIGN KEY (`package_id`) REFERENCES `package` (`package_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `package` (`package_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
