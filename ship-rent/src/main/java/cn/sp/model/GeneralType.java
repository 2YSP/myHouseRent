package cn.sp.model;

/**
 * @Author: Ship
 * @Description:
 * @Date: Created in 2025/7/19
 */
public class GeneralType {

    /**
     * app的代码有问题，所以这里的id要全局唯一
     */
    private String id;

    private String name;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public GeneralType() {
    }

    public GeneralType(String id, String name) {
        this.id = id;
        this.name = name;
    }
}
