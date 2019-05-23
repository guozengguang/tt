package com.st.tt.user.weixin.service;

import com.st.tt.user.base.BaseApiService;
import com.st.tt.user.base.BaseResponse;
import com.st.tt.user.entity.AppEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by asus on 2019/4/27.
 */
@RestController
public class WeixinService extends BaseApiService<AppEntity> {
        @GetMapping("/getApp")
        public BaseResponse<AppEntity> getApp() {
        return setResultSuccess(new AppEntity("1","1"));
        }
}
