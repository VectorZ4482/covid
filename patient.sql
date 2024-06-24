-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2024 at 03:49 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `patient`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(100) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(225) NOT NULL,
  `admin_password` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'hammad', 'admin123@gmail.com', '123'),
(2, 'shah', 'shah2241@gmail.com', '123');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `hospital_id` int(11) DEFAULT NULL,
  `booking_date` date NOT NULL,
  `booking_type` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Confirmed',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `patient_id`, `hospital_id`, `booking_date`, `booking_type`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2024-06-01', 'Test', 'Confirmed', '2024-05-29 21:04:42', '2024-05-29 21:04:42'),
(2, 2, 2, '2024-06-02', 'Vaccination', 'Pending', '2024-05-29 21:04:42', '2024-05-29 21:04:42'),
(3, 3, 3, '2024-06-03', 'Consultation', 'Cancelled', '2024-05-29 21:04:42', '2024-05-29 21:04:42'),
(4, 4, 4, '2024-06-04', 'Test', 'Confirmed', '2024-05-29 21:04:42', '2024-05-29 21:04:42'),
(5, 5, 5, '2024-06-05', 'Vaccination', 'Rescheduled', '2024-05-29 21:04:42', '2024-05-29 21:04:42');

-- --------------------------------------------------------

--
-- Table structure for table `covidtestreports`
--

CREATE TABLE `covidtestreports` (
  `test_id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `test_date` date NOT NULL,
  `result` varchar(10) NOT NULL,
  `test_center` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `covidtestreports`
--

INSERT INTO `covidtestreports` (`test_id`, `patient_id`, `test_date`, `result`, `test_center`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-05-01', 'Negative', 'Springfield General Hospital', '2024-05-29 20:55:30', '2024-05-29 20:55:30'),
(2, 2, '2024-05-02', 'Positive', 'Metropolis Health Clinic', '2024-05-29 20:55:30', '2024-05-29 20:55:30'),
(3, 3, '2024-05-03', 'Recovered', 'Gotham City Medical Center', '2024-05-29 20:55:30', '2024-05-29 20:55:30'),
(4, 4, '2024-05-04', 'Negative', 'Smallville Community Hospital', '2024-05-29 20:55:30', '2024-05-29 20:55:30'),
(5, 5, '2024-05-05', 'Positive', 'Star City Health Department', '2024-05-29 20:55:30', '2024-05-29 20:55:30');

-- --------------------------------------------------------

--
-- Table structure for table `hospitals`
--

CREATE TABLE `hospitals` (
  `hospital_id` int(11) NOT NULL,
  `hospital_name` varchar(100) NOT NULL,
  `contact_info` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `approval_status` varchar(20) NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hospitals`
--

INSERT INTO `hospitals` (`hospital_id`, `hospital_name`, `contact_info`, `address`, `approval_status`, `created_at`, `updated_at`) VALUES
(1, 'Springfield General Hospital', '123-456-7890', '123 Main St, Springfield, IL', 'Approved', '2024-05-29 21:02:23', '2024-05-29 21:02:23'),
(2, 'Metropolis Health Clinic', '987-654-3210', '456 Oak St, Metropolis, NY', 'Pending', '2024-05-29 21:02:23', '2024-05-29 21:02:23'),
(3, 'Gotham City Medical Center', '555-123-4567', '789 Pine St, Gotham, NJ', 'Rejected', '2024-05-29 21:02:23', '2024-05-29 21:02:23'),
(4, 'Smallville Community Hospital', '444-987-6543', '101 Maple St, Smallville, KS', 'Approved', '2024-05-29 21:02:23', '2024-05-29 21:02:23'),
(5, 'Star City Health Department', '333-456-7890', '202 Birch St, Star City, CA', 'Pending', '2024-05-29 21:02:23', '2024-05-29 21:02:23');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `contact_info` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `covid_status` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patient_id`, `first_name`, `last_name`, `date_of_birth`, `contact_info`, `address`, `covid_status`, `created_at`, `updated_at`) VALUES
(1, 'John', 'Doe', '1980-05-15', 'john.doe@example.com', '123 Main St, Springfield, IL', 'Negative', '2024-05-29 20:52:29', '2024-05-29 20:52:29'),
(2, 'Jane', 'Smith', '1992-08-24', 'jane.smith@example.com', '456 Oak St, Metropolis, NY', 'Positive', '2024-05-29 20:52:29', '2024-05-29 20:52:29'),
(3, 'Robert', 'Johnson', '1975-11-30', 'robert.johnson@example.com', '789 Pine St, Gotham, NJ', 'Recovered', '2024-05-29 20:52:29', '2024-05-29 20:52:29'),
(4, 'Emily', 'Davis', '1985-02-12', 'emily.davis@example.com', '101 Maple St, Smallville, KS', 'Negative', '2024-05-29 20:52:29', '2024-05-29 20:52:29'),
(5, 'Michael', 'Brown', '1990-07-19', 'michael.brown@example.com', '202 Birch St, Star City, CA', 'Positive', '2024-05-29 20:52:29', '2024-05-29 20:52:29');

-- --------------------------------------------------------

--
-- Table structure for table `vaccines`
--

CREATE TABLE `vaccines` (
  `vaccine_id` int(11) NOT NULL,
  `vaccine_name` varchar(100) NOT NULL,
  `availability` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vaccines`
--

INSERT INTO `vaccines` (`vaccine_id`, `vaccine_name`, `availability`, `created_at`, `updated_at`) VALUES
(1, 'Pfizer-BioNTech', 'Available', '2024-05-29 21:00:04', '2024-05-29 21:00:04'),
(2, 'Moderna', 'Available', '2024-05-29 21:00:04', '2024-05-29 21:00:04'),
(3, 'Johnson & Johnson', 'Unavailable', '2024-05-29 21:00:04', '2024-05-29 21:00:04'),
(4, 'AstraZeneca', 'Available', '2024-05-29 21:00:04', '2024-05-29 21:00:04'),
(5, 'Sinopharm', 'Unavailable', '2024-05-29 21:00:04', '2024-05-29 21:00:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `hospital_id` (`hospital_id`);

--
-- Indexes for table `covidtestreports`
--
ALTER TABLE `covidtestreports`
  ADD PRIMARY KEY (`test_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `hospitals`
--
ALTER TABLE `hospitals`
  ADD PRIMARY KEY (`hospital_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `vaccines`
--
ALTER TABLE `vaccines`
  ADD PRIMARY KEY (`vaccine_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `covidtestreports`
--
ALTER TABLE `covidtestreports`
  MODIFY `test_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `hospitals`
--
ALTER TABLE `hospitals`
  MODIFY `hospital_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vaccines`
--
ALTER TABLE `vaccines`
  MODIFY `vaccine_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`hospital_id`);

--
-- Constraints for table `covidtestreports`
--
ALTER TABLE `covidtestreports`
  ADD CONSTRAINT `covidtestreports_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
