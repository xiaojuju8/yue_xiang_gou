package com.yue_xiang_gou.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yue_xiang_gou.entity.Order;
import com.yue_xiang_gou.mapper.OrderMapper;
import com.yue_xiang_gou.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 订单Service实现类
 * */
@Service("orderService")
public class IOrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements IOrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public List<Order> list(Map<String, Object> map) {
        return orderMapper.list(map);
    }

    @Override
    public Long getTotal(Map<String, Object> map) {
        return orderMapper.getTotal(map);
    }
}
