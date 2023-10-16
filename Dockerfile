# Use Ubuntu as the base image
FROM ubuntu:latest

# Update the package list
RUN apt-get update

# Install OpenJDK 17 and Maven
RUN apt-get install -y openjdk-17-jdk maven

# Copy the source code into the container
COPY . .

# Build the project using Maven
RUN mvn clean install

# Expose port 8080
EXPOSE 8080

# Set the entry point for the container
ENTRYPOINT [ "java", "-jar", "/target/todolist-1.0.0.jar" ]
