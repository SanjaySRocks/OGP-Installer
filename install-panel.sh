#!/bin/bash
# Install Open Game Panel
# github.com/sanjaysrocks
# https://github.com/SanjaySRocks/OGP-Installer/blob/master/ogp-panel-install.sh

cyan() {
	echo -e "\\033[36;1m${@}\033[0m"
}

. /etc/os-release

echo "Your OS is $PRETTY_NAME"


# defs
update_system(){
    sudo apt -y update
    sudo apt -y upgrade
}

install_debian_ubuntu(){
	wget -N "https://github.com/OpenGamePanel/Easy-Installers/raw/master/Linux/Debian-Ubuntu/ogp-panel-latest.deb" -O "ogp-panel-latest.deb"
	sudo dpkg -i "ogp-panel-latest.deb"

	sudo cat /root/ogp_panel_mysql_info
	sudo cat /root/ogp_user_password
}

if [ "$ID" == "debian" ]; then

	apt install bc -y

	if [ $(echo "$VERSION_ID == 10 || $VERSION_ID == 9 || $VERSION_ID == 8" | bc -l) != 1 ]; then
		echo "Your Debian $VERSION_ID version not supported yet"
		exit
	fi

	if [ $(echo "$VERSION_ID == 10"|bc -l) == 1 ]; then

		echo "Debian 10 Detected Updating & Installing Panel..."
		sleep 5

		update_system
		sudo apt-get -y install apache2 curl subversion php7.3 php7.3-gd php7.3-zip libapache2-mod-php7.3 php7.3-curl php7.3-mysql php7.3-xmlrpc php-pear mariadb-server php7.3-mbstring php-gettext git php-bcmath
		sudo apt-get -y install phpmyadmin

	fi

	if [ $(echo "$VERSION_ID == 9"|bc -l) == 1 ]; then

		echo "Debian 9 Detected Updating & Installing Panel..."
		sleep 5

		update_system
		sudo apt-get -y install apache2 curl subversion php7.0 php7.0-gd php7.0-zip libapache2-mod-php7.0 php7.0-curl php7.0-mysql php7.0-xmlrpc php-pear phpmyadmin mysql-server php7.0-mbstring php-gettext git php-bcmath

	fi

	if [ $(echo "$VERSION_ID == 8"|bc -l) == 1 ]; then

		echo "Debian 8 Detected Updating & Installing Panel..."
		sleep 5

		update_system
		sudo apt-get -y install apache2 curl subversion php5 php5-gd php5-xmlrpc php5-curl php5-mysql php-pear phpmyadmin mysql-server libapache2-mod-php5 git

	fi

	if [ $(echo "$VERSION_ID == 7"|bc -l) == 1 ]; then

		sudo sed -i 's#<Directory /var/www.*#<Directory /var/www/html/>#g' /etc/apache2/sites-available/default
		sudo sed -i 's#DocumentRoot /var/www.*#DocumentRoot /var/www/html#g' /etc/apache2/sites-available/default
		sudo sed -i 's#<Directory /var/www.*#<Directory /var/www/html/>#g' /etc/apache2/sites-available/default-ssl
		sudo sed -i 's#DocumentRoot /var/www.*#DocumentRoot /var/www/html#g' /etc/apache2/sites-enabled/000-default
		sudo sed -i 's#<Directory /var/www.*#<Directory /var/www/html/>#g' /etc/apache2/sites-enabled/000-default
		sudo sed -i 's#DocumentRoot /var/www.*#DocumentRoot /var/www/html#g' /etc/apache2/sites-enabled/000-default
		sudo service apache2 restart

	fi

	sudo mysql_secure_installation

	install_debian_ubuntu

fi


