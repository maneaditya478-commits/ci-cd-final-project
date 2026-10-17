---
name: User Story Template
about: Template for user stories following Gherkin syntax
title: "[FEATURE] "
labels: 'enhancement'
assignees: ''

---

## Feature Description:
**As a** [role]<br>
**I need** [function/capability]<br>
**So that** [benefit/value]

---

## Details and Assumptions:
- [Context and assumptions about the system behavior]
- [Dependencies or prerequisites]

---

## Acceptance Criteria:
```gherkin
Given [initial context or state]
When [an event or action occurs]
Then [expected outcome or behavior]
And [additional expected outcome]
```

### Example:
```gherkin
Given the Account service is running
When a POST request is sent to "/accounts" with valid JSON payload
Then the response status code should be 201 Created
And the response header "Location" should contain the URL of the created account
And the response body should contain the created account details
```
