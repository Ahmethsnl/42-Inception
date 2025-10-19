DC := docker-compose -f ./srcs/docker-compose.yml

all:
	@mkdir -p /home/ahmsanli/data/wordpress
	@mkdir -p /home/ahmsanli/data/mysql
	@$(DC) up -d --build

down:
	@$(DC) down

re: clean all

clean:
	@$(DC) down -v --remove-orphans
	@docker images -q | xargs -r docker rmi -f

.PHONY: all down re clean
