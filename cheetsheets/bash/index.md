# bash

### Find and delete files created more then 30 days

    find /path/to/dir -mindepth 1 -mtime +30

### Copy pub key to remote if not exist

    KEY=$(cat ~/.ssh/id_rsa.pub) ssh -p <port> <user>@<hostname> "if [ -z \"\$(grep \"$KEY\" ~/.ssh/authorized_keys )\" ]; then echo $KEY >> ~/.ssh/authorized_keys; echo key added.; fi;"

###Bash script for generate SSH RSA keys

<script src="https://gist.github.com/xordiv/9f2b24a7861039f9380623d3bf52bb3a.js"></script>

#### Links
[write iso linux to usb](write_iso_linux_to_usb.md)
