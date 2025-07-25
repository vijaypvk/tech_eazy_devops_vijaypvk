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