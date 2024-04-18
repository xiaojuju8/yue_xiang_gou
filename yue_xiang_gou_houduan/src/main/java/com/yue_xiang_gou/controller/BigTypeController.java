package com.yue_xiang_gou.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yue_xiang_gou.entity.BigType;
import com.yue_xiang_gou.entity.Product;
import com.yue_xiang_gou.entity.R;
import com.yue_xiang_gou.entity.SmallType;
import com.yue_xiang_gou.service.IBigTypeService;
import com.yue_xiang_gou.service.IProductService;
import com.yue_xiang_gou.service.ISmallTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 商品大类Controller
 */

@RestController
@RequestMapping("/bigType")
public class BigTypeController {

    @Autowired
    private IBigTypeService bigTypeService;

    @Autowired
    private ISmallTypeService smallTypeService;

    @Autowired
    private IProductService productService;

    /**
    *查询所有商品大类
    */
    @GetMapping("/findAll")
    public R findAll(){
        List<BigType> bigTypeList = bigTypeService.list();
        Map<String,Object> map = new HashMap<>();
        map.put("message",bigTypeList);
        return R.ok(map);
    }

    /**
     * 获取所有菜单信息
     */
    @GetMapping("/findCategories")
    public R findCategories(){
        // 获取商品大类
        List<BigType> bigTypeList = bigTypeService.list();
        // 循环商品大类
        for (BigType bigType: bigTypeList ) {
            // 获取小类
            List<SmallType> smallTypeList = smallTypeService.list(new QueryWrapper<SmallType>().eq("bigTypeId", bigType.getId()));
            // 获取到数据后 加入到里面
            bigType.setSmallTypeList(smallTypeList);
            // 遍历 小类
            for (SmallType smallType: smallTypeList){
                List<Product> productList = productService.list(new QueryWrapper<Product>().eq("typeId",smallType.getId()));
                // 将小类数据 添加到小类类中
                smallType.setProductList(productList);
            }
        }
        Map<String,Object> map = new HashMap<>();
        map.put("message",bigTypeList);
        return R.ok(map);
    }

}
