// pages/goods/add.js
var Zan = require('../../component/zanui/index');
var sourceType = [['camera'], ['album'], ['camera', 'album']]
var sizeType = [['compressed'], ['original'], ['compressed', 'original']]
var app = getApp()
var obj = {

  /**
   * 页面的初始数据
   */
  data: {
    sourceTypeIndex: 2,
    sourceType: ['拍照', '相册', '拍照或相册'],

    sizeTypeIndex: 2,
    sizeType: ['压缩', '原图', '压缩或原图'],  

    countIndex: 8,
    count: [1, 2, 3, 4, 5, 6, 7, 8, 9],
    productNumber: 2,
    quantity: {
      quantity: 10,
      min: 1,
      max: 100
    },
    userInfo: {}
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this
    //调用应用实例的方法获取全局数据
    app.getUserInfo(function (userInfo) {
      //更新数据
      that.setData({
        userInfo: userInfo
      })
      console.log(userInfo)
    })
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
  
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
  
  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {
  
  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {
  
  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {
  
  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {
  
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {
  
  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {
  
  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {
  
  },
  goback:function() {
    wx.navigateBack({
      delta:1
    })
  },
  chooseImage: function () {
    var that = this
    wx.chooseImage({
      sourceType: sourceType[this.data.sourceTypeIndex],
      sizeType: sizeType[this.data.sizeTypeIndex],
      count: this.data.count[this.data.countIndex],
      success: function (res) {

        var tempFilePaths = res.tempFilePaths
        wx.uploadFile({
          url: 'http://dev.api.wesh.com/v1/default/upload-img', //仅为示例，非真实的接口地址
          filePath: tempFilePaths[0],
          name: 'image',
          formData: {
            'user': 'test'
          },
          success: function (res) {
            if (res.statusCode == 200 && !res.data.code) {
              
            } else {

            }
          }
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
  upload: function(e) {
    wx.request({
      url: 'http://dev.api.wesh.com/v1/goods/add',
      data: {
        num: this.data.quantity.quantity,
        image: this.data.imageList
      },
      method: "POST",
      success: function(res) {
        
      },
      fail: function(err) {
         
      },
      complete: function (res) {
        // complete
        console.log(res)
      }
    })
  },
  uploadAndShare: function (e) {
    wx.request({
      url: 'http://localhost:8080/api/product/',
      data: { num: this.data.productNumber },
      method: 'POST', // OPTIONS, GET, HEAD, POST, PUT, DELETE, TRACE, CONNECT
      // header: {}, // 设置请求的 header
      success: function (res) {
        // success
        console.log(res)
      },
      fail: function (err) {
        // fail
        console.log(err)
      },
      complete: function (res) {
        // complete
        console.log(res)
      }
    })
  },

  
  formSubmit: function (e) {
    console.log('form发生了submit事件，携带数据为：', e.detail.value)
  },
  formReset: function () {
    console.log('form发生了reset事件')
  },

  scanCode: function() {
    wx.scanCode({
      success: (res) => {
        console.log(res)
      }
    })
  }
};


Page(Object.assign({}, obj, Zan.Quantity, {
  handleZanQuantityChange(e) {
    var componentId = e.componentId;
    var quantity = e.quantity;

    this.setData({
      [`${componentId}.quantity`]: quantity
    });
  }
}));