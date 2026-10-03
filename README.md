# Employee Management Application

A full-stack **Employee Management Application** deployed on **Amazon EKS** using Docker, Amazon ECR, Kubernetes, Terraform, GitHub Actions, and PostgreSQL RDS.

---

## 📌 Project Overview

This project demonstrates a complete DevOps deployment workflow on AWS.

The application contains:

* Frontend using HTML, CSS, and JavaScript
* Backend using Python Flask
* PostgreSQL database
* Docker containers
* Amazon ECR for Docker images
* Amazon EKS for Kubernetes
* Terraform for Infrastructure as Code
* GitHub Actions for CI/CD
* Nginx for frontend serving and API routing
* AWS Load Balancer for external access

---

# 🏗️ Complete Architecture

```text
                              DEVELOPER
                                  |
                                  | Git Push
                                  v
                              GITHUB
                                  |
                                  v
                         GITHUB ACTIONS (CI/CD)
                                  |
                    +-------------+-------------+
                    |                           |
                    v                           v
              DOCKER BUILD                 TERRAFORM
                    |                           |
                    v                           v
              AMAZON ECR                    AWS VPC
          +---------+---------+          +------+------+
          |                   |          |             |
          v                   v          v             v
     Frontend Image      Backend Image  Public       Private
                                      Subnets       Subnets
                                          |             |
                                          v             |
                                   AWS LOAD BALANCER    |
                                          |             |
                                          v             |
                                   AMAZON EKS            |
                                  employee-cluster       |
                                          |              |
                              +-----------+-----------+  |
                              |                       |  |
                              v                       v  |
                       FRONTEND DEPLOYMENT      BACKEND DEPLOYMENT
                              |                       |
                              v                       v
                         NGINX PODS              FLASK PODS
                              |                       |
                              | API Request           |
                              +-----------> BACKEND   |
                                           SERVICE    |
                                                |     |
                                                +-----+
                                                  |
                                                  v
                                           POSTGRESQL RDS
                                           Private Subnet
```

---

# 🔄 Application Request Flow

```text
User / Browser
      |
      v
AWS Load Balancer
      |
      v
Frontend Service
      |
      v
Nginx Frontend Pods
      |
      | /api request
      v
Backend Service
      |
      v
Flask Backend Pods
      |
      v
PostgreSQL RDS
```

---

# 🔄 CI/CD Flow

```text
Developer
    |
    v
GitHub
    |
    v
GitHub Actions
    |
    +----> Docker Build
    |
    +----> Push Images
              |
              v
          Amazon ECR
              |
              v
          Amazon EKS
              |
              v
       Kubernetes Deployment
```

---

# ☁️ AWS Infrastructure

Terraform provisions the main AWS infrastructure:

```text
AWS
│
├── VPC
│   ├── Public Subnets
│   │   └── Load Balancer
│   │
│   └── Private Subnets
│       ├── EKS Worker Nodes
│       └── PostgreSQL RDS
│
├── Amazon EKS
│   └── employee-cluster
│
├── Amazon ECR
│   ├── employee-frontend
│   └── employee-backend
│
├── IAM
│   ├── EKS Cluster Role
│   └── Worker Node Role
│
├── KMS
│   └── EKS Encryption
│
└── RDS
    └── PostgreSQL
```

---

# 🛠️ Technologies Used

| Technology        | Purpose                     |
| ----------------- | --------------------------- |
| HTML              | Frontend structure          |
| CSS               | Frontend styling            |
| JavaScript        | Frontend functionality      |
| Nginx             | Web server and API routing  |
| Python            | Backend development         |
| Flask             | REST API                    |
| PostgreSQL        | Database                    |
| Docker            | Containerization            |
| Amazon ECR        | Docker image registry       |
| Amazon EKS        | Kubernetes platform         |
| Kubernetes        | Container orchestration     |
| Terraform         | Infrastructure as Code      |
| GitHub Actions    | CI/CD                       |
| AWS VPC           | Networking                  |
| AWS IAM           | Access management           |
| AWS KMS           | Encryption                  |
| AWS Load Balancer | External application access |

---

# 📁 Project Structure

