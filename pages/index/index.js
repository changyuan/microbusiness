//index.js
//获取应用实例
var app = getApp();
var config = require("../../config");
var qcloud = require('../../bower_components/wafer-client-sdk/index');
Page({
  data: {
    motto: 'Click Demo!',
    userInfo: {}
  },
  //事件处理函数
  bindViewTap: function () {
    wx.navigateTo({
      url: '../logs/logs'
    })
  },
  tagTap: function() {
    wx.navigateTo({
      url: 'tag',
      success: function(res) {},
      fail: function(res) {},
      complete: function(res) {},
    })
  },
  contactTap : function() {
    wx.navigateTo({
      url: 'contact',
      success: function (res) {
        // success
      },
      fail: function () {
        // fail
      },
      complete: function () {
        // complete
      }
    })
  },
  aboutTap: function () {
    wx.navigateTo({
      url: 'about',
    })
  },
  meTap: function () {
    wx.switchTab({
      url: '../me/index',
    })
  },
  addGoodsTap: function () {
    wx.navigateTo({
      url: '../goods/add',
    })
  },
  goodsListTap: function() {
    wx.navigateTo({
      url: '../goods/index',
    })
  },
  testSession: function(){
    // 设置登录地址
    // qcloud.setLoginUrl('https://199447.qcloud.la/login');
    qcloud.setLoginUrl(config.service.loginUrl);
    qcloud.login({
      success: function (userInfo) {
        console.log('登录成功', userInfo);
      },
      fail: function (err) {
        console.log('登录失败', err);
      }
    });
  },
  testRequest: function() {
    qcloud.setLoginUrl(config.service.loginUrl);
    qcloud.request({
      login:true,
      // url: 'http://199447.qcloud.la/user',
      url: config.service.loginUrl,
      success: function (response) {
        console.log(response);
      },
      fail: function (err) {
        console.log(err);
      }
    });
  },
  onLoad: function () {
    // console.log('onLoad')
    var that = this
    //调用应用实例的方法获取全局数据
    app.getUserInfo(function (userInfo) {
      //更新数据
      that.setData({
        userInfo: userInfo
      })
      //console.log(userInfo)
    })
  }
})
