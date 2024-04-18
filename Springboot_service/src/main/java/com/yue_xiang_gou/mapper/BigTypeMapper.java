package com.yue_xiang_gou.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yue_xiang_gou.entity.BigType;

/**
 * 商品大类Mapper接口
 */
public interface BigTypeMapper extends BaseMapper<BigType> {

    public BigType findById(Integer id);

}
