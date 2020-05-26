#!/bin/bash
# Installing OGP Agent on all ubuntu versions server
# github.com/sanjaysrocks
# https://github.com/SanjaySRocks/OGP-Installer/blob/master/ogp-agent-install.sh

sudo apt update
sudo apt upgrade -y
sudo apt -y install libxml-parser-perl libpath-class-perl perl-modules screen rsync sudo e2fsprogs unzip subversion libarchive-extract-perl pure-ftpd libarchive-zip-perl libc6 libgcc1 git curl
sudo apt -y install libc6-i386
sudo apt -y install libgcc1:i386
sudo apt -y install lib32gcc1
sudo apt -y install libhttp-daemon-perl
wget -N "https://github.com/OpenGamePanel/Easy-Installers/raw/master/Linux/Debian-Ubuntu/ogp-agent-latest.deb" -O "ogp-agent-latest.deb"
sudo dpkg -i "ogp-agent-latest.deb"
sudo cat /root/ogp_user_password