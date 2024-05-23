docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker image rm -f $(docker image ls -q)
docker volume rm -f $(docker volume ls -q)
docker buildx prune -f
docker system prune -f
sudo rm -rf /home/gothmane/data/*
mkdir -p /home/gothmane/data/wordpress
mkdir -p /home/gothmane/data/mariadb
# docker compose build 
docker compose up -d
