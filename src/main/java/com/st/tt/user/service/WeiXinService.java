package com.st.tt.user.service;

import com.st.tt.user.base.BaseResponse;
import com.st.tt.user.dto.output.dto.UserOutDTO;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
/**
 * 判断是否已注册手机号码
 * Created by asus on 2019/5/2.
 */
public interface WeiXinService {
    @PostMapping("/existPhone")
    BaseResponse<UserOutDTO> existMobile(@RequestParam("phone") String phone);

}
