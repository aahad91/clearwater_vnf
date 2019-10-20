FROM ubuntu:14.04
MAINTAINER aahad91

RUN apt-get update && apt-get install -y curl
RUN echo deb http://repo.cw-ngv.com/stable binary/ > /etc/apt/sources.list.d/clearwater.list
RUN curl -L http://repo.cw-ngv.com/repo_key | apt-key add -
COPY sysctl /sbin/sysctl
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes clearwater-sip-stress clearwater-sip-stress-coreonly

EXPOSE 5052 5054 3060 3060/udp

CMD ['/bin/bash']
