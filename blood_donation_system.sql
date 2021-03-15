-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2021 at 11:24 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blood donation system`
--

-- --------------------------------------------------------

--
-- Table structure for table `blood_bank`
--

CREATE TABLE `blood_bank` (
  `bb_ID` char(5) NOT NULL,
  `bb_name` varchar(15) DEFAULT NULL,
  `bb_address` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blood_bank`
--

INSERT INTO `blood_bank` (`bb_ID`, `bb_name`, `bb_address`) VALUES
('10001', 'Blood Bank 1', 'Kalabagan'),
('10002', 'Blood Bank 2', 'New Market'),
('10003', 'Blood Bank 3', 'Kathalbagan'),
('10004', 'Blood Bank 4', 'Panthapath'),
('10005', 'Blood Bank 5', 'Green Road');

-- --------------------------------------------------------

--
-- Table structure for table `donors`
--

CREATE TABLE `donors` (
  `d_name` varchar(20) DEFAULT NULL,
  `d_ID` char(8) NOT NULL,
  `blood_group` varchar(3) NOT NULL,
  `med_report` varchar(15) DEFAULT NULL,
  `address` varchar(15) DEFAULT NULL,
  `contact_no` char(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `donors`
--

INSERT INTO `donors` (`d_name`, `d_ID`, `blood_group`, `med_report`, `address`, `contact_no`) VALUES
('Elsa', '18000006', 'A+', 'ELIGIBLE', 'Kalabagan', '018xxxxx71'),
('Tak', '18000007', 'B+', 'NOT ELIGIBLE', 'New Market', '017xxxxx113'),
('Mike', '18000008', 'A+', 'ELIGIBLE', 'Panthapath', '018xxxxxx62'),
('Harvey', '18000009', 'AB+', 'ELIGIBLE', 'Kalabagan', '016xxxxxx87'),
('Elric', '18000010', 'A+', 'ELIGIBLE', 'Kathalbagan', '017xxxxx117');

-- --------------------------------------------------------

--
-- Table structure for table `donors_with_blood_bank`
--

CREATE TABLE `donors_with_blood_bank` (
  `Donor ID` char(8) NOT NULL,
  `Donor Name` varchar(20) DEFAULT NULL,
  `Donor's Blood Group` varchar(3) NOT NULL,
  `Blood Bank ID` char(5) NOT NULL,
  `Blood Bank Name` varchar(15) DEFAULT NULL,
  `Situated` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `donors_with_blood_bank`
--

INSERT INTO `donors_with_blood_bank` (`Donor ID`, `Donor Name`, `Donor's Blood Group`, `Blood Bank ID`, `Blood Bank Name`, `Situated`) VALUES
('18000006', 'Elsa', 'A+', '10001', 'Blood Bank 1', 'Kalabagan'),
('18000007', 'Tak', 'B+', '10002', 'Blood Bank 2', 'New Market'),
('18000008', 'Mike', 'A+', '10004', 'Blood Bank 4', 'Panthapath'),
('18000009', 'Harvey', 'AB+', '10001', 'Blood Bank 1', 'Kalabagan'),
('18000010', 'Elric', 'A+', '10003', 'Blood Bank 3', 'Kathalbagan');

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `h_ID` char(5) NOT NULL,
  `h_name` varchar(15) NOT NULL,
  `h_address` varchar(15) DEFAULT NULL,
  `capacity_of_blood_bags` decimal(4,0) DEFAULT NULL,
  `patient_capacity` decimal(3,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`h_ID`, `h_name`, `h_address`, `capacity_of_blood_bags`, `patient_capacity`) VALUES
('20001', 'Square', 'Panthapath', '6000', '700'),
('20002', 'Popular', 'Kathalbagan', '4500', '300'),
('20003', 'Green Life', 'Green Road', '5000', '450'),
('20004', 'Labaid', 'New Market', '5000', '600'),
('20005', 'Samorita', 'Kalabagan', '2000', '160');

-- --------------------------------------------------------

--
-- Table structure for table `hospital_blood_bank`
--

CREATE TABLE `hospital_blood_bank` (
  `Hospita ID` char(5) NOT NULL,
  `Hospital Name` varchar(15) NOT NULL,
  `Blood Bank ID` char(5) NOT NULL,
  `Blood Bank Name` varchar(15) DEFAULT NULL,
  `Situated` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hospital_blood_bank`
--

INSERT INTO `hospital_blood_bank` (`Hospita ID`, `Hospital Name`, `Blood Bank ID`, `Blood Bank Name`, `Situated`) VALUES
('20001', 'Square', '10004', 'Blood Bank 4', 'Panthapath'),
('20002', 'Popular', '10003', 'Blood Bank 3', 'Kathalbagan'),
('20003', 'Green Life', '10005', 'Blood Bank 5', 'Green Road'),
('20004', 'Labaid', '10002', 'Blood Bank 2', 'New Market'),
('20005', 'Samorita', '10001', 'Blood Bank 1', 'Kalabagan');

-- --------------------------------------------------------

--
-- Table structure for table `med_staff`
--

CREATE TABLE `med_staff` (
  `staff_ID` char(3) NOT NULL,
  `staff_name` varchar(20) DEFAULT NULL,
  `h_ID` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `med_staff`
--

INSERT INTO `med_staff` (`staff_ID`, `staff_name`, `h_ID`) VALUES
('101', 'Sam', '20001'),
('202', 'Dean', '20001'),
('203', 'Ronaldo', '20003'),
('204', 'Kane', '20002'),
('303', 'Messi', '20001');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `p_name` varchar(20) DEFAULT NULL,
  `p_ID` char(8) NOT NULL,
  `blood_group` varchar(3) NOT NULL,
  `diseases` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`p_name`, `p_ID`, `blood_group`, `diseases`) VALUES
('George', '18000001', 'A+', 'N/A'),
('Fae', '18000002', 'B+', 'Anemia'),
('Merisa', '18000003', 'O+', 'N/A'),
('Aryia', '18000004', 'A+', 'N/A'),
('Lana', '18000005', 'AB+', 'Leukemia');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blood_bank`
--
ALTER TABLE `blood_bank`
  ADD PRIMARY KEY (`bb_ID`);

--
-- Indexes for table `donors`
--
ALTER TABLE `donors`
  ADD PRIMARY KEY (`d_ID`,`contact_no`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`h_ID`);

--
-- Indexes for table `med_staff`
--
ALTER TABLE `med_staff`
  ADD PRIMARY KEY (`staff_ID`),
  ADD KEY `h_ID` (`h_ID`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`p_ID`,`blood_group`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `med_staff`
--
ALTER TABLE `med_staff`
  ADD CONSTRAINT `med_staff_ibfk_1` FOREIGN KEY (`h_ID`) REFERENCES `hospital` (`h_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
