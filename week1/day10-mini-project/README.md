# Day 10 - Mini Project

# College Management System using Salesforce

---

# System Overview

The College Management System is a Salesforce-based application designed to manage students, courses, attendance, faculty, and notifications.

The system allows:

* Student Registration
* Course Allocation
* Attendance Management
* Faculty Management
* Notifications and Alerts
* Automated Processes using Flows and Apex

The goal is to simplify college administration and improve data management.

---

# CRM Concepts

CRM (Customer Relationship Management) concepts can be applied to educational institutions.

### Student = Customer

Students are treated similarly to customers whose information is managed efficiently.

### Relationships

* Student enrolled in Course
* Faculty assigned to Course
* Attendance linked to Student

### Automation

Automated notifications and record updates improve efficiency.

### Reporting

Reports help management analyze student performance and attendance.

---

# Data Model

## Student Object

Fields:

* Student ID
* Student Name
* Email
* Phone Number
* Course
* Registration Date

## Course Object

Fields:

* Course ID
* Course Name
* Duration
* Faculty

## Attendance Object

Fields:

* Attendance ID
* Student
* Date
* Status

## Faculty Object

Fields:

* Faculty ID
* Faculty Name
* Department

### Relationships

Student
↓
Course

Student
↓
Attendance

Faculty
↓
Course

---

# Validation Rules

Validation rules ensure data quality.

### Rule 1: Email Cannot Be Blank

Error Message:
"Email is required."

### Rule 2: Student Name Required

Error Message:
"Student Name cannot be empty."

### Rule 3: Course Selection Mandatory

Error Message:
"Please select a course."

### Rule 4: Duplicate Student Prevention

Error Message:
"Student already exists."

### Benefits

* Prevents invalid data
* Improves accuracy
* Maintains consistency

---

# Flows

### Student Registration Flow

Purpose:

* Automatically process registrations.
* Assign default status.
* Send welcome notifications.

### Attendance Update Flow

Purpose:

* Update attendance percentage.
* Generate alerts for low attendance.

### Course Allocation Flow

Purpose:

* Assign courses automatically.
* Update student records.

### Benefits

* Reduces manual work.
* Improves efficiency.
* Ensures consistency.

---

# Apex Logic

Apex is used for advanced business logic.

### Student Registration Apex

Responsibilities:

* Check duplicate students.
* Validate business rules.
* Create records.

### Attendance Apex

Responsibilities:

* Calculate attendance percentage.
* Generate warning messages.

### Notification Apex

Responsibilities:

* Send email alerts.
* Generate custom notifications.

### Advantages

* Complex processing
* Better scalability
* Custom business logic

---

# UI Screens

## Student Registration Screen

Functions:

* Enter student details.
* Submit registration.

## Student Dashboard

Functions:

* View profile.
* View enrolled courses.

## Attendance Screen

Functions:

* View attendance records.
* Attendance percentage.

## Faculty Dashboard

Functions:

* Manage courses.
* Manage attendance.

## Notification Screen

Functions:

* Display announcements.
* Show alerts.

---

# Complete Data Flow

## Student Registration Process

### Step 1: Student Clicks Register

The student opens the registration page and enters details.

↓

### Step 2: LWC Screen

The Lightning Web Component collects:

* Name
* Email
* Phone Number
* Course

↓

### Step 3: Validation

Frontend checks:

* Required fields
* Email format
* Course selection

If validation fails:

Error message is displayed.

↓

### Step 4: Flow

Record-Triggered Flow starts.

Flow actions:

* Assign default status.
* Check business conditions.
* Prepare automation tasks.

↓

### Step 5: Apex Trigger

Apex Trigger executes.

Responsibilities:

* Duplicate checks.
* Additional validations.
* Custom business logic.

↓

### Step 6: Database

Student record is saved in Salesforce Database.

Stored data:

* Student details
* Course information
* Registration status

↓

### Step 7: Notification

System automatically sends:

* Welcome Email
* Success Notification
* Admin Alert

↓

### Step 8: Updated User Interface

Student sees:

"Registration Successful"

Dashboard refreshes with updated data.

---

# Architecture Thinking

Enterprise systems require multiple layers working together.

## Frontend

Purpose:

* User interaction
* Forms
* Dashboards
* Display information

Without frontend:
Users cannot interact with the system.

---

## Backend

Purpose:

* Business logic
* Processing requests
* Calculations

Without backend:
No complex processing is possible.

---

## Database

Purpose:

* Store records
* Retrieve information
* Maintain consistency

Without database:
Data cannot be saved permanently.

---

## Automation

Purpose:

* Reduce manual work
* Trigger actions automatically

Examples:

* Emails
* Notifications
* Record updates

Without automation:
Everything must be done manually.

---

## Events

Purpose:

* Real-time communication
* Immediate updates

Examples:

* Notifications
* Record changes
* System alerts

Without events:
Users won't receive real-time updates.

---

# Scaling Thinking

Suppose 50,000 students use the system.

Several challenges may occur.

## Performance Issues

Problems:

* Slow page loading
* Large data processing
* Heavy database queries

Solutions:

* Optimize queries
* Use indexing
* Cache frequently used data

---

## Data Consistency Issues

Problems:

* Duplicate records
* Incorrect updates
* Simultaneous modifications

Solutions:

* Validation rules
* Duplicate management
* Record locking mechanisms

---

## Notification Issues

Problems:

* Delayed emails
* High notification volume

Solutions:

* Queue-based processing
* Batch jobs
* Event-driven architecture

---

## Security Issues

Problems:

* Unauthorized access
* Data leaks
* Role misuse

Solutions:

* Role hierarchy
* Permission sets
* Field-level security
* Encryption

---

# Reflection

This mini project helped me understand how Salesforce applications are designed using CRM concepts, data models, validation rules, Flows, Apex, and Lightning Web Components. I learned how frontend, backend, database, automation, and events work together to create an enterprise application. The project also introduced scalability challenges such as performance, data consistency, notifications, and security when thousands of users access the system. Overall, this exercise improved my understanding of Salesforce architecture and real-world application development.

