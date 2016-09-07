#!/bin/sh

# Download and activate dotfiles from Github
cd ~
wget https://raw.githubusercontent.com/pavelsterba/dotfiles/master/.bash_profile
source .bash_profile

# Ask for private key login
echo ""
echo -e "Do you want to add private key? [y/n] \c"
read ADD_PRIVATE_KEY
if [ $ADD_PRIVATE_KEY == "y" ]; then
    cd ~
    mkdir .ssh
    chmod 700 .ssh
    touch .ssh/authorized_keys
    chmod 600 .ssh/authorized_keys
    vim .ssh/authorized_keys
fi

echo ""
echo "Everything is done"
