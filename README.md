[![Docker Build Status](https://img.shields.io/docker/build/zenika/alpine-appengine-java.svg)](https://hub.docker.com/r/zenika/alpine-appengine-java/) [![Docker Pulls](https://img.shields.io/docker/pulls/zenika/alpine-appengine-java.svg)](https://hub.docker.com/r/zenika/alpine-appengine-java/)

# alpine-appengine-java
AppEngine Java Docker Images built on Google CloudSDK Alpine Linux

### Usage

Start using your devserver: `docker run --rm -it -h localhost -v ~/.m2:/root/.m2 -v $(pwd):/usr/src/app -w /usr/src/app -p 8080:8080 zenika/alpine-appengine-java`

### Default command

```
mvn -Dapp.devserver.host="0.0.0.0" appengine:run
```

The parameter `app.devserver.host` to `0.0.0.0` allow us to ping our devserver from the container. It's an equivalent to `<host>0.0.0.0</host>` in the `configuration` section of our beloved `pom.xml`

### Deploy commands

Start a bash using `docker run --rm -it -h localhost -v ~/.m2:/root/.m2 -v $(pwd):/usr/src/app -v ~/.config/gcloud:/root/.config/gcloud -w /usr/src/app -p 8080:8080 zenika/alpine-appengine-java bash`

We mount `.config/gcloud` to save the credentials.

Then use the following command:
```
gcloud auth login
#copy paste the url in your browser and then paste the token in your bash
gcloud config set project imt-2017-11
gcloud config set app/promote_by_default false
mvn -Dapp.deploy.version=v0 appengine:deploy
```

After this first deployment, you can simply launch another deployment using:
`docker run --rm -it -h localhost -v ~/.m2:/root/.m2 -v $(pwd):/usr/src/app -v ~/.config/gcloud:/root/.config/gcloud -w /usr/src/app -p 8080:8080 zenika/alpine-appengine-java mvn -Dapp.deploy.version=v1 appengine:deploy`

### Deploy index

Use the following command `deployIndex`:
```
docker run --rm -it -h localhost -v ~/.m2:/root/.m2 -v $(pwd):/usr/src/app -v ~/.config/gcloud:/root/.config/gcloud -w /usr/src/app -p 8080:8080 zenika/alpine-appengine-java mvn -Dapp.deploy.version=v1 appengine:deployIndex
```

### Deploy queue

Use the following command `deployQueue`:
```
docker run --rm -it -h localhost -v ~/.m2:/root/.m2 -v $(pwd):/usr/src/app -v ~/.config/gcloud:/root/.config/gcloud -w /usr/src/app -p 8080:8080 zenika/alpine-appengine-java mvn -Dapp.deploy.version=v1 appengine:deployQueue
```

### Java version

```
docker run --rm zenika/alpine-appengine-java java -version
openjdk version "1.8.0_171"
OpenJDK Runtime Environment (IcedTea 3.8.0) (Alpine 8.171.11-r0)
OpenJDK 64-Bit Server VM (build 25.171-b11, mixed mode)
```

### Maven version

```
docker run --rm zenika/alpine-appengine-java mvn -v
Apache Maven 3.5.4 (1edded0938998edf8bf061f1ceb3cfdeccf443fe; 2018-06-17T18:33:14Z)
Maven home: /usr/lib/mvn
Java version: 1.8.0_111-internal, vendor: Oracle Corporation, runtime: /usr/lib/jvm/java-1.8-openjdk/jre
Default locale: en_US, platform encoding: UTF-8
OS name: "linux", version: "4.9.93-linuxkit-aufs", arch: "amd64", family:"unix"
```
