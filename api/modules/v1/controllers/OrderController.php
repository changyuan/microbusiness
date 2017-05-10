<?php

namespace api\modules\v1\controllers;

use Yii;
use common\enum\CodeEnum;
use yii\helpers\ArrayHelper;

/**
 * 订单
 */
class OrderController extends ApiController
{


	/**
	 * 订单列表
	 */
	public function actionIndex()
	{
		

		return $this->response('12');
	}


	/**
	 * 订单详情
	 */
	public function actionInfo()
	{
		
		
		return $this->response('12');
	}

}
