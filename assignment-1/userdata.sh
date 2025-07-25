#!/bin/bash
set -e

# Update
apt-get update -y

# Install Java 21
apt install wget gnupg2 -y
wget -O- https://packages.adoptium.net/artifactory/api/gpg/key/public | gpg --dearmor | tee /usr/share/keyrings/adoptium.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/adoptium.gpg] https://packages.adoptium.net/artifactory/deb jammy main" > /etc/apt/sources.list.d/adoptium.list
apt update
apt install temurin-21-jdk -y

# Install Maven & Git
apt install maven git -y

# Clone and run the app
cd /home/ubuntu
git clone https://github.com/Trainings-TechEazy/test-repo-for-devops.git
cd test-repo-for-devops
mvn clean package

# Run app on port 80
nohup java -jar target/hellomvc-0.0.1-SNAPSHOT.jar --server.port=80 > app.log 2>&1 &
