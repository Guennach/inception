FROM alpine:3.18

RUN apk update && apk add nginx openssl

COPY /conf/default.conf /etc/nginx/http.d/

RUN mkdir /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/gothmane.key \
    -out /etc/nginx/ssl/gothmane.crt  \
    -subj "/C=MA/L=Tetouan/O=42/OU=1337 MED/CN=gothmane.42.fr"

CMD ["nginx", "-g", "daemon off;"]
