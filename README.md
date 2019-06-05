TP5Admin 
===================
作者 Ado,QQ:5552123(微信)
===================

TP5Admin V2.1使用ThinkPHP5.0.24完整版 框架开发.

最后更新：2019-06-04 主要修复一些访问方面BUG，

这是2017年使用thinkphp5练习写的一个后台系统，目前看来各方面都不是很满意。本系统不再更新，近期打算使用TP6重新写一个后台系统。

其主要目的是为了提高开发效率.需要开发什么功能.后台直接添加菜单.程序里直接写控制器!
> 首次使用导入数据库,后台账号admin,密码admin
 + 菜单管理
 + 管理员分组
 + 组分配权限
 + 一个管理员可以属于多个组
 + 操作日志管理
> 运行环境要求PHP5.4以上。


## 虚拟机配置,需要绑定到public目录中,这样比较安全.

Nginx虚拟机配置如下：

~~~
server {
        listen       80; 
        server_name  tp5admin.com;
        #注意这里是要绑到public目录中
        root   "/Users/mac/wwwroot/work/tp5admin.com/public";
        location / {
                index   index.php;
                autoindex  off;
                #laravel 配置
                #try_files $uri $uri/ /index.php?$query_string;
                #thinkphp配置
                try_files  $uri  /index.php$uri;
            }
        location ~ \.php(.*)$ {
                fastcgi_pass   $xmphpip;
                fastcgi_index  index.php;
                fastcgi_split_path_info  ^((?U).+\.php)(/?.+)$;
                fastcgi_param  PATH_INFO  $fastcgi_path_info;
                fastcgi_param  PATH_TRANSLATED  $document_root$fastcgi_path_info;
                fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
                include        fastcgi_params;
            }  
}
~~~


window环境 LAMP 配置
~~~


1   在 C:\Windows\System32\drivers\etc\hosts文件底部添加
      127.0.0.1 tp5admin.com


2  在httpd.conf 文件底部添加 tp5admin 网站配置

<virtualhost *:80>

    ServerName tp5admin.com

    DocumentRoot C:\xampp\htdocs\tp5admin

<virtualhost>

3 重启apache 即可 运行tp5admin.com/admin 即可
~~~


## 参与开发
注册并登录 Github 帐号， fork 本项目并进行改动。

更多细节参阅 https://github.com/duzhenxun/TP5Admin

https://gitee.com/duzhenxun/tp6admin

