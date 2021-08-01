#!/bin/bash
# Installing OGP Agent on supported debian/ubuntu/centos server
# github.com/sanjaysrocks
# https://github.com/SanjaySRocks/OGP-Installer/blob/master/install-agent.sh

. /etc/os-release

echo "Your OS is $PRETTY_NAME"

# defs
update_system(){
    sudo apt -y update
    sudo apt -y upgrade
}

install_agent(){
    wget -N "https://github.com/OpenGamePanel/Easy-Installers/raw/master/Linux/Debian-Ubuntu/ogp-agent-latest.deb" -O "ogp-agent-latest.deb"
    sudo dpkg -i "ogp-agent-latest.deb"

    sudo cat /root/ogp_user_password
    rm -rf /root/ogp-agent-latest.deb
}

## Main

if [ "$ID" == "debian" ]; then

    echo "Debian OS Detected Updating & Installing..."
    sleep 5

    #Updating
    update_system

    # Installing required packages
    sudo apt -y install libxml-parser-perl libpath-class-perl perl-modules screen rsync sudo e2fsprogs unzip subversion pure-ftpd libarchive-zip-perl libc6 libgcc1 git curl
    sudo apt -y install libc6-i386 lib32gcc1
    sudo apt -y install libhttp-daemon-perl

    # Checks version if it needs extra packages
    if [[ "$VERSION_ID" == "10" || "$VERSION_ID" == "9" || "$VERSION_ID" == "8" ]]; then
        sudo apt-get install -y libarchive-extract-perl        
    fi

    # Downloading and installing agent
    install_agent
    
    echo "Installation Completed !"

fi


if [ "$ID" == "ubuntu" ]; then

    echo "Ubuntu OS Detected Updating & Installing..."
    sleep 5

    # Update 
    update_system

    # Installing required packages
    sudo apt-get -y install libxml-parser-perl libpath-class-perl perl-modules screen rsync sudo e2fsprogs unzip subversion libarchive-extract-perl pure-ftpd libarchive-zip-perl libc6 libgcc1 git curl
    sudo apt-get -y install libc6-i386
    sudo apt-get -y install libgcc1:i386
    sudo apt-get -y install lib32gcc1
    sudo apt-get -y install libhttp-daemon-perl

    # Downloading and installing agent
    install_agent
    
    echo "Installation Completed !"

fi



if [ "$ID" == "centos" ]; then

    if [ "$VERSION_ID" == "8" ]; then

        echo "CentOS 8 Detected Installing..."
        sleep 5

        sudo yum -y update
        sudo dnf install epel-release
        sudo yum -y install epel-release wget subversion git
        sudo dnf config-manager --set-enabled powertools
        sudo dnf --enablerepo=powertools -y install perl-HTTP-Daemon
        sudo yum install -y perl-HTTP-Daemon perl-LWP-Protocol-http10 proftpd proftpd-utils perl-ExtUtils-MakeMaker glibc.i686 glibc libgcc_s.so.1 perl-IO-Compress-Bzip2
        sudo dnf -y install perl-CPAN
        sudo cpan Archive::Extract
        sudo yum -y install screen perl-Path-Class perl-XML-Parser

    fi

    if [ "$VERSION_ID" == "7" ]; then

        echo "CentOS 7 Detected Installing..."
        sleep 5

        sudo yum -y update
        sudo yum -y install epel-release wget subversion git
        sudo yum install -y perl-HTTP-Daemon perl-LWP-Protocol-http10 proftpd proftpd-utils perl-ExtUtils-MakeMaker glibc.i686 glibc libgcc_s.so.1 perl-IO-Compress-Bzip2
        sudo yum install -y perl-Archive-Extract

    fi


    if [ "$VERSION_ID" == "6" ]; then

        echo "CentOS 6 Detected Installing..."
        sleep 5

        sudo yum -y update
        sudo yum -y install epel-release wget subversion git
        sudo yum install -y perl-libwww-perl proftpd proftpd-utils perl-ExtUtils-MakeMaker glibc.i686 glibc libgcc_s.so.1 perl-IO-Compress-Bzip2
        sudo yum install -y perl-Archive-Extract

        sudo sed -i "s/^LoadModule\( \)*mod_auth_file.c/#LoadModule mod_auth_file.c/g" "/etc/proftpd.conf"
        sudo service proftpd restart

    fi

    # Downloading and installing agent
    wget -N "https://github.com/OpenGamePanel/Easy-Installers/raw/master/Linux/CentOS/ogp_agent_rpm-1.0.0-1.noarch.rpm" -O "ogp_agent.rpm"
    sudo yum install -y "ogp_agent.rpm"
    sudo cat /root/ogp_enc_key
    sudo cat /root/ogp_user_sudo_pass
    rm -rf /root/ogp_agent.rpm

fi