```text
employee-app/
│
├── frontend/
│   ├── index.html
│   ├── employee.png
│   ├── nginx.conf
│   └── Dockerfile
│
├── backend/
│   ├── app.py
│   ├── requirements.txt
│   └── Dockerfile
│
├── k8s/
│   ├── frontend.yaml
│   └── backend.yaml
│
├── terraform/
│   ├── provider.tf
│   ├── variables.tf
│   ├── vpc.tf
│   ├── eks.tf
│   ├── rds.tf
│   └── outputs.tf
│
├── .github/
│   └── workflows/
│       └── deploy.yml
│
├── .gitignore
└── README.md
```

---

# 🐳 Docker

Both frontend and backend applications are containerized using Docker.

### Build frontend

```bash
docker build -t employee-frontend ./frontend
```

### Build backend

```bash
docker build -t employee-backend ./backend
```

The Docker images are pushed to Amazon ECR.

---

# 📦 Amazon ECR

ECR stores the application Docker images.

```text
Amazon ECR
│
├── employee-frontend
│
└── employee-backend
```

---

# ☸️ Kubernetes / Amazon EKS

The application is deployed to an Amazon EKS cluster.

### Frontend

```text
Deployment
    |
    +-- Frontend Pod
    |
    +-- Frontend Pod
```

Frontend is exposed using:

```text
Service Type: LoadBalancer
```

### Backend

```text
Deployment
    |
    +-- Backend Pod
    |
    +-- Backend Pod
```

Backend is exposed internally using:

```text
Service Type: ClusterIP
```

---

# 🌐 Nginx

Nginx is used to:

* Serve the frontend application
* Serve static files such as `employee.png`
* Forward API requests to the backend

Example:

```text
Browser
   |
   | /api/employees
   v
Nginx
   |
   v
Backend Service
   |
   v
Flask API
```

---

# 🗄️ PostgreSQL RDS

PostgreSQL is used as the application's database.

The database is deployed in the **private subnet** so that it is not directly exposed to the internet.

```text
Flask Backend
      |
      v
PostgreSQL RDS
```

---

# 🏗️ Terraform

Terraform is used to create AWS infrastructure.

Main resources include:

* VPC
* Subnets
* Security Groups
* EKS Cluster
* EKS Managed Node Group
* IAM Roles
* IAM Policies
* KMS
* CloudWatch Logs
* PostgreSQL RDS
* RDS Subnet Group

### Terraform workflow

```bash
terraform init
terraform plan
terraform apply
```

To destroy the infrastructure:

```bash
terraform destroy
```

---

# 🔄 GitHub Actions CI/CD

GitHub Actions automates the deployment process.

```text
Git Push
    |
    v
GitHub Actions
    |
    v
Build Docker Images
    |
    v
Push Images to ECR
    |
    v
Update Kubernetes Deployment
    |
    v
Amazon EKS
```

---

# 🔍 Kubernetes Commands

Check pods:

```bash
kubectl get pods
```

Check deployments:

```bash
kubectl get deployments
```

Check services:

```bash
kubectl get services
```

Check endpoints:

```bash
kubectl get endpoints
```

Check application logs:

```bash
kubectl logs <pod-name>
```

---

# 🔍 AWS Commands

Check EKS clusters:

```bash
aws eks list-clusters --region ap-south-1
```

Check ECR repositories:

```bash
aws ecr describe-repositories --region ap-south-1
```

---

# 🎯 DevOps Concepts Demonstrated

This project demonstrates:

* Docker containerization
* Docker image management
* Amazon ECR
* Amazon EKS
* Kubernetes Deployments
* Kubernetes Services
* Kubernetes Pods
* AWS Load Balancer
* Nginx configuration
* REST API communication
* Terraform Infrastructure as Code
* GitHub Actions CI/CD
* AWS VPC networking
* IAM
* KMS encryption
* PostgreSQL RDS
* Application troubleshooting

---

# 🗣️ Interview Explanation

> I developed an Employee Management Application with a frontend, Flask backend, and PostgreSQL database. I containerized the frontend and backend using Docker and stored the images in Amazon ECR. I used Terraform to provision the AWS infrastructure including VPC, EKS, IAM, KMS, and RDS. The application runs on Amazon EKS using Kubernetes Deployments and Services. The frontend is exposed through an AWS Load Balancer, Nginx serves the frontend and routes API requests to the backend Service, and the Flask backend communicates with PostgreSQL RDS. GitHub Actions is used to automate the CI/CD process.

---

# 👨‍💻 Author

**Bavajan Masunuri**

DevOps & Cloud Engineer

GitHub: `bavajanmasunuri539-hue`
