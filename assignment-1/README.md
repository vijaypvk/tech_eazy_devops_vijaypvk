# Terraform EC2 Deployment for Zero Mile Delivery System

This project automates the deployment of a Spring Boot application on AWS EC2 using Terraform.

## 🛠 Requirements
- AWS CLI configured
- Terraform installed
- Key pair and security group created in AWS

## 🚀 Deployment Steps
```bash
terraform init
terraform apply -var-file=dev.tfvars
```

## ✅ Verify
After deployment, check:
```bash
http://<public_ip>/hello
```

You should see: **Hello from Spring MVC!**

## 📌 Notes
- Instance shuts down automatically after 1 hour.
- You can create `prod.tfvars` similarly for production.