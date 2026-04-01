package com.dao;

import com.entity.ShishijiankongEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import org.apache.ibatis.annotations.Param;

/**
 * 实时监控配置
 */
public interface ShishijiankongDao extends BaseMapper<ShishijiankongEntity> {

    List<ShishijiankongEntity> selectListView(Pagination page, @Param("ew") Wrapper<ShishijiankongEntity> wrapper);

    List<ShishijiankongEntity> selectListView(@Param("ew") Wrapper<ShishijiankongEntity> wrapper);

    ShishijiankongEntity selectView(@Param("ew") Wrapper<ShishijiankongEntity> wrapper);

}
