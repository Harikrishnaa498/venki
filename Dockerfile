FROM ubuntu:latest
RUN apt-get update -y

MAINTAINER hari

LABEL desc="This is docker \
persistent system"
WORKDIR /test
RUN apt install openjdk-8-jdk -y
RUN java -version
RUN apt-get update -y 
RUN apt-get install wget -y 
RUN wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.75/bin/apache-tomcat-8.5.75.tar.gz
RUN tar -xzf apache-tomcat-8.5.75.tar.gz
RUN mv apache-tomcat-8.5.75/ /opt/tomcat/
COPY /target/vprofile-v1.war /opt/tomcat/webapps
 

#ENTRYPOINT
 
EXPOSE 8080 

CMD ["/opt/tomcat/bin/catalina.sh","run"]

