FROM maven:3-jdk-8 as builder
RUN mkdir -p /app/source
COPY . /app/source
#COPY db-certs/client-key.pem ./client-key.pem

#RUN openssl pkcs8 -topk8 -inform PEM -outform DER -in ./client-key.pem -out ./client-key.pk8 -nocrypt
WORKDIR /app/source
RUN mvn clean package -Dmaven.test.skip=true


FROM openjdk:8-jre-alpine
COPY --from=builder /app/source/target/*.jar /app/app.jar
EXPOSE 8080
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom", "-jar", "/app/app.jar"]
