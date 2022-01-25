# Use the official maven/Java 11 image to create a build artifact.
# https://hub.docker.com/_/maven
FROM gradle:6-jdk11-alpine AS build

# Set the working directory to /app
WORKDIR /app
# Copy the pom.xml file to download dependencies
COPY pom.xml ./
# Copy local code to the container image.
COPY src ./src

# Download dependencies and build a release artifact.
RUN gradle build
# Use OpenJDK for base image.
# https://hub.docker.com/_/openjdk
# https://docs.docker.com/develop/develop-images/multistage-build/#use-multi-stage-builds
FROM openjdk:11-jre-slim

# Copy the jar to the production image from the builder stage.
COPY --from=build-env /app/build/libs/gcp-0.0.1-SNAPSHOT.jar /gcp-0.0.1-SNAPSHOT.jar

# Run the web service on container startup.
CMD ["java", "-jar", "/gcp-0.0.1-SNAPSHOT.jar"]