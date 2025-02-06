

RUN = docker compose up --build -d

DOWN = docker compose down

CLEAN = docker compose down --rmi all

all:
	sudo mkdir -p /home/touahman/Desktop/data/mariadb /home/touahman/Desktop/data/wordpress
	cd srcs && $(RUN)

down:
	cd srcs && $(DOWN)

clean:
	cd srcs && $(CLEAN)


re: 
	down all


