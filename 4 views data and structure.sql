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
-- Temporary view structure for view `appointmentstatus`
--

DROP TABLE IF EXISTS `appointmentstatus`;
/*!50001 DROP VIEW IF EXISTS `appointmentstatus`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `appointmentstatus` AS SELECT 
 1 AS `AppointmentID`,
 1 AS `AppointmentConfirmation`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `averageconsultation`
--

DROP TABLE IF EXISTS `averageconsultation`;
/*!50001 DROP VIEW IF EXISTS `averageconsultation`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `averageconsultation` AS SELECT 
 1 AS `AverageConsultationTime`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `averageresponse`
--

DROP TABLE IF EXISTS `averageresponse`;
/*!50001 DROP VIEW IF EXISTS `averageresponse`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `averageresponse` AS SELECT 
 1 AS `AverageAppointmentResolve`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `collectprescription`
--

DROP TABLE IF EXISTS `collectprescription`;
/*!50001 DROP VIEW IF EXISTS `collectprescription`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `collectprescription` AS SELECT 
 1 AS `PrescriptionID`,
 1 AS `MedicineSerial`,
 1 AS `ConsultationRecord`,
 1 AS `PrescriptionDate`,
 1 AS `PrescriptionQuantity`,
 1 AS `Prescription`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `equipmentdetails`
--

DROP TABLE IF EXISTS `equipmentdetails`;
/*!50001 DROP VIEW IF EXISTS `equipmentdetails`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `equipmentdetails` AS SELECT 
 1 AS `EquipmentSerial`,
 1 AS `EquipmentModelName`,
 1 AS `EquipmentLocation`,
 1 AS `EquipmentPurchaseDate`,
 1 AS `EquipmentPurchasePrice`,
 1 AS `EquipmentVendor`,
 1 AS `MaintenanceVendor`,
 1 AS `NextMaintenance`,
 1 AS `SupplyVendor`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `leaveschedule`
--

DROP TABLE IF EXISTS `leaveschedule`;
/*!50001 DROP VIEW IF EXISTS `leaveschedule`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `leaveschedule` AS SELECT 
 1 AS `LEAVEID`,
 1 AS `DoctorNo`,
 1 AS `LeaveDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `medicalsupplyreport`
--

DROP TABLE IF EXISTS `medicalsupplyreport`;
/*!50001 DROP VIEW IF EXISTS `medicalsupplyreport`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `medicalsupplyreport` AS SELECT 
 1 AS `MedicineSerial`,
 1 AS `AmountStock`,
 1 AS `buy`,
 1 AS `sell`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `medicinestock`
--

DROP TABLE IF EXISTS `medicinestock`;
/*!50001 DROP VIEW IF EXISTS `medicinestock`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `medicinestock` AS SELECT 
 1 AS `MedicineSerial`,
 1 AS `MedicineName`,
 1 AS `MedicineLocation`,
 1 AS `MedicineType`,
 1 AS `MedicineRestriction`,
 1 AS `AmountStock`,
 1 AS `MedicinePrimaryVendor`,
 1 AS `MedicineSecondaryVendor`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `nextequipmentmaintenancereport`
--

DROP TABLE IF EXISTS `nextequipmentmaintenancereport`;
/*!50001 DROP VIEW IF EXISTS `nextequipmentmaintenancereport`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `nextequipmentmaintenancereport` AS SELECT 
 1 AS `EquipmentSerial`,
 1 AS `EquipmentModelName`,
 1 AS `EquipmentLocation`,
 1 AS `EquipmentVendor`,
 1 AS `MaintenanceVendor`,
 1 AS `NextMaintenance`,
 1 AS `SupplyVendor`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `qualification`
--

DROP TABLE IF EXISTS `qualification`;
/*!50001 DROP VIEW IF EXISTS `qualification`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `qualification` AS SELECT 
 1 AS `CertificationID`,
 1 AS `SpecializationID`,
 1 AS `DoctorNo`,
 1 AS `CertificationExpiry`*/;
SET character_set_client = @saved_cs_client;

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

--
-- Final view structure for view `appointmentstatus`
--

/*!50001 DROP VIEW IF EXISTS `appointmentstatus`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `appointmentstatus` AS select `appointment`.`AppointmentID` AS `AppointmentID`,`appointment`.`AppointmentConfirmation` AS `AppointmentConfirmation` from `appointment` where (`appointment`.`AppointmentID` = 2) */
/*!50002 WITH CASCADED CHECK OPTION */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `averageconsultation`
--

/*!50001 DROP VIEW IF EXISTS `averageconsultation`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `averageconsultation` AS select sec_to_time(avg(timediff(str_to_date(`consultation`.`ConsultationEndTime`,'%h:%i'),str_to_date(`consultation`.`ConsultationStartTime`,'%h:%i')))) AS `AverageConsultationTime` from `consultation` where ((str_to_date(`consultation`.`ConsultationStartTime`,'%h:%i') is not null) and (str_to_date(`consultation`.`ConsultationEndTime`,'%h:%i') is not null) and (timediff(str_to_date(`consultation`.`ConsultationEndTime`,'%h:%i'),str_to_date(`consultation`.`ConsultationStartTime`,'%h:%i')) > 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `averageresponse`
--

/*!50001 DROP VIEW IF EXISTS `averageresponse`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `averageresponse` AS select sec_to_time(avg(timediff(str_to_date(`appointment`.`AppointmentResolve`,'%d/%c/%Y %h:%i'),str_to_date(`appointment`.`AppointmentRequest`,'%d/%c/%Y %h:%i')))) AS `AverageAppointmentResolve` from `appointment` where ((str_to_date(`appointment`.`AppointmentRequest`,'%d/%c/%Y %h:%i') is not null) and (str_to_date(`appointment`.`AppointmentResolve`,'%d/%c/%Y %h:%i') is not null) and (timediff(str_to_date(`appointment`.`AppointmentResolve`,'%d/%c/%Y %h:%i'),str_to_date(`appointment`.`AppointmentRequest`,'%d/%c/%Y %h:%i')) > 0) and (timediff(str_to_date(`appointment`.`AppointmentRequest`,'%d/%c/%Y %h:%i'),str_to_date('09/03/2018','%d/%c/%Y %h:%i')) > 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `collectprescription`
--

/*!50001 DROP VIEW IF EXISTS `collectprescription`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `collectprescription` AS select `prescription`.`PrescriptionID` AS `PrescriptionID`,`prescription`.`MedicineSerial` AS `MedicineSerial`,`prescription`.`ConsultationRecord` AS `ConsultationRecord`,`prescription`.`PrescriptionDate` AS `PrescriptionDate`,`prescription`.`PrescriptionQuantity` AS `PrescriptionQuantity`,`prescription`.`Prescription` AS `Prescription` from `prescription` where (`prescription`.`ConsultationRecord` = 1) */
/*!50002 WITH CASCADED CHECK OPTION */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `equipmentdetails`
--

/*!50001 DROP VIEW IF EXISTS `equipmentdetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `equipmentdetails` AS select `equipment`.`EquipmentSerial` AS `EquipmentSerial`,`equipment`.`EquipmentModelName` AS `EquipmentModelName`,`equipment`.`EquipmentLocation` AS `EquipmentLocation`,`equipment`.`EquipmentPurchaseDate` AS `EquipmentPurchaseDate`,`equipment`.`EquipmentPurchasePrice` AS `EquipmentPurchasePrice`,`equipment`.`EquipmentVendor` AS `EquipmentVendor`,`equipment`.`MaintenanceVendor` AS `MaintenanceVendor`,`equipment`.`NextMaintenance` AS `NextMaintenance`,`equipment`.`SupplyVendor` AS `SupplyVendor` from `equipment` where (`equipment`.`EquipmentSerial` = 'ABC123') */
/*!50002 WITH CASCADED CHECK OPTION */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `leaveschedule`
--

