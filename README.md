# openjre-alpine
OpenJDK-JRE image on Alpine Linux. 

Since most OpenJDK images are large size and some are available with JRE alone.

## Naming 
Images are named as

     sapvs/openjre-alpine:<OpenJDK-JRE version>-<Alpine version>

e.g.

    sapvs/openjre-alpine:8-3.14

## Using this image

Images are hosted at DockerHub

    docker pull sapvs/openjre-alpine:11-3.14

## Create own image

 [Makefile](Makefile) provides task images to generate docker images for multiple Alpine and JRE version; To add a new update `ALPINE_VERSIONS` and `JRE_VERSIONS` variables in the same.

 To generate images 

      make images
