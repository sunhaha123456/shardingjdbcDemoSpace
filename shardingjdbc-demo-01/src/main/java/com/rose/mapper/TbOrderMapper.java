package com.rose.mapper;

import com.rose.data.entity.TbOrder;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface TbOrderMapper extends Mapper<TbOrder> {
    List<TbOrder> limitTest(@Param("userId") Long userId, @Param("start") int start, @Param("size") int size);

    List<TbOrder> listTest(@Param("idList") List<Long> idList, @Param("remark") String remark);

    List<TbOrder> listTestByUserId(@Param("idList") List<Long> idList, @Param("remark") String remark);

    List<TbOrder> listTestByUserIdList(@Param("idList") List<Long> idList, @Param("remark") String remark);
}