if [ "$ID" == "ubuntu" ]; then

	apt install bc -y
	
	if [ $(echo "$VERSION_ID == 20.04 || $VERSION_ID == 18.04 || $VERSION_ID == 16.04" | bc -l) != 1 ]; then
		echo "Your Ubuntu $VERSION_ID version not supported yet"
		exit
	fi

	if [ $(echo "$VERSION_ID == 20.04"|bc -l) == 1 ]; then

		echo "Ubuntu 20.04 Detected Updating & Installing Panel..."
		sleep 5

		update_system
		sudo apt-get -y install apache2 curl subversion php7.4 php7.4-gd php7.4-zip libapache2-mod-php7.4 php7.4-curl php7.4-mysql php7.4-xmlrpc php-pear phpmyadmin mariadb-server-10.3 php7.4-mbstring git php-bcmath

	fi

	if [ $(echo "$VERSION_ID == 18.04"|bc -l) == 1 ]; then

		echo "Ubuntu 18.04 Detected Updating & Installing Panel..."
		sleep 5

		update_system
		sudo apt-get -y install apache2 curl subversion php7.2 php7.2-gd php7.2-zip libapache2-mod-php7.2 php7.2-curl php7.2-mysql php7.2-xmlrpc php-pear phpmyadmin mysql-server php7.2-mbstring php-gettext git php-bcmath

	fi

	if [ $(echo "$VERSION_ID == 16.04"|bc -l) == 1 ]; then

		echo "Ubuntu 16.04 Detected Updating & Installing Panel..."
		sleep 5

		update_system
		sudo apt-get -y install apache2 curl subversion php7.0 php7.0-gd php7.0-zip libapache2-mod-php7.0 php7.0-curl php7.0-mysql php7.0-xmlrpc php-pear phpmyadmin mysql-server php7.0-mbstring php-gettext git php-bcmath

	fi

	if [ $(echo "$VERSION_ID == 14.04"|bc -l) == 1 ]; then

		echo "Ubuntu 14.04 Detected Updating & Installing Panel..."
		sleep 5

		update_system
		sudo apt-get -y install apache2 curl subversion php5 php5-gd php5-xmlrpc php5-curl php5-mysql php-pear phpmyadmin mysql-server libapache2-mod-php5 git

	fi

	sed -i "s/^bind-address.*/bind-address=0.0.0.0/g" "/etc/mysql/mariadb.conf.d/50-server.cnf"

	sudo mysql_secure_installation

	install_debian_ubuntu
	
fi


if [ "$ID" == "centos" ]; then

	if [ $(echo "$VERSION_ID == 8 || $VERSION_ID == 7 || $VERSION_ID == 6" | bc -l) != 1 ]; then
		echo "Your CentOS $VERSION_ID version not supported yet"
		exit
	fi

	if [ $(echo "$VERSION_ID == 8"|bc -l) == 1 ]; then

		echo "CentOS 8 Detected Updating & Installing Panel..."
		sleep 5

		sudo yum -y update
		sudo dnf install epel-release
		sudo yum -y install epel-release wget subversion git
		sudo yum -y install mariadb-server
		sudo service mariadb restart
		sudo mysql_secure_installation
		sudo dnf config-manager --set-enabled powertools
		sudo yum -y install php-mysqlnd php-json php-zip php-bcmath

	fi

	if [ $(echo "$VERSION_ID == 7"|bc -l) == 1 ]; then

		echo "CentOS 7 Detected Updating & Installing Panel..."
		sleep 5
		
		sudo yum -y install epel-release wget subversion git
		sudo yum -y install mariadb-server
		sudo service mariadb restart
		sudo mysql_secure_installation
		sudo yum -y install php-mysql phpMyAdmin

	fi

	if [ $(echo "$VERSION_ID == 6"|bc -l) == 1 ]; then

		echo "CentOS 6 Detected Updating & Installing Panel..."
		sleep 5
		
		sudo yum -y install epel-release wget subversion git
		sudo yum -y install mysql-server
		sudo service mysqld restart
		sudo mysql_secure_installation
		sudo chkconfig mysqld on
		sudo yum -y install php-mysql phpMyAdmin

		sudo iptables -I INPUT 5 -i eth0 -p tcp -m tcp --dport 80 -j ACCEPT
		sudo iptables -I INPUT 5 -i eth0 -p tcp -m tcp --dport 443 -j ACCEPT
		sudo service iptables save
		sudo service iptables restart

	fi

	wget -N "https://github.com/OpenGamePanel/Easy-Installers/raw/master/Linux/CentOS/ogp_panel_rpm-1.0.0-1.noarch.rpm" -O "ogp_panel.rpm"
	sudo yum -y install "ogp_panel.rpm"

	sudo bash /var/www/html/create_db.sh
	
	sudo cat /root/ogp_panel_mysql_info

fi