//导入request请求工具类
import { getBaseUrl,requestUtil } from "../../utils/requestUtil"
Page({

  /**
   * 页面的初始数据
   */
  data: {
    productList:[], //商品数组
    inputValue:"", //输入框的值
    isFocus:false //取消 按钮 是否显示
  },

  //定时器
  TimeoutId:-1,

  //处理input事件
  handleInput(e){
    const {value}=e.detail;
    //console.log(value);
    if(!value.trim()){
      this.setData({
        productList:[],
        isFocus:false
      })
      return;
    }
    this.setData({
      isFocus:true
    })

    //间隔1秒后再查询
    clearTimeout(this.TimeoutId);
    this.TimeoutId=setTimeout(()=>{
      this.search(value);
    },1000)
  },

  //点击取消按钮
  handleCancel(){
    this.setData({
      productList:[], //商品数组
      inputValue:"", //输入框的值
      isFocus:false //取消 按钮 是否显示
    })
  },

  //获取商品详情
  async search(q){
    const result = await requestUtil({url: '/product/search',data:{q}});
    this.productInfo=result.data.message;
    this.setData({productList:result.data.message})
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(options) {

  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady() {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow() {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide() {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload() {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh() {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom() {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage() {

  }
})