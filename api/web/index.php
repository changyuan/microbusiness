<?php
defined('YII_DEBUG') or define('YII_DEBUG', true);
defined('YII_ENV') or define('YII_ENV', 'dev');

require(__DIR__ . '/../../vendor/autoload.php');
require(__DIR__ . '/../../vendor/yiisoft/yii2/Yii.php');
require(__DIR__ . '/../../common/config/bootstrap.php');
require(__DIR__ . '/../config/bootstrap.php');

$config = yii\helpers\ArrayHelper::merge(
    require(__DIR__ . '/../../common/config/main.php'),
    require(__DIR__ . '/../../common/config/main-local.php'),
    require(__DIR__ . '/../config/main.php'),
    require(__DIR__ . '/../config/main-local.php')
);

//腾讯云配置
// Windows
if (PHP_OS === 'WINNT') {
    $sdkConfig = 'W:\web2\microbusiness\web\sdk.config';

// Linux
} else {
    $sdkConfig = '/etc/qcloud/sdk.config';
}

if (!file_exists($sdkConfig)) {
    echo "SDK 配置文件（{$sdkConfig}）不存在";
    die;
}

$sdkConfig = json_decode(file_get_contents($sdkConfig), true);
\QCloud_WeApp_SDK\Conf::setup(array(
    'ServerHost'         => $sdkConfig['serverHost'],
    'AuthServerUrl'      => $sdkConfig['authServerUrl'],
    'TunnelServerUrl'    => $sdkConfig['tunnelServerUrl'],
    'TunnelSignatureKey' => $sdkConfig['tunnelSignatureKey'],
    'NetworkTimeout'     => $sdkConfig['networkTimeout'],
));

$application = new yii\web\Application($config);
$application->run();
