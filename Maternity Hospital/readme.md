# Maternity Hospital
- Store and Manage a Maternity Hospital data. 

## Tech Stack: 
- MySQL

## Data Model: 
- **Entities, Columns, Constrains, indexes**:
    1. Doctors: id, name, email, phone, status
    2. Nurses: id, name, email, phone, status
    3. Staffs: id, name, email, phone, status
    4. Rooms: number, number_of_beds, free_beds;
    5. Patients: id, name, address, phone
    6. Childbirths: id, status, doctor, 
    7. Newborn Babies:
    8. Prescriptions:
    9. Payments:
- **Relationships**:
    1. Childbirth → Doctor (1:n)
    2. Childbirth → Nurse (1:n)
    3. Childbirth → Room (1:1)
    4. Childbirth → Patient (1:1)
    5. Childbirth → Newborn Baby (1:0.1.n)
    6. Newborn Baby → Prescription  (1:n)
    7. Patient → Prescription  (1:n)
    8. Childbirth → Payment (1:1)
    9. Prescription → Payment (1:1)
