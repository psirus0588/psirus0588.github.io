#!/bin/bash
#copy_id_rsa_public_key_to_remote.sh HOST

HOST=$1
KEY=$(cat ~/.ssh/id_rsa.pub)

ssh $HOST "if [ -z \"\$(grep \"$KEY\" ~/.ssh/authorized_keys )\" ]; then
    echo $KEY >> ~/.ssh/authorized_keys; 
    echo key added. 
fi"
