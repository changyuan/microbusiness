<?php

namespace api\modules\v1\controllers;

use Yii;
use common\enum\CodeEnum;
use yii\helpers\ArrayHelper;

/**
 * 默认控制器
 */
class DefaultController extends ApiController
{

	use UtilTrait;

	public function actionIndex()
	{
		

		return $this->response('12');
	}

	public function actionUploadImg() 
	{

		// $request = Yii::$app->request;
		// $image = $request->post("image",'');

		$imgs = $this->uploadMorePics($_FILES,'@web/upload/');

		CodeEnum::$success['data'] = $imgs;
		return $this->response(CodeEnum::$success);

	}


	/**
	 * 生成自己的session_key 用来设置登陆状态
	 * @return [type] [description]
	 */
	public function actionGenSession()
	{
		$request = Yii::$app->request;
		$image = $request->post("code",'');

		// 1. 通过code 获取认证
		$code  =  "";
		$res = file_get_contents("https://api.weixin.qq.com/sns/jscode2session?appid=APPID&secret=SECRET&js_code=JSCODE&grant_type=authorization_code");

		$openid = $res['openid'];
		$session_key = $res['session_key'];

		//生成自己session_key
		$my_session_key = rand();

		$redis =  Yii::$app->redis;

		$redis->set($my_session_key,[$session_key,$openid]);


		CodeEnum::$success['data'] = ["session_key"=> $my_session_key];
		return $this->response(CodeEnum::$success);

	}

}
