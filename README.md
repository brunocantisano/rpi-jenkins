# Jenkins

![docker_logo](https://raw.githubusercontent.com/brunocantisano/rpi-jenkins/master/files/docker.png)![docker_jenkins_logo](https://raw.githubusercontent.com/brunocantisano/rpi-jenkins/master/files/logo-jenkins.png)![docker_paperinik_logo](https://raw.githubusercontent.com/brunocantisano/rpi-jenkins/master/files/docker_paperinik_120x120.png)

This Docker container implements a Jenkins on Raspberry pi.
Only tested on Raspberry Pi 2

 * Raspbian base image: [resin/rpi-raspbian](https://hub.docker.com/r/resin/rpi-raspbian/)
 * jenkins 2.72
 
### Installation from [Docker registry hub](https://registry.hub.docker.com/u/paperinik/rpi-jenkins/).

You can download the image with the following command:

```bash
docker pull paperinik/rpi-jenkins
```

# How to use this image

Use cases

Exposed ports and volumes
----

The image exposes ports `8080`. Also, exports one volume: `/data`, which contains jenkins home directories.

Use cases
----

1) Create a temporary container for testing purposes:

```bash
  docker run --rm paperinik/rpi-jenkins
```

2) Create a container with a binded data directory:

```bash
docker run -d --name jenkins -p 9402:8080 -v /media/usbraid/docker/jenkins:/data paperinik/rpi-jenkins
```

3) Start jenkins container:
```bash
./run.sh
```