package com.st.tt.user.controller;


import com.alibaba.fastjson.JSONObject;
import com.st.tt.user.base.BaseResponse;
import com.st.tt.user.base.BaseWebController;
import com.st.tt.user.controller.req.vo.RegisterVo;
import com.st.tt.user.dto.input.dto.UserInpDTO;
import com.st.tt.user.entity.Result;
import com.st.tt.user.entity.StatusCode;
import com.st.tt.user.listener.MyHttpSessionListener;
import com.st.tt.user.service.UserService;
import com.st.tt.user.service.impl.WeiXInRegisterServiceImpl;
import com.st.tt.user.utils.RandomValidateCodeUtil;
import com.st.tt.user.utils.bean.MeiteBeanUtils;
import com.st.tt.user.utils.bean.STBeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;


/**
 * Created by asus on 2019/1/24.
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;


    @RequestMapping("/root")
    public String home(HttpSession session, HttpServletRequest request){
        request.getSession().setAttribute("onLineCount",new MyHttpSessionListener().getCount());
        return "homepage";
    }

    @RequestMapping("/showRegister")
    public String showRegister(){
        return "register";
    }
    /**
     * 短信验证码
     * @param phone
     * @return
     */
    @ResponseBody
    @RequestMapping("/sendsms")
    public Result sendsms(@RequestParam("phone") String phone){
        userService.sendsms(phone);
        return new Result(true, StatusCode.OK,"发送成功");
    }
    @ResponseBody
    @RequestMapping("/register")
    public Result register(@RequestParam("username")String username, @RequestParam("password")String password, @RequestParam("phone")String phone, @RequestParam("checkcode")String checkcode){
        System.out.println(username+password+phone+checkcode);
        userService.save(username,password,phone,checkcode);
        return new Result(true, StatusCode.OK,"注册成功");
    }


}
