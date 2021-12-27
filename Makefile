ALPINE_VERSIONS=latest 3.14
JRE_VERSIONS=8 11

images:
	@for alpi in ${ALPINE_VERSIONS}; do\
		for jre in ${JRE_VERSIONS}; do\
			docker build \
			--build-arg ALPINE_VERSION=$$alpi \
			--build-arg JRE_VERSION=$$jre \
			-t sapvs/openjre-alpine:$$jre-$$alpi .;\
		done;\
	done

test: images
	@for alpi in ${ALPINE_VERSIONS}; do\
		for jre in ${JRE_VERSIONS}; do\
			docker run --rm sudosapan/openjre-alpine:$$jre-$$alpi;\
		done;\
	done

push: images
	for alpi in ${ALPINE_VERSIONS}; do\
		for jre in ${JRE_VERSIONS}; do\
			docker build --build-arg ALPINE_VERSION=$$alpi --build-arg JRE_VERSION=$$jre -t openjre-alpine:$$jre-$$alpi .;\
		done;\
	done
