# Day 14 - Flow Governance and Approval Processes

# College Management System

---

# Approval Workflow Examples

Approval workflows ensure that important actions are reviewed and approved by authorized individuals before they take effect.

### Benefits

* Improves accountability
* Prevents unauthorized changes
* Maintains compliance
* Reduces business risks
* Ensures proper governance

---

# Multi-Level Approval Design

## 1. Course Creation Approval Workflow

### Purpose

A new course cannot be added directly to the system without approval.

### Approval Process

Faculty Member
↓
Department Head
↓
Academic Dean
↓
Registrar
↓
Course Activated

### Approval Order

#### Step 1: Department Head

Reviews:

* Course relevance
* Curriculum alignment

#### Step 2: Academic Dean

Reviews:

* Academic standards
* Resource availability

#### Step 3: Registrar

Reviews:

* Registration requirements
* Course catalog integration

### After Approval

* Course record becomes Active.
* Students can enroll.
* Notification sent to faculty.

### After Rejection

* Course status becomes Rejected.
* Comments sent back to requester.

---

## 2. Faculty Leave Request Workflow

### Purpose

Faculty leave requests require management approval.

### Approval Process

Faculty Member
↓
Department Head
↓
Principal
↓
Leave Approved

### Approval Order

#### Step 1: Department Head

Reviews:

* Faculty workload
* Class schedules

#### Step 2: Principal

Reviews:

* Institutional impact

### After Approval

* Leave status updated.
* Timetable adjusted.
* Notifications sent.

### After Rejection

* Leave request closed.
* Rejection reason communicated.

---

## 3. Student Scholarship Request Workflow

### Purpose

Scholarships require multiple levels of verification.

### Approval Process

Student
↓
Scholarship Committee
↓
Finance Officer
↓
Principal
↓
Scholarship Granted

### Approval Order

#### Step 1: Scholarship Committee

Reviews:

* Academic performance
* Eligibility criteria

#### Step 2: Finance Officer

Reviews:

* Budget availability

#### Step 3: Principal

Final approval.

### After Approval

* Scholarship record activated.
* Fee adjustment processed.
* Student notified.

### After Rejection

* Request closed.
* Student receives explanation.

---

## 4. Budget Approval Workflow

### Purpose

Large financial expenditures require strict governance.

### Approval Process

Department Manager
↓
Finance Officer
↓
Principal
↓
Management Board
↓
Budget Approved

### Approval Order

#### Step 1: Finance Officer

Validates financial details.

#### Step 2: Principal

Reviews institutional necessity.

#### Step 3: Management Board

Provides final authorization.

### After Approval

* Budget released.
* Procurement process begins.

### After Rejection

* Budget request closed.
* Revision may be requested.

---

# Branching Flow Logic

## Attendance Monitoring Flow

This flow automatically evaluates student attendance and performs different actions based on attendance percentage.

### Flow Start

Attendance Record Updated

↓

### Decision Point

Check Attendance Percentage

---

## Branch 1: Attendance ≥ 75%

### Condition

Attendance is 75% or higher.

### Action

* No warning generated.
* Student remains in good standing.

### Outcome

Attendance status = Normal

---

## Branch 2: Attendance < 75%

### Condition

Attendance falls below 75%.

### Action

* Warning email sent to student.
* Attendance warning record created.

### Outcome

Student informed about attendance shortage.

---

## Branch 3: Attendance < 60%

### Condition

Attendance falls below 60%.

### Action

* Parent notification sent.
* Student flagged for monitoring.

### Outcome

Parents become aware of attendance issues.

---

## Branch 4: Attendance < 50%

### Condition

Attendance falls below 50%.

### Action

* Escalation sent to Administrator.
* Academic counselor assigned.
* Intervention process initiated.

### Outcome

Administrative action required.

---

# Flow Diagram

Attendance Updated
↓
Decision

IF Attendance ≥ 75%
→ No Action

IF Attendance < 75%
→ Warning Email

IF Attendance < 60%
→ Parent Notification

IF Attendance < 50%
→ Admin Escalation

---

# Decision Points

Decision points determine which path the flow follows.

### Decision 1

Is Attendance < 75%?

If Yes:

* Send warning email.

### Decision 2

Is Attendance < 60%?

If Yes:

* Notify parents.

### Decision 3

Is Attendance < 50%?

If Yes:

* Escalate to administration.

---

# Actions Triggered

### Student Warning Email

Purpose:

Inform student of attendance risk.

---

### Parent Notification

Purpose:

Involve parents when attendance becomes critical.

---

### Admin Escalation

Purpose:

Enable intervention before academic failure occurs.

---

# Governance Explanation

Governance refers to the policies, controls, and approval mechanisms that ensure business processes operate safely and correctly.

Enterprise systems require governance because important records affect many people and processes.

---

# Governance Thinking

## Why Can't Everyone Directly Change Important Records?

Allowing unrestricted access creates significant risks.

---

## Security Risks

### Problem

Unauthorized users may modify sensitive information.

Examples:

* Student records
* Scholarship approvals
* Budget allocations

### Result

Data confidentiality may be compromised.

---

## Misuse Risks

### Problem

Users may intentionally or unintentionally make incorrect changes.

Examples:

* Changing attendance records
* Modifying grades
* Approving unauthorized requests

### Result

System integrity is affected.

---

## Wrong Approvals

### Problem

Unqualified users approve critical decisions.

Examples:

* Scholarship approval
* Faculty leave approval
* Budget approval

### Result

Incorrect business decisions.

---

## Business Risks

### Problem

Incorrect data affects organizational operations.

Examples:

* Wrong student enrollments
* Budget overspending
* Academic compliance violations

### Result

Financial and operational losses.

---

# Governance Controls

Enterprise systems use controls such as:

### Role-Based Access

Users only access authorized data.

### Approval Processes

Critical actions require approval.

### Audit Trails

Every change is recorded.

### Validation Rules

Invalid data is prevented.

### Automated Flows

Business policies are enforced automatically.

---

# Reflection

This exercise helped me understand the importance of approval workflows, branching flow logic, and governance in enterprise systems. I learned how multi-level approvals ensure accountability and reduce risks when handling course creation, leave requests, scholarships, and budgets. The attendance monitoring example demonstrated how Salesforce Flows use decision points and branches to automate business actions. I also understood why governance is critical in large organizations, where security, misuse prevention, approval controls, and business risk management must be carefully enforced. Overall, this activity strengthened my understanding of Salesforce automation and enterprise process management.

