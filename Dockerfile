FROM --platform=linux/amd64 openjdk:16-alpine3.13


WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:go-offline

COPY src ./src

RUN ./mvnw clean package
EXPOSE 8080
ENTRYPOINT [ "java", "-jar", "target/rest-service-complete-0.0.1-SNAPSHOT.jar" ]
