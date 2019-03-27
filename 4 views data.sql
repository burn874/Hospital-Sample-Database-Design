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

-- Dump completed on 2018-11-09  2:52:15
