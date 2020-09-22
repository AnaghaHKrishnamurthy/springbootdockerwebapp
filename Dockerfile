FROM maven as build
RUN mkdir -p /app
WORKDIR /app
ADD . /app
RUN mvn clean install
FROM openjdk:8
COPY --from=build /root/.m2/repository/com/example/SpringWebApplication/0.0.1-SNAPSHOT/SpringWebApplication-0.0.1-SNAPSHOT.jar /root/.m2/repository/com/example/SpringWebApplication/0.0.1-SNAPSHOT/SpringWebApplication-0.0.1-SNAPSHOT.jar
EXPOSE 5000
ENTRYPOINT ["java", "-jar", "/root/.m2/repository/com/example/SpringWebApplication/0.0.1-SNAPSHOT/SpringWebApplication-0.0.1-SNAPSHOT.jar"]