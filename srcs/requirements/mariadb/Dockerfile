FROM debian:bookworm

RUN apt update && apt install -y mariadb-server

RUN mkdir -p /run/mysqld/ && chown -R mysql:mysql /run/mysqld/ && chmod 777 /run/mysqld/

COPY /tools/script.sh /script.sh

CMD [ "sh", "script.sh" ]
