#!/bin/bash

# Web sunucusu ve PHP çalıştırma izinlerini ayarla
chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*
mkdir -p /run/php/
chown -R www-data:www-data /run/php
touch /run/php/php7.4-fpm.pid

# Eğer wp-config.php dosyası yoksa WordPress'i kur
if [ -f /var/www/html/wp-config.php ]; then

    rm -rf ./*

    # WordPress çekirdeğini indir
    wp core download --allow-root

    # WordPress yapılandırma dosyasını oluştur
    wp config create --allow-root \
        --dbname=${MYSQL_DATABASE} \
        --dbuser=${MYSQL_USER} \
        --dbpass=${MYSQL_PASSWORD} \
        --dbhost=${WORDPRESS_DB_HOST:-mariadb} \
        --skip-check

    # WordPress'i kur
    wp core install --allow-root \
        --url=${DOMAIN_NAME} \
        --title="eates" \
        --admin_user=${WORDPRESS_ADMIN_USER} \
        --admin_password=${WORDPRESS_ADMIN_PASSWORD} \
        --admin_email=${WORDPRESS_ADMIN_EMAIL}

    # WordPress kullanıcı hesabı oluştur
    wp user create --allow-root \
        ${WORDPRESS_USER} \
        ${WORDPRESS_EMAIL} \
        --user_pass=${WORDPRESS_EMAIL}
fi

exec $@
