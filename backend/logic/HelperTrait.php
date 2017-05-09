<?php
namespace backend\logic;

use Yii;
use yii\helpers\Url;

trait HelperTrait {

	public function redirect($url,$prefix=true,$scheme=false,$statusCode=302)
	{
		if ($prefix) {
			$url = Yii::$app->params['backend_url'].Ltrim(Url::to($url,$scheme),'/');
		} else {
			$url = Url::to($url,$scheme);
		}

       return Yii::$app->getResponse()->redirect($url, $statusCode);
	}

}