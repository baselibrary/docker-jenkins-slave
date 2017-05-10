FROM baselibrary/java:8
MAINTAINER ShawnMa <qsma@thoughtworks.com>

## Version
ENV DOCKER_VERSION 1.12.6-0~ubuntu-xenial

## Repository
RUN \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 2C52609D &&\
  echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" > /etc/apt/sources.list.d/docker.list

## Packages
RUN \
  apt-get update &&\
  apt-get install -y docker-engine=$DOCKER_VERSION git cvs subversion mercurial make openssh-server &&\
  rm -rf /var/lib/apt/lists/*

## Configurations
RUN \
  mkdir -p /var/run/sshd &&\
  sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config &&\
  sed -i "s/UsePAM.*/UsePAM no/g"                                 /etc/ssh/sshd_config &&\
  sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g"              /etc/ssh/sshd_config

## Scripts
ADD docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod a+x            /docker-entrypoint.sh

EXPOSE 22

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/usr/sbin/sshd", "-D"]
