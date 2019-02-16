<?php
// +----------------------------------------------------------------------
// | Description: 解决跨域问题
// +----------------------------------------------------------------------
// | Author: linchuangbin <linchuangbin@honraytech.com>
// +----------------------------------------------------------------------

namespace app\common\base;

use think\Controller;
use think\Request;

class ApiBase extends Controller
{
    public $param;

    /**
     * layout
     */
    public $isLayout;

    /**
     * 关键字
     * @var
     */
    public $keyWords;

    /**
     * 关键词描述信息
     * @var
     */
    public $description;

    /**
     * 页面头部标题
     * @var
     */
    public $title;

    /**
     * 页面标题
     * @var
     */
    public $metaTitle;

    /**
     * 页面nav是否返回
     * @var string
     */
    public $navBack = true;

    public function _initialize()
    {
        $header = Request::instance()->header();

        //字符处理
        header('content-type:application:json;charset=utf8');
        $origin = isset($_SERVER['HTTP_ORIGIN']) ? $_SERVER['HTTP_ORIGIN'] : '';

        //跨域处理
        if (!empty($origin))
            $this->_checkHttpOrigin();

        $param = Request::instance()->param();
        $this->param = $param;
    }

    /**
     * 跨域检测
     * @param $origin string 跨域url
     * @author Bill
     */
    private function _checkHttpOrigin($origin = '')
    {
        $allow_origin = config('allow_origin');
        if ($allow_origin != null) {
            if (in_array($origin, $allow_origin)) {
                /*防止跨域*/
                header('Access-Control-Allow-Origin: ' . $_SERVER['HTTP_ORIGIN']);
                header('Access-Control-Allow-Credentials: true');
                header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
                header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept, authKey, sessionId");
            }
        }
    }

    /**
     * @param $model
     * @param array $where
     * @param string $order
     * @param bool $field
     * @param string $limit
     * @param string $alias
     * @param array $join
     * @return array
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @author Bill
     */
    final public function lists($model, $where = array(), $order = '', $field = true, $limit = '', $alias = '', $join = [])
    {
        $options = array();
        $REQUEST = (array)input('request.');
        if (is_string($model)) {
            $model = \think\Db::name($model);
        }
        if (!empty($alias)) {
            $model->alias($alias);
        }

        if (!empty($join)) {
            $model->join($join);
        }

        if (!empty($limit))
            $model->limit($limit);

        $pk = $model->getPk();

        if (!empty($alias)) {
            $pk = $alias . "." . $pk;
        }

        if ($order === null) {
            //order置空
        } else if (isset($REQUEST['_order']) && isset($REQUEST['_field']) && in_array(strtolower($REQUEST['_order']), array('desc', 'asc'))) {
            $options['order'] = '`' . $REQUEST['_field'] . '` ' . $REQUEST['_order'];
        } elseif ($order === '' && empty($options['order']) && !empty($pk)) {
            $options['order'] = $pk . ' desc';
        } elseif ($order) {
            $options['order'] = $order;
        }
        unset($REQUEST['_order'], $REQUEST['_field']);

        if (empty($where)) {
            $where = array('status' => array('egt', 0));
        }
        if (!empty($where)) {
            $options['where'] = $where;
        }

        if (isset($REQUEST['r'])) {
            $listRows = (int)$REQUEST['r'];
        } else {
            $listRows = config('list_rows') > 0 ? config('list_rows') : 15;
        }

        $page = 1;
        if (isset($REQUEST['p'])) {
            $page = (int)$REQUEST['p'];
        }

        $total = 0;
        $list = [];
        if (empty($limit)) {
            // 分页查询
            $total = $model->where($options['where'])->count();
            $list['data'] = $model->where($options['where'])->order($order)->field($field)->page($page, $listRows)->select();
        } else {
            $total = intval($limit);
            $list['data'] = $model->where($options['where'])->order($order)->field($field)->select();
        }

        if ($list && !is_array($list)) {
            $list = $list->toArray();
        }

        $maxPage = 0;
        if($total % $listRows == 0){
            $maxPage = $total / $listRows;
        }else{
            $maxPage = intval($total / $listRows) + 1;
        }

        $resList = [];
        $resList['list'] = empty($list['data']) ? [] : $list['data'];
        $resList['perNum'] = $listRows;
        $resList['page'] = $page;
        $resList['maxPage'] = $maxPage;
        $resList['total'] = $total;

        return $resList;
    }

