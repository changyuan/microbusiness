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


	public function actionIndex()
	{
		

		return $this->response('12');
	}

}
