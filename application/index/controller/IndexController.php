<?php

namespace application\index\controller;

class IndexController {

    public function index() {
        echo 'index.';
    }

    public function test() {
        /**
        $t = new \my\Test();
        $t->t();
        import('my2/Test', EXTEND_PATH);
        $t2 = new \Test();
        $t2->t();
        dump(config());
        dump(url('index/blog/read?id=5'));
         * 
         */
        import('phpqrcode/phpqrcode',EXTEND_PATH);
        
        \QRcode::png("php"); 
        
        
    }
    
    public function test2(){
        echo '<img src="http://admin.0532888.co/index/index/test">';
    }

}
