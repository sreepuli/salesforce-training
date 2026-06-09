# Salesforce Apex Triggers and SOQL

## 1. What is SOQL?

SOQL (Salesforce Object Query Language) is a query language used in Salesforce to retrieve records from Salesforce objects. It is similar to SQL but is specially designed for Salesforce data.

SOQL is used to:
- Fetch records from objects
- Filter data using conditions
- Retrieve related object data
- Perform aggregate operations like COUNT()

### Example

```apex
List<Account> accounts = [SELECT Id, Name FROM Account];
```

This query retrieves the Id and Name fields from the Account object.

---

# 2. What is an Apex Trigger?

An Apex Trigger is a piece of Apex code that executes automatically when specific events occur on Salesforce records.

Triggers run when records are:
- Inserted
- Updated
- Deleted
- Undeleted

Triggers help automate business processes and enforce business rules.

### Example

```apex
trigger AccountTrigger on Account(before insert) {

    for(Account acc : Trigger.new) {

        acc.Description = 'New Account Created';

    }
}
```

This trigger automatically adds a description before a new Account record is saved.

---

# 3. Difference

## Flow vs Trigger

| Flow | Trigger |
|------|------|
| No-code automation tool | Code-based automation |
| Easy for admins | Requires Apex programming |
| Best for simple automation | Best for complex logic |
| Limited flexibility | Highly customizable |
| Slower for complex operations | Faster and scalable |
| Drag-and-drop interface | Written in Apex language |

---

## Before Trigger vs After Trigger

| Before Trigger | After Trigger |
|------|------|
| Runs before saving records | Runs after saving records |
| Used for validation and updating field values | Used for related record operations |
| Faster execution | Slightly slower |
| Record Id may not exist yet | Record Id is available |
| Can directly modify records | Cannot directly modify same records |

---

# 4. Trigger Use Cases (5 Examples)

## 1. Auto Generate Student ID
When a new student record is inserted, a trigger automatically generates a unique Student ID.

---

## 2. Prevent Duplicate Email Registration
Before inserting a contact, a trigger checks whether the email already exists.

---

## 3. Automatic Welcome Email
After a customer account is created, a trigger sends a welcome email automatically.

---

## 4. Update Inventory Automatically
When an order is placed, a trigger decreases the available stock quantity.

---

## 5. Create Attendance Record
After inserting a student record, a trigger automatically creates a monthly attendance record.

---

# 5. Query Examples (English Query Ideas)

## Example 1
Retrieve all Accounts whose Industry is IT.

```apex
SELECT Id, Name FROM Account WHERE Industry = 'IT'
```

---

## Example 2
Find Contacts whose last name is Smith.

```apex
SELECT Id, Name FROM Contact WHERE LastName = 'Smith'
```

---

## Example 3
Retrieve all Opportunities with amount greater than 50000.

```apex
SELECT Id, Name, Amount FROM Opportunity WHERE Amount > 50000
```

---

## Example 4
Find all students created today.

```apex
SELECT Id, Name FROM Student__c WHERE CreatedDate = TODAY
```

---

## Example 5
Retrieve Accounts along with their related Contacts.

```apex
SELECT Name, (SELECT FirstName, LastName FROM Contacts) FROM Account
```

---

# 6. Reflection

Enterprise systems react automatically to data changes because modern business applications handle thousands or millions of records every day. Manual monitoring is impossible at such a large scale.

Automatic reactions help organizations:
- Save time
- Reduce human errors
- Maintain data consistency
- Improve customer experience
- Automate repetitive tasks

Using tools like Apex Triggers and Flows, Salesforce can instantly respond whenever data changes occur. For example, when a customer places an order, the system can automatically update inventory, generate invoices, send notifications, and create reports without human intervention.

This automation makes enterprise systems faster, smarter, and more reliable.
# Task 1 — Trigger Thinking

## College Management System Trigger Ideas

### 1. Student Registration Trigger

**Event:** After a new student record is inserted

**Action:**
- Send welcome email to the student
- Generate Student ID automatically
- Create student portal login

**Why Needed?**
This helps automate the admission process and reduces manual work.

---

## 2. Course Capacity Trigger

**Event:** After a student enrolls in a course

**Action:**
- Check course seat limit
- If course becomes full:
  - Notify faculty
  - Prevent further registrations

**Why Needed?**
Helps manage classroom capacity efficiently.

---

## 3. Attendance Warning Trigger

**Event:** After attendance record is updated

**Action:**
- If attendance drops below 75%
  - Send warning notification to student
  - Notify parents or mentor

**Why Needed?**
Ensures students maintain required attendance percentage.

---

## 4. Fee Payment Trigger

**Event:** After fee payment record is inserted

**Action:**
- Update fee status to Paid
- Generate payment receipt
- Send confirmation email

**Why Needed?**
Automates fee management and confirmation process.

---

## 5. Exam Result Trigger

**Event:** After exam marks are updated

**Action:**
- Calculate total marks and grade
- Update student result status
- Notify student about published results

**Why Needed?**
Makes result processing faster and reduces manual calculations.

---


