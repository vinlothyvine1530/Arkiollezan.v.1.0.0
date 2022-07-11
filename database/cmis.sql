-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2022 at 04:52 AM
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
(18, '', 18, 0, 2, '2022-05-20', '11:28:00', 0, 'Approved', 'agadhdah'),
(19, '', 20, 0, 5, '2022-07-08', '03:39:00', 8, 'Approved', 'ga lain akong lawas'),
(20, '', 21, 0, 5, '2022-07-08', '17:12:00', 0, 'Approved', 'asfascassda'),
(21, '', 22, 0, 5, '2022-07-08', '17:15:00', 0, 'Approved', 'asffsaf mamamammaa'),
(22, '', 23, 0, 5, '2022-07-08', '18:46:00', 8, 'Approved', 'asdgadg adgdagda'),
(25, '', 7, 0, 2, '2022-07-10', '05:47:00', 0, 'Approved', 'sir mo balik ki dira mag pa timbang ko'),
(27, '', 7, 0, 2, '2022-07-21', '18:43:00', 0, 'Approved', 'sir hellooooo'),
(31, '', 6, 0, 2, '2022-07-10', '06:49:00', 0, 'Approved', 'ari gud diri dong'),
(32, '', 7, 0, 2, '2022-07-30', '18:51:00', 0, 'Active', 'hello mienzan bahog nawng'),
(34, '', 25, 0, 5, '2022-07-10', '21:34:00', 0, 'Approved', 'helloooo maderpader'),
(35, '', 6, 0, 2, '2022-07-10', '21:38:00', 0, 'Active', 'ari sa diri');

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
  `description` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`medicineid`, `medicinename`, `medicinequantity`, `description`, `status`) VALUES
(2, 'Rexidol', 50, 'For Headache', 'Available'),
(3, 'Imodium', 50, 'For Stomach Ache', 'Available'),
(4, 'Citirizine', 50, 'For allergy', 'Available'),
(5, 'Salbutamol', 50, 'For Cough and Asthma', 'Available'),
(6, 'Alcohol', 10, 'samplee', 'Available');

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
(6, 'Brylle Barcoma', '2022-05-19', '06:56:29', 'Bonbon', '09980368786', 'Carcar City', '', 'brylle', '123456789', '', 'Male', '1999-10-15', 'Active'),
(7, 'Mienzan Artizuela', '2022-05-19', '07:02:48', 'West Poblacion', '09551793271', 'City of Naga', '', 'mienzan', '123456789', '', 'Female', '1999-12-01', 'Active'),
(8, 'Rio Menor', '2022-05-19', '07:11:10', 'Central Poblacion', '09124710024', 'City of Naga', '', 'rio', '123456789', '', 'Male', '1998-02-02', 'Active'),
(9, 'Mark Badian', '2022-05-19', '07:16:36', 'Pitalo', '09454379315', 'San Fernando', '', 'mark', '123456789', '', 'Male', '1998-12-17', 'Active'),
(11, 'Jeff Panares', '2022-05-19', '07:25:37', 'west', '2056219122', 'naga', '', 'jeff', '123456789', '', 'Male', '1997-12-19', 'Active'),
(12, 'Christian Rojas', '2022-05-19', '07:36:29', 'west', '6219559', 'naga', '', 'christian', '123456789', '', 'Male', '1999-10-19', 'Active'),
(13, 'John Cabanes', '2022-05-19', '11:38:05', 'tabtoy', '121548415552', 'talisay City', '', 'john', '123456789', '', 'Male', '1999-12-15', 'Active'),
(14, 'Rodgen Canlum', '2022-05-19', '17:43:33', 'naganaga', '11123666548', 'City of Naga', '', 'rodgen', '123456789', '', 'Male', '1999-06-17', 'Active'),
(15, 'Steven Coronado', '2022-05-19', '18:56:08', 'sangat', '2156405325', 'San Fernando', '', 'steven', '123456789', '', 'Male', '1999-06-16', 'Active'),
(16, 'Steven Aiferez', '2022-05-20', '02:46:29', 'naga', '12421513531', 'naga city', '', 'teban', '12345678', '', 'Male', '1999-05-20', 'Active'),
(17, 'Glenn Trinidad', '2022-05-20', '05:25:23', 'naga ', '12456575', 'naga', '', 'glenn', '123456789', '', 'Male', '1994-08-20', 'Active'),
(18, 'joey', '2022-05-20', '05:28:19', 'naga', '115648919', 'naga', '', 'joey', '123456789', '', 'Male', '2022-05-20', 'Active'),
(19, 'glezel', '2022-05-20', '05:29:54', 'naga', '3125642156', 'naga', '', 'glezel', '123456789', '', 'Female', '2011-08-20', 'Active'),
(20, 'dodong', '2022-07-08', '09:40:18', 'carcar', '1234578945', 'carcar', '', 'dodong', '123456789', '', 'Male', '1996-06-12', 'Active'),
(21, 'brilliant', '2022-07-08', '11:12:42', 'carcar', '451984619', 'carcar', '', 'brilliant', '123456789', '', 'Male', '1972-10-30', 'Active'),
(22, 'brix', '2022-07-08', '11:15:20', 'carcar', '544619', 'carcar', '', 'brix', '123456789', '', 'Male', '1999-10-08', 'Active'),
(23, 'taw', '2022-07-08', '12:46:21', 'naganaga', '23156415', 'naga', '', 'taw', '123456789', '', 'Male', '2022-07-08', 'Active'),
(24, 'Lady Veighny Rose Benedicto', '2022-07-10', '15:22:24', 'Tinaan', '126210591451', 'naga city', '0169', 'lady', '123456789', 'A+', 'FEMALE', '2012-12-02', ''),
(25, 'bentong', '2022-07-10', '15:33:49', 'carcar', '16542165', 'citycity', '', 'bentong', '123456789', '', 'MALE', '2022-07-10', 'Active');

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
(6, 0, 4, 5, '', 0, '2022-05-17', 'Active', 5),
(7, 0, 0, 6, '', 0, '2022-05-19', 'Active', 6),
(8, 0, 0, 7, '', 0, '2022-05-19', 'Active', 7),
(9, 0, 0, 11, '', 0, '2022-05-19', 'Active', 11),
(10, 0, 0, 12, '', 0, '2022-05-19', 'Active', 12),
(11, 0, 0, 9, '', 0, '2022-05-19', 'Active', 9),
(12, 0, 0, 6, '', 0, '2022-05-20', 'Active', 6),
(13, 0, 0, 6, '', 0, '2022-05-20', 'Active', 6),
(14, 0, 0, 21, '', 0, '2022-07-10', 'Active', 20),
(15, 0, 0, 25, '', 0, '2022-07-11', 'Active', 34),
(16, 0, 0, 25, '', 0, '2022-07-11', 'Active', 34);

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

