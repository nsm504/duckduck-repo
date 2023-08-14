FROM openjdk:8-jdk-alpine
#VOLUME /tmp
ARG JAVA_OPTS
ENV JAVA_OPTS=$JAVA_OPTS
COPY docker.jar docker.jar
EXPOSE 8000
ENTRYPOINT exec java $JAVA_OPTS -jar docker.jar
RUN javac sample.java
CMD ["java","sample"]
# For Spring-Boot project, use the entrypoint below to reduce Tomcat startup time.
#ENTRYPOINT exec java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar docker.jar
