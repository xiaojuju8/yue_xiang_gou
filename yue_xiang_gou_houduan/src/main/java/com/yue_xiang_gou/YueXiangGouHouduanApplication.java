package com.yue_xiang_gou;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.yue_xiang_gou.mapper")
public class YueXiangGouHouduanApplication {

    public static void main(String[] args) {
        SpringApplication.run(YueXiangGouHouduanApplication.class, args);
    }

}
