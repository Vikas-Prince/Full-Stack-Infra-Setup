# 🚀 Full-Stack Development & DevOps Automation on AWS EKS

## 📌 Project Overview

This project is a **cloud-native, full-stack application** designed for **high availability, scalability, and automated deployments**. It follows **modern DevOps practices, GitOps principles, and CI/CD automation** to enable seamless **infrastructure provisioning, deployment, and monitoring**. In addition to DevOps and cloud infrastructure, the project also showcases **full-stack development skills** with the use of **React.js for the frontend**, **Node.js for the backend**, and **MongoDB for the database**, demonstrating expertise in building, deploying, and maintaining scalable web applications.

The architecture integrates:

- **Full-Stack Development** → **React.js (Frontend), Node.js (Backend), and MongoDB (Database - sharded cluster)**
- **Multi-Environment Setup & Infrastructure as Code (IaC)** → **Terraform Workspaces for environment segregation and remote backend for state management, along with Terraform used for AWS provisioning**
-  **Configuraion Management** → **Ansible for EC2 configuration, ensuring consistent and automated infrastructure deployment across multiple environments.**
- **CI/CD & GitOps** → **Jenkins, SonarQube, Nexus Repository, and ArgoCD for automated deployments**
- **Centralized ArgoCD Deployment** → **Implemented a hub-spoke model with ArgoCD deployed in the staging cluster as the hub, managing deployments for the production cluster (spoke) efficiently**
- **Centralized Monitoring & Service Discovery** → **Prometheus stack deployed on the hub cluster (staging) to scrape metrics from all other clusters, ensuring unified monitoring and observability**
- **Alert Management** → **Configured Alertmanager to handle and route alerts from Prometheus for better incident response**
- **Ingress Configuration** → **All services, including ArgoCD and the monitoring stack, are exposed using Ingress rules for secure and controlled access**

This repository (**infra-setup**) serves as the **central hub** for infrastructure provisioning, automation, and configuration.

---

## 📌 **Repository Structure & Links**

This project consists of multiple repositories:

