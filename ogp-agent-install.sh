#!/bin/bash
# Installing OGP Agent on all ubuntu versions server

sudo apt update
sudo apt upgrade -y
sudo apt install libxml-parser-perl libpath-class-perl perl-modules screen rsync sudo e2fsprogs unzip subversion libarchive-extract-perl pure-ftpd libarchive-zip-perl libc6 libgcc1 git curl -y
sudo apt install libc6-i386 -y
sudo apt install libgcc1:i386 -y
sudo apt install lib32gcc1 -y
sudo apt install libhttp-daemon-perl -y
wget -N "https://github.com/OpenGamePanel/Easy-Installers/raw/master/Linux/Debian-Ubuntu/ogp-agent-latest.deb" -O "ogp-agent-latest.deb"
sudo dpkg -i "ogp-agent-latest.deb"
sudo cat /root/ogp_user_password