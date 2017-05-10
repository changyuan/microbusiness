<?php

namespace api\modules\v1\controllers;

use Yii;
use common\enum\CodeEnum;
use yii\helpers\ArrayHelper;

/**
 * 品牌
 */
class BrandController extends ApiController
{


	public function actionIndex()
	{
		

		return $this->response('12');
	}

}
