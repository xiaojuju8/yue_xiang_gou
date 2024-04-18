package com.yue_xiang_gou.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yue_xiang_gou.entity.OrderDetail;
import com.yue_xiang_gou.mapper.OrderDetailMapper;
import com.yue_xiang_gou.service.IOrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 订单详情Service实现类
 * */
@Service("orderDetailService")
public class IOrderDetailServiceImpl extends ServiceImpl<OrderDetailMapper, OrderDetail> implements IOrderDetailService {

    @Autowired
    private OrderDetailMapper orderDetailMapper;
}
