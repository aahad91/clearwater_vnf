FROM aahad91/cw-base
MAINTAINER aahad91

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes ralf
RUN sed -e 's/\(echo 0 > \/proc\/sys\/kernel\/yama\/ptrace_scope\)/# \0/g' -i /etc/init.d/ralf
RUN apt-get install -y --force-yes clearwater-snmp-handler-astaire

COPY ralf.supervisord.conf /etc/supervisor/conf.d/ralf.conf
COPY clearwater-group.supervisord.conf /etc/supervisor/conf.d/clearwater-group.conf
COPY memcached-user-plugins.py /usr/share/clearwater/clearwater-cluster-manager/plugins/
COPY memcached-utils.py /usr/share/clearwater/clearwater-cluster-manager/plugins/
COPY reload-memcached-users /usr/share/clearwater/bin/reload_memcached_users
#RUN chmod +x /usr/share/clearwater/bin/reload_memcached_users

# We need to start the socket factories so that we can write to SAS.
RUN cp /etc/clearwater/socket-factory.supervisord.conf /etc/supervisor/conf.d/

EXPOSE 10888
