<?php

namespace common\enum;

class CodeEnum
{
    const CODE='code';
    const MSG='msg';
    const DATA='data';	

    public static $success=array(self::CODE=>1,self::MSG=>'success');

    public static $notFound=array(self::CODE=>-100,self::MSG=>'NOT FOUND');
    public static $exception=array(self::CODE=>-101,self::MSG=>'PROGRAM EXCETION OR REQUEST NOT EXIST');
    public static $notExistUser=array(self::CODE=>-102,self::MSG=>'用户不存在');
    public static $denyVisit=array(self::CODE=>-103,self::MSG=>'非法的请求');
    public static $needLogin=array(self::CODE=>-104,self::MSG=>'请登录');
    public static $noData=array(self::CODE=>-105,self::MSG=>'没有了');
    public static $paramError=array(self::CODE=>-106,self::MSG=>'参数错误');

}