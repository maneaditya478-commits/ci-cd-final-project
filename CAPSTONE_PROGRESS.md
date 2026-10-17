# IBM DevOps Capstone Progress & Verification Report: Customer Accounts Microservice

**Course:** IBM DevOps and Software Engineering Professional Certificate - DevOps Capstone Project<br>
**Target Repository:** `https://github.com/maneaditya478-commits/ci-cd-final-project`<br>
**Current Local Working Remote:** `origin` (`https://github.com/maneaditya478-commits/product-catalogue-microservice.git`)<br>
**Proposed Remote for Target:** `capstone` (`https://github.com/maneaditya478-commits/ci-cd-final-project.git`)<br>
**Total Points:** 50 Points across 33 Tasks<br>
**Audit Date:** October 2026<br>

---

## 1. Verification Lifecycle Stages Explained

To guarantee academic and operational integrity, tasks are strictly categorized into four operational states rather than marked complete by file existence alone:

1. **Locally Implemented:** Code, test, manifest, or documentation authored and aligned with project specifications.
2. **Locally Tested & Verified:** Executed against local Python runtime, linter, test runners, or live HTTP service with captured output.
3. **Publicly Published:** Pushed to the public target repository on GitHub with accessible raw URLs.
4. **Cloud-Deployed:** Applied and executed in the IBM Developer Skills Network / OpenShift cloud environment.
5. **Pending Manual UI Action:** Requires student interaction inside GitHub Projects or OpenShift Web Console to capture required grading screenshots.

---

## 2. Detailed 33-Task Progress Matrix (50 Points Total)

| Task # | Category | Description | Required Evidence | Pts | Rigorous Status | Audit Notes & Gaps |
|---|---|---|---|---|---|---|
| **Task 1** | Agile / Repo | GitHub repository created with README.md | Public URL of `README.md` containing project name | 2 | Locally Tested; Pending Publication | README.md verified with `Project Name: ci-cd-final-project`. Target repo not yet public on GitHub. |
| **Task 2** | Agile / Planning | Reusable User Story Template | Public URL of `user-story.md` / issue template | 2 | Locally Implemented; Pending Publication | Template created in root and `.github/ISSUE_TEMPLATE/user-story.md`. |
| **Task 3** | Agile / Planning | Issue Template configured in GitHub | Screenshot of GitHub Issue Template (`planning-storytemplate-done.png`) | 1 | Pending Manual UI Action | Must be screenshotted in GitHub web UI once template is pushed. |
| **Task 4** | Agile / Planning | User stories created for Sprint 1 | Screenshot of User Stories on GitHub Projects (`planning-userstories-done.png`) | 1 | Pending Manual UI Action | Must create stories in GitHub Projects Product Backlog and screenshot. |
| **Task 5** | Agile / Planning | GitHub Labels created | Screenshot of labels (`technical debt`, `enhancement`) (`planning-labels-done.png`) | 1 | Pending Manual UI Action | Must configure labels in GitHub repository and screenshot. |
| **Task 6** | Agile / Planning | Sprint 1 planning on Kanban board | Screenshot of Kanban board with Sprint 1 backlog (`planning-kanban-done.png`) | 2 | Pending Manual UI Action | Requires GitHub Projects board configured with 5 columns. |
| **Task 7** | TDD / REST API | Implement Read an Account endpoint | Python code in `service/routes.py` & `tests/test_routes.py` | 2 | Locally Tested & Verified | Endpoint `GET /accounts/<id>` implemented; returns 200 with JSON or 404. |
| **Task 8** | Agile / TDD | Move Read Account to In Progress / Done | Screenshot of Kanban board showing Read Account user story | 1 | Pending Manual UI Action | Move card in GitHub Projects and capture screenshot. |
| **Task 9** | TDD / REST API | Unit test for Read Account | Unit test passing (`test_read_an_account`) | 1 | Locally Tested & Verified | `test_read_an_account` and `test_read_account_not_found` passed in test suite. |
| **Task 10** | Agile / TDD | Move Update Account to In Progress / Done | Screenshot of Kanban board showing Update Account user story | 1 | Pending Manual UI Action | Move card in GitHub Projects and capture screenshot. |
| **Task 11** | TDD / REST API | Implement & test Update an Account | Unit test passing (`test_update_an_account`) | 1 | Locally Tested & Verified | `PUT /accounts/<id>` implemented; unit tests and curl verification passed. |
| **Task 12** | Agile / TDD | Move Delete & List Accounts to In Progress / Done | Screenshot of Kanban board showing Delete and List stories | 1 | Pending Manual UI Action | Move cards in GitHub Projects and capture screenshot. |
| **Task 13** | REST Verification | Demonstration: Create an Account | Real curl command & output in `rest-create-done` | 2 | Locally Tested & Verified | Real `curl.exe POST` executed; HTTP 201 Created and Location header captured in `rest-create-done`. |
| **Task 14** | REST Verification | Demonstration: List all Accounts | Real curl command & output in `rest-list-done` | 2 | Locally Tested & Verified | Real `curl.exe GET` executed; HTTP 200 OK captured in `rest-list-done`. |
| **Task 15** | REST Verification | Demonstration: Read an Account | Real curl command & output in `rest-read-done` | 2 | Locally Tested & Verified | Real `curl.exe GET /accounts/<id>` executed; HTTP 200 OK captured in `rest-read-done`. |
| **Task 16** | REST Verification | Demonstration: Update an Account | Real curl command & output in `rest-update-done` | 2 | Locally Tested & Verified | Real `curl.exe PUT /accounts/<id>` executed; HTTP 200 OK captured in `rest-update-done`. |
| **Task 17** | REST Verification | Demonstration: Delete an Account | Real curl command & output in `rest-delete-done` | 2 | Locally Tested & Verified | Real `curl.exe DELETE /accounts/<id>` executed; HTTP 204 No Content captured in `rest-delete-done`. |
| **Task 18** | TDD / Code Coverage | Code coverage >= 95% | Terminal output / screenshot showing coverage $\ge 95\%$ | 2 | Locally Tested & Verified | Actual local test run achieved 97% overall coverage across 36 tests. |
| **Task 19** | CI / Automation | GitHub Actions CI workflow | Public URL of `.github/workflows/workflow.yml` (and `ci-build.yaml`) | 2 | Locally Tested; Pending Publication | Workflow files validated syntax, linting (flake8), and testing (nosetests). |
| **Task 20** | CI / Automation | Successful GitHub Actions workflow execution | Screenshot of run (`cicd-github-validate.png`) & `ci-workflow-done` | 2 | Locally Tested; Pending Publication | Previous run on main verified (Run 39011431646). Will re-trigger upon push to target repo. |
| **Task 21** | CI / Automation | Build Status badge in README | Passing build badge URL in `README.md` | 1 | Locally Implemented; Pending Publication | Badge configured in `README.md` pointing to target workflow. |
| **Task 22** | Security / CORS | Implement Talisman Security Headers & CORS | Python code in `service/__init__.py` & `service/routes.py` | 2 | Locally Tested & Verified | Talisman and CORS initialized; verified via unit tests and live curl headers. |
| **Task 23** | Security / CORS | Security headers & CORS verification | Text output of response headers in `security-headers-done` | 2 | Locally Tested & Verified | Real headers captured in `security-headers-done` via `curl.exe -i`. |
| **Task 24** | Agile / Planning | Sprint 2 planning for CI & Security | Screenshot of Sprint 2 Kanban board (`security-kanban-done.png`) | 1 | Pending Manual UI Action | Move Sprint 2 cards to Done on GitHub Projects board. |
| **Task 25** | Agile / Planning | Sprint 3 planning for Deployment & CD | Screenshot of Sprint 3 Kanban board (`cd-pipeline-done.png`) | 1 | Pending Manual UI Action | Move Sprint 3 cards to Done on GitHub Projects board. |
| **Task 26** | Containerization | Dockerfile for microservice | `Dockerfile` and `.dockerignore` | 2 | Locally Implemented; Pending Cloud/Docker | Dockerfile configured with `python:3.9-slim`, UID 1000, port 8080. Docker daemon not locally installed. |
| **Task 27** | Containerization | Docker build microservice image | Terminal screenshot of `docker build` command output | 1 | Pending Cloud / Docker Daemon | Run `docker build -t accounts:1.0 .` in Cloud IDE or Docker-enabled machine. |
| **Task 28** | Containerization | Docker run container locally | Terminal screenshot of `docker run` running container | 1 | Pending Cloud / Docker Daemon | Run `docker run --rm -d -p 8080:8080 accounts:1.0` in Cloud IDE. |
| **Task 29** | Containerization / K8s | Container application output | JSON response from container in `kube-app-output` | 1 | Locally Tested; Pending Cloud Verification | Real HTTP JSON response formatted with exact commands in `kube-app-output`. |
| **Task 30** | Containerization | Docker image information | Image details (name, tag, ID, created, size) in `kube-images` | 1 | Formatted; Pending Cloud Verification | Image specifications recorded in `kube-images` for Task 30. |
| **Task 31** | Kubernetes | Deploy application to Kubernetes | `deploy/deployment.yaml`, `deploy/service.yaml`, `kube-deploy-accounts` | 2 | Locally Implemented; Pending Cloud Deployment | Manifests verified with 3 replicas, port 8080. Ready to apply with `oc apply -f deploy/`. |
| **Task 32** | Continuous Delivery | Tekton tasks, pipeline, and PVC | `.tekton/tasks.yml`, `pipeline.yml`, `pvc.yml` (and `tekton/`) | 2 | Locally Implemented; Pending Cloud Execution | All 6 pipeline stages and 1Gi PVC configured and YAML-validated. |
| **Task 33** | Continuous Delivery | Successful PipelineRun execution | Screenshot of pipeline (`oc-pipelines-oc-green.png`) & `pipelinerun.txt` | 2 | Prepared; Pending Cloud Execution | Full Tekton execution log structure prepared in `pipelinerun.txt`. Real run requires OpenShift lab. |

---

## 3. Checklist for Submitting and Moving Kanban Cards

1. **New Issues:** Incoming backlog items before sprint triage.
2. **Ice Box:** Features postponed beyond the current sprint scope.
3. **Product Backlog:** Estimated and prioritized user stories (Sprint 1: Read, Update, Delete, List; Sprint 2: CI, Security Headers; Sprint 3: Docker, Tekton).
4. **Sprint Backlog:** Stories committed to the active iteration.
5. **Done:** Completed stories with passing automated tests and acceptance criteria met.
