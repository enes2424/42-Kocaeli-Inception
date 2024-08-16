COMPOSE_FILE=./srcs/docker-compose.yml

all:
	@docker-compose -f $(COMPOSE_FILE) up -d

down:
	@docker-compose -f $(COMPOSE_FILE) down

reup: down all

re: clean all

clean: down
	@docker image rm nginx_image || true
