# DOCKER-VERSION 1.0.1
FROM atkinschang/docker-base:ubuntu14-java8
MAINTAINER Atkins CHang "atkinschang@icloud.com"

RUN apt-get update && apt-get dist-upgrade -y && \
	apt-get install -y wget unzip net-tools 

RUN wget http://bit.ly/Hqv9aj -O /artifactory.zip && \
	unzip /artifactory.zip && \
	mv /artifactory-* /artifactory && \
	rm artifactory.zip

RUN mkdir -p /artifactory/data /artifactory/backup /etc/opt/jfrog/artifactory

ADD ./default /artifactory/
ADD ./start /artifactory/bin/

VOLUME /artifactory/data
VOLUME /artifactory/logs
VOLUME /artifactory/backup
VOLUME /etc/opt/jfrog/artifactory

WORKDIR /artifactory
CMD ["/artifactory/bin/start"]
