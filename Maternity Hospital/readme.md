# Maternity Hospital
- Store and Manage a Maternity Hospital data. 

## Tech Stack: 
- MySQL

## Data Model: 
- **Entities & Attributes (Constraints, Indexes):**

  - **Staffs**
    - id (Primary Key, Auto Increment, Not Null)
    - name (Not Null, Indexed)
    - email (Not Null, Unique)
    - phone (Not Null)
    - role (Enum: (Doctor, Nurse, Helper))
    - status (Enum: Active, Inactive, On Break)

  - **Patients**
    - id (Primary Key, Auto Increment, Not Null)
    - name (Not Null, Indexed)
    - address
    - phone (Not Null)

  - **Childbirths**
    - id (Primary Key, Auto Increment, Not Null)
    - dateTime (Not Null)
    - patient_id (Foreign Key → Patients.id, Not Null)
    - status (Enum: Natural, Surgical)
    - Associated Staffs: via Childbirth_Staffs junction table

  - **Childbirth_Staffs** (Junction Table)
    - id (Primary Key, Auto Increment, Not Null)
    - childbirth_id (Foreign Key → Childbirths.id, Not Null)
    - staff_id (Foreign Key → Staffs.id, Not Null)

  - **Newborn_Babies**
    - id (Primary Key, Auto Increment, Not Null)
    - childbirth_id (Foreign Key → Childbirths.id, Not Null)
    - status (Enum: Healthy, Sick, Deceased)

  - **Prescriptions**
    - id (Primary Key, Auto Increment, Not Null)
    - patient_id (Foreign Key → Patients.id, Null)
    - newborn_baby_id(Foreign Key → Newborn_Babies.id,Null)
    - imageURL (Not Null)
    - Note: The application decides which column (patient_id or newborn_baby_id) to fill

  - **Payments**
    - id (Primary Key, Auto Increment, Not Null)
    - prescription_id (Foreign Key → Prescriptions.id, Null)
    - childbirths_id (Foreign Key → Childbirths.id, Null)
    - amount (Not Null, Positive)
    - date (Not Null)

- **Relationships**
  - **Staffs** ↔ **Childbirths**: Many-to-Many via Childbirth_Staffs
  - **Childbirths** → **Childbirth_Staffs**: One-to-Many
  - **Staffs** → **Childbirth_Staffs**: One-to-Many
  - **Patients** → **Childbirths**: One-to-Many
  - **Childbirths** → **Newborn_Babies**: One-to-Many
  - **Newborn_Babies** → **Prescriptions**: One-to-Many
  - **Patients** → **Prescriptions**: One-to-Many
  - **Childbirths** → **Payments**: One-to-One
  - **Prescriptions** → **Payments**: One-to-One


## Enhanced Entity–Relationship Diagram:

![EER Diagram](EER%20Diagram.png)
