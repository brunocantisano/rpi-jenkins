.PHONY: all build push test 

DOCKER_IMAGE_NAME=paperinik/rpi-jenkins

all: build

build:
	docker build -t $(DOCKER_IMAGE_NAME):2.176 .

push:
	docker push $(DOCKER_IMAGE_NAME)

test:
	docker run --rm $(DOCKER_IMAGE_NAME) /bin/echo "Success."
