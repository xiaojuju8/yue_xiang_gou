package com.yue_xiang_gou.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yue_xiang_gou.entity.SmallType;
import com.yue_xiang_gou.mapper.SmallTypeMapper;
import com.yue_xiang_gou.service.ISmallTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


/**
* 商品小类Service实现类
 */
@Service("smallTypeService")
public class ISmallTypeServiceImpl extends ServiceImpl<SmallTypeMapper, SmallType> implements ISmallTypeService {

    @Autowired
    private SmallTypeMapper smallTypeMapper;

    @Override
    public List<SmallType> list(Map<String, Object> map) {
        return smallTypeMapper.list(map);
    }

    @Override
    public Long getTotal(Map<String, Object> map) {
        return smallTypeMapper.getTotal(map);
    }
}
