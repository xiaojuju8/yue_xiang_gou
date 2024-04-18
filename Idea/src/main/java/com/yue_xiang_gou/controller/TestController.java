package com.yue_xiang_gou.controller;

import com.yue_xiang_gou.entity.R;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/yuexianggou")
public class TestController {
    /**
     *
     * 测试
     */
    @GetMapping("/test")
    public R test(){
        return R.ok("佛大牛逼");
    }
}
