FROM percona:5.7-centos
COPY ./mysql-dump/Test_Database.sql /docker-entrypoint-initdb.d/Test_Database.sql
USER root
COPY ./mysql-dump/root.cnf /root/.my.cnf
RUN chmod 400 /root/.my.cnf
