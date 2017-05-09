<?php

namespace frontend\widgets;

use yii\authclient\OAuth2;
use yii\web\HttpException;
use Yii;

class WechatClient extends OAuth2
{
    public $authUrl = 'https://open.weixin.qq.com/connect/oauth2/authorize';

    public $tokenUrl = 'https://api.weixin.qq.com/sns/oauth2/access_token';

    public $apiBaseUrl = 'https://api.weixin.qq.com';

    protected function initUserAttributes()
    {
        $user = $this->api('users/show.json', 'GET', ['uid' => $this->user->uid]);

        return [
            'client' => 'wechat',
            'openid' => $user['id'],
            'nickname' => $user['name'],
            'gender' => $user['gender'],
            'location' => $user['location'],
        ];
    }


    /**
     * @inheritdoc
     */
    protected function getUser()
    {
        $str = file_get_contents('https://api.weixin.qq.com/sns/userinfo?access_token=' . $this->accessToken->token."&openid={$openid}&lang=zh_CN");
        return json_decode($str);
    }

    /**
     * @inheritdoc
     */
    protected function defaultName()
    {
        return 'Wechat';
    }

    /**
     * @inheritdoc
     */
    protected function defaultTitle()
    {
        return '微信登录';
    }
}