// pages/index/about.js
var sourceType = [ ['camera'], ['album'], ['camera', 'album'] ]
var sizeType = [ ['compressed'], ['original'], ['compressed', 'original'] ]

Page({
  data: {
    sourceTypeIndex: 2,
    sourceType: ['拍照', '相册', '拍照或相册'],

    sizeTypeIndex: 2,
    sizeType: ['压缩', '原图', '压缩或原图'],

    countIndex: 8,
    count: [1, 2, 3, 4, 5, 6, 7, 8, 9],
    productNumber: 1,
  },
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
  chooseImage: function () {
    var that = this
    wx.chooseImage({
      sourceType: sourceType[this.data.sourceTypeIndex],
      sizeType: sizeType[this.data.sizeTypeIndex],
      count: this.data.count[this.data.countIndex],
      success: function (res) {
        console.log(res)
        that.setData({
          imageList: res.tempFilePaths
        })
      }
    })
  },
  previewImage: function (e) {
    var current = e.target.dataset.src

    wx.previewImage({
      current: current,
      urls: this.data.imageList
    })
  },
  addNumber:function (e) {
     this.setData({
       productNumber: this.data.productNumber + 1
     })
  },
  minusNumber: function (e) {
    var num = this.data.productNumber - 1
    if(num <=0) {
      var num = this.data.productNumber - 1
      num = 1;
    }   
    this.setData({
       productNumber: num
     })
  },
  genShare: function (e) {
    wx.request({
      url: 'http://localhost:8080/api/product/',
      data: {num:this.data.productNumber},
      method: 'POST', // OPTIONS, GET, HEAD, POST, PUT, DELETE, TRACE, CONNECT
      // header: {}, // 设置请求的 header
      success: function(res){
        // success
        console.log(res)
      },
      fail: function(err) {
        // fail
        console.log(err)
      },
      complete: function(res) {
        // complete
         console.log(res)
      }
    })
  }
})