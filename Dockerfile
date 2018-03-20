# Oracle Java 8 for Ubuntu 16.04
  
# MAINTAINER n2hsu <nitrohsu@outlook.com>

FROM ubuntu:xenial

RUN \
    echo "Add webupd8/java repository..."  && \
    echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list  && \
    echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list  && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886  && \
    apt-get update && \
    \
    echo "Install Oracle Java..."  && \
    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections  && \
    echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections  && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y oracle-java8-installer oracle-java8-set-default  && \
    \
    echo "Clean cache and package..."  && \
    rm -rf /var/cache/oracle-jdk8-installer  && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean


# default command
CMD ["java"]
