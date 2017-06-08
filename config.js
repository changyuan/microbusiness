/**
 * 配置文件
 * 通信带参数，https://github.com/tencentyun/wafer-client-sdk
 */
var host = 'dev.api.wesh.com/v1';

var config = {

  service: {
    host,

    // 登录地址，用于建立会话
    loginUrl: `http://${host}/serve/login`,

    // 测试的请求地址，用于测试会话
    requestUrl: `http://${host}/serve/user-check`,

    // 测试的信道服务地址
    tunnelUrl: `http://${host}/serve/tunnel`,
  }
};

module.exports = config;
