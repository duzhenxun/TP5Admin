<?php

/**
 *  
 * @file   Menu.php  
 * @date   2016-8-30 11:46:22 
 * @author Zhenxun Du<5552123@qq.com>  
 * @version    SVN:$Id:$ 
 */

namespace application\admin\controller;

use think\Loader;

class MenuController extends CommonController {

    public function index() {
        $res = db('menu')->order('listorder asc')->select();
        $lists = nodeTree($res);
        $this->assign('lists', $lists);
        return $this->fetch();
    }

    /*
     * 查看
     */

    public function info() {


        $id = input('id');
        if ($id) {
            //当前用户信息
            $info = db('menu')->find($id);
            $this->assign('info', $info);
        }

        //下拉菜单
        $this->assign('selectMenu', Loader::model('Menu')->selectMenu());
        return $this->fetch();
    }

    /*
     * 添加
     */

    public function add() {
        $data = input();
        if ($data['parentid'] == null) {
            $data['parentid'] = 0;
        }
        $res = model('menu')->allowField(true)->save($data);
        if ($res) {
            $this->success('操作成功', url('index'));
        } else {
            $this->error('操作失败');
        }
    }

    /*
     * 修改
     */

    public function edit() {

        $data = input();
        $data['updatetime'] = time();
        if ($data['parentid'] == null) {
            $data['parentid'] = 0;
        }

        $res = model('menu')->allowField(true)->save($data, ['id' => $data['id']]);
        if ($res) {
            $this->success('操作成功', url('index'));
        } else {
            $this->error('操作失败');
        }
    }

    /*
     * 删除
     */

    public function del() {
        $id = input('id');
        $res = db('menu')->where(['id' => $id])->delete();
        if ($res) {
            $this->success('操作成功', url('index'));
        } else {
            $this->error('操作失败');
        }
    }

    /**
     * 排序
     */
    public function setListorder() {

        if ($_POST['listorder']) {
            $listorder = $_POST['listorder'];
            foreach ($listorder as $k => $v) {
                $data = array();
                $data['listorder'] = $v;
                $data['updatetime'] = time();
                $res = db('menu')->where(['id' => $k])->update($data);
            }
            if ($res) {
                $this->success('操作成功', url('index'));
            } else {
                $this->error('操作失败');
            }
        }
    }

}
