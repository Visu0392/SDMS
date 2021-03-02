-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 30, 2019 at 06:54 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `srms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'Agastya', '12345', '2019-10-30 17:27:33'),
(2, 'Revanth', 'sriit', '2019-02-07 16:28:01'),
(3, 'vishaka', '12345', '2019-10-30 17:27:53');

-- --------------------------------------------------------
CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `student` (`id`, `UserName`, `Password`) VALUES
(1, 'Agastya', '12345'),
(2, 'Revanth', 'sriit'),
(3, 'vishaka', '12345');


--
-- Table structure for table `tblclasses`
--

CREATE TABLE `tblclasses` (
  `id` int(11) NOT NULL,
  `ClassName` varchar(80) DEFAULT NULL,
  `ClassNameNumeric` int(4) NOT NULL,
  `Section` varchar(5) NOT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblclasses`
--

INSERT INTO `tblclasses` (`id`, `ClassName`, `ClassNameNumeric`, `Section`, `CreationDate`, `UpdationDate`) VALUES
(1, 'Senior Year', 1, 'IV', '2017-06-06 16:52:33', '2019-10-30 17:33:50'),
(2, 'Freshmen', 2, 'I', '2017-06-06 17:21:20', '2019-10-30 17:34:55'),
(3, 'Sophomore', 3, 'II', '2017-08-28 19:21:05', '2019-10-30 17:34:37'),
(4, 'Junior', 4, 'III', '2017-06-07 09:20:23', '2019-10-30 17:34:10');

-- --------------------------------------------------------

--
-- Table structure for table `tblresult`
--

