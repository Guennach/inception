#!/bin/sh


if [ -d "/var/lib/mysql/${DB_NAME}"]; then
    exit 0
fi

cat << EOF > /tmp/init_db.sql

use mysql;
FLUSH PRIVILEGES;
DELETE FROM mysql.user WHERE user='';
ALTER USER 'root'@'localhost' IDENTIFIED BY ${DB_ROOT_PASSWORD};
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
CREATE USER IF NOT EXISTS '${DB_USER_NAME}'@'%' IDENTIFIED BY '${DB_USER_PASSWORD}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER_NAME}'@'%';
FLUSH PRIVILEGES;

EOF

# Flush privileges to apply changes
# Delete empty users (if any)
# Alter the root user's password
# Create a database if it doesn't exist
# Create a user if it doesn't exist, with a specified password
# Grant all privileges on a specific database to a user
# Flush privileges again to apply the new privileges


    mariadb --user=mysql --bootstrap < /tmp/init_db.sql
    rm -f /tmp/init_db.sql

exec "$@"