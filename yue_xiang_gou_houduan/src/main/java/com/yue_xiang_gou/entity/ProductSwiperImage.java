package com.yue_xiang_gou.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * 商品轮播图片
 */
@TableName("t_product_swiper_image")
@Data
public class ProductSwiperImage {
    private Integer id; //编号

    private String image; //图片名称

    private Integer sort; //排列序号 从小到大排序

    private Integer productId; //所属产品

}
