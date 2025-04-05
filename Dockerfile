# Stage 1: Build
FROM maven:3-openjdk-17 AS build
WORKDIR /demo
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run
FROM openjdk:17-jdk-slim
WORKDIR /demo
COPY --from=build /demo/target/demo-0.0.1-SNAPSHOT.jar drcomputer.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "drcomputer.jar"]
