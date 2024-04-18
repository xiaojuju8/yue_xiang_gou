package com.yue_xiang_gou.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * 管理员实体
 */
@TableName("t_admin")
@Data
public class Admin {

    @TableId(type = IdType.AUTO)
    private Integer id; // 编号

    private String userName; // 用户名

    private String password; // 密码

    @TableField(select = false)
    private String newPassword; // 新密码
}
