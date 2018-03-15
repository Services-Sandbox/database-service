FROM mysql

# installing mysql-server
ENV MYSQL_ROOT_PASSWORD pass123
ENV MYSQL_USER root

RUN /etc/init.d/mysql start


EXPOSE 3306
