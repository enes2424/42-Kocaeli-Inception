FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y nginx openssl && \
    apt-get clean

COPY nginx.conf /etc/nginx/nginx.conf

# Create SSL certificates
RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -days 365 -nodes -subj "/CN=localhost"

CMD ["nginx", "-g", "daemon off;"]
