# ASSUMPTIONS

# 1
# WE ARE ASSUMING THAT PRIMARY KEY OF PATIENTS WILL BE USED AS THE USERNAME TO ACCESS THE DATABASE
# GENERALLY NRIC WILL BE USED BUT WE ARE USING INT TO DEMOSTRATION PURPOSES
# WE ARE ALSO ASSUMING THAT PRIMARY KEY OF USERS ARE STORED IN @USERID AND USER TYPE ARE STORED IN @USERTYPE

# 2
# BASIC MYSQL DOES NOT ALLOW FOR DIRECT USER INPUT SUCH AS PROMPT READ FROM KEYBOARD OR MOUSE AS IT'S A DATA REPOSITORY AND ACCESS TOOL
# WEB BASED INTERFACE TO RETREIVE THE INFORMATION ARE USED NORMALLY INSTEAD
# THEY WILL REQUIRE PHP, HTML AND/OR JAVASCRIPT
# HOWEVER, WE WILL ASSUME WE GET ALL THE CORRECT INPUT IN THIS CASE FOR THE PROTOTYPE DEMO

# Other Assumptions:
# Medical supplies mainly refer to medicine, everything else is an equipment 

#################################
# Scheduling Subsystem
#################################

# 1.1/1.2 Register Patient
#################################

# Request Appointment
CALL MANAGEAPPOINTMENT(1 , 'PATIENT', NULL, 3, 4,'13:00',5,'12/03/2018','General',6);
# Confirm Appointment
CALL MANAGEAPPOINTMENT(1 , 'NURSE', 200006,3, 4, '13:00',5,'12/03/2018','General',6);

select * from appointment where patientno = 6;
select * from appointmentequipment where appointmentid = 200006;

# 1.4 Request for Appointment Change
#################################
SELECT * FROM nurse
WHERE ClinicNo = 1
GROUP BY NurseNo;

UPDATE appointment
SET ConsultationTime = '15:00', ConsultationDate = '12/12/2018'
WHERE AppointmentID = 200002;

SELECT * FROM hvch.appointment
WHERE AppointmentID = 200002;
#################################
# Dispensary Subsystem
#################################
# 2.1 Record Consultation Details
#################################
# Start of Consultation
INSERT INTO consultation (AppointmentID, ConsultationStartTime)
VALUES (1, '14:30');
# End of Consultation
UPDATE consultation
SET ConsultationEndTime = '15:00', Description = 'Common Flu'
WHERE ConsultationRecord = 1;

SELECT * FROM consultation;

# Assign Prescription
#################################
INSERT INTO prescription (PrescriptionID, MedicineSerial, PrescriptionQuantity, Prescription, ConsultationRecord, PrescriptionDate)
VALUES (1000010, 'XYZ3211234', 15, '1 after lunch and dinner', 1, '11/12/2018');

SELECT * FROM hvch.prescription
WHERE prescriptionID = 1000010;

#################################
# Equipment/Medical Supplies Subsystem
#################################
# 4.3 Generate Monthly E&S Report
#################################
SELECT * FROM medicalsupplyreport;
SELECT * FROM hvch.nextequipmentmaintenancereport;

# 4.4 Add/Update Equipment Data
#################################
# Add Equipment
INSERT INTO equipment (EquipmentSerial, EquipmentModelName, EquipmentLocation, EquipmentPurchaseDate, EquipmentPurchasePrice, EquipmentVendor, MaintenanceVendor, NextMaintenance, SupplyVendor)
VALUES ('ABC123', 'CHEAPSTUFF', 1, '1-1-2018', 50000.00, 'GIANT', 'NTUC', '1-1-2019', 'PRIME');

# Update Information on Equipment
UPDATE equipment
SET MaintenanceVendor = 'COLDSTORAGE', NextMaintenance = '1-1-2020'
WHERE EquipmentSerial = 'ABC123';

SELECT * FROM equipment
where EquipmentSerial = 'ABC123';

# 4.5 Add/Update Supplies Data
#################################
# Add Medical Supply Item
INSERT INTO medicine (MedicineSerial, MedicineName, MedicineLocation, MedicineType, MedcineRestriction, AmountStock, MedicinePrimaryVendor, MedicineSecondaryVendor)
VALUES ('XYZ321', 'WEED', 1, 'Standard', 'ONLY FOR KIDS', 1000, 1, 2);

SELECT * FROM hvch.medicine;

# Update information on Medical Supply
UPDATE medicine
SET MedicineSecondaryVendor = 3
WHERE MedicineSerial = 'XYZ3211234';

#################################
# Doctor Information
#################################
# 5.1 Track Doctor Profile
#################################
# Add Doctor
INSERT INTO doctor(DoctorNo, ClinicNo)
VALUES(114, 1);

SELECT * FROM doctor 
ORDER BY -DoctorNo;

# Add/Update Doctor Certification
SELECT * FROM hvch.certification 
ORDER BY -CertificationID;

SELECT * FROM hvch.certification 
WHERE CertificationID = 111;

# Import Doctor leave
INSERT INTO doctorleave(DoctorNo, LeaveDate)
VALUES (1, '11/10/2018');

SELECT * FROM doctorleave;

# Export Doctor Appointment Data
	# Doctor's appointment schedule
SELECT AppointmentID, AppointmentClinic, ConsultationTime, ConsultationDate, ConsultationType,
		appointment.PatientNo, CONCAT(patient.PatientFirstName,' ', patient.PatientLastName) as PatientName
FROM appointment, patient
WHERE patient.PatientNo = appointment.PatientNo 
AND ConsultationDoctor = 1
AND (STR_TO_DATE(ConsultationDate,'%d/%m/%Y') BETWEEN CURDATE() AND (CURDATE() + INTERVAL 31 DAY))
ORDER BY STR_TO_DATE(ConsultationDate,'%d/%m/%Y');
	
    # Patient's past history
SELECT * FROM (
	SELECT patient.PatientNo, CONCAT(PatientFirstName,' ', PatientLastName) as PatientName, PatientContact, ConsultationDoctor,
			ConsultationType, 'Description', prescription.MedicineSerial, PrescriptionDate, PrescriptionQuantity, Prescription, 
			MedicineName, MedicineType
	FROM patient,appointment,consultation,prescription,medicine
	WHERE patient.PatientNo = appointment.PatientNo
	AND appointment.AppointmentID = consultation.AppointmentID
	AND consultation.ConsultationRecord = prescription.ConsultationRecord
    AND consultation.ConsultationEndTime IS NOT NULL
	AND prescription.MedicineSerial = medicine.MedicineSerial
	AND AppointmentConfirmation = 'Confirmed'
    AND ConsultationDoctor = 1
	GROUP BY consultation.ConsultationRecord
) as subQuery
ORDER BY PatientNo;
