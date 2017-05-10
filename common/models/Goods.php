<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%goods}}".
 *
 * @property integer $id
 * @property integer $brand_id
 * @property string $name
 * @property integer $number
 * @property double $price
 * @property string $image
 * @property string $summary
 * @property string $end_time
 * @property string $create_time
 * @property integer $lock_version
 */
class Goods extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%goods}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['brand_id', 'number', 'lock_version'], 'integer'],
            [['price'], 'number'],
            [['end_time', 'create_time'], 'safe'],
            [['name'], 'string', 'max' => 20],
            [['image', 'summary'], 'string', 'max' => 255],
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
            'name' => 'Name',
            'number' => 'Number',
            'price' => 'Price',
            'image' => 'Image',
            'summary' => 'Summary',
            'end_time' => 'End Time',
            'create_time' => 'Create Time',
            'lock_version' => 'Lock Version',
        ];
    }

    /**
     * 锁
     */
    public function optimisticLock() 
    {
        return 'lock_version';
    }
}
