#
# paperinik/rpi-jenkins Dockerfile
#
 
# Pull base image.
FROM paperinik/rpi-java8:latest

LABEL version latest
LABEL description Jenkins Container

ENV VERSION 2.72

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

ADD files/exec.sh /bin/

CMD /bin/exec.sh
