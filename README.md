# paperinik/rpi-jenkins

![docker_logo](https://raw.githubusercontent.com/brunocantisano/rpi-jenkins/master/docker_139x115.png)![docker_fauria_logo](https://raw.githubusercontent.com/brunocantisano/rpi-jenkins/master/docker_paperinik_120x120.png)

This Docker container implements a vsftpd server, with the following features:

 * Raspbian base image.
 * jenkins 2.72

### Installation from [Docker registry hub](https://registry.hub.docker.com/u/paperinik/rpi-jenkins/).

You can download the image with the following command:

```bash
docker pull paperinik/rpi-jenkins
```
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
docker run -d -p 8080:8080 -v /media/usbraid/docker/jenkins:/data --name jenkins paperinik/rpi-jenkins
```

3) Start jenkins container:
```bash
./start.sh
```
