FROM centos:centos8

RUN yum groupinstall -y 'Development Tools' && \
    yum install -y bash make rpmdevtools rpmlint && \
    yum clean all

RUN rpmdev-setuptree

