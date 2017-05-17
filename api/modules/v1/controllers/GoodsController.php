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
		$image = $request->post("image",'');
		$number = $request->post('number','');


		return $this->response('add');
	}


	/**
	 * 商品列表
	 */
	public function actionDel()
	{
		

		return $this->response('del');
	}

	/**
	 * 商品列表
	 */
	public function actionIndex()
	{
		

		return $this->response('index');
	}


	/**
	 * 商品详情
	 */
	public function actionInfo()
	{
		

		return $this->response('info');
	}


}
