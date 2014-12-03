FROM fandekasp/kubernetes-docker
MAINTAINER Adrien Lemaire <dori@alpacadb.com>

RUN hack/build-go.sh

ENTRYPOINT ["./start.sh"]
VOLUME ["/cfg"]

ADD ./start.sh /repos/kubernetes/
CMD ["list", "/pods"]
