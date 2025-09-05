# 🚀 Kubernetes with Docker, Terraform & Ansible

This project demonstrates a complete **DevOps CI/CD pipeline** using:

- **Docker** → Containerize the Next.js application  
- **Terraform** → Provision AWS EC2 infrastructure & Kubernetes cluster  
- **Ansible** → Configure servers and deploy Kubernetes manifests  
- **Kubernetes** → Run the application in a scalable environment  
- **GitHub Actions** → Automate Docker image build & push to Docker Hub  

---

## 📂 Project Structure

```
├── app/ # Next.js application source
├── Dockerfile # Docker build instructions
├── terraform/ # Terraform IaC for AWS + Kubernetes
│ ├── provider_and_instance.tf
│ ├── vpc.tf
│ ├── security_group.tf
│ ├── outputs.tf
│ └── variables.tf
├── ansible/ # Ansible playbooks for configuration
│ ├── inventory.ini
│ ├── playbook.yml
│ └── roles/
│ ├── docker/
│ └── k8s/
├── k8s/ # Kubernetes manifests
│ ├── deployment.yaml
│ ├── service.yaml
│ └── ingress.yaml
├── .github/workflows/
│ └── docker-build.yml # GitHub Actions CI/CD workflow
└── README.md
```
---
yaml
Copy code

---

## ⚙️ Prerequisites

Before running the project, install the following tools:

- [Docker](https://docs.docker.com/get-docker/)  
- [Terraform](https://developer.hashicorp.com/terraform/downloads)  
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)  
- [kubectl](https://kubernetes.io/docs/tasks/tools/)  
- AWS Account with IAM user access key + secret  
- [GitHub CLI](https://cli.github.com/) (optional for secrets setup)

---

## 🐳 Step 1: Build & Run with Docker

```bash
# Build Docker image
docker build -t <your-dockerhub-username>/nextjs-app:latest .

# Run container locally
docker run -p 8080:8080 <your-dockerhub-username>/nextjs-app:latest
Visit 👉 http://localhost:8080
```
---
#🌍 Step 2: Provision Infrastructure with Terraform
bash
Copy code
cd terraform

# Initialize Terraform
terraform init

# Validate configuration
terraform validate

# Plan the resources
terraform plan

# Apply to create AWS resources (VPC, EC2, Security Groups, Kubernetes setup)
terraform apply -auto-approve
After apply, Terraform will output:

EC2 Public IP

Kubernetes Cluster Config
```
---

#🤖 Step 3: Configure Server with Ansible
Update ansible/inventory.ini with Terraform output EC2 IP:

```
ini
Copy code
[servers]
<EC2_PUBLIC_IP> ansible_user=ubuntu ansible_ssh_private_key_file=../id_rsa.pem
Run Ansible playbook:

bash
Copy code
cd ansible
ansible-playbook -i inventory.ini playbook.yml
This will:

Install Docker & Kubernetes

Configure nodes

Deploy the application using manifests
```
---
#☸️ Step 4: Deploy on Kubernetes
```bash
Copy code
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl apply -f k8s/ingress.yaml
Check pods & services:
```

```bash
Copy code
kubectl get pods
kubectl get svc
kubectl get ingress
```

---
#🔄 Step 5: GitHub Actions (CI/CD)
GitHub Actions workflow .github/workflows/docker-build.yml:

Runs on push to main branch

Builds Docker image

Pushes to Docker Hub

Setup GitHub Secrets
In your repository → Settings → Secrets:

DOCKERHUB_USERNAME

DOCKERHUB_TOKEN

#📜 Example GitHub Workflow
yaml
Copy code
name: Build and Push Docker Image

on:
  push:
    branches:
      - main

jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v3

      - name: Login to DockerHub
        uses: docker/login-action@v2
        with:
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}

      - name: Build and Push Docker image
        run: |
          docker build -t ${{ secrets.DOCKERHUB_USERNAME }}/nextjs-app:latest .
          docker push ${{ secrets.DOCKERHUB_USERNAME }}/nextjs-app:latest
✅ Verification
After deployment:

bash
Copy code
kubectl get svc
Copy the EXTERNAL-IP and visit in browser:

```
#👉 http://<EXTERNAL-IP>:8080
```

---
#📌 Notes
Terraform manages AWS infrastructure as code.

Ansible automates server configuration & Kubernetes deployment.

GitHub Actions automates Docker build & push to Docker Hub.

Kubernetes ensures scalability & reliability.

---
#🧑‍💻 Author
Md. Razib Hossain
Team Lead | Full-Stack & DevOps Expert