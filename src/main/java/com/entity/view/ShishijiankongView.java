package com.entity.view;

import com.entity.ShishijiankongEntity;
import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;

/**
 * 实时监控配置视图
 */
@TableName("shishijiankong")
public class ShishijiankongView extends ShishijiankongEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    public ShishijiankongView() {
    }

    public ShishijiankongView(ShishijiankongEntity entity) {
        try {
            BeanUtils.copyProperties(this, entity);
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }
    }
}
