# 📅 Sprint 7 - Governor Limits, Bulkification & Apex Testing

## 📌 Objective

The objective of Sprint 7 was to understand Salesforce Governor Limits, implement bulkification in the Appointment module, and write Apex test classes to validate the appointment booking functionality using Salesforce best practices.

---

## 📚 Topics Learned

### Governor Limits

Studied why Salesforce enforces Governor Limits in a multi-tenant environment and how they ensure fair resource allocation.

### Governor Limits Covered

| Resource | Limit |
|----------|------:|
| SOQL Queries | 100 |
| DML Statements | 150 |
| Query Rows | 50,000 |
| DML Rows | 10,000 |
| CPU Time | 10,000 ms |

### Key Learnings

- Multi-tenant architecture
- Governor Limits
- SOQL optimization
- DML optimization
- Best practices for scalable Apex code

---

## Bulk Processing

Learned how Salesforce processes records in bulk.

### Concepts Covered

- `Trigger.new` is always a List.
- One trigger execution can process up to **200 records**.
- Apex code must handle multiple records efficiently.

---

## Bulkification

Implemented enterprise-level bulkification by:

- Removing SOQL queries from loops
- Collecting IDs using `Set<Id>`
- Querying related records only once
- Using `Map<Id, SObject>` for lookups
- Validating all records in memory

---

# Development Work

## AppointmentSelector

Added new bulk methods:

- `getPatients(Set<Id> patientIds)`
- `getDoctors(Set<Id> doctorIds)`
- `getAppointments(Set<Id> doctorIds, Set<Datetime> appointmentTimes)`

These methods perform a single SOQL query for multiple records, making the code bulk-safe.

---

## AppointmentService

Refactored appointment validation using the new bulk selector methods.

### Implemented Validations

- Patient existence validation
- Doctor existence validation
- Appointment date validation
- Future date validation
- Doctor availability validation
- Duplicate appointment slot validation

### Collections Used

- `Set<Id>`
- `Set<Datetime>`
- `Map<Id, Patient__c>`
- `Map<Id, Doctor__c>`
- `Set<String>` for booked appointment slots

---

## Bulk Processing Flow

```text
Trigger.new (200 Records)
        │
        ▼
Collect Patient IDs
        │
        ▼
One SOQL Query
        │
        ▼
Patient Map
        │
        ▼
Collect Doctor IDs
        │
        ▼
One SOQL Query
        │
        ▼
Doctor Map
        │
        ▼
Collect Appointment Times
        │
        ▼
One SOQL Query
        │
        ▼
Booked Slot Lookup
        │
        ▼
Validate All Records
        │
        ▼
Insert Appointments
```

---

# Apex Testing

Created **AppointmentServiceTest.cls**

## Test Setup

Created reusable test data using `@testSetup`.

### Test Data

- Department
- Doctor
- Patient

---

## Test Cases

### ✅ testBookAppointment()

Verified:

- Appointment booking
- Status is set to **Scheduled**
- Token number generation
- Successful record insertion

---

### ✅ testBulkBookAppointments()

Verified:

- Bulk insertion of **200 appointments**
- Bulk-safe execution
- No Governor Limit exceptions
- Successful validation of all records

---

### ✅ testInvalidPastAppointment()

Verified:

- Past appointment dates are rejected
- Validation works correctly

---

# Debugging

Resolved test failures by fixing test data.

### Fixes

- Added valid **Phone__c**
- Added required **License_Number__c**
- Created Department record
- Assigned Department to Doctor
- Used valid picklist values
- Fixed required fields

---

# Test Result

```
Outcome      : Passed
Tests Ran    : 4
Pass Rate    : 100%
Fail Rate    : 0%
```

---

# Salesforce Concepts Practiced

- Governor Limits
- Bulk Processing
- Bulkification
- Trigger.new
- SOQL Optimization
- Set Collection
- Map Collection
- Apex Validation
- Apex Test Classes
- @testSetup
- Test.startTest()
- Test.stopTest()
- Enterprise Apex Development

---

# Sprint Outcome

Successfully implemented a bulk-safe Appointment Booking module by eliminating SOQL inside loops, introducing reusable bulk selector methods, refactoring validation logic, and validating the implementation through Apex test classes with **100% successful test execution**.
