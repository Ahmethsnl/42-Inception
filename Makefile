DC := docker-compose -f ./srcs/docker-compose.yml

all:
	@if not exist "C:\ahmsanli\data\wordpress" mkdir "C:\ahmsanli\data\wordpress"
	@if not exist "C:\ahmsanli\data\mysql" mkdir "C:\ahmsanli\data\mysql"
	@$(DC) up -d --build

down:
	@$(DC) down

re: clean all

clean:
	@$(DC) down -v --remove-orphans   
	@powershell -Command "docker images -q | ForEach-Object { docker rmi -f $_ }"

.PHONY: all down re clean