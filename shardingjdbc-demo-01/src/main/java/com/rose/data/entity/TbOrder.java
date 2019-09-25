package com.rose.data.entity;

import java.math.BigDecimal;
import javax.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Table(name = "tb_order")
public class TbOrder {
    @Id
    @GeneratedValue(generator = "JDBC")
    private Integer id;

    @Column(name = "user_id")
    private Integer userId;

    /**
     * 订单编号
     */
    @Column(name = "order_no")
    private String orderNo;

    /**
     * 订单总金额
     */
    @Column(name = "order_sum_amount")
    private BigDecimal orderSumAmount;

    /**
     * 备注
     */
    private String remark;
}