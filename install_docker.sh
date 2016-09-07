#!/bin/sh

## PREREQUISITES ##
# Purge old repositories
sudo apt-get purge "lxc-docker*"
sudo apt-get purge "docker.io*"

# Update package information
sudo apt-get update

# Install dependencies for HTTPS connections
sudo apt-get install apt-transport-https ca-certificates

# Add GPG key
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

# Create (remove old if exists) docker.list file
sudo rm /etc/apt/sources.list.d/docker.list 2> /dev/null
sudo touch /etc/apt/sources.list.d/docker.list
echo "deb https://apt.dockerproject.org/repo debian-jessie main" | sudo tee /etc/apt/sources.list.d/docker.list

# Update package information
sudo apt-get update

# Verify repository
sudo apt-cache policy docker-engine


## INSTALLATION ##
echo ""
echo "System is prepared for Docker installation"
echo "PRESS ANY KEY TO CONTINUE"
read

# Install it
sudo apt-get update
sudo apt-get install docker-engine


## VERIFICATION ##
echo ""
echo "Docker is installed and prepared for verification"
echo "PRESS ANY KEY TO CONTINUE"
read

# Start Docker service
sudo service docker start

# Try to run hello-world image
sudo docker run hello-world


## VERIFICATION ##
echo ""
echo "Everything seems to be OK, isn't it? If so, add current user to 'docker' group"
echo "PRESS ANY KEY TO CONTINUE"
read

# Create "docker" group (if not exists already)
sudo groupadd docker 2> /dev/null

# Add current user to "docker" group
sudo gpasswd -a ${USER} docker

# Restart Docker service
sudo service docker restart


## DOTFILE ##
# Download and activate scripts and aliases for Docker
cd ~
wget https://raw.githubusercontent.com/pavelsterba/dotfiles/master/.bash_profile_docker
source .bash_profile_docker


echo ""
echo "Docker is successfully installed. To apply group changes, logout and log back in"

