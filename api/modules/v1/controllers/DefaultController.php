<?php

namespace api\modules\v1\controllers;

use Yii;
use common\enum\CodeEnum;
use yii\helpers\ArrayHelper;

/**
 * Default controller for the `v1` module
 */
class DefaultController extends ApiController
{


	public function actionIndex()
	{
		

		return $this->response('12');
	}

}
