#!/bin/bash

# mv wp-config.php /var/www/html/
# until mysql -h mariadb -u gothmane -p gothmane -e 'exit'; do
#   echo 'Waiting for MariaDB...'
#   sleep 1
# done

mkdir -p /var/www/html/wordpress
chmod -R 755 /var/www/html/wordpress
chown -R www-data:www-data /var/www/html/wordpress

cd /var/www/html/wordpress

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

./wp-cli.phar core download --allow-root

echo "config file start"

./wp-cli.phar config create --dbname=wordpress --dbuser=gothmane --dbpass=gothmane --dbhost=mariadb:3306 --allow-root

echo "config file created"

./wp-cli.phar core install --url=localhost --title=inception --admin_user=root --admin_password=root --admin_email=root@root.com --allow-root

echo "install done"

# sed -i "s|listen = 127.0.0.1:9000|listen = 0.0.0.0:9000|g" /etc/php8.1/php-fpm.d/www.conf

# exec "$@"
# exec php-fpm7.4 -F