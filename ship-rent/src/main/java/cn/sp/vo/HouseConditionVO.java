package cn.sp.vo;

import cn.sp.model.GeneralType;
import lombok.Data;

import java.util.List;

/**
 * @Author: Ship
 * @Description:
 * @Date: Created in 2025/7/19
 */
@Data
public class HouseConditionVO {

    private List<GeneralType> area;

    private List<GeneralType> price;

    private List<GeneralType> rentType;

    private List<GeneralType> roomType;

    // 朝向
    private List<GeneralType> oriented;

    private List<GeneralType> floor;

    public HouseConditionVO() {
    }

    public HouseConditionVO(List<GeneralType> area, List<GeneralType> price, List<GeneralType> rentType, List<GeneralType> roomType, List<GeneralType> oriented, List<GeneralType> floor) {
        this.area = area;
        this.price = price;
        this.rentType = rentType;
        this.roomType = roomType;
        this.oriented = oriented;
        this.floor = floor;
    }
}
