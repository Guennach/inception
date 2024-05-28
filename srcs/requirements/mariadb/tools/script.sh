#!/bin/sh

cat << EOF > /tmp/init_db.sql

FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
CREATE USER IF NOT EXISTS '${DB_USER_NAME}'@'%' IDENTIFIED BY '${DB_USER_PASSWORD}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER_NAME}'@'%';
FLUSH PRIVILEGES;


EOF

mariadbd --user=mysql --bootstrap < /tmp/init_db.sql

exec mariadbd --user=mysql --bind-address=0.0.0.0