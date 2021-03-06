# SSH

    apt install -y openssh

#### Generate SSH key
    ssh-keygen -t rsa -b 4096 -C "$(whoami)@$(hostname)-$(date -I)"

without promt

    ssh-keygen -t rsa -b 4096 -N '' -f ~/.ssh/id_rsa <<< y

#### Copy public key

    ssh-copy-id -i ~/.ssh/id_rsa.pub user@host -p 22
    
alternative 

    cat ~/.ssh/id_rsa.pub | ssh user@host 'cat >> ~/.ssh/authorized_keys'


#### Execute commands on remote server

    ssh user@host "hostname && uptime && date"

alternative

    ssh user@host /bin/bash << EOF
      hostname
      uptime
      date
    EOF


#### execute commands on many servers
    for s in host1 host2 host3
    do
        ssh user@${s} uptime
        ssh user@${s} 'bash -s' < script.sh
    done
    
    
    
####

    strace -f -F -s1000 -t -T `ps aux | grep -E 'php-fpm' | awk '{print "-p" $2}' | xargs`
