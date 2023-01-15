# Dockerfile

FROM adoptopenjdk/openjdk8:alpine

ARG version

RUN mkdir /opt/jmusicbot
RUN mkdir /config
COPY JMusicBot-$version.jar /opt/jmusicbot/jmusicbot.jar
WORKDIR /config
CMD ["java", "-Dnogui=true", "-jar", "/opt/jmusicbot/jmusicbot.jar"]

