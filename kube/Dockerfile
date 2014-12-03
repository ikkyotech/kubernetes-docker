FROM fandekasp/kubernetes-docker
MAINTAINER Adrien Lemaire <dori@alpacadb.com>

RUN hack/build-go.sh

ENTRYPOINT ["cluster/kubecfg.sh"]
VOLUME ["/cfg"]
CMD ["list", "/pods"]