- **[🔗 Infra-Setup (Main)](https://github.com/Vikas-Prince/Full-Stack-Infra-Setup)** _(This Repository)_
- **[🔗 MongoDB Repository](https://github.com/Vikas-Prince/mongo-sharded-cluster-on-k8s)** _(mongoDB sharded cluster on eks)_
- **[🔗 Backend Repository](https://github.com/Vikas-Prince/full-stack-Backend-Node)** _(Node.js APIs, MongoDB)_
- **[🔗 Frontend Repository](https://github.com/Vikas-Prince/full-stack-Frontend-React)** _(React.js UI)_
- **[🔗 GitOps Repository](https://github.com/Vikas-Prince/full-stack-GitOps)** _(ArgoCD, GitOps Automation)_

---

## 🏗️ **Production Workflow**

This is the **end-to-end workflow** that powers the entire system, from **provisioning infrastructure** to **deploying applications in production**:

### **1️⃣ Infrastructure Provisioning (Terraform)**

- **Provision AWS Cloud Resources** → Using Terraform to create **VPC and EKS Cluster**.

### **2️⃣ Configuration Management (Ansible)**

- **Provision AWS EC2 instances** using ansible playbook and created Dynamic inventory using jinja2
- **Install & Configure Core Tools** on EC2 Instances:
  - **Jenkins** → For CI/CD pipeline automation.
  - **SonarQube** → For static code analysis & quality checks.
  - **Nexus Repository** → For storing built artifacts & Docker images.
  - **Prometheus & Grafana** → For real-time monitoring & observability.

### **3️⃣ MongoDB Administration (EKS)**

- **Deploy a MongoDB Sharded Cluster** inside AWS EKS.
- **Automate Database Backups** using **Percona Backup**, storing data in **AWS S3**.

### **4️⃣ Backend Deployment (CI/CD & GitOps)**

- **Jenkins Pipeline:**
  - **Build & Test the Backend** (Node.js & Express.js)
  - **Run SonarQube Code Analysis** & **Trivy Security Scan**
  - **Build Docker Image** for the backend application.
  - **Automate Docker Tag Update** in the GitOps repository to ensure proper version control.
  - **Push artifact to Nexus Repository** for artifact storage and versioning.
  - **Send Email Notifications** on pipeline status (success/failure) including detailed logs and reports.
- **ArgoCD Automates Deployment** into AWS EKS.
- **Canary Deployment Strategy** ensures a **smooth rollout with zero downtime**.

### **5️⃣ Frontend Deployment (CI/CD & GitOps)**

- **Jenkins Pipeline:**
  - **Build & Test the Backend** (Node.js & Express.js)
  - **Run SonarQube Code Analysis** & **Trivy Security Scan**
  - **Build Docker Image** for the backend application.
  - **Automate Docker Tag Update** in the GitOps repository to ensure proper version control.
  - **Push artifact to Nexus Repository** for artifact storage and versioning.
  - **Send Email Notifications** on pipeline status (success/failure) including detailed logs and reports.
- **ArgoCD Automates Deployment** into AWS EKS.
- **Blue-Green Deployment Strategy** ensures **seamless UI rollouts**.

### **6️⃣ Monitoring & Security**

- **Prometheus collects real-time metrics** from Kubernetes, EC2, and MongoDB.
- **Grafana provides dashboards** for monitoring performance.
- **Trivy scans Docker images** for vulnerabilities.

---

## 🛠️ **Tech Stack & Tools**

---

| **Category**                         | **Technologies Used**                                      |
| ------------------------------------ | ---------------------------------------------------------- |
| **Frontend Development**             | HTML, CSS, React.js (React Routers, Hooks, Axios)          |
| **Backend Development**              | Node.js, Express.js, MongoDB                               |
| **Infrastructure as Code**           | Terraform (AWS EKS, VPC, EC2)                              |
| **Configuration Management**         | Ansible (EC2, Jenkins, SonarQube, Nexus, Monitoring Tools) |
| **CI/CD & GitOps**                   | Jenkins, ArgoCD, SonarQube, Nexus Repository, Trivy        |
| **Containerization & Orchestration** | Docker, Kubernetes (AWS EKS)                               |
| **Monitoring & Logging**             | Prometheus and Grafana                                     |
| **Security & Backup**                | Trivy (Security Scanning), Percona Backup (MongoDB to S3)  |

---

## 🔧 **Setup & Installation**

### **1️⃣ Clone the Main Repository**

```bash
git clone https://github.com/Vikas-Prince/Full-Stack-Infra-Setup.git
cd infra-setup
```

### 2️⃣ Deploy Infrastructure using Terraform

```bash
terraform init
terraform apply -auto-approve
```

### 3️⃣ Configure Kubernetes Access

```bash
aws eks update-kubeconfig --region your-region --name your-cluster-name
kubectl get nodes
```

### 4️⃣ Provision EC2 Instances with Ansible

```bash
ansible-playbook ec2-provision.yml
ansible-playbook container_configuration.yml
```

## 🏁 **Conclusion**

This **Full-Stack Development & DevOps Automation** project showcases the integration of **cloud-native technologies** and **DevOps best practices** to build a scalable, highly available, and automated application. By leveraging **AWS EKS**, **Terraform**, **Jenkins**, **ArgoCD**, and **Prometheus**, the project ensures **continuous integration**, **continuous deployment**, and **zero-downtime rollouts**.

With **automated infrastructure provisioning**, **CI/CD pipelines**, and **monitoring through service discovery**, the system is designed for seamless deployment, scaling, and observability. **MongoDB Sharded Clusters** ensure data availability and disaster recovery, while **Trivy** ensures security through container scanning.

This solution also integrates **ArgoCD as a centralized GitOps hub**, **Ingress for external exposure**, and comprehensive **alerting** to streamline deployment and operational workflows, offering a modern, fully automated cloud-native solution.

---

For more details, feel free to explore the repositories linked above. Happy coding! 🚀

