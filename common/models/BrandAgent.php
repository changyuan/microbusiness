<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%brand_agent}}".
 *
 * @property integer $id
 * @property string $name
 * @property integer $alias
 * @property string $create_time
 */
class BrandAgent extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%brand_agent}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['alias'], 'integer'],
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
            'create_time' => 'Create Time',
        ];
    }
}
