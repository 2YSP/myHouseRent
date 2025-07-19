package cn.sp.controller;

import cn.sp.model.GeneralType;
import cn.sp.utils.DataUtils;
import cn.sp.vo.HouseConditionVO;
import cn.sp.vo.R;
import com.google.common.collect.Lists;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: Ship
 * @Description:
 * @Date: Created in 2025/7/19
 */
@Slf4j
@RequestMapping("/house")
@RestController
public class HouseController {


    static Map<String,HouseConditionVO> conditionVOMap = new HashMap<>();

    static {
        // 北京
        List<GeneralType> area = Lists.newArrayList(
                new GeneralType("1","朝阳区"),
                new GeneralType("2","通州区"),
                new GeneralType("3","顺义区"),
                new GeneralType("4","房山区"),
                new GeneralType("5","丰台区")
        );
        conditionVOMap.put("111",new HouseConditionVO(area,
                DataUtils.generalTypeList(Lists.newArrayList("不限","1000以下","1000-3000","3000-4000","4000以上")),
                DataUtils.generalTypeList(Lists.newArrayList("不限","整租","合租")),
                DataUtils.generalTypeList(Lists.newArrayList("单间","一室一厅","两室一厅")),
                DataUtils.generalTypeList(Lists.newArrayList("朝东","朝南","朝西","朝北")),
                DataUtils.generalTypeList(Lists.newArrayList("低楼层","中楼层","高楼层"))
        ));
        // 上海
        List<GeneralType> area2 = Lists.newArrayList(
                new GeneralType("1","宝山区"),
                new GeneralType("2","奉贤区"),
                new GeneralType("3","虹口区"),
                new GeneralType("4","黄浦区"),
                new GeneralType("5","金山区")
        );
        conditionVOMap.put("222",new HouseConditionVO(area2,
                DataUtils.generalTypeList(Lists.newArrayList("不限","1000以下","1000-3000","3000-4000","4000以上")),
                DataUtils.generalTypeList(Lists.newArrayList("不限","整租","合租")),
                DataUtils.generalTypeList(Lists.newArrayList("单间","一室一厅","两室一厅")),
                DataUtils.generalTypeList(Lists.newArrayList("朝东","朝南","朝西","朝北")),
                DataUtils.generalTypeList(Lists.newArrayList("低楼层","中楼层","高楼层"))
        ));
        // 广州
        List<GeneralType> area3 = Lists.newArrayList(
                new GeneralType("1","白云区"),
                new GeneralType("2","从化区"),
                new GeneralType("3","花都区"),
                new GeneralType("4","荔湾区"),
                new GeneralType("5","南沙区")
        );
        conditionVOMap.put("333",new HouseConditionVO(area3,
                DataUtils.generalTypeList(Lists.newArrayList("不限","1000以下","1000-3000","3000-4000","4000以上")),
                DataUtils.generalTypeList(Lists.newArrayList("不限","整租","合租")),
                DataUtils.generalTypeList(Lists.newArrayList("单间","一室一厅","两室一厅")),
                DataUtils.generalTypeList(Lists.newArrayList("朝东","朝南","朝西","朝北")),
                DataUtils.generalTypeList(Lists.newArrayList("低楼层","中楼层","高楼层"))
        ));
        // 深圳
        List<GeneralType> area4 = Lists.newArrayList(
                new GeneralType("1","南山区"),
                new GeneralType("2","宝安区"),
                new GeneralType("3","福田区"),
                new GeneralType("4","光明区"),
                new GeneralType("5","龙岗区")
        );
        conditionVOMap.put("444",new HouseConditionVO(area4,
                DataUtils.generalTypeList(Lists.newArrayList("不限","1000以下","1000-3000","3000-4000","4000以上")),
                DataUtils.generalTypeList(Lists.newArrayList("不限","整租","合租")),
                DataUtils.generalTypeList(Lists.newArrayList("单间","一室一厅","两室一厅")),
                DataUtils.generalTypeList(Lists.newArrayList("朝东","朝南","朝西","朝北")),
                DataUtils.generalTypeList(Lists.newArrayList("低楼层","中楼层","高楼层"))
        ));
    }


    @GetMapping("/conditions")
    public R<HouseConditionVO> houseConditions(@RequestParam("id") String cityId) throws InterruptedException {
        HouseConditionVO vo = conditionVOMap.get(cityId);
        if (vo == null){
            return R.error("该城市的房屋搜索条件不存在");
        }
        Thread.sleep(1000);
        return R.success(vo);
    }
}
