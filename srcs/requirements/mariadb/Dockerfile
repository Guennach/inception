FROM alpine:3.18


RUN apk update && apk add mariadb mariadb-client

RUN mkdir -p /run/mysqld/ && chown -R mysql:mysql /run/mysqld/ && chmod 777 /run/mysqld/

RUN mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql && chmod 777 //var/lib/mysql 


COPY script.sh /script.sh

# Copy the 50-server.cnf file into the container

EXPOSE 3306


ENTRYPOINT [ "sh", "script.sh" ]

# CMD [ "mariadbd" , "--user=mysql", "--bind-address=0.0.0.0" ]
