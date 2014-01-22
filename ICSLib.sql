-- phpMyAdmin SQL Dump
-- version 3.5.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 15, 2014 at 12:11 PM
-- Server version: 5.5.29
-- PHP Version: 5.4.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ICSLib`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--
-- Creation: Jan 15, 2014 at 10:57 AM
--

CREATE TABLE `book` (
  `call_no` varchar(30) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `isbn/issn` varchar(30) NOT NULL,
  `book_type` varchar(20) NOT NULL,
  `description` varchar(150) NOT NULL,
  `book_status` varchar(8) NOT NULL,
  `editor` varchar(50) DEFAULT NULL,
  `publisher` varchar(50) NOT NULL,
  PRIMARY KEY (`call_no`),
  UNIQUE KEY `isbn/issn` (`isbn/issn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `librarian`
--
-- Creation: Jan 15, 2014 at 11:09 AM
--

CREATE TABLE `librarian` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `request`
--
-- Creation: Jan 15, 2014 at 11:02 AM
--

CREATE TABLE `request` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `request_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `request_status` varchar(10) NOT NULL,
  `call_no` varchar(30) NOT NULL,
  `userid_no` varchar(10) NOT NULL,
  PRIMARY KEY (`request_id`),
  KEY `call_no` (`call_no`),
  KEY `call_no_2` (`call_no`),
  KEY `userid_no` (`userid_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--
-- Creation: Jan 15, 2014 at 11:05 AM
--

CREATE TABLE `transaction` (
  `trans_id` int(11) NOT NULL AUTO_INCREMENT,
  `trans_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trans_status` varchar(10) NOT NULL,
  `fine` int(11) DEFAULT NULL,
  `due_date` date NOT NULL,
  `request_id` int(11) NOT NULL,
  PRIMARY KEY (`trans_id`),
  KEY `request_id` (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--
-- Creation: Jan 15, 2014 at 10:52 AM
--

CREATE TABLE `user` (
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `name` varchar(60) NOT NULL,
  `email` varchar(42) NOT NULL,
  `mobile_no` varchar(11) NOT NULL,
  `college` varchar(10) NOT NULL,
  `user_type` varchar(10) NOT NULL,
  `userid_no` varchar(10) NOT NULL,
  PRIMARY KEY (`userid_no`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_2` FOREIGN KEY (`userid_no`) REFERENCES `user` (`userid_no`),
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`call_no`) REFERENCES `book` (`call_no`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `request` (`request_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
