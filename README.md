# 🚀 Full-Stack Development & DevOps Automation on AWS EKS

## 📌 Project Overview

This project is a **cloud-native, full-stack application** designed for **high availability, scalability, and automated deployments**. It follows **modern DevOps practices, GitOps principles, and CI/CD automation** to enable seamless **infrastructure provisioning, deployment, and monitoring**. In addition to DevOps and cloud infrastructure, the project also showcases **full-stack development skills** with the use of **React.js for the frontend**, **Node.js for the backend**, and **MongoDB for the database**, demonstrating expertise in building, deploying, and maintaining scalable web applications.

The architecture integrates:

- **Full-Stack Development** → **React.js (Frontend), Node.js (Backend), and MongoDB (Database)**
- **Infrastructure as Code (IaC)** → **Terraform for AWS provisioning, Ansible for EC2 configuration**
- **CI/CD & GitOps** → **Jenkins, SonarQube, Nexus Repository, and ArgoCD for automated deployments**
- **Monitoring & Security** → **Prometheus, Grafana, Trivy (Security Scanning)**
- **Database Administration** → **MongoDB Sharded Cluster with Percona Backup for disaster recovery**

This repository (**infra-setup**) serves as the **central hub** for infrastructure provisioning, automation, and configuration.

---

## ✨ Key Features

✅ **Cloud-Native & Scalable Architecture** – Deployed on **AWS EKS** using **Kubernetes**  
✅ **Automated Infrastructure Setup** – Terraform for provisioning **AWS VPC and EKS**  
✅ **Configuration Management** – Ansible for **EC2 setup (Jenkins, SonarQube, Nexus, Prometheus, Grafana)**  
✅ **GitOps-Based CI/CD** – Jenkins for **continuous integration** and ArgoCD for **continuous deployment**  
✅ **Database Administration** – **MongoDB Sharded Cluster** with **Percona Backup (AWS S3 Storage)**  
✅ **Deployment Strategies** – **Canary (Backend) & Blue-Green (Frontend) for Zero Downtime Deployments**  
✅ **Observability & Security** – **Prometheus, Grafana, AWS CloudWatch, and Trivy (Container Security Scanning)**

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
- **AWS CloudWatch & Fluentd handle centralized logging**.
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

## 📌 **Repository Structure & Links**

This project consists of multiple repositories:

- **[🔗 Infra-Setup (Main)](https://github.com/Vikas-Prince/Full-Stack-Infra-Setup)** _(This Repository)_
- **[🔗 Monitoring Repository](https://github.com/Vikas-Prince/mongo-sharded-cluster-on-k8s)** _(mongoDB sharded cluster on eks)_
- **[🔗 Backend Repository](https://github.com/Vikas-Prince/food-Delivery-Backend-Node)** _(Node.js APIs, MongoDB)_
- **[🔗 Frontend Repository](https://github.com/Vikas-Prince/food-Delivery-Frontend-React)** _(React.js UI)_
- **[🔗 GitOps Repository](https://github.com/Vikas-Prince/food-Delivery-GitOps)** _(ArgoCD, GitOps Automation)_
- **[🔗 Monitoring Repository](https://github.com/your-username/monitoring-repo)** _(Prometheus, Grafana, Fluentd)_

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

### 5️⃣ Deploy Backend using ArgoCD

```bash
kubectl create ns argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/v2.4.7/manifests/install.yaml
```

## 🏁 **Conclusion**

This **Full-Stack Development & DevOps Automation** project demonstrates the integration of **modern cloud-native technologies** with **DevOps best practices** to build a scalable, highly available, and automated application. By leveraging **AWS EKS**, **Terraform**, **Jenkins**, **ArgoCD**, and **Prometheus**, this project ensures **continuous integration, continuous deployment**, and **zero-downtime rollouts**.

With automated **infrastructure provisioning** and **CI/CD pipelines**, the entire system is designed for seamless deployment, monitoring, and scaling. The use of **MongoDB Sharded Clusters** and **Percona backups** ensures data availability and disaster recovery, while **security scanning** with **Trivy** ensures the safety of the system.

This project provides a comprehensive understanding of full-stack development, **cloud architecture**, **DevOps practices**, and **container orchestration** with Kubernetes, making it a valuable solution for modern application development and deployment workflows.

---

For more details, feel free to explore the repositories linked above. Happy coding! 🚀
