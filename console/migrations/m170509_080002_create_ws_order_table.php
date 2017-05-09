<?php

use yii\db\Migration;

/**
 * Handles the creation of table `ws_order`.
 */
class m170509_080002_create_ws_order_table extends Migration
{
    /**
     * @inheritdoc
     */
    public function up()
    {
        $this->createTable('ws_order', [
            'id' => $this->primaryKey(),
            'brand_id' => $this->integer(10),
            'order_num' => $this->string(20),
            'userid' => $this->integer(10),
            'username' => $this->string(50),
            'goods_id' => $this->integer(10),
            'goods_name' => $this->string(50),
            'image' => $this->string(255),
            'number' => $this->integer(5),
            'money' => $this->float(10),
            'ext' => $this->string(255),
            'remark' => $this->string(255),
            'agent_userid' => $this->integer(10)->defaultValue(0),
            'agent_username' => $this->string(50)->defaultValue(null),
            'create_time' => $this->dateTime(),
        ]);
    }

    /**
     * @inheritdoc
     */
    public function down()
    {
        $this->dropTable('ws_order');
    }
}
