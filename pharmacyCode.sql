-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 14, 2013 at 09:55 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pharmacy`
--
CREATE DATABASE IF NOT EXISTS `pharmacy` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `pharmacy`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` tinyint(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `pharmacist`
--

CREATE TABLE IF NOT EXISTS `pharmacist` (
  `pharmacist_id` tinyint(5) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `postal_address` varchar(50) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `email` varchar(20) NOT NULL,
  PRIMARY KEY (`pharmacist_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `pharmacist`
--

INSERT INTO `pharmacist` (`pharmacist_id`, `first_name`, `last_name`, `postal_address`, `phone`, `email`) VALUES
(1, 'ajay', 'kumar', 'Bangalore', '9111111101', 'ajay@pharmacy.com'),(2, 'bhairav', 'Sharma', 'Bangalore', '9222222202','bhairav@pharmacy.com');-- --------------------------------------------------------
ALTER TABLE `pharmacist` ADD INDEX(`first_name`);
--
-- Table structure for table `invoice`
--

CREATE TABLE IF NOT EXISTS `invoice` (
  `customer_id` int(10) NOT NULL,
  `customer_name` varchar(30) NOT NULL,
  `served_by` varchar(15) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'Unpaid',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
ALTER TABLE `invoice` ADD INDEX(`served_by`);

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`customer_id`, `customer_name`, `served_by`, `status`, `date`) VALUES
(10, 'Sagar', 'ajay', 'complete', '2020-04-10 11:19:42'),
(11, 'Jalas', 'ajay', 'complete', '2020-04-10 11:28:59'),
(12, 'Abdul', 'bhairav', 'complete', '2020-04-10 12:19:02'),
(13, 'Andre', 'ajay', 'complete', '2020-04-11 12:25:19'),
(14, 'William', 'bhairav', 'complete', '2020-04-13 12:29:38'),
(15, 'Sita', 'bhairav', 'complete', '2020-04-13 12:39:51'),
(16, 'Sameeksha', 'bhairav', 'complete', '2020-04-15 12:49:45'),
(17, 'Peter', 'ajay', 'complete', '2020-04-15 12:51:48'),
(18, 'mohit', 'ajay', 'complete', '2020-04-16 19:20:44'),
(19, 'Jay', 'ajay', 'complete', '2020-04-17 20:34:51');

--
-- Triggers `invoice`
--
DROP TRIGGER IF EXISTS `invoice_tri`;
DELIMITER //
CREATE TRIGGER `invoice_tri` AFTER INSERT ON `invoice`
 FOR EACH ROW BEGIN
     SET @date=NOW();
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_details`
--

CREATE TABLE IF NOT EXISTS `invoice_details` (
  `invoice_no` tinyint(5) NOT NULL AUTO_INCREMENT,
  `customer` int(5) NOT NULL,
  `drug` tinyint(5) NOT NULL,
  `cost` int(5) DEFAULT NULL,
  `quantity` int(5) NOT NULL,
  PRIMARY KEY (`invoice_no`),
  KEY `stocks` (`drug`),
  KEY `invoices` (`customer`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `invoice_details`
--

INSERT INTO `invoice_details` (`invoice_no`, `customer`, `drug`, `cost`, `quantity`) VALUES
(101, 10, 10, 200, 10),
(102, 11, 10, 250, 5),
(103, 18, 10, 50, 5),
(104, 15, 9, 100, 2),
(105, 10, 6, 120, 12),
(106, 16, 8, 50, 5),
(107, 12, 6, 120, 10),
(108, 13, 6, 120, 10),
(109, 17, 7, 250, 10),
(110, 19, 8, 150, 15);
-- --------------------------------------------------------

--

--
-- Table structure for table `paymenttypes`
--

CREATE TABLE IF NOT EXISTS `paymenttypes` (
  `id` tinyint(5) NOT NULL AUTO_INCREMENT,
  `Name` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
  
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `paymenttypes`
--

INSERT INTO `paymenttypes` (`id`, `Name`) VALUES
(1, 'Cash'),
(2, 'Credit card'),
(3, 'Mobile Money'),
(4, 'Cheque'),
(5, 'net banking');

-- --------------------------------------------------------

--
-- Table structure for table `prescription_details`
--

CREATE TABLE IF NOT EXISTS `prescription_details` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `drug` tinyint(5) NOT NULL,
  `strength` varchar(15) NOT NULL,
  `dose` varchar(15) NOT NULL,
  `quantity` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dsfd` (`drug`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `prescription_details`
--

INSERT INTO `prescription_details` (`id`, `drug`, `strength`, `dose`, `quantity`) VALUES
(10, 8, '15 mg', '1x3', 15),
(11, 9, '10 mg', '2x3', 20),
(12, 6, '150 mg', '2x4', 12),
(13, 10, '50 mgms', '2x3', 15),
(14, 6, '150 mg', '2x3', 10),
(15, 7, '50 mg', '2x3', 20),
(16, 8, '40 mg', '2x3', 16),
(17, 9, '15 gms', '2x3', 20),
(18, 7, '50 gms', '1X3', 15),
(19, 10, '50 gms', '1x2', 5);

-- --------------------------------------------------------

--
-- Table structure for table `receipts`
--

CREATE TABLE IF NOT EXISTS `receipts` (
  `reciptNo` int(10) NOT NULL,
  `customer_id` int(5) NOT NULL,
  `total` int(10) NOT NULL,
  `payType` tinyint(5) NOT NULL,
  `served_by` varchar(15) NOT NULL,
   PRIMARY KEY (`reciptNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Dumping data for table `receipts`
--

INSERT INTO `receipts` (`reciptNo`, `customer_id`, `total`, `payType`, `served_by`) VALUES 
(1, 12, 120, 2, 'bhairav'),
(2, 11, 250, 1, 'ajay'),
(3, 13, 120, 2, 'ajay'),
(4, 14, 105, 3, 'bhairav'),
(5, 15, 100, 1, 'bhairav'),
(6, 16, 50, 4, 'bhairav'),
(7, 17, 250, 3, 'ajay'),
(8, 18, 50, 2, 'ajay'),
(9, 19, 150, 1, 'ajay'),
(10, 10, 150, 5, 'ajay');

--
-- Triggers `receipts`
--
DROP TRIGGER IF EXISTS `receipt_tri`;
DELIMITER //
CREATE TRIGGER `receipt_tri` AFTER INSERT ON `receipts`
 FOR EACH ROW BEGIN
     SET @date=NOW();
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE IF NOT EXISTS `stock` (
  `stock_id` tinyint(5) NOT NULL AUTO_INCREMENT,
  `drug_name` varchar(20) NOT NULL,
  `description` varchar(50) NOT NULL,
  `company` varchar(20) NOT NULL,
   `quantity` int(11) NOT NULL,
    `status` enum('Available','Inavailable') NOT NULL,
  `expiry_date` date NOT NULL,
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`stock_id`, `drug_name`, `description`, `company`, `quantity`, `status`, `expiry_date`) VALUES
(10, 'Piriton','Painkiller','Sunpharma', 1000,'Available', '2020-11-30'),
(6, 'Dual Cotexin', 'Malaria', 'Clinix', 150, 'Available', '2020-11-30'),
(7, 'Naprosyn', 'Painkiller', 'Mankind', 250, 'Available', '2020-11-30'),
(8, 'Flagi', 'Digestive', 'Clinix', 657, 'Available', '2020-11-30'),
(9, 'Actal','Stomach Relieve', 'Cipla', 1000,'Available', '2020-12-06'),
(1, 'pentop','Acidity', 'Ranbaxy', 500,'Available', '2020-12-06'),
(2, 'crocin','fever', 'Clinix', 1000,'Available', '2020-12-06'),
(3, 'Albandazole','De-worming', 'Pfizer', 100,'Available', '2020-12-06'),
(4, 'levocetrizine','Allergy', 'Ranbaxy', 300,'Available', '2020-12-06'),
(5, 'Bactrium-DS','antibiotic', 'Clinix', 150,'Available', '2020-12-06');






-- --------------------------------------------------------

--
-- --
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice_details`
--
ALTER TABLE `invoice_details`
  ADD CONSTRAINT `invoices` FOREIGN KEY (`customer`) REFERENCES `invoice` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stocks` FOREIGN KEY (`drug`) REFERENCES `stock` (`stock_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prescription_details`
--
ALTER TABLE`receipts` ADD FOREIGN KEY (`customer_id`) REFERENCES `invoice`(`customer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE`receipts` ADD FOREIGN KEY (`payType`) REFERENCES `paymenttypes`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE`prescription_details` ADD FOREIGN KEY (`id`) REFERENCES `invoice`(`customer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `prescription_details` ADD FOREIGN KEY (`drug`) REFERENCES `stock`(`stock_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `pharmacist` ADD FOREIGN KEY (`first_name`) REFERENCES `invoice`(`served_by`) ON DELETE RESTRICT ON UPDATE RESTRICT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;