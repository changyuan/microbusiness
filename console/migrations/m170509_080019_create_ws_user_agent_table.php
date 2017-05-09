<?php

use yii\db\Migration;

/**
 * Handles the creation of table `ws_user_agent`.
 */
class m170509_080019_create_ws_user_agent_table extends Migration
{
    /**
     * @inheritdoc
     */
    public function up()
    {
        $this->createTable('ws_user_agent', [
            'id' => $this->primaryKey(),
            'agent_id' => $this->integer(10),
            'user_id' => $this->integer(10),
            'create_time' => $this->dateTime(),
        ]);
    }

    /**
     * @inheritdoc
     */
    public function down()
    {
        $this->dropTable('ws_user_agent');
    }
}
