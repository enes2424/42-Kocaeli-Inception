FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y \
    php7.4 \
    php7.4-fpm \
    php7.4-mysql \
    wget \
    tar \
    curl \
    mariadb-client && \
    apt-get clean

RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz && \
    mv wordpress /var/www/html

COPY www.conf /etc/php/7.4/fpm/pool.d/www.conf

WORKDIR /var/www/html

ENTRYPOINT ["/wordpress.sh"]

CMD ["/usr/sbin/php-fpm7.4", "--nodaemonize"]

