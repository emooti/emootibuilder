# Get files from GitHub and do a maven build
FROM ubuntu:14.04
MAINTAINER Uta Kapp "utakapp@gmail.com"
RUN apt-get -y update
RUN apt-get -y install openjdk-7-jdk
ENV REFRESHED_AT 2015-03-22
ENV MAVEN_OPTS="-Xmx1024m -XX:MaxPermSize=128m"
RUN apt-get -y install wget
RUN apt-get -y install curl vim git maven 
VOLUME ["/var/lib/tomcat7/webapps/"]
WORKDIR /var/lib/tomcat7/webapps/
# pull from GitHub
# mvn package
RUN rm -Rf /home/helloemooti
RUN mkdir /home/helloemooti
RUN git remote add emootime https://github.com/emooti/HelloEmooti.git
RUN rm -Rf /home/emootime
RUN mkdir /home/emootime
RUN cd /home/helloemooti
RUN git remote add emootime https://github.com/emooti/EmootiMe.git
RUN git init
RUN git pull helloemooti
RUN mvn clean compile install
RUN cd /home/emootime
RUN git init
RUN git pull emootime
RUN mvn clean package
