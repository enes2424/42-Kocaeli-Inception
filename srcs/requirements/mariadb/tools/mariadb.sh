#!/bin/bash

if [ ! -d "/var/lib/mysql/mysql" ]; then

    mysql_install_db --user=mysql --datadir=/var/lib/mysql --rpm > /dev/null

    mysqld_safe --skip-networking &

    sleep 5

    mysql -uroot -p "$MYSQL_ROOT_PASSWORD" <<-EOSQL
        CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE CHARACTER SET utf8 COLLATE utf8_general_ci;
        GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
        FLUSH PRIVILEGES;
EOSQL

FLUSH PRIVILEGES;

    mysqladmin -uroot shutdown
fi

mysqld_safe


