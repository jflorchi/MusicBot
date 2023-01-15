# Dockerfile

FROM adoptopenjdk/openjdk8:alpine

RUN export VERS=$(cat .version)

RUN mkdir /opt/jmusicbot
RUN mkdir /config
COPY JMusicBot-${VERS}.jar /opt/jmusicbot/jmusicbot.jar
WORKDIR /config
CMD ["java", "-Dnogui=true", "-jar", "/opt/jmusicbot/jmusicbot.jar"]

