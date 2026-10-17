# ci-cd-final-project

**Project Name:** ci-cd-final-project  
**Application:** Product Catalogue Microservice

[![CI/CD Pipeline](https://github.com/maneaditya478-commits/ci-cd-final-project/actions/workflows/workflow.yml/badge.svg)](https://github.com/maneaditya478-commits/ci-cd-final-project/actions/workflows/workflow.yml)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)
[![Python](https://img.shields.io/badge/Python-3.9-brightgreen.svg)](https://www.python.org/)

A production-ready RESTful Product Catalogue Microservice built with Python, Flask, and SQLAlchemy, featuring end-to-end Test-Driven Development (TDD), Behavior-Driven Development (BDD), GitHub Actions Continuous Integration (CI), and automated Tekton pipelines on Red Hat OpenShift.

---

## Table of Contents

- [Overview](#overview)
- [Features & API Endpoints](#features--api-endpoints)
- [Technology Stack](#technology-stack)
- [Installation & Setup](#installation--setup)
- [Environment Variables](#environment-variables)
- [Running the Application (Port 8000)](#running-the-application-port-8000)
- [Code Quality & Testing](#code-quality--testing)
- [Continuous Integration (GitHub Actions)](#continuous-integration-github-actions)
- [Continuous Delivery (Tekton & OpenShift)](#continuous-delivery-tekton--openshift)
- [License](#license)

---

## Overview

The **Product Catalogue Microservice** provides robust product inventory management for an e-commerce platform. It supports full CRUD operations, advanced multi-attribute querying (by name, category, and availability), automated database transactions, input validation, and containerized deployment following cloud-native best practices.

---

## Features & API Endpoints

The service exposes RESTful JSON endpoints listening on port **8000**:

| Method | Endpoint | Description | Status Codes |
|---|---|---|---|
| `GET` | `/` | Web Administration UI | `200 OK` |
| `GET` | `/health` | Service health and liveness check | `200 OK` |
| `POST` | `/products` | Create a new product | `201 Created`, `400 Bad Request`, `415 Unsupported Media Type` |
| `GET` | `/products/<id>` | Read a single product by ID | `200 OK`, `404 Not Found` |
| `PUT` | `/products/<id>` | Update an existing product | `200 OK`, `404 Not Found`, `400 Bad Request` |
| `DELETE` | `/products/<id>` | Delete a product by ID | `204 No Content` |
| `GET` | `/products` | List all products | `200 OK` |
| `GET` | `/products?name=<name>` | Search products by name | `200 OK` |
| `GET` | `/products?category=<category>` | Search products by category | `200 OK` |
| `GET` | `/products?available=<true\|false>` | Filter products by availability | `200 OK` |

Each product entity comprises:
- `id` (Integer, Primary Key)
- `name` (String)
- `description` (String)
- `price` (Decimal)
- `available` (Boolean)
- `category` (Enum: `UNKNOWN`, `CLOTHS`, `FOOD`, `HOUSEWARES`, `AUTOMOTIVE`, `TOOLS`)

---

## Technology Stack

- **Runtime & Web Framework:** Python 3.9, Flask 2.2.3, Werkzeug 2.2.3, Gunicorn 20.1.0
- **Database & ORM:** SQLAlchemy 2.0, Flask-SQLAlchemy 3.0.2, PostgreSQL (Production), SQLite (Testing)
- **Code Quality:** flake8 5.0.4, pylint 2.17.4
- **Unit & Route Testing:** nose 1.3.7, factory-boy 3.2.1, coverage 7.1.0
- **Behavior-Driven Development:** Behave 1.2.6, Selenium 4.1.0, headless Chrome
- **Continuous Integration:** GitHub Actions (`.github/workflows/workflow.yml`)
- **Continuous Delivery & Pipelines:** Tekton Pipelines (`.tekton/tasks.yml`, `.tekton/pipeline.yml`)
- **Containerization & Deployment:** Docker, Buildah, Red Hat OpenShift Container Platform

---

## Installation & Setup

### Prerequisites

- Python 3.9
- Git
- Virtual environment (`venv`)

### 1. Clone the repository

```bash
git clone https://github.com/maneaditya478-commits/product-catalogue-microservice.git
cd product-catalogue-microservice
```

### 2. Create and activate a virtual environment

```bash
python3 -m venv ~/venv
source ~/venv/bin/activate
```

On Windows:
```powershell
python -m venv venv
.\venv\Scripts\Activate.ps1
```

### 3. Install dependencies

```bash
python -m pip install --upgrade pip wheel
pip install -r requirements.txt
```

---

## Environment Variables

Configure application settings via environment variables or a `.env` file:

| Variable | Default Value | Description |
|---|---|---|
| `DATABASE_URI` | `sqlite:///test.db` (local) / `postgresql://...` (prod) | Database connection URI |
| `PORT` | `8000` | Port on which the application listens |
| `FLASK_APP` | `service:app` | WSGI application target |
| `SECRET_KEY` | `sup3r-s3cr3t` | Session and signing key |
| `LOGGING_LEVEL` | `INFO` | Application log verbosity |

---

## Running the Application (Port 8000)

The application starts and logs the exact message `SERVICERUNNING` on initialization.

### Running with Flask:

```bash
flask run -p 8000 --host 0.0.0.0
```

### Running with Gunicorn:

```bash
gunicorn --bind 0.0.0.0:8000 --log-level=info service:app
```

### Running with Docker:

```bash
docker build -t product-catalogue:latest .
docker run -d -p 8000:8000 --name product-catalogue product-catalogue:latest
```

Verify service availability:
```bash
curl http://localhost:8000/health
```

---

## Code Quality & Testing

### Running Flake8 Linter

```bash
flake8 service tests --count --select=E9,F63,F7,F82 --show-source --statistics
flake8 service tests --count --max-complexity=10 --max-line-length=127 --statistics
```

### Running Unit Tests with Nose

```bash
nosetests -v --with-spec --spec-color --with-coverage --cover-package=service
```

### Running BDD Scenarios with Behave

```bash
behave
```

---

## Continuous Integration (GitHub Actions)

Continuous Integration is automated using GitHub Actions in [`.github/workflows/workflow.yml`](.github/workflows/workflow.yml).

The pipeline executes automatically on pushes and pull requests to `main`, as well as on manual dispatch (`workflow_dispatch`).

### Workflow Steps:
1. **Checkout repository:** Checks out source code using `actions/checkout@v4`.
2. **Python setup:** Configures Python 3.9 using `actions/setup-python@v5`.
3. **Dependency installation:** Upgrades pip/wheel and installs dependencies from `requirements.txt`.
4. **Lint with flake8:** Executes syntax and complexity checks across `service` and `tests`.
5. **Unit tests with nose:** Runs unit and route tests with code coverage reporting.

---

## Continuous Delivery (Tekton & OpenShift)

Continuous Delivery is automated using Tekton Pipelines on Red Hat OpenShift.

### Pipeline Stages (`cd-pipeline`):

1. **`cleanup`:** Wipes and validates the shared source workspace (`pipeline-pvc`).
2. **`git-clone`:** Clones the GitHub repository branch into the workspace.
3. **`flake8`:** Validates code style and syntax across `service` and `tests`.
4. **`nose`:** Runs unit tests with test database isolation.
5. **`buildah`:** Builds container image from `Dockerfile` and pushes to the OpenShift internal image registry.
6. **`deploy`:** Deploys the built image using `openshift-client`, configures port 8000, and verifies rollout status.

### Deploying to OpenShift:

```bash
# 1. Create PersistentVolumeClaim (1Gi, skills-network-learner storage class)
oc apply -f .tekton/pvc.yml

# 2. Apply Tekton Task definitions
oc apply -f .tekton/tasks.yml

# 3. Apply Tekton Pipeline definition
oc apply -f .tekton/pipeline.yml

# 4. Trigger the PipelineRun
oc create -f .tekton/pipeline.yml
```

### Monitoring Deployment:

```bash
# Check pipeline run status
tkn pipelinerun logs cd-pipeline-run -f

# Verify deployed pods and logs
oc get pods -l app=product-catalogue
oc logs deployment/product-catalogue
```

---

## License

Licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE) for details.
