Centos8 安装


———————————————————mysql安装——————————————————

dnf install @mysql

systemctl enable --now mysqld

systemctl status mysqld

mysql_secure_installation

vim /etc/my.cnf.d/mysql-default-authentication-plugin.cnf

default_authentication_plugin=caching_sha2_password

systemctl restart mysqld

————————————————————nginx安装——————————————————


yum install nginx

systemctl enable nginx

systemctl start nginx

systemctl status nginx

systemctl restart nginx


/etc/nginx


——————————————————————PHP安装——————————————————

dnf install dnf-utils http://rpms.remirepo.net/enterprise/remi-release-8.rpm

dnf module list php

sudo dnf module reset php

sudo dnf module enable php:remi-7.3

sudo dnf install php php-opcache php-gd php-curl php-mysqlnd

sudo systemctl enable --now php-fpm

vi /etc/php-fpm.d/www.conf

systemctl restart php-fpm

chown -R root:nginx /var/lib/php

——————————————————————防火墙启动——————————————————


sudo firewall-cmd --permanent --zone=public --add-service=http
sudo firewall-cmd --permanent --zone=public --add-service=https
sudo firewall-cmd --reload



——————————————————————java安装——————————————————


yum list java*

yum install java-1.8.0-openjdk-devel.x86_64


vi /etc/profile

export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.171-8.b10.el6_9.x86_64
export CLASSPATH=.:$JAVA_HOME/jre/lib/rt.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export PATH=$PATH:$JAVA_HOME/bin

source /etc/profile

java -version





