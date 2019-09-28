## bash

Find and delete files created more then 30 days

    find /path/to/dir -mindepth 1 -mtime +30

Copy pub key to remote if not exist

    KEY=$(cat ~/.ssh/id_rsa.pub) ssh -p <port> <user>@<hostname> "if [ -z \"\$(grep \"$KEY\" ~/.ssh/authorized_keys )\" ]; then echo $KEY >> ~/.ssh/authorized_keys; echo key added.; fi;"


#### Links
[write iso linux to usb](write_iso_linux_to_usb.md)
