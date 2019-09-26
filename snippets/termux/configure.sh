# Install needed packages:
pkg install -y wget htop git

touch ../usr/etc/resolv.conf
echo 'nameserver 8.8.8.8' > ../usr/etc/resolv.conf
