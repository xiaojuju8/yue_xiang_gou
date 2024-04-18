package com.yue_xiang_gou.controller.admin;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yue_xiang_gou.entity.Order;
import com.yue_xiang_gou.entity.OrderDetail;
import com.yue_xiang_gou.entity.PageBean;
import com.yue_xiang_gou.entity.R;
import com.yue_xiang_gou.service.IOrderDetailService;
import com.yue_xiang_gou.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 管理端订单Controller控制器
 */
@RestController
@RequestMapping("/admin/order")
public class AdminOrderController {

    @Autowired
    private IOrderService orderService;

    @Autowired
    private IOrderDetailService orderDetailService;

    /**
     * 根据条件分页查询用户信息
     */
    @RequestMapping("/list")
    public R list(@RequestBody PageBean pageBean){
        System.out.println(pageBean);
        Map<String, Object> map = new HashMap<>();
        map.put("orderNo",pageBean.getQuery().trim());
        map.put("start",pageBean.getStart());
        map.put("pageSize",pageBean.getPageSize());
        List<Order> orderList=orderService.list(map);
        Long total=orderService.getTotal(map);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("orderList",orderList);
        resultMap.put("total",total);
        return R.ok(resultMap);
    }

    /**
     *更新订单状态信息
     */
    @PostMapping("/updateStatus")
    public R updateStatus(@RequestBody Order order){
        Order resultOrder = orderService.getById(order.getId());
        resultOrder.setStatus(order.getStatus());
        orderService.saveOrUpdate(resultOrder);
        return  R.ok();
    }

    /**
     * 删除订单信息
     */
    @GetMapping("/delete/{id}")
    public R delete(@PathVariable(value = "id")Integer id){
        //删除订单细表数据
        orderDetailService.remove(new QueryWrapper<OrderDetail>().eq("mId",id));
        orderService.removeById(id);
        return R.ok();
    }
}
