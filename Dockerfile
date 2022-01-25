FROM openjdk:8-jdk-alpine
CMD .gradlew build
RUN echo 'KEKW'
COPY build/libs/gcp-0.0.1-SNAPSHOT.jar gcp-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/gcp-0.0.1-SNAPSHOT.jar"]