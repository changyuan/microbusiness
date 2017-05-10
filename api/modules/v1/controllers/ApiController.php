<?php

namespace api\modules\v1\controllers;

use Yii;
use yii\web\Controller;
use common\enum\CodeEnum;
use yii\web\Response;

/**
 * Default controller for the `v1` module
 */
class ApiController extends Controller
{

	public $enableCsrfValidation = false;
	
	protected $latestVersion = "1.0.0";
	
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }


	protected function response($data,$format="json")
	{
		$response = Yii::$app->response;
		$response->charset = "UTF-8";

		if($format == Response::FORMAT_XML) {
			$response->format = Response::FORMAT_XML;
		} else {
			$response->format = Response::FORMAT_JSON;
		}

		if(empty($data)) {
			$data = CodeEnum::$success;
		}

		$callback = Yii::$app->request->get("callback","");
		if(!empty($callback)) {
			$response->format = Response::FORMAT_JSONP;
			$response->data["callback"] = $callback;
			$response->data["data"] = $data;
		} else {
			$response->data = $data;
		}
		return $response;
	}


	public function actionError404()
	{
		return $this->response(CodeEnum::$notFound);
	}


	public function actionException()
	{
		return $this->response(CodeEnum::$exception);
	}

}
