package com.yue_xiang_gou.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yue_xiang_gou.entity.WxUserInfo;

/**
 *微信用户Mapper接口
 */
public interface WxUserInfoMapper extends BaseMapper<WxUserInfo> {
  public WxUserInfo findByOpenId(String openId);
}
