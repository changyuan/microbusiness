<?php

use yii\db\Migration;

/**
 * Handles the creation of table `ws_goods`.
 */
class m170509_075957_create_ws_goods_table extends Migration
{
    /**
     * @inheritdoc
     */
    public function up()
    {
        $this->createTable('ws_goods', [
            'id' => $this->primaryKey(),
            'brand_id' => $this->integer(10),
            'name' => $this->string(20),
            'number' => $this->integer(10),
            'price' => $this->float(10),
            'image' => $this->string(255),
            'summary' => $this->string(255),
            'end_time' => $this->dateTime(),
            'create_time' => $this->dateTime(),
        ]);
    }

    /**
     * @inheritdoc
     */
    public function down()
    {
        $this->dropTable('ws_goods');
    }
}
