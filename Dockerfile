#
# paperinik/rpi-jenkins Dockerfile
#
 
# Pull base image.
FROM resin/rpi-raspbian:latest

LABEL version latest
LABEL description Jenkins Container

ENV VERSION 2.72

RUN apt-get clean && apt-get update \
    && apt-get install -y wget oracle-java8-jdk \
    && wget https://updates.jenkins-ci.org/download/war/${VERSION}/jenkins.war \
    && mv jenkins.war /opt \
    && apt-get purge --auto-remove wget \
    && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME /usr/lib/jvm/jdk-8-oracle-arm32-vfp-hflt
ENV JENKINS_HOME /data
ENV PREFIX /

VOLUME /data

EXPOSE 8080

ADD run.sh /bin/

CMD /bin/run.sh
