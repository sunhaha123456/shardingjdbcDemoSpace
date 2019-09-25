package com.rose.controler;

import com.rose.common.exception.BusinessException;
import com.rose.data.entity.TbSysUser;
import com.rose.mapper.TbOrderMapper;
import com.rose.mapper.TbSysUserMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.inject.Inject;
import java.util.Date;

/**
 * 功能：登录 controller
 * @author sunpeng
 * @date 2019
 */
@Slf4j
@RestController
@RequestMapping("/sharding")
public class ShardingJdbcDemoControler {

    @Inject
    private TbSysUserMapper tbSysUserMapper;

    @Inject
    private TbOrderMapper tbOrderMapper;

    @GetMapping(value = "/test1")
    public Object test1() {
        TbSysUser user = tbSysUserMapper.selectByPrimaryKey(1);
        return user;
    }

    @GetMapping(value = "/test2")
    public Object test2() {
        return tbSysUserMapper.listByUnameAndPwd("superAdmin", "e10adc3949ba59abbe56e057f20f883e");
    }

    @GetMapping(value = "/test3")
//    @Transactional
    public Object test3() {
        TbSysUser user  = new TbSysUser();
        user.setCreateDate(new Date());
        user.setRoleGroupId(1);
        user.setUname("111111");
        user.setUpwd("222222");
        user.setUserState(1);
        tbSysUserMapper.insert(user);
        throw new BusinessException("111");
//        return user;
    }

    @GetMapping(value = "/test4")
    public Object test4() {
        TbSysUser user  = new TbSysUser();
        long c = tbSysUserMapper.selectCount(user);
        return tbSysUserMapper.limitTest(2, 3);
    }
}