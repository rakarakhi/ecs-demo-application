build:
	docker build --tag ecsdemo .

run:
	docker run --detach --rm --publish 3000:3000 --name ecsdemo ecsdemo:latest

logs:
	docker logs --timestamps --follow ecsdemo

exec:
	docker exec -it ecsdemo bash

stop:
	docker stop ecsdemo || echo "stopped"

clean: stop
	docker image rm ecsdemo:latest || echo "clean"

all: clean build run

.PHONY: run build exec stop clean all
