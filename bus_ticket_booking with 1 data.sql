-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 07, 2023 at 12:56 AM
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
-- Database: `bus_ticket_booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `accessibility`
--

CREATE TABLE `accessibility` (
  `accessibility_id` int(255) NOT NULL,
  `bus_number` int(255) NOT NULL,
  `accessibility_list` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accessibility`
--

INSERT INTO `accessibility` (`accessibility_id`, `bus_number`, `accessibility_list`) VALUES
(111301, 287601, 'ramp,low floor');

-- --------------------------------------------------------

--
-- Table structure for table `buses`
--

CREATE TABLE `buses` (
  `bus_number` int(255) NOT NULL,
  `seat_capacity` int(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `availability` varchar(255) NOT NULL,
  `maintenance_status` varchar(255) NOT NULL,
  `route_number` int(255) NOT NULL,
  `station_id` int(255) NOT NULL,
  `stop_id` int(255) NOT NULL,
  `schedule_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buses`
--

INSERT INTO `buses` (`bus_number`, `seat_capacity`, `model`, `availability`, `maintenance_status`, `route_number`, `station_id`, `stop_id`, `schedule_id`) VALUES
(287601, 61, 'The Volvo 8900', 'yes', 'uptodate', 768801, 227201, 786701, 724301);

-- --------------------------------------------------------

--
-- Table structure for table `bus_acc`
--

CREATE TABLE `bus_acc` (
  `bus_number` int(255) NOT NULL,
  `accessibility_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bus_acc`
--

INSERT INTO `bus_acc` (`bus_number`, `accessibility_id`) VALUES
(287601, 111301);

-- --------------------------------------------------------

--
-- Table structure for table `bus_ame`
--

CREATE TABLE `bus_ame` (
  `bus_number` int(255) NOT NULL,
  `Amenities_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bus_ame`
--

INSERT INTO `bus_ame` (`bus_number`, `Amenities_id`) VALUES
(287601, 263601);

-- --------------------------------------------------------

--
-- Table structure for table `bus_amenities`
--

CREATE TABLE `bus_amenities` (
  `Amenities_id` int(255) NOT NULL,
  `bus_number` int(255) NOT NULL,
  `Amenities_list` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bus_amenities`
--

INSERT INTO `bus_amenities` (`Amenities_id`, `bus_number`, `Amenities_list`) VALUES
(263601, 287601, 'free wifi,comfortable seat,tv,air condition');

-- --------------------------------------------------------

--
-- Table structure for table `bus_reservation`
--

CREATE TABLE `bus_reservation` (
  `reservation_id` int(255) NOT NULL,
  `seat_number` varchar(255) NOT NULL,
  `date_` date NOT NULL,
  `passenger_id` int(255) NOT NULL,
  `bus_number` int(255) NOT NULL,
  `schedule_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bus_reservation`
--

INSERT INTO `bus_reservation` (`reservation_id`, `seat_number`, `date_`, `passenger_id`, `bus_number`, `schedule_id`) VALUES
(737301, 'all', '2023-11-15', 727701, 287601, 724301);

-- --------------------------------------------------------

--
-- Table structure for table `bus_routes`
--

CREATE TABLE `bus_routes` (
  `route_number` int(255) NOT NULL,
  `starting_point` varchar(255) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `distance_covered` int(255) NOT NULL,
  `duration_time` int(11) NOT NULL,
  `quantity_of_stop` int(255) NOT NULL,
  `fare_rule_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bus_routes`
--

INSERT INTO `bus_routes` (`route_number`, `starting_point`, `destination`, `distance_covered`, `duration_time`, `quantity_of_stop`, `fare_rule_id`) VALUES
(768801, 'dhaka', 'jashore', 183, 4, 1, 327301);

-- --------------------------------------------------------

--
-- Table structure for table `bus_schedules`
--

CREATE TABLE `bus_schedules` (
  `schedule_id` int(255) NOT NULL,
  `departure_time` time NOT NULL,
  `arrival_time` time NOT NULL,
  `route_number` int(255) NOT NULL,
  `stop_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bus_schedules`
--

INSERT INTO `bus_schedules` (`schedule_id`, `departure_time`, `arrival_time`, `route_number`, `stop_id`) VALUES
(724301, '10:15:00', '10:00:00', 768801, 786701);

-- --------------------------------------------------------

--
-- Table structure for table `bus_stations`
--

CREATE TABLE `bus_stations` (
  `station_id` int(255) NOT NULL,
  `station_name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `services` varchar(500) NOT NULL,
  `route_number` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bus_stations`
--

INSERT INTO `bus_stations` (`station_id`, `station_name`, `location`, `services`, `route_number`) VALUES
(227201, 'Abdullahpur Bus Stand', 'dhaka', 'Passenger transport services,Bus reservation,Providing driving training', 768801);

-- --------------------------------------------------------

--
-- Table structure for table `bus_stops`
--

CREATE TABLE `bus_stops` (
  `stop_id` int(255) NOT NULL,
  `stop_name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `route_number` int(255) NOT NULL,
  `station_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bus_stops`
--

INSERT INTO `bus_stops` (`stop_id`, `stop_name`, `location`, `route_number`, `station_id`) VALUES
(786701, 'malibagh bus stop', 'malibagh', 768801, 227201);

-- --------------------------------------------------------

--
-- Table structure for table `customer_profile`
--

CREATE TABLE `customer_profile` (
  `customer_id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password_` varchar(255) NOT NULL,
  `passenger_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_profile`
--

INSERT INTO `customer_profile` (`customer_id`, `username`, `password_`, `passenger_id`) VALUES
(287801, 'whowasif', 'pass_word@01', 727701);

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `discount_id` int(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `amount_or_percentage` int(255) NOT NULL,
  `ticket_type_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`discount_id`, `type`, `description`, `amount_or_percentage`, `ticket_type_id`) VALUES
(347201, 'student', 'for student', 10, 897301);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_govt` tinyint(1) NOT NULL,
  `freedom_fighter` tinyint(1) NOT NULL,
  `passenger_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `name`, `is_govt`, `freedom_fighter`, `passenger_id`) VALUES
(367501, 'ahsan habib', 1, 1, 727701);

-- --------------------------------------------------------

--
-- Table structure for table `fare_rules`
--

CREATE TABLE `fare_rules` (
  `fare_rule_id` int(255) NOT NULL,
  `minimum_fare` int(255) NOT NULL,
  `peak_hour_fare` int(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `bus_number` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fare_rules`
--

INSERT INTO `fare_rules` (`fare_rule_id`, `minimum_fare`, `peak_hour_fare`, `description`, `bus_number`) VALUES
(327301, 8, 8, 'For this AC bus fare is 7.6 tk/km', 287601);

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `passenger_id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `age` int(255) NOT NULL,
  `phone_number` int(255) NOT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `bus_number` int(255) NOT NULL,
  `schedule_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`passenger_id`, `name`, `age`, `phone_number`, `email_address`, `address`, `gender`, `bus_number`, `schedule_id`) VALUES
(727701, 'wasif abdullah', 23, 1731300695, 'wasifwho@gmail.com', 'bashundhara R/A', 'male', 287601, 724301);

-- --------------------------------------------------------

--
-- Table structure for table `pass_sche`
--

CREATE TABLE `pass_sche` (
  `schedule_id` int(255) NOT NULL,
  `passenger_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pass_sche`
--

INSERT INTO `pass_sche` (`schedule_id`, `passenger_id`) VALUES
(724301, 727701);

-- --------------------------------------------------------

--
-- Table structure for table `refunds`
--

CREATE TABLE `refunds` (
  `passenger_id` int(255) NOT NULL,
  `ticket_number` int(255) NOT NULL,
  `amount` int(255) NOT NULL,
  `date_` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `refunds`
--

INSERT INTO `refunds` (`passenger_id`, `ticket_number`, `amount`, `date_`) VALUES
(727701, 842501, 1400, '2023-11-15');

-- --------------------------------------------------------

--
-- Table structure for table `reserve`
--

CREATE TABLE `reserve` (
  `reservation_id` int(255) NOT NULL,
  `passenger_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reserve`
--

INSERT INTO `reserve` (`reservation_id`, `passenger_id`) VALUES
(737301, 727701);

-- --------------------------------------------------------

--
-- Table structure for table `route_station`
--

CREATE TABLE `route_station` (
  `route_number` int(255) NOT NULL,
  `station_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `route_station`
--

INSERT INTO `route_station` (`route_number`, `station_id`) VALUES
(768801, 227201);

-- --------------------------------------------------------

--
-- Table structure for table `sche_stop`
--

CREATE TABLE `sche_stop` (
  `schedule_id` int(255) NOT NULL,
  `stop_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sche_stop`
--

INSERT INTO `sche_stop` (`schedule_id`, `stop_id`) VALUES
(724301, 786701);

-- --------------------------------------------------------

--
-- Table structure for table `station`
--

CREATE TABLE `station` (
  `bus_number` int(255) NOT NULL,
  `station_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `station`
--

INSERT INTO `station` (`bus_number`, `station_id`) VALUES
(287601, 227201);

-- --------------------------------------------------------

--
-- Table structure for table `stops`
--

CREATE TABLE `stops` (
  `bus_number` int(255) NOT NULL,
  `stop_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stops`
--

INSERT INTO `stops` (`bus_number`, `stop_id`) VALUES
(287601, 786701);

-- --------------------------------------------------------

--
-- Table structure for table `stop_route`
--

CREATE TABLE `stop_route` (
  `route_number` int(255) NOT NULL,
  `stop_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stop_route`
--

INSERT INTO `stop_route` (`route_number`, `stop_id`) VALUES
(768801, 786701);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `degree` varchar(255) NOT NULL,
  `instition` varchar(255) NOT NULL,
  `passenger_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `name`, `degree`, `instition`, `passenger_id`) VALUES
(788301, 'samiul', 'bsc', 'nsu', 727702);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `ticket_number` int(255) NOT NULL,
  `fare` int(255) NOT NULL,
  `date_of_issue` date NOT NULL,
  `expire_date` date NOT NULL,
  `ticket_type_id` int(255) NOT NULL,
  `passenger_id` int(255) NOT NULL,
  `bus_number` int(255) NOT NULL,
  `discount_id` int(255) NOT NULL,
  `schedule_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`ticket_number`, `fare`, `date_of_issue`, `expire_date`, `ticket_type_id`, `passenger_id`, `bus_number`, `discount_id`, `schedule_id`) VALUES
(842501, 1400, '2023-11-13', '2023-11-15', 897301, 727701, 287601, 347201, 724301);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_type`
--

CREATE TABLE `ticket_type` (
  `ticket_type_id` int(255) NOT NULL,
  `type_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `fare` int(255) NOT NULL,
  `fare_rule_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticket_type`
--

INSERT INTO `ticket_type` (`ticket_type_id`, `type_name`, `description`, `fare`, `fare_rule_id`) VALUES
(897301, 'vip', 'ticket for vip', 1500, 327302);

-- --------------------------------------------------------

--
-- Table structure for table `type_disc`
--

CREATE TABLE `type_disc` (
  `ticket_type_id` int(255) NOT NULL,
  `discount_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `type_disc`
--

INSERT INTO `type_disc` (`ticket_type_id`, `discount_id`) VALUES
(897301, 347201);

-- --------------------------------------------------------

--
-- Table structure for table `uses`
--

CREATE TABLE `uses` (
  `bus_number` int(255) NOT NULL,
  `passenger_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uses`
--

INSERT INTO `uses` (`bus_number`, `passenger_id`) VALUES
(287601, 727701);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accessibility`
--
ALTER TABLE `accessibility`
  ADD PRIMARY KEY (`accessibility_id`);

--
-- Indexes for table `buses`
--
ALTER TABLE `buses`
  ADD PRIMARY KEY (`bus_number`);

--
-- Indexes for table `bus_amenities`
--
ALTER TABLE `bus_amenities`
  ADD PRIMARY KEY (`Amenities_id`);

--
-- Indexes for table `bus_reservation`
--
ALTER TABLE `bus_reservation`
  ADD PRIMARY KEY (`reservation_id`);

--
-- Indexes for table `bus_routes`
--
ALTER TABLE `bus_routes`
  ADD PRIMARY KEY (`route_number`);

--
-- Indexes for table `bus_schedules`
--
ALTER TABLE `bus_schedules`
  ADD PRIMARY KEY (`schedule_id`);

--
-- Indexes for table `bus_stations`
--
ALTER TABLE `bus_stations`
  ADD PRIMARY KEY (`station_id`);

--
-- Indexes for table `bus_stops`
--
ALTER TABLE `bus_stops`
  ADD PRIMARY KEY (`stop_id`);

--
-- Indexes for table `customer_profile`
--
ALTER TABLE `customer_profile`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`discount_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `fare_rules`
--
ALTER TABLE `fare_rules`
  ADD PRIMARY KEY (`fare_rule_id`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`passenger_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_number`);

--
-- Indexes for table `ticket_type`
--
ALTER TABLE `ticket_type`
  ADD PRIMARY KEY (`ticket_type_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
