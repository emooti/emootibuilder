# Get files from GitHub and do a maven build
FROM ubuntu:14.04
MAINTAINER Uta Kapp "utakapp@gmail.com"
RUN apt-get -y update
RUN apt-get -y install openjdk-7-jdk
ENV REFRESHED_AT 2015-03-22
ENV MAVEN_OPTS="-Xms512m -Xmx4096m -XX:MaxPermSize=1024m"
ENV GIT_DISCOVERY_ACROSS_FILESYSTEM 1
RUN apt-get -y install wget
RUN apt-get -y install curl vim git maven 
RUN mkdir /home/emooti
RUN cd /home/emooti
RUN git init
# pull from GitHub
# build emootibantransformer
RUN git remote add sprints https://github.com/emooti/sprints.git
RUN git pull sprints HEAD
RUN ls -a
RUN cd /home/emooti/Emootibantransformer
RUN mvn clean compile install
VOLUME ["/home/emooti/EmootiBan"]
WORKDIR /home/emooti/EmootiBan
RUN cd /home/emooti/EmootiBan
RUN mvn -version
# build war when executing container
ENTRYPOINT ["/usr/share/maven/bin/mvn" "clean" "package"]
CMD []


