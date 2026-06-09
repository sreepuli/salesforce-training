# Day 9 - LWC Communication

## Component Communication

Component communication in Lightning Web Components (LWC) allows components to exchange data and interact with each other.

### Types of Component Communication

### 1. Parent to Child Communication

Uses public properties decorated with `@api`.

Example:

* Parent component sends student details to a child component.

### 2. Child to Parent Communication

Uses Custom Events.

Example:

* Child component sends attendance update information to the parent component.

### 3. Unrelated Components Communication

Uses:

* Lightning Message Service (LMS)
* Pub/Sub pattern

Example:

* Notification component updates another component without a direct relationship.

---

## Dashboard Design

### College Management Dashboard

The dashboard contains the following components:

### Header Component

* College name
* Navigation menu

### Student Information Component

* Student profile details
* Course information

### Attendance Component

* Attendance percentage
* Attendance history

### Course Allocation Component

* Assigned courses
* Faculty information

### Notification Component

* Announcements
* Alerts and reminders

### Dashboard Layout

Header
│
├── Student Information
├── Attendance Section
├── Course Allocation
└── Notifications Panel

---

## Data Flow Explanation

In LWC applications, data flows through multiple layers.

### Typical Data Flow

User Interface (LWC)
↓
Validation
↓
Flow
↓
Apex Controller
↓
Database
↓
Response Back to UI

### Explanation

#### User Interface

Users enter or modify information.

#### Validation

Checks whether the entered data is valid.

#### Flow

Automates business processes and decision-making.

#### Apex Controller

Processes logic and interacts with Salesforce records.

#### Database

Stores and retrieves data.

#### Response

Updated information is displayed back to the user.

---

## Aura vs LWC

| Feature            | Aura Components                  | Lightning Web Components (LWC) |
| ------------------ | -------------------------------- | ------------------------------ |
| Performance        | Slower                           | Faster                         |
| Framework          | Proprietary Salesforce Framework | Modern Web Standards           |
| Learning Curve     | Complex                          | Easier                         |
| JavaScript Support | Limited                          | Standard JavaScript            |
| Reusability        | Good                             | Better                         |
| Rendering Speed    | Moderate                         | High                           |
| Future Support     | Legacy Technology                | Preferred Technology           |

### Advantages of LWC

* Better performance
* Faster rendering
* Modern development experience
* Improved security
* Easier debugging
* Standards-based architecture

---

## Task 1: Why Salesforce Moved from Visualforce/Aura to LWC

### Visualforce Limitations

* Older technology
* Less responsive user experience
* Not based on modern web standards
* Limited component reusability

### Aura Limitations

* Complex framework
* Additional abstraction layer
* Lower performance compared to LWC
* Harder to maintain large applications

### Why Salesforce Chose LWC

1. Uses modern web standards.
2. Provides faster performance.
3. Reduces framework overhead.
4. Supports reusable components.
5. Improves developer productivity.
6. Enhances user experience.
7. Aligns Salesforce with modern web development practices.

### Evolution

Visualforce
↓
Aura Components
↓
Lightning Web Components (LWC)

LWC is now Salesforce's recommended framework for UI development.

---

## Task 2: Data Flow Thinking

### Selected Process: Student Registration

### Step 1 - User Interface (LWC)

The student enters:

* Student Name
* Roll Number
* Email
* Course

and clicks the Register button.

↓

### Step 2 - Validation

Frontend validation checks:

* Required fields are filled.
* Email format is correct.
* Roll number is entered.

If validation fails, an error message is shown.

↓

### Step 3 - Flow

A Salesforce Flow may:

* Check registration conditions.
* Assign default values.
* Trigger additional automation.

↓

### Step 4 - Apex Controller

The Apex controller:

* Receives student data.
* Applies business rules.
* Creates a Student record.

Example responsibilities:

* Duplicate student checks.
* Eligibility verification.

↓

### Step 5 - Database

Salesforce stores the student record in the database.

Stored Information:

* Student Name
* Roll Number
* Email
* Course
* Registration Date

↓

### Step 6 - Response Back to UI

After successful registration:

* Success message is displayed.
* Student details are refreshed.
* Dashboard updates automatically.

### Complete Flow

Student Registration Form
↓
Validation
↓
Flow Automation
↓
Apex Controller
↓
Salesforce Database
↓
Success Response
↓
Updated User Interface

---

## Reflection

This exercise helped me understand how components communicate in Lightning Web Components and how data moves through the Salesforce platform. I learned the different communication methods such as Parent-to-Child, Child-to-Parent, and Lightning Message Service. I also understood why Salesforce transitioned from Visualforce and Aura to LWC, focusing on better performance and modern web standards. The Student Registration data flow example demonstrated how UI, validation, Flow, Apex, and the database work together to create a complete Salesforce application.

