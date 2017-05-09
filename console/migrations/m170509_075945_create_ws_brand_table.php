<?php

use yii\db\Migration;

/**
 * Handles the creation of table `ws_brand`.
 */
class m170509_075945_create_ws_brand_table extends Migration
{
    /**
     * @inheritdoc
     */
    public function up()
    {
        $this->createTable('ws_brand', [
            'id' => $this->primaryKey(),
            'name' => $this->string(20),
            'own_userid' => $this->integer(10),
            'appid' => $this->string(150),
            'appsecret' => $this->string(255),
            'create_time' => $this->dateTime(),
        ]);
    }

    /**
     * @inheritdoc
     */
    public function down()
    {
        $this->dropTable('ws_brand');
    }
}
