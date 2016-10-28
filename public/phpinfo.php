<?php

/**
 *  
 * @file   phpinfo.php  
 * @date   2016-10-9 15:05:43 
 * @author Zhenxun Du<5552123@qq.com>  
 * @version    SVN:$Id:$ 
 */
//phpinfo();
$id = (int)$_GET['id'];
$pdo = new PDO('mysql:host=127.0.0.1;dbname=zxcms;port=3306', 'root', '123456');
$pdo->exec('set names utf8');

$stmt = $pdo->prepare("select * from zxcms_admin where id =:id");
$stmt->bindValue(':id', $id, PDO::PARAM_INT);
$stmt->execute();
$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);


p($rows);
p("select * from zxcms_admin where id=$id");
$rows = $pdo->query("select * from zxcms_admin where id=$id")->fetchAll(PDO::FETCH_ASSOC);

p($rows);




function p($str) {
    echo '<pre>';
    print_r($str);
}
