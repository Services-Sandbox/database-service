
FROM phusion/baseimage

# installing apache web server
RUN apt-get update
RUN apt-get install apache2 -y

# installing mysql-server
RUN apt-get install -y mysql-server

# installing phpmyadmin on top of mysql-server
RUN apt-get install phpmyadmin php-mbstring php-gettext -y

EXPOSE 80 3360

RUN service mysql restart
CMD ["service", "apache2", "restart", "-DFOREGROUND"]
