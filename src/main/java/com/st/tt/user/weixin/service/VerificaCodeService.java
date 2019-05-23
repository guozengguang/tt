package com.st.tt.user.weixin.service;

import com.alibaba.fastjson.JSONObject;
import com.st.tt.user.base.BaseApiService;
import com.st.tt.user.base.BaseResponse;
import com.st.tt.user.constants.Constants;
import com.st.tt.user.utils.RedisUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by asus on 2019/4/26.
 */
@RestController
public class VerificaCodeService extends BaseApiService<JSONObject>{
        @Autowired
        private RedisUtil redisUtil;

    @GetMapping("/verificaWeixinCode")
        public BaseResponse<JSONObject> verificaWeixinCode(String phone, String weixinCode) {
            if (StringUtils.isEmpty(phone)) {
                return setResultError("手机号码不能为空!");
            }
            if (StringUtils.isEmpty(weixinCode)) {
                return setResultError("注册码不能为空!");
            }
            String code = redisUtil.getString(Constants.WEIXINCODE_KEY + phone);
            if (StringUtils.isEmpty(code)) {
                return setResultError("注册码已经过期,请重新发送验证码");
            }
            if (!code.equals(weixinCode)) {
                return setResultError("注册码不正确");
            }
            redisUtil.delKey(redisUtil.getString(Constants.WEIXINCODE_KEY+phone));
            return setResultSuccess("注册码验证码正确");
        }
}
