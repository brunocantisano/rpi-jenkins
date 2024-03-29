# Jenkins

![rpi-jenkins](https://img.shields.io/docker/pulls/paperinik/rpi-jenkins)

![docker_logo](https://raw.githubusercontent.com/brunocantisano/rpi-jenkins/master/files/docker.png)![docker_jenkins_logo](https://raw.githubusercontent.com/brunocantisano/rpi-jenkins/master/files/logo-jenkins.png)![docker_paperinik_logo](https://raw.githubusercontent.com/brunocantisano/rpi-jenkins/master/files/docker_paperinik_120x120.png)

This Docker container implements a Jenkins on Raspberry pi.
Only tested on Raspberry Pi 4

 * Raspbian base image: [balenalib/aio-3288c-openjdk:11-buster-build](https://hub.docker.com/layers/balenalib/aio-3288c-openjdk/11-buster-build/)
 * Jenkins 2.319.3
 
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

1) Create an image:

```bash
make build
```

2) Create a volume:

```bash
make volume
```

3) Start jenkins container:

```bash
make run
```

4) Change url to download plugins:

```bash
make plugins
```

5) Discover the admin password:

```bash
make key
```
