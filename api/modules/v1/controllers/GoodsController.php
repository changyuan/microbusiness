<?php

namespace api\modules\v1\controllers;

use Yii;
use common\enum\CodeEnum;
use yii\helpers\ArrayHelper;

/**
 * 商品
 */
class GoodsController extends ApiController
{

	/**
	 * 商品列表
	 */
	public function actionAdd()
	{
		
		$request = Yii::$app->request;
		$image = $request->post();

		return $this->response('12');
	}


	/**
	 * 商品列表
	 */
	public function actionDel()
	{
		

		return $this->response('12');
	}

	/**
	 * 商品列表
	 */
	public function actionIndex()
	{
		

		return $this->response('12');
	}


	/**
	 * 商品详情
	 */
	public function actionInfo()
	{
		

		return $this->response('12');
	}


}
