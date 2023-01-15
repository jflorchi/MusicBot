#
# Build Stage
#
FROM maven:3.3-jdk-8
RUN mkdir /build
COPY . /build
WORKDIR /build
RUN mvn clean package

#
# Package Stage
#
FROM adoptopenjdk/openjdk8:alpine
RUN mkdir /opt/jmusicbot
RUN mkdir /app
COPY --from=0 /build/target/JMusicBot-Snapshot-All.jar /opt/jmusicbot/jmusicbot.jar
WORKDIR /app
CMD ["java", "-Dnogui=true", "-jar", "/opt/jmusicbot/jmusicbot.jar"]

