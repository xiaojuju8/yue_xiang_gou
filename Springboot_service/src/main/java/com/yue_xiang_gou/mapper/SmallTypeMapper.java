package com.yue_xiang_gou.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yue_xiang_gou.entity.SmallType;

import java.util.List;
import java.util.Map;

/**
 *商品小类Mapper接口
 */
public interface SmallTypeMapper extends BaseMapper<SmallType> {

    List<SmallType> list(Map<String, Object> map);

    Long getTotal(Map<String, Object> map);

    SmallType findById(Integer id);

}
