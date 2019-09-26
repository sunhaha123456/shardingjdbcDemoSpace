package com.rose.mapper;

import com.rose.data.entity.TbOrder;
import com.rose.data.entity.TbSysUser;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface TbOrderMapper extends Mapper<TbOrder> {
    List<TbOrder> limitTest(@Param("userId") Long userId, @Param("start") int start, @Param("size") int size);
}