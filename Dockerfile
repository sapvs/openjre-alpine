ARG ALPINE_VERSION
FROM alpine:${ALPINE_VERSION}

ARG ALPINE_VERSION
ARG JRE_VERSION

# Labels
LABEL maintainer="Sapan Vashishth sudosapan@gmail.com" \
  repo="https://github.com/sapvs/openjre-alpine.git"

# Add openjdk-jre
RUN apk add --no-cache --update openjdk${JRE_VERSION}

# Add user java for this image
RUN addgroup -S java && adduser -S java -G java -h /java

CMD [ "java",  "-version" ]
