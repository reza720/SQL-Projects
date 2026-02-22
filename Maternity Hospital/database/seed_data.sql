USE Maternity_Hospital;

-- ======================
-- Staffs
-- ======================
INSERT INTO Staffs (name, email, phone, role, status) VALUES
('Ahmad Rahimi', 'ahmad@hospital.com', '0700000001', 'Doctor', 'Active'),
('Fatima Ali', 'fatima@hospital.com', '0700000002', 'Nurse', 'Active'),
('Karim Noor', 'karim@hospital.com', '0700000003', 'Helper', 'On Break');

-- ======================
-- Patients
-- ======================
INSERT INTO Patients (name, address, phone) VALUES
('Zahra Mohammadi', 'Kabul, District 5', '0790000001'),
('Maryam Hussaini', 'Herat, District 2', '0790000002');

-- ======================
-- Childbirths
-- ======================
INSERT INTO Childbirths (dateTime, patient_id, status) VALUES
('2026-02-20 10:30:00', 1, 'Natural'),
('2026-02-21 14:00:00', 2, 'Surgical');

-- ======================
-- Childbirth_Staffs
-- ======================
INSERT INTO Childbirth_Staffs (childbirth_id, staff_id) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 3);

-- ======================
-- Newborn_Babies
-- ======================
INSERT INTO Newborn_Babies (childbirth_id, status) VALUES
(1, 'Healthy'),
(2, 'Sick');

-- ======================
-- Prescriptions
-- ======================
INSERT INTO Prescriptions (patient_id, newborn_baby_id, imageURL) VALUES
(1, NULL, '#.png'),
(NULL, 2, '#.png');

-- ======================
-- Payments
-- ======================
INSERT INTO Payments (prescription_id, childbirths_id, amount, date) VALUES
(1, NULL, 5000.00, '2026-02-20'),
(NULL, 2, 15000.00, '2026-02-21');