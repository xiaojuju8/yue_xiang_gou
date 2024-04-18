package com.yue_xiang_gou.controller.admin;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yue_xiang_gou.entity.*;
import com.yue_xiang_gou.service.IBigTypeService;
import com.yue_xiang_gou.service.ISmallTypeService;
import com.yue_xiang_gou.util.DateUtil;
import com.yue_xiang_gou.util.StringUtil;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 后台管理-商品大类Controller控制器
 */
@RestController
@RequestMapping("/admin/bigType")
public class AdminBigTypeController {
    @Autowired
    private IBigTypeService bigTypeService;

    @Autowired
    private ISmallTypeService smallTypeService;

    @Value("${bigTypeImagesFilePath}")
    private  String bigTypeImagesFilePath;

    /**
     *根据条件分页查询商品大类信息
     */
    @RequestMapping("/list")
    public R list(@RequestBody PageBean pageBean){
        System.out.println(pageBean);
        String query=pageBean.getQuery().trim();
        Page<BigType> page = new Page<>(pageBean.getPageNum(), pageBean.getPageSize());
        Page<BigType> pageResult = bigTypeService.page(page, new QueryWrapper<BigType>().like(StringUtil.isNotEmpty(query), "name", query));
        Map<String, Object> map=new HashMap<>();
        map.put("bigTypeList",pageResult.getRecords());
        map.put("total",pageResult.getTotal());
        return R.ok(map);
    }

    /**
     * 添加或者修改
     */
    @RequestMapping("/save")
    public R save(@RequestBody BigType bigType){
        if (bigType.getId()==null || bigType.getId()==-1){
            bigTypeService.save(bigType);
        }else {
            bigTypeService.saveOrUpdate(bigType);
        }
        return R.ok();
    }

    /**
     * 根据id查询
     */
    @GetMapping("/{id}")
    public R findById(@PathVariable(value ="id")Integer id){
        BigType bigType = bigTypeService.getById(id);
        Map<String,Object> map=new HashMap<>();
        map.put("bigType",bigType);
        return R.ok(map);
    }

    /**
     * 删除大类信息
     */
    @GetMapping("/delete/{id}")
    public R delete(@PathVariable(value = "id")Integer id){
        //加个判断，如果大类下面有小类 返回报错提示

        if (smallTypeService.count(new QueryWrapper<SmallType>().eq("bigTypeId", id))>0){
            return R.error(500,"大类下面有小类信息，不能删除！");
        }else {
            bigTypeService.removeById(id);
            return R.ok();
        }
    }

    /**
     *上传商品大类图片
     */
    @RequestMapping("/uploadImage")
    public Map<String,Object> uploadImage(MultipartFile file)throws Exception{
        Map<String,Object> resultMap=new HashMap<>();
        if(!file.isEmpty()){
            // 获取文件名
            String originalFilename = file.getOriginalFilename();
            String suffixName=originalFilename.substring(originalFilename.lastIndexOf("."));
            String newFileName= DateUtil.getCurrentDateStr()+suffixName;
            FileUtils.copyInputStreamToFile(file.getInputStream(),new File(bigTypeImagesFilePath+newFileName));
            resultMap.put("code",0);
            resultMap.put("msg","上传成功");
            Map<String,Object> dataMap=new HashMap<>();
            dataMap.put("title",newFileName);
            dataMap.put("src","/image/bigType/"+newFileName);
            resultMap.put("data",dataMap);
        }
        return resultMap;
    }

    /**
     * 查询所有数据，下拉框用到
     */
    @RequestMapping("/listAll")
    public R listAll(){
        Map<String,Object> map=new HashMap<>();
        map.put("bigTypeList",bigTypeService.list());
        return R.ok(map);
    }
}
