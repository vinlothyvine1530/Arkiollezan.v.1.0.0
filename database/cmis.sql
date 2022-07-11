@ -3,7 +3,7 @@
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2022 at 04:52 AM
-- Generation Time: May 19, 2022 at 03:32 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

@ -41,7 +41,7 @@ CREATE TABLE `admin` (
--

INSERT INTO `admin` (`adminid`, `adminname`, `loginid`, `password`, `status`, `usertype`) VALUES
(1, 'Admin', 'admin', '123456789', 'Active', '');
(1, 'brylle barcoma', 'admin', '123456789', 'Active', '');

-- --------------------------------------------------------

@ -57,7 +57,7 @@ CREATE TABLE `appointment` (
  `departmentid` int(10) NOT NULL,
  `appointmentdate` date NOT NULL,
  `appointmenttime` time NOT NULL,
  `nurseid` int(100) NOT NULL,
  `nurseid` int(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `app_reason` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
@ -73,22 +73,7 @@ INSERT INTO `appointment` (`appointmentid`, `appointmenttype`, `patientid`, `roo
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
(13, '', 13, 0, 2, '2022-05-19', '17:37:00', 0, 'Approved', 'sir pwede ko pa bp?\r\n');

-- --------------------------------------------------------

@ -98,7 +83,7 @@ INSERT INTO `appointment` (`appointmentid`, `appointmenttype`, `patientid`, `roo

CREATE TABLE `department` (
  `departmentid` int(10) NOT NULL,
  `departmentname` text NOT NULL,
  `departmentname` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
@ -108,11 +93,10 @@ CREATE TABLE `department` (
--

INSERT INTO `department` (`departmentid`, `departmentname`, `description`, `status`) VALUES
(2, 'BSIT-4A-DAY', 'For Technology Student only', 'Active'),
(3, 'BSIT-4B-DAY', 'For Techology Students only', 'Active'),
(4, 'BSED-4A-DAY', 'For Education Students only', 'Active'),
(5, 'Walk-In', 'For Visitors only', 'Active'),
(6, 'BSED-MATH-4A-DAY', 'For Education Students only', 'Active');
(2, 'TechnologyDepartment', 'For Technology Student', 'Active'),
(3, 'EducationDepartment', 'For Education Students', 'Active'),
(4, 'FacultyandStaffDepartment', 'For faculty and staff only', 'Active'),
(5, 'WalkInDepartment', 'For visitors only', 'Active');

-- --------------------------------------------------------

@ -133,11 +117,10 @@ CREATE TABLE `medicine` (
--

INSERT INTO `medicine` (`medicineid`, `medicinename`, `medicinequantity`, `description`, `status`) VALUES
(2, 'Rexidol', 50, 'For Headache', 'Available'),
(3, 'Imodium', 50, 'For Stomach Ache', 'Available'),
(4, 'Citirizine', 50, 'For allergy', 'Available'),
(5, 'Salbutamol', 50, 'For Cough and Asthma', 'Available'),
(6, 'Alcohol', 10, 'samplee', 'Available');
(2, 'Rexidol', 50, 'For Headache', 'Active'),
(3, 'Imodium', 50, 'For Stomach Ache', 'Active'),
(4, 'Citirizine', 50, 'For allergy', 'Active'),
(5, 'Salbutamol', 50, 'For Cough and Asthma', 'Active');

-- --------------------------------------------------------

@ -245,19 +228,7 @@ INSERT INTO `patient` (`patientid`, `patientname`, `admissiondate`, `admissionti
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
(13, 'John Cabanes', '2022-05-19', '11:38:05', 'tabtoy', '121548415552', 'talisay City', '', 'john', '123456789', '', 'Male', '1999-12-15', 'Active');

-- --------------------------------------------------------

@ -292,12 +263,7 @@ INSERT INTO `prescription` (`prescriptionid`, `treatment_records_id`, `nurseid`,
(8, 0, 0, 7, '', 0, '2022-05-19', 'Active', 7),
(9, 0, 0, 11, '', 0, '2022-05-19', 'Active', 11),
(10, 0, 0, 12, '', 0, '2022-05-19', 'Active', 12),
(11, 0, 0, 9, '', 0, '2022-05-19', 'Active', 9),
(12, 0, 0, 6, '', 0, '2022-05-20', 'Active', 6),
(13, 0, 0, 6, '', 0, '2022-05-20', 'Active', 6),
(14, 0, 0, 21, '', 0, '2022-07-10', 'Active', 20),
(15, 0, 0, 25, '', 0, '2022-07-11', 'Active', 34),
(16, 0, 0, 25, '', 0, '2022-07-11', 'Active', 34);
(11, 0, 0, 9, '', 0, '2022-05-19', 'Active', 9);

-- --------------------------------------------------------

@ -311,7 +277,7 @@ CREATE TABLE `prescription_records` (
  `medicine_name` varchar(25) NOT NULL,
  `cost` int(10) NOT NULL,
  `unit` int(10) NOT NULL,
  `dosage` text NOT NULL,
  `dosage` varchar(25) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

@ -320,19 +286,15 @@ CREATE TABLE `prescription_records` (
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
(1, 2, '2', 0, 5, '1-1-1', 'Active'),
(2, 1, '3', 0, 1, '1-0-0', 'Active'),
(3, 3, '3', 0, 3, '1-1-1', 'Active'),
(7, 5, '4', 0, 2, '0-1-1', 'Active'),
(8, 7, '2', 0, 2, '0-1-1', 'Active'),
(9, 8, '2', 0, 2, '0-1-1', 'Active'),
(10, 9, '2', 0, 2, '0-1-1', 'Active'),
(11, 10, '2', 0, 2, '0-1-1', 'Active'),
(12, 11, '4', 0, 1, '0-0-1', 'Active');

-- --------------------------------------------------------

@ -434,15 +396,11 @@ CREATE TABLE `treatment_records` (
INSERT INTO `treatment_records` (`treatment_records_id`, `treatmentid`, `appointmentid`, `patientid`, `nurseid`, `treatment_description`, `uploads`, `treatment_date`, `treatment_time`, `status`) VALUES
(4, 21, 6, 0, 0, 'dong dong imong timbang dong kay 50kg ra', '2000503878', '2022-05-19', '12:57:00', 'Active'),
(5, 21, 6, 0, 0, 'imong timbang dong kay 50kg ra', '1087801965', '2022-05-19', '12:57:00', 'Active'),
(6, 21, 6, 0, 0, '56kg', '908479108', '2022-05-19', '13:00:00', 'Active'),
(7, 21, 7, 0, 0, 'imong timbang dae kay 100kg', '516016675', '2022-05-19', '13:03:00', 'Active'),
(6, 21, 6, 6, 0, '56kg', '908479108', '2022-05-19', '13:00:00', 'Active'),
(7, 21, 7, 7, 0, 'imong timbang dae kay 100kg', '516016675', '2022-05-19', '13:03:00', 'Active'),
(8, 21, 11, 11, 0, 'jeff imong timbang kay 60kg', '1209648695', '2022-05-19', '13:27:00', 'Active'),
(9, 22, 12, 12, 0, '5 feet 4 inches', '557304552', '2022-05-19', '13:38:00', 'Active'),
(10, 24, 9, 9, 0, 'dong imong bp kay 100 over 120 high blood ka dong pangabang nag lungon', '1873732203', '2022-05-19', '13:49:00', 'Active'),
(11, 24, 14, 0, 0, '100 over 120', '1704078413', '2022-05-19', '23:44:00', 'Active'),
(12, 23, 6, 6, 0, '35 celsius', '1308454870', '2022-05-19', '23:54:00', 'Active'),
(13, 22, 6, 6, 0, '5 feet 5 inches', '571066883', '2022-05-20', '10:56:00', 'Active'),
(14, 21, 20, 21, 0, '5 feet and 8 inches', '1885481180', '2022-07-10', '06:21:00', 'Active');
(10, 24, 9, 9, 0, 'dong imong bp kay 100 over 120 high blood ka dong pangabang nag lungon', '1873732203', '2022-05-19', '13:49:00', 'Active');

-- --------------------------------------------------------

@ -577,25 +535,25 @@ ALTER TABLE `admin`
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appointmentid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
  MODIFY `appointmentid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `departmentid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
  MODIFY `departmentid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `medicineid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
  MODIFY `medicineid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `nurse`
--
ALTER TABLE `nurse`
  MODIFY `nurseid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
  MODIFY `nurseid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `nurse_timings`
@ -613,19 +571,19 @@ ALTER TABLE `orders`
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patientid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
  MODIFY `patientid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `prescriptionid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
  MODIFY `prescriptionid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `prescription_records`
--
ALTER TABLE `prescription_records`
  MODIFY `prescription_record_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
  MODIFY `prescription_record_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `room`
@ -649,7 +607,7 @@ ALTER TABLE `treatment`
-- AUTO_INCREMENT for table `treatment_records`
--
ALTER TABLE `treatment_records`
  MODIFY `treatment_records_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
  MODIFY `treatment_records_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
