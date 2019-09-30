# SSH

    apt install -y openssh

#### Generate SSH key
    ssh-keygen -t rsa -b 4096

#### Copy public key

    ssh-copy-id -i ~/.ssh/id_rsa.pub user@host -p 22
    
alternative 

    cat ~/.ssh/id_rsa.pub | ssh user@host 'cat >> ~/.ssh/authorized_keys'

#### Execute commands on remote server 
    ssh user@host /bin/bash << EOF
      pwd
    EOF
