.PHONY: default build remove rebuild save load tag push publish pull run stop copy key plugins

DOCKER_IMAGE_VERSION=2.248
IMAGE_NAME=rpi-jenkins
CONTAINER_PORT=9402
OWNER=paperinik
PORT=9413
NEXUS_REPO=$(OWNER):$(PORT)
TAG=$(IMAGE_NAME):$(DOCKER_IMAGE_VERSION)
DOCKER_IMAGE_NAME=$(OWNER)/$(IMAGE_NAME)
DOCKER_IMAGE_TAGNAME=$(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_VERSION)
FILE_TAR = ./$(IMAGE_NAME).tar
FILE_GZ = $(FILE_TAR).gz

UNAME_S        := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
    APP_HOST   := localhost
endif
ifeq ($(UNAME_S),Darwin)
    APP_HOST   := $(shell docker-machine ip default)
endif

default:
	build

build:
	docker build -t $(DOCKER_IMAGE_TAGNAME) .

remove:
	docker rmi -f $(DOCKER_IMAGE_TAGNAME)

rebuild: remove build

save:
	docker image save $(DOCKER_IMAGE_TAGNAME) > $(FILE_TAR)
	@[ -f $(FILE_TAR) ] && gzip $(FILE_TAR) || true

load:
	@[ -f $(FILE_GZ) ] && gunzip $(FILE_GZ) || true
	@[ -f $(FILE_TAR) ] && docker load -i $(FILE_TAR) && gzip $(FILE_TAR) || true

tag:
	docker tag $(DOCKER_IMAGE_TAGNAME) $(NEXUS_REPO)/$(TAG)

push:
	docker push $(NEXUS_REPO)/$(TAG)

publish: tag push

pull:
	docker pull $(NEXUS_REPO)/$(TAG)

run:
	docker run -d  --name ${IMAGE_NAME} -p ${CONTAINER_PORT}:8080 -v ~/jenkins/data:/data ${NEXUS_REPO}/${TAG}
stop:
	docker stop ${IMAGE_NAME} && docker rm ${IMAGE_NAME}

copy:
	docker cp ${IMAGE_NAME}:/data ~/jenkins
	sudo chown -R nobody:nogroup ~/jenkins

key:
	docker exec -i rpi-jenkins cat /data/secrets/initialAdminPassword

plugins:
	docker exec -it echo "<?xml version='1.1' encoding='UTF-8'?><sites><site><id>default</id><url>http://updates.jenkins.io/update-center.json</url></site></sites>" > hudson.model.UpdateCenter.xml
