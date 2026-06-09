# Day 13 - DevOps and CI/CD

# Salesforce DevOps, CI/CD, and Deployment Workflow

---

# What is CI/CD?

CI/CD stands for:

### CI – Continuous Integration

Developers regularly merge their code changes into a shared repository.

Every code change is automatically:

* Built
* Validated
* Tested

### CD – Continuous Delivery / Continuous Deployment

After successful testing, changes are automatically prepared or deployed to higher environments.

### CI/CD Workflow

Developer
↓
GitHub Commit
↓
Automated Build
↓
Automated Testing
↓
Validation
↓
Deployment
↓
Production

### Benefits

* Faster releases
* Fewer deployment errors
* Improved code quality
* Better collaboration
* Reduced manual effort

---

# Why Deployment Workflow Matters

A deployment workflow is a structured process for moving changes from development to production.

### Typical Workflow

Development Org
↓
GitHub Repository
↓
Testing Environment
↓
User Acceptance Testing
↓
Production

### Importance

* Ensures quality checks
* Prevents accidental mistakes
* Maintains system stability
* Supports rollback when failures occur
* Reduces deployment risks

### Benefits

* Reliable releases
* Better user experience
* Improved maintainability

---

# Problems Without Version Control

Version control systems such as Git help track and manage changes.

Without version control:

### Lost Code

Changes can be accidentally deleted.

### No History

No record of who changed what.

### Difficult Recovery

Mistakes cannot be easily reversed.

### Team Conflicts

Developers overwrite each other's work.

### Deployment Confusion

Different versions of code may exist.

### Example

A developer modifies an Apex class and introduces a bug.

Without version control, restoring the previous working version becomes difficult.

---

# GitHub + DX + DevOps Explanation

## GitHub

GitHub is used for:

* Source code management
* Version control
* Collaboration
* Pull requests
* Code reviews

### Benefits

* Tracks changes
* Maintains project history
* Supports teamwork

---

## Salesforce DX

Salesforce DX provides:

* Source-driven development
* Scratch orgs
* CLI support
* Modern deployment workflows

### Benefits

* Faster development
* Better testing
* Easier deployments

---

## DevOps

DevOps combines:

* Development
* Testing
* Deployment
* Monitoring

into one continuous process.

### Goals

* Faster delivery
* Better reliability
* Improved collaboration

---

## How They Work Together

Developer
↓
GitHub
↓
Salesforce DX
↓
Automated Testing
↓
CI/CD Pipeline
↓
Production Deployment

Together they create a secure and reliable development process.

---

# Deployment Pipeline Thinking

Suppose the College Management System is used by:

* 50,000 Students
* 500 Faculty Members
* Multiple Administrators

Making direct changes in production can be extremely risky.

---

## Danger 1: Bugs

### Problem

A developer introduces a coding error directly in production.

### Impact

* Student registration may stop working.
* Attendance updates may fail.
* Faculty dashboards may break.

### Result

Thousands of users are affected immediately.

---

## Danger 2: Downtime

### Problem

Deployment causes system instability.

### Impact

* Users cannot access the application.
* Registration processes stop.
* Faculty cannot update records.

### Result

Business operations are interrupted.

---

## Danger 3: Broken Workflows

### Problem

A Flow or Apex Trigger is modified incorrectly.

### Impact

* Notifications stop working.
* Course allocation fails.
* Attendance calculations become incorrect.

### Result

Business processes break unexpectedly.

---

## Danger 4: Data Loss

### Problem

Incorrect deployment changes database logic.

### Impact

* Student records may be corrupted.
* Attendance information may disappear.
* Course assignments may be lost.

### Result

Critical institutional data is affected.

---

## Why Staging and Testing Environments Are Important

Before production deployment:

1. Develop changes safely.
2. Test functionality.
3. Validate business processes.
4. Obtain approvals.
5. Deploy to production.

This reduces risk significantly.

---

# Team Collaboration Scenario

Suppose 10 developers work simultaneously on the same Salesforce project.

Without proper processes, serious problems can occur.

---

## Without GitHub

### Problems

* No source control.
* No change history.
* No backup of code.
* Difficult collaboration.

### Example

Developer A accidentally deletes an Apex class.

Recovery becomes difficult.

---

## Without Branches

### Problems

* Developers work on the same code simultaneously.
* Features interfere with each other.
* Frequent merge conflicts.

### Example

Developer A modifies Student Registration.

Developer B modifies the same component.

Their changes may overwrite one another.

---

## Without Deployment Workflow

### Problems

* Unverified code reaches production.
* Missing metadata.
* Inconsistent deployments.

### Example

A half-completed feature is deployed accidentally.

Users encounter errors.

---

## Without Testing

### Problems

* Bugs reach production.
* Security vulnerabilities remain unnoticed.
* Business processes fail.

### Example

A validation rule blocks all registrations.

Without testing, the issue affects all students.

---

# Enterprise Deployment Process

A professional deployment process typically follows:

Developer
↓
Feature Branch
↓
GitHub Pull Request
↓
Code Review
↓
Automated Tests
↓
QA Environment
↓
User Acceptance Testing
↓
Production Deployment
↓
Monitoring

### Benefits

* Higher quality software
* Lower deployment risk
* Faster issue detection
* Easier rollback

---

# Enterprise Deploy Reflection

This exercise demonstrated how modern organizations use GitHub, Salesforce DX, and DevOps practices to manage large-scale applications. I learned that direct production changes are dangerous because they can introduce bugs, downtime, broken workflows, and data loss. CI/CD pipelines help ensure that changes are tested and validated before deployment. I also understood the importance of version control, branching strategies, deployment workflows, and automated testing when multiple developers work together. These practices improve software quality, reliability, scalability, and maintainability in enterprise environments.

---

# Reflection

Through this activity, I gained a better understanding of CI/CD, DevOps, and Salesforce deployment strategies. I learned why professional teams use GitHub for version control, Salesforce DX for source-driven development, and CI/CD pipelines for automated testing and deployment. The deployment pipeline and collaboration scenarios highlighted the risks of direct production changes and the importance of structured workflows. Overall, this exercise helped me understand how enterprise software systems are developed, tested, deployed, and maintained reliably.

