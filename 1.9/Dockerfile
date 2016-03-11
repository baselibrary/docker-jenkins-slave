FROM baselibrary/java:8
MAINTAINER ShawnMa <qsma@thoughtworks.com>

## Repository
RUN \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 2C52609D &&\
  echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list

## Packages
RUN \
  apt-get update &&\
  apt-get install -y docker-engine=1.9.1-0~trusty git cvs subversion mercurial openssh-server &&\
  useradd -c "Jenkins user" -d /home/jenkins -m jenkins -p jenkins &&\
  usermod -a -G root jenkins &&\
  mkdir -p /var/run/sshd &&\
  rm -rf /var/lib/apt/lists/*

## Environments
ENV HOME /home/jenkins

## Scripts
ADD docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod a+x            /docker-entrypoint.sh

EXPOSE 22

VOLUME ["/home/jenkins"]

CMD ["/usr/sbin/sshd", "-D"]


