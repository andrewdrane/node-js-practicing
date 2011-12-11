-- phpMyAdmin SQL Dump
-- version 3.4.3.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 07, 2011 at 10:09 PM
-- Server version: 5.5.14
-- PHP Version: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `enka_petroleum`
--

-- --------------------------------------------------------

--
-- Table structure for table `bols`
--

DROP TABLE IF EXISTS `bols`;
CREATE TABLE IF NOT EXISTS `bols` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bol_no` int(11) unsigned NOT NULL,
  `vendor_id` smallint(6) unsigned NOT NULL,
  `total` float(8,2) unsigned NOT NULL,
  `load_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bol_no` (`bol_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bol_details`
--

DROP TABLE IF EXISTS `bol_details`;
CREATE TABLE IF NOT EXISTS `bol_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bol_id` int(11) unsigned NOT NULL,
  `product_id` smallint(6) unsigned NOT NULL,
  `product_quantity` smallint(6) unsigned NOT NULL,
  `product_cost` float(6,4) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bol_id` (`bol_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `carriers`
--

DROP TABLE IF EXISTS `carriers`;
CREATE TABLE IF NOT EXISTS `carriers` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `short_name` varchar(20) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `truck_sizes` varchar(128) DEFAULT NULL COMMENT 'i.e 9000, 9200, 10500, 12000,12500',
  `contact_person` varchar(64) DEFAULT NULL,
  `phone` char(14) DEFAULT NULL,
  `phone_ext` varchar(6) DEFAULT NULL,
  `fax` char(14) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `website_url` varchar(255) DEFAULT NULL,
  `surcharge` float(5,2) unsigned DEFAULT NULL,
  `terminal_change_fee` float(5,2) unsigned DEFAULT NULL,
  `downtime_fee` float(5,2) unsigned DEFAULT NULL,
  `balance` float(8,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `carriers`
--

INSERT INTO `carriers` (`id`, `short_name`, `name`, `truck_sizes`, `contact_person`, `phone`, `phone_ext`, `fax`, `email`, `website_url`, `surcharge`, `terminal_change_fee`, `downtime_fee`, `balance`) VALUES
(1, 'Kittery', 'Kittery Transport', '9000, 9200, 10500, 12000', 'Sam Jacoby', '207-438-9500', NULL, '207-438-9554', NULL, NULL, 0.16, 150.00, 150.00, NULL),
(2, 'CBC', 'Consolidated Bulk Carriers Corp.', '9200, 12000', 'Timur Celenk', '631-232-7174', NULL, '631-232-7167', NULL, NULL, 0.16, 200.00, 100.00, NULL),
(3, 'EBC', 'Empire Bulk Carriers, Inc.', '9200, 12000, 12500', 'Ali Kaya', '631-369-5900', NULL, '631-369-1649', NULL, NULL, 0.16, 200.00, 200.00, NULL),
(4, 'Mystic', 'Mystic Tank Lines Corp.', '9200, 12000, 12500', NULL, '800-635-3835', NULL, '718-726-7174', NULL, NULL, 0.15, 150.00, 100.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `carrier_split_charges`
--

DROP TABLE IF EXISTS `carrier_split_charges`;
CREATE TABLE IF NOT EXISTS `carrier_split_charges` (
  `carrier_id` tinyint(3) unsigned NOT NULL,
  `straight` float(5,2) unsigned NOT NULL,
  `two_way` float(5,2) unsigned NOT NULL,
  `three_way` float(5,2) unsigned NOT NULL,
  `four_way` float(5,2) unsigned NOT NULL,
  KEY `carrier_id` (`carrier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `carrier_split_charges`
--

INSERT INTO `carrier_split_charges` (`carrier_id`, `straight`, `two_way`, `three_way`, `four_way`) VALUES
(1, 0.00, 100.00, 150.00, 200.00),
(2, 0.00, 100.00, 150.00, 225.00),
(3, 0.00, 75.00, 200.00, 250.00),
(4, 0.00, 75.00, 175.00, 225.00);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `_login` varchar(255) DEFAULT NULL,
  `_pass` varchar(255) DEFAULT NULL,
  `pricing_level` tinyint(4) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` char(14) NOT NULL,
  `fax` char(14) DEFAULT NULL,
  `balance` float DEFAULT NULL,
  `owner_name` varchar(255) NOT NULL,
  `owner_mobile` char(14) DEFAULT NULL,
  `owner_email` varchar(64) NOT NULL,
  `tank_capacity` int(11) unsigned DEFAULT NULL,
  `notes` text NOT NULL,
  `group_id` mediumint(6) DEFAULT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '0 = inactive, 1 = Active',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `_login`, `_pass`, `pricing_level`, `name`, `address`, `phone`, `fax`, `balance`, `owner_name`, `owner_mobile`, `owner_email`, `tank_capacity`, `notes`, `group_id`, `active`, `created`) VALUES
(1, NULL, NULL, NULL, 'Express S/S', '600 Tulip Ave, Floral Park, NY', '631-425-8695', NULL, NULL, 'Oscar Myer', NULL, 'oscar_myer@hotmail.com', 14000, 'NL capacity 4000 SNL capacity 6000 LSD capacity 4000', NULL, 1, '2011-07-25 00:48:21'),
(2, NULL, NULL, NULL, 'Gulf S/S', '195 E. Hoffman Ave, Lindenhurst, NY', '516-987-5433', NULL, NULL, 'Bekir Sayin', NULL, 'bekirsayin@hotmail.com', 15000, 'NL capacity 5000 SNL capacity 5000 LSD capacity 5000', NULL, 1, '2011-07-25 00:48:21'),
(3, NULL, NULL, NULL, 'NoName', '1901 Deer Park Ave, Deerpark, NY', '516-666-5544', NULL, NULL, 'Raj Patel', NULL, 'rpatel@hotmail.com', 28000, 'NL capacity 10,000\r\nSNL capacity 10,000\r\nLSD capacity 8,000', NULL, 1, '2011-07-25 02:57:27'),
(4, NULL, NULL, NULL, 'JETCO S/S', '698 Montauk Hgwy, Bayport, NY', '516-666-5544', NULL, NULL, 'Raj Patel', NULL, 'rpatel@hotmail.com', 30000, 'NL capacity 10,000\r\nSNL capacity 10,000\r\nLSD capacity 10,000', NULL, 1, '2011-07-25 02:57:40'),
(5, NULL, NULL, NULL, 'Delta S/S', '356 Fulton St, Farmingdale, NY', '631-717-1234', NULL, NULL, 'Husni Mobarak', NULL, 'husnim@yahoo.com', 20000, 'NL capacity 6,000\r\nNL capacity 6,000\r\nSNL capacity 3,000\r\nLSD capacity 5,000', NULL, 1, '2011-07-25 03:00:00'),
(6, NULL, NULL, NULL, 'USA S/S', '3880 Longbeach Rd, Island Park, NY', '516-978-3452', NULL, NULL, 'Vinal Kumar', NULL, 'vinal_kumar@gmail.com', 25000, 'NL capacity 5,000\r\nNL capacity 5,000\r\nPL capacity 5,000\r\nSNL capacity 6,000\r\nLSD capacity 6,000', NULL, 1, '2011-07-25 03:02:33'),
(7, NULL, NULL, NULL, 'Delta S/S', '511 Fulton St, Farmingdale, NY', '516-345-7255', NULL, NULL, 'Husni Mobarak', NULL, 'husnim@yahoo.com', 12000, 'NL capacity 6,000\r\nSNL capacity 6,000', NULL, 1, '2011-07-25 03:04:12'),
(8, NULL, NULL, NULL, 'Gulf S/S', '570 Hicksville Rd, N. Massapequa, NY', '516-466-5441', NULL, NULL, 'Ahmad Ucar', NULL, 'au1210@hotmail.com', 18000, 'NL capacity 6000\r\nSNL capacity 6000\r\nLSD capacity 6000', NULL, 1, '2011-07-25 03:10:22'),
(9, NULL, NULL, NULL, 'Gulf S/S', '3818 Rt 27, Seaford, NY', '718-345-9088', NULL, NULL, 'Tariq Azizi', NULL, 'taraz@yahoo.com', 24000, 'NL capacity 10,000\r\nSNL capacity 10,000\r\nLSD capacity 4,000', NULL, 1, '2011-07-25 03:10:22'),
(10, NULL, NULL, NULL, 'Citgo S/S', '415 Flanders Rd, Flanders, NY', '631-515-8745', NULL, NULL, 'Orhan Kir', NULL, 'okir@cablevision.net', NULL, '', NULL, 1, '2011-07-25 03:14:01'),
(11, NULL, NULL, NULL, 'Gulf S/S', '451 Main St, Patchogue, NY', '631-456-1275', NULL, NULL, 'Ali Aqbar', NULL, 'alia@hotmail.com', NULL, '', NULL, 1, '2011-07-25 03:14:01'),
(12, NULL, NULL, NULL, 'USA S/S', '62 Bayshore Rd, Bayshore, NY', '718-331-7900', NULL, NULL, 'Akin Toprak', NULL, 'akintop@aol.com', NULL, '', NULL, 1, '2011-07-25 03:15:04'),
(13, NULL, NULL, NULL, 'Americas S/S', '86 E. Sunrise Highway, Lindenhurst, NY', '631-315-9712', NULL, NULL, 'Bekir Sayin', NULL, 'bekirsayin@gmail.com', NULL, '', NULL, 1, '2011-07-25 03:16:47'),
(14, NULL, NULL, NULL, 'USA S/S', '245 Linden Blvd, Elmont, NY', '516-987-3456', NULL, NULL, 'Husnu Simsir', NULL, 'husnusim@yahoo.com', NULL, '', NULL, 1, '2011-07-25 03:19:46'),
(15, NULL, NULL, NULL, 'USA S/S', '275 E. Merrick Rd, Valley Stream, NY', '631-456-7512', NULL, NULL, 'Oscar Myer', NULL, 'oscar_myer@hotmail.com', NULL, '', NULL, 1, '2011-07-25 03:19:46'),
(16, NULL, NULL, NULL, 'Gulf S/S', '1290 New York Ave, Huntington Station, NY', '631-255-7665', NULL, NULL, 'Banu  Enes', NULL, 'banu1216@hotmail.com', NULL, '', NULL, 1, '2011-07-25 03:23:33'),
(17, NULL, NULL, NULL, 'Gulf S/S', '1069 RT 111, Islip, NY', '', NULL, NULL, 'Gunduz Aksehirli', NULL, 'gunduza@gmail.com', NULL, '', NULL, 1, '2011-07-25 03:23:33'),
(18, NULL, NULL, NULL, 'Express S/S', '1034 RT 111, Islip, NY', '917-314-5522', NULL, NULL, 'Jack Silva', NULL, 'jsilva@hotmail.com', 40000, 'NL capacity 12000\r\nNL capacity 12000\r\nSNL capacity 8000\r\nLSD capacity 8000\r\n', NULL, 1, '2011-07-30 04:07:38'),
(19, NULL, NULL, NULL, 'USA S/S', '1616 Dutch Broadway, Elmont, NY', '516-217-3456', NULL, NULL, 'Husnu Simsir', NULL, 'husnusim@yahoo.com', NULL, '', NULL, 1, '2011-07-25 03:19:46'),
(20, NULL, NULL, NULL, 'USA S/S', '283 W. Main St, Patchogue, NY', '631-424-6318', NULL, NULL, 'Adnan Kekilli', NULL, 'adnankek@kekilli.com', 100000, 'NL capacity 25000\r\nNL capacity 25000\r\nSNL capacity 40000\r\nLSD capacity 10000', NULL, 1, '2011-07-30 04:15:54'),
(21, NULL, NULL, NULL, 'Eagle S/S', '2755 Long Beach Rd, Oceanside, NY', '516-666-1234', NULL, NULL, 'Mansukbir Singh ', NULL, 'msingh@hotmail.com', NULL, '', NULL, 1, '2011-07-31 16:41:42'),
(22, NULL, NULL, NULL, 'Power S/S', '1919 Grand Ave, Baldwin, NY', '718-654-0911', NULL, NULL, 'Mike Sonders', NULL, 'm_sonders@gmail.com', NULL, '', NULL, 1, '2011-07-31 16:43:02'),
(23, NULL, NULL, NULL, 'USA S/S', '1000 Hicksville Rd, Massapequa, NY', '516-318-1438', NULL, NULL, 'Erkan Simsir', NULL, 'erkan_simsir@yahoo.com', NULL, '', NULL, 1, '2011-07-31 16:50:22'),
(24, NULL, NULL, NULL, 'USA S/S', '2686 Long beach Rd, Oceanside, NY', '718-515-2075', NULL, NULL, 'Joe Satriani', NULL, 'js_1970@gmail.com', NULL, '', NULL, 1, '2011-07-31 16:52:02'),
(25, NULL, NULL, NULL, 'Express S/S', '70 E. Jericho Tpke, Mineola, NY', '631-465-2009', NULL, NULL, 'Oscar Myer', NULL, 'oscar_myer@hotmail.com', 24000, 'NL capacity 8000 \r\nSNL capacity 8000 \r\nLSD capacity 8000', NULL, 1, '2011-07-25 00:48:21'),
(26, NULL, NULL, NULL, 'Express S/S', '246-02 S. Conduit Rd, Rosedale, NY', '718-444-3876', NULL, NULL, 'Shabir Patel', NULL, 'shabirp@patel.com', NULL, '', NULL, 1, '2011-07-31 16:58:53');

-- --------------------------------------------------------

--
-- Table structure for table `efts`
--

DROP TABLE IF EXISTS `efts`;
CREATE TABLE IF NOT EXISTS `efts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eft_no` int(11) NOT NULL,
  `vendor_id` smallint(6) unsigned NOT NULL,
  `amount` float(9,2) NOT NULL,
  `due_date` datetime NOT NULL,
  `payment_ref_no` varchar(255) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `eft_no` (`eft_no`),
  KEY `vendor_id` (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `eft_bols`
--

DROP TABLE IF EXISTS `eft_bols`;
CREATE TABLE IF NOT EXISTS `eft_bols` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `eft_id` int(11) NOT NULL,
  `bol_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `eft_id` (`eft_id`),
  KEY `bol_id` (`bol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `contact_details` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `manifest_no` int(11) unsigned NOT NULL,
  `carrier_id` tinyint(3) unsigned NOT NULL,
  `trucking_cost` float(6,2) DEFAULT NULL,
  `total` float(8,2) NOT NULL,
  `is_paid` tinyint(4) DEFAULT '0' COMMENT '0 = not paid\n1 = paid',
  `paid_date` datetime DEFAULT NULL,
  `payment_type` enum('Wire','Check','Cash') DEFAULT NULL,
  `payment_ref_no` varchar(255) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `carrier_id` (`carrier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_bols`
--

DROP TABLE IF EXISTS `invoice_bols`;
CREATE TABLE IF NOT EXISTS `invoice_bols` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(10) unsigned NOT NULL,
  `bol_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `bol_id` (`bol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_details`
--

DROP TABLE IF EXISTS `invoice_details`;
CREATE TABLE IF NOT EXISTS `invoice_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(10) unsigned NOT NULL,
  `product_id` smallint(6) unsigned NOT NULL,
  `product_price` float(6,4) unsigned DEFAULT NULL,
  `product_cost` float(6,4) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` enum('created','dispatched','en route','delivered','rejected') NOT NULL DEFAULT 'created',
  `customer_id` int(10) unsigned NOT NULL,
  `terminal_id` tinyint(3) unsigned DEFAULT NULL,
  `carrier_id` tinyint(4) unsigned DEFAULT NULL COMMENT '1 = Kittery, 2 = CBC, 3 = EBC, 4 = Mystic',
  `zone` tinyint(3) unsigned DEFAULT NULL,
  `split` enum('straight','2-way','3-way','4-way') DEFAULT NULL,
  `requested_delivery_time` datetime DEFAULT NULL,
  `actual_delivery_time` datetime DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `terminal_id` (`terminal_id`),
  KEY `carrier_id` (`carrier_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `status`, `customer_id`, `terminal_id`, `carrier_id`, `zone`, `split`, `requested_delivery_time`, `actual_delivery_time`, `created`) VALUES
(1, 'created', 24, 6, 1, NULL, 'straight', '2011-11-26 09:45:00', NULL, '2007-03-26 18:19:38'),
(2, 'created', 2, 7, 3, NULL, '3-way', NULL, NULL, '2007-03-25 18:43:37'),
(3, 'created', 3, 7, 3, NULL, '3-way', NULL, NULL, '2007-03-25 18:43:37'),
(4, 'created', 5, 7, 3, NULL, '3-way', NULL, NULL, '2007-03-25 18:44:16'),
(5, 'created', 1, 7, 1, NULL, '2-way', NULL, NULL, '2007-03-25 02:58:36'),
(6, 'created', 2, 7, 1, NULL, '2-way', NULL, NULL, '2007-03-25 03:58:36');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL,
  `vendor_id` smallint(6) unsigned DEFAULT NULL,
  `product_id` smallint(6) unsigned NOT NULL,
  `product_quantity` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `vendor_id` (`vendor_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `vendor_id`, `product_id`, `product_quantity`) VALUES
(1, 1, 1, 1, 6500),
(2, 2, 4, 1, 3500),
(3, 3, 4, 1, 4900),
(4, 4, 4, 1, 4100),
(5, 5, 1, 1, 4800),
(6, 5, 1, 7, 1000),
(7, 6, 1, 1, 6199);

-- --------------------------------------------------------

--
-- Table structure for table `order_splits`
--

DROP TABLE IF EXISTS `order_splits`;
CREATE TABLE IF NOT EXISTS `order_splits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL,
  `split_order_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `split_order_id` (`split_order_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `order_splits`
--

INSERT INTO `order_splits` (`id`, `order_id`, `split_order_id`) VALUES
(1, 2, 3),
(2, 2, 4),
(3, 3, 2),
(4, 3, 4),
(5, 4, 2),
(6, 4, 3),
(7, 5, 6),
(8, 6, 5);

-- --------------------------------------------------------

--
-- Table structure for table `pergallon_taxes`
--

DROP TABLE IF EXISTS `pergallon_taxes`;
CREATE TABLE IF NOT EXISTS `pergallon_taxes` (
  `NL` float(5,4) unsigned NOT NULL,
  `LSD` float(5,4) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pergallon_taxes`
--

INSERT INTO `pergallon_taxes` (`NL`, `LSD`) VALUES
(0.5310, 0.6241);

-- --------------------------------------------------------

--
-- Table structure for table `prices`
--

DROP TABLE IF EXISTS `prices`;
CREATE TABLE IF NOT EXISTS `prices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `effective_time` datetime NOT NULL,
  `vendor_id` smallint(6) unsigned NOT NULL,
  `NL_87` float(6,4) unsigned NOT NULL,
  `PL_89` float(6,4) unsigned NOT NULL,
  `SNL_93` float(6,4) unsigned NOT NULL,
  `LSD` float(6,4) unsigned NOT NULL,
  `terminal_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vendor_id` (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `product_code` varchar(10) NOT NULL,
  `product_description` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_code`, `product_description`) VALUES
(1, 'NL 87', 'No Lead Regular 87 Octane Gasoline'),
(2, 'PL 88', 'No Lead Plus Blanded 88 Octane Gasoline'),
(3, 'PL 89', 'No Lead Plus Blanded 89 Octane Gasoline'),
(4, 'PL 90', 'No Lead Plus Blanded 90 Octane Gasoline'),
(5, 'PL 91', 'No Lead Plus Blanded 91 Octane Gasoline'),
(6, 'PL 92', 'No Lead Plus Blanded 92 Octane Gasoline'),
(7, 'SNL 93', 'No Lead Premium 93 Octane Gasoline'),
(8, 'LSD 15', 'Low Sulfur Diesel 15ppm'),
(9, 'LSD 30', 'Low Sulfur Diesel 30ppm'),
(10, 'KERO', 'Kerosene');

-- --------------------------------------------------------

--
-- Table structure for table `terminals`
--

DROP TABLE IF EXISTS `terminals`;
CREATE TABLE IF NOT EXISTS `terminals` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `terminals`
--

INSERT INTO `terminals` (`id`, `name`, `address`) VALUES
(1, 'Inwood', '555 Doughty Boulevard, Inwood, NY 11096'),
(2, 'Carbo', '1 Bay Boulevard # 1, Lawrence, NY 11559'),
(3, 'Holtsville', '586 Union Ave Brookhaven, NY 11742'),
(4, 'Oyster Bay', '1 Commander Square Oyster Bay, NY 11771'),
(5, 'Mobil', '464 Doughty Boulevard, Inwood, NY 11096'),
(6, 'Brooklyn', '25 Paidge Ave, Brooklyn, NY 11222'),
(7, 'Motiva', '74 East Ave, Lawrence, NY 11559');

-- --------------------------------------------------------

--
-- Table structure for table `trucking_details`
--

DROP TABLE IF EXISTS `trucking_details`;
CREATE TABLE IF NOT EXISTS `trucking_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `carrier_id` tinyint(3) unsigned NOT NULL,
  `total_gallons` int(10) unsigned NOT NULL,
  `per_gallon_rate` float(5,4) unsigned NOT NULL,
  `surcharge` float(5,2) unsigned NOT NULL,
  `split_charge` float(4,2) unsigned NOT NULL,
  `terminal_change_fee` float(5,2) unsigned DEFAULT NULL,
  `downtime_fee` float(5,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `invoice_id` (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
CREATE TABLE IF NOT EXISTS `vendors` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `terms` enum('Net-7','Net-10','3% 7') NOT NULL,
  `address` varchar(128) DEFAULT NULL,
  `account_no` int(11) NOT NULL,
  `terminal_pin` mediumint(9) NOT NULL,
  `phone` char(14) DEFAULT NULL,
  `phone_ext` varchar(6) DEFAULT NULL,
  `fax` char(14) DEFAULT NULL,
  `contact_person` varchar(64) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `website_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `name`, `terms`, `address`, `account_no`, `terminal_pin`, `phone`, `phone_ext`, `fax`, `contact_person`, `email`, `website_url`) VALUES
(1, 'Valero Marketing and Supply', 'Net-7', 'One Valero Way San Antonio, TX 78249', 396135, 5890, '210-345-2000', '4359', NULL, 'Sue Martinez', 'smartinez@valeromns.com', 'www.valero.com'),
(2, 'Conoco Phillips', '3% 7', '600 North Dairy Ashford, Houston, TX 77252-2197', 935368, 5834, '281-293-1000', NULL, NULL, 'Jon Doe', 'jon_d@conocophillips1.com', 'www.conocophillips.com'),
(3, 'Global Companies LLC', 'Net-10', '800 South St, Waltham, MA 02454', 2120908, 1122, '800-764-1234', '8180', NULL, 'Chris Dooley', 'chrisd@globalp1.com', 'www.globalp.com'),
(4, 'Gulf Oil Limited Partnership', '3% 7', '100 Crossing Boulevard Framingham, MA 01702', 7300181, 7301, '508-270-8300', NULL, NULL, 'Charlie Procaccini', 'charliep@gulfoil1.com', 'www.gulfoil.com');


