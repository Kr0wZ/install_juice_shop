#!/bin/bash

#In case of error with Kali Linux update -> sudo gpg --keyserver keyserver.ubuntu.com --recv-key 7EA0A9C3F273FCD8 && sudo gpg -a --export 7EA0A9C3F273FCD8 | sudo apt-key add -

#Install docker
sudo apt update -y
sudo apt install -y ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings

#Ubuntu
#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor --batch --yes -o /etc/apt/keyrings/docker.gpg
#echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

#Kali/Debian
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor --batch --yes -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian buster stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update -y
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

#Install Juice Shop docker image
sudo docker create -e "NODE_ENV=unsafe" -p 3000:3000 --name=juice bkimminich/juice-shop
sudo docker start juice
sudo docker update --restart unless-stopped juice

echo "Access the Juice Shop through: http://localhost:3000"
