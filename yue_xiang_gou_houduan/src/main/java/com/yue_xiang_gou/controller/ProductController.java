package com.yue_xiang_gou.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yue_xiang_gou.entity.Product;
import com.yue_xiang_gou.entity.ProductSwiperImage;
import com.yue_xiang_gou.entity.R;
import com.yue_xiang_gou.service.IProductService;
import com.yue_xiang_gou.service.IProductSwiperImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 商品Controller
 */
@RestController
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private IProductService productService;

    @Autowired
    private IProductSwiperImageService productSwiperImageService;


    /**
     * 查询轮播商品
     */
    @GetMapping("/findSwiper")
    public R findSwiper(){
        List<Product> swiperProductList  = productService.list(new QueryWrapper<Product>().eq("isSwiper", true).orderByAsc("swiperSort"));
        Map<String,Object> map = new HashMap<>();
        map.put("message",swiperProductList);
        return R.ok(map);
    }

    /**
     * 查询热门推荐商品8个
    */
    @GetMapping("/findHot")
    public R findHot(){
        Page<Product> page = new Page<>(0, 8);
        Page<Product> pageProduct = productService.page(page, new QueryWrapper<Product>().eq("isHot", true).orderByAsc("hotDateTime"));
        List<Product> hotProductList = pageProduct.getRecords();
        Map<String,Object> map = new HashMap<>();
        map.put("message",hotProductList);
        return R.ok(map);
    }

    /**
     * 根据id查询商品信息
     */
    @GetMapping("/detail")
    public R detail(Integer id){
        Product product = productService.getById(id);
        List<ProductSwiperImage> productSwiperImageList = productSwiperImageService.list(new QueryWrapper<ProductSwiperImage>().eq("productId", product.getId()).orderByAsc("sort"));
        product.setProductSwiperImageList(productSwiperImageList);
        Map<String,Object> map = new HashMap<>();
        map.put("message",product);
        return R.ok(map);
    }

    /**
     *商品搜索
     */
    @GetMapping("/search")
    public R search(String q){
        List<Product> productList = productService.list(new QueryWrapper<Product>().like("name", q));
        Map<String,Object> map = new HashMap<>();
        map.put("message",productList);
        return R.ok(map);
    }

}
