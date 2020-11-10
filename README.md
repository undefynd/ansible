# ansible
Repo to store all my ansible roles

Roles in this repo normally just install one service and configure them. So for example if we want to install gitea, we would create
a playbook, where we install mysql, gitea and then nginx/apache as reverse proxy. With this role Design we will have less duplicate lines of code. So if something needs installation, configuration and service interaction we will create a new role and combine them in a playbook when necessary. 

Requirement for dev enviornment:
  - VirtualBox
    - VirtualBox extension pack 
  - Vagrant
    - Vagrant Plugins 
      - landrush
      - vagrant-vbguest

To modify the vagrant hosts, just edit `vagrant/vagrant-hosts.yaml` file.

# DISCLAIMER
So far all ansible roles are just for ubuntu 20.04, maybe they are also working with earlier ubuntu versions.