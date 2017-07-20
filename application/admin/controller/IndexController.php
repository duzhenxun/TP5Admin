<?php

/**
 *  
 * @file   Index.php  
 * @date   2016-8-23 16:03:10 
 * @author Zhenxun Du<5552123@qq.com>  
 * @version    SVN:$Id:$ 
 */  

namespace app\admin\controller;

class IndexController extends CommonController{
    /**
     * 后台首页
     */
    public function index(){
       
        return $this->fetch();
    }
    
    
}