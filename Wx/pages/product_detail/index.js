//导入request请求工具类
import { getBaseUrl,requestUtil } from "../../utils/requestUtil"
Page({

  /**
   * 页面的初始数据
   */
  data: {
    baseUrl:'',
    productObj:{},
    activeIndex:0
  },

  productInfo:{

  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(options) {
    const baseUrl=getBaseUrl();
    this.setData({baseUrl})
    this.getProductDetail(options.id)
  },

  //tab点击事件
  handleItemTap(e){
    const {index}=e.currentTarget.dataset;
    this.setData({
      activeIndex:index
    })
  },

  //获取商品详情
  async getProductDetail(id){
    const result = await requestUtil({url: '/product/detail',data:{id},method:"GET"});
    this.productInfo=result.data.message;
    this.setData({productObj:result.data.message})
  },

  //点击事件,商品加入购物车
  handleCartAdd(){
    
    this.setCartadd();

    wx.showToast({
      title: '加入成功',
      icon:"success",
      mask:true
    })
  },

  //点击 立即购买
  handleBuy(){
    this.setCartadd();
    wx.switchTab({
      url: '/pages/cart/index',
    })
  },

  //加入购物车
  setCartadd(){
    let cart=wx.getStorageSync('cart')||[];
    console.log("cart="+cart);
    let index=cart.findIndex(v=>v.id===this.productInfo.id);
    if(index===-1){ //购物车里面不存在当前商品
      this.productInfo.num=1;
      this.productInfo.checked=true;
      cart.push(this.productInfo);
    }else{ //已经存在
      cart[index].num++;
    }
    wx.setStorageSync('cart', cart); //把购物车添加到缓存中
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