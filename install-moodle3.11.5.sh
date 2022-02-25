#!/bin/bash

## Update software
sudo yum update -y
sudo yum install wget git ghostscript -y

## Instalación de php7.4
sudo amazon-linux-extras install php7.4 -y
sudo yum install php-mbstring php-xml php-gd php-curl php-intl php-xmlrpc php-soap php-sodium php-opcache -y
sudo systemctl enable php-fpm
sudo service php-fpm start

## Instalación de nginx
sudo amazon-linux-extras install nginx1 -y
sudo systemctl enable nginx
sudo service nginx start

## Database Installation mysql80
sudo yum install https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm -y
sudo amazon-linux-extras install epel -y

rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-mysql
sudo rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022

sudo yum install mysql-community-server -y

sudo systemctl enable --now mysqld
sudo service mysqld start

### configuración de moodle
cd /var/
sudo mkdir www
cd www
sudo mkdir moodledata
cd moodledata
sudo mkdir lang

## Clonando los archivos de moodle version 3.11.5
sudo git clone -b MOODLE_311_STABLE git://git.moodle.org/moodle.git 