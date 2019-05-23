package com.st.tt.user.service;

import com.alibaba.fastjson.JSONObject;
import com.st.tt.user.base.BaseResponse;
import com.st.tt.user.dto.input.dto.UserInpDTO;
import org.springframework.web.bind.annotation.*;

/**
 * Created by asus on 2019/5/2.
 */
public interface WeiXinRegisterService {
    @RequestMapping(value = "/register",method = RequestMethod.POST)
    BaseResponse<JSONObject> register(@RequestBody UserInpDTO userInpDTO, @RequestParam("registCode") String registCode);
}
