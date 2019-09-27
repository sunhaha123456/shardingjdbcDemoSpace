package com.rose.controler;

import com.rose.common.exception.BusinessException;
import com.rose.common.util.JsonUtil;
import com.rose.data.entity.TbOrder;
import com.rose.data.entity.TbSysUser;
import com.rose.mapper.TbOrderMapper;
import com.rose.mapper.TbSysUserMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.inject.Inject;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

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
    @Transactional
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

    @GetMapping(value = "/test5")
    public Object test5(@RequestParam String orderNo) {
        try {
            TbOrder param = new TbOrder();
            param.setUserId(1L);
            param.setOrderNo(orderNo);
            TbOrder order = tbOrderMapper.selectOne(param);
            System.out.println(1);
            return order;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    @GetMapping(value = "/test6")
    public Object test6(@RequestParam String orderNo) {
        TbOrder param = new TbOrder();
        param.setId(1L);
        param.setOrderNo(orderNo);
        TbOrder order = tbOrderMapper.selectOne(param);
        System.out.println(1);
        return order;
    }

    @GetMapping(value = "/test7")
    public Object test7() {
        List list1 = tbOrderMapper.listTest(Arrays.asList(1L, 2L, 3L), "aaa");
        System.out.println(JsonUtil.objectToJson(list1));
        System.out.println("=============");
        return tbOrderMapper.listTestByUserId(Arrays.asList(1L, 2L, 3L), "aaa");
    }

    @GetMapping(value = "/test8")
    public Object test8() {
        return tbOrderMapper.listTestByUserIdList(Arrays.asList(1L, 2L, 3L), "aaa");
    }

    @GetMapping(value = "/test9")
    public Object test9() {
        return tbOrderMapper.selectAll();
    }
}