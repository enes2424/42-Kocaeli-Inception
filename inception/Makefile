COMPOSE_FILE=./srcs/docker-compose.yml

all:
	@ls srcs/requirements/tools/original_hosts || (cp /etc/hosts srcs/requirements/tools/original_hosts && cp srcs/requirements/tools/hosts /etc/hosts)
	@mkdir -p /home/eates/data/wordpress
	@docker-compose -f $(COMPOSE_FILE) up

down:
	@docker-compose -f $(COMPOSE_FILE) down

reup: down all

re: clean all

clean: down
	@(ls srcs/requirements/tools/original_hosts && cp srcs/requirements/tools/original_hosts /etc/hosts && rm srcs/requirements/tools/original_hosts) || true
	@rm -rf /home/eates/data/wordpress
	@docker system prune -af
