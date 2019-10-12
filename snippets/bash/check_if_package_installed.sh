#!/bin/bash
# check_if_package_installed.sh NAME

NAME=$1

check-install(){
  dpkg -s $NAME &> /dev/null
  if [ $? -ne 0 ]; then
    sudo apt-get update
    sudo apt-get install $NAME
  fi
}

check-install $NAME
