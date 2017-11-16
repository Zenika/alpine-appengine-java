# alpine-appengine-java
AppEngine Java Docker Images built on Google CloudSDK Alpine Linux

### Usage

Start using your devserver: `docker run -it -v ~/.m2:/root/.m2 -v $(pwd):/usr/src/app -w /usr/src/app -p 8080:8080 zenika/alpine-appengine-java`

### Default command

```
mvn -Dapp.devserver.host="0.0.0.0" appengine:run
```

The parameter `app.devserver.host` to `0.0.0.0` allow us to ping our devserver from the container. It's an equivalent to `<host>0.0.0.0</host>` in the `configuration` section of our beloved `pom.xml`

### Java version

```
docker run --rm zenika/alpine-appengine-java java -version
openjdk version "1.8.0_121"
OpenJDK Runtime Environment (IcedTea 3.3.0) (Alpine 8.121.13-r0)
OpenJDK 64-Bit Server VM (build 25.121-b13, mixed mode)
```

### Maven version

```
docker run --rm zenika/alpine-appengine-java mvn -v
Apache Maven 3.5.2 (138edd61fd100ec658bfa2d307c43b76940a5d7d; 2017-10-18T07:58:13Z)
Maven home: /usr/share/maven
Java version: 1.8.0_121, vendor: Oracle Corporation
Java home: /usr/lib/jvm/java-1.8-openjdk/jre
Default locale: en_US, platform encoding: UTF-8
OS name: "linux", version: "4.9.49-moby", arch: "amd64", family: "unix"
```
