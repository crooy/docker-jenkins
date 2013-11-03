ROM ubuntu:precise
MAINTAINER Ronald Crooy

RUN apt-get install -y wget
RUN wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
RUN echo deb http://archive.ubuntu.com/ubuntu precise universe >> /etc/apt/sources.list
RUN echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list
RUN apt-get update
RUN sed 's/main$/main universe/' -i /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y python-software-properties
RUN add-apt-repository ppa:webupd8team/java -y

RUN apt-get update
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

RUN apt-get install -y oracle-java7-installer
RUN apt-get install git tar jenkins sudo curl -y
ADD install_scala.sh /tmp/install_scala.sh
RUN /bin/bash /tmp/install_scala.sh
RUN sudo -u jenkins ssh-keygen -q -t rsa -f /var/lib/jenkins/.ssh/id_rsa -N ""
RUN service jenkins stop

CMD sudo -u jenkins java -jar /usr/share/jenkins/jenkins.war
EXPOSE 8080
