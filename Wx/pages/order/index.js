//导入request请求工具类
import { getBaseUrl,requestUtil } from "../../utils/requestUtil"
Page({

  /**
   * 页面的初始数据
   */
  data: {
    orders:[],
    tabs:[
      {
        id:0,
        value:"全部订单",
        isActive:true
      },
      {
        id:1,
        value:"待付款",
        isActive:false
      },
      {
        id:2,
        value:"待收货",
        isActive:false
      },
      {
        id:3,
        value:"退款/退货",
        isActive:false
      }
    ]
  },

  //接口参数
  QueryParams:{
    type:0,
    page:1, //第几页
    pageSize:10 //每页记录数
  },

  //总页数
  totalPage:1,

  //根据标题索引激活选中的标签
  changeTitleByIndex(index){
    let {tabs}=this.data;
    tabs.forEach((v,i)=>i==index?v.isActive=true:v.isActive=false);

    this.setData({
      tabs
    })
  },

  /**
   * tab点击事件处理
   */
  handleItemTap(e){
    const {index}=e.currentTarget.dataset;
    //切换标题
    this.changeTitleByIndex(index);

    //获取订单列表
    this.QueryParams.type=index;
    this.QueryParams.page=1;
    this.setData({
      orders:[]
    })
    this.getOrders();
  },

  /**
   * 获取订单 
   */
  async getOrders(){
    const res=await requestUtil({url:'/my/order/list',data:this.QueryParams});
    console.log(res.data)
    this.totalPage=res.data.totalPage;
    this.setData({
      orders:[...this.data.orders,...res.data.orderList]
    })
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
    console.log("show")
    let pages=getCurrentPages();
    console.log(pages);
    let currentPage=pages[pages.length-1];
    const {type}=currentPage.options;
    this.changeTitleByIndex(type)
    this.QueryParams.type=type;
    this.QueryParams.page=1;
    this.setData({
      orders:[]
    })
    this.getOrders();
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
    console.log("下拉刷新")
    this.QueryParams.page=1;
    this.setData({
      orders:[]
    })
    this.getOrders();
    //手动关闭等待效果
    wx.stopPullDownRefresh({

    })
  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom() {
    console.log("触底了！")
    if(this.QueryParams.page>=this.totalPage){
      //每有下一页数据
      console.log("没有下一页数据了");
      wx.showToast({
        title: '没有下一页数据了！',
      })
    }else{
      console.log("还有下一页数据");
      this.QueryParams.page++;
      this.getOrders();
    }
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage() {

  }
})