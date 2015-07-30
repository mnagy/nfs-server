FROM centos:centos7

MAINTAINER Martin Nagy <nagy.martin@gmail.com>

ENV container=docker

RUN rpmkeys --import file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 && \
    yum -y --setopt=tsflags=nodocs install nfs-utils && \
    mkdir -p /exports && \
    yum clean all
COPY run-mountd.sh /

VOLUME ["/exports"]
EXPOSE 111/udp 2049/tcp

ENTRYPOINT ["/run-mountd.sh"]
