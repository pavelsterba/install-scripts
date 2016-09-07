# Install scripts

Collection of scripts used when server with clean Debian installation is provided. **It's tested (and most likely work only) on Debian Jessie**, so if you have different distribution, some changes may be needed - feel free to fork this.

## Hierarchy
1. Clean Deabian Jessie installation
2. Login as *root*
3. ./**init.sh**
4. Login as new user
5. ./**init_user.sh**

Other scripts are optional, depending of server purpose.

## Scripts
### **init.sh**
update package index, create new user

### **init_user.sh**
download [dotfiles](https://github.com/pavelsterba/dotfiles), setup login using private key

### **install_docker.sh**
configure *apt*, install Docker, verify installation, add user to "docker" group, download [dotfiles for Docker](https://github.com/pavelsterba/dotfiles) 
