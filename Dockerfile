FROM amazonlinux:2
RUN yes | yum update \
 && yes | yum install wget \
 && wget https://d3pxv6yz143wms.cloudfront.net/java-1.8.0-amazon-corretto-1.8.0_192.b12-1.amzn2.x86_64.rpm \
 && wget https://d3pxv6yz143wms.cloudfront.net/java-1.8.0-amazon-corretto-devel-1.8.0_192.b12-1.amzn2.x86_64.rpm \
 && yes | yum remove wget \
 && rpm -K java-1.8.0-amazon-corretto-1.8.0_192.b12-1.amzn2.x86_64.rpm \
 && rpm -K java-1.8.0-amazon-corretto-devel-1.8.0_192.b12-1.amzn2.x86_64.rpm \
 && yes | yum localinstall *.rpm \
 && rm java-1.8.0-amazon-corretto-1.8.0_192.b12-1.amzn2.x86_64.rpm \
       java-1.8.0-amazon-corretto-devel-1.8.0_192.b12-1.amzn2.x86_64.rpm
CMD ["/bin/bash"]
