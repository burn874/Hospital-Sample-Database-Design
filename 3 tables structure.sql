-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: hvch1
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `appointment` (
  `AppointmentID` int(8) NOT NULL AUTO_INCREMENT,
  `AppointmentArrangedByID` int(10) NOT NULL,
  `AppointmentClinic` int(3) NOT NULL,
  `AppointmentRequest` varchar(20) DEFAULT NULL,
  `AppointmentResolve` varchar(20) DEFAULT NULL,
  `ConsultationTime` varchar(20) DEFAULT NULL,
  `ConsultationDoctor` int(5) NOT NULL,
  `ConsultationDate` varchar(20) NOT NULL,
  `ConsultationType` varchar(20) NOT NULL,
  `PatientNo` int(10) NOT NULL,
  `AppointmentConfirmation` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`AppointmentID`),
  KEY `AppointmentArrangedByID_FK` (`AppointmentArrangedByID`),
  KEY `AppointmentClinicPatient_FK` (`AppointmentClinic`),
  KEY `ConsultationDoctor_FK` (`ConsultationDoctor`),
  KEY `PatientNo_FK` (`PatientNo`),
  KEY `ConsultationType_FK` (`ConsultationType`),
  CONSTRAINT `AppointmentArrangedByID_FK` FOREIGN KEY (`AppointmentArrangedByID`) REFERENCES `appointmentarrangedby` (`appointmentarrangedby`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AppointmentClinicPatient_FK` FOREIGN KEY (`AppointmentClinic`) REFERENCES `clinic` (`clinicno`),
  CONSTRAINT `ConsultationDoctor_FK` FOREIGN KEY (`ConsultationDoctor`) REFERENCES `doctor` (`doctorno`),
  CONSTRAINT `ConsultationType_FK` FOREIGN KEY (`ConsultationType`) REFERENCES `consultationtype` (`consultationtype`),
  CONSTRAINT `PatientNo_FK` FOREIGN KEY (`PatientNo`) REFERENCES `patient` (`patientno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=200028 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `appointmentarrangedby`
--

DROP TABLE IF EXISTS `appointmentarrangedby`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `appointmentarrangedby` (
  `AppointmentArrangedBy` int(10) NOT NULL AUTO_INCREMENT,
  `AppointmentArrangedByType` varchar(10) NOT NULL,
  PRIMARY KEY (`AppointmentArrangedBy`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `appointmentequipment`
--

DROP TABLE IF EXISTS `appointmentequipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `appointmentequipment` (
  `AppointmentEquipmentID` int(11) NOT NULL AUTO_INCREMENT,
  `AppointmentID` int(8) NOT NULL,
  `EquipmentSerial` varchar(20) NOT NULL,
  PRIMARY KEY (`AppointmentEquipmentID`),
  KEY `EquipmentSerial_FK` (`EquipmentSerial`),
  KEY `AppointmentID_FK2` (`AppointmentID`),
  CONSTRAINT `AppointmentID_FK2` FOREIGN KEY (`AppointmentID`) REFERENCES `appointment` (`appointmentid`),
  CONSTRAINT `EquipmentSerial_FK` FOREIGN KEY (`EquipmentSerial`) REFERENCES `equipment` (`equipmentserial`)
) ENGINE=InnoDB AUTO_INCREMENT=22680 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `certification`
--

DROP TABLE IF EXISTS `certification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `certification` (
  `CertificationID` int(8) NOT NULL AUTO_INCREMENT,
  `SpecializationID` int(3) NOT NULL,
  `DoctorNo` int(3) NOT NULL,
  `CertificationExpiry` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CertificationID`),
  KEY `SpecializationID_FK` (`SpecializationID`),
  KEY `DoctorNo_FK` (`DoctorNo`),
  CONSTRAINT `DoctorNo_FK` FOREIGN KEY (`DoctorNo`) REFERENCES `doctor` (`doctorno`),
  CONSTRAINT `SpecializationID_FK` FOREIGN KEY (`SpecializationID`) REFERENCES `specialization` (`specializationid`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clinic`
--

DROP TABLE IF EXISTS `clinic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `clinic` (
  `ClinicNo` int(3) NOT NULL AUTO_INCREMENT,
  `ClinicName` varchar(20) DEFAULT NULL,
  `ClinicContact` int(10) DEFAULT NULL,
  PRIMARY KEY (`ClinicNo`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `consultation`
--

DROP TABLE IF EXISTS `consultation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `consultation` (
  `ConsultationRecord` int(10) NOT NULL AUTO_INCREMENT,
  `AppointmentID` int(8) NOT NULL,
  `ConsultationStartTime` varchar(5) DEFAULT NULL,
  `ConsultationEndTime` varchar(5) DEFAULT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ConsultationRecord`),
  KEY `AppointmentID_FK1` (`AppointmentID`),
  CONSTRAINT `AppointmentID_FK1` FOREIGN KEY (`AppointmentID`) REFERENCES `appointment` (`appointmentid`)
) ENGINE=InnoDB AUTO_INCREMENT=181213 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `consultationtype`
--

DROP TABLE IF EXISTS `consultationtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `consultationtype` (
  `ConsultationType` varchar(20) NOT NULL,
  `ConsultationCost` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ConsultationType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `discount` (
  `DiscountName` varchar(20) NOT NULL,
  `DiscountValue` decimal(8,5) NOT NULL,
  PRIMARY KEY (`DiscountName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `doctor` (
  `DoctorNo` int(5) NOT NULL,
  `ClinicNo` int(3) NOT NULL,
  PRIMARY KEY (`DoctorNo`),
  KEY `ClinicNo_FK2` (`ClinicNo`),
  CONSTRAINT `ClinicNo_FK2` FOREIGN KEY (`ClinicNo`) REFERENCES `clinic` (`clinicno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doctorleave`
--

DROP TABLE IF EXISTS `doctorleave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `doctorleave` (
  `LEAVEID` int(8) NOT NULL AUTO_INCREMENT,
  `DoctorNo` int(5) NOT NULL,
  `LeaveDate` varchar(20) NOT NULL,
  PRIMARY KEY (`LEAVEID`),
  KEY `leave_fk` (`DoctorNo`),
  CONSTRAINT `leave_fk` FOREIGN KEY (`DoctorNo`) REFERENCES `doctor` (`doctorno`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `equipment` (
  `EquipmentSerial` varchar(20) NOT NULL,
  `EquipmentModelName` varchar(255) DEFAULT NULL,
  `EquipmentLocation` int(3) NOT NULL,
  `EquipmentPurchaseDate` varchar(10) DEFAULT NULL,
  `EquipmentPurchasePrice` decimal(10,2) DEFAULT NULL,
  `EquipmentVendor` varchar(255) DEFAULT NULL,
  `MaintenanceVendor` varchar(30) DEFAULT NULL,
  `NextMaintenance` varchar(10) DEFAULT NULL,
  `SupplyVendor` varchar(30) NOT NULL,
  PRIMARY KEY (`EquipmentSerial`),
  KEY `EquipmentLocation_FK` (`EquipmentLocation`),
  CONSTRAINT `EquipmentLocation_FK` FOREIGN KEY (`EquipmentLocation`) REFERENCES `clinic` (`clinicno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `medicine` (
  `MedicineSerial` varchar(10) NOT NULL,
  `MedicineName` varchar(255) DEFAULT NULL,
  `MedicineLocation` int(3) NOT NULL,
  `MedicineType` varchar(20) DEFAULT NULL,
  `MedicineRestriction` varchar(30) DEFAULT NULL,
  `AmountStock` int(255) NOT NULL,
  `MedicinePrimaryVendor` int(8) NOT NULL,
  `MedicineSecondaryVendor` int(8) NOT NULL,
  PRIMARY KEY (`MedicineSerial`),
  KEY `MedicineType_FK` (`MedicineType`),
  KEY `MedicinePrimaryVendor_FK` (`MedicinePrimaryVendor`),
  KEY `MedicineLocation_FK` (`MedicineLocation`),
  KEY `MedicineSecondaryVendor_FK` (`MedicineSecondaryVendor`),
  CONSTRAINT `MedicineLocation_FK` FOREIGN KEY (`MedicineLocation`) REFERENCES `clinic` (`clinicno`),
  CONSTRAINT `MedicinePrimaryVendor_FK` FOREIGN KEY (`MedicinePrimaryVendor`) REFERENCES `medicinevendor` (`medicinevendorid`),
  CONSTRAINT `MedicineSecondaryVendor_FK` FOREIGN KEY (`MedicineSecondaryVendor`) REFERENCES `medicinevendor` (`medicinevendorid`),
  CONSTRAINT `MedicineType_FK` FOREIGN KEY (`MedicineType`) REFERENCES `medicinetype` (`medicinetype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medicinepurchase`
--

DROP TABLE IF EXISTS `medicinepurchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `medicinepurchase` (
  `MedicinePurchaseID` int(10) NOT NULL AUTO_INCREMENT,
  `MedicineVendorID` int(8) NOT NULL,
  `MedicineSerial` varchar(10) NOT NULL,
  `MedicinePurchasePrice` decimal(10,2) NOT NULL,
  `MedicinePurchaseDate` varchar(20) DEFAULT NULL,
  `MedicinePurchaseQuantity` int(255) DEFAULT NULL,
  PRIMARY KEY (`MedicinePurchaseID`),
  KEY `MedicineVendorID_FK` (`MedicineVendorID`),
  KEY `MedicineSerial_FK` (`MedicineSerial`),
  CONSTRAINT `MedicineSerial_FK` FOREIGN KEY (`MedicineSerial`) REFERENCES `medicine` (`MedicineSerial`),
  CONSTRAINT `MedicineVendorID_FK` FOREIGN KEY (`MedicineVendorID`) REFERENCES `medicinevendor` (`medicinevendorid`)
) ENGINE=InnoDB AUTO_INCREMENT=5004 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medicinerestriction`
--

DROP TABLE IF EXISTS `medicinerestriction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `medicinerestriction` (
  `MedicineRestriction` varchar(20) NOT NULL,
  `MedicineRestrictionDetail` varchar(20) NOT NULL,
  PRIMARY KEY (`MedicineRestriction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medicinetype`
--

DROP TABLE IF EXISTS `medicinetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `medicinetype` (
  `MedicineType` varchar(10) NOT NULL,
  `MedicineTypeDetail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MedicineType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medicinevendor`
--

DROP TABLE IF EXISTS `medicinevendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `medicinevendor` (
  `MedicineVendorID` int(8) NOT NULL AUTO_INCREMENT,
  `MedicineVendor` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`MedicineVendorID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nurse`
--

DROP TABLE IF EXISTS `nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `nurse` (
  `NurseNo` int(5) NOT NULL AUTO_INCREMENT,
  `NurseEmail` varchar(255) NOT NULL,
  `ClinicNo` int(3) NOT NULL,
  PRIMARY KEY (`NurseNo`),
  KEY `ClinicNo_FK1` (`ClinicNo`),
  CONSTRAINT `ClinicNo_FK1` FOREIGN KEY (`ClinicNo`) REFERENCES `clinic` (`clinicno`)
) ENGINE=InnoDB AUTO_INCREMENT=357 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `patient` (
  `PatientNo` int(10) NOT NULL AUTO_INCREMENT,
  `PatientFirstName` varchar(20) NOT NULL,
  `PatientLastName` varchar(30) NOT NULL,
  `PatientAddress` varchar(255) DEFAULT NULL,
  `PatientContact` int(10) NOT NULL,
  `PatientEmail` varchar(255) NOT NULL,
  `PatientDiscountID` varchar(20) NOT NULL,
  PRIMARY KEY (`PatientNo`),
  KEY `PatientDiscountID_FK` (`PatientDiscountID`),
  CONSTRAINT `PatientDiscountID_FK` FOREIGN KEY (`PatientDiscountID`) REFERENCES `discount` (`discountname`)
) ENGINE=InnoDB AUTO_INCREMENT=51573 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `prescription` (
  `PrescriptionID` int(10) NOT NULL AUTO_INCREMENT,
  `MedicineSerial` varchar(10) NOT NULL,
  `ConsultationRecord` int(10) NOT NULL,
  `PrescriptionDate` varchar(10) NOT NULL,
  `PrescriptionQuantity` int(10) DEFAULT NULL,
  `Prescription` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`PrescriptionID`),
  KEY `con` (`ConsultationRecord`),
  KEY `med` (`MedicineSerial`),
  CONSTRAINT `con` FOREIGN KEY (`ConsultationRecord`) REFERENCES `consultation` (`consultationrecord`),
  CONSTRAINT `med` FOREIGN KEY (`MedicineSerial`) REFERENCES `medicine` (`MedicineSerial`)
) ENGINE=InnoDB AUTO_INCREMENT=1000011 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `specialization`
--

DROP TABLE IF EXISTS `specialization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `specialization` (
  `SpecializationID` int(3) NOT NULL AUTO_INCREMENT,
  `SpecializationName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`SpecializationID`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'hvch1'
--
/*!50003 DROP PROCEDURE IF EXISTS `CHECKAVAILABILITY` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CHECKAVAILABILITY`(
	IN DoctorNoIN int(5),
	IN ConsultationDateIN varchar(10),
	# List of Equipment Needed Seperated by ','
	# E.g. 'ABC123,BCD234,CDE345'
	IN EquipmentSetIN varchar(255)
)
BEGIN
	DECLARE ShouldUnion, strLen, SubStrLen INT DEFAULT 0;
	SET @resultQuery = NULL;

	DROP TABLE IF EXISTS `temp`;
	CREATE TABLE temp (
		temp_serial varchar(20)
	);

	IF EquipmentSetIN IS NULL THEN
		SET EquipmentSetIN = '';
	END IF;
	
	SET ShouldUnion = LENGTH(EquipmentSetIN);

	Check_Equipment: LOOP
		SET strLen = LENGTH(EquipmentSetIN);

		INSERT INTO temp (temp_serial)
		VALUES (SUBSTRING_INDEX(EquipmentSetIN, ',', 1));

		SET SubStrLen = LENGTH(SUBSTRING_INDEX(EquipmentSetIN, ',', 1));
		SET EquipmentSetIN = MID(EquipmentSetIN, SubStrLen, strLen - SubStrLen);

		IF EquipmentSetIN = '' THEN
			LEAVE Check_Equipment;
		END IF;
	END LOOP Check_Equipment;
	
	IF (ShouldUnion = 0) THEN
		SET @resultQuery = CONCAT("SELECT ConsultationTime FROM appointment WHERE ConsultationDoctor = ",
			CAST(DoctorNoIN AS CHAR),
            " AND ConsultationDate = '",
            ConsultationDateIN,
            "' ORDER BY ConsultationTime;");
	ELSE
		SET @resultQuery = (
			SELECT CONCAT("SELECT ConsultationTime FROM appointment WHERE ConsultationDoctor = ",
			CAST(DoctorNoIN AS CHAR),
            " AND ConsultationDate = '",
            ConsultationDateIN,
            "'",
				GROUP_CONCAT(
					DISTINCT CONCAT(" UNION (SELECT appointment.ConsultationTime FROM appointment INNER JOIN appointmentequipment ON appointment.AppointmentID = appointmentequipment.AppointmentID WHERE appointment.ConsultationDate = '",
						ConsultationDateIN,
                        "' AND appointmentequipment.EquipmentSerial = '",
						temp_serial,
						"')")
					SEPARATOR ''),
				";"
			)
            FROM temp
		);
	END IF;
    
	DROP TABLE IF EXISTS `temp`;
    
	PREPARE stmt FROM @resultQuery;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MANAGEAPPOINTMENT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MANAGEAPPOINTMENT`(
	IN USERID int(10),
	IN USERTYPE varchar(10),
	IN AppointmentIDIN int(8),
	IN AppointmentArrangedByIDIN int(10),
	IN AppointmentClinicIN int(3),
	IN ConsultationTimeIN varchar(20),
	IN ConsultationDoctorIN int(5),
	IN ConsultationDateIN varchar(20),
	IN ConsultationTypeIN varchar(20),
	IN PatientNoIN int(10)
)
BEGIN
	DECLARE AppointmentConfirmationIN varchar(10);
	DECLARE AppointmentRequestIN varchar(20);
	DECLARE AppointmentResolveIN varchar(20);

	SET AppointmentRequestIN = CAST(DATE_FORMAT(NOW(), '%d/%m/%Y %k:%i') AS CHAR);
	SET AppointmentResolveIN = CAST(DATE_FORMAT(NOW(), '%d/%m/%Y %k:%i') AS CHAR);

	IF (USERTYPE = "PATIENT") THEN
		SET AppointmentConfirmationIN = "Pending";
	ELSE
		SET AppointmentConfirmationIN = "Confirmed";
	END IF;

	IF AppointmentIDIN IS NULL THEN 
		INSERT INTO appointment (AppointmentArrangedByID, AppointmentClinic, AppointmentRequest, AppointmentResolve, ConsultationTime, ConsultationDoctor, ConsultationDate, ConsultationType, PatientNo, AppointmentConfirmation)
		VALUES (AppointmentArrangedByIDIN, AppointmentClinicIN, AppointmentRequestIN, AppointmentResolveIN, ConsultationTimeIN, ConsultationDoctorIN, ConsultationDateIN, ConsultationTypeIN, PatientNoIN, AppointmentConfirmationIN);
	ELSE
		UPDATE appointment
		SET AppointmentArrangedByID = AppointmentArrangedByIDIN,
			AppointmentClinic = AppointmentClinicIN,
			AppointmentRequest = AppointmentRequestIN,
			AppointmentResolve = AppointmentResolveIN,
			ConsultationTime = ConsultationTimeIN,
			ConsultationDoctor = ConsultationDoctorIN,
			ConsultationDate = ConsultationDateIN,
			ConsultationType = ConsultationTypeIN,
			PatientNo = PatientNoIN,
			AppointmentConfirmation = AppointmentConfirmationIN
		WHERE AppointmentID = AppointmentIDIN;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `REGISTERPATIENT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTERPATIENT`(
	IN PatientFirstName varchar(20),
	IN PatientLastName varchar(30),
	IN PatientAddress varchar(255),
	IN PatientContact int(10),
	IN PatientEmail varchar(255),
	IN PatientDiscountID varchar(9)
)
BEGIN
	INSERT INTO patient (PatientFirstName, PatientLastName, PatientAddress, PatientContact, PatientEmail, PatientDiscountID)
	VALUES (PatientFirstName, PatientLastName, PatientAddress, PatientContact, PatientEmail, PatientDiscountID);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UPDATECERTIFICATION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATECERTIFICATION`(IN CertificationIDIN int(8), IN DoctorNoIN int(3), IN SpecializationIDIN int(3), IN CertificationExpiryIN varchar(20))
BEGIN
IF CertificationIDIN is NULL THEN
	INSERT INTO certification (SpecializationID, CertificationExpiry,DoctorNo)
	values (SpecializationIDIN,
			CertificationExpiryIN,
			DoctorNoIN);
ELSE
	UPDATE certification
    SET SpecializationID = SpecializationIDIN,
		CertificationExpiry = CertificationExpiryIN,
        DoctorNo = DoctorNoIN
    WHERE CertificationIDIN = CertificationID;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-09  2:51:42
