FROM openjdk:8-jdk-slim-stretch

LABEL maintainer="support@strapdata.com"
LABEL description="jmxsh utility with SSL/TLS support"

RUN apt-get update && apt-get install -y --no-install-recommends curl unzip && rm -rf /var/lib/apt/lists/* && \
    curl -jksSLH "Cookie: oraclelicense=accept-securebackup-cookie" -o /tmp/unlimited_jce_policy.zip "http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip" && \
    unzip -jo -d /etc/java-8-openjdk/security /tmp/unlimited_jce_policy.zip

COPY jmxsh /jmxsh
COPY jmxsh.jar /jmxsh.jar
ENTRYPOINT ["/jmxsh"]