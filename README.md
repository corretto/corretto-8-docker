# corretto-8-docker

[![Build Status](https://travis-ci.org/corretto/corretto-8-docker.svg?branch=master)](https://travis-ci.org/corretto/corretto-8-docker)

Master repository where Dockerfiles for [Corretto 8](https://aws.amazon.com/corretto/) are hosted.
For usage instructions, see the [AWS documentation site](https://docs.aws.amazon.com/corretto/latest/corretto-8-ug/docker-install.html).

## Building

```
docker build -t amazon-corretto-8 github.com/corretto/corretto-8-docker
```

## Testing

Tests are defined in `test-image.yaml` using [GoogleContainerTools/container-structure-test](
https://github.com/GoogleContainerTools/container-structure-test). To run tests, execute `./test-image.sh`. 

## Usage

A `JAVA_HOME` environment variable is configured to assist in tasks that require a known location of additional JRE/JDK files. For example installing a custom certificate into the default cacerts truststore.

```dockerfile
keytool -import -trustcacerts -alias myAlias -file myCert.cer -keystore $JAVA_HOME/jre/lib/security/cacerts -storepass changeit -noprompt
```
