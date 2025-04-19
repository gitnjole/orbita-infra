COMPOSE_DIRS = \
	services/navidrome \
	services/wp

.PHONY: up down restart

up:
	@for dir in $(COMPOSE_DIRS); do \
		docker compose -f $$dir/docker-compose.yml up -d; \
	done

down:
	@for dir in $(COMPOSE_DIRS); do \
		docker compose -f $$dir/docker-compose.yml down; \
	done

restart: down up
