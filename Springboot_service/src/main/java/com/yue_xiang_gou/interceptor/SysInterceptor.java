package com.yue_xiang_gou.interceptor;

import com.yue_xiang_gou.util.JwtUtils;
import com.yue_xiang_gou.util.StringUtil;
import io.jsonwebtoken.Claims;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**\
 *  前后端分离token 鉴权工具类
 *  自定义拦截工具类
 */
public class SysInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        String path = request.getRequestURI();
        System.out.println("path="+path);

        if(handler instanceof HandlerMethod){
            // 判断token是否为空
            String token = request.getHeader("token");
            System.out.println("token = "+ token);
            if(StringUtil.isEmpty(token)){
                System.out.println("token为空!!!");
                // 抛出一个运行时异常
                throw  new RuntimeException("签名验证不存在!!!");
            }else{
                // 如果token不为空,对token鉴权
                Claims claims = JwtUtils.validateJWT(token).getClaims();

                //管理员 /admin开头路径
                if(path.startsWith("/admin")){
                    if (claims==null||!claims.getSubject().equals("admin")||!claims.getId().equals("-1")){
                        throw new RuntimeException("管理员 鉴权失败!");
                    }else{
                        System.out.println("鉴权成功！");
                        return true;
                    }
                }else {
                    if(claims==null){
                        System.out.println("鉴权成功");
                        throw new RuntimeException("鉴权失败!");
                    }else{
                        System.out.println("鉴权成功");
                        return true;
                    }
                }


            }
        }else{
            return true;
        }
    }
}
