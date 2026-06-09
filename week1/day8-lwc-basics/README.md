# Day 8 - LWC Basics

## What is LWC?

**Lightning Web Components (LWC)** is Salesforce's modern UI framework used to build fast, reusable, and responsive web components. It is based on modern web standards such as:

* HTML
* CSS
* JavaScript
* Web Components

LWC helps developers create interactive user interfaces that run efficiently on the Salesforce platform.

---

## Why Salesforce Uses LWC

Salesforce uses LWC because it:

* Provides better performance than older frameworks.
* Uses standard JavaScript and web technologies.
* Supports reusable components.
* Offers faster rendering and improved user experience.
* Makes development easier and more maintainable.
* Integrates seamlessly with Salesforce data and services.

---

## UI Screens

### 1. Student Registration Form

Allows students to register and submit their details.

### 2. Course Dashboard

Displays available courses and enrollment information.

### 3. Attendance View

Shows attendance records and attendance percentage.

### 4. Faculty Panel

Allows faculty members to manage students, courses, and attendance.

### 5. Notifications Widget

Displays important announcements and alerts.

*(Add screenshots of your UI below this section if available.)*

---

## Component Breakdown

### Screen Chosen: Student Dashboard

The Student Dashboard can be divided into the following reusable components:

### Header Component

* Displays college name and navigation menu.
* Reusable across all pages.

### Student Info Component

* Displays student profile details.
* Shows roll number, course, and semester.

### Attendance Component

* Displays attendance percentage.
* Shows attendance history.

### Notification Component

* Displays announcements and alerts.
* Can be reused on multiple screens.

### Course Summary Component

* Shows enrolled courses and progress.

---

## Frontend vs Backend Logic

### Frontend (UI Layer)

The frontend is responsible for displaying information and handling user interactions.

Examples:

* Button click handling
* Form input collection
* Showing notifications
* Displaying attendance records
* Navigation between pages
* Field validation for empty values

### Backend (Apex Layer)

The backend handles business logic and database operations.

Examples:

* Saving student records
* Data validation against database rules
* Fee calculation
* Attendance calculations
* Fetching student data
* Updating course information

---

## Task 1: UI Thinking Exercise

### College Management System - Required UI Screens

1. Student Registration Form
2. Course Dashboard
3. Attendance View
4. Faculty Panel
5. Notifications Widget

### Purpose of Each Screen

| Screen               | Purpose                     |
| -------------------- | --------------------------- |
| Student Registration | Register new students       |
| Course Dashboard     | View and manage courses     |
| Attendance View      | Track attendance records    |
| Faculty Panel        | Manage students and courses |
| Notifications Widget | Display announcements       |

---

## Task 2: Component Thinking

### Selected Screen: Student Dashboard

Breakdown into reusable components:

1. Header Component
2. Student Information Component
3. Attendance Component
4. Course Summary Component
5. Notification Component

### Benefits

* Reusability
* Easier maintenance
* Better organization
* Faster development
* Improved scalability

---

## Task 3: Frontend vs Backend Thinking

| Functionality          | Frontend (UI) | Backend (Apex) |
| ---------------------- | ------------- | -------------- |
| Button Click           | ✓             |                |
| Form Display           | ✓             |                |
| Notification Display   | ✓             |                |
| Data Validation        |               | ✓              |
| Fee Calculation        |               | ✓              |
| Database Operations    |               | ✓              |
| Attendance Calculation |               | ✓              |
| Data Retrieval         |               | ✓              |

### Examples

#### Button Click

Frontend handles button click events and user interaction.

#### Data Validation

Backend validates data before saving to the database.

#### Fee Calculation

Backend calculates total fees and dues.

#### Notification Display

Frontend displays notifications received from backend services.

---

## Reflection

Through this exercise, I learned how Lightning Web Components help in building modular and reusable user interfaces in Salesforce. Breaking a screen into smaller components improves maintainability and scalability. I also understood the difference between frontend responsibilities, such as user interaction and display, and backend responsibilities, such as business logic, calculations, and database operations. This activity helped me think like a Salesforce developer by designing UI components and deciding where application logic should be implemented.


