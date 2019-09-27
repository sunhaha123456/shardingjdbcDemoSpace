package com.rose.common.util;

import com.rose.common.data.response.ResponseResultCode;
import com.rose.common.exception.BusinessException;

import java.text.SimpleDateFormat;
import java.util.Date;

public class OrderNoUtil {

    /**
     * 功能：生产订单编号
     * 备注：各个参数不要出现 负数
     * @param platform 平台类别，必须为整数，且长度为 3
     * @param orderType 订单类别，必须为整数，且长度为 3
     * @param idStr 唯一字符串
     * @return
     */
    public static String getNO(String platform, String orderType, String idStr) {
        if (
                StringUtil.isEmpty(platform) || !platform.matches("\\d+") || platform.length() != 3 ||
                StringUtil.isEmpty(orderType) || !orderType.matches("\\d+") || orderType.length() != 3 ||
                StringUtil.isEmpty(idStr) || !idStr.matches("\\d+")) {
            throw new BusinessException(ResponseResultCode.PARAM_ERROR);
        }
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyMMdd");
        String dateStr = simpleDateFormat.format(new Date());
        int intNum=(int)(Math.random()*10000);
        String randNum = String.format("%04d", intNum);
        String idSuffixStr = null;
        String idZeroStr = "000000000";
        int diff = idZeroStr.length() - idStr.length();
        if (diff > 0) {
            idSuffixStr  = idZeroStr.substring(0, diff) + idStr;
        } else {
            idSuffixStr = idStr;
        }
        return new StringBuilder().append(dateStr).append(platform).append(orderType).append(randNum).append(idSuffixStr).toString();
    }

    /**
     * 功能：生产订单编号
     * 备注：各个参数不要出现 负数
     * @param tablePosition 表编号，必须为整数，且长度为 1
     * @param platform 平台类别，必须为整数，且长度为 3
     * @param orderType 订单类别，必须为整数，且长度为 3
     * @param idStr 唯一字符串
     * @return
     */
    public static String getNO(String tablePosition, String platform, String orderType, String idStr) {
        if (
                StringUtil.isEmpty(tablePosition) || !tablePosition.matches("\\d+") || platform.length() != 1 ||
                StringUtil.isEmpty(platform) || !platform.matches("\\d+") || platform.length() != 3 ||
                StringUtil.isEmpty(orderType) || !orderType.matches("\\d+") || orderType.length() != 3 ||
                StringUtil.isEmpty(idStr) || !idStr.matches("\\d+")) {
            throw new BusinessException(ResponseResultCode.PARAM_ERROR);
        }
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyMMdd");
        String dateStr = simpleDateFormat.format(new Date());
        int intNum=(int)(Math.random()*10000);
        String randNum = String.format("%04d", intNum);
        String idSuffixStr = null;
        String idZeroStr = "000000000";
        int diff = idZeroStr.length() - idStr.length();
        if (diff > 0) {
            idSuffixStr  = idZeroStr.substring(0, diff) + idStr;
        } else {
            idSuffixStr = idStr;
        }
        return new StringBuilder().append(dateStr).append(tablePosition).append(platform).append(orderType).append(randNum).append(idSuffixStr).toString();
    }

    public static String getTablePosition(String orderNo) {
        if (StringUtil.isEmpty(orderNo) || !orderNo.matches("\\d+") || orderNo.length() <= 10) {
            return "";
        }
        return orderNo.substring(6, 7);
    }


//    public static void main(String[] args) {
//        for (int x = 0; x<1000 ;x++) {
//            int intNum=(int)(Math.random()*10000);
//            String r = getNO("001", "001", intNum + "");
//            if (new BigInteger(r).mod(new BigInteger("3")).toString().equals("1")) {
//                System.out.println(new BigInteger(r).mod(new BigInteger("3")) + "       " + r);
//            }
//        }
//    }
}