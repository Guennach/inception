FROM alpine:3.18

RUN apk update && apk add nginx openssl

COPY /conf/default.conf /etc/nginx/http.d/

#get the certificat key
RUN mkdir /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/gothmame.key \
    -out /etc/nginx/ssl/gothmame.crt  \
    -subj "/C=MA/L=Tetouan/O=42/OU=1337 MED/CN=gothmame.42.fr"

# EXPOSE 443
# "nginx": This is the main executable or binary to be executed. 
# It refers to the Nginx web server.
# "-g": This is an argument for Nginx, used to pass global configurations.
# "daemon off;": This is a configuration option for Nginx that tells it to run in the foreground
#  rather than as a background daemon. This is commonly used in Docker containers to ensure that
#  the container does not exit immediately after starting.
CMD ["nginx", "-g", "daemon off;"]
