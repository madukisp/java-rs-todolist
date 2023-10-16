# Use Ubuntu as the base image
FROM ubuntu:latest As build

RUN apt-get update

RUN apt-get install -y openjdk-17-jdk maven

COPY . .

RUN mvn clean install

EXPOSE 8080

COPY --from=build /target/todolist-1.0.0.jar app.jar
ENTRYPOINT [ "java", "-jar", "app.jar" ]
