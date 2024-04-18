package com.yue_xiang_gou.exception;

import com.yue_xiang_gou.entity.R;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * 统一错误结果集
 */
@ControllerAdvice
@ResponseBody
public class GlobleExceptionHandler {


    @ExceptionHandler(value = Exception.class)
    public R exceptionHandler(HttpServletRequest request, Exception e){

        System.out.println("全局异常统一结果集");
        return R.error("服务端异常, 请联系管理员"+ "<br/>"+e.getMessage());
    }
}
