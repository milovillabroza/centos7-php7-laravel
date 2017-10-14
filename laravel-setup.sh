#!/bin/bash

timedatectl set-ntp true
timedatectl set-timezone Asia/Manila

yum -y update
yum -y install epel-release
yum -y updateyum clean all
rm -rf /var/cache/yum

yum -y install httpd mariadb-server mariadb mc nano
rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
yum -y update
yum clean all
rm -rf /var/cache/yum

yum -y install php70w php70w-mysql php70w-mcrypt php70w-dom php70w-mbstring

systemctl start httpd
systemctl enable httpd

systemctl start mariadb
systemctl enable mariadb

firewall-cmd --permanent --zone=public --add-service=http
firewall-cmd --permanent --zone=public --add-service=https
firewall-cmd --reload
