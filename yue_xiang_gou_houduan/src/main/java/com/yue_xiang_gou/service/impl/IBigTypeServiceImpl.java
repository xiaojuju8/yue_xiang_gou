package com.yue_xiang_gou.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yue_xiang_gou.entity.BigType;
import com.yue_xiang_gou.mapper.BigTypeMapper;
import com.yue_xiang_gou.service.IBigTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 商品大类Service实现类
 * */
@Service("bigTypeService")
public class IBigTypeServiceImpl extends ServiceImpl<BigTypeMapper, BigType> implements IBigTypeService {

    @Autowired
    private BigTypeMapper bigTypeMapper;
}
