#!/bin/bash

mkdir -p /var/www/html/wordpress
chmod -R 777 /var/www/html/wordpress
chown -R www-data:www-data /var/www/html/wordpress
# chown -R www-data:www-data /var/www/html/wordpress/*

cd /var/www/html/wordpress

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

echo "config file start"

if [ -f "/var/www/html/wordpress/wp-config.php" ]; then
    echo "[WordPress] :=> Already Exists !"
else
    echo "[WordPress] :=> Got Created !"
    wp config create --dbname=${DB_NAME} --dbuser=${DB_USER_NAME} --dbpass=${DB_USER_PASSWORD} --dbhost=mariadb:3306 --allow-root
fi

wp core install --url=${WEBSITE} --title=inception --admin_user=${ADMIN_USER} --admin_password=${ADMIN_PASS} --admin_email=${ADMIN_EMAIL} --allow-root

# Add a new normal user
wp user create ${USER_NAME} ${USER_EMAIL} --role=subscriber --user_pass=${USER_PASS} --allow-root

echo "install done"

sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.2/fpm/pool.d/www.conf

exec php-fpm8.2 -F