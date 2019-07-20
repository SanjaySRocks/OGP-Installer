#!/usr/bin/env bash

greenMessage() {
	echo -e "\\033[32;1m${@}\033[0m"
}

apt-get update && apt-get upgrade -y &&
sudo apt-get install apache2 curl subversion php7.2 php7.2-gd php7.2-zip libapache2-mod-php7.2 php7.2-curl php7.2-mysql php7.2-xmlrpc php-pear phpmyadmin mysql-server php7.2-mbstring php-gettext git php-bcmath -y
sudo mysql_secure_installation
wget -N "https://github.com/OpenGamePanel/Easy-Installers/raw/master/Linux/Debian-Ubuntu/ogp-panel-latest.deb" -O "ogp-panel-latest.deb"
sudo dpkg -i "ogp-panel-latest.deb"
sudo cat /root/ogp_panel_mysql_info 
sudo cat /root/ogp_user_password 

greenMessage "OGP Panel Installed"