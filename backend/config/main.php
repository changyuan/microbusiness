<?php
$params = array_merge(
    require (__DIR__ . '/../../common/config/params.php'),
    require (__DIR__ . '/../../common/config/params-local.php'),
    require (__DIR__ . '/params.php'),
    require (__DIR__ . '/params-local.php')
);

return [
    'id'                  => 'app-backend',
    'name'                => 'TEAM',
    'basePath'            => dirname(__DIR__),
    'bootstrap'           => ['log'],
    'controllerNamespace' => 'backend\controllers',
    'components'          => [
        'request'      => [
            'csrfParam' => '_csrf-backend',
        ],
        'user'         => [
            'identityClass'   => 'common\models\User',
            'enableAutoLogin' => true,
            'identityCookie'  => ['name' => '_identity-backend', 'httpOnly' => true],
        ],
        // 'user'=> [
        //     'identityClass' => 'mdm\admin\models\User',
        //     'loginUrl' => ['admin/user/login'],
        // ],
        'session'      => [
            // this is the name of the session cookie used for login on the backend
            'name' => 'ws-backend',
        ],
        'log'          => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets'    => [
                [
                    'class'  => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],

        'urlManager'   => [
            'enablePrettyUrl' => true,
            'showScriptName'  => false,
            'rules'           => [
            ],
        ],
        'authManager'  => [
            'class' => 'yii\rbac\DbManager', // or use 'yii\rbac\DbManager'
        ],
        'assetManager' => [
            'bundles' => [
                'dmstr\web\AdminLteAsset' => [
                    'skin' => 'skin-purple',
                ],
            ],
        ],
    ],
    'modules'             => [
        'admin' => [
            'class'      => 'mdm\admin\Module',
            // 'layout'     => 'left-menu',
            // 'mainLayout' => '@backend/views/layouts/ main.php',
            // "defaultRoles" => ["guest"],
        ],
    ],
    //整个后台的权限控制
    'as access'           => [
        'class'        => 'mdm\admin\components\AccessControl',
        'allowActions' => [
            'site/*',
        ],
    ],
    'params'              => $params,
];
