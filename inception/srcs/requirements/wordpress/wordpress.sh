#!/bin/bash
chown -R www-data: /var/www/*;
chmod -R 755 /var/www/*;
mkdir	-p /run/php/;
chown -R www-data:www-data /run/php
touch /run/php/php7.4-fpm.pid;

exec "$@"
