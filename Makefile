USER=angomes

MARIADB_VOLUME=/home/$(USER)/data/mariadb
WORDPRESS_VOLUME=/home/$(USER)/data/wordpress

all : setup up

setup:
	@echo "Init setup..."
	
	@if ! grep -q '$(USER)' /etc/hosts; then \
		echo "127.0.0.1 $(USER).42.fr" | sudo tee -a /etc/hosts > /dev/null; \
	 fi
	@if [ ! -d "$(MARIADB_VOLUME)" ]; then \
		sudo mkdir -p $(MARIADB_VOLUME); \
	 fi
	@if [ ! -d "$(WORDPRESS_VOLUME)" ]; then \
		sudo mkdir -p $(WORDPRESS_VOLUME); \
	 fi
	@echo "Finish setup..."

up : 
	@docker-compose -f ./srcs/docker-compose.yml up --build -d

down : 
	@docker-compose -f ./srcs/docker-compose.yml down

stop : 
	@docker-compose -f ./srcs/docker-compose.yml stop

start : 
	@docker-compose -f ./srcs/docker-compose.yml start

status : 
	@docker ps

clean :
	@docker-compose -f ./srcs/docker-compose.yml down --rmi all --volumes

fclean : clean
	docker system prune --force --all --volumes
	sudo rm -rf /home/$(USER)

re: fclean all

.PHONY: all up setup down status start clean fclean stop


