#!/bin/bash
sudo apt-get update
sudo apt-get install -y awscli

# Simulated log files
echo "App started successfully at $(date)" > /home/ubuntu/app.log

# Upload logs to S3
aws s3 cp /var/log/cloud-init.log s3://vijay-s3-logs-assignment/cloud-init.log
aws s3 cp /home/ubuntu/app.log s3://vijay-s3-logs-assignment/app.log

# Optional auto-shutdown (1 hour)
sudo shutdown -h +60