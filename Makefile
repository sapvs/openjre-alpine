# For local builds these versions are supplied here, else github actions takes care of this.
ALPINE_VERSIONS=latest 3.15 3.14
# for 8 minimal jre is 8-jre-base and is headless for 11 onwards
JRE_VERSIONS=8-jre-base 11-jre-headless 17-jre-headless

images:
	@for alpi in ${ALPINE_VERSIONS}; do\
		for jre in ${JRE_VERSIONS}; do\
			docker build \
			--build-arg ALPINE_VERSION=$$alpi \
			--build-arg JRE_VERSION=$$jre \
			-t sapvs/openjre-alpine:$$jre-$$alpi .;\
		done;\
	done

# TODOL Check java version, and other checks
test: images
	@for alpi in ${ALPINE_VERSIONS}; do\
		for jre in ${JRE_VERSIONS}; do\
			docker run --rm sudosapan/openjre-alpine:$$jre-$$alpi;\
		done;\
	done
