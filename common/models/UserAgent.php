<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%user_agent}}".
 *
 * @property integer $id
 * @property integer $agent_id
 * @property integer $user_id
 * @property string $create_time
 */
class UserAgent extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%user_agent}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['agent_id', 'user_id'], 'integer'],
            [['create_time'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'agent_id' => 'Agent ID',
            'user_id' => 'User ID',
            'create_time' => 'Create Time',
        ];
    }
}
