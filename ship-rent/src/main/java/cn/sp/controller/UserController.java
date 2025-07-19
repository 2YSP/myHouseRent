package cn.sp.controller;

import cn.sp.dto.LoginDTO;
import cn.sp.dto.RegisterDTO;
import cn.sp.vo.UserVO;
import cn.sp.vo.LoginResultVO;
import cn.sp.vo.R;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;


/**
 * @Author: Ship
 * @Description:
 * @Date: Created in 2024/7/27
 */
@Slf4j
@RequestMapping("/user")
@RestController
public class UserController {

    final static Map<String, String> USER_MAP = new HashMap<>();


    @PostMapping("/register")
    public R<Void> register(@RequestBody RegisterDTO registerDTO) {
        log.info("registerDTO:{}", registerDTO);
        USER_MAP.put(registerDTO.getUsername(), registerDTO.getPassword());
        return R.success();
    }

    @PostMapping("/login")
    public R<LoginResultVO> login(@RequestBody LoginDTO loginDTO){
        String pwd = USER_MAP.get(loginDTO.getUsername());
        if (pwd == null){
            return R.error("用户不存在");
        }
        if (!loginDTO.getPassword().equals(pwd)){
            return R.error("用户密码错误");
        }
        LoginResultVO loginResultVO = new LoginResultVO();
        loginResultVO.setToken(UUID.randomUUID().toString());
        return R.success(loginResultVO);
    }

    @GetMapping("")
    public R<UserVO> userInfo(){
        UserVO userVO = new UserVO();
        userVO.setId(1);
        userVO.setAvatar("/static/header.png");
        userVO.setNickname("张三");
        userVO.setGender("man");
        userVO.setPhone("110");
        return R.success(userVO);
    }

}
