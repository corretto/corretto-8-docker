FROM amazonlinux:2
RUN amazon-linux-extras enable corretto8 \
 && yum -y install java-1.8.0-amazon-corretto-devel-1.8.0_192.b12-1.amzn2 \
 && yum clean all
