FROM ubuntu:latest
MAINTAINER aahad91

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y supervisor curl
RUN apt-get install -y apt-transport-https unzip gnupg wget aptitude apt-utils vim software-properties-common

RUN mkdir -p /val/log/supervisor
RUN echo 'root:root' | chpasswd

EXPOSE 22

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]

RUN apt-get clean && apt-get -y update && apt-get install -y locales && locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8'
ENV LANGUAGE='en_US.UTF-8'
ENV LC_ALL='en_US.UTF-8'

COPY sysctl /sbin/sysctl

RUN sed -e 's/\#\(precedence ::ffff:0:0\/96  100\)/\1/g' -i /etc/gai.conf

#RUN echo deb http://repo.cw-ngv.com/stable binary/ > /etc/apt/sources.list.d/clearwater.list
RUN echo deb [trusted=yes] http://repo.cw-ngv.com/stable binary/ > /etc/apt/sources.list
#COPY sources.list /etc/apt/sources.list~
#RUN sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list
#RUN apt-get update
RUN curl -L http://repo.cw-ngv.com/repo_key | apt-key add -

#RUN apt-get update --fix-missing && dpkg --configure -a
#RUN apt-get -f install
#RUN dpkg --configure -a
#RUN apt-get -f install
#RUN rm /var/lib/apt/lists/lock
#RUN rm /var/cache/apt/archives/lock
#WORKDIR /var/lib/dpkg/info
#RUN rm *.postinst
#RUN add-apt-repository "http://repo.cw-ngv.com/stable"
WORKDIR /
# RUN apt-get -f install  /root/clearwater-diags-monitor_1.0-180328.114312_all.deb
RUN DEBIAN_FRONTEND=noninteractive apt-get install clearwater-infrastructure clearwater-auto-config-docker clearwater-management
#RUN aptitude install -y clearwater-snmpd

#RUN /etc/init.d/clearwater-auto-config-docker restart
#RUN /etc/init.d/clearwater-infrastructure restart

COPY clearwater-infrastructure.supervisord.conf /etc/supervisor/conf.d/clearwater-infrastructure.conf
COPY clearwater-group.supervisord.conf /etc/supervisor/conf.d/clearwater-group.conf
COPY snmpd.supervisord.conf /etc/supervisor/conf.d/snmpd.conf
COPY pre-stop /usr/bin/pre-stop
COPY socket-factory.supervisord.conf /etc/clearwater/socket-factory.supervisord.conf
