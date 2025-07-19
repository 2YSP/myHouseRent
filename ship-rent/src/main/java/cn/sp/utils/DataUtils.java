package cn.sp.utils;

import cn.sp.model.GeneralType;
import com.google.common.collect.Lists;

import java.util.List;
import java.util.UUID;

/**
 * @Author: Ship
 * @Description:
 * @Date: Created in 2025/7/19
 */
public class DataUtils {

    public static List<GeneralType> generalTypeList(List<String> nameList) {
        List<GeneralType> list = Lists.newArrayList();
        nameList.forEach(i -> {
            list.add(new GeneralType(UUID.randomUUID().toString().replace("-", ""), i));
        });
        return list;
    }
}
