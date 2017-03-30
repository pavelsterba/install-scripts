#!/bin/sh

# Keep it up-to-date
apt-get update
apt-get upgrade

# Install useful stuff
apt-get install make, curl

# Create new user
echo -e "New user: \c"
read NEW_USERNAME
adduser $NEW_USERNAME

# Ask for visudo
echo ""
echo -e "Should this user be sudoer? [y/n] \c"
read NEW_USER_SUDOER
if [ $NEW_USER_SUDOER == "y" ]; then
    visudo
fi

# Ask for sshd_config edit
echo ""
echo -e "Do you want to edit sshd_config? [y/n] \c"
read EDIT_SSHD_CONFIG
if [ $EDIT_SSHD_CONFIG == "y" ]; then
    vim /etc/ssh/sshd_config
    service ssh restart
fi

# Exit
echo ""
echo "Server is initialized, now exit and login with new user account..."
echo "PRESS ANY KEY TO LOGOUT"
read
exit
