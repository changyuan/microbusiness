<?php
$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'),
    require(__DIR__ . '/../../common/config/params-local.php'),
    require(__DIR__ . '/params.php'),
    require(__DIR__ . '/params-local.php')
);

return [
    'id' => 'app-api',
    'basePath' => dirname(__DIR__),
    'bootstrap' => ['log'],
    'modules' => [
        'v1' => [
            'class' => 'api\modules\v1\Module',
        ],
    ],
    'components' => [
        'request' => [
            'csrfParam' => '_csrf-api',
        ],
        'user' => [
            'identityClass' => 'common\models\User',
            'enableAutoLogin' => false,
            'identityCookie' => ['name' => '_identity-api', 'httpOnly' => true],
        ],
        'session' => [
            // this is the name of the session cookie used for login on the api
            'name' => 'health-api',
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
                [
                    'class' => 'yii\log\DbTarget',
                    'logTable'=>'live_log',
                    'levels' => ['error', 'warning'],
                    'categories' => [
                        'QiniuLiveException',
                        'Live-*',
                    ],
                    'except' => [
                        'application'
                    ],
                ],
                [
                    'class' => 'yii\log\EmailTarget',
                    'levels' => ['error'],
                    'categories' => [
                        'easemob',
                    ],
                    'message' => [
                       'from' => ['niejunrui@yaolan.com'],
                       'to' => ['niejunrui@yaolan.com'],//, 'changyuanyuan@yaolan.com'],
                       'subject' => '七牛回调异常',
                    ],
                ],
            ],
        ],
        'mailer' => [
          'class' => 'yii\swiftmailer\Mailer',
          'useFileTransport'=> false, //是否真实发送
          'transport' => [
              'class' => 'Swift_SmtpTransport',
              'host' => 'smtp.qiye.163.com',
              'username' => 'niejunrui@yaolan.com',
              'password' => 'NieJun^$!*1989',
              'port' => '994',
              'encryption' => 'ssl',
          ],
        ],
        'errorHandler' => [
            'errorAction' => 'v1/api/exception',
        ],
        
        'urlManager' => [
            'enablePrettyUrl' => true,
            'showScriptName' => false,
            'rules' => [
                
            ],
        ],
    ],
    'params' => $params,
];
