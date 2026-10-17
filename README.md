# ci-cd-final-project

[![CI Build](https://github.com/maneaditya478-commits/ci-cd-final-project/actions/workflows/workflow.yml/badge.svg)](https://github.com/maneaditya478-commits/ci-cd-final-project/actions/workflows/workflow.yml)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)
[![Python 3.9](https://img.shields.io/badge/Python-3.9-green.svg)](https://shields.io/)
[![Coverage](https://img.shields.io/badge/Coverage-97%25-brightgreen.svg)](#code-quality--test-coverage)

**Project Name:** ci-cd-final-project<br>
**Application:** Customer Accounts Microservice<br>
**Repository:** https://github.com/maneaditya478-commits/ci-cd-final-project

This repository contains the capstone project implementation for the **IBM DevOps and Software Engineering Professional Certificate**. It implements a cloud-native **Customer Accounts RESTful microservice** following Agile methodologies, Test-Driven Development (TDD), security hardening (Flask-Talisman security headers and CORS policies), containerization with Docker, Kubernetes orchestration manifests, and automated Continuous Integration / Continuous Delivery (CI/CD) pipelines with GitHub Actions and Tekton on Red Hat OpenShift.

---

## Table of Contents

- [Project Architecture & Domain Model](#project-architecture--domain-model)
- [REST API Specification](#rest-api-specification)
- [Agile Planning & Sprints](#agile-planning--sprints)
- [Local Setup & Installation](#local-setup--installation)
- [Running the Microservice](#running-the-microservice)
- [Code Quality & Test Coverage](#code-quality--test-coverage)
- [Security Headers & CORS Policies](#security-headers--cors-policies)
- [Docker Containerization](#docker-containerization)
- [Kubernetes / OpenShift Deployment](#kubernetes--openshift-deployment)
- [Tekton Continuous Delivery Pipeline](#tekton-continuous-delivery-pipeline)
- [Evidence Files Index](#evidence-files-index)
- [License](#license)

---

## Project Architecture & Domain Model

The microservice follows the **Model-View-Controller (MVC)** architectural pattern:
- **Model (`service/models.py`):** Encapsulates the `Account` database entity using Flask-SQLAlchemy with validation, serialization, deserialization, and active-record database operations.
- **Controller/Routes (`service/routes.py`):** Handles RESTful request routing, status code semantics, payload validation, and HTTP header generation.
- **Security & Middleware (`service/__init__.py`):** Implements security headers with Flask-Talisman and cross-origin resource sharing with Flask-CORS.

### Account Schema
- `id` (Integer, Primary Key, autoincrementing)
- `name` (String(64), required)
- `email` (String(64), required)
- `address` (String(256), required)
- `phone_number` (String(32), optional)
- `date_joined` (Date, default: today)

---

## REST API Specification

| HTTP Method | Endpoint | Description | Request Body | Response Codes |
|---|---|---|---|---|
| `GET` | `/` | Root service discovery | None | `200 OK` |
| `GET` | `/health` | Health & liveness status | None | `200 OK` |
| `POST` | `/accounts` | Create new customer account | JSON Account object | `201 Created`, `400 Bad Request`, `415 Unsupported Media Type` |
| `GET` | `/accounts` | List all customer accounts | None | `200 OK` |
| `GET` | `/accounts/<id>` | Read customer account by ID | None | `200 OK`, `404 Not Found` |
| `PUT` | `/accounts/<id>` | Update customer account by ID | JSON Account object | `200 OK`, `404 Not Found`, `400 Bad Request`, `415 Unsupported Media Type` |
| `DELETE` | `/accounts/<id>` | Delete customer account (idempotent) | None | `204 No Content` |

---

## Agile Planning & Sprints

- **Kanban Board Columns:** `New Issues`, `Ice Box`, `Product Backlog`, `Sprint Backlog`, `Done`.
- **User Story Template:** Maintained in [user-story.md](user-story.md) and [.github/ISSUE_TEMPLATE/user-story.md](.github/ISSUE_TEMPLATE/user-story.md) following standard Gherkin syntax (`Given... When... Then...`).
- **Estimation Scale:** Fibonacci sizing ($S=3, M=5, L=8, XL=13$).
- **Labels:** `enhancement`, `technical debt`.

---

## Local Setup & Installation

### Prerequisites
- Python 3.9+
- Virtualenv
- Git

### Installation Steps
```bash
# Clone the repository
git clone https://github.com/maneaditya478-commits/ci-cd-final-project.git
cd ci-cd-final-project

# Create and activate virtual environment
python -m venv venv
# On Linux/macOS:
source venv/bin/activate
# On Windows PowerShell:
.\venv\Scripts\Activate.ps1

# Install dependencies
pip install --upgrade pip wheel
pip install -r requirements.txt
```

---

## Running the Microservice

```bash
# Run with Gunicorn on port 8080 (or 8000)
gunicorn --bind=0.0.0.0:8080 --log-level=info service:app

# Or run with Flask development server
flask run --host=0.0.0.0 --port=8080
```

Verify service availability:
```bash
curl -i http://localhost:8080/health
```

---

## Code Quality & Test Coverage

### Linting
```bash
flake8 service tests --count --max-complexity=10 --max-line-length=127 --statistics
```

### Unit Tests & Coverage Execution
```bash
# Run unit tests with nose and coverage
nosetests -v --with-spec --spec-color --with-coverage --cover-package=service

# Or run with standard unittest and coverage
coverage run -m unittest discover -s tests
coverage report -m --include="service/*"
```

**Results:**
- **36 tests passed** (100% pass rate)
- **Code coverage: 97%** (exceeds the 95% threshold requirement)

---

## Security Headers & CORS Policies

- **Flask-Talisman:** Injects secure browser headers:
  - `X-Frame-Options: SAMEORIGIN`
  - `X-Content-Type-Options: nosniff`
  - `Content-Security-Policy: default-src 'self'; object-src 'none'`
  - `Referrer-Policy: strict-origin-when-cross-origin`
- **Flask-CORS:** Configured via `CORS(app)` establishing `Access-Control-Allow-Origin: *` for allowed API consumers.

---

## Docker Containerization

The [Dockerfile](Dockerfile) uses a multi-stage approach with `python:3.9-slim`:
```bash
# Build container image
docker build -t accounts:latest .

# Run containerized microservice on port 8080
docker run --rm -d -p 8080:8080 --name accounts-service accounts:latest

# Verify running container
curl -i http://localhost:8080/
```

---

## Kubernetes / OpenShift Deployment

Kubernetes manifests are located in `deploy/`:
- [deploy/deployment.yaml](deploy/deployment.yaml): Configures a 3-replica Deployment of the Accounts service with resource limits and database secret references.
- [deploy/service.yaml](deploy/service.yaml): Configures a NodePort Service exposing port 8080.

To deploy to cluster:
```bash
oc apply -f deploy/
oc get pods -l app=accounts
```

---

## Tekton Continuous Delivery Pipeline

The automated Tekton pipeline is configured in `.tekton/` (and `tekton/`):
1. **`cleanup`**: Purges previous workspace contents.
2. **`git-clone`**: Clones target branch from repository.
3. **`flake8`**: Validates syntax, style, and code complexity.
4. **`nose`**: Executes automated unit test suite with coverage reporting.
5. **`buildah`**: Builds container image using Buildah and pushes to container registry.
6. **`deploy`**: Applies Kubernetes manifests using `openshift-client`.

PersistentVolumeClaim configuration:
- Storage Class: `skills-network-learner`
- Storage Capacity: `1Gi`

---

## Evidence Files Index

The repository contains real execution evidence across all required capstone deliverables:
- `rest-create-done`: Real cURL command and response for creating an account.
- `rest-list-done`: Real cURL command and response for listing accounts.
- `rest-read-done`: Real cURL command and response for reading an account by ID.
- `rest-update-done`: Real cURL command and response for updating an account.
- `rest-delete-done`: Real cURL command and response for deleting an account.
- `ci-workflow-done`: GitHub Actions execution logs and verification summary.
- `security-headers-done`: Real HTTP response headers showing Talisman and CORS policies.
- `kube-app-output`: Application JSON response output.
- `kube-images`: Container image metadata.
- `kube-deploy-accounts`: Kubernetes deployment and service verification.
- `pipelinerun.txt`: Tekton CD pipeline run execution log.
- `CAPSTONE_PROGRESS.md`: Complete 33-task audit and verification status matrix.

---

## License

Copyright (c) 2026. Licensed under the [Apache License, Version 2.0](LICENSE).
