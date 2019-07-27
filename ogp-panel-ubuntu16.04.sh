#!/usr/bin/env bash

greenMessage() {
	echo -e "\\033[32;1m${@}\033[0m"
}

update(){
	greenMessage "** Updating.."
	apt update && apt upgrade -y
}

install_des(){
	greenMessage "** Installing Required Dependencies.."
	sudo apt-get install apache2 curl subversion php7.0 php7.0-gd php7.0-zip libapache2-mod-php7.0 php7.0-curl php7.0-mysql php7.0-xmlrpc php-pear phpmyadmin mysql-server php7.0-mbstring php-gettext git php-bcmath -y
}

mysql_setup(){
	greenMessage "** MySQL Setup.."
	sudo mysql_secure_installation
}

get_files(){
	greenMessage "Downloading Files & Extracting.."
	wget -N "https://github.com/OpenGamePanel/Easy-Installers/raw/master/Linux/Debian-Ubuntu/ogp-panel-latest.deb" -O "ogp-panel-latest.deb"
	sudo dpkg -i "ogp-panel-latest.deb"
}

get_info(){
	greenMessage "** Open Game Panel Info.."
	sudo cat /root/ogp_panel_mysql_info 
	sudo cat /root/ogp_user_password 
}

update
install_des
mysql_setup
get_files
get_info

greenMessage "** OGP Panel Installed!"