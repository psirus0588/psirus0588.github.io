# Install needed packages:
pkg install -y wget proot
 htop git php, python

# Install composer
curl -L https://github.com/yuloh/composer-termux/releases/download/1.6.2/composer.phar -o composer.phar
chmod +x ./composer.phar
mv ./composer.phar /data/data/com.termux/files/usr/bin/composer

touch ../usr/etc/resolv.conf
echo 'nameserver 8.8.8.8' > ../usr/etc/resolv.conf
