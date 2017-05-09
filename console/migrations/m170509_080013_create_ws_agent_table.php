<?php

use yii\db\Migration;

/**
 * Handles the creation of table `ws_agent`.
 */
class m170509_080013_create_ws_agent_table extends Migration
{
    /**
     * @inheritdoc
     */
    public function up()
    {
        $this->createTable('ws_agent', [
            'id' => $this->primaryKey(),
            'name' => $this->string(20),
            'alias' => $this->integer(10),
            'brand_id' => $this->integer(10),
            'own_userid' => $this->integer(10),
            'create_time' => $this->dateTime(),
        ]);
    }

    /**
     * @inheritdoc
     */
    public function down()
    {
        $this->dropTable('ws_agent');
    }
}
