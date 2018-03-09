
FROM phusion/baseimage

RUN apt-get update
RUN apt-get install wget
ENV DEBIAN_FRONTEND noninteractive

#ENV MYSQL_USER=root
ENV MYSQL_ROOT_PASSWORD=pass123
ENV PMA_USER=root
ENV PMA_PASSWORD=pass123

# installing apache web server
RUN apt-get install apache2 -y


# installing mysql-server
RUN apt-get install -y mysql-server


# installing phpmyadmin on top of mysql-server
#RUN apt-get install phpmyadmin php-mbstring php-gettext -y
ENV PHPMYADMIN_VERSION=4.7.7
RUN wget -O /tmp/phpmyadmin.tar.gz https://files.phpmyadmin.net/phpMyAdmin/${PHPMYADMIN_VERSION}/phpMyAdmin-${PHPMYADMIN_VERSION}-all-languages.tar.gz
RUN tar xfvz /tmp/phpmyadmin.tar.gz -C /var/www
RUN ln -s /var/www/phpMyAdmin-${PHPMYADMIN_VERSION}-all-languages /var/www/phpmyadmin
RUN mv /var/www/phpmyadmin/config.sample.inc.php /var/www/phpmyadmin/config.inc.php


# configurations
ADD supporting_files/apache_default /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite


EXPOSE 80 3306 8080


RUN service mysql start

CMD apachectl -D FOREGROUND
