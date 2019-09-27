package com.rose.conf;

import com.alibaba.fastjson.JSON;
import com.rose.common.util.JsonUtil;
import com.rose.common.util.OrderNoUtil;
import com.rose.common.util.StringUtil;
import org.apache.shardingsphere.api.sharding.complex.ComplexKeysShardingAlgorithm;
import org.apache.shardingsphere.api.sharding.complex.ComplexKeysShardingValue;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

/**
 * 描述：tb_order 分表策略
 * @author sunpeng
 */
public class TbOrderComplexShardingStrategy implements ComplexKeysShardingAlgorithm {

    private static final Logger log = LoggerFactory.getLogger(TbOrderComplexShardingStrategy.class);

    @Override
    public Collection<String> doSharding(Collection collection, ComplexKeysShardingValue complexKeysShardingValue) {
        Collection<String> res = new ArrayList<>();
        try {
            log.info("tb_order doSharding，availableTargetNames：{}，shardingValues:{}", JsonUtil.objectToJson(collection), JSON.toJSONString(complexKeysShardingValue));
            if (collection == null || collection.size() == 0) {
                log.error("【tb_order doSharding】，无目标表！");
                return res;
            }
            if (complexKeysShardingValue == null ||
                    StringUtil.isEmpty(complexKeysShardingValue.getLogicTableName()) ||
                    (complexKeysShardingValue.getColumnNameAndRangeValuesMap() != null && complexKeysShardingValue.getColumnNameAndRangeValuesMap().size() > 0) ||
                    complexKeysShardingValue .getColumnNameAndShardingValuesMap() == null || complexKeysShardingValue .getColumnNameAndShardingValuesMap().size() == 0) {
                res.addAll(collection);
                return res;
            }
            String logicTableName = complexKeysShardingValue.getLogicTableName();
            Map<String, Collection> columnNameAndShardingValuesMap = complexKeysShardingValue .getColumnNameAndShardingValuesMap();
            for(Map.Entry<String, Collection> entry : columnNameAndShardingValuesMap.entrySet()) {
                String columnName = entry.getKey();
                Collection columnValueList = entry.getValue();
                if (StringUtil.isNotEmpty(columnName) && columnValueList != null && columnValueList.size() > 0) {
                    if (columnName.equals("user_id")) {
                        handleForUserId(columnValueList, logicTableName, res);
                    } else if (columnName.equals("order_no")) {
                        handleForOrderNo(columnValueList, logicTableName, res);
                    } else {
                        log.error("【tb_order doSharding】，columnName：{} 未进行分片设置，返回全部表：{}", columnName, JsonUtil.objectToJson(res));
                        res.clear();
                        res.addAll(collection);
                        return res;
                    }
                    if (res.size() > 0) {
                        log.info("【tb_order doSharding】，查找分片表成功，返回分片表：{}", JsonUtil.objectToJson(res));
                        return res;
                    }
                }
            }
            res.clear();
            res.addAll(collection);
            log.info("【tb_order doSharding】，查找分片表失败，返回全部表：{}", JsonUtil.objectToJson(res));
            return res;
        } catch (Exception e) {
            log.error("【tb_order doSharding】，查找分片表报错，error：{}", e);
            res.clear();
            res.addAll(collection);
            return res;
        }
    }

    private void handleForUserId(Collection columnValueList, String logicTableName, Collection<String> res) {
        String userIdStr = null;
        Long userIdLong = null;
        String realTableName = null;
        for (Object value : columnValueList) {
            userIdStr = value + "";
            if (userIdStr.matches("\\d+")) {
                userIdLong = Long.valueOf(userIdStr);
                realTableName = logicTableName + "_" + (userIdLong % 3);
                if (!res.contains(realTableName)) {
                    res.add(realTableName);
                }
            }
        }
    }

    private void handleForOrderNo(Collection columnValueList, String logicTableName, Collection<String> res) {
        String orderNoStr = null;
        String tableIndexStr = null;
        String realTableName = null;
        for (Object value : columnValueList) {
            orderNoStr = value + "";
            tableIndexStr = OrderNoUtil.getTablePosition(orderNoStr);
            if (StringUtil.isNotEmpty(tableIndexStr)) {
                realTableName = logicTableName + "_" + tableIndexStr;
                if (!res.contains(realTableName)) {
                    res.add(realTableName);
                }
            }
        }
    }
}