# hello-world-ci-cd

# create GKE cluster using gcloud command
gcloud container clusters create hello-world-cluster-tokyo \
  --zone asia-northeast1-a \
  --num-nodes 1 \
  --machine-type e2-small \
  --disk-size 10GB \
  --enable-autorepair \
  --enable-autoupgrade \
  --enable-autoscaling \
  --min-nodes 0 \
  --max-nodes 3 \
  --project gentle-dominion-245803

# Hello World Application on GKE

## Table of Contents
1. [Overview](#overview)
2. [Architecture](#architecture)
3. [Implementation Process](#implementation-process)
4. [Setup Instructions](#setup-instructions)
5. [Deployment Instructions](#deployment-instructions)
6. [Tool Choices and Rationale](#tool-choices-and-rationale)
7. [Assumptions](#assumptions)
8. [Security Considerations](#security-considerations)

## Overview
This project demonstrates a simple "Hello World" application deployed on Google Kubernetes Engine (GKE) using a CI/CD pipeline configured with GitHub Actions. The deployment utilizes containerized environments managed via Docker, with infrastructure defined and managed using Terraform.

## Architecture
### Components
- **Google Cloud Platform (GCP):** Cloud provider hosting the infrastructure.
- **GKE (Google Kubernetes Engine):** Manages Kubernetes clusters for container orchestration.
- **GitHub Actions:** CI/CD pipeline to automate build, test, and deployment processes.
- **Docker:** Containerizes the application for consistent deployment across environments.
- **Terraform:** Infrastructure as Code (IaC) tool to provision and manage GCP resources.
- **Monitoring and Logging:** Integrated with Google Cloud Monitoring and Logging to collect logs and monitor application health.

## Implementation Process
1. **Cloud Infrastructure Setup**
   - **Terraform:** Used to define and provision the GKE cluster in GCP.
   - **Resources Provisioned:**
     - GKE Cluster
     - Node Pools
     - Networking (VPC, Subnets, Firewall Rules)
2. **CI/CD Pipeline Configuration**
   - **GitHub Actions:** Configured to:
     - Checkout the code.
     - Build Docker images.
     - Push Docker images to Google Container Registry (GCR).
     - Deploy the application to GKE using `kubectl`.
3. **Application Containerization**
   - **Docker:** Dockerfile created to define the container image for the "Hello World" application.
4. **Kubernetes Deployment**
   - **Kubernetes Manifests:** Deployment and Service manifests to define the application deployment in GKE.
5. **Monitoring and Logging**
   - **Google Cloud Monitoring and Logging:** Configured to collect and analyze logs and metrics from the GKE cluster and application pods.

## Setup Instructions
### Prerequisites
- Google Cloud account
- GitHub account
- Docker installed locally
- Terraform installed locally
- `gcloud` CLI installed and configured

### Steps
1. **Clone the Repository:**
   ```sh
   git clone https://github.com/your-repo/hello-world.git
   cd hello-world

# Hello World Application on GKE

## Table of Contents
1. [Overview](#overview)
2. [Architecture](#architecture)
3. [Implementation Process](#implementation-process)
4. [Setup Instructions](#setup-instructions)
5. [Deployment Instructions](#deployment-instructions)
6. [Tool Choices and Rationale](#tool-choices-and-rationale)
7. [Assumptions](#assumptions)
8. [Security Considerations](#security-considerations)

## Overview
This project demonstrates a simple "Hello World" application deployed on Google Kubernetes Engine (GKE) using a CI/CD pipeline configured with GitHub Actions. The deployment utilizes containerized environments managed via Docker, with infrastructure defined and managed using Terraform.

## Architecture
### Components
- **Google Cloud Platform (GCP):** Cloud provider hosting the infrastructure.
- **GKE (Google Kubernetes Engine):** Manages Kubernetes clusters for container orchestration.
- **GitHub Actions:** CI/CD pipeline to automate build, test, and deployment processes.
- **Docker:** Containerizes the application for consistent deployment across environments.
- **Terraform:** Infrastructure as Code (IaC) tool to provision and manage GCP resources.
- **Monitoring and Logging:** Integrated with Google Cloud Monitoring and Logging to collect logs and monitor application health.

## Implementation Process
1. **Cloud Infrastructure Setup**
   - **Terraform:** Used to define and provision the GKE cluster in GCP.
   - **Resources Provisioned:**
     - GKE Cluster
     - Node Pools
     - Networking (VPC, Subnets, Firewall Rules)
2. **CI/CD Pipeline Configuration**
   - **GitHub Actions:** Configured to:
     - Checkout the code.
     - Build Docker images.
     - Push Docker images to Google Container Registry (GCR).
     - Deploy the application to GKE using `kubectl`.
3. **Application Containerization**
   - **Docker:** Dockerfile created to define the container image for the "Hello World" application.
4. **Kubernetes Deployment**
   - **Kubernetes Manifests:** Deployment and Service manifests to define the application deployment in GKE.
5. **Monitoring and Logging**
   - **Google Cloud Monitoring and Logging:** Configured to collect and analyze logs and metrics from the GKE cluster and application pods.

## Setup Instructions
### Prerequisites
- Google Cloud account
- GitHub account
- Docker installed locally
- Terraform installed locally
- `gcloud` CLI installed and configured

### Steps
1. **Clone the Repository:**
   ```sh
   git clone https://github.com/your-repo/hello-world.git
   cd hello-world

# Deployment Instructions
## Using GitHub Actions

### Push Code to GitHub
- Any push to the main branch will trigger the CI/CD pipeline configured in `.github/workflows/ci.yml`.

### Monitor Deployment
- Check GitHub Actions logs for build and deployment status.
- Verify the deployment in the GKE cluster:
  ```sh
  gcloud container clusters get-credentials hello-world-cluster-tokyo --zone asia-northeast1-a --project your-gcp-project-id
  kubectl get pods
  kubectl get services

# Tool Choices and Rationale

- **Google Cloud Platform (GCP):** Reliable cloud provider with robust Kubernetes support via GKE.
- **Google Kubernetes Engine (GKE):** Managed Kubernetes service that simplifies cluster management and scaling.
- **GitHub Actions:** Integrated CI/CD capabilities within GitHub, providing seamless automation for build and deployment.
- **Docker:** Ensures consistency across development, testing, and production environments.
- **Terraform:** Enables infrastructure as code (IaC), making the infrastructure reproducible, auditable, and version-controlled.

# Assumptions

- **GCP Project:** Assumes the existence of a GCP project with the necessary APIs enabled.
- **GitHub Repository:** Assumes a GitHub repository with appropriate permissions for GitHub Actions to manage GCP resources.
- **Basic Application:** Assumes a simple "Hello World" application with minimal dependencies.

# Security Considerations

## Secure CI/CD Pipeline
- **Secrets Management:** Use GitHub Secrets to store sensitive information like GCP service account keys. Avoid hardcoding secrets in the repository.
- **Access Control:** Restrict access to the GitHub repository. Use branch protection rules for code reviews.
- **Audit Logging:** Enable audit logging in GitHub Actions to monitor and review pipeline activities.

## Container Security
- **Image Security:** Use trusted base images, regularly update them, and scan Docker images for vulnerabilities using tools like Trivy or Clair.
- **Least Privilege Principle:** Run containers with the least privilege required. Avoid running containers as the root user.
- **Immutable Infrastructure:** Treat containers as immutable; rebuild and redeploy rather than patching running containers.

## Kubernetes Cluster Security
- **Network Security:** Use Kubernetes Network Policies to control traffic flow between pods. Enable Private Google Access and use VPC Service Controls to protect your GKE clusters.
- **RBAC (Role-Based Access Control):** Implement RBAC to control access to Kubernetes resources. Grant minimal required permissions to users and service accounts.
- **Node Security:** Use Google’s Container-Optimized OS or another secure minimal base image for your nodes. Regularly update and patch Kubernetes nodes.

## Data Security
- **Encryption:** Encrypt data at rest using Google Cloud’s default encryption and data in transit using TLS.
- **Secrets Management:** Use Kubernetes Secrets to manage sensitive data. Ensure secrets are encrypted at rest. Consider using an external secrets management solution like HashiCorp Vault.

## Monitoring and Logging
- **Log Aggregation:** Use Google Cloud Logging and Monitoring to collect and analyze logs from applications and infrastructure.
- **Intrusion Detection:** Implement intrusion detection systems (IDS) and security information and event management (SIEM) tools.
- **Alerting:** Set up alerts for critical security events like unauthorized access attempts or unusual network traffic patterns.