/*!50001 DROP VIEW IF EXISTS `leaveschedule`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `leaveschedule` AS select `doctorleave`.`LEAVEID` AS `LEAVEID`,`doctorleave`.`DoctorNo` AS `DoctorNo`,`doctorleave`.`LeaveDate` AS `LeaveDate` from `doctorleave` where ((`doctorleave`.`DoctorNo` = 1) and (str_to_date(`doctorleave`.`LeaveDate`,'%d/%m/%Y') = str_to_date(((10 / 10) / 2018),'%d/%m/%Y'))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `medicalsupplyreport`
--

/*!50001 DROP VIEW IF EXISTS `medicalsupplyreport`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `medicalsupplyreport` AS select `medicine`.`MedicineSerial` AS `MedicineSerial`,`medicine`.`AmountStock` AS `AmountStock`,sum(`increase`.`buy`) AS `buy`,sum(`decrease`.`sell`) AS `sell` from ((`medicine` left join (select `prescription`.`MedicineSerial` AS `MedicineSerial`,`prescription`.`PrescriptionQuantity` AS `sell` from `prescription` where (str_to_date(`prescription`.`PrescriptionDate`,'%d/%m/%Y') between date_format(now(),'%Y-%m-01') and now())) `decrease` on((`medicine`.`MedicineSerial` = `decrease`.`MedicineSerial`))) left join (select `medicinepurchase`.`MedicineSerial` AS `MedicineSerial`,`medicinepurchase`.`MedicinePurchaseQuantity` AS `buy` from `medicinepurchase` where (str_to_date(`medicinepurchase`.`MedicinePurchaseDate`,'%d/%m/%Y') between date_format(now(),'%Y-%m-01') and now())) `increase` on((`medicine`.`MedicineSerial` = `increase`.`MedicineSerial`))) where ((`increase`.`buy` is not null) or (`decrease`.`sell` is not null)) group by `medicine`.`MedicineSerial` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `medicinestock`
--

/*!50001 DROP VIEW IF EXISTS `medicinestock`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `medicinestock` AS select `medicine`.`MedicineSerial` AS `MedicineSerial`,`medicine`.`MedicineName` AS `MedicineName`,`medicine`.`MedicineLocation` AS `MedicineLocation`,`medicine`.`MedicineType` AS `MedicineType`,`medicine`.`MedicineRestriction` AS `MedicineRestriction`,`medicine`.`AmountStock` AS `AmountStock`,`medicine`.`MedicinePrimaryVendor` AS `MedicinePrimaryVendor`,`medicine`.`MedicineSecondaryVendor` AS `MedicineSecondaryVendor` from `medicine` where (`medicine`.`MedicineSerial` = 'XYZ3211234') */
/*!50002 WITH CASCADED CHECK OPTION */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `nextequipmentmaintenancereport`
--

/*!50001 DROP VIEW IF EXISTS `nextequipmentmaintenancereport`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `nextequipmentmaintenancereport` AS select `equipment`.`EquipmentSerial` AS `EquipmentSerial`,`equipment`.`EquipmentModelName` AS `EquipmentModelName`,`equipment`.`EquipmentLocation` AS `EquipmentLocation`,`equipment`.`EquipmentVendor` AS `EquipmentVendor`,`equipment`.`MaintenanceVendor` AS `MaintenanceVendor`,`equipment`.`NextMaintenance` AS `NextMaintenance`,`equipment`.`SupplyVendor` AS `SupplyVendor` from `equipment` where (str_to_date(`equipment`.`NextMaintenance`,'%d/%m/%Y') between curdate() and (curdate() + interval 61 day)) order by str_to_date(`equipment`.`NextMaintenance`,'%d/%m/%Y') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `qualification`
--

/*!50001 DROP VIEW IF EXISTS `qualification`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `qualification` AS select `certification`.`CertificationID` AS `CertificationID`,`certification`.`SpecializationID` AS `SpecializationID`,`certification`.`DoctorNo` AS `DoctorNo`,`certification`.`CertificationExpiry` AS `CertificationExpiry` from `certification` where ((`certification`.`DoctorNo` = 5) and (str_to_date(`certification`.`CertificationExpiry`,'%d/%m/%Y') > curdate())) */
/*!50002 WITH CASCADED CHECK OPTION */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-09  2:47:59
