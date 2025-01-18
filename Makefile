

RUN = docker compose up --build

DOWN = docker compose down

CLEAN = docker compose down --rmi all

all:
	mkdir -p  /home/touahman/Desktop/data /home/touahman/Desktop/data/mariadb /home/touahman/Desktop/data/wordpress
	cd src && $(RUN)

down:
	cd src && $(DOWN)

clean:
	cd src && $(CLEAN)


re: 
	down all


