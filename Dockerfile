# Get files from GitHub and do a maven build
FROM ubuntu:14.04
MAINTAINER Uta Kapp "utakapp@gmail.com"
RUN apt-get -y update
ENV REFRESHED_AT 2015-03-22
RUN apt-get -y install wget
RUN apt-get -y install curl vim git maven 
RUN wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
RUN echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list
RUN apt-get -y install openjdk-7-jre-headless
RUN apt-get install jenkins
RUN apt-get -y clean
RUN rm -rf /var/cache/jenkins/war
RUN mkdir /var/cache/jenkins/war
RUN chown jenkins /var/cache/jenkins/war
ADD jenkins /usr/local/bin/jenkins
RUN chmod a+x /usr/local/bin/jenkins
CMD ["/usr/local/bin/jenkins"]
EXPOSE 8080
VOLUME ["/var/lib/jenkins", "/var/log/jenkins"]
