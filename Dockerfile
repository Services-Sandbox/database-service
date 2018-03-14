
FROM phusion/baseimage

RUN apt-get -qq update
RUN apt-get -qq install wget
RUN apt-get -qq install unzip

ENV DEBIAN_FRONTEND noninteractive


# installing apache web server
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
RUN apt-get -qq install apache2 -y


# installing mysql-server
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#RUN apt-get install -y mysql-server

RUN apt-get update \
    && apt-get install -y apt-utils \                                           
    && { \
        echo debconf debconf/frontend select Noninteractive; \
        echo mysql-community-server mysql-community-server/data-dir \
            select ''; \
        echo mysql-community-server mysql-community-server/root-pass \
            password 'pass123'; \
        echo mysql-community-server mysql-community-server/re-root-pass \
            password 'pass123'; \
        echo mysql-community-server mysql-community-server/remove-test-db \
            select true; \
    } | debconf-set-selections \
    && apt-get install -y mysql-server

RUN chown -R mysql:mysql /etc/mysql/
RUN chmod -R 755 /etc/mysql/

VOLUME /var/lib/mysql

# installing phpmyadmin on top of mysql-server
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#RUN apt-get -qq -y update && apt-get install -y phpmyadmin && apt-get install -y php-mbstring && apt-get install -y php-gettext

#ENV PHPMYADMIN_VERSION=4.7.7
#RUN wget -O /tmp/phpmyadmin.tar.gz https://files.phpmyadmin.net/phpMyAdmin/${PHPMYADMIN_VERSION}/phpMyAdmin-${PHPMYADMIN_VERSION}-all-languages.tar.gz
#RUN tar xfvz /tmp/phpmyadmin.tar.gz -C /var/www
#RUN ln -s /var/www/phpMyAdmin-${PHPMYADMIN_VERSION}-all-languages /var/www/phpmyadmin
#RUN mv /var/www/phpmyadmin/config.sample.inc.php /var/www/phpmyadmin/config.inc.php

#RUN echo 'localhost:80 localhost:80/phpmyadmin' >> /etc/hosts

RUN wget https://github.com/calvinlough/sqlbuddy/raw/gh-pages/sqlbuddy.zip
RUN unzip sqlbuddy.zip -d /var/www/html/
#RUN chown -R apache:apache /var/www/html/sqlbuddy/
RUN chmod -R 775 /var/www/html/sqlbuddy/


# configurations
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#ADD supporting_files/apache_default /etc/apache2/sites-available/000-default.conf

#RUN a2enmod rewrite
#RUN echo 'Include /etc/phpmyadmin/apache.conf' >> /etc/apache2/apache2.conf
#RUN ln -s /usr/share/phpmyadmin /var/www/html/


EXPOSE 80 3306


RUN service mysql restart

RUN service apache2 restart

CMD apachectl -D FOREGROUND