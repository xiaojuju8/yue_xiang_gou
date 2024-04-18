package com.yue_xiang_gou.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.math.BigDecimal;

/**
 * 订单详细表
 */
@TableName("t_order_detail")
@Data
public class OrderDetail {

    private Integer id; // 编号

    private Integer mId; // 订单主表Id

    private Integer goodsId; // 商品ID

    private Integer goodsNumber; // 商品购买数量

    private BigDecimal goodsPrice; // 商品单价

    private String goodsName; // 商品名称

    private String goodsPic; // 商品图片

}
