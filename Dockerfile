
FROM maven:3.9.4-eclipse-temurin-21 AS build

WORKDIR /app

COPY pom.xml ./
COPY src ./src

RUN mvn clean install -DskipTests


FROM openjdk:21-jdk-slim

WORKDIR /app

COPY --from=build /app/target/foods-app-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar", "--debug"]

