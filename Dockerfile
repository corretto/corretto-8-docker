FROM amazonlinux:2

ARG rpm=java-1.8.0-amazon-corretto-devel-1.8.0_222.b10-1.x86_64.rpm
ARG path=https://d3pxv6yz143wms.cloudfront.net/8.222.10.1
ARG key=C554E802F4545B60919A0A87BD93DF06B540D62A
# In addition to installing the RPM, we also install
# fontconfig. The folks who manage the docker hub's
# official image library have found that font management
# is a common usecase, and painpoint, and have
# recommended that Java images include font support.
#
# See:
#  https://github.com/docker-library/official-images/blob/master/test/tests/java-uimanager-font/container.java


RUN curl -O $path/$rpm \
    && export GNUPGHOME="$(mktemp -d)" \
    && gpg --batch --keyserver ha.pool.sks-keyservers.net --recv-keys $key \
    && gpg --armor --export $key > corretto.asc \
    && rpm --import corretto.asc \
    && rpm -K $rpm \
    && rpm -i $rpm \
    && rm -r $GNUPGHOME corretto.asc $rpm \
    && yum install -y fontconfig \
    && yum clean all

ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-amazon-corretto
