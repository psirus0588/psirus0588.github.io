cat /etc/php/$(php -r "echo PHP_VERSION;" | grep --only-matching --perl-regexp "7.\d+")/fpm/pool.d/www.conf | grep 'listen ='
