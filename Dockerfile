
FROM maven:3-openjdk-17 AS build
WORKDIR /demo

COPY . .
RUN mvn clean package -DskipTests


# Run stage

FROM openjdk:17-jdk-slim
WORKDIR /demo

COPY --from=build /demo/demo-0.0.1-SNAPSHOT.jar drcomputer.jar
EXPOSE 8080

ENTRYPOINT ["java","-jar","drcomputer.war"]

