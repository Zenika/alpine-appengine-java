FROM google/cloud-sdk:alpine

RUN apk add --update --no-cache openjdk8 bash nss

ARG MAVEN_VERSION=3.6.0
ARG USER_HOME_DIR="/root"
ARG SHA=6a1b346af36a1f1a491c1c1a141667c5de69b42e6611d3687df26868bc0f4637
ARG BASE_URL=https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz

RUN apk add --no-cache --virtual .deps curl tar && \
	mkdir -p /usr/share/maven /usr/share/maven/ref && \
	curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL} && \
	echo "${SHA}  /tmp/apache-maven.tar.gz" | sha256sum -c - && \
	tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 && \
	rm -f /tmp/apache-maven.tar.gz && \
	ln -s /usr/share/maven/bin/mvn /usr/bin/mvn && \
	apk del .deps

ENV MAVEN_HOME=/usr/share/maven MAVEN_CONFIG="$USER_HOME_DIR/.m2"

RUN gcloud components install app-engine-java && \
	rm -rf /google-cloud-sdk/.install/.backup
CMD mvn -Dapp.devserver.host="0.0.0.0" appengine:run
