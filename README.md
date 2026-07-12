# Azure DevOps CI/CD with Terraform & Docker

## Project Overview

This project demonstrates a complete DevOps workflow by combining Infrastructure as Code (IaC), containerization, and Continuous Integration/Continuous Deployment (CI/CD).

A Flask-based Employee Management System was developed and containerized using Docker. Azure infrastructure was provisioned using Terraform, and Azure DevOps pipelines were created to automate both infrastructure deployment and Docker image creation. The Docker image is securely stored in Azure Container Registry (ACR).

---

# Project Objectives

- Automate Azure infrastructure provisioning using Terraform.
- Containerize a Flask application using Docker.
- Build CI/CD pipelines using Azure DevOps.
- Push Docker images to Azure Container Registry.
- Demonstrate modern DevOps practices.

---

# Technologies Used

| Technology | Purpose |
|------------|---------|
| Python | Backend Development |
| Flask | Web Framework |
| SQLite | Database |
| HTML | Frontend |
| Bootstrap | User Interface |
| Docker | Application Containerization |
| Terraform | Infrastructure as Code |
| Azure DevOps | CI/CD Pipeline |
| Azure Container Registry | Docker Image Repository |
| Microsoft Azure | Cloud Platform |

---
# Application Features

The Employee Management System provides the following features:

- Add Employee
- View Employees
- Update Employee Details
- Delete Employee
- Search Employee by Name or Department

---

# Terraform Infrastructure

Terraform was used to provision Azure infrastructure automatically.

Infrastructure created:

- Azure Resource Group
- Virtual Network
- Subnet
- Network Security Group
- Network Interface

Terraform Files:

- provider.tf
- variables.tf
- terraform.tfvars
- main.tf

---

# Docker

The Flask application was containerized using Docker.

Docker Components:

- Dockerfile
- requirements.txt
- Docker Image
- Docker Container

Example Commands:

```bash
docker build -t employee-management:v1 .
```

```bash
docker run -p 5000:5000 employee-management:v1
```

---

# Azure DevOps Pipelines

## Terraform Pipeline

The Terraform pipeline automates:

- Terraform Init
- Terraform Validate
- Terraform Plan
- Terraform Apply

---

## Docker Pipeline

The Docker pipeline automates:

- Azure Login
- Azure Container Registry Login
- Docker Build
- Docker Tag
- Docker Push

---

# Azure Container Registry (ACR)

The Docker image is automatically pushed to Azure Container Registry.

Example:

```
poojaacr1.azurecr.io/employee-management:v1
```

This image can later be deployed to Azure App Service, Virtual Machines, or Azure Kubernetes Service (AKS).

---
# Author

## Pooja Hallikhede

Computer Science Engineering Student


