#!/bin/bash
# Installing OGP Panel on ubuntu 16.04 server

apt update
apt upgrade -y
sudo apt-get install apache2 curl subversion php7.0 php7.0-gd php7.0-zip libapache2-mod-php7.0 php7.0-curl php7.0-mysql php7.0-xmlrpc php-pear phpmyadmin mysql-server php7.0-mbstring php-gettext git php-bcmath -y
sed -i "s/^bind-address.*/bind-address=0.0.0.0/g" "/etc/mysql/mariadb.conf.d/50-server.cnf"
sudo mysql_secure_installation
wget -N "https://github.com/OpenGamePanel/Easy-Installers/raw/master/Linux/Debian-Ubuntu/ogp-panel-latest.deb" -O "ogp-panel-latest.deb"
sudo dpkg -i "ogp-panel-latest.deb"
sudo cat /root/ogp_panel_mysql_info
sudo cat /root/ogp_user_password