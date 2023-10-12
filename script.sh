#!/bin/bash

# Install packets
export DEBIAN_FRONTEND=noninteractive
apt-get -y install sudo wget curl

# Wait 10sec
echo "W8"
sleep 10

# Jenkins check
if service jenkins status >/dev/null; then
  echo "Jenkins already installed and run"
  exit 0
fi

# Install Jenkins
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# update packages
apt-get update

# Wait 10 sec again
echo "W8"
sleep 10

# Install Jenkins
apt-get -y install jenkins

# Install Java
sleep 20

apt-get update
apt-get -y install fontconfig openjdk-17-jre
service jenkins start
