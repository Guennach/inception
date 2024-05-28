compose_path=/home/gothmane/Desktop/inception-master/srcs/docker-compose.yml
images_var=$(shell sudo docker images -a -q)
container_var=$(shell sudo docker ps -a -q)

all:
	@mkdir -p /home/gothmane/data/wordpress
	@mkdir -p /home/gothmane/data/mariadb
	@docker compose -f $(compose_path) up -d --build

clean:
	@if ! [ -z "$(container_var)" ];then docker stop $(container_var) && docker rm $(container_var);fi

fclean: clean
		@if ! [ -z "$(images_var)" ];then docker image rm -f $(images_var);fi
		@sudo rm -rf /home/gothmane/data/*
		@docker buildx prune -f
		@docker system prune -f
		
re:	fclean all