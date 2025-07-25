
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

# Assignment 2 – IAM + S3 + Logging Automation

## 🎯 Objectives

- Create IAM Roles for restricted S3 access
- Launch EC2 with upload-only role
- Upload logs to S3 after instance stops
- Add lifecycle rule to delete logs after 7 days

## 📁 Resources Created

- IAM Role A: Read-only S3
- IAM Role B: Upload-only S3 (attached to EC2)
- Private S3 bucket for logs
- EC2 instance with role and user_data

## 🧪 How to Use

```bash
terraform init
terraform apply -var-file="dev.tfvars"
```

- Logs are uploaded using AWS CLI in `userdata.sh`
- Auto shutdown after 1 hour
- Verify log files are uploaded to S3

## ✅ Test Read-only Role

Switch to Role A and run:
```bash
aws s3 ls s3://vijay-s3-logs-assignment/
```
