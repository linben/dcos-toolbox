FROM openjdk:8-jdk-alpine
MAINTAINER blin23@gmail.com
ADD target/springboot-jsp-helloworld-1.0-SNAPSHOT.war helloworld.war
EXPOSE 8080
ENTRYPOINT [ "sh", "-c", "java -jar /helloworld.war" ]
