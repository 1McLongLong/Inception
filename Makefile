

RUN = docker compose up --build

CLEAN = docker compose down --rmi all


all:
	cd src && $(RUN)

down:
	cd src && $(CLEAN)


re: 
	down all


