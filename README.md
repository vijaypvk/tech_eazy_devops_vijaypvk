
# 🚀 TechEazy DevOps Terraform Assignments – *Vijay Krishnaa*

This repository contains solutions for **Assignment 1** and **Assignment 2** as part of the **TechEazy DevOps Training** using **Terraform** on **AWS**.

---

## 📁 Directory Structure

```
tech_eazy_devops_vijaypvk/
├── assignment-1/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── dev.tfvars
│   ├── userdata.sh
│   └── README.md
├── assignment-2/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── dev.tfvars
│   ├── userdata.sh
│   └── README.md
```

---

## ✅ Assignment 1: Provision EC2 with Terraform

### 🎯 Objective

Provision a single **Ubuntu EC2 instance** using Terraform with:

- SSH key-based access  
- `userdata.sh` to install Java, Maven, Git  
- Clone and run a Java Spring Boot app on port **80**  
- Attach Security Group, Key Pair, and IAM Role (if needed)

### 📦 Files

- `main.tf`: Launch EC2 instance and define security group
- `variables.tf`: Input variables (e.g., region, AMI ID, key name)
- `outputs.tf`: Output values like instance public IP
- `dev.tfvars`: Development environment variable values
- `userdata.sh`: Script to set up and run the application

### 💡 Highlights

- **Instance Type**: `t2.micro`  
- **AMI**: Ubuntu 22.04  
- **Security Group**: Port 80 open for HTTP access  
- **Bootstrapping**: Clones and runs Spring Boot app via `cloud-init`  

### 🧪 How to Deploy

```bash
cd assignment-1
terraform init
terraform apply -var-file="dev.tfvars"
```

Open in browser:

```
http://<public_ip>/hello
```

---

## ✅ Assignment 2: Infrastructure with Reusability

### 🎯 Objective

Enhance the infrastructure with better reusability and modular design:

- Use **variables** for all configuration  
- Create reusable components for **EC2, VPC, and Security Groups**  
- Track state with `terraform.tfstate`  
- Add `.gitignore` to avoid committing sensitive/temporary files  

### 📦 Files

- `main.tf`: Modular and reusable configuration  
- `variables.tf`: Parameterized input definitions  
- `outputs.tf`: Outputs like public IP  
- `dev.tfvars`: Development environment inputs  
- `userdata.sh`: Reused shell script  
- `.terraform.lock.hcl`: Terraform provider version lock  

### 🧠 Improvements over Assignment 1

- Fully parameterized configuration  
- Cleaner, reusable modules  
- Supports multiple environments (e.g., dev, prod)  
- Removed hardcoded values for better maintainability  

### 🧪 How to Deploy

```bash
cd assignment-2
terraform init
terraform apply -var-file="dev.tfvars"
```

View the instance's public IP in the output or from the AWS Console.
