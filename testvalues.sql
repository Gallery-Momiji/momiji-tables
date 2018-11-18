-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.2.18-MariaDB - MariaDB Server
-- Server OS:                    Linux
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- Dumping data for table gallery.artists: 3 rows
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` (`ArtistID`, `ArtistName`, `ArtistShowName`, `ArtistEmail`, `ArtistPhone`, `ArtistAddress`, `ArtistUrl`, `ArtistAPP`, `ArtistAgentName`, `ArtistAgentPhone`, `ArtistAgentAddress`, `ArtistAgentEmail`, `ArtistTables`, `ArtistPanels`, `ArtistPaidFully`, `ArtistDue`, `ArtistPaid`, `ArtistASCommission`, `ArtistGSCommission`, `ArtistCheckIn`, `ArtistcheckOut`) VALUES
	(1, 'ARTIST#1', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0.00, 0.00, 15, 15, 0, 0),
	(2, 'ARTIST#2', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0.00, 0.00, 15, 15, 0, 0),
	(4, 'ARTIST#3', 'No commission art', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0.00, 0.00, 0, 0, 0, 0);
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;

-- Dumping data for table gallery.bidders: 3 rows
/*!40000 ALTER TABLE `bidders` DISABLE KEYS */;
INSERT INTO `bidders` (`name`, `bidderno`, `phoneno`, `eaddress`, `maddress`) VALUES
	('Bidder#1', 1, '999-999-9999', 'bidder#1@bidder.com', 'Bidderplace#1'),
	('Bidder#2', 2, '999-999-9999', 'bidder#2@bidder.com', 'Bidderplace#2'),
	('Bidder#3', 3, '999-999-9999', 'bidder#3@bidder.com', 'Bidderplace#3');
/*!40000 ALTER TABLE `bidders` ENABLE KEYS */;

-- Dumping data for table gallery.bids: 8 rows
/*!40000 ALTER TABLE `bids` DISABLE KEYS */;
INSERT INTO `bids` (`name`, `value`, `bidderno`, `ArtistID`, `MerchID`) VALUES
	('Bidder#1', 10, 1, 1, 1),
	('Bidder#1', 10, 1, 3, 2),
	('Bidder#2', 15, 2, 2, 1),
	('Bidder#2', 15, 2, 3, 2),
	('Bidder#1', 20, 1, 3, 2),
	('Bidder#3', 21, 3, 3, 2),
	('Bidder#3', 11, 3, 1, 1),
	('Bidder#1', 25, 1, 3, 2);
/*!40000 ALTER TABLE `bids` ENABLE KEYS */;

-- Dumping data for table gallery.gsmerchandise: 0 rows
/*!40000 ALTER TABLE `gsmerchandise` DISABLE KEYS */;
/*!40000 ALTER TABLE `gsmerchandise` ENABLE KEYS */;

-- Dumping data for table gallery.log: 0 rows
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;

-- Dumping data for table gallery.merchandise: 5 rows
/*!40000 ALTER TABLE `merchandise` DISABLE KEYS */;
INSERT INTO `merchandise` (`ArtistID`, `MerchID`, `MerchTitle`, `MerchMinBid`, `MerchAAMB`, `MerchQuickSale`, `MerchMedium`, `MerchSold`, `ReceiptID`) VALUES
	(1, 1, 'Artist1Piece1', 10.00, 1, 15.00, 'Piece', 0, NULL),
	(1, 2, 'Artist1Piece2', 10.00, 1, 15.00, 'Piece', 1, NULL),
	(2, 1, 'Artist2Piece1', 10.00, 1, 15.00, 'Piece', 0, NULL),
	(3, 1, 'Artist3Piece1', 5.00, 1, 10.00, 'Piece', 1, NULL),
	(3, 2, 'Artist3Piece1', 10.00, 1, 12.00, 'Piece', 0, NULL);
/*!40000 ALTER TABLE `merchandise` ENABLE KEYS */;

-- Dumping data for table gallery.options: 1 rows
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` (`id`, `AuctionEnd`, `AuctionCutoff`) VALUES
	('', 0, 5);
/*!40000 ALTER TABLE `options` ENABLE KEYS */;

-- Dumping data for table gallery.receipts: 0 rows
/*!40000 ALTER TABLE `receipts` DISABLE KEYS */;
/*!40000 ALTER TABLE `receipts` ENABLE KEYS */;

-- Dumping data for table gallery.users: 1 rows
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `password`, `class`, `name`) VALUES
	(1, 'user', NULL, 11, 'username');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
