package com.yue_xiang_gou.controller.admin;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yue_xiang_gou.entity.ProductSwiperImage;
import com.yue_xiang_gou.entity.R;
import com.yue_xiang_gou.service.IProductSwiperImageService;
import com.yue_xiang_gou.util.DateUtil;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**后台管理-产品轮播图Controller控制器

 */
@RestController
@RequestMapping("/admin/productSwiperImage")
public class AdminProductSwiperImageController {

    @Autowired
    private IProductSwiperImageService productSwiperImageService;

    @Value("${productSwiperImagesFilePath}")
    private String productSwiperImagesFilePath;

    /**
     * 查询所有
     */
    @GetMapping("/list/{id}")
    public R list(@PathVariable(value = "id")Integer id){
        List<ProductSwiperImage> list=productSwiperImageService.list(new QueryWrapper<ProductSwiperImage>().eq("productId",id));
        Map<String,Object> resultMap=new HashMap<>();
        resultMap.put("list",list);
        return R.ok(resultMap);
    }

    /**
     * 添加
     */
    @RequestMapping("/add")
    public R add(@RequestBody ProductSwiperImage productSwiperImage){
        productSwiperImageService.saveOrUpdate(productSwiperImage);
        return R.ok();
    }


    /**
     * 删除
     */
    @GetMapping("/delete/{id}")
    public R delete(@PathVariable(value = "id")Integer id){
        productSwiperImageService.removeById(id);
        return R.ok();
    }

    /**
     * 上传商品轮播图片
     */
    @RequestMapping("/uploadImage")
    public Map<String,Object> uploadImage(MultipartFile file)throws Exception{
        Map<String,Object> resultMap=new HashMap<>();
        if(!file.isEmpty()){
            // 获取文件名
            String originalFilename = file.getOriginalFilename();
            String suffixName=originalFilename.substring(originalFilename.lastIndexOf("."));
            String newFileName=DateUtil.getCurrentDateStr()+suffixName;
            FileUtils.copyInputStreamToFile(file.getInputStream(),new File(productSwiperImagesFilePath+newFileName));
            resultMap.put("code",0);
            resultMap.put("msg","上传成功");
            Map<String,Object> dataMap=new HashMap<>();
            dataMap.put("title",newFileName);
            dataMap.put("src","/image/productSwiperImgs/"+newFileName);
            resultMap.put("data",dataMap);
        }
        return resultMap;
    }


}

