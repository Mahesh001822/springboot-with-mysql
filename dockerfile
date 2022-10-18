FROM maven:3.5.0-jdk-8-alpine AS builder

ADD ./pom.xml pom.xml
ADD ./src src/

RUN mvn clean -DskipTests=true package

From openjdk:8-jre-alpine

COPY --from=builder target/*.jar springboot.jar

EXPOSE 8080

CMD ["java", "-jar", "springboot.jar"]
