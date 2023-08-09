COMPOSE_FILE=./srcs/docker-compose.yml

all: run

run: 
	@sudo mkdir -p /home/acerdan/data/wordpress
	@sudo mkdir -p /home/acerdan/data/database
	@docker-compose -f $(COMPOSE_FILE) up --build

up:
	@sudo mkdir -p /home/acerdan/data/wordpress
	@sudo mkdir -p /home/acerdan/data/mysql
	@docker-compose -f $(COMPOSE_FILE) up -d --build

clean: 	
	@docker-compose -f $(COMPOSE_FILE) down
	@-docker stop `docker ps -qa`
	@-docker rm -f `docker ps -qa`
	@-docker rmi -f `docker images -qa`
	@-docker volume rm -f `docker volume ls -q`
	@sudo rm -rf /home/acerdan/data/wordpress
	@sudo rm -rf /home/acerdan/data/database
	@docker system prune -a

.PHONY: all run up clean
