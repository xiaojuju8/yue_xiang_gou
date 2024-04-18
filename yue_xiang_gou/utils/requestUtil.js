//定义请求根路径baseUrl
const baseUrl="http://localhost:8080";

//同时并发的次数
let ajaxTimes=0;

/**
 * 返回请求根路径baseUrl
 */
export const getBaseUrl=()=>{
  return baseUrl;
}

/**
 * wx login封装
 */
export const getWxLogin=()=>{
  return new Promise((resolve,reject)=>{
    wx.login({
      timeout:5000,
      success: (res) => {
        resolve(res)
      },
      fail(err){
        reject(err)
      }
    })
  });
}

/**
 * wx getUserProfile封装
 */
export const getUserProfile=()=>{
  return new Promise((resolve,reject)=>{
    wx.getUserProfile({
      desc: '获取用户信息',
      success: (res) => {
        resolve(res)
      },
      fail(err){
        reject(err)
      }
    })
  });
}

/**
 * 后端请求工具类
 * @param {*} params 
 */
export const requestUtil=(params)=>{

  //判断url中是否带有/my/ 请求的是私有路径 带上header token
  let header={...params.header};
  if(params.url.includes("/my/")){
    //拼接header 带上 token
    header["token"]=wx.getStorageSync('token')
  }

  var start=new Date().getTime();

  ajaxTimes++;

  wx.showLoading({
    title: '加载中...',
    mask:true
  })

  //模拟网络延迟加载...
  while(true){
    if(new Date().getTime()-start>1*100) break;
  }

  return new Promise((resolve,reject)=>{
    wx.request({
      ...params,
      header,
      url:baseUrl+params.url,
      success:(result)=>{
        resolve(result)
      },
      fail:(err)=>{
        reject(err)
      },
      complete:()=>{
        ajaxTimes--;
        if(ajaxTimes==0){
          wx.hideLoading(); //关闭加载图标
        }
      }
    })
  });
}