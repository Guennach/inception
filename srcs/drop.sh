docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker image rm -f $(docker image ls -q)
docker volume rm -f $(docker volume ls -q)
sudo rm -rf wordpress_data mariadb_data
mkdir -p wordpress_data
mkdir -p mariadb_data
docker compose build 
# docker compose up -d