--
-- Dumping data for table `prescription_records`
--

INSERT INTO `prescription_records` (`prescription_record_id`, `prescription_id`, `medicine_name`, `cost`, `unit`, `dosage`, `status`) VALUES
(1, 2, '2', 0, 5, 'every 4 hours', 'Active'),
(2, 1, '3', 0, 1, 'every 4 hours', 'Active'),
(3, 3, '3', 0, 3, 'every 4 hours', 'Active'),
(7, 5, '4', 0, 2, 'every 4 hours', 'Active'),
(8, 7, '2', 0, 2, 'every 4 hours', 'Active'),
(9, 8, '2', 0, 2, 'every 4 hours', 'Active'),
(10, 9, '2', 0, 2, 'every 4 hours', 'Active'),
(11, 10, '2', 0, 2, 'every 4 hours', 'Active'),
(12, 11, '4', 0, 1, 'every 4 hours', 'Active'),
(13, 12, '2', 0, 2, 'every 4 hours', 'Active'),
(14, 14, '2', 0, 2, '1 para buntag 1 para gabie', 'Active'),
(15, 15, '2', 0, 2, '2 ako ge hatag para imo i', 'Active'),
(16, 16, '4', 0, 1, 'inom lang usa sa usa ka adlaw ha? unya ayaw pahuway', 'Active');

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
(4, 21, 6, 0, 0, 'dong dong imong timbang dong kay 50kg ra', '2000503878', '2022-05-19', '12:57:00', 'Active'),
(5, 21, 6, 0, 0, 'imong timbang dong kay 50kg ra', '1087801965', '2022-05-19', '12:57:00', 'Active'),
(6, 21, 6, 0, 0, '56kg', '908479108', '2022-05-19', '13:00:00', 'Active'),
(7, 21, 7, 0, 0, 'imong timbang dae kay 100kg', '516016675', '2022-05-19', '13:03:00', 'Active'),
(8, 21, 11, 11, 0, 'jeff imong timbang kay 60kg', '1209648695', '2022-05-19', '13:27:00', 'Active'),
(9, 22, 12, 12, 0, '5 feet 4 inches', '557304552', '2022-05-19', '13:38:00', 'Active'),
(10, 24, 9, 9, 0, 'dong imong bp kay 100 over 120 high blood ka dong pangabang nag lungon', '1873732203', '2022-05-19', '13:49:00', 'Active'),
(11, 24, 14, 0, 0, '100 over 120', '1704078413', '2022-05-19', '23:44:00', 'Active'),
(12, 23, 6, 6, 0, '35 celsius', '1308454870', '2022-05-19', '23:54:00', 'Active'),
(13, 22, 6, 6, 0, '5 feet 5 inches', '571066883', '2022-05-20', '10:56:00', 'Active'),
(14, 21, 20, 21, 0, '5 feet and 8 inches', '1885481180', '2022-07-10', '06:21:00', 'Active');

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
  MODIFY `appointmentid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

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
  MODIFY `patientid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `prescriptionid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `prescription_records`
--
ALTER TABLE `prescription_records`
  MODIFY `prescription_record_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
  MODIFY `treatment_records_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