CREATE TABLE `tblresult` (
  `id` int(11) NOT NULL,
  `StudentId` int(11) DEFAULT NULL,
  `ClassId` int(11) DEFAULT NULL,
  `SubjectId` int(11) DEFAULT NULL,
  `marks` int(11) DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblresult`
--

INSERT INTO `tblresult` (`id`, `StudentId`, `ClassId`, `SubjectId`, `marks`, `PostingDate`, `UpdationDate`) VALUES
(2, 1, 1, 2, 100, '2017-08-24 17:54:09', '2017-08-28 18:34:32'),
(3, 1, 1, 1, 80, '2017-08-24 17:54:09', '2017-08-28 18:34:25'),
(4, 1, 1, 5, 78, '2017-08-24 17:54:09', '2017-08-28 18:34:26'),
(5, 1, 1, 4, 60, '2017-08-24 17:54:09', '2017-08-28 18:34:26'),
(6, 2, 4, 2, 90, '2017-08-28 18:38:18', NULL),
(7, 2, 4, 1, 75, '2017-08-28 18:38:18', NULL),
(8, 2, 4, 4, 56, '2017-08-28 18:38:18', '2019-02-07 16:32:14'),
(9, 2, 4, 4, 80, '2017-08-28 18:38:18', '2017-08-28 19:26:42'),
(10, 4, 1, 2, 54, '2017-08-28 18:56:21', '2019-02-07 16:32:07'),
(11, 4, 2, 1, 85, '2017-08-28 18:56:21', NULL),
(12, 4, 3, 5, 55, '2017-08-28 18:56:21', '2019-02-07 16:32:07'),
(13, 4, 4, 7, 65, '2017-08-28 18:56:21', '2019-02-07 16:32:07'),
(14, 3, 1, 2, 75, '2017-08-28 19:25:07', '2019-02-07 16:32:07'),
(15, 2, 2, 1, 56, '2017-08-28 19:25:07', '2019-02-07 16:31:32'),
(16, 1, 3, 5, 52, '2017-08-28 19:25:07', '2019-02-07 16:31:28'),
(17, 4, 4, 4, 80, '2017-08-28 19:25:07', '2019-02-07 16:31:23');

-- --------------------------------------------------------

--
-- Table structure for table `tblstudents`
--

CREATE TABLE `tblstudents` (
  `StudentId` int(11) NOT NULL,
  `StudentName` varchar(100) NOT NULL,
  `RollId` varchar(100) NOT NULL,
  `StudentEmail` varchar(100) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `DOB` varchar(100) NOT NULL,
  `ClassId` int(11) NOT NULL,
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `Status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblstudents`
--

INSERT INTO `tblstudents` (`StudentId`, `StudentName`, `RollId`, `StudentEmail`, `Gender`, `DOB`, `ClassId`, `RegDate`, `UpdationDate`, `Status`) VALUES
(1, 'Kay', '12345', 'kay@gmail.com', 'Female', '2001-02-03', 1, '2017-08-28 18:54:58', '2019-10-30 17:40:22', 1),
(2, 'Ray', '12346', 'ray@gmail.com', 'Male', '2002-02-03', 2, '2017-08-28 19:23:53', '2019-10-30 17:40:36', 1),
(3, 'Josh', '12347', 'josh@gmail.com', 'Male', '1995-03-03', 3, '2017-06-12 10:30:57', '2019-10-30 17:40:53', 1),
(4, 'Sruthi', '12348', 'sruthi@gmail.com', 'Female', '2014-08-06', 4, '2017-08-28 18:45:31', '2019-02-07 16:46:30', 1),
(5, 'Hagen', '12349', 'hagen@gmail.com', 'Male', '1995-02-02', 2, '2017-08-19 19:18:28', '2019-10-30 17:41:12', 0),
(6, 'Manasa', '245', 'mxn72627@ucmo.edu', 'Female', '2222-11-22', 1, '2019-10-30 17:28:41', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblsubjectcombination`
--

CREATE TABLE `tblsubjectcombination` (
  `id` int(11) NOT NULL,
  `ClassId` int(11) NOT NULL,
  `SubjectId` int(11) NOT NULL,
  `status` int(1) DEFAULT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `Updationdate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblsubjectcombination`
--

INSERT INTO `tblsubjectcombination` (`id`, `ClassId`, `SubjectId`, `status`, `CreationDate`, `Updationdate`) VALUES
(3, 2, 5, 1, '2017-06-07 11:16:56', '2017-06-07 11:16:56'),
(4, 1, 2, 1, '2017-06-12 06:46:32', '2017-06-12 06:46:32'),
(5, 1, 4, 1, '2017-06-12 06:46:35', '2017-06-12 06:46:35'),
(6, 1, 5, 1, '2017-06-12 06:46:40', '2017-06-12 06:46:40'),
(8, 4, 4, 1, '2017-08-26 03:21:27', '2017-08-26 03:21:27'),
(10, 4, 1, 1, '2017-08-26 03:22:05', '2017-08-26 03:22:05'),
(12, 4, 2, 1, '2017-08-26 03:22:15', '2017-08-26 03:22:15'),
(13, 4, 5, 1, '2017-08-26 03:22:20', '2017-08-26 03:22:20'),
(14, 1, 1, 1, '2017-08-28 18:44:06', '2017-08-28 18:44:06'),
(15, 2, 2, 1, '2017-08-28 18:44:12', '2017-08-28 18:44:12'),
(16, 3, 4, 1, '2017-08-28 18:44:18', '2017-08-28 18:44:18'),
(17, 4, 6, 1, '2017-08-28 18:44:23', '2017-08-28 18:44:23'),
(18, 1, 1, 1, '2017-08-28 18:53:12', '2017-08-28 18:53:12'),
(19, 2, 7, 1, '2017-08-28 18:53:19', '2017-08-28 18:53:19'),
(20, 3, 2, 1, '2017-08-28 18:53:38', '2017-08-28 18:53:38'),
(21, 4, 6, 1, '2017-08-28 18:53:44', '2017-08-28 18:53:44'),
(22, 1, 6, 0, '2017-08-28 18:53:50', '2017-08-28 18:53:50'),
(23, 2, 1, 1, '2017-08-28 19:22:25', '2017-08-28 19:22:25'),
(24, 3, 2, 1, '2017-08-28 19:22:31', '2017-08-28 19:22:31'),
(25, 4, 4, 1, '2017-08-28 19:22:36', '2017-08-28 19:22:36'),
(27, 2, 5, 0, '2017-08-28 19:22:47', '2017-08-28 19:22:47');

-- --------------------------------------------------------

--
-- Table structure for table `tblsubjects`
--

CREATE TABLE `tblsubjects` (
  `id` int(11) NOT NULL,
  `SubjectName` varchar(100) NOT NULL,
  `SubjectCode` varchar(100) NOT NULL,
  `Creationdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblsubjects`
--

INSERT INTO `tblsubjects` (`id`, `SubjectName`, `SubjectCode`, `Creationdate`, `UpdationDate`) VALUES
(1, 'Web Technologies', 'WT01', '2017-06-07 09:23:57', '2019-02-07 16:42:00'),
(2, 'C language', 'CLANG', '2017-06-07 09:24:25', '2019-02-07 16:42:00'),
(4, 'Compiler Design', 'CD01', '2017-06-07 09:36:15', '2019-02-07 16:42:01'),
(5, 'Distributed Systems', 'DS03', '2017-06-07 09:36:23', '2019-02-07 16:42:01'),
(6, 'Information Security', 'IS08', '2017-08-28 18:43:29', '2019-02-07 16:42:01'),
(7, 'Operating Systems', 'OS04', '2017-08-28 18:52:41', '2019-02-07 16:42:01'),
(8, 'Mathematical Methods', 'MM56', '2017-08-28 19:21:46', '2019-02-07 16:42:01');

--
-- Indexes for dumped tables
--





CREATE TABLE `questionpaper` (
  `subject` varchar(100) NOT NULL,
  `class` varchar(100) NOT NULL,
  `question` varchar(700) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;













--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblclasses`
--
ALTER TABLE `tblclasses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblresult`
--
ALTER TABLE `tblresult`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblstudents`
--
ALTER TABLE `tblstudents`
  ADD PRIMARY KEY (`StudentId`);

--
-- Indexes for table `tblsubjectcombination`
--
ALTER TABLE `tblsubjectcombination`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsubjects`
--
ALTER TABLE `tblsubjects`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblclasses`
--
ALTER TABLE `tblclasses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblresult`
--
ALTER TABLE `tblresult`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tblstudents`
--
ALTER TABLE `tblstudents`
  MODIFY `StudentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblsubjectcombination`
--
ALTER TABLE `tblsubjectcombination`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tblsubjects`
--
ALTER TABLE `tblsubjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
