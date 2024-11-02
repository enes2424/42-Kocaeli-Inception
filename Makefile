COMPOSE_FILE=srcs/docker-compose.yml

all:
	@ls srcs/requirements/tools/original_hosts || (cp /etc/hosts srcs/requirements/tools/original_hosts && cp srcs/requirements/tools/hosts /etc/hosts) || true
	@mkdir -p /home/eates/data/wordpress
	@docker-compose -f $(COMPOSE_FILE) up --build

down:
	@(ls srcs/requirements/tools/original_hosts && cp srcs/requirements/tools/original_hosts /etc/hosts && rm srcs/requirements/tools/original_hosts) || true
	@docker-compose -f $(COMPOSE_FILE) down --volumes

reup: down all

re: clean all

clean: down
	@rm -rf /home/eates/data/wordpress
	@rm -rf /var/lib/docker/volumes/*
	@docker system prune -af

