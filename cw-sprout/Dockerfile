FROM aahad91/cw-base
MAINTAINER aahad91

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes sprout
RUN sed -e 's/\(echo 0 > \/proc\/sys\/kernel\/yama\/ptrace_scope\)/# \0/g' -i /etc/init.d/sprout
RUN apt-get install -y --force-yes clearwater-snmp-handler-astaire

COPY sprout.supervisord.conf /etc/supervisor/conf.d/sprout.conf
COPY clearwater-group.supervisord.conf /etc/supervisor/conf.d/clearwater-group.conf

# We need to start the socket factories so that we can write to SAS.
RUN cp /etc/clearwater/socket-factory.supervisord.conf /etc/supervisor/conf.d/

EXPOSE 5052 5054 5082
