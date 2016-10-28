<?php

/**
 *  系统设置
 * @file   ConfigController.php  
 * @date   2016-10-10 9:39:19 
 * @author Zhenxun Du<5552123@qq.com>  
 * @version    SVN:$Id:$ 
 */

namespace application\admin\controller;

class ConfigController extends CommonController {

    public function index() {
        return $this->fetch();
    }

}