    /**
     * 对数据表中的单行或多行记录执行修改 GET参数id为数字或逗号分隔的数字
     *
     * @param string $model 模型名称,供M函数使用的参数
     * @param array $data 修改的数据
     * @param array $where 查询时的where()方法的参数
     * @param array $msg 执行正确和错误的消息 array('success'=>'','error'=>'', 'url'=>'','ajax'=>false)
     *                     url为跳转页面,ajax是否ajax方式(数字则为倒数计时秒数)
     * *
     */
    final protected function editRow($model, $data, $where, $msg = false)
    {
        $id = input('id/a');
        if (!empty($id)) {
            $id = array_unique($id);
            $id = is_array($id) ? implode(',', $id) : $id;
            //如存在id字段，则加入该条件
            $fields = db()->getTableFields(array('table' => config('database.prefix') . $model));

            if (in_array('id', $fields) && !empty($id)) {
                $where = array_merge(array('id' => array('in', $id)), (array)$where);
            }
        }

        $msg = array_merge(array('success' => '操作成功！', 'error' => '操作失败！', 'url' => '', 'ajax' => var_export(Request()->isAjax(), true)), (array)$msg);

        if (db($model)->where($where)->update($data) !== false) {
            $this->success($msg['success'], $msg['url'], $msg['ajax']);
        } else {
            $this->error($msg['error'], $msg['url'], $msg['ajax']);
        }
    }

    /**
     * 禁用条目
     * @param string $model 模型名称,供D函数使用的参数
     * @param array $where 查询时的 where()方法的参数
     * @param array $msg 执行正确和错误的消息,可以设置四个元素 array('success'=>'','error'=>'', 'url'=>'','ajax'=>false)
     *                     url为跳转页面,ajax是否ajax方式(数字则为倒数计时秒数)
     * *
     */
    final protected function forbid($model, $where = array(), $msg = array('success' => '状态禁用成功！', 'error' => '状态禁用失败！'))
    {
        $data = array('status' => 0);
        $this->editRow($model, $data, $where, $msg);
    }

    /**
     * 恢复条目
     * @param string $model 模型名称,供D函数使用的参数
     * @param array $where 查询时的where()方法的参数
     * @param array $msg 执行正确和错误的消息 array('success'=>'','error'=>'', 'url'=>'','ajax'=>false)
     *                     url为跳转页面,ajax是否ajax方式(数字则为倒数计时秒数)
     * *
     */
    final protected function resume($model, $where = array(), $msg = array('success' => '状态恢复成功！', 'error' => '状态恢复失败！'))
    {
        $data = array('status' => 1);
        $this->editRow($model, $data, $where, $msg);
    }

    /**
     * 还原条目
     * @param string $model 模型名称,供D函数使用的参数
     * @param array $where 查询时的where()方法的参数
     * @param array $msg 执行正确和错误的消息 array('success'=>'','error'=>'', 'url'=>'','ajax'=>false)
     *                     url为跳转页面,ajax是否ajax方式(数字则为倒数计时秒数)
     *
     */
    final protected function restore($model, $where = array(), $msg = array('success' => '状态还原成功！', 'error' => '状态还原失败！'))
    {
        $data = array('status' => 1);
        $where = array_merge(array('status' => -1), $where);
        $this->editRow($model, $data, $where, $msg);
    }

    /**
     * 条目假删除
     * @param string $model 模型名称,供D函数使用的参数
     * @param array $where 查询时的where()方法的参数
     * @param array $msg 执行正确和错误的消息 array('success'=>'','error'=>'', 'url'=>'','ajax'=>false)
     *                     url为跳转页面,ajax是否ajax方式(数字则为倒数计时秒数)
     * *
     */
    final protected function delete($model, $where = array(), $msg = array('success' => '删除成功！', 'error' => '删除失败！'))
    {
        $data['status'] = -1;
        $this->editRow($model, $data, $where, $msg);
    }


    public function object_array($array)
    {
        if (is_object($array)) {
            $array = (array)$array;
        }
        if (is_array($array)) {
            foreach ($array as $key => $value) {
                $array[$key] = $this->object_array($value);
            }
        }
        return $array;
    }

    /**
     * @param String $viewPath
     * @param array $data
     * @return mixed|string
     * @author Bill
     */
    public function view(String $viewPath, array $data = [])
    {

        if ($this->isLayout) {
            $this->view->engine->layout('layout/default');
            return $this->fetch($viewPath, $data);
        } else {
            $view = new \think\View();
            if (!empty($keyWords))
                $data = array_merge($data, $keyWords);
            $replaceTags = config('view_replace_str');
            if (count($replaceTags) > 0)
                return $view->fetch($viewPath, $data, $replaceTags);
            return $view->fetch($viewPath, $data);
        }

    }

    /**\
     * http协议消息返回
     * @param array $data
     * @param string $msg
     * @param int $code
     * @param array $header
     * @param int $httpCode
     * @return \think\response\Json
     * @author Bill
     */
    public function jsonReturn($data = [], $msg = "", $code = SUCC_CODE, $header = [], $httpCode = 200)
    {
        $responseData = [
            "code" => $code,
            "msg" => $msg == '' ? \app\common\util\ErrorCode::getMsg($httpCode) : $msg,
            "datetime" => date("Y-m-d h:i:s"),
            "data" => empty($data) ? [] : $data['data']
        ];
        return json($responseData, $httpCode, $header);
    }
}
