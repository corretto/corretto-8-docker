FROM amazonlinux:2
RUN amazon-linux-extras enable corretto8 \
 && yum -y install java-1.8.0-amazon-corretto-devel-1.8.0_202.b08-1.amzn2 \
 && yum clean all

 ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64
