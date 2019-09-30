#!/bin/bash
passwd
pkg -y install ssh
sshd
IP=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')
echo "For connect to device from desktop use command: ssh $USER@IP -p 8022
