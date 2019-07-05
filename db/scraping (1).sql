-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2016 at 10:54 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `scraping`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE IF NOT EXISTS `account` (
`account_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `is_active` bit(1) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`account_id`, `username`, `password`, `is_active`, `created_datetime`, `update_datetime`) VALUES
(4, 'admin', '21232f297a57a5a743894a0e4a801fc3', b'1', '2016-01-19 06:33:34', '2016-01-19 06:33:34');

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE IF NOT EXISTS `brand` (
`brand_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `is_active` bit(1) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brand_id`, `name`, `is_active`, `created_datetime`, `update_datetime`) VALUES
(1, 'Casio', b'1', '2016-02-12 05:19:33', '2016-01-19 08:13:05'),
(2, 'Alexander Christie', b'1', '2016-02-12 05:19:59', '2016-02-12 05:19:59'),
(3, 'Citizen', b'1', '2016-02-12 05:21:47', '2016-02-12 05:21:47'),
(4, 'Alba', b'1', '2016-02-12 05:21:47', '2016-02-12 05:21:47'),
(5, 'Daniel Welington', b'1', '2016-02-12 05:21:47', '2016-02-12 05:21:47'),
(6, 'Seiko', b'1', '2016-02-12 05:21:47', '2016-02-12 05:21:47'),
(7, 'Bonia', b'1', '2016-02-12 05:21:47', '2016-02-12 05:21:47'),
(8, 'Rolex', b'1', '2016-02-12 05:21:47', '2016-02-12 05:21:47'),
(9, 'Aiger', b'1', '2016-02-12 05:21:47', '2016-02-12 05:21:47'),
(10, 'Guess', b'1', '2016-02-12 05:21:47', '2016-02-12 05:21:47'),
(11, 'Swiss Armi', b'1', '2016-02-12 05:21:47', '2016-02-12 05:21:47'),
(12, 'Police', b'1', '2016-02-12 05:21:47', '2016-02-12 05:21:47'),
(13, 'Puma', b'1', '2016-02-12 05:21:47', '2016-02-12 05:21:47');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
`category_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `is_active` bit(1) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `name`, `is_active`, `created_datetime`, `update_datetime`) VALUES
(1, 'Jam Pria', b'1', '2016-02-12 05:17:28', '2016-01-19 08:14:16'),
(2, 'Jam Wanita', b'1', '2016-02-12 05:18:17', '2016-02-12 05:18:17'),
(3, 'No Category', b'1', '2016-02-12 05:18:17', '2016-02-12 05:18:17');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `product_id` binary(16) NOT NULL,
  `name` varchar(50) NOT NULL,
  `scraping_link_id` int(11) NOT NULL,
  `link` text NOT NULL,
  `image` text NOT NULL,
  `price` varchar(20) NOT NULL,
  `old_price` varchar(20) NOT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `description` text NOT NULL,
  `is_active` bit(1) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rproduct`
--

CREATE TABLE IF NOT EXISTS `rproduct` (
`rproduct_id` int(11) NOT NULL,
  `rimage` varchar(225) NOT NULL,
  `rlink` varchar(225) NOT NULL,
  `rproduct` varchar(225) NOT NULL,
  `rbrand` varchar(225) NOT NULL,
  `rsource` varchar(225) NOT NULL,
  `rprice` varchar(225) NOT NULL,
  `due_date` date NOT NULL,
  `note` varchar(255) NOT NULL,
  `created_datetime` datetime NOT NULL,
  `update_datetime` datetime NOT NULL,
  `is_active` bit(1) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rproduct`
--

