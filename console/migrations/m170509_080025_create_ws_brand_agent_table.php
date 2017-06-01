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



// yii migrate/create  create_ac_calendar_table --fields="name:string(150),catid:smallInteger(3),openid:integer(10),use_num:integer(10):defaultValue(5),create_time:dateTime"


// yii migrate/create  create_ac_art_table --fields="name:string(150),calid:smallInteger(3),openid:integer(10),poster:string(200),show_time:dateTime,cityid:integer(10):defaultValue(5),address:string(20),summary:string(255):defaultValue(null),group_code:string(150),price_catid:integer(10),link:string(255):defaultValue(null),ext_catid1:integer(10):defaultValue(0),ext_catid2:integer(10):defaultValue(0),ext_content:string(255),create_time:dateTime"
// 
// yii migrate/create  create_ac_remind_table --fields="artid:integer(10),subject:string(255),remind_time:dateTime,openids:string(255),create_time:dateTime"
