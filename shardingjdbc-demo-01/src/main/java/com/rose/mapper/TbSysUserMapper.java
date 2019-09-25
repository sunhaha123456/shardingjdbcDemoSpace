package com.rose.mapper;

import com.rose.data.entity.TbSysUser;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface TbSysUserMapper extends Mapper<TbSysUser> {
    List<TbSysUser> listByUnameAndPwd(@Param("uname") String uname, @Param("upwd") String upwd);

    List<TbSysUser> limitTest(@Param("start") int start, @Param("size") int size);
}