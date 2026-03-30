## Blood Bank
- It collect, store and transfer blood.

## Tech Stack: 
- MySQL

## Business Rules
- A Donor donates blood, and the process is handled by Staff
- Each Donation creates one or more Blood Units
- Each Blood Unit has a Blood Type (A, B, AB, O with Rh factor)
- Each Blood Unit is tested before it can be used
- Each Blood Type is managed in Inventory
- A Patient (or hospital) makes a Blood Request
- Each Transfusion is performed by Staff
- After transfusion, the Blood Unit is removed from Inventory

## Data Model: 
- **Entities & Attributes:**
 - Bank_Staffs
 - Blood_Doners
 - Blood_Donations
 - Blood_Units
 - Blood_Types
 - Blood_Tests
 - Blood_Type_Inventory
 - Patients
 - Blood_Requests
 - Blood_Transfusion

- **Relationships:**