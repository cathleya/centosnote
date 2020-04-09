# centos7安装Laravel5


MAC系统，删除文件不经过废纸篓的解决方法

解决：打开应用程序——实用工具——终端。键入命令：sudo rm -rf ~/.Trash如提示输入密码则照做。

清理缓存

php artisan config:clear

php artisan cache:clear

php artisan view:clear

php artisan route:cache

php artisan admin:make EmployeeController --model=App\\Employee


UPDATE posts SET user_id=9 WHERE id=184;



————————————————————————————

项目安装包

Bootstrap4 分页   ： https://learnku.com/docs/laravel/6.x/pagination/5172

php artisan vendor:publish --tag=laravel-pagination

增加剧中效果： justify-content-center

编辑.resources/views/vendor/bootstrap-4.blade.php 

<ul class="pagination justify-content-center">

然后保存

具体样式效果看：http://fy921.com/experience


————————————————————————————

laravel-admin  使用

https://github.com/z-song/laravel-admin

修改.env  的 APP_URL 保证头像正常显示

修改配置filesystems.php


chartjs 使用：https://github.com/laravel-admin-extensions/chartjs

composer require laravel-admin-ext/chartjs

php artisan vendor:publish --tag=laravel-admin-chartjs

Open config/admin.php, add configurations that belong to this extension at extensions section.

'extensions' => [

        'chartjs' => [
        
            // Set to `false` if you want to disable this extension
            'enable' => true,
        ]
    ]



————————————————————————————


sudo yum install git
git --version

git config --global user.name "Your Name"
git config --global user.email "youremail@yourdomain.com"
git config --list

配置 ~/.gitconfig



——————————————composer 使用——————————————

sudo dnf -y install wget
wget https://getcomposer.org/installer -O composer-installer.php
sudo php composer-installer.php --filename=composer --install-dir=/usr/local/bin
composer --version

