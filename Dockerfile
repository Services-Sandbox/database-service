FROM mysql

# installing mysql-server
ENV MYSQL_ROOT_PASSWORD pass123 
ENV MYSQL_USER root
ENV MYSQL_DATABASE drupaldb

#RUN /etc/init.d/mysql start && mysql -u root -e "CREATE DATABASE drupaldb;" 


COPY ./db_drupal.sql /docker-entrypoint-initdb.d/


EXPOSE 3306
