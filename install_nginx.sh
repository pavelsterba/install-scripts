#!/bin/sh

# Update package information
sudo apt-get update

# Install nginx
sudo apt-get install nginx

# Start nginx (it's most likely already running tho)
sudo service nginx start

# Start nginx with server start
sudo update-rc.d nginx defaults

# Get server IP
SERVER_IP_ADDRESS=`ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/'`

# Try to retrieve content to make sure nginx is up-and-running
wget -O - $SERVER_IP_ADDRESS

# Ask for private key login
echo ""
echo -e "Do you want to install Let's Encrypt client Certbot? [y/n] \c"
read INSTALL_CERTBOT
if [ $INSTALL_CERTBOT == "y" ]; then
    echo "deb http://ftp.debian.org/debian jessie-backports main" | sudo tee /etc/apt/sources.list.d/backports.list
    sudo apt-get update
    sudo apt-get install certbot -t jessie-backports
fi
