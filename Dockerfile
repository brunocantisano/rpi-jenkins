#
# paperinik/rpi-jenkins Dockerfile
#
 
# Pull base image.
FROM balenalib/raspberrypi3-debian-openjdk:11

LABEL version latest
LABEL description Jenkins Container

ENV VERSION 2.248

RUN apt-get clean && apt-get update \
    && apt-get install -y wget \
    && wget https://updates.jenkins-ci.org/download/war/${VERSION}/jenkins.war \
    && mv jenkins.war /opt \
    && apt-get purge --auto-remove wget \
    && rm -rf /var/lib/apt/lists/*

ENV JENKINS_HOME /data
ENV PREFIX /

VOLUME /data

EXPOSE 8080

COPY files/exec.sh /bin/

RUN chmod 755 /bin/exec.sh

CMD /bin/exec.sh
