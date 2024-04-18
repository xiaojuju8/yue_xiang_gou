package com.yue_xiang_gou.config;

import com.yue_xiang_gou.interceptor.SysInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * web项目配置类
 */
@Configuration
public class WebAppConfigurer implements WebMvcConfigurer {
    //跨域问题,会导致微信小程序失效
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOriginPatterns("*")
                .allowCredentials(true)
                .allowedMethods("GET", "HEAD", "POST", "PUT",
                        "DELETE","OPTIONS")
                .maxAge(3600);
    }


    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/image/swiper/**").addResourceLocations("file:D:\\微信小程序电商\\开发素材\\swiperImgs\\");
        registry.addResourceHandler("/image/bigType/**").addResourceLocations("file:D:\\微信小程序电商\\开发素材\\bigTypeImgs\\");
        registry.addResourceHandler("/image/product/**").addResourceLocations("file:D:\\微信小程序电商\\开发素材\\productImgs\\");
        registry.addResourceHandler("/image/productSwiperImgs/**").addResourceLocations("file:D:\\微信小程序电商\\开发素材\\productSwiperImgs\\");
        registry.addResourceHandler("/image/productIntroImgs/**").addResourceLocations("file:D:\\微信小程序电商\\开发素材\\productIntroImgs\\");
        registry.addResourceHandler("/image/productParaImgs/**").addResourceLocations("file:D:\\微信小程序电商\\开发素材\\productParaImgs\\");
    }

    /**
     * 前后端分离鉴权 工具类实现
     *
     */
    @Bean
    public SysInterceptor sysInterceptor(){
        return new SysInterceptor();
    }

    /**
     *  过滤 拦截指定的 路径
     */
//    @Override
//    public void addInterceptors(InterceptorRegistry registry) {
//
//        String[] patterns=new String[]
//                {"/adminLogin","/product/**","/bigType/**","/user/wxlogin","/weixinpay/**","/swagger-ui.html"};
//        registry.addInterceptor(sysInterceptor()) // 调用上面的方法
//                .addPathPatterns("/**")
//                .excludePathPatterns(patterns); // 排除(不拦截)上面定义的路径
//    }
}
