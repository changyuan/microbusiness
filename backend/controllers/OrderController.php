<?php
namespace backend\controllers;

use Yii;
use yii\web\Controller;
use yii\filters\AccessControl;

/**
 * Site controller
 */
class OrderController extends Controller
{


	 /**
     * Displays homepage.
     *
     * @return mixed
     */
    public function actionIndex()
    {
        // print_r(yii::$app->user->identity);
        return $this->render('index');
    }

    public function actionView()
    {
        return $this->render('view');
    }

}