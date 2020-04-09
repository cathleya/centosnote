# centos7安装Laravel5

Centos7.7 安装mysql

wget https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm

yum localinstall mysql80-community-release-el7-3.noarch.rpm



ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456';

ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '123456’;


Ningx  安装


rpm -ivh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm

systemctl enable nginx

systemctl start nginx



Php73 安装

yum install epel-release
rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

yum --enablerepo=remi install php73-php php73-php-pear php73-php-bcmath php73-php-pecl-jsond-devel php73-php-mysqlnd php73-php-gd php73-php-common php73-php-fpm php73-php-intl php73-php-cli php73-php php73-php-xml php73-php-opcache php73-php-pecl-apcu php73-php-pdo php73-php-gmp php73-php-process php73-php-pecl-imagick php73-php-devel php73-php-mbstring php73-php-zip php73-php-ldap php73-php-imap php73-php-pecl-mcrypt


systemctl restart php73-php-fpm
systemctl enable php73-php-fpm

ln -s /opt/remi/php73/root/usr/bin/php /usr/bin/php

vi /etc/opt/remi/php73/php-fpm.d/www.conf

PHP72 安装

yum install epel-release -y

rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

yum -y remove php*

yum -y install php72w php72w-cli php72w-fpm php72w-common php72w-devel php72w-embedded php72w-gd php72w-mbstring php72w-mysqlnd php72w-opcache php72w-pdo php72w-xml

systemctl enable php-fpm


安装es

yum list java*

yum install java-1.8.0-openjdk-devel.x86_64


vi /etc/profile

export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.171-8.b10.el6_9.x86_64
export CLASSPATH=.:$JAVA_HOME/jre/lib/rt.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export PATH=$PATH:$JAVA_HOME/bin

source /etc/profile

java -version

setenforce 0



开启selinux之后的安全策略更改

semanage fcontext -a -t httpd_sys_rw_content_t "/usr/share/nginx/html/laravel54/storage(/.*)?"
 semanage fcontext -a -t httpd_sys_rw_content_t "/usr/share/nginx/html/laravel54/bootstrap/cache(/.*)?"

restorecon -Rv "/usr/share/nginx/html/laravel54/storage"
restorecon -Rv "/usr/share/nginx/html/laravel54/bootstrap/cache"

setfacl -R -m u:nginx:rwX /usr/share/nginx/html/laravel54/storage/
setfacl -R -m u:nginx:rwX /usr/share/nginx/html/laravel54/bootstrap/cache/

chmod -R 777 /usr/share/nginx/html/laravel54/storage/

setsebool -P httpd_can_network_connect_db 1







