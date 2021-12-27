ARG ALPINE_VERSION
FROM alpine:${ALPINE_VERSION}

ARG ALPINE_VERSION
ARG JRE_VERSION

LABEL maintainer="sapvs"
LABEL repo="https://github.com/sapvs/openjre-alpine.git"

# Add openjdk-jre and bash
RUN apk add --no-cache --update openjdk${JRE_VERSION}-jre bash

# Add user java for this image
RUN addgroup -S java && adduser -S java -G java
USER java

CMD [ "java",  "-version" ]
