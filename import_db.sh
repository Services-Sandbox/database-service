#!/bin/bash
service mysql start
sleep 5
mysql -u root -e "CREATE DATABASE drupaldb;" 
#mysql -u root -p pass123 -h localhost drupaldb < /usr/db/db_drupal.sql
#mysqldump -h localhost -uroot -p drupaldb