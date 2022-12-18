-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: localhost    Database: cmrlabs
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Buyer`
--

DROP TABLE IF EXISTS `Buyer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Buyer` (
  `BuyerID` varchar(11) NOT NULL,
  `TelNumber` varchar(100) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `UserName` varchar(255) DEFAULT NULL,
  `ShipAdress` varchar(255) DEFAULT NULL,
  `ShipCity` varchar(255) DEFAULT NULL,
  `ShipState` varchar(50) DEFAULT NULL,
  `ShipCountry` varchar(255) DEFAULT NULL,
  `ShipZipcode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`BuyerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Buyer`
--

LOCK TABLES `Buyer` WRITE;
/*!40000 ALTER TABLE `Buyer` DISABLE KEYS */;
INSERT INTO `Buyer` VALUES ('12714972662','1-102-293-5153','ansh@gmail.com','Ansh','101, Ground Floor, Kalyan Nagar','Bengaluru','KA','India','560051'),('26350935579','1-865-217-7844','ananya@gmail.com','Ananya','312, 4th Floor, VS Enclave','Bengaluru','KA','India','560095'),('42711312958','1-317-594-7754','swaraj@gmail.com','Swaraj','14, 2nd Main Road, MGR Nagar','Chennai','TN','India','600001'),('50345881058','1-850-899-9543','swarna@gmail.com','Swarna','901, 4th Main Road, Anna Nagar','Chennai','TN','India','600032'),('67711139299','1-632-629-5645','varun@gmail.com','Varun','21, 12th Main Road, Hitech City','Hyderabad','TS','India','500081'),('72330070747','1-184-195-5645','sandhya@gmail.com','Sandhya','1, 1st Main Road, Madhapur','Hyderabad','TS','India','500012'),('75521050479','1-959-804-3019','rahul@gmail.com','Rahul','29, 5th Main Road, Gachobolli','Hyderabad','TS','India','500035'),('81921795835','1-583-615-6760','chandramouli@gmail.com','Chandramouli','32, Yeraballipalem, Vinjamur','Nellore','AP','India','524228'),('89264121725','1-905-188-8108','manoj@gmail.com','Manoj','32, Nadimuru, Vinjamur','Nellore','AP','India','524228'),('94908631679','1-772-737-2701','prasanthi@gmail.com','Prasanthi','32, 9th Main Road, Green Park Layout','Bengaluru','KA','India','560043');
/*!40000 ALTER TABLE `Buyer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order_Details`
--

DROP TABLE IF EXISTS `Order_Details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Order_Details` (
  `OrderID` varchar(11) NOT NULL,
  `ProductID` varchar(11) DEFAULT NULL,
  `ItemQuantity` int DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order_Details`
--

LOCK TABLES `Order_Details` WRITE;
/*!40000 ALTER TABLE `Order_Details` DISABLE KEYS */;
INSERT INTO `Order_Details` VALUES ('05553373345','748130-5105',57),('07261862587','206908-3232',26),('21942566549','332338-2345',34),('47217024154','096419-4823',57),('70701609058','585230-0077',13),('85764031654','197710-3876',29),('89878325779','533169-3365',11),('90817183713','588681-0034',9),('96945305380','998757-5991',46),('99251300121','375163-6428',81);
/*!40000 ALTER TABLE `Order_Details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `OrderID` varchar(11) NOT NULL,
  `BuyerID` varchar(11) NOT NULL,
  `Total_amount` mediumint DEFAULT NULL,
  `Total_quantity` mediumint DEFAULT NULL,
  `PaymentID` varchar(11) NOT NULL,
  `PaymentDate` varchar(255) DEFAULT NULL,
  `OrderDate` varchar(255) DEFAULT NULL,
  `Cancel` text,
  `Paid` text,
  `Fulfilled` text,
  `ShipDate` varchar(255) DEFAULT NULL,
  `ShippingID` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `Orders_FK1` (`BuyerID`),
  KEY `Orders_FK2` (`PaymentID`),
  KEY `Orders_FK3` (`ShippingID`),
  CONSTRAINT `Orders_FK1` FOREIGN KEY (`BuyerID`) REFERENCES `Buyer` (`BuyerID`),
  CONSTRAINT `Orders_FK2` FOREIGN KEY (`PaymentID`) REFERENCES `Payment` (`PaymentID`),
  CONSTRAINT `Orders_FK3` FOREIGN KEY (`ShippingID`) REFERENCES `Shipment` (`ShippingID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `Order_Details` (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES ('05553373345','75521050479',22,7,'79922775587','2022-07-06','2022-07-06','0','1','1','2022-07-10','90750814057'),('07261862587','12714972662',177,6,'26660945790','2022-08-01','2022-08-01','0','1','1','2022-08-06','86649590825'),('21942566549','50345881058',48,1,'57773141099','2022-07-02','2022-07-02','0','1','1','2022-07-03','81892563843'),('47217024154','26350935579',662,5,'39477519625','2022-05-09','2022-05-09','0','1','1','2022-05-10','43358910115'),('70701609058','89264121725',238,13,'38387495295','2022-05-18','2022-05-18','0','1','1','2022-05-22','73874731131'),('85764031654','94908631679',928,2,'31863280913','2022-11-03','2022-11-03','0','1','1','2022-11-07','44764907944'),('89878325779','72330070747',134,11,'83308456699','2022-02-24','2022-02-24','0','1','1','2022-02-27','93438458936'),('90817183713','67711139299',54,9,'49871562602','2022-10-16','2022-10-16','0','1','0','2022-10-19','09462963286'),('96945305380','42711312958',56,4,'36297339285','2022-06-16','2022-06-15','0','1','1','2022-06-16','02373273025'),('99251300121','81921795835',68,8,'92384433306','2022-09-03','2022-09-03','0','1','1','2022-09-05','14265493321');
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment`
--

DROP TABLE IF EXISTS `Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payment` (
  `PaymentID` varchar(11) NOT NULL,
  `CardHolderName` varchar(255) DEFAULT NULL,
  `CardType` varchar(255) DEFAULT NULL,
  `CreditCard` varchar(255) DEFAULT NULL,
  `CredExpMo` mediumint DEFAULT NULL,
  `CardExpYr` mediumint DEFAULT NULL,
  `BillingAddress` varchar(255) DEFAULT NULL,
  `BillingCity` varchar(255) DEFAULT NULL,
  `BillingState` varchar(50) DEFAULT NULL,
  `BillingZipcode` varchar(10) DEFAULT NULL,
  `BillCountry` varchar(100) DEFAULT NULL,
  `OrderID` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`PaymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment`
--

LOCK TABLES `Payment` WRITE;
/*!40000 ALTER TABLE `Payment` DISABLE KEYS */;
INSERT INTO `Payment` VALUES ('26660945790','Willow Solis','Visa','4532802912657126',12,2028,'129-2522 At, Rd.','Minneapolis','Minnesota','96354','Burkina Faso','81537344499'),('31863280913','Alexander Bell','JCR','4716705473930304',4,2022,'1603 Ut, St.','Steenokkerzeel','VB','4375 FZ','Tanzania','84632895499'),('36297339285','Erica Townsend','Discover','4539605158431500',4,2024,'831-967 Eleifend Rd.','Valley East','ON','8212','Cape Verde','61482494299'),('38387495295','Giacomo Bryant','Discover','4916344775203687',3,2022,'P.O. Box 717, 3210 Pede, Street','Igboho','Oyo','79987','Jersey','39450640399'),('39477519625','Margaret Berry','Visa','4556557037126901',3,2027,'828-5278 Vitae Av.','Quesada','Alajuela','96727','Åland Islands','64766274299'),('49871562602','Clinton Parks','America Express','4485512676119878',8,2025,'710-5611 Massa St.','Elversele','OV','U7G 1OM','Spain','73488575399'),('57773141099','Venus Holland','JCR','4556331596954324',11,2022,'316-4992 Duis St.','Belfast','Ulster','8960','Netherlands','35958952099'),('79922775587','Ruth Conway','JCR','4485287520883769',11,2028,'173-7331 Semper, St.','Amstelveen','Noord Holland','48257','Mongolia','10423068699'),('83308456699','Tamekah Roman','Visa','4929766014453323',8,2025,'927-4982 Suspendisse Av.','Cervinara','Campania','797729','Malawi','88468168899'),('92384433306','Gannon Decker','America Express','4539049411088099',3,2029,'1073 Suspendisse St.','Slupsk','Pomorskie','61317','Togo','95732033799');
/*!40000 ALTER TABLE `Payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product` (
  `ProductID` varchar(11) NOT NULL,
  `ProductName` varchar(255) DEFAULT NULL,
  `SellerID` varchar(11) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `UnitPrice` varchar(100) DEFAULT NULL,
  `Color` varchar(255) DEFAULT NULL,
  `QuantityOnHand` int DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `SellerID` (`SellerID`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`SellerID`) REFERENCES `Seller` (`SellerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES ('096419-4823','Beauty','30918186609','Cheek','$26.70','red',551),('197710-3876','Lotion','70268860023','Eye, Face','$26.98','green',794),('206908-3232','Remover','31704489846','Lip','$29.58','green',898),('332338-2345','Beauty','68659281779','Face','$56.17','red',271),('375163-6428','Primer','12716365607','','$2.72','red',464),('533169-3365','Shampoo','30751277561','Body, Hair','$84.35','yellow',916),('585230-0077','Sets','39656653836','Cheek','$5.24','red',514),('588681-0034','Moisturizer','39599259968','Lip','$73.53','blue',162),('748130-5105','Lotion','12241497023','Hair','$6.83','yellow',109),('998757-5991','Sets','43636501698','','$59.44','orange',827);
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Seller`
--

DROP TABLE IF EXISTS `Seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Seller` (
  `SellerID` varchar(11) NOT NULL,
  `CompanyName` text,
  `Address` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `Zipcode` varchar(10) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `ContactPerson` varchar(255) DEFAULT NULL,
  `ContactNumber` varchar(100) DEFAULT NULL,
  `ContactEmail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SellerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Seller`
--

LOCK TABLES `Seller` WRITE;
/*!40000 ALTER TABLE `Seller` DISABLE KEYS */;
INSERT INTO `Seller` VALUES ('12241497023','Amazon','P.O. Box 135, 8772 Mauris Avenue','Minneapolis','Minnesota','34193','United States','Yael Reyes','1-925-532-3739','cc@amazon.com'),('12716365607','Flipkart','Ap #924-2093 Nisi Road','South Burlington','Vermont','61177','United States','Venus Tyson','1-635-591-2113','cc@flipkart.com'),('30751277561','Shopee','Ap #559-963 Aliquet. Avenue','Bangor','ME','46316','United States','Gil Watts','1-384-828-2779','cc@shopee.com'),('30918186609','Momoshop','8496 Sed St.','Annapolis','Maryland','36447','United States','Montana Griffin','1-547-354-2975','cc@momoshop.com'),('31704489846','Ruten','747-1877 Fusce Street','Montpelier','Vermont','45116','United States','Breanna Tran','1-179-453-8363','cc@ruten.com'),('39599259968','Biggo','4166 Id Avenue','Athens','GA','93824','United States','Xanthus Phillips','1-592-174-7801','cc@bingo.com'),('39656653836','Pchome','396-5140 Sodales Rd.','Little Rock','Arkansas','72723','United States','Galvin Keller','1-870-828-3188','cc@pchome.com'),('43636501698','Yahoo','824-4773 Neque. Avenue','Bellevue','Nebraska','99315','United States','McKenzie Owen','1-156-811-6215','cc@yahoo.com'),('68659281779','Pcstore','6077 Id St.','Springdale','Arkansas','71245','United States','Armando Whitfield','1-201-374-3545','cc@pcstore.com'),('70268860023','PayEasy','P.O. Box 185, 7096 Fusce St.','Minneapolis','MN','12392','United States','Jamal Ward','1-808-398-1802','cc@payeasy.com');
/*!40000 ALTER TABLE `Seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Shipment`
--

DROP TABLE IF EXISTS `Shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Shipment` (
  `ShippingID` varchar(11) NOT NULL,
  `ShipTEL` varchar(100) DEFAULT NULL,
  `ShipperName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ShippingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Shipment`
--

LOCK TABLES `Shipment` WRITE;
/*!40000 ALTER TABLE `Shipment` DISABLE KEYS */;
INSERT INTO `Shipment` VALUES ('02373273025','1-717-664-9542','UPS'),('09462963286','1-228-832-3305','Fedex'),('14265493321','1-183-564-7100','Fedex'),('43358910115','1-650-659-5553','Fedex'),('44764907944','1-837-186-2802','UPS'),('73874731131','1-732-599-2845','USPS'),('81892563843',',',','),('86649590825','1-585-683-9924','UPS'),('90750814057','1-288-751-7876','UPS'),('93438458936',',',',');
/*!40000 ALTER TABLE `Shipment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-18 13:13:41
