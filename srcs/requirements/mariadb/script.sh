#!/bin/sh

echo "script in\n";

mariadb-install-db  --user=mysql --datadir=/var/lib/mysql

# if [ -d "/var/lib/mysql/wordpress"]; then
#     echo "Database already exists"
#     exec "$@"
#     exit 0
# fi

cat << EOF > /tmp/init_db.sql

FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS 'gothmane'@'%' IDENTIFIED BY 'gothmane';
GRANT ALL PRIVILEGES ON wordpress.* TO 'gothmane'@'%';
FLUSH PRIVILEGES;

EOF

# Flush privileges to apply changes
# Delete empty users (if any)
# Alter the root user's password
# Create a database if it doesn't exist
# Create a user if it doesn't exist, with a specified password
# Grant all privileges on a specific database to a user
# Flush privileges again to apply the new privileges


mariadbd --user=mysql --bootstrap < /tmp/init_db.sql

# exec "$@"
exec mariadbd --user=mysql --bind-address=0.0.0.0