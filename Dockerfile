ARG ALPINE_VERSION
FROM alpine:${ALPINE_VERSION}

LABEL maintainer="sapvs"
ARG ALPINE_VERSION
ARG JRE_VERSION

RUN apk add --no-cache --update openjdk${JRE_VERSION}-jre
RUN groupadd -r java && useradd -g java java
RUN chown -R java:java /

CMD [ "java",  "-version" ]