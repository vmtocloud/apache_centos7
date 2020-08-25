#!/bin/sh
yum -y install httpd
systemctl enable httpd
firewall-cmd --permanent --add-service=http
firewall-cmd --permanent --add-service=https
firewall-cmd --reload
systemctl start httpd.service
