#!/bin/bash
# Installing OGP Panel on ubuntu 20.04 server

apt update
apt upgrade -y
sudo apt-get install apache2 curl subversion php7.3 php7.3-gd php7.3-zip libapache2-mod-php7.3 php7.3-curl php7.3-mysql php7.3-xmlrpc php-pear phpmyadmin mariadb-server-10.3 php7.3-mbstring php-gettext git php-bcmath -y
sed -i "s/^bind-address.*/bind-address=0.0.0.0/g" "/etc/mysql/mariadb.conf.d/50-server.cnf"
sudo mysql_secure_installation
wget -N "https://github.com/OpenGamePanel/Easy-Installers/raw/master/Linux/Debian-Ubuntu/ogp-panel-latest.deb" -O "ogp-panel-latest.deb"
sudo dpkg -i "ogp-panel-latest.deb"
sudo cat /root/ogp_panel_mysql_info
sudo cat /root/ogp_user_password