INSERT INTO `rproduct` (`rproduct_id`, `rimage`, `rlink`, `rproduct`, `rbrand`, `rsource`, `rprice`, `due_date`, `note`, `created_datetime`, `update_datetime`, `is_active`) VALUES
(8, 'http://id-live-03.slatic.net/p/puma-jam-tangan-pria-abu-kuning-strap-kanvas-pu103641001-9466-7712491-1-catalog_233.jpg?233_resize=1', 'http://www.lazada.co.id/puma-jam-tangan-pria-abu-kuning-strap-kanvas-pu103641001-1942177.html', 'Puma - Jam Tangan Pria - ', 'Puma', 'Lazada', 'Rp 1.007.908', '2016-05-01', 'Note', '2016-03-02 08:27:30', '2016-03-02 08:44:07', b'0'),
(9, 'https://mm-storage-prod.s3.amazonaws.com/49232_XWJ00030000000954_1_puma-jam-tangan-pria-hitam-karet-strap-pu103911001.jpeg', '/puma-jam-tangan-pria-hitam-karet-strap-pu103911001-423136.html', 'Puma Jam Tangan Pria Hita', 'Puma', 'Mataharimall', 'Rp 1.061.000', '2016-03-10', 'Note', '2016-03-02 08:27:37', '2016-03-03 16:10:29', b'1'),
(10, 'http://id-live-02.slatic.net/p/puma-pu911151001-jam-tangan-pria-hitam-rubber-6699-452588-1-catalog_233.jpg?233_resize=1', 'http://www.lazada.co.id/puma-pu911151001-jam-tangan-pria-hitam-rubber-885254.html', 'Puma PU911151001 - Jam Ta', 'Puma', 'Lazada', 'Rp 1.124.000', '2016-03-01', 'Note', '2016-03-02 08:27:43', '2016-03-02 08:27:43', b'1'),
(11, 'http://id-live-02.slatic.net/p/puma-jam-tangan-pria-karet-merah-pu103931001-7521-3984712-1-catalog_233.jpg?233_resize=1', 'http://www.lazada.co.id/puma-jam-tangan-pria-karet-merah-pu103931001-2174893.html', 'Puma - Jam Tangan Pria - ', 'Puma', 'Lazada', 'Rp 1.300.000', '2016-03-01', 'Note', '2016-03-02 08:27:54', '2016-03-02 08:27:54', b'1'),
(12, 'http://www.machtwatch.co.id/images/product/puma/PU101411002/PU101411002.jpg', 'http://www.machtwatch.co.id/puma-pu101411002-49331.html', 'PUMA PU101411002', 'Puma', 'Machtwatch', 'Rp 1.372.000', '2016-03-15', 'Note', '2016-03-02 08:28:00', '2016-03-02 12:10:02', b'1'),
(13, 'http://www.machtwatch.co.id/images/product/puma/PU103291001/PU103291001.jpg', 'http://www.machtwatch.co.id/puma-pu103291001-49641.html', 'PUMA PU103291001', 'Puma', 'Machtwatch', 'Rp 795.000', '2016-03-01', 'Note', '2016-03-02 08:28:06', '2016-03-02 08:28:06', b'1'),
(14, 'http://www.machtwatch.co.id/images/product/puma/PU102582002/PU102582002.jpg', 'http://www.machtwatch.co.id/puma-pu102582002-49503.html', 'PUMA PU102582002', 'Puma', 'Machtwatch', 'Rp 791.000', '2016-03-01', 'Note', '2016-03-02 08:28:12', '2016-03-02 08:28:12', b'1'),
(15, 'http://www.machtwatch.co.id/images/product/puma/PU103761004/PU103761004.jpg', 'http://www.machtwatch.co.id/puma-pu103761004-52861.html', 'PUMA PU103761004', 'Puma', 'Machtwatch', 'Rp 761.250', '2016-03-09', 'Note', '2016-03-02 08:28:19', '2016-03-02 08:44:53', b'1'),
(16, 'http://www.radatime.co.id/image/cache/product/citizen/BI1022-51P-240x300.jpg', 'http://www.radatime.co.id/jam-tangan-pria-citizen--bi1022-51p?path=59', ' CITIZEN Quartz BI1022-51', 'Citizen', 'Radatime', 'Rp 1.200.000', '2016-03-01', 'Note', '2016-03-02 08:28:37', '2016-03-02 08:28:37', b'0'),
(17, 'http://www.radatime.co.id/image/cache/product/citizen/BI5012-53P-240x300.jpg', 'http://www.radatime.co.id/jam-tangan-pria-citizen--bi5012-53p?path=59', ' CITIZEN Gold Tone Crysta', 'Citizen', 'Radatime', 'Rp 1.425.000', '2016-03-24', 'Note', '2016-03-02 08:28:43', '2016-03-02 08:45:00', b'1'),
(18, 'http://id-live-03.slatic.net/p/citizen-luxwatch-jam-tangan-wanita-strap-stainless-steel-silver-ctz46-8060-4928754-1-catalog_233.jpg?233_resize=1', 'http://www.lazada.co.id/citizen-luxwatch-jam-tangan-wanita-strap-stainless-steel-silver-ctz46-4578294.html', 'Citizen Luxwatch Jam Tang', 'Citizen', 'Lazada', 'Rp 1.560.412', '2016-03-01', 'Note', '2016-03-02 08:28:51', '2016-03-02 08:28:51', b'1'),
(19, 'http://id-live-01.slatic.net/p/citizen-jam-tangan-wanita-silver-strap-stainless-steel-fb1200-51e-0558-636859-1-catalog_233.jpg?233_resize=1', 'http://www.lazada.co.id/citizen-jam-tangan-wanita-silver-strap-stainless-steel-fb1200-51e-958636.html', 'Citizen Jam Tangan Wanita', 'Citizen', 'Lazada', 'Rp 3.974.400', '2016-03-01', 'Note', '2016-03-02 08:28:57', '2016-03-02 08:28:57', b'1'),
(20, 'http://id-live-02.slatic.net/p/alba-jam-tangan-wanita-gold-stainless-steel-ah7h80-5687-9438985-1-catalog_233.jpg?233_resize=1', 'http://www.lazada.co.id/alba-jam-tangan-wanita-gold-stainless-steel-ah7h80-5898349.html', 'Alba - Jam Tangan Wanita ', 'Alba', 'Lazada', 'Rp 1.000.000', '2016-04-08', 'gjhk', '2016-03-02 12:09:32', '2016-03-02 12:09:32', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `scraping_link`
--

CREATE TABLE IF NOT EXISTS `scraping_link` (
`scraping_link_id` int(11) NOT NULL,
  `web_source_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `link` text NOT NULL,
  `scrape_time` int(11) NOT NULL,
  `set_scrape_time` bit(1) NOT NULL,
  `is_scraping` bit(1) NOT NULL,
  `Note` text NOT NULL,
  `is_active` bit(1) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `scraping_link`
--

INSERT INTO `scraping_link` (`scraping_link_id`, `web_source_id`, `brand_id`, `category_id`, `link`, `scrape_time`, `set_scrape_time`, `is_scraping`, `Note`, `is_active`, `created_datetime`, `update_datetime`) VALUES
(2, 1, 1, 1, 'http://www.radatime.co.id/jam-tangan-pria?filter_brand=106&stock=1&limit=200', 50, b'0', b'0', 'Rada Time Jam Tangan Casio', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(3, 1, 2, 1, 'http://www.radatime.co.id/jam-tangan-pria?filter_brand=103&stock=1&limit=200', 50, b'0', b'0', 'Rada Time Jam Casio', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(4, 1, 2, 2, 'http://www.radatime.co.id/jam-tangan-wanita?filter_brand=103&stock=1&limit=200', 50, b'0', b'0', 'Rada Time Jam Alexander Christie', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(5, 1, 3, 1, 'http://www.radatime.co.id/jam-tangan-pria?filter_brand=110&stock=1&limit=200', 50, b'0', b'0', 'Rada Time Jam Tangan Citizen', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(6, 1, 4, 2, 'http://www.radatime.co.id/jam-tangan-wanita?filter_brand=102&stock=1&limit=200', 50, b'0', b'0', 'Rada Time Jam Tangan Alba', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(7, 1, 6, 1, 'http://www.radatime.co.id/jam-tangan-pria?filter_brand=124&stock=1&limit=200', 50, b'0', b'0', 'Rada Time Jam Tangan Seiko', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(8, 1, 6, 2, 'http://www.radatime.co.id/jam-tangan-wanita?filter_brand=124&stock=1&limit=200', 50, b'0', b'0', 'Rada Time Jam Tangan Seiko', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(9, 1, 6, 2, 'http://www.radatime.co.id/jam-tangan-wanita?filter_brand=124&stock=1&limit=200', 50, b'0', b'0', 'Rada Time Jam Tangan Seiko', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(10, 1, 7, 2, 'http://www.radatime.co.id/jam-tangan-wanita?filter_brand=104&stock=1&limit=200', 50, b'0', b'0', 'Rada Time Jam Tangan Bonia', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(11, 1, 9, 2, 'http://www.radatime.co.id/jam-tangan-wanita?filter_brand=101&stock=1&limit=200', 50, b'0', b'0', 'Rada Time Jam Tangan Aiger', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(12, 1, 10, 2, 'http://www.radatime.co.id/jam-tangan-wanita?filter_brand=116&stock=1&limit=200', 50, b'0', b'0', 'Rada Time Jam Tangan Guess', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(13, 1, 12, 1, 'http://www.radatime.co.id/jam-tangan-police&stock=1&limit=200', 50, b'0', b'0', 'Rada Time Jam Tangan Police', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(14, 2, 4, 1, 'http://www.machtwatch.co.id/jam-tangan-pria/alba/?sort=0&page=', 50, b'0', b'0', 'Mach Watch Jam tangan Alba', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(15, 2, 4, 2, 'http://www.machtwatch.co.id/jam-tangan-wanita/alba/?sort=0&page=', 50, b'0', b'0', 'Mach Watch Jam tangan Alba', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(16, 2, 1, 1, 'http://www.machtwatch.co.id/jam-tangan-pria/casio/?sort=0&page=', 50, b'0', b'0', 'Mach Watch Jam tangan Casio', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(17, 2, 1, 2, 'http://www.machtwatch.co.id/jam-tangan-wanita/casio/?sort=0&page=', 50, b'0', b'0', 'Mach Watch Jam tangan Casio', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(18, 2, 5, 1, 'http://www.machtwatch.co.id/jam-tangan-pria/daniel-wellington/?sort=0&page=', 50, b'0', b'0', 'Mach Watch Jam tangan Daniel Welington', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(19, 2, 5, 2, 'http://www.machtwatch.co.id/jam-tangan-wanita/daniel-wellington/?sort=0&page=', 50, b'0', b'0', 'Mach Watch Jam tangan Daniel Welington', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(20, 2, 6, 1, 'http://www.machtwatch.co.id/jam-tangan-pria/seiko/?sort=0&page=', 50, b'0', b'0', 'Mach Watch Jam tangan Seiko', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(21, 2, 6, 2, 'http://www.machtwatch.co.id/jam-tangan-wanita/seiko/?sort=0&page=', 50, b'0', b'0', 'Mach Watch Jam tangan Seiko', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(22, 2, 9, 1, 'http://www.machtwatch.co.id/jam-tangan-pria/aigner/?sort=0&page=', 50, b'0', b'0', 'Mach Watch Jam tangan Alba', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(23, 2, 9, 2, 'http://www.machtwatch.co.id/jam-tangan-wanita/aigner/?sort=0&page=', 50, b'0', b'0', 'Mach Watch Jam tangan Aigner', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(24, 2, 12, 1, 'http://www.machtwatch.co.id/jam-tangan-pria/police/?sort=0&page=', 50, b'0', b'0', 'Mach Watch Jam tangan Police', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(25, 2, 12, 2, 'http://www.machtwatch.co.id/jam-tangan-wanita/police/?sort=0&page=', 50, b'0', b'0', 'Mach Watch Jam tangan Police', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(26, 2, 13, 1, 'http://www.machtwatch.co.id/jam-tangan-pria/puma/?sort=0&page=', 50, b'0', b'0', 'Mach Watch Jam tangan Puma', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(27, 2, 13, 2, 'http://www.machtwatch.co.id/jam-tangan-wanita/puma/?sort=0&page=', 50, b'0', b'0', 'Mach Watch Jam tangan Puma', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(28, 3, 9, 1, 'https://www.mataharimall.com/p-534/jam-tangan-pria?per_page=125&fq=brand_name:aigner&page=', 50, b'0', b'0', 'Matahari mall jam tangan Aiger', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(29, 4, 7, 2, 'http://www.lazada.co.id/beli-jam-tangan-wanita/bonia/?itemperpage=200&page=', 50, b'0', b'0', 'Lazada Jama tangan Bonia', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(30, 5, 1, 3, 'http://www.rakuten.co.id/category/343/?b=203&h=3&p=', 50, b'0', b'0', 'Rakuten Jam Tangan Casio', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(31, 4, 1, 2, 'http://www.lazada.co.id/beli-jam-tangan-wanita/casio/?itemperpage=200&page=', 50, b'0', b'0', 'Lazada Jama tangan Casio', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(32, 3, 1, 1, 'https://www.mataharimall.com/p-534/jam-tangan-pria?per_page=125&fq=brand_name:casio&page=', 50, b'0', b'0', 'Matahari mall jam tangan Casio', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(33, 3, 2, 1, 'https://www.mataharimall.com/p-534/jam-tangan-pria?per_page=125&fq=brand_name:alexandre+christie&page=', 50, b'0', b'0', 'Matahari mall jam tangan Alexander Christie', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(34, 3, 3, 1, 'https://www.mataharimall.com/p-534/jam-tangan-pria?per_page=125&fq=brand_name:citizen&page=', 50, b'0', b'0', 'Matahari mall jam tangan Citizen', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(35, 3, 4, 1, 'https://www.mataharimall.com/p-534/jam-tangan-pria?per_page=200&fq=brand_name:alba&page=', 50, b'0', b'0', 'Matahari mall jam tangan Alba', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(36, 3, 5, 1, 'https://www.mataharimall.com/p-534/jam-tangan-pria?per_page=125&fq=brand_name:daniel+wellington&page=', 50, b'0', b'0', 'Matahari mall jam tangan Daniel Welington', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(37, 3, 6, 1, 'https://www.mataharimall.com/p-534/jam-tangan-pria?per_page=125&fq=brand_name:seiko&page=', 50, b'0', b'0', 'Matahari mall jam tangan Seiko', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(38, 3, 7, 1, 'https://www.mataharimall.com/p-534/jam-tangan-pria?per_page=125&fq=brand_name:bonia&page=', 50, b'0', b'0', 'Matahari mall jam tangan Bonia', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(39, 3, 10, 1, 'https://www.mataharimall.com/p-534/jam-tangan-pria?per_page=125&fq=brand_name:guess&page=', 50, b'0', b'0', 'Matahari mall jam tangan Guess', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(40, 3, 11, 1, 'https://www.mataharimall.com/p-534/jam-tangan-pria?per_page=125&fq=brand_name:swiss+army&page=', 50, b'0', b'0', 'Matahari mall jam tangan Swiss Army', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(41, 3, 12, 1, 'https://www.mataharimall.com/p-534/jam-tangan-pria?per_page=125&fq=brand_name:police&page=', 50, b'0', b'0', 'Matahari mall jam tangan Police', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(42, 3, 13, 1, 'https://www.mataharimall.com/p-534/jam-tangan-pria?per_page=125&fq=brand_name:puma&page=', 50, b'0', b'0', 'Matahari mall jam tangan Puma', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(43, 3, 1, 2, 'https://www.mataharimall.com/p-541/jam-tangan-wanita?per_page=125&fq=brand_name:casio&page=', 50, b'0', b'0', 'Matahari mall jam tangan Casio', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(44, 3, 2, 2, 'https://www.mataharimall.com/p-541/jam-tangan-wanita?per_page=125&fq=brand_name:alexandre+christie&page=', 50, b'0', b'0', 'Matahari mall jam tangan Alexander Christie', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(45, 3, 3, 2, 'https://www.mataharimall.com/p-541/jam-tangan-wanita?per_page=125&fq=brand_name:citizen&page=', 50, b'0', b'0', 'Matahari mall jam tangan Citizen', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(46, 3, 4, 2, 'https://www.mataharimall.com/p-541/jam-tangan-wanita?per_page=125&fq=brand_name:alba&page=', 50, b'0', b'0', 'Matahari mall jam tangan Alba', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(47, 3, 5, 2, 'https://www.mataharimall.com/p-541/jam-tangan-wanita?per_page=125&fq=brand_name:daniel+wellington&page=', 50, b'0', b'0', 'Matahari mall jam tangan daniel wellington', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(48, 3, 6, 2, 'https://www.mataharimall.com/p-541/jam-tangan-wanita?per_page=125&fq=brand_name:seiko&page=', 50, b'0', b'0', 'Matahari mall jam tangan seiko', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(49, 3, 7, 2, 'https://www.mataharimall.com/p-541/jam-tangan-wanita?per_page=125&fq=brand_name:bonia&page=', 50, b'0', b'0', 'Matahari mall jam tangan bonia', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(50, 3, 8, 2, 'https://www.mataharimall.com/p-541/jam-tangan-wanita?per_page=125&fq=brand_name:aigner&page=', 50, b'0', b'0', 'Matahari mall jam tangan aigner', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(51, 3, 10, 2, 'https://www.mataharimall.com/p-541/jam-tangan-wanita?per_page=125&fq=brand_name:guess&page=', 50, b'0', b'0', 'Matahari mall jam tangan guess', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(52, 3, 11, 2, 'https://www.mataharimall.com/p-541/jam-tangan-wanita?per_page=125&fq=brand_name:swiss+army&page=', 50, b'0', b'0', 'Matahari mall jam tangan swiss  army', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(53, 3, 12, 2, 'https://www.mataharimall.com/p-541/jam-tangan-wanita?per_page=125&fq=brand_name:police&page=', 50, b'0', b'0', 'Matahari mall jam tangan Police', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(54, 3, 13, 2, 'https://www.mataharimall.com/p-541/jam-tangan-wanita?per_page=125&fq=brand_name:puma&page=', 50, b'0', b'0', 'Matahari mall jam tangan puma', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(55, 4, 2, 2, 'http://www.lazada.co.id/beli-jam-tangan-wanita/alexandre-christie/?itemperpage=200&page=', 50, b'0', b'0', 'Lazada  mall jam tangan alexandre-christie', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(56, 4, 3, 2, 'http://www.lazada.co.id/beli-jam-tangan-wanita/citizen/?itemperpage=200&page=', 50, b'0', b'0', 'Lazada  mall jam tangan citizen', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(57, 4, 4, 2, 'http://www.lazada.co.id/beli-jam-tangan-wanita/alba/?itemperpage=200&page=', 50, b'0', b'0', 'Lazada  mall jam tangan alba', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(58, 4, 5, 2, 'http://www.lazada.co.id/beli-jam-tangan-wanita/daniel-wellington/?itemperpage=200&page=', 50, b'0', b'0', 'Lazada  mall jam tangan daniel-wellington', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(59, 4, 6, 2, 'http://www.lazada.co.id/beli-jam-tangan-wanita/seiko/?itemperpage=200&page=', 50, b'0', b'0', 'Lazada  mall jam tangan seiko', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(60, 4, 8, 2, 'http://www.lazada.co.id/beli-jam-tangan-wanita/rolex/?itemperpage=200&page=', 50, b'0', b'0', 'Lazada jam tangan rolex', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(61, 4, 9, 2, 'http://www.lazada.co.id/beli-jam-tangan-wanita/aigner/?itemperpage=200&page=', 50, b'0', b'0', 'Lazada mall jam tangan aigner', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(62, 4, 10, 2, 'http://www.lazada.co.id/beli-jam-tangan-wanita/guess/?itemperpage=200&page=', 50, b'0', b'0', 'Lazada mall jam tangan guess', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(63, 4, 11, 2, 'http://www.lazada.co.id/beli-jam-tangan-wanita/swiss-army/?itemperpage=200&page=', 50, b'0', b'0', 'Lazada mall jam tangan swiss-army', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(64, 4, 12, 2, 'http://www.lazada.co.id/beli-jam-tangan-wanita/police/?itemperpage=200&page=', 50, b'0', b'0', 'Lazada mall jam tangan police', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(65, 4, 13, 2, 'http://www.lazada.co.id/beli-jam-tangan-wanita/puma/?itemperpage=200&page=', 50, b'0', b'0', 'Lazada mall jam tangan puma', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(66, 4, 13, 1, 'http://www.lazada.co.id/beli-jam-tangan-pria/puma/?itemperpage=200&page=', 50, b'0', b'0', 'Lazada mall jam tangan puma', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(67, 4, 1, 1, 'http://www.lazada.co.id/beli-jam-tangan-pria/casio/?itemperpage=200&page=', 50, b'0', b'0', 'Lazada mall jam tangan casio', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(68, 4, 2, 1, 'http://www.lazada.co.id/beli-jam-tangan-pria/alexandre-christie/?itemperpage=200&page=', 50, b'0', b'0', 'Lazada mall jam tangan alexandre-christie', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(69, 4, 7, 1, 'http://www.lazada.co.id/beli-jam-tangan-pria/bonia/?itemperpage=200&page=', 50, b'0', b'0', 'Lazada mall jam tangan bonia', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(70, 4, 3, 1, 'http://www.lazada.co.id/beli-jam-tangan-pria/citizen/?itemperpage=200&page=', 50, b'0', b'0', 'Lazada mall jam tangan citizen', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(71, 4, 4, 1, 'http://www.lazada.co.id/beli-jam-tangan-pria/alba/?itemperpage=200&page=', 50, b'0', b'0', 'Lazada mall jam tangan alba', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(72, 4, 5, 1, 'http://www.lazada.co.id/beli-jam-tangan-pria/daniel-wellington/?itemperpage=200&page=', 50, b'0', b'0', 'Lazada mall jam tangan daniel-wellington', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(73, 4, 6, 1, 'http://www.lazada.co.id/beli-jam-tangan-pria/seiko/?itemperpage=200&page=', 50, b'0', b'0', 'Lazada mall jam tangan seiko', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(74, 4, 8, 1, 'http://www.lazada.co.id/beli-jam-tangan-pria/rolex/?itemperpage=200&page=', 50, b'0', b'0', 'Lazada mall jam tangan rolex', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(75, 4, 9, 1, 'http://www.lazada.co.id/beli-jam-tangan-pria/aigner/?itemperpage=200&page=', 50, b'0', b'0', 'Lazada mall jam tangan aigner', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(76, 4, 10, 1, 'http://www.lazada.co.id/beli-jam-tangan-pria/guess/?itemperpage=200&page=', 50, b'0', b'0', 'Lazada mall jam tangan guess', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(77, 4, 11, 1, 'http://www.lazada.co.id/beli-jam-tangan-pria/swiss-army/?itemperpage=200&page=', 50, b'0', b'0', 'Lazada mall jam tangan swiss-army', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(78, 4, 12, 1, 'http://www.lazada.co.id/beli-jam-tangan-pria/police/?itemperpage=200&page=', 50, b'0', b'0', 'Lazada mall jam tangan police', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(79, 5, 11, 3, 'http://www.rakuten.co.id/category/343/?b=2461&h=3&p=', 50, b'0', b'0', 'Rakuten jam tangan Swiss Army', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(80, 5, 10, 3, 'http://www.rakuten.co.id/category/343/?b=442&h=3&p=', 50, b'0', b'0', 'Rakuten jam tangan Guess', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(81, 5, 4, 3, 'http://www.rakuten.co.id/category/343/?b=1222&h=3&p=', 50, b'0', b'0', 'Lazada mall jam tangan ALBA', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(82, 5, 6, 3, 'http://www.rakuten.co.id/category/343/?b=1007&h=3&p=', 50, b'0', b'0', 'Lazada mall jam tangan seiko', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(83, 5, 9, 3, 'http://www.rakuten.co.id/category/343/?b=26&h=3&p=', 50, b'0', b'0', 'Lazada mall jam tangan Aigner', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(84, 5, 12, 3, 'http://www.rakuten.co.id/category/343/?b=2408&h=3&p=', 50, b'0', b'0', 'Lazada mall jam tangan Police', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28'),
(85, 5, 13, 3, 'http://www.rakuten.co.id/category/343/?b=917&h=3&p=', 50, b'0', b'0', 'Lazada mall jam tangan puma', b'1', '2016-03-03 10:29:28', '2016-03-03 10:29:28');

-- --------------------------------------------------------

--
-- Table structure for table `scraping_log`
--

CREATE TABLE IF NOT EXISTS `scraping_log` (
`scraping_log_id` int(11) NOT NULL,
  `scraping_log` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `web_source`
--

CREATE TABLE IF NOT EXISTS `web_source` (
`web_source_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `is_active` bit(1) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `web_source`
--

INSERT INTO `web_source` (`web_source_id`, `name`, `is_active`, `created_datetime`, `update_datetime`) VALUES
(1, 'Radatime', b'1', '2016-02-29 05:25:51', '2016-01-19 04:51:48'),
(2, 'Machtwatch', b'1', '2016-02-29 05:25:55', '2016-02-12 05:23:31'),
(3, 'Mataharimall', b'1', '2016-02-29 05:26:01', '2016-02-12 05:24:38'),
(4, 'Lazada', b'1', '2016-02-29 05:25:47', '2016-02-12 05:24:38'),
(5, 'Rakuten', b'1', '2016-02-29 05:25:40', '2016-02-12 05:24:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
 ADD PRIMARY KEY (`account_id`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
 ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
 ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
 ADD PRIMARY KEY (`product_id`), ADD KEY `fk_product_1` (`scraping_link_id`);

--
-- Indexes for table `rproduct`
--
ALTER TABLE `rproduct`
 ADD PRIMARY KEY (`rproduct_id`);

--
-- Indexes for table `scraping_link`
--
ALTER TABLE `scraping_link`
 ADD PRIMARY KEY (`scraping_link_id`), ADD KEY `fk_scraping_link_1` (`web_source_id`), ADD KEY `fk_scraping_linkt_2` (`brand_id`), ADD KEY `fk_scraping_link_3` (`category_id`);

--
-- Indexes for table `scraping_log`
--
ALTER TABLE `scraping_log`
 ADD PRIMARY KEY (`scraping_log_id`);

--
-- Indexes for table `web_source`
--
ALTER TABLE `web_source`
 ADD PRIMARY KEY (`web_source_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `rproduct`
--
ALTER TABLE `rproduct`
MODIFY `rproduct_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `scraping_link`
--
ALTER TABLE `scraping_link`
MODIFY `scraping_link_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=86;
--
-- AUTO_INCREMENT for table `scraping_log`
--
ALTER TABLE `scraping_log`
MODIFY `scraping_log_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `web_source`
--
ALTER TABLE `web_source`
MODIFY `web_source_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
ADD CONSTRAINT `fk_product_1` FOREIGN KEY (`scraping_link_id`) REFERENCES `scraping_link` (`scraping_link_id`);

--
-- Constraints for table `scraping_link`
--
ALTER TABLE `scraping_link`
ADD CONSTRAINT `fk_scraping_link_1` FOREIGN KEY (`web_source_id`) REFERENCES `web_source` (`web_source_id`),
ADD CONSTRAINT `fk_scraping_link_2` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`),
ADD CONSTRAINT `fk_scraping_link_3` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
