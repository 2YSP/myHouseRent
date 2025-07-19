package cn.sp.vo;

import lombok.Data;

/**
 * @Author: Ship
 * @Description:
 * @Date: Created in 2024/7/27
 */
@Data
public class R<T> {

    private T data;

    private Integer code;

    private String msg;

    /**
     * 成功
     * @param t
     * @param <T>
     * @return
     */
    public static <T> R<T> success(T t){
        R r = success();
        r.setData(t);
        return r;
    }

    /**
     * 成功
     * @return
     */
    public static R success(){
        R r = new R();
        r.setCode(200);
        r.setMsg("success");
        return r;
    }

    public static R error(String msg){
        R r = new R();
        r.setCode(500);
        r.setMsg(msg);
        return r;
    }
}
