package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.ShishijiankongEntity;
import java.util.List;
import java.util.Map;

/**
 * 实时监控配置
 */
public interface ShishijiankongService extends IService<ShishijiankongEntity> {

    PageUtils queryPage(Map<String, Object> params);

    PageUtils queryPage(Map<String, Object> params, Wrapper<ShishijiankongEntity> wrapper);

    List<ShishijiankongEntity> selectListView(Wrapper<ShishijiankongEntity> wrapper);

    ShishijiankongEntity selectView(Wrapper<ShishijiankongEntity> wrapper);

}
