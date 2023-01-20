# Ansible Ubuntu 20.04 setup for apache + nginx reverse proxy base server

## Overview

### What this Script does
Only tested on ubuntu 20.04 with ansible installed, with encrypted vars included.   
This script will:
- setup new sudo and ssh enabled user
- install docker
- install PHP-FPM
- install Apache2 (listening on 8080)
- install Nginx (listening on 80 and 443)
- setup MySQL docker image
- install Composer
- setup VirtualHosts for Nginx and Apache2
- initial setup project (should change github repo url on setup_project.yml)
- setup Lets Encrypt SSL

### Specs
- MySQL 5.7
- PHP 8.0
- docker-compose v2.15.1
- any other else is latest


## How To Use

### Important Read
You should change few things before using this script:
1. ansible become username and check for usernames in each individual scripts combined
2. ansible vault passwords, encrypted vaults are provided in vars/vars.yml stored with password: password
3. also change the passwords that are stored in the vault
4. change mysql database user and password
5. change hosts in inventory (expected FQDN)
6. recheck in case something is forgotten

This script also expects you to have ssh key already installed on your server

### Example:
``` ansible-playbook --ask-vault-pass --ask-become-pass -u root -i ./inventory ```   
note: vars are included in script, so relative dir must be okay