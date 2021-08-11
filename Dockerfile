# Use the OpenJDK 11 image as the base image
FROM openjdk:16

# Create a new app directory for my application files
RUN mkdir /app

# Copy the app files from host machine to image filesystem
COPY . /app

# Set the directory for executing future commands
WORKDIR /app

# Run the Main class
CMD mvn clean package
EXPOSE 8080
ENTRYPOINT [ "java", "-jar", "target/rest-service-complete-0.0.1-SNAPSHOT.jar" ]
