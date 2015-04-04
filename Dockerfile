# Get files from GitHub and do a maven build
FROM ubuntu:14.04
MAINTAINER Uta Kapp "utakapp@gmail.com"
RUN apt-get -y update
RUN apt-get -y install openjdk-7-jdk
ENV REFRESHED_AT 2015-03-22
ENV MAVEN_OPTS="-Xmx1024m -XX:MaxPermSize=128m"
RUN apt-get -y install wget
RUN apt-get -y install curl vim git maven 
# VOLUME ["/home/emooti/helloemooti"]
RUN mkdir /home/emooti
RUN mkdir /home/emooti/helloemooti
WORKDIR /home/emooti/helloemooti
RUN git init
# pull from GitHub
# build hellloemooti
# CMD ["cd" "/home/emooti/helloemooti"]
# CMD ["git" "init"]
# ENV GIT_DISCOVERY_ACROSS_FILESYSTEM 1
RUN git remote add helloemooti https://github.com/emooti/HelloEmooti.git
RUN git pull helloemooti HEAD
RUN mvn clean compile install
RUN git remote add emootime https://github.com/emooti/EmootiMe.git
RUN git pull emootime HEAD
RUN mvn clean package
# CMD ["git", "remote", "add", "helloemooti", "https://github.com/emooti/HelloEmooti.git"]
# CMD ["git" "pull" "helloemooti"]
# CMD ["mvn" "clean" "compile" "install"]
# build war
#VOLUME ["/home/emooti/emootime"]
#WORKDIR /home/emooti/emootime
#RUN cd /home/emooti/emootime
#RUN git init
#RUN git remote add emootime https://github.com/emooti/EmootiMe.git
#RUN git pull emootime
#RUN mvn clean package
