import pandas as pd
import numpy as np
import names
from collections import Counter
import operator
import random
from random import randrange
from datetime import timedelta, datetime
import faker
import math
from math import sin, cos, sqrt, atan2, radians
import string

# Global Variables
faker = faker.Faker()
pd.options.mode.chained_assignment = None

def random_date(start, end):
    """
    This function will return a random datetime between two datetime
    objects.
    """
    delta = end - start
    int_delta = (delta.days * 24 * 60 * 60) + delta.seconds
    random_second = randrange(int_delta)
    return start + timedelta(seconds=random_second)

def random_ic(size):
    """
    This function will return a set of nric of len = size
    """
    ic_check = ['J', 'Z', 'I', 'H', 'G', 'F', 'E', 'D', 'C', 'B', 'A']
    ic_sum = [2, 7, 6, 5, 4, 3, 2]
    ic_set = set()
    
    while len(ic_set) < size:
        temp = 0
        for x in ic_sum:
            num = random.randint(0, 9)
            check = num * x
            temp = temp * 10 + num
        ic_set.add('S' + str(temp) + ic_check[check % len(ic_check)])
        

# Number to Generate
patient_gen = 50000
doc_gen = int(patient_gen * 2.276 / 1000)
clinic_gen = int(doc_gen / 5)
nurse_gen = int(patient_gen * 7.12 / 1000)
equip_gen = int(patient_gen / 50)
app_gen = int(patient_gen * 4)

# Discount
discount_type = ['Normal', 'Needy', 'Desperate']
discount_value = [1, 0.8, 0.5]

# Phone Number
MAX_PHONE = 98999999
MIN_PHONE = 80000000

# Land Line
MAX_NO = 69999999
MIN_NO = 60000000

# Medicine Vendors
med_vendor_list = ['Johnson & Johnson', 'Novartis', 'Pfizer', 'Roche', 'AbbVie', 'Merck & Co.', 'Sanofi', 'Bayer', 'Bristol-Myers Squibb', 'Eli Lilly']

# Specialization
spec_type = ["Anaesthesiology", "Cardiology", "Cardiothoracic Surgery", "Dermatology", "Diagnostic Radiology", "Emergency Medicine", "Endocrinology", "Gastroenterology", "General Surgery", "Geriatric Medicine", "Haematology", "Hand Surgery", "Infectious Diseases", "Internal Medicine", "Medical Oncology", "Neurology", "Neurosurgery", "Nuclear Medicine", "Obstetrics & Gynaecology", "Occupational Medicine", "Ophthalmology", "Orthopaedic Surgery", "Otorhinolaryngology/ENT", "Paediatric Medicine", "Paediatric Surgery", "Pathology", "Plastic Surgery", "Psychiatry", "Public Health", "Radiation Oncology", "Rehabilitation Medicine", "Renal Medicine", "Respiratory Medicine", "Rheumatology", "Urology"]

# Medicine Inventory
common_med = ['Hydroxyzine', 'Lantus', 'Triamcinolone', 'Ventolin HFA', 'Pioglitazone', 'Naproxen', 'Lantus Solostar', 'Gabapentin', 'Ciprofloxacin', 'Escitalopram', 'Crestor', 'Latanoprost Ophthalmic', 'Doxycycline Hyclate', 'Zolpidem Tartrate', 'Fluoxetine', 'Alprazolam', 'Levofloxacin', 'Clonidine', 'Cialis', 'Fluticasone', 'Amoxicillin/Clavulanate', 'Metoprolol Tartrate', 'Simvastatin', 'Esomeprazole', 'Lyrica', 'Losartan', 'Atenolol', 'Testosterone', 'Ondansetron', 'Finasteride', 'Losartan Potassium', 'Glimepiride', 'Fenofibrate', 'Furosemide', 'Cefdinir', 'Methylprednisolone', 'Tamsulosin', 'Vitamin D', 'Valsartan/Hydrochlorothiazide', 'Tramadol HCL', 'Ibuprofen', 'Amlodipine Benazepril', 'Lovastatin', 'SMZ-TMP DS', 'Pravastatin', 'Topiramate', 'Omeprazole', 'Quetiapine', 'Lisinopril/Hydrochlorothiazide', 'Carvedilol', 'Celecoxib', 'Benzonatate', 'Valacyclovir', 'Acetaminophen', 'Sulfamethoxazole/Trimethoprim', 'Viagra', 'Diazepam', 'Armour Thyroid', 'Sumatriptan', 'Metoprolol', 'Bystolic', 'Proair HFA', 'Cheratussin', 'Bupropion HCL', 'Cyanocobalamin', 'Metformin HCL', 'Montelukast', 'Methylphenidate', 'Bupropion', 'Ferrous Sulfate', 'Oxycodone', 'Sildenafil', 'Warfarin', 'Ramipril', 'Phentermine', 'Cephalexin', 'Bd pen needle', 'Atorvastatin Calcium', 'Trazodone', 'Buprenorphine', 'Clonazepam', 'Folic Acid', 'Methylpred', 'Amlodipine', 'Lamotrigine', 'Acetaminophen/Codeine', 'Metformin', 'Duloxetine', 'Zetia', 'Trazodone HCL', 'Vytorin', 'Tamslosin', 'Januvia', 'Clopidogrel', 'Vitamin D3', 'Amoxicillin', 'Meloxicam', 'Loratadine', 'Sertraline', 'Xarelto', 'Azithromycin', 'Isosorbide Mononitrate', 'Levetiracetam', 'Cetirizine', 'Paroxetine', 'Clindamycin', 'Temazepam', 'ProAir HFA', 'Amphetamine/Dextroamphetamine', 'Carisoprodol', 'Hydrocodone/Acetaminophen', 'Cyclobenzaprine', 'Citalopram', 'Metronidazole', 'Potassium Chloride', 'Tizanidine', 'Triamterene/Hydrochlorothiazide', 'Doxycycline', 'Losartan/Hydrochlorothiazide', 'Metoprolol Succinate', 'Advair Diskus', 'Buprenorphine/Naloxone', 'Synthroid', 'Amlodipine/Benazepril', 'Ranitidine', 'Prednisone', 'Fluconazole', 'Valsartan', 'Estradiol', 'Venlafaxine', 'Levothyroxine', 'Allopurinol', 'Lorazepam', 'Zolpidem', 'Spironolactone', 'Hydrochlorothiazide', 'Pantoprazole', 'Lisinopril', 'Lansoprazole', 'Methocarbamol', 'Promethazine', 'Eszopiclone', 'Oxycodone/Acetaminophen']
drug_type = ['Standard', 'Controlled']
drug_restric = ['Not for infant', 'For Children', 'Adult Only']

# Appointment
arrange_type = ["Phone", "Online"]
app_type_name = ['General', 'Senior Consultant', 'Specialist']
app_type_value = [1, 1.5, 2]

###############################
# Clinic
###############################

# Clinic Contact
gen_set = set()
while len(gen_set) < clinic_gen:
    gen_set.add(random.randint(MIN_NO, MAX_NO))

df = np.array([x + 1 for x in range(len(gen_set))])
df = pd.DataFrame(df)
df.columns = ["ClinicNo"]

df["ClinicName"] = ["Clinic " + str(x + 1) for x in range(len(gen_set))]
df["ClinicContact"] = [int(x) for x in gen_set]

clinic = df
print(clinic.head())
###############################


###############################
# Doctor
# Reference: Clinic
###############################
df = pd.DataFrame(columns=['DoctorNo', 'ClinicNo'],
                      index=[x for x in range(doc_gen)])

for idx in range(doc_gen):
    df["DoctorNo"][idx] = idx + 1
    df["ClinicNo"][idx] = random.choice(clinic['ClinicNo'].tolist())

doctor = df
print(doctor.head())
###############################


###############################
# Nurse
# Reference: Clinic
###############################

# Generate email
email_set = set()
while len(email_set) < nurse_gen:
    mail = names.get_first_name() + "_" + names.get_last_name()
    email_set.add(mail)

df = np.array([x + 1 for x in range(len(email_set))])
df = pd.DataFrame(df)
df.columns = ["NurseNo"]

df["NurseEmail"] = [str(x) + '@hvch.com' for x in email_set]
df["ClinicNo"] = [random.choice(clinic['ClinicNo'].tolist()) for x in email_set]

nurse = df
print(nurse.head())
###############################


###############################
# Specialization
###############################
df = pd.DataFrame(columns=['SpecializationID', 'SpecializationName'],
                      index=[x for x in range(len(spec_type))])

# Generate standard table for surge
spec = pd.DataFrame([x for x in range(len(spec_type))], spec_type)
spec.columns = ["SpecializationID"]
spec["SpecializationName"] = spec_type

print(spec.head())
###############################


###############################
# Certification
# Reference: Doctor, Specialization
###############################
df = pd.DataFrame(columns=['CertificationID', 'SpecializationID', 'DoctorNo', 'CertificationExpiry'],
                      index=[x for x in range(doc_gen)])

for idx in range(doc_gen):
    df["CertificationID"][idx] = idx + 1
    df["SpecializationID"][idx] = random.choice(spec['SpecializationID'].tolist())
    df["DoctorNo"][idx] = random.choice(doctor['DoctorNo'].tolist())
    df["CertificationExpiry"][idx] = (datetime.today() + timedelta(days=random.randint(0,730))).date()

cert = df
print(cert.head())
###############################


###############################
# Discount
###############################

discount = pd.DataFrame(discount_type, discount_value)
discount.columns = ["DiscountName"]
discount["DiscountValue"] = discount_value

print(discount.head())
###############################


###############################
# Patient
# Reference: Discount
###############################

# Patient Contact
gen_set = set()
while len(gen_set) < patient_gen:
    gen_set.add(random.randint(MIN_PHONE, MAX_PHONE))

df = np.array([x + 1 for x in range(len(gen_set))])
df = pd.DataFrame(df)
df.columns = ["PatientNo"]

# Name, Address and Discount
df["PatientFirstName"] = [""] * patient_gen
df["PatientLastName"] = [""] * patient_gen
df["PatientAddress"] = [""] * patient_gen
df["PatientContact"] = [x for x in gen_set]
df["PatientEmail"] = [""] * patient_gen
df["PatientDiscountID"] = [""] * patient_gen

for idx in range(patient_gen):
    df["PatientNo"][idx] = idx + 1
    df["PatientFirstName"][idx] = names.get_first_name()
    df["PatientLastName"][idx] = names.get_last_name()
    fake_address = faker.address()
    while ',' not in fake_address or len(fake_address) < 20 or 'PSC' in fake_address or 'Box' in fake_address:
        fake_address = faker.address()
    df["PatientAddress"][idx] = fake_address.replace('\n', ' ').split(',')[0]
    df["PatientEmail"][idx] = df["PatientFirstName"][idx] + '_' + df["PatientLastName"][idx] + '@gmail.com'
    df["PatientDiscountID"][idx] = random.choice(discount['DiscountName'].tolist())
    
patient = df
print(patient.head())
###############################


###############################
# Equipment
# Reference: Clinic
###############################
df = pd.DataFrame(columns=['EquipmentSerial', 'EquipmentModelName', 'EquipmentLocation', 'EquipmentPurchaseDate', 'EquipmentPurchasePrice', 'EquipmentVendor', 'MaintenanceVendor', 'NextMaintenance', 'SupplyVendor'],
                      index=[x for x in range(equip_gen)])

for idx in range(equip_gen):
    df["EquipmentSerial"][idx] = ''.join(random.sample(string.ascii_uppercase ,3)) + ''.join(random.sample(string.digits ,7))
    df["EquipmentModelName"][idx] = ''.join(random.sample(string.ascii_uppercase ,20))
    df["EquipmentLocation"][idx] = random.choice(clinic['ClinicNo'].tolist())
    df["EquipmentPurchaseDate"][idx] = (datetime.today() - timedelta(days=random.randint(365,730))).date()
    df["EquipmentPurchasePrice"][idx] = round(random.uniform(10000,100000), 2)
    df["EquipmentVendor"][idx] = names.get_first_name()
    df["MaintenanceVendor"][idx] = names.get_first_name()
    df["NextMaintenance"][idx] = (datetime.today() + timedelta(days=random.randint(0,180))).date()
    df["SupplyVendor"][idx] = names.get_first_name()
    

equip = df
print(equip.head())
###############################


###############################
# Medicine Vendor
###############################

med_vendor = pd.DataFrame([x + 1 for x in range(len(med_vendor_list))], med_vendor_list)
med_vendor.columns = ["MedicineVendorID"]
med_vendor["MedicineVendor"] = med_vendor_list

print(med_vendor.head())
###############################


###############################
# Medicine Restrictions
###############################

med_restric = pd.DataFrame(drug_restric, [x + ' Additional Information' for x in drug_restric])
med_restric.columns = ["MedicineRestriction"]
med_restric["MedicineRestrictionDetail"] = drug_restric

print(med_restric.head())
###############################


###############################
# Medicine Type
###############################

med_type = pd.DataFrame(drug_type, [x + ' Additional Information' for x in drug_type])
med_type.columns = ["MedicineType"]
med_type["MedicineTypeDetail"] = drug_type

print(med_type.head())
###############################


###############################
# Medicine
# Reference: Medicine Vendor, Medicine Purchase, Medicine Type, Medicine Restriction
#
# Medicine Purchase
# Reference: Medicine Vendor, Medicine Purchase, Medicine Type, Medicine Restriction
###############################
df = pd.DataFrame(columns=['MedicineSerial', 'MedicineName', 'MedicineLocation', 'MedicineType', 'MedicineRestriction', 'AmountStock', 'MedicinePrimaryVendor', 'MedicineSecondaryVendor'],
                      index=[x for x in range(len(common_med))])

purchases = []

for idx in range(len(common_med)):
    df["MedicineSerial"][idx] = ''.join(random.sample(string.ascii_uppercase ,3)) + ''.join(random.sample(string.digits ,7))
    df["MedicineName"][idx] = common_med[idx]
    df["MedicineLocation"][idx] = random.choice(clinic['ClinicNo'].tolist())
    df["MedicineType"][idx] = random.choice(med_type['MedicineType'].tolist())
    df["MedicineRestriction"][idx] = random.choice(med_restric['MedicineRestriction'].tolist())
    df["AmountStock"][idx] = 0
    df["MedicinePrimaryVendor"][idx] = random.choice(med_vendor['MedicineVendorID'].tolist())
    df["MedicineSecondaryVendor"][idx] = random.choice(med_vendor['MedicineVendorID'].tolist())

    # Add Purchases
    x_range = random.randint(30, 40)
    price_range = round(random.uniform(0,15), 2)

    for x in range(x_range):
        purchase_amount = random.randint(10, 15) * 100
        df["AmountStock"][idx] += purchase_amount
        purchases.append([len(purchases), df["MedicinePrimaryVendor"][idx], df["MedicineSerial"][idx], purchase_amount * price_range, (datetime.today() - timedelta(days=random.randint(1,365))).date(), purchase_amount])

med_purchase = pd.DataFrame(purchases, columns=['MedicinePurchaseID', 'MedicineVendorID', 'MedicineSerial', 'MedicinePurchasePrice', 'MedicinePurchaseDate', 'MedicinePurhcaseQuantity'])

medicine = df
print(medicine.head())
print(med_purchase.head())
###############################


###############################
# Appointment Arranged Type
###############################
app_arr_type = pd.DataFrame([x + 1 for x in range(len(arrange_type))], arrange_type)
app_arr_type.columns = ["AppointmentArrangedByID"]
app_arr_type["AppointmentArrangedByType"] = arrange_type

print(app_arr_type.head())
###############################


###############################
# Consultation Type
###############################

con_type = pd.DataFrame(app_type_name, app_type_value)
con_type.columns = ["ConsultationType"]
con_type["ConsultationCost"] = app_type_value

print(con_type.head())
###############################


###############################
# Appointment
# Reference: Appointment Arranged Type, Clinic, Consultation Type, Doctor
#
# Consultation
# Reference: Appointment
#
# AppointmentEquipment
# Reference: Appointment
#
# Prescription
###############################
df = pd.DataFrame(columns=['AppointmentID', 'AppointmentArrangedByID', 'AppointmentClinic', 'AppointmentResolve', 'ConsultationTime', 'ConsultationDoctor', 'ConsultationDate', 'ConsultationType', 'PatientNo', 'AppointmentConfirmation'],
                      index=[x for x in range(app_gen)])
consult = []
app_eq = []
pres = []

