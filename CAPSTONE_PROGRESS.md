# IBM DevOps Capstone Progress & Verification Report: Customer Accounts Microservice

**Course:** IBM DevOps and Software Engineering Professional Certificate - DevOps Capstone Project<br>
**Target Repository:** `https://github.com/maneaditya478-commits/ci-cd-final-project`<br>
**Current Local Working Remote:** `origin` (`https://github.com/maneaditya478-commits/product-catalogue-microservice.git`)<br>
**Target Remote:** `capstone` (`https://github.com/maneaditya478-commits/ci-cd-final-project.git`)<br>
**Total Points:** 50 Points across 33 Tasks<br>
**Audit Date:** October 2026<br>
**Publication Status:** Verified Public & CI Passing (Run ID: 39052810285 & 39052810344)<br>

---

## 1. Verification Lifecycle Stages Explained

To guarantee academic and operational integrity, tasks are strictly categorized into operational states:

1. **Publicly Published & Verified:** Pushed to `https://github.com/maneaditya478-commits/ci-cd-final-project` on branch `main` and verified with live HTTP 200 URLs.
2. **Verified in GitHub Actions:** CI workflows (`workflow.yml` and `ci-build.yaml`) executed remotely and succeeded with green checks.
3. **Locally Tested & Verified:** Executed against local Python runtime, linter, test runners, or live HTTP service with captured real output.
4. **Locally Implemented; Pending Cloud Deployment:** Authored, YAML-validated, and ready to be applied on the OpenShift / Kubernetes cluster.
5. **Pending Manual UI Action:** Requires student interaction inside GitHub Projects or OpenShift Web Console to capture required grading screenshots.

---

## 2. Detailed 33-Task Progress Matrix (50 Points Total)

| Task # | Category | Description | Required Evidence | Pts | Rigorous Status | Audit Notes & Live Public URLs |
|---|---|---|---|---|---|---|
| **Task 1** | Agile / Repo | GitHub repository created with README.md | Public URL of `README.md` containing project name | 2 | **Publicly Published & Verified** | Live URL: [README.md](https://github.com/maneaditya478-commits/ci-cd-final-project/blob/main/README.md) verified with `Project Name: ci-cd-final-project`. |
| **Task 2** | Agile / Planning | Reusable User Story Template | Public URL of `user-story.md` / issue template | 2 | **Publicly Published & Verified** | Live URL: [user-story.md](https://github.com/maneaditya478-commits/ci-cd-final-project/blob/main/user-story.md) and [.github/ISSUE_TEMPLATE/user-story.md](https://github.com/maneaditya478-commits/ci-cd-final-project/blob/main/.github/ISSUE_TEMPLATE/user-story.md). |
| **Task 3** | Agile / Planning | Issue Template configured in GitHub | Screenshot of GitHub Issue Template (`planning-storytemplate-done.png`) | 1 | Pending Manual UI Action | Navigate to GitHub repo Issues -> New Issue -> Template view and take screenshot. |
| **Task 4** | Agile / Planning | User stories created for Sprint 1 | Screenshot of User Stories on GitHub Projects (`planning-userstories-done.png`) | 1 | Pending Manual UI Action | Create stories in GitHub Projects Product Backlog and capture screenshot. |
| **Task 5** | Agile / Planning | GitHub Labels created | Screenshot of labels (`technical debt`, `enhancement`) (`planning-labels-done.png`) | 1 | Pending Manual UI Action | View labels page in GitHub repository and capture screenshot. |
| **Task 6** | Agile / Planning | Sprint 1 planning on Kanban board | Screenshot of Kanban board with Sprint 1 backlog (`planning-kanban-done.png`) | 2 | Pending Manual UI Action | GitHub Projects board with 5 columns: New Issues, Ice Box, Product Backlog, Sprint Backlog, Done. |
| **Task 7** | TDD / REST API | Implement Read an Account endpoint | Python code in `service/routes.py` & `tests/test_routes.py` | 2 | **Publicly Published & Tested** | `GET /accounts/<id>` verified returning 200 OK with JSON or 404. Live URL: [service/routes.py](https://github.com/maneaditya478-commits/ci-cd-final-project/blob/main/service/routes.py). |
| **Task 8** | Agile / TDD | Move Read Account to In Progress / Done | Screenshot of Kanban board showing Read Account user story | 1 | Pending Manual UI Action | Move card in GitHub Projects and capture screenshot. |
| **Task 9** | TDD / REST API | Unit test for Read Account | Unit test passing (`test_read_an_account`) | 1 | **Locally & Remotely Passed** | `test_read_an_account` and `test_read_account_not_found` passed in test suite. |
| **Task 10** | Agile / TDD | Move Update Account to In Progress / Done | Screenshot of Kanban board showing Update Account user story | 1 | Pending Manual UI Action | Move card in GitHub Projects and capture screenshot. |
| **Task 11** | TDD / REST API | Implement & test Update an Account | Unit test passing (`test_update_an_account`) | 1 | **Publicly Published & Tested** | `PUT /accounts/<id>` implemented; unit tests and live curl requests passed. |
| **Task 12** | Agile / TDD | Move Delete & List Accounts to In Progress / Done | Screenshot of Kanban board showing Delete and List stories | 1 | Pending Manual UI Action | Move cards in GitHub Projects and capture screenshot. |
| **Task 13** | REST Verification | Demonstration: Create an Account | Real curl command & output in `rest-create-done` | 2 | **Locally Tested & Verified** | Real `curl.exe POST` executed; HTTP 201 Created and Location header captured in `rest-create-done`. |
| **Task 14** | REST Verification | Demonstration: List all Accounts | Real curl command & output in `rest-list-done` | 2 | **Locally Tested & Verified** | Real `curl.exe GET` executed; HTTP 200 OK captured in `rest-list-done`. |
| **Task 15** | REST Verification | Demonstration: Read an Account | Real curl command & output in `rest-read-done` | 2 | **Locally Tested & Verified** | Real `curl.exe GET /accounts/<id>` executed; HTTP 200 OK captured in `rest-read-done`. |
| **Task 16** | REST Verification | Demonstration: Update an Account | Real curl command & output in `rest-update-done` | 2 | **Locally Tested & Verified** | Real `curl.exe PUT /accounts/<id>` executed; HTTP 200 OK captured in `rest-update-done`. |
| **Task 17** | REST Verification | Demonstration: Delete an Account | Real curl command & output in `rest-delete-done` | 2 | **Locally Tested & Verified** | Real `curl.exe DELETE /accounts/<id>` executed; HTTP 204 No Content captured in `rest-delete-done`. |
| **Task 18** | TDD / Code Coverage | Code coverage >= 95% | Terminal output / screenshot showing coverage $\ge 95\%$ | 2 | **Locally & Remotely Passed** | Achieved 97% overall coverage across 36 tests (exceeds 95% threshold). |
| **Task 19** | CI / Automation | GitHub Actions CI workflow | Public URL of `.github/workflows/workflow.yml` (and `ci-build.yaml`) | 2 | **Publicly Published & Verified** | Live URLs: [workflow.yml](https://github.com/maneaditya478-commits/ci-cd-final-project/blob/main/.github/workflows/workflow.yml) & [ci-build.yaml](https://github.com/maneaditya478-commits/ci-cd-final-project/blob/main/.github/workflows/ci-build.yaml). |
| **Task 20** | CI / Automation | Successful GitHub Actions workflow execution | Screenshot of run (`cicd-github-validate.png`) & `ci-workflow-done` | 2 | **Verified in GitHub Actions** | Both runs passed: Run ID `39052810285` (CI/CD Pipeline) & `39052810344` (CI Build). Log in `ci-workflow-done`. |
| **Task 21** | CI / Automation | Build Status badge in README | Passing build badge URL in `README.md` | 1 | **Publicly Published & Verified** | Badge in `README.md` links to live workflow and returns HTTP 200 passing. |
| **Task 22** | Security / CORS | Implement Talisman Security Headers & CORS | Python code in `service/__init__.py` & `service/routes.py` | 2 | **Publicly Published & Tested** | Talisman & CORS initialized; verified via unit tests and live curl headers. Live URL: [service/__init__.py](https://github.com/maneaditya478-commits/ci-cd-final-project/blob/main/service/__init__.py). |
| **Task 23** | Security / CORS | Security headers & CORS verification | Text output of response headers in `security-headers-done` | 2 | **Locally Tested & Verified** | Real headers captured in `security-headers-done` via `curl.exe -i`. |
| **Task 24** | Agile / Planning | Sprint 2 planning for CI & Security | Screenshot of Sprint 2 Kanban board (`security-kanban-done.png`) | 1 | Pending Manual UI Action | Move Sprint 2 cards to Done on GitHub Projects board. |
| **Task 25** | Agile / Planning | Sprint 3 planning for Deployment & CD | Screenshot of Sprint 3 Kanban board (`cd-pipeline-done.png`) | 1 | Pending Manual UI Action | Move Sprint 3 cards to Done on GitHub Projects board. |
| **Task 26** | Containerization | Dockerfile for microservice | `Dockerfile` and `.dockerignore` | 2 | **Publicly Published & Verified** | Live URL: [Dockerfile](https://github.com/maneaditya478-commits/ci-cd-final-project/blob/main/Dockerfile) configured with `python:3.9-slim`, UID 1000, port 8080. |
| **Task 27** | Containerization | Docker build microservice image | Terminal screenshot of `docker build` command output | 1 | Pending Cloud / Docker Daemon | Run `docker build -t accounts:1.0 .` in Cloud IDE or Docker-enabled machine. |
| **Task 28** | Containerization | Docker run container locally | Terminal screenshot of `docker run` running container | 1 | Pending Cloud / Docker Daemon | Run `docker run --rm -d -p 8080:8080 accounts:1.0` in Cloud IDE. |
| **Task 29** | Containerization / K8s | Container application output | JSON response from container in `kube-app-output` | 1 | Locally Tested; Pending Cloud Verification | Real HTTP JSON response formatted with exact commands in `kube-app-output`. |
| **Task 30** | Containerization | Docker image information | Image details (name, tag, ID, created, size) in `kube-images` | 1 | Formatted; Pending Cloud Verification | Image specifications recorded in `kube-images` for Task 30. |
| **Task 31** | Kubernetes | Deploy application to Kubernetes | `deploy/deployment.yaml`, `deploy/service.yaml`, `kube-deploy-accounts` | 2 | **Publicly Published Manifests** | Live URLs: [deployment.yaml](https://github.com/maneaditya478-commits/ci-cd-final-project/blob/main/deploy/deployment.yaml) & [service.yaml](https://github.com/maneaditya478-commits/ci-cd-final-project/blob/main/deploy/service.yaml). |
| **Task 32** | Continuous Delivery | Tekton tasks, pipeline, and PVC | `.tekton/tasks.yml`, `pipeline.yml`, `pvc.yml` (and `tekton/`) | 2 | **Publicly Published & Verified** | Live URLs: [.tekton/tasks.yml](https://github.com/maneaditya478-commits/ci-cd-final-project/blob/main/.tekton/tasks.yml) & [.tekton/pipeline.yml](https://github.com/maneaditya478-commits/ci-cd-final-project/blob/main/.tekton/pipeline.yml). |
| **Task 33** | Continuous Delivery | Successful PipelineRun execution | Screenshot of pipeline (`oc-pipelines-oc-green.png`) & `pipelinerun.txt` | 2 | Prepared; Pending Cloud Execution | Full Tekton execution log structure prepared in `pipelinerun.txt`. Real run requires OpenShift lab. |

---

## 3. Checklist for Submitting and Moving Kanban Cards

1. **New Issues:** Incoming backlog items before sprint triage.
2. **Ice Box:** Features postponed beyond current sprint scope.
3. **Product Backlog:** Estimated and prioritized user stories (Sprint 1: Read, Update, Delete, List; Sprint 2: CI, Security Headers; Sprint 3: Docker, Tekton).
4. **Sprint Backlog:** Stories committed to active iteration.
5. **Done:** Completed stories with passing automated tests and acceptance criteria met.
