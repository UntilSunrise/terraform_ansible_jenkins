# Terrafrom Ansbile Jenkins
This repository contains instructions and configuration files for automated raising of Jenkins-master using Terraform and Ansible. You can also further integrate Jenkins with clouds or Docker and bring up agents as needed.
## Requirements
Before getting started, ensure you have the following components installed:
- [Terraform](https://www.terraform.io/)
- [Ansible](https://www.ansible.com/)
- [Docker](https://www.docker.com/) (if you plan to use Docker for agents)
- [OracleVM](https://www.virtualbox.org/) (for virtual machine)

## Step 1: Provisioning Jenkins-Master using Terraform
1. Install docker, terraform, ansible on the virtual machine (used ubuntu image 22.04).
2. You can use git clone or touch/add files on your machine with code from git files.
3. After everything is configured, we make commands:
- Set up terraform. Terraform. Teraform builds a docker container with Ubuntu
```
terraform init
terraform apply
```
## Step 2: Set up Ansible. Setting up Jenkins in docker container
```
ansible-playbook -i inventory.ini install_jenkins.yml
```
- When Jenkins setting up go to container:
```
docker exec -it jenkins_master /bin/bash
```
- Browse to  http://localhost:8080 and wait until the Unlock Jenkins page appears.
- In Jenkins container show your password and copy it:
```
cat /var/lib/jenkins/secrets/initialAdminPassword
```
- On the Unlock Jenkins page, paste this password into the Administrator password field and click Continue.
