#!/bin/bash

curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/bin/composer
chmod +x /usr/bin/composer
yum -y install git

cd /var/www/html
git clone https://github.com/laravel/laravel.git
cd /var/www/html/laravel
composer install

chown -R apache:apache /var/www/html
chmod -R 755 /var/www/html

cd /var/www/html/laravel
mv .env.example .env
php artisan key:generate

systemctl restart httpd
