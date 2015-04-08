# Get files from GitHub and do a maven build
FROM ubuntu:14.04
MAINTAINER Uta Kapp "utakapp@gmail.com"
RUN apt-get -y update
RUN apt-get -y install openjdk-7-jdk
ENV REFRESHED_AT 2015-03-22
ENV MAVEN_OPTS "-Xms512m -Xmx4096m -XX:MaxPermSize=1024m"
ENV GIT_DISCOVERY_ACROSS_FILESYSTEM 1
RUN apt-get -y install wget
RUN apt-get -y install curl vim git maven 
RUN mkdir /home/emooti
RUN mkdir /home/emooti/helloemooti
WORKDIR /home/emooti/helloemooti
RUN git init
# pull from GitHub
# build hellloemooti
RUN git remote add helloemooti https://github.com/emooti/HelloEmooti.git
RUN git pull helloemooti HEAD
RUN mvn clean compile install
RUN mkdir /home/emooti/emootime
WORKDIR /home/emooti/emootime
VOLUME ["/home/emooti/emootime"]
RUN git init
RUN git remote add emootime https://github.com/emooti/EmootiMe.git
RUN git pull emootime HEAD
RUN mvn -version
# build war when executing container
ENTRYPOINT ["/usr/share/maven/bin/mvn" "clean" "package"]
CMD []


