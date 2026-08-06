# 📅 Sprint 6 - Trigger Development & Automatic Appointment Validation

## 📌 Objective

The objective of Sprint 6 was to automate appointment validation using Apex Triggers. Instead of allowing manual validation, the system now validates every appointment automatically before it is saved, ensuring data integrity and enforcing business rules.

---

# 📚 Concepts Learned

## Apex Triggers

Studied how Apex Triggers execute automatically in response to database events.

### Trigger Events

- Before Insert
- Before Update
- After Insert
- After Update
- Before Delete
- After Delete

### Trigger Context Variables

- `Trigger.new`
- `Trigger.old`
- `Trigger.newMap`
- `Trigger.oldMap`
- `Trigger.isBefore`
- `Trigger.isAfter`
- `Trigger.isInsert`
- `Trigger.isUpdate`

---

# Business Requirement

Whenever a receptionist creates a new appointment:

- Validation should happen automatically.
- No manual validation button is required.
- Invalid appointments should not be saved.
- Business rules should be enforced before the record is inserted.

---

# Architecture

```text
User Creates Appointment
        │
        ▼
AppointmentTrigger
(before insert)
        │
        ▼
AppointmentService.validateAppointments()
        │
        ▼
Validate Patient
Validate Doctor
Validate Appointment Date
Validate Doctor Availability
        │
        ▼
If Valid
        │
        ▼
Appointment Saved

If Invalid
        │
        ▼
Display Validation Error
```

---

# Development Work

## AppointmentTrigger

Created an Apex Trigger on the `Appointment__c` object.

### Trigger Events Implemented

- Before Insert
- After Insert
- After Update

### Responsibilities

- Delegate validation to `AppointmentService`
- Keep trigger logic lightweight
- Follow the Single Responsibility Principle

---

## AppointmentService

Implemented centralized validation logic.

### Validations Implemented

- Patient exists
- Doctor exists
- Appointment date is provided
- Appointment date is in the future
- Doctor is available for the selected time
- Prevent duplicate appointment bookings

---

## AppointmentSelector

Used selector methods to separate SOQL queries from business logic.

### Implemented Methods

- `patientExists()`
- `doctorExists()`
- `isDoctorAvailable()`
- `getAppointmentHistory()`
- `getAppointmentById()`

---

# Trigger Design Pattern

Implemented a Service Layer architecture.

```text
AppointmentTrigger
        │
        ▼
AppointmentService
        │
        ▼
AppointmentSelector
        │
        ▼
Database (SOQL)
```

### Benefits

- Clean trigger
- Reusable business logic
- Better maintainability
- Easier testing
- Separation of concerns

---

# Validation Rules Implemented

- Patient must exist.
- Doctor must exist.
- Appointment date cannot be empty.
- Appointment date cannot be in the past.
- Doctor cannot have two appointments at the same date and time.

---

# Apex Concepts Practiced

- Apex Triggers
- Trigger Context Variables
- Service Layer Pattern
- Selector Pattern
- Business Logic Separation
- SOQL Queries
- Validation using `addError()`
- Before Insert Trigger
- After Insert Trigger
- After Update Trigger

---

# Project Structure

```text
AppointmentTrigger
        │
        ▼
AppointmentService
        │
        ▼
AppointmentSelector
```

---

# Files Created / Updated

- AppointmentTrigger.cls
- AppointmentService.cls
- AppointmentSelector.cls

---

# Sprint Outcome

Successfully automated appointment validation using Apex Triggers and a Service Layer architecture. The trigger now validates appointments before they are saved, ensuring only valid records are inserted while maintaining clean, reusable, and scalable Apex code following Salesforce best practices.
