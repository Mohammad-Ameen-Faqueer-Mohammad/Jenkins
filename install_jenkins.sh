#!/bin/bash

echo "installing Java first ...(pre-requisite .." 
sudo apt update
sudo apt install fontconfig openjdk-21-jre

echo "checking version of installed java"
java -version

echo "java installed successfully ...."
echo "Getting files for before installing Jenkins" 

sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "install Jenkins ...." 
sudo apt update
sudo apt install jenkins
