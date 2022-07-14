-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2022 at 06:20 PM
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
(1, 'Admin', 'admin', '123456789', 'Active', '');

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
  `nurseid` int(100) NOT NULL,
  `status` varchar(10) NOT NULL,
  `app_reason` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointmentid`, `appointmenttype`, `patientid`, `roomid`, `departmentid`, `appointmentdate`, `appointmenttime`, `nurseid`, `status`, `app_reason`) VALUES
(6, '', 6, 0, 2, '2022-05-19', '12:56:00', 0, 'Approved', 'sir pa timbang ko sir'),
(7, '', 7, 0, 2, '2022-05-19', '13:02:00', 0, 'Approved', 'sir sir init kay ko sir'),
(8, '', 8, 0, 2, '2022-05-20', '14:10:00', 0, 'Approved', 'sir murag ga lain man akong tiyan sir pwede koamngayo tambal '),
(9, '', 9, 0, 2, '2022-05-19', '13:16:00', 0, 'Approved', 'sir murag mag pataimbang ko'),
(11, '', 11, 0, 2, '2022-05-19', '13:25:00', 0, 'Approved', 'hello sir need nako tambal para labad ulo sir'),
(12, '', 12, 0, 2, '2022-05-19', '13:36:00', 0, 'Approved', 'sir mag pa sukod kos akong height'),
(13, '', 13, 0, 2, '2022-05-19', '17:37:00', 0, 'Approved', 'sir pwede ko pa bp?\r\n'),
(14, '', 14, 0, 2, '2022-05-19', '23:43:00', 0, 'Approved', 'sir mag pa bp ko'),
(15, '', 15, 0, 2, '2022-05-21', '07:55:00', 0, 'Approved', 'sir mag pa timbang ko\r\n'),
(16, '', 16, 0, 2, '2022-05-20', '08:46:00', 0, 'Approved', 'timbang sir'),
(17, '', 17, 0, 4, '2022-05-20', '11:24:00', 0, 'Approved', 'nag lain ako tiyan'),
(18, '', 18, 0, 2, '2022-05-20', '11:28:00', 0, 'Approved', 'Murag init ko sir'),
(19, '', 20, 0, 5, '2022-07-08', '03:39:00', 0, 'Approved', 'ga lain akong lawas'),
(20, '', 21, 0, 5, '2022-07-08', '17:12:00', 0, 'Approved', 'Murag init ko sir'),
(21, '', 22, 0, 5, '2022-07-08', '17:15:00', 0, 'Approved', 'Murag init ko sir'),
(22, '', 23, 0, 5, '2022-07-08', '18:46:00', 0, 'Approved', 'Ga lain akong lawas sir'),
(25, '', 7, 0, 2, '2022-07-10', '05:47:00', 0, 'Approved', 'sir mo balik ki dira mag pa timbang ko'),
(27, '', 7, 0, 2, '2022-07-21', '18:43:00', 0, 'Approved', 'sir hellooooo'),
(31, '', 6, 0, 2, '2022-07-10', '06:49:00', 0, 'Approved', 'ari gud diri dong'),
(32, '', 7, 0, 2, '2022-07-30', '18:51:00', 0, 'Active', 'Ga lain akong lawas sir'),
(34, '', 25, 0, 5, '2022-07-10', '21:34:00', 0, 'Approved', 'helloooo maderpader'),
(35, '', 6, 0, 2, '2022-07-10', '21:38:00', 0, 'Approved', 'ari sa diri'),
(36, '', 26, 0, 2, '2022-07-11', '12:00:00', 0, 'Approved', 'Ga lain akong lawas sir'),
(37, '', 27, 0, 4, '2022-07-11', '12:14:00', 0, 'Approved', 'Ga lain akong lawas sir'),
(39, '', 28, 0, 2, '2022-07-11', '13:35:00', 0, 'Approved', 'Ga lain akong lawas sir'),
(40, '', 29, 0, 5, '2022-07-11', '14:03:00', 0, 'Approved', 'agikadgda dga'),
(41, '', 30, 0, 2, '0000-00-00', '00:00:00', 0, 'Approved', ''),
(42, '', 30, 0, 2, '2022-07-12', '17:08:00', 0, 'Approved', 'pa check kos akong timbang sir'),
(43, '', 6, 0, 2, '2022-07-15', '00:02:00', 0, 'Approved', 'Dong ari sa diri');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `departmentid` int(10) NOT NULL,
  `departmentname` text NOT NULL,
  `description` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`departmentid`, `departmentname`, `description`, `status`) VALUES
(2, 'BSIT-4A-DAY', 'For Technology Student only', 'Active'),
(3, 'BSIT-4B-DAY', 'For Techology Students only', 'Active'),
(4, 'BSED-4A-DAY', 'For Education Students only', 'Active'),
(5, 'Walk-In', 'For Visitors only', 'Active'),
(6, 'BSED-MATH-4A-DAY', 'For Education Students only', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `medicineid` int(10) NOT NULL,
  `medicinename` varchar(25) NOT NULL,
  `medicinequantity` int(10) NOT NULL,
  `medicineexpiry` date NOT NULL,
  `description` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`medicineid`, `medicinename`, `medicinequantity`, `medicineexpiry`, `description`, `status`) VALUES
(2, 'Rexidol', 50, '2022-05-19','For Headache', 'Active'),
(3, 'Imodium', 50, '2022-05-19','For Stomach Ache', 'Active'),
(4, 'Citirizine', 50, '2022-05-19','For allergy', 'Active'),
(5, 'Salbutamol', 50, '2022-05-19','For Cough and Asthma', 'Active'),
(6, 'Alcohol', 10, '2022-05-19','samplee', 'Active');

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
(0, 'Marc Pabico', '09980368786', 0, 'marc', '123456789', 'Active', 'MBBS', 5);

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
  `loginid` int(10) NOT NULL,
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
(6, 'Brylle Barcoma', '2022-05-19', '06:56:29', 'Bonbon', '09980368786', 'Carcar City', '1144', 1177140, '123456789', 'B+', 'Male', '1999-10-15', 'Active'),
(7, 'Mienzan Artizuela', '2022-05-19', '07:02:48', 'West Poblacion', '09551793271', 'City of Naga', '', 1177141, '123456789', '', 'Female', '1999-12-01', 'Active'),
(8, 'Rio Menor', '2022-05-19', '07:11:10', 'Central Poblacion', '09124710024', 'City of Naga', '', 1177142, '123456789', '', 'Male', '1998-02-02', 'Active'),
(9, 'Mark Badian', '2022-05-19', '07:16:36', 'Pitalo', '09454379315', 'San Fernando', '', 1177143, '123456789', '', 'Male', '1998-12-17', 'Active'),
(11, 'Jeff Panares', '2022-05-19', '07:25:37', 'West', '09454371654', 'Naga', '', 1177144, '123456789', '', 'Male', '1997-12-19', 'Active'),
(12, 'Christian Rojas', '2022-06-15', '07:36:29', 'West', '6219559', 'Naga', '', 1177145, '123456789', '', 'Male', '1999-10-19', 'Active'),
(13, 'John Cabanes', '2022-06-17', '11:38:05', 'Tabtoy', '121548415552', 'Talisay City', '', 1177146, '123456789', '', 'Male', '1999-12-15', 'Active'),
(14, 'Rodgen Canlum', '2022-06-15', '17:43:33', 'North', '11123666548', 'City of Naga', '', 1177147, '123456789', '', 'Male', '1999-06-17', 'Active'),
(15, 'Steven Coronado', '2022-06-02', '18:56:08', 'Sangat', '2156405325', 'San Fernando', '', 1177148, '123456789', '', 'Male', '1999-06-16', 'Active'),
(16, 'Steven Aiferez', '2022-06-14', '02:46:29', 'North', '12421513531', 'Naga', '', 1177149, '12345678', '', 'Male', '1999-05-20', 'Active'),
(17, 'Glenn Trinidad', '2022-07-08', '05:25:23', 'North', '12456575', 'Naga', '', 1177150, '123456789', '', 'Male', '1994-08-20', 'Active'),
(18, 'Joey Ventulan', '2022-07-15', '05:28:19', 'West', '115648919', 'Naga', '', 1188140, '123456789', '', 'Male', '2022-05-20', 'Active'),
(19, 'Glezel Urot', '2022-07-13', '05:29:54', 'West', '3125642156', 'Naga', '', 1188141, '123456789', '', 'Female', '2011-08-20', 'Active'),
(20, 'Jineasel Seguisabal', '2022-07-08', '09:40:18', 'Bonbon', '1234578945', 'Carcar City', '', 1188142, '123456789', '', 'Female', '1996-06-12', 'Active'),
(21, 'Jemaima Maghanoy', '2022-07-08', '11:12:42', 'Bonbon', '451984619', 'Carcar City', '', 1188143, '123456789', '', 'Female', '1972-10-30', 'Active'),
(22, 'Christian Bastismo', '2022-08-10', '11:15:20', 'Bonbon', '544619', 'Carcar City', '', 1188144, '123456789', '', 'Male', '1999-10-08', 'Active'),
(23, 'Rona Moncao', '2022-08-18', '12:46:21', 'Pitalo', '23156415', 'San Fernando', '', 1188145, '123456789', '', 'Female', '2022-07-08', 'Active'),
(24, 'Stael Steven', '2022-08-16', '15:22:24', 'Pitalo', '126210591451', 'San Fernando', '0169', 1188146, '123456789', 'A+', 'Male', '2012-12-02', 'Active'),
(25, 'Yanyan Alfente', '2022-08-11', '15:33:49', 'Sangat', '16542165', 'San Fernando', '', 1188147, '123456789', '', 'Female', '2022-07-10', 'Active'),
(26, 'Aljie Bacatio', '2022-08-23', '06:00:50', 'Sangat', '126541591', 'San Fernando', '', 1188148, '123456789', '', 'Female', '2007-10-11', 'Active'),
(27, 'Bituin Villarta', '2022-09-15', '06:11:57', 'Sangat', '156461952', 'San Fernando', '1045', 1188149, '123456789', 'A+', 'Female', '1995-05-11', 'Active'),
(28, 'Mark Gil', '2022-09-15', '07:35:07', 'Bonbon', '1243113413', 'Carcar City', '', 1188150, '12345678', '', 'Female', '2004-05-11', 'Active'),
(29, 'Genesis Fuerzas', '2022-09-13', '08:01:35', 'Bonbon', '15615616231', 'Carcar City', '0637', 1188999, '123456789', 'A+', 'Male', '2005-06-11', 'Active'),
(30, 'Judy Unabia', '2022-09-19', '11:03:53', 'Tabtoy', '09980368786', 'Talisay City', '', 1122333, '123456789', '', 'Female', '2015-02-12', 'Active');

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

-- --------------------------------------------------------

--
-- Table structure for table `prescription_records`
--

CREATE TABLE `prescription_records` (
  `prescription_record_id` int(10) NOT NULL,
  `prescription_id` int(10) NOT NULL,
  `medicine_name` varchar(25) NOT NULL,
  `cost` int(10) NOT NULL,
  `unit` int(10) NOT NULL,
  `dosage` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `treatmentid` int(10) NOT NULL,
  `treatmenttype` varchar(25) NOT NULL,
  `note` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `treatment`
--

INSERT INTO `treatment` (`treatmentid`, `treatmenttype`, `note`, `status`) VALUES
(21, 'Weight', 'Measurement is a must', 'Active'),
(22, 'Height', 'Measurement is a must', 'Active'),
(23, 'Temperature', 'Measures your temp. according to your condition', 'Active'),
(24, 'Blood Pressure', 'We Measure your BP. according to your condition.', 'Active');

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
(15, 21, 35, 6, 0, 'Imong Weight kay 5 feet 5 inches', '2100150252', '2022-07-14', '00:01:00', 'Active');

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
  MODIFY `appointmentid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `departmentid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `medicineid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `nurse`
--
ALTER TABLE `nurse`
  MODIFY `nurseid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `patientid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `prescriptionid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `prescription_records`
--
ALTER TABLE `prescription_records`
  MODIFY `prescription_record_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
  MODIFY `treatmentid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `treatment_records`
--
ALTER TABLE `treatment_records`
  MODIFY `treatment_records_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
