# Dockerfile for building NetXMS Console

FROM debian:buster
MAINTAINER Andrew Dukes <andymdukes@icloud.com>

ENV MAJOR=3
ENV MINOR=3
ENV RELEASE=314

ENV VERSION=${MAJOR}.${MINOR}.${RELEASE}

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
    apt-get update && apt-get -y install curl apt-transport-https openjdk-11-jre

RUN curl -L https://www.netxms.org/download/releases/${MAJOR}.${MINOR}/nxmc-${VERSION}-linux-gtk-x64.tar.gz -o - | tar xzv -C /


ENTRYPOINT [ "/nxmc/nxmc" ]
