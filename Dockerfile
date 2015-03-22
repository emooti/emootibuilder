# Get files from GitHub and do a maven build
FROM ubuntu:14.04
MAINTAINER Uta Kapp "utakapp@gmail.com"
RUN apt-get -y update
ENV REFRESHED_AT 2015-03-22
RUN apt-get -y install wget
RUN apt-get -y install curl vim git maven 
# pull from GitHub
# mvn war
