# Get files from GitHub and do a maven build it
FROM ubuntu:14.04
MAINTAINER Uta Kapp "utakapp@gmail.com"
RUN apt-get -y update
RUN apt-get -y install openjdk-7-jdk
ENV REFRESHED_AT 2016-02-13
ENV MAVEN_OPTS="-Xms512m -Xmx4096m -XX:MaxPermSize=512m"
ENV GIT_DISCOVERY_ACROSS_FILESYSTEM 1
RUN apt-get -y install wget
RUN apt-get -y install curl vim git maven 
