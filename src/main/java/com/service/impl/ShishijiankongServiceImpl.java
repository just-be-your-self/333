package com.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import java.util.List;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.utils.PageUtils;
import com.utils.Query;

import com.dao.ShishijiankongDao;
import com.entity.ShishijiankongEntity;
import com.service.ShishijiankongService;

@Service("shishijiankongService")
public class ShishijiankongServiceImpl extends ServiceImpl<ShishijiankongDao, ShishijiankongEntity> implements ShishijiankongService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<ShishijiankongEntity> page = this.selectPage(
                new Query<ShishijiankongEntity>(params).getPage(),
                new EntityWrapper<ShishijiankongEntity>()
        );
        return new PageUtils(page);
    }

    @Override
    public PageUtils queryPage(Map<String, Object> params, Wrapper<ShishijiankongEntity> wrapper) {
        Page<ShishijiankongEntity> page = new Query<ShishijiankongEntity>(params).getPage();
        page.setRecords(baseMapper.selectListView(page, wrapper));
        PageUtils pageUtil = new PageUtils(page);
        return pageUtil;
    }

    @Override
    public List<ShishijiankongEntity> selectListView(Wrapper<ShishijiankongEntity> wrapper) {
        return baseMapper.selectListView(wrapper);
    }

    @Override
    public ShishijiankongEntity selectView(Wrapper<ShishijiankongEntity> wrapper) {
        return baseMapper.selectView(wrapper);
    }

}
