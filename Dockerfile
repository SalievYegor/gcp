FROM openjdk:8-jdk-alpine
COPY build/libs/gcp-0.0.1-SNAPSHOT.jar gcp-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/gcp-0.0.1-SNAPSHOT.jar"]