<?php

/**
 *  布居
 * @file   menu.php  
 * @date   2016-9-2 16:18:45 
 * @author Zhenxun Du<5552123@qq.com>  
 * @version    SVN:$Id:$ 
 */

namespace app\admin\widget;

class Menu {

    public $user_id;

    public function __construct() {
        if (!session('user_id')) {
            return false;
        }
        $this->user_id = session('user_id');
    }

    public function index() {

        $menu = model('Menu')->getMyMenu($this->user_id, 1);

        $menuTree = list_to_tree($menu);

        $html = '<ul class="nav nav-list">';
        $html .=$this->menu_tree($menuTree);
        $html .= "
                </ul>";
        //echo $html;exit;
        return $html;
    }

    public function menu_tree($tree) {

        $html = '';

        if (is_array($tree)) {


            foreach ($tree as $val) {

                if (isset($val["name"])) {
                    $title = $val["name"];

                    if (!empty($val["a"])) {
                        $url = '/admin/' . $val['c'] . '/' . $val['a'];
                        $val['data'] ? $url.='?' . $val['data'] : '';
                    }


                    if (empty($val["id"])) {
                        $id = $val["name"];
                    } else {
                        $id = $val["id"];
                    }

                    if (empty($val['icon'])) {
                        $icon = "fa-caret-right";
                    } else {
                        $icon = $val['icon'];
                    }


                    if ($val['c'] == request()->controller() && $val['a'] == request()->action()) {
                        $active = 'active';
                    } else {
                        $active = '';
                    }

                    //echo $active;exit;

                    if (isset($val['_child'])) {

                        $html.=' 
                            <li class="">
                            <a href="' . $url . '" class="dropdown-toggle">
                                <i class="menu-icon fa ' . $icon . '"></i>
                                <span class="menu-text"> ' . $title . ' </span>
                                <b class="arrow fa fa-angle-down"></b>
                            </a>
                            <b class="arrow"></b>
                            <ul class="submenu">
                            ';

                        $html.=$this->menu_tree($val['_child']);

                        $html.='              
                            </ul>
                        </li>
                        ';
                    } else {

                        $html.='
                    <li class = "' . $active . '">
                    <a href = "' . $url . '">
                    <i class = "menu-icon fa ' . $icon . '"></i>
                    <span class = "menu-text"> ' . $title . ' </span>
                    </a>
                    <b class = "arrow"></b>
                    </li>
                    ';
                    }
                }
            }
        }

        return $html;
    }

}
