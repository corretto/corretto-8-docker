FROM amazonlinux:2
RUN yum -y update \
 && amazon-linux-extras enable corretto8 \
 && yum -y install java-1.8.0-amazon-corretto-devel \
 && yum clean all

 ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64
