
FROM phusion/baseimage

RUN apt-get -qq update
RUN apt-get -qq install wget

ENV DEBIAN_FRONTEND noninteractive

#ENV MYSQL_USER=root
#ENV MYSQL_ROOT_PASSWORD=pass123
#ENV PMA_USER=root
#ENV PMA_PASSWORD=pass123

# installing apache web server
RUN apt-get -qq install apache2 -y


# installing mysql-server
#RUN apt-get install -y mysql-server


RUN { \
		echo mysql-community-server mysql-community-server/data-dir select ''; \
		echo mysql-community-server mysql-community-server/root-pass password 'pass123'; \
		echo mysql-community-server mysql-community-server/re-root-pass password ''; \
		echo mysql-community-server mysql-community-server/remove-test-db select false; \
	} | debconf-set-selections \
	&& apt-get install -y mysql-server && rm -rf /var/lib/apt/lists/* \
	&& rm -rf /var/lib/mysql && mkdir -p /var/lib/mysql /var/run/mysqld \
	&& chown -R mysql:mysql /var/lib/mysql /var/run/mysqld \
# ensure that /var/run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime
	&& chmod 777 /var/run/mysqld




# installing phpmyadmin on top of mysql-server
RUN apt-get -qq -y update && apt-get install -y phpmyadmin && apt-get install -y php-mbstring && apt-get install -y php-gettext

#ENV PHPMYADMIN_VERSION=4.7.7
#RUN wget -O /tmp/phpmyadmin.tar.gz https://files.phpmyadmin.net/phpMyAdmin/${PHPMYADMIN_VERSION}/phpMyAdmin-${PHPMYADMIN_VERSION}-all-languages.tar.gz
#RUN tar xfvz /tmp/phpmyadmin.tar.gz -C /var/www
#RUN ln -s /var/www/phpMyAdmin-${PHPMYADMIN_VERSION}-all-languages /var/www/phpmyadmin
#RUN mv /var/www/phpmyadmin/config.sample.inc.php /var/www/phpmyadmin/config.inc.php

#RUN echo 'localhost:80 localhost:80/phpmyadmin' >> /etc/hosts

# configurations
#ADD supporting_files/apache_default /etc/apache2/sites-available/000-default.conf

RUN a2enmod rewrite
RUN echo 'Include /etc/phpmyadmin/apache.conf' >> /etc/apache2/apache2.conf
RUN ln -s /usr/share/phpmyadmin /var/www/html/


EXPOSE 80 3306


RUN service mysql start
RUN service apache2 restart

CMD apachectl -D FOREGROUND