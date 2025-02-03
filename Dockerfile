FROM openjdk:8-jdk as build
RUN apt update -y && \
    apt install maven -y && \ 
    rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY . /app
RUN mvn clean package -Dmaven.test.skip=true

FROM openjdk:8-jre-slim
WORKDIR /app
COPY --from=build /app/target/spring-backend-v1.jar /app/spring-backend-v1.jar
EXPOSE 80
RUN useradd -m shyam && \
    chown -R shyam:shyam /app
USER shyam
CMD ["java", "-jar", "spring-backend-v1.jar"]
