# 1. MySQL表的使用 #
  
	631  mysql -uroot -p123456
  	632  mysqldump -uroot -p123456 video_api videos >  video.sql
  	633  ls
  	634  zip video.zip video.sql 
  	635  ls
  	636  sz video.zip
	636  rz

# 2. MySQL表的使用 #

	mysql -u root -p
	
 	insert into mysql.user(Host,User,Password) values("localhost","test",password("1234"));
	
	GRANT ALL PRIVILEGES ON *video_api* TO web@"172.31.123.130" IDENTIFIED BY '123456' WITH GRANT OPTION;

	FLUSH PRIVILEGES;
	
	SELECT User, Host, Password FROM mysql.user;
	
# 3. MySQL表的使用 #

	