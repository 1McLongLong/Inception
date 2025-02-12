

RUN = docker compose up --build -d

DOWN = docker compose down

STOP = docker compose stop

CLEAN = docker compose down --rmi all

all:
	sudo mkdir -p /home/touahman/data/mariadb /home/touahman/data/wordpress
	cd srcs && $(RUN)

down:
	cd srcs && $(DOWN)

stop:
	cd srcs && $(STOP)

clean:
	cd srcs && $(CLEAN)


re: 
	make down 
	make all


