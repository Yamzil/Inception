DOCKER_COMPOSE_FILE := ./srcs/docker-compose.yml

all: build up

build:
	docker-compose -f $(DOCKER_COMPOSE_FILE) build
up:
	docker-compose -f $(DOCKER_COMPOSE_FILE) up

logs:
	docker-compose -f $(DOCKER_COMPOSE_FILE) logs

down:
	-rm -rf /home/yamzil/Data/db-data/*
	-rm -rf /home/yamzil/Data/www-vol/*
	-docker-compose -f $(DOCKER_COMPOSE_FILE) down -v
prune:
	docker system prune -f