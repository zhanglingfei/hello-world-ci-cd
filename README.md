# hello-world-ci-cd
## This project demo url is: http://34.84.2.130/
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
  --project google-cloud-projectid



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
9. [Datadog Monitoring Architecture](#Datadog-Monitoring-Architecture)

## Overview
This project demonstrates a simple "Hello World" application deployed on Google Kubernetes Engine (GKE) using a CI/CD pipeline configured with GitHub Actions. The deployment utilizes containerized environments managed via Docker, with infrastructure defined and managed using Terraform.
![image](https://github.com/zhanglingfei/hello-world-ci-cd/assets/11581357/a2175734-922b-40fa-a1cf-5f2cd894754c)


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

### Kubernetes Configuration
The project includes the following Kubernetes configuration files in the k8s/ directory:

- `deployment.yaml`: Defines the Kubernetes Deployment for the application.
- `service.yaml`: Defines the Kubernetes Service to expose the application.
- `ingress.yaml`: (If applicable) Defines the Ingress resource for routing external traffic.

These files are automatically applied by the CI/CD pipeline during the deployment process.

### CI/CD Pipeline
The deployment process is fully automated through a CI/CD pipeline configured in `.github/workflows/ci.yml`. Here's an overview of how it works:

### Trigger:<br>
Any push to the main branch triggers the pipeline.<br>
### Exceptions: <br>
Changes to README.md, QA folder, and Terraform folder do not trigger the pipeline.<br>
### Pipeline Steps:<br>
The CI/CD pipeline performs the following steps automatically:<br>
a. Checks out the code <br>
b. Sets up the Google Cloud SDK<br>
c. Authenticates with Google Cloud<br>
d. Builds the Docker image<br>
e. Pushes the image to Google Container Registry (GCR)<br>
f. Deploys to GKE:<br>

Applies any changes in the deployment.yaml file Updates the deployment with the new image

### Deployment Process: <br>
The pipeline uses `kubectl apply -f k8s/deployment.yaml` to apply any changes to the deployment configuration.<br>
It then updates the deployment with the new image using kubectl set image.<br>
### Service and Ingress:<br>

If there are changes to service.yaml or ingress.yaml, these are also applied during the deployment process.<br>
Note: The current pipeline does not perform linting or static code analysis. These steps should be added in a production environment.


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
- `gcloud services enable containeranalysis.googleapis.com`
- `gcloud services enable binaryauthorization.googleapis.com`
- `gcloud services enable containerscanning.googleapis.com`

- ![image](https://github.com/zhanglingfei/hello-world-ci-cd/assets/11581357/7ceb8ddd-a9a6-4504-8d38-1fd28d91579b)

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
  ![image](https://github.com/zhanglingfei/hello-world-ci-cd/assets/11581357/67982502-0869-48fb-b448-526f1e1514d8)

## Datadog Monitoring Architecture

Using Datadog alongside Google's native monitoring tools for a Node.js web application containerized and deployed on Google Kubernetes Engine (GKE) can provide several benefits and enhanced monitoring capabilities. Here's a proposal outlining the advantages and implementation of Datadog:

Proposal: Enhancing GKE Monitoring with Datadog

### 1. Unified Monitoring Platform:
   - Datadog offers a single platform for monitoring infrastructure, applications, and logs.
   - Benefit: Centralizes monitoring across your entire stack, including GKE, Node.js, and any other services you might be using.

#### 2. Advanced Application Performance Monitoring (APM):
   - Datadog APM provides detailed insights into Node.js application performance.
   - Benefit: Helps identify bottlenecks, slow queries, and performance issues at the code level.

### 3. Container-specific Monitoring:
   - Datadog has strong support for containerized environments and Kubernetes.
   - Benefit: Provides detailed metrics on container health, resource usage, and orchestration.

### 4. Custom Metrics and Dashboards:
   - Easily create custom metrics and dashboards tailored to your application's needs.
   - Benefit: Visualize and track KPIs specific to your Node.js application and business logic.

### 5. Log Management and Analysis:
   - Centralized log collection and analysis from all components of your stack.
   - Benefit: Easier troubleshooting and ability to correlate logs with metrics and traces.

### 6. Real-time Alerting:
   - Sophisticated alerting system with support for complex conditions and alert routing.
   - Benefit: Faster incident response and reduced Mean Time To Resolution (MTTR).

### 7. Integrations:
   - Datadog offers integrations, including with GCP services.
   - Benefit: Extends monitoring capabilities beyond what's available natively in GCP.

### 8. Anomaly Detection:
   - Machine learning-powered anomaly detection for metrics.
   - Benefit: Proactively identifies unusual patterns that might indicate issues.

### 9. Synthetic Monitoring:
    - Simulate user interactions to monitor application availability and performance.
    - Benefit: Proactively detect issues from an end-user perspective.

### Implementation Steps:

### 1. Install Datadog Agent:
   - Deploy the Datadog Agent as a DaemonSet in your GKE cluster.
   - Use Helm charts for easy deployment and management.

### 2. Configure Node.js APM:
   - Install and configure the Datadog APM library in your Node.js application.
   - Instrument your code to capture custom metrics and traces.

### 3. Set up Log Collection:
   - Configure log collection for both container and application logs.
   - Use Datadog's log processing pipelines for parsing and enrichment.

### 4. Create Dashboards:
   - Build custom dashboards that combine GKE metrics, Node.js application metrics, and business KPIs.

### 5. Configure Alerts:
   - Set up alerts for critical metrics, log patterns, and anomalies.
   - Integrate with your incident management system (e.g., PagerDuty).

### 6. Implement Synthetic Tests:
   - Create synthetic tests to monitor key user journeys and API endpoints.

### 7. Enable Integrations:
   - Set up relevant Datadog integrations for other services you're using (e.g., databases, caching layers).

### 8. Train Team:
   - Provide training to your team on using Datadog for monitoring and troubleshooting.

## Cost Considerations:
- Evaluate Datadog pricing based on the number of hosts, log volume, and required features.
- Compare with the cost of using advanced features of Google Cloud's operations suite.

By implementing Datadog alongside Google's native monitoring tools, you'll gain deeper insights into your application's performance, improve troubleshooting capabilities, and enhance your overall observability strategy. This combination allows you to leverage the best of both platforms, ensuring comprehensive monitoring of your GKE-deployed Node.js application.

