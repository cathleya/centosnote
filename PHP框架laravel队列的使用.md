# Laravel 队列的创建


修改 .evn里面的

QUEUE_CONNECTION=database

php  artisan queue :able

Php artisan migrate

创建任务

PHP artisan make：job sendmessage

启动队列

php artisan queue：work

