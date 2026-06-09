# Day 12 - Salesforce DX Workflow

# Salesforce DX Workflow and Team Collaboration

---

# What is Salesforce DX?

Salesforce DX (Developer Experience) is a modern development approach provided by Salesforce for building, testing, and deploying applications efficiently.

It provides tools and processes that help developers work in teams and manage Salesforce projects using source-driven development.

### Key Features

* Source-driven development
* Scratch Orgs
* Salesforce CLI integration
* Version control support
* Automated deployment
* Continuous Integration (CI/CD)

### Benefits

* Faster development
* Better collaboration
* Easier deployment
* Improved project management

---

# Why CLI Matters

CLI stands for Command Line Interface.

Salesforce CLI allows developers to interact with Salesforce directly from the terminal instead of using only the browser.

### Common Uses

* Create Scratch Orgs
* Deploy code
* Retrieve metadata
* Run tests
* Manage projects

### Advantages

* Faster than manual clicks
* Supports automation
* Easy integration with GitHub
* Improves productivity
* Enables CI/CD pipelines

### Example Commands

```bash
sf org create scratch
sf project deploy start
sf apex run test
```

Without CLI, developers would need to perform many repetitive tasks manually.

---

# Why GitHub Matters

GitHub is a platform used for version control and collaboration.

It stores project code and tracks every change made by developers.

### Benefits

* Code backup
* Change tracking
* Team collaboration
* Branch management
* Pull requests
* Rollback support

### Example

Developer A updates an Apex class.

Developer B updates an LWC component.

GitHub keeps both changes organized and prevents accidental overwrites.

---

# Team Collaboration Problems

When multiple developers work together, collaboration challenges arise.

### Common Problems

#### Code Conflicts

Two developers modify the same file.

#### Lost Changes

One developer accidentally overwrites another developer's work.

#### Deployment Issues

Different versions deployed to production.

#### Inconsistent Environments

Developers work with different configurations.

#### Communication Gaps

Developers may not know what others are changing.

### Solutions

* GitHub
* Branching Strategy
* Code Reviews
* Deployment Pipelines
* Salesforce DX

---

# Enterprise Workflow Discussion

Enterprise projects follow a structured workflow.

### Typical Workflow

Developer
↓
Feature Branch
↓
Code Review
↓
Testing
↓
Integration
↓
Deployment
↓
Production

### Steps

#### Development

Features are developed in separate branches.

#### Version Control

Changes are committed to GitHub.

#### Code Review

Team members review the code.

#### Testing

Automated and manual testing performed.

#### Deployment

Changes deployed using Salesforce DX and CI/CD.

#### Monitoring

Production systems monitored continuously.

### Benefits

* Reduced risk
* Better quality
* Faster releases
* Improved reliability

---

# Developer Workflow Thinking

## Why Professional Developers Use GitHub

### Version Control

Tracks every code change.

### Collaboration

Allows multiple developers to work together.

### Backup

Protects project history.

### Rollback

Restore previous working versions.

### Code Review

Improves code quality.

---

## Why Professional Developers Use CLI

### Speed

Commands execute faster than browser operations.

### Automation

Supports scripts and CI/CD.

### Testing

Run tests quickly.

### Deployment

Deploy metadata efficiently.

### Productivity

Reduces repetitive manual tasks.

---

## Why Professional Developers Use Salesforce DX

### Modern Development Model

Source-driven development.

### Scratch Orgs

Temporary environments for testing.

### Better Collaboration

Supports team-based development.

### Continuous Integration

Works with modern DevOps practices.

### Reliable Deployment

Improves release management.

---

## Why Not Use Only Browser Clicks?

Browser clicks are useful for small tasks but not for large projects.

Problems:

* Hard to track changes.
* Difficult collaboration.
* No version history.
* Manual deployments.
* Higher risk of mistakes.

Enterprise development requires automation and version control.

---

# Team Collaboration Thinking

Suppose 10 developers work on the same Salesforce project.

Without proper processes, many problems can occur.

---

## Without Version Control

### Problems

* Lost code changes
* No project history
* Difficult recovery after mistakes

### Example

Developer accidentally deletes Apex code.

Without version control, recovery becomes difficult.

---

## Without Branches

### Problems

* Developers overwrite each other's work.
* Unfinished features affect others.
* Frequent conflicts.

### Example

Two developers modify the same LWC component simultaneously.

---

## Without Deployment Workflow

### Problems

* Wrong versions deployed.
* Production instability.
* Missing metadata.

### Example

A test feature accidentally reaches production.

---

## Benefits of Proper Workflow

* Organized development
* Controlled releases
* Better collaboration
* Reduced risk
* Higher quality software

---

# Real Engineering Thinking

## College Coding Assignments vs Enterprise Software Development

| Area          | College Assignments | Enterprise Development   |
| ------------- | ------------------- | ------------------------ |
| Team Size     | Usually Individual  | Multiple Teams           |
| Testing       | Basic Testing       | Extensive Testing        |
| Collaboration | Minimal             | Continuous Collaboration |
| Deployment    | Often Not Required  | Critical Process         |
| Rollback      | Rarely Considered   | Essential                |
| Reliability   | Moderate Importance | Very High Importance     |
| Documentation | Limited             | Extensive                |
| Maintenance   | Short-Term          | Long-Term                |

---

## Testing

### College

Program runs correctly for sample inputs.

### Enterprise

Applications must work for thousands of users and edge cases.

---

## Collaboration

### College

One student develops the project.

### Enterprise

Many developers work simultaneously.

---

## Deployment

### College

Application submitted once.

### Enterprise

Frequent deployments with strict controls.

---

## Rollback

### College

Usually unnecessary.

### Enterprise

Required when deployments fail.

---

## Reliability

### College

Temporary usage.

### Enterprise

Business operations depend on the software.

Downtime can cause financial and operational losses.

---

# Reflection

This exercise helped me understand how Salesforce DX, GitHub, and CLI support modern software development. I learned why enterprise organizations use source-driven development instead of relying only on browser-based configuration. The activity also highlighted the importance of version control, branching, testing, deployment workflows, and rollback mechanisms when multiple developers collaborate on a project. Comparing college assignments with enterprise software development showed how professional systems require higher reliability, stronger collaboration, extensive testing, and controlled deployments. Overall, this exercise improved my understanding of real-world Salesforce development workflows and DevOps practices.

