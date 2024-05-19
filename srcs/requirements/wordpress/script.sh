#!/bin/bash

# mv wp-config.php /var/www/html/
# until mysql -h mariadb -u gothmane -p gothmane -e 'exit'; do
#   echo 'Waiting for MariaDB...'
#   sleep 1
# done

mkdir -p /var/www/html/wordpress
chmod -R 777 /var/www/html/wordpress
chown -R www-data:www-data /var/www/html/wordpress
# chown -R www-data:www-data /var/www/html/wordpress/*

cd /var/www/html/wordpress

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

# if [ -f ""]
wp core download --allow-root

echo "config file start"

wp config create --dbname=wordpress --dbuser=gothmane --dbpass=gothmane --dbhost=mariadb:3306 --allow-root

echo "config file created"

wp core install --url=localhost --title=inception --admin_user=root --admin_password=root --admin_email=root@root.com --allow-root

echo "install done"

sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.2/fpm/pool.d/www.conf

exec php-fpm8.2 -F