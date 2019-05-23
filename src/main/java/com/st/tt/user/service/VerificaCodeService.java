package com.st.tt.user.service;

import com.alibaba.fastjson.JSONObject;
import com.st.tt.user.base.BaseResponse;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created by asus on 2019/5/2.
 */
public interface VerificaCodeService  {
    @PostMapping("/verificaWeixinCode")
    public BaseResponse<JSONObject> verificaWeixinCode(@RequestParam("phone") String phone, @RequestParam("weixinCode") String weixinCode);
}
