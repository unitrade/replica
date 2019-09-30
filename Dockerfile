FROM percona:5.7-centos
USER root
COPY ./mysql-dump/root.cnf /root/.my.cnf
RUN chmod 400 /root/.my.cnf
