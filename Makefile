all: 
	mkdir -p /home/sdukic/data/mariadb
	mkdir -p /home/sdukic/data/wordpress
	if [ ! -f /etc/ssl/certs/nginx.crt ]; then \
		sudo openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=DE/ST=LOL/L=LOL/O=wordpress/CN=sdukic.42.fr"; \
	fi
	cd srcs && sudo docker-compose up

down:
	cd srcs && sudo docker-compose down

re:
	mkdir -p /home/sdukic/data/mariadb
	mkdir -p /home/sdukic/data/wordpress
	cd srcs && sudo docker-compose down && sudo docker-compose up --build

clean:
	cd srcs && sudo docker-compose down
	sudo rm -rf /home/sdukic/data/wordpress
	sudo rm -rf /home/sdukic/data/mariadb
	sudo mkdir -p /home/sdukic/data/wordpress
	sudo mkdir -p /home/sdukic/data/mariadb
	sudo docker system prune -a --volumes

.PHONY: all re down clean