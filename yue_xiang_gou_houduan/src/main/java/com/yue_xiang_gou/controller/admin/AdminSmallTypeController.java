package com.yue_xiang_gou.controller.admin;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yue_xiang_gou.entity.SmallType;
import com.yue_xiang_gou.entity.PageBean;
import com.yue_xiang_gou.entity.R;
import com.yue_xiang_gou.service.IBigTypeService;
import com.yue_xiang_gou.service.ISmallTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 管理端-商品小类Controller控制器
 */
@RestController
@RequestMapping("/admin/smallType")
public class AdminSmallTypeController {

    @Autowired
    private ISmallTypeService smallTypeService;

    @Autowired
    private IBigTypeService bigTypeService;


    /**
     * 根据条件分页查询用户信息
     */
    @RequestMapping("/list")
    public R list(@RequestBody PageBean pageBean){
        System.out.println(pageBean);
        Map<String, Object> map = new HashMap<>();
        map.put("name",pageBean.getQuery().trim());
        map.put("start",pageBean.getStart());
        map.put("pageSize",pageBean.getPageSize());
        List<SmallType> smallTypeList=smallTypeService.list(map);
        Long total=smallTypeService.getTotal(map);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("smallTypeList",smallTypeList);
        resultMap.put("total",total);
        return R.ok(resultMap);
    }


    /**
     * 删除
     */
    @GetMapping("/delete/{id}")
    public R delete(@PathVariable(value = "id")Integer id){
        smallTypeService.removeById(id);
        return R.ok();
    }

    /**
     * 添加或者修改
     */
    @RequestMapping("/save")
    public R save(@RequestBody SmallType smallType){
        smallType.setBigTypeId(smallType.getBigType().getId());
        if (smallType.getId()==null || smallType.getId()==-1){
            smallTypeService.save(smallType);
        }else {
            smallTypeService.saveOrUpdate(smallType);
        }
        return R.ok();
    }

    /**
     * 根据id查询
     */
    @GetMapping("/{id}")
    public R findById(@PathVariable(value ="id")Integer id){
        SmallType smallType = smallTypeService.getById(id);
        smallType.setBigType(bigTypeService.getById(smallType.getBigTypeId()));
        Map<String,Object> map=new HashMap<>();
        map.put("smallType",smallType);
        return R.ok(map);
    }

    /**
    * 根据商品大类id，查询所有小类
     */
    @RequestMapping("/listAll/{bigTypeId}")
    public R listAll(@PathVariable(value = "bigTypeId")Integer bigTypeId){
        Map<String,Object> map=new HashMap<>();
        map.put("smallTypeList",smallTypeService.list(new QueryWrapper<SmallType>
                ().eq("bigTypeId",bigTypeId)));
        return R.ok(map);
    }

}
