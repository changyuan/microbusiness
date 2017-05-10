<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%agent}}".
 *
 * @property integer $id
 * @property string $name
 * @property integer $alias
 * @property integer $brand_id
 * @property integer $own_userid
 * @property string $create_time
 */
class Agent extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%agent}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['alias', 'brand_id', 'own_userid'], 'integer'],
            [['create_time'], 'safe'],
            [['name'], 'string', 'max' => 20],
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
            'alias' => 'Alias',
            'brand_id' => 'Brand ID',
            'own_userid' => 'Own Userid',
            'create_time' => 'Create Time',
        ];
    }
}
