# 🏥 Hospital OPD Management System

## Sprint 5 – SOQL, DML & Business Transactions

### 📌 Overview

This sprint focuses on implementing complete business transactions in the Hospital OPD Management System using **SOQL**, **Apex**, and **DML**. The application retrieves business information, validates hospital rules, and performs database operations to support appointment management.

---

## 🎯 Sprint Objective

- Retrieve business information using SOQL.
- Validate hospital business rules using Apex.
- Create and update records using DML.
- Build a complete appointment booking workflow following enterprise software engineering principles.

---

# ✅ Work Completed Today

## US-7 – Retrieve Patient Information

### Objective
Retrieve patient details before booking an appointment.

### Completed
- Retrieved Patient records using SOQL.
- Queried only the required fields.
- Used retrieved information for appointment validation.

---

## US-8 – Retrieve Doctor Details & Availability

### Objective
Retrieve doctor information before confirming an appointment.

### Completed
- Retrieved Doctor records using SOQL.
- Retrieved doctor availability and required appointment details.
- Used doctor information for business validation.

---

## US-9 – Prevent Duplicate Appointments

### Objective
Prevent duplicate appointment bookings.

### Completed
- Retrieved existing Appointment records.
- Checked for duplicate appointments using:
  - Patient
  - Doctor
  - Appointment Date & Time
- Returned validation message when a duplicate appointment exists.

---

## US-10 – Create Appointment

### Objective
Create a new appointment after successful validation.

### Completed
- Validated patient and doctor information.
- Created Appointment record.
- Inserted the Appointment using DML.
- Returned booking confirmation.

---

## US-11 – Update Appointment Status

### Objective
Update appointment status after consultation.

### Completed
- Retrieved Appointment record.
- Updated Appointment Status.
- Saved changes using DML.

---

# 🔄 Business Transaction Flow

```text
Appointment Request
        ↓
Retrieve Patient
        ↓
Retrieve Doctor
        ↓
Check Doctor Availability
        ↓
Check Duplicate Appointment
        ↓
Validate Business Rules
        ↓
Create Appointment
        ↓
Insert Appointment
        ↓
Update Appointment Status
        ↓
Return Confirmation
```

---

# 💻 Salesforce Concepts Practiced

- Apex
- SOQL
- DML
- Business Validation
- Service Layer Design
- Enterprise Business Transactions

---

# 📚 Key Learnings

- SOQL is used to retrieve business information.
- DML is used to create and update records.
- Business validation should always occur before DML operations.
- Retrieve only the fields required for business logic.
- Organize Apex code into reusable service methods for better maintainability.

---

# 📈 Sprint Progress

| User Story | Status |
|------------|--------|
| US-7 – Retrieve Patient Information | ✅ Completed |
| US-8 – Retrieve Doctor Details | ✅ Completed |
| US-9 – Prevent Duplicate Appointments | ✅ Completed |
| US-10 – Create Appointment | ✅ Completed |
| US-11 – Update Appointment Status | ✅ Completed |
| US-12 – Return Meaningful Feedback | ⏳ Pending |

---

# 🚀 Technologies Used

- Salesforce Platform
- Apex
- SOQL
- DML
- VS Code
- Salesforce CLI
- Git & GitHub

---

# 🎯 Outcome

Successfully implemented the core Hospital OPD appointment booking workflow by combining **SOQL**, **Apex**, and **DML**. The application can retrieve patient and doctor information, validate appointment rules, prevent duplicate bookings, create appointments, and update appointment status following enterprise software engineering practices.
