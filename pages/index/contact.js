// pages/index/contact.js
Page({
  data: {},
  onLoad: function (options) {
    // 页面初始化 options为页面跳转所带来的参数
  },
  onReady: function () {
    // 页面渲染完成
  },
  onShow: function () {
    // 页面显示
  },
  onHide: function () {
    // 页面隐藏
  },
  onUnload: function () {
    // 页面关闭
  },
  onPullDownRefresh: function () {

  },
  onReachBottom: function () {

  },
  onShareAppMessage: function () {

  },
  chooseAddress: function () {
    var that = this
    wx.chooseAddress({
      success: function (res) {
        that.setData({
          useraddress: res.userName + res.postalCode + res.provinceName + res.cityName + res.countyName + res.detailInfo + res.nationalCode + res.telNumber
        })
      }
    })
  },
  openLocation: function () {
    wx.getLocation({
      type: 'gcj02',
      success: function (res) {
        var latitude = res.latitude
        var longitude = res.longitude
        wx.openLocation({
          latitude: latitude,
          longitude: longitude,
          scale: 28
        })
      }
    })
  },

})