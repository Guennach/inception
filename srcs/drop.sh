# docker stop $(docker ps -a -q) || true
# docker rm $(docker ps -a -q) || true
# docker image rm -f $(docker image ls -q) || true
# docker volume rm -f $(docker volume ls -q) || true
# sudo rm -rf wordpress_data mariadb_data
# mkdir -p wordpress_data
# mkdir -p mariadb_data
docker compose up --build
