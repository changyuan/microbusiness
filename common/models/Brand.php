<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%brand}}".
 *
 * @property integer $id
 * @property string $name
 * @property integer $own_userid
 * @property string $appid
 * @property string $appsecret
 * @property string $create_time
 */
class Brand extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%brand}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['own_userid'], 'integer'],
            [['create_time'], 'safe'],
            [['name'], 'string', 'max' => 20],
            [['appid'], 'string', 'max' => 150],
            [['appsecret'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'own_userid' => 'Own Userid',
            'appid' => 'Appid',
            'appsecret' => 'Appsecret',
            'create_time' => 'Create Time',
        ];
    }
}
