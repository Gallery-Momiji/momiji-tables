-- Dumping database structure for gallery
DROP DATABASE IF EXISTS `gallery`;
CREATE DATABASE IF NOT EXISTS `gallery` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `gallery`;

-- Dumping structure for table gallery.artists
DROP TABLE IF EXISTS `artists`;
CREATE TABLE IF NOT EXISTS `artists` (
  `ArtistID` int(11) NOT NULL,
  `ArtistName` tinytext,
  `ArtistEmail` tinytext,
  `ArtistAddress` text,
  `ArtistUrl` tinytext,
  `ArtistAgentName` tinytext,
  `ArtistAgentPhone` tinytext,
  `ArtistAPP` tinyint(1) NOT NULL DEFAULT '0',
  `ArtistPhone` tinytext,
  `ArtistAgentAddress` tinytext,
  `ArtistAgentEmail` tinytext,
  `ArtistShowName` tinytext,
  `ArtistTables` float DEFAULT '0',
  `ArtistPanels` float DEFAULT '0',
  `ArtistDue` float DEFAULT '0',
  `ArtistPaid` float DEFAULT '0',
  `ArtistPaidFully` tinyint(1) DEFAULT '0',
  `ArtistCheckIn` tinyint(1) DEFAULT '0',
  `ArtistcheckOut` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ArtistID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping structure for table gallery.gsmerchandise
DROP TABLE IF EXISTS `gsmerchandise`;
CREATE TABLE IF NOT EXISTS `gsmerchandise` (
  `ArtistID` tinyint(3) unsigned NOT NULL,
  `PieceID` tinyint(3) unsigned NOT NULL,
  `PieceTitle` tinytext NOT NULL,
  `PiecePrice` float NOT NULL,
  `PieceInitialStock` smallint(6) NOT NULL DEFAULT '0' COMMENT 'How many we got to sell ',
  `PieceStock` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'How many of this item there is',
  `PieceSDC` tinyint(1) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping structure for table gallery.log
DROP TABLE IF EXISTS `log`;
CREATE TABLE IF NOT EXISTS `log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `action` mediumtext NOT NULL,
  `timestamp` time NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5235 DEFAULT CHARSET=latin1;

-- Dumping structure for table gallery.merchandise
DROP TABLE IF EXISTS `merchandise`;
CREATE TABLE IF NOT EXISTS `merchandise` (
  `ArtistID` int(10) unsigned NOT NULL,
  `MerchID` int(10) unsigned NOT NULL,
  `MerchTitle` tinytext NOT NULL,
  `MerchMinBid` float unsigned NOT NULL,
  `MerchAAMB` tinyint(1) unsigned NOT NULL,
  `MerchQuickSale` float unsigned NOT NULL,
  `MerchMedium` tinytext NOT NULL,
  `MerchSold` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ReceiptID` int(11) DEFAULT NULL,
  KEY `Index 1` (`ArtistID`,`MerchID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping structure for table gallery.options
DROP TABLE IF EXISTS `options`;
CREATE TABLE IF NOT EXISTS `options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option` varchar(50) NOT NULL,
  `value` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping structure for table gallery.receipts
DROP TABLE IF EXISTS `receipts`;
CREATE TABLE IF NOT EXISTS `receipts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL DEFAULT '0',
  `price` float NOT NULL DEFAULT '0',
  `paid` float NOT NULL DEFAULT '0',
  `isQuickSale` tinyint(1) NOT NULL DEFAULT '0',
  `isAuctionSale` tinyint(1) NOT NULL DEFAULT '0',
  `isGalleryStoreSale` tinyint(1) NOT NULL DEFAULT '0',
  `isPrinted` tinyint(1) DEFAULT '0',
  `itemArray` mediumtext,
  `priceArray` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=161 DEFAULT CHARSET=latin1;

-- Dumping structure for table gallery.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID number for each user',
  `username` tinytext,
  `password` tinytext,
  `class` tinyint(4) DEFAULT NULL,
  `name` tinytext,
  `banner` varchar(50) DEFAULT 'newbie',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
