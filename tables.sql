DROP DATABASE IF EXISTS `gallery`;
CREATE DATABASE IF NOT EXISTS `gallery`;
-- This is the gallery database
USE `gallery`;

DROP TABLE IF EXISTS `artists`;
CREATE TABLE IF NOT EXISTS `artists` (
-- This table is used to store artist information
  `ArtistID` int(11) NOT NULL COMMENT 'Unique Artist ID',
  `ArtistName` tinytext COMMENT 'Artist Name',
  `ArtistEmail` tinytext COMMENT 'Artist Email',
  `ArtistAddress` text COMMENT 'Artist Mailing Address',
  `ArtistUrl` tinytext COMMENT 'Artist webpage or site',
  `ArtistAgentName` tinytext COMMENT 'Artist Agent Name',
  `ArtistAgentPhone` tinytext COMMENT 'Artist Agent Phone No',
  `ArtistAPP` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'PS Accredited Press Photography (YES/NO)',
  `ArtistPhone` tinytext COMMENT 'Artist Phone No',
  `ArtistAgentAddress` tinytext COMMENT 'Artist Agent Address',
  `ArtistAgentEmail` tinytext COMMENT 'Artist Agent Email',
  `ArtistShowName` tinytext COMMENT 'Artist Show/Nickname',
  `ArtistTables` float DEFAULT '0' COMMENT 'Artist Table Num',
  `ArtistPanels` float DEFAULT '0' COMMENT 'Artist Panel Num',
  `ArtistDue` float DEFAULT '0' COMMENT 'Money still owed by artist, such as fees, or negative for money owed to artist',
  `ArtistPaid` float DEFAULT '0' COMMENT 'Total paid by artist prior to check in',
  `ArtistPaidFully` tinyint(1) DEFAULT '0' COMMENT 'Artist paid fully for panels/tables, excluding fees (YES/NO)',
  `ArtistCheckIn` tinyint(1) DEFAULT '0' COMMENT 'Artist is checked in (YES/NO)',
  `ArtistcheckOut` tinyint(1) DEFAULT '0' COMMENT 'Artist is checked out (YES/NO)',
  PRIMARY KEY (`ArtistID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `gsmerchandise`;
CREATE TABLE IF NOT EXISTS `gsmerchandise` (
-- This table is used to store gallery store merchandise information
  `ArtistID` tinyint(3) unsigned NOT NULL COMMENT 'Unique Artist ID',
  `PieceID` tinyint(3) unsigned NOT NULL COMMENT 'Unique Piece ID',
  `PieceTitle` tinytext NOT NULL COMMENT 'Piece Title/Name',
  `PiecePrice` float NOT NULL COMMENT 'Piece Price',
  `PieceInitialStock` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Number to sell',
  `PieceStock` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Number left in stock',
  `PieceSDC` tinyint(1) DEFAULT '1' COMMENT 'Sell display copy (YES/NO)',
  KEY `GSMerchKey` (`ArtistID`,`PieceID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `log`;
CREATE TABLE IF NOT EXISTS `log` (
-- This table is used to store POS log information
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique Log ID',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Associated username',
  `action` mediumtext NOT NULL COMMENT 'Action logged',
  `timestamp` time NOT NULL COMMENT 'Timestamp of log',
  `date` date NOT NULL COMMENT 'Date of log',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5235 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `merchandise`;
CREATE TABLE IF NOT EXISTS `merchandise` (
-- This table is used to store auction merchandise information
  `ArtistID` int(11) unsigned NOT NULL COMMENT 'Unique Artist ID',
  `MerchID` int(11) unsigned NOT NULL COMMENT 'Unique Merch ID',
  `MerchTitle` tinytext NOT NULL COMMENT 'Merch Title/Name',
  `MerchMinBid` float unsigned NOT NULL COMMENT 'Merch minimum Bid',
  `MerchAAMB` tinyint(1) unsigned NOT NULL COMMENT 'After Auction Minimum Bid (YES/NO)',
  `MerchQuickSale` float unsigned NOT NULL COMMENT 'Merch quicksale price',
  `MerchMedium` tinytext NOT NULL COMMENT 'Merch medium description',
  `MerchSold` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Merch sold (YES/NO)',
  `ReceiptID` int(11) DEFAULT NULL COMMENT 'Unique Receipt Id if sold',
  KEY `MerchKey` (`ArtistID`,`MerchID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `options`;
CREATE TABLE IF NOT EXISTS `options` (
-- This table is used to store various information, such as panel prices and special dates
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique ID',
  `option` tinytext NOT NULL COMMENT 'Option Name',
  `value` tinytext NOT NULL COMMENT 'Option Value',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `receipts`;
CREATE TABLE IF NOT EXISTS `receipts` (
-- This table is used to store receipt information
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique Receipt Id',
  `userID` int(11) NOT NULL DEFAULT '0' COMMENT 'Associated username',
  `price` float NOT NULL DEFAULT '0' COMMENT 'Price sold for',
  `paid` float NOT NULL DEFAULT '0' COMMENT 'Amount paid',
  `isQuickSale` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Quicksale (YES/NO)',
  `isAuctionSale` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Auction sale (YES/NO)',
  `isGalleryStoreSale` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Gallery store sale (YES/NO)',
  `isPrinted` tinyint(1) DEFAULT '0' COMMENT 'Printed (YES/NO)',
  `itemArray` mediumtext COMMENT 'Items sold, separated by #',
  `priceArray` mediumtext COMMENT 'Prices of items sold, separated by #',
  `timestamp` time NOT NULL COMMENT 'Timestamp of receipt',
  `date` date NOT NULL COMMENT 'Date of receipt',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
-- This table is used to store user information
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID number for each user',
  `username` tinytext COMMENT 'username of user',
  `password` tinytext COMMENT 'md5sum of user password',
  `class` tinyint(4) DEFAULT NULL COMMENT 'Permission level of user',
  `name` tinytext COMMENT 'Name of user',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `bidders`;
CREATE TABLE IF NOT EXISTS `bidders` (
-- This table is used to store bidder information
  `name` tinytext NOT NULL COMMENT 'Name of Bidder',
  `bidderno` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique Bidder No',
  `phoneno` tinytext NOT NULL COMMENT 'Bidder Phone Number',
  `eaddress` tinytext NOT NULL COMMENT 'Email Address',
  `maddress` text NOT NULL COMMENT 'Mailing address',
  `due` float DEFAULT '0' COMMENT 'Money still owed by bidder',
  PRIMARY KEY (`bidderno`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
