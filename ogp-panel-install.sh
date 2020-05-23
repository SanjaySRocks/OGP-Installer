#!/bin/bash
# Install Open Game Panel
# github.com/sanjaysrocks
# https://github.com/SanjaySRocks/OGP-Installer/blob/master/ogp-panel-install.sh

echo "* Select Your OS"
echo "1) Ubuntu 20.04"
echo "2) Ubuntu 18.04"
echo "3) Ubuntu 16.04"
echo "4) Debian 10"
echo "5) Debian 9"
echo "6) Debian 8"
echo "7) Quit"

read -p "Where you want to install? (1/2/3/4/5/6) or 7 to Quit : " n

case $n in
  1) ubuntu_2004
	;;
  2) ubuntu_1804
	;;
  3) ubuntu_1604
	;;
  4) debian_10
	;;
  5) debian_9
	;;
  6) debian_8
	;;
  7) exit ;;
  *) echo "invalid option please enter 1/2/3/4 value only"; exit;
	;;
esac

ubuntu_2004()
{
	apt update
	apt upgrade -y
	sudo apt install -y apache2 curl subversion php7.3 php7.3-gd php7.3-zip libapache2-mod-php7.3 php7.3-curl php7.3-mysql php7.3-xmlrpc php-pear phpmyadmin mariadb-server-10.3 php7.3-mbstring php-gettext git php-bcmath
}

ubuntu_1804()
{
	apt update
	apt upgrade -y
	sudo apt install -y apache2 curl subversion php7.2 php7.2-gd php7.2-zip libapache2-mod-php7.2 php7.2-curl php7.2-mysql php7.2-xmlrpc php-pear phpmyadmin mysql-server php7.2-mbstring php-gettext git php-bcmath
}

ubuntu_1604()
{
	apt update
	apt upgrade -y
	sudo apt install -y apache2 curl subversion php7.0 php7.0-gd php7.0-zip libapache2-mod-php7.0 php7.0-curl php7.0-mysql php7.0-xmlrpc php-pear phpmyadmin mysql-server php7.0-mbstring php-gettext git php-bcmath
}

debian_10()
{
	apt update
	apt upgrade -y
	sudo apt install -y apache2 curl subversion php7.3 php7.3-gd php7.3-zip libapache2-mod-php7.3 php7.3-curl php7.3-mysql php7.3-xmlrpc php-pear mariadb-server php7.3-mbstring php-gettext git php-bcmath
	sudo apt install -y phpmyadmin
}

debian_9()
{
	apt update
	apt upgrade -y
	sudo apt install -y apache2 curl subversion php7.0 php7.0-gd php7.0-zip libapache2-mod-php7.0 php7.0-curl php7.0-mysql php7.0-xmlrpc php-pear phpmyadmin mysql-server php7.0-mbstring php-gettext git php-bcmath
}

debian_8()
{
	apt update
	apt upgrade -y
	sudo apt install -y apache2 curl subversion php5 php5-gd php5-xmlrpc php5-curl php5-mysql php-pear phpmyadmin mysql-server libapache2-mod-php5 git
}

sed -i "s/^bind-address.*/bind-address=0.0.0.0/g" "/etc/mysql/mariadb.conf.d/50-server.cnf"
sudo mysql_secure_installation
wget -N "https://github.com/OpenGamePanel/Easy-Installers/raw/master/Linux/Debian-Ubuntu/ogp-panel-latest.deb" -O "ogp-panel-latest.deb"
sudo dpkg -i "ogp-panel-latest.deb"
sudo cat /root/ogp_panel_mysql_info
sudo cat /root/ogp_user_password