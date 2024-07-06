
● Cloud Provider - GCP (***DONE***)
● Web Application - Take an existing open-source web application project including frontend, backend, and database. （UPDATE: ***create a hello-world and not a web application***)
● Infrastructure as Code - Use tools like Terraform to host the application in the cloud. 
 ***Feedback***:
Terraform is primarily an Infrastructure as Code (IaC) tool designed for managing and provisioning cloud resources, not for directly hosting applications. It excels at creating and configuring infrastructure components like virtual machines, networks, and storage, which are necessary for running applications. However, Terraform does not handle the actual deployment or runtime management of applications themselves.
For application hosting, tools like Kubernetes, Docker, or platform-specific services are typically used in conjunction with the infrastructure Terraform sets up. Terraform creates the environment where applications can be hosted, but it doesn't manage the application lifecycle directly.

● Continuous Integration - Create a CI pipeline using GitHub actions (preferred but you can use others as well), and the required stages that you think would add value. (***DONE***)
● Docker - Create a docker image from the CI. (***DONE***)
● Continuous Deployment - Automate the deployment process using Kubernetes. Include deployment to minimize downtime and risk. (***DONE***)
● Monitoring and logging - Integrate monitoring and logging solutions to collect logs from infrastructure and applications. Describe how you can use these tools for detecting and troubleshooting issues. 
Feedback:
For monitoring and logging on Google Cloud Platform, I would leverage GCP's native Cloud Operations suite (formerly Stackdriver). This integrated solution provides comprehensive observability for both GCP services and custom applications.


● Documentation/readme.md - Provide detailed documentation of the architecture and implementation process. Add all the details of the setup and deployment instructions and an explanation of the choices of the tools and processes that have been made. Document any assumptions made during the assignment and explain the rationale behind design decisions. 
   - This requirements is too much efforts and I could not complete in an interview process.

● The assignment needs to be done with the release to production mindset. （UPDATE)
Upon reviewing the assignment requirements, I believe delivering a full-featured production solution involves significant time and cost, particularly with GCP resource spending. Setting up and maintaining GCP resources, even temporarily, incurs real costs, which might be substantial for an interview assignment.
   - To effectively demonstrate my production mindset without incurring these costs, I propose providing a detailed paper Proof of Concept (PoC).
