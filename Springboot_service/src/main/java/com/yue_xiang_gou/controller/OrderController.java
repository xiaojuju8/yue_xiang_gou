package com.yue_xiang_gou.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yue_xiang_gou.entity.Order;
import com.yue_xiang_gou.entity.OrderDetail;
import com.yue_xiang_gou.entity.R;
import com.yue_xiang_gou.service.IOrderDetailService;
import com.yue_xiang_gou.service.IOrderService;
import com.yue_xiang_gou.util.DateUtil;
import com.yue_xiang_gou.util.JwtUtils;
import io.jsonwebtoken.Claims;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 订单Controller控制器
 */
@RestController
@RequestMapping("/my/order")
public class OrderController {
    @Autowired
    private IOrderService orderService;
    @Autowired
    private IOrderDetailService orderDetailService;

    /**
     * 创建订单，返回订单号
     */
    @RequestMapping("/create")
    @Transactional
    public R create(@RequestBody Order order, @RequestHeader(value = "token")String token){
        //通过token获取openid
        System.out.println("token="+token);
        System.out.println("order="+order);
        //添加订单到数据库
        Claims claims = JwtUtils.validateJWT(token).getClaims();
        if (claims!=null){
            System.out.println("openid="+claims.getId());
            order.setUserId(claims.getId());
        }
        order.setOrderNo("yuexianggou"+ DateUtil.getCurrentDateStr());
        order.setCreateDate(new Date());

        OrderDetail[] goods = order.getGoods();
        orderService.save(order);

        //添加订单详情到数据库
        for (int i = 0; i < goods.length; i++) {
            OrderDetail orderDetails=goods[i];
            orderDetails.setMId(order.getId());
            orderDetailService.save(orderDetails);
        }
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap.put("orderNo",order.getOrderNo());
        return R.ok(resultMap);
    }

    /**
     * 订单查询 type 0全部订单  1待付款  2待收货  3退款/退货
     */
    @RequestMapping("/list")
    public R list(Integer type,Integer page,Integer pageSize){
        System.out.println("type="+type);

        List<Order> orderList=null; //订单集合

        Map<String,Object> resultMap=new HashMap<>();
        //下拉分页
        Page<Order> pageOrder= new Page<>(page,pageSize);

        if (type==0){ //全部订单查询
            //orderList=orderService.list(new QueryWrapper<Order>().orderByDesc("id"));
            Page<Order> orderResult = orderService.page(pageOrder,new QueryWrapper<Order>().orderByDesc("id"));
            System.out.println("总记录数"+orderResult.getTotal());
            System.out.println("总页数"+orderResult.getPages());
            System.out.println("当前页数据" + orderResult.getRecords());
            orderList = orderResult.getRecords();
            resultMap.put("total",orderResult.getTotal());
            resultMap.put("totalPage",orderResult.getPages());
        }else {
            //orderList=orderService.list(new QueryWrapper<Order>().eq("status",type).orderByDesc("id"));
            Page<Order> orderResult = orderService.page(pageOrder,new QueryWrapper<Order>().eq("status",type).orderByDesc("id"));
            System.out.println("总记录数"+orderResult.getTotal());
            System.out.println("总页数"+orderResult.getPages());
            System.out.println("当前页数据" + orderResult.getRecords());
            orderList = orderResult.getRecords();
            resultMap.put("total",orderResult.getTotal());
            resultMap.put("totalPage",orderResult.getPages());
        }

        resultMap.put("orderList",orderList);
        return R.ok(resultMap);
    }
}
