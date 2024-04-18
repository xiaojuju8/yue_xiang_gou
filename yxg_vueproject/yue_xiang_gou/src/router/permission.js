import router from "@/router/index";

//beforeEach(to,from,next)全局前置守卫，路由跳转触发 to要进入的目标路由对象 from要离开的路由对象 next是否进入某个具体路由
router.beforeEach((to,from,next)=>{
    let token=window.sessionStorage.getItem("token");
    console.log("token="+token);
    console.log("to.path="+to.path);
    const whiteList=['/login']
    if (token){
        if (to.path=="/login"){//如果是登录请求
            next("/"); //跳转后台管理页面
        }else{
            next(); //放行
        }
    }else {
        if (whiteList.includes(to.path)){
            next(); //放行
        }else {
            next("/login")  //跳转登录页面
        }
    }
})