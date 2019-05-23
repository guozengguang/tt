package com.st.tt.user.service.impl;

import com.st.tt.user.base.BaseApiService;
import com.st.tt.user.base.BaseResponse;
import com.st.tt.user.constants.Constants;
import com.st.tt.user.dto.output.dto.UserOutDTO;
import com.st.tt.user.mapper.WeixinUserMapper;
import com.st.tt.user.mapper.entity.UserDo;
import com.st.tt.user.service.WeiXinService;
import com.st.tt.user.utils.bean.STBeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by asus on 2019/5/2.
 */
@RestController
public class WeiXinServiceImpl extends BaseApiService<UserOutDTO> implements WeiXinService{
    @Autowired
    private WeixinUserMapper weixinUserMapper;
    @Override
    public BaseResponse<UserOutDTO> existMobile(String phone) {
        // 1.验证参数
        if (StringUtils.isEmpty(phone)) {
            return setResultError("手机号码不能为空!");
        }

        // 2.根据手机号码查询用户信息 单独定义code 表示是用户信息不存在把
        UserDo userEntity = weixinUserMapper.existMobile(phone);
        if (userEntity == null) {
            return setResultError(Constants.HTTP_RES_CODE_EXISTMOBILE_203, "用户信息不存在!");
        }
        // 3.将do转换成dto
        return setResultSuccess(STBeanUtils.doToDto(userEntity, UserOutDTO.class));
    }
}
