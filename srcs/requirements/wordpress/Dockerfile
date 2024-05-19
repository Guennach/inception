FROM debian:bookworm
# RUN apt-get clean && apt-get update && apt-get install -y php-fpm \
#                                 php-mysqli \
#                                 php-phar \
#                                 php \
#                                 curl

# FROM debian:11

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y apt-utils

RUN apt-get update && apt-get install -y php-mysql 
RUN apt-get update && \
    apt-get install -y php8.2-cli \
    php8.2 \
    php8.2-fpm \
    php8.2-mysql \
    curl 
# RUN sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g" etc/php/8.2/fpm/pool.d/www.conf
# RUN sed -i "s|listen = /run/php/php8.2-fpm.sock | listen = 0.0.0.0:9000|g" etc/php/8.2/fpm/pool.d/www.conf
# RUN sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.2/fpm/pool.d/www.conf

COPY script.sh .

# # COPY wp-config.php /

RUN chmod +x script.sh

EXPOSE 9000

ENTRYPOINT [ "sh", "script.sh" ]

# CMD ["php-fpm8.2", "-F"]