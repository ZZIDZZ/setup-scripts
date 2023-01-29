# Usage
``` ansible-playbook --ask-vault-pass --ask-become-pass -u root -i ./inventory ./setup_all.yml ``` 


## Change password

vault password: password

``` ansible-vault rekey vars/vars.yaml``` 