<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%order}}".
 *
 * @property integer $id
 * @property integer $brand_id
 * @property string $order_num
 * @property integer $userid
 * @property string $username
 * @property integer $goods_id
 * @property string $goods_name
 * @property string $image
 * @property integer $number
 * @property double $money
 * @property string $ext
 * @property string $remark
 * @property integer $agent_userid
 * @property string $agent_username
 * @property string $create_time
 */
class Order extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%order}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['brand_id', 'userid', 'goods_id', 'number', 'agent_userid'], 'integer'],
            [['money'], 'number'],
            [['create_time'], 'safe'],
            [['order_num'], 'string', 'max' => 20],
            [['username', 'goods_name', 'agent_username'], 'string', 'max' => 50],
            [['image', 'ext', 'remark'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'brand_id' => 'Brand ID',
            'order_num' => 'Order Num',
            'userid' => 'Userid',
            'username' => 'Username',
            'goods_id' => 'Goods ID',
            'goods_name' => 'Goods Name',
            'image' => 'Image',
            'number' => 'Number',
            'money' => 'Money',
            'ext' => 'Ext',
            'remark' => 'Remark',
            'agent_userid' => 'Agent Userid',
            'agent_username' => 'Agent Username',
            'create_time' => 'Create Time',
        ];
    }
}
