-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2022 at 12:49 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cmis`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminid` int(10) NOT NULL,
  `adminname` varchar(25) NOT NULL,
  `loginid` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `status` varchar(10) NOT NULL,
  `usertype` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminid`, `adminname`, `loginid`, `password`, `status`, `usertype`) VALUES
(1, 'brylle barcoma', 'admin', '123456789', 'Active', '');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appointmentid` int(10) NOT NULL,
  `appointmenttype` varchar(25) NOT NULL,
  `patientid` int(10) NOT NULL,
  `roomid` int(10) NOT NULL,
  `departmentid` int(10) NOT NULL,
  `appointmentdate` date NOT NULL,
  `appointmenttime` time NOT NULL,
  `nurseid` int(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `app_reason` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointmentid`, `appointmenttype`, `patientid`, `roomid`, `departmentid`, `appointmentdate`, `appointmenttime`, `nurseid`, `status`, `app_reason`) VALUES
(1, '', 1, 0, 2, '2022-05-16', '07:59:00', 0, 'Approved', 'wala lang'),
(2, '', 2, 0, 2, '2022-05-17', '07:49:00', 2, 'Approved', 'wala lang'),
(3, '', 4, 0, 2, '2022-05-17', '06:00:00', 4, 'Approved', 'wala lang sir'),
(4, '', 3, 0, 2, '2022-05-17', '05:18:00', 4, 'Active', 'agagaga'),
(5, '', 5, 0, 2, '2022-05-27', '06:17:00', 4, 'Approved', 'sfagagaga');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `departmentid` int(10) NOT NULL,
  `departmentname` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`departmentid`, `departmentname`, `description`, `status`) VALUES
(2, 'TechnologyDepartment', 'For Technology Student', 'Active'),
(3, 'EducationDepartment', 'For Education Students', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `medicineid` int(10) NOT NULL,
  `medicinename` varchar(25) NOT NULL,
  `medicinecost` int(10) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`medicineid`, `medicinename`, `medicinecost`, `description`, `status`) VALUES
(2, 'Rexidol', 0, 'For Headache', 'Active'),
(3, 'Imodium', 0, 'For Stomach Ache', 'Active'),
(4, 'tambal makbuang', 10, 'ambot lang', 'Active'),
(5, 'lagundi', 10, 'para hubak', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `nurse`
--

CREATE TABLE `nurse` (
  `nurseid` int(10) NOT NULL,
  `nursename` varchar(50) NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `departmentid` int(10) NOT NULL,
  `loginid` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `status` varchar(10) NOT NULL,
  `education` varchar(25) NOT NULL,
  `experience` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nurse`
--

INSERT INTO `nurse` (`nurseid`, `nursename`, `mobileno`, `departmentid`, `loginid`, `password`, `status`, `education`, `experience`) VALUES
(4, 'Brylle Barcoma', '09980368786', 2, '1177140', 'barcoma1177140', 'Active', 'BSN', 5 ),
(5, 'Mienzan Artizuela', '0998456789', 0, '1177135', '1177135mienzan', 'Active', 'BSN', 7);

-- --------------------------------------------------------

--
-- Table structure for table `nurse_timings`
--

CREATE TABLE `nurse_timings` (
  `nurse_timings_id` int(10) NOT NULL,
  `nurseid` int(10) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `available_day` varchar(15) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nurse_timings`
--

INSERT INTO `nurse_timings` (`nurse_timings_id`, `nurseid`, `start_time`, `end_time`, `available_day`, `status`) VALUES
(1, 1, '07:30:00', '17:00:00', '', 'Active'),
(2, 2, '07:59:00', '17:04:00', '', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderid` int(10) NOT NULL,
  `patientid` int(10) NOT NULL,
  `nurseid` int(10) NOT NULL,
  `prescriptionid` int(10) NOT NULL,
  `orderdate` date NOT NULL,
  `deliverydate` date NOT NULL,
  `address` text NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `note` text NOT NULL,
  `status` varchar(10) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `card_no` varchar(20) NOT NULL,
  `cvv_no` varchar(5) NOT NULL,
  `expdate` date NOT NULL,
  `card_holder` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patientid` int(10) NOT NULL,
  `patientname` varchar(50) NOT NULL,
  `admissiondate` date NOT NULL,
  `admissiontime` time NOT NULL,
  `address` varchar(250) NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `city` varchar(25) NOT NULL,
  `pincode` varchar(20) NOT NULL,
  `loginid` varchar(50) NOT NULL,
  `password` varchar(25) NOT NULL,
  `bloodgroup` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patientid`, `patientname`, `admissiondate`, `admissiontime`, `address`, `mobileno`, `city`, `pincode`, `loginid`, `password`, `bloodgroup`, `gender`, `dob`, `status`) VALUES
(1, 'badian', '2022-05-16', '18:00:07', 'pitalo', '1324564894', 'san fernando', '', '54321', 'badian123', '', 'Male', '1999-10-22', 'Active'),
(2, 'badian', '2022-05-16', '19:50:35', 'pitalo', '1324564894', 'san fernando', '', '12345', 'badian123', '', 'Male', '1999-10-22', 'Active'),
(3, 'brylle', '2022-05-16', '19:54:33', 'safs', '21641651', 'sfasf', '', '12345', '123456789', '', 'Male', '2008-08-17', 'Active'),
(4, 'badian', '2022-05-16', '21:59:04', 'pitalo', '1324564894', 'san fernando', '', '12345', 'badian123', '', 'Male', '2022-05-17', 'Active'),
(5, 'mienzan', '2022-05-16', '23:17:24', 'naga', '654195178', 'naga', '', '12345', '123456789', '', 'Female', '2005-12-17', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `prescriptionid` int(10) NOT NULL,
  `treatment_records_id` int(10) NOT NULL,
  `nurseid` int(10) NOT NULL,
  `patientid` int(10) NOT NULL,
  `delivery_type` varchar(10) NOT NULL COMMENT 'Delivered through appointment or online order',
  `delivery_id` int(10) NOT NULL COMMENT 'appointmentid or orderid',
  `prescriptiondate` date NOT NULL,
  `status` varchar(10) NOT NULL,
  `appointmentid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`prescriptionid`, `treatment_records_id`, `nurseid`, `patientid`, `delivery_type`, `delivery_id`, `prescriptiondate`, `status`, `appointmentid`) VALUES
(1, 0, 2, 2, '', 0, '2022-05-18', 'Active', 2),
(2, 0, 2, 2, '', 0, '2022-05-18', 'Active', 2),
(3, 0, 2, 2, '', 0, '0000-00-00', 'Active', 2),
(4, 0, 4, 4, '', 0, '0000-00-00', 'Active', 3),
(5, 0, 4, 4, '', 0, '2022-05-17', 'Active', 3),
(6, 0, 4, 5, '', 0, '2022-05-17', 'Active', 5);

-- --------------------------------------------------------

--
-- Table structure for table `prescription_records`
--

CREATE TABLE `prescription_records` (
  `prescription_record_id` int(10) NOT NULL,
  `prescription_id` int(10) NOT NULL,
  `medicine_name` varchar(25) NOT NULL,
  `cost` float(10,2) NOT NULL,
  `unit` int(10) NOT NULL,
  `dosage` varchar(25) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prescription_records`
--

INSERT INTO `prescription_records` (`prescription_record_id`, `prescription_id`, `medicine_name`, `cost`, `unit`, `dosage`, `status`) VALUES
(1, 2, '2', 0.00, 5, '1-1-1', 'Active'),
(2, 1, '3', 0.00, 1, '1-0-0', 'Active'),
(3, 3, '3', 0.00, 3, '1-1-1', 'Active'),
(7, 5, '4', 0.00, 2, '0-1-1', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `roomid` int(10) NOT NULL,
  `roomtype` varchar(25) NOT NULL,
  `roomno` int(10) NOT NULL,
  `noofbeds` int(10) NOT NULL,
  `room_tariff` float(10,2) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`roomid`, `roomtype`, `roomno`, `noofbeds`, `room_tariff`, `status`) VALUES
(15, 'GENERAL WARD', 1, 20, 500.00, 'Active'),
(16, 'SPECIAL WARD', 2, 10, 100.00, 'Active'),
(17, 'GENERAL WARD', 2, 10, 500.00, 'Active'),
(18, 'GENERAL WARD', 121, 13, 150.00, 'Active'),
(19, 'GENERAL WARD', 850, 11, 500.00, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `service_type`
--

CREATE TABLE `service_type` (
  `service_type_id` int(10) NOT NULL,
  `service_type` varchar(100) NOT NULL,
  `servicecharge` float(10,2) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_type`
--

INSERT INTO `service_type` (`service_type_id`, `service_type`, `servicecharge`, `description`, `status`) VALUES
(10, 'X-ray', 250.00, 'To take fractured photo copy', 'Active'),
(11, 'Scanning', 450.00, 'To scan body from injury', 'Active'),
(12, 'MRI', 300.00, 'Regarding body scan', 'Active'),
(13, 'Blood Testing', 150.00, 'To detect the type of disease', 'Active'),
(14, 'Diagnosis', 210.00, 'To analyse the diagnosis', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `treatmentid` int(10) NOT NULL,
  `treatmenttype` varchar(25) NOT NULL,
  `treatment_cost` decimal(10,2) NOT NULL,
  `note` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `treatment`
--

INSERT INTO `treatment` (`treatmentid`, `treatmenttype`, `treatment_cost`, `note`, `status`) VALUES
(21, 'weight', '0.00', 'occassional', 'Active'),
(22, 'height', '0.00', 'occasional', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `treatment_records`
--

CREATE TABLE `treatment_records` (
  `treatment_records_id` int(10) NOT NULL,
  `treatmentid` int(10) NOT NULL,
  `appointmentid` int(10) NOT NULL,
  `patientid` int(10) NOT NULL,
  `nurseid` int(10) NOT NULL,
  `treatment_description` text NOT NULL,
  `uploads` varchar(100) NOT NULL,
  `treatment_date` date NOT NULL,
  `treatment_time` time NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `treatment_records`
--

INSERT INTO `treatment_records` (`treatment_records_id`, `treatmentid`, `appointmentid`, `patientid`, `nurseid`, `treatment_description`, `uploads`, `treatment_date`, `treatment_time`, `status`) VALUES
(1, 21, 2, 2, 2, 'nag patimbang', '1782277088', '2022-05-16', '13:52:00', 'Active'),
(2, 22, 2, 2, 2, 'dggagd', '1397369783artizuela-programmer.png', '2022-05-16', '03:19:00', 'Active'),
(3, 22, 3, 4, 4, 'imong mama vital', '1595511986', '2022-05-16', '04:58:00', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `loginname` varchar(50) NOT NULL,
  `password` varchar(10) NOT NULL,
  `patientname` varchar(50) NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `createddateandtime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `loginname`, `password`, `patientname`, `mobileno`, `email`, `createddateandtime`) VALUES
(1, 'user', 'admin', 'Nezuko', '', '', '2022-02-09 11:21:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminid`),
  ADD UNIQUE KEY `adminname` (`adminname`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointmentid`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`departmentid`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`medicineid`);

--
-- Indexes for table `nurse`
--
ALTER TABLE `nurse`
  ADD PRIMARY KEY (`nurseid`);

--
-- Indexes for table `nurse_timings`
--
ALTER TABLE `nurse_timings`
  ADD PRIMARY KEY (`nurse_timings_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderid`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patientid`),
  ADD KEY `loginid` (`loginid`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`prescriptionid`);

--
-- Indexes for table `prescription_records`
--
ALTER TABLE `prescription_records`
  ADD PRIMARY KEY (`prescription_record_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`roomid`);

--
-- Indexes for table `service_type`
--
ALTER TABLE `service_type`
  ADD PRIMARY KEY (`service_type_id`);

--
-- Indexes for table `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`treatmentid`);

--
-- Indexes for table `treatment_records`
--
ALTER TABLE `treatment_records`
  ADD PRIMARY KEY (`treatment_records_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appointmentid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `departmentid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `medicineid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `nurse`
--
ALTER TABLE `nurse`
  MODIFY `nurseid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `nurse_timings`
--
ALTER TABLE `nurse_timings`
  MODIFY `nurse_timings_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patientid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `prescriptionid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `prescription_records`
--
ALTER TABLE `prescription_records`
  MODIFY `prescription_record_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `roomid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `service_type`
--
ALTER TABLE `service_type`
  MODIFY `service_type_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `treatment`
--
ALTER TABLE `treatment`
  MODIFY `treatmentid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `treatment_records`
--
ALTER TABLE `treatment_records`
  MODIFY `treatment_records_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
