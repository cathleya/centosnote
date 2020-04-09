##centos服务器安全优化方案## 

 
- 1. 设置安全度比较高的密码

	[密码生成器](https://suijimimashengcheng.51240.com/)

> 	adduser  abc
> 	passwd abc
> 	vi  /etc/sudoers

- 2. 打开防火墙

> 	systemctl status firewalld
> 	systemctl start firewalld
> 	systemctl stop firewalld
> 	systemctl enable firewalld
> 	firewall-cmd --reload
> 	firewall-cmd --zone=public --list-ports

- 3. 开启需要访问的端口，eg:22,80,443,3306,6379

> 	firewall-cmd --list-ports
> 	firewall-cmd --zone=public --remove-port=22/tcp --permanent
> 	firewall-cmd --zone=public --add-port=100-500/tcp --permanent



- 4. 设置允许/不允许访问的IP

> 	firewall-cmd --zone=public --list-rich-rules
> 	firewall-cmd --permanent --add-rich-rule="rule family="ipv4" source address="192.168.0.200" port protocol="tcp" port="80" reject"
> 	firewall-cmd --permanent --add-rich-rule="rule family="ipv4" source address="192.168.0.200" port protocol="tcp" port="80" accept"


- 5. 设置防火墙FTP策略配置（选用/备用）

放行20、21端口还是不能连接FTP，因为在PASV模式下，建立数据传输会随机开放端口，这个端口显然是没有处于firewall的允许策略之下的，因为需要修改配置文件，指定端口范围。


> 	vi /etc/vsftpd/vsftpd.conf

在最后加入以下内容，端口尽量选择高范围，提高安全性

> 	pasv_enable=YES         #开启被动模式
> 	pasv_min_port=30000     #随机最小端口
> 	pasv_max_port=31000     #随机最大端口

然后对指定的IP开放指定的端口段

> 	firewall-cmd --permanent --add-rich-rule="rule family="ipv4" source address="192.168.142.166" port protocol="tcp" port="30000-31000" accept"

- 6. 将暴力暴力破解的IP拉入黑名单
- 7. 定时查杀挖矿木马
- 8. CentOS7 ab压力测试安装与解释

[压力测试](https://blog.csdn.net/u011415782/article/details/78501799)