for idx in range(app_gen):
    df["AppointmentID"][idx] = idx + 1
    df["AppointmentArrangedByID"][idx] = random.choice(app_arr_type['AppointmentArrangedByID'].tolist())
    df["AppointmentClinic"][idx] = random.choice(clinic['ClinicNo'].tolist())
    df["AppointmentResolve"][idx] = (datetime.today() - timedelta(days=random.randint(0,365))).date()
    df["ConsultationTime"][idx] = str(random.randint(8, 17)) + ':' + str(random.randint(0,3) * 15)
    df["ConsultationDoctor"][idx] = random.choice(doctor['DoctorNo'].tolist())
    df["ConsultationDate"][idx] = df["AppointmentResolve"][idx] + timedelta(days=random.randint(7,60))
    df["ConsultationType"][idx] = random.choice(con_type['ConsultationType'].tolist())
    df["PatientNo"][idx] = random.choice(patient['PatientNo'].tolist())
    if (random.randint(0, 1)) and (df["ConsultationDate"][idx] > datetime.today().date()):
        df["AppointmentResolve"][idx] = ""
        df["AppointmentConfirmation"][idx] = "Pending"
    else:
        df["AppointmentConfirmation"][idx] = "Confirmed"

    if (df["ConsultationDate"][idx] < datetime.today().date()):
        consult.append([len(consult) + 1, idx + 1, df["ConsultationTime"][idx],
                        datetime.strftime(datetime.strptime(df["ConsultationTime"][idx], '%H:%M') + timedelta(minutes=random.randint(15,60)), '%H:%M'), 'Description' + str(idx + 1)])

        p = random.randint(0,1) + random.randint(0,1) + random.randint(0,1) + random.randint(0,1) + random.randint(0,1)

        if (random.randint(0,100) > 95) and (datetime.today().date() < df["ConsultationDate"][idx] + timedelta(days=3)):
            d = df["ConsultationDate"][idx] + timedelta(days=random.randint(1,3))
        else:
            d = df["ConsultationDate"][idx]
        
        for n in range(p):
            m = random.choice(medicine['MedicineSerial'].tolist())
            q = random.randint(1,12) * 5
            pres.append([len(pres) + 1, m, len(consult), d, q, 'Prescription Description' + str(len(pres) + 1)])
            medicine['AmountStock'][medicine.index[medicine['MedicineSerial'] == m].tolist()[0]] -= q

        
    if (random.randint(0,100) >= 90):
        app_eq.append([len(app_eq) + 1, idx + 1, random.choice(equip['EquipmentSerial'].tolist())])
        if (random.randint(0,50) >= 49):
            app_eq.append([len(app_eq) + 1, idx + 1, random.choice(equip['EquipmentSerial'].tolist())])
        
consultation = pd.DataFrame(consult, columns=['ConsultationRecord', 'AppointmentID', 'ConsultationStartTime', 'ConsultationEndTime', 'Description'])
app_equip = pd.DataFrame(app_eq, columns=['AppointmentEquipmentID', 'AppointmentID', 'EquipmentSerial'])
prescription = pd.DataFrame(pres, columns=['PrescriptionID', 'MedicalSerial', 'ConsultationRecord', 'PrescriptionDate', 'PrescriptionQuantity', 'Prescription'])
appointment = df

print(appointment.head())
print(consultation.head())
print(app_equip.head())
print(prescription.head())
###############################

doctor.to_csv('data/03doctor.csv', index=False, header=True)
clinic.to_csv('data/01clinic.csv', index=False, header=True)
nurse.to_csv('data/02nurse.csv', index=False, header=True)
spec.to_csv('data/04specialization.csv', index=False, header=True)
cert.to_csv('data/05certification.csv', index=False, header=True)
discount.to_csv('data/06discount.csv', index=False, header=True)
patient.to_csv('data/07patient.csv', index=False, header=True)
equip.to_csv('data/08equipment.csv', index=False, header=True)
med_vendor.to_csv('data/09medicinevendor.csv', index=False, header=True)
med_restric.to_csv('data/10medicinerestriction.csv', index=False, header=True)
med_type.to_csv('data/11medicinetype.csv', index=False, header=True)
medicine.to_csv('data/12medicine.csv', index=False, header=True)
med_purchase.to_csv('data/13medicinepurchase.csv', index=False, header=True)
app_arr_type.to_csv('data/14appointmentarrangedby.csv', index=False, header=True)
con_type.to_csv('data/15consultationtype.csv', index=False, header=True)
appointment.to_csv('data/16appointment.csv', index=False, header=True)
consultation.to_csv('data/17consultation.csv', index=False, header=True)
app_equip.to_csv('data/18appointmentequipment.csv', index=False, header=True)
prescription.to_csv('data/19prescription.csv', index=False, header=True)

