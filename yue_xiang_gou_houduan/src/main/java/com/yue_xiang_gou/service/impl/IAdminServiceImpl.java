package com.yue_xiang_gou.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yue_xiang_gou.entity.Admin;
import com.yue_xiang_gou.mapper.AdminMapper;
import com.yue_xiang_gou.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 管理员Service实现类
 * */
@Service("adminService")
public class IAdminServiceImpl extends ServiceImpl<AdminMapper, Admin> implements IAdminService {

    @Autowired
    private AdminMapper adminMapper;
}
