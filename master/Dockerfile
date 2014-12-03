FROM ubuntu:14.04
MAINTAINER Adrien Lemaire <dori@alpacadb.com>


RUN apt-get update

RUN mkdir /repos
WORKDIR /repos

# Install golang
RUN apt-get install -y golang git curl

# Install kubernetes
RUN git clone https://github.com/GoogleCloudPlatform/kubernetes.git

# Install etcd
RUN curl -L https://github.com/coreos/etcd/releases/download/v0.4.6/etcd-v0.4.6-linux-amd64.tar.gz -o etcd-v0.4.6-linux-amd64.tar.gz
RUN tar xzvf etcd-v0.4.6-linux-amd64.tar.gz
RUN cp etcd-v0.4.6-linux-amd64/etcd /usr/bin

# Install docker
RUN curl -sSL https://get.docker.com/ubuntu/ | sudo sh

# Set environment variables
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/go/bin
ENV KUBERNETES_PROVIDER local
ENV KUBERNETES_MASTER http://localhost:8080

WORKDIR /repos/kubernetes
ENTRYPOINT ["hack/local-up-cluster.sh"]
