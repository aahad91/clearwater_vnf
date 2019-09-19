FROM ubuntu:trusty
MAINTAINER aahad91

RUN DEBIAN_FRONTEND=noninteractive \
apt-get install -y \
net-tools \
iproute2
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y supervisor curl
RUN apt-get install -y apt-transport-https unzip

RUN mkdir -p /val/log/supervisor
RUN echo 'root:root' | chpasswd

EXPOSE 22

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]

RUN locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8'
ENV LANGUAGE='en_US.UTF-8'
ENV LC_ALL='en_US.UTF-8'

COPY sysctl /sbin/sysctl

RUN sed -e 's/\#\(precedence ::ffff:0:0\/96  100\)/\1/g' -i /etc/gai.conf
RUN echo deb http://repo.cw-ngv.com/stable binary/ > /etc/apt/sources.list.d/clearwater.list
RUN curl -L http://repo.cw-ngv.com/repo_key | apt-key add -

WORKDIR /

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes clearwater-infrastructure clearwater-auto-config-docker clearwater-management
RUN apt-get install -y --force-yes clearwater-snmpd

RUN /etc/init.d/clearwater-auto-config-docker restart
RUN /etc/init.d/clearwater-infrastructure restart

COPY clearwater-infrastructure.supervisord.conf /etc/supervisor/conf.d/clearwater-infrastructure.conf
COPY clearwater-group.supervisord.conf /etc/supervisor/conf.d/clearwater-group.conf
COPY snmpd.supervisord.conf /etc/supervisor/conf.d/snmpd.conf
COPY pre-stop /usr/bin/pre-stop
COPY socket-factory.supervisord.conf /etc/clearwater/socket-factory.supervisord.conf
