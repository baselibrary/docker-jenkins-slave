## ThoughtWorks Docker Image: jenkins-slave

[![](http://dockeri.co/image/baselibrary/jenkins-slave)](https://registry.hub.docker.com/u/baselibrary/jenkins-slave/)

### Base Docker Image

* `latest`: jenkins-slave 1.9
* `1.625` : jenkins-slave 1.9

### Installation

    docker pull baselibrary/jenkins-slave

### Usage

    docker run -it --rm -e AUTHORIZED_KEYS="`cat ~/.ssh/id_rsa.pub`" baselibrary/jenkins-slave

    docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock baselibrary/jenkins-slave
