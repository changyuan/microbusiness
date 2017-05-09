<?php

use yii\db\Migration;

/**
 * Handles the creation of table `ws_brand_agent`.
 */
class m170509_080025_create_ws_brand_agent_table extends Migration
{
    /**
     * @inheritdoc
     */
    public function up()
    {
        $this->createTable('ws_brand_agent', [
            'id' => $this->primaryKey(),
            'name' => $this->string(20),
            'alias' => $this->integer(100),
            'create_time' => $this->dateTime(),
        ]);
    }

    /**
     * @inheritdoc
     */
    public function down()
    {
        $this->dropTable('ws_brand_agent');
    }
}
