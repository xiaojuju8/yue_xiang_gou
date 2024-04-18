package com.yue_xiang_gou.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.List;

/**
* 商品大类
* */
@TableName("t_bigType")
@Data
public class BigType {

    private Integer id; //编号

    private String name; //名称

    private String remark; //备注

    private String image="default.jpg"; //封面图片

    // 附属属性,不在数据库中查询
    @TableField(select = false)
    private List<SmallType> smallTypeList; // 商品小类集合
}
