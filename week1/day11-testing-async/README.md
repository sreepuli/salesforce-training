# Day 11 - Testing and Asynchronous Processing

# College Management System

---

# Why Testing Matters

Testing is the process of verifying that an application works correctly before it is released to users.

### Importance of Testing

* Identifies bugs before deployment.
* Ensures data accuracy.
* Improves application reliability.
* Prevents system failures.
* Enhances user experience.
* Reduces maintenance costs.
* Ensures business requirements are met.

### Benefits

A well-tested system is more stable, secure, and trustworthy.

---

# What is Asynchronous Processing?

Asynchronous processing refers to tasks that run in the background without making the user wait.

Instead of executing immediately, the task is placed in a queue and processed later.

### Advantages

* Faster user experience.
* Better system performance.
* Handles large workloads efficiently.
* Reduces server load.

### Salesforce Examples

* Future Methods
* Queueable Apex
* Batch Apex
* Scheduled Apex
* Platform Events

---

# Important Test Cases

Testing the College Management System requires validating different scenarios.

## Test Case 1: Invalid Email Format

### Scenario

Student enters an invalid email address.

### Expected Result

Registration should fail.

### Problem Prevented

Incorrect communication and notification failures.

---

## Test Case 2: Duplicate Registration

### Scenario

Student attempts to register twice.

### Expected Result

System rejects duplicate record.

### Problem Prevented

Duplicate student records.

---

## Test Case 3: Empty Student Name

### Scenario

Student name field is blank.

### Expected Result

Validation error displayed.

### Problem Prevented

Incomplete records.

---

## Test Case 4: Course Not Selected

### Scenario

Registration submitted without course selection.

### Expected Result

Submission blocked.

### Problem Prevented

Invalid enrollments.

---

## Test Case 5: Seats Exceeding Limit

### Scenario

Course capacity is already full.

### Expected Result

Registration denied.

### Problem Prevented

Overbooking courses.

---

## Test Case 6: Attendance Below Threshold

### Scenario

Attendance falls below 75%.

### Expected Result

Warning notification generated.

### Problem Prevented

Missing attendance alerts.

---

## Test Case 7: Payment Amount Incorrect

### Scenario

Fee amount entered incorrectly.

### Expected Result

Validation error.

### Problem Prevented

Financial discrepancies.

---

## Test Case 8: Unauthorized User Access

### Scenario

Student tries accessing faculty dashboard.

### Expected Result

Access denied.

### Problem Prevented

Security breaches.

---

## Test Case 9: Notification Failure

### Scenario

Email service unavailable.

### Expected Result

Error logged and retry mechanism triggered.

### Problem Prevented

Lost notifications.

---

## Test Case 10: Database Save Failure

### Scenario

Record save operation fails.

### Expected Result

Transaction rollback.

### Problem Prevented

Partial or corrupted data.

---

# Async Use Cases

Asynchronous processing is useful for operations that take time and should not delay users.

## Use Case 1: Welcome Email Sending

After registration, emails are sent in the background.

### Benefit

User does not wait for email delivery.

---

## Use Case 2: Attendance Report Generation

Large attendance reports are generated asynchronously.

### Benefit

Improves performance.

---

## Use Case 3: Bulk Student Import

Thousands of student records are processed using Batch Apex.

### Benefit

Efficient handling of large datasets.

---

## Use Case 4: Notification Broadcasting

Announcements sent to all students.

### Benefit

Scales for large audiences.

---

## Use Case 5: Course Allocation Processing

Automatic course assignments run in the background.

### Benefit

Reduces processing delays.

---

# Async Thinking

## Example 1: Welcome Email Notifications

Registration completed.

↓

Queueable Apex sends email asynchronously.

### Why Async?

Email delivery may take time.

---

## Example 2: Attendance Report Creation

Faculty requests attendance report.

↓

Batch Apex generates report.

### Why Async?

Large volume of attendance records.

---

## Example 3: Student Data Migration

Administrator imports 50,000 student records.

↓

Batch Apex processes records.

### Why Async?

Avoids governor limit issues.

---

## Example 4: Fee Reminder Notifications

Monthly reminders sent to students.

↓

Scheduled Apex executes automatically.

### Why Async?

Runs without user interaction.

---

## Example 5: College-Wide Announcements

Notification sent to all students.

↓

Platform Event publishes messages.

### Why Async?

Supports real-time scalable communication.

---

# Reliability Discussion

Reliability means the system consistently works correctly even during failures.

---

## Scenario 1: Crash During Student Registration

### Problems

* Student record not saved.
* Duplicate registration attempts.
* Missing confirmation message.

### Impact

Students may think registration failed or submit multiple times.

### How Testing Helps

* Tests transaction handling.
* Validates rollback mechanisms.
* Ensures proper error messages.

---

## Scenario 2: Crash During Payment Update

### Problems

* Payment deducted but not recorded.
* Incorrect fee balances.
* Financial inconsistencies.

### Impact

Students may be charged incorrectly.

### How Testing Helps

* Tests payment workflows.
* Verifies transaction consistency.
* Detects failure scenarios before deployment.

---

## Scenario 3: Crash During Attendance Update

### Problems

* Attendance records partially updated.
* Incorrect attendance percentage.
* Missing alerts.

### Impact

Students may receive inaccurate attendance status.

### How Testing Helps

* Tests update transactions.
* Verifies rollback behavior.
* Ensures data consistency.

---

# Reliability Best Practices

### Data Validation

Prevents incorrect information from entering the system.

### Error Handling

Displays meaningful error messages.

### Rollback Mechanisms

Restores system state when failures occur.

### Automated Testing

Detects issues before production deployment.

### Monitoring

Identifies failures quickly.

---

# Reflection

This exercise helped me understand the importance of testing and asynchronous processing in enterprise applications. I learned how test cases prevent data quality, security, and performance issues. I also understood how Salesforce uses asynchronous technologies such as Queueable Apex, Batch Apex, Scheduled Apex, and Platform Events to improve scalability and user experience. The reliability discussion demonstrated how system failures can affect registrations, payments, and attendance updates, and how proper testing helps prevent such problems. Overall, this activity improved my understanding of building reliable and scalable Salesforce applications.

