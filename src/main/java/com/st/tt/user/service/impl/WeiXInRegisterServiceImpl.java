package com.st.tt.user.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.st.tt.user.base.BaseApiService;
import com.st.tt.user.base.BaseResponse;
import com.st.tt.user.constants.Constants;
import com.st.tt.user.dto.input.dto.UserInpDTO;
import com.st.tt.user.mapper.WeixinUserMapper;
import com.st.tt.user.mapper.entity.UserDo;
import com.st.tt.user.service.VerificaCodeService;
import com.st.tt.user.service.WeiXinRegisterService;
import com.st.tt.user.utils.bean.STBeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

/**
 * Created by asus on 2019/5/2.
 */
@RestController
public class WeiXInRegisterServiceImpl extends BaseApiService implements WeiXinRegisterService {
    @Autowired
    private VerificaCodeService verificaCodeService;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    private WeixinUserMapper weixinUserMapper;

    @Override
    public BaseResponse<JSONObject> register(@RequestBody UserInpDTO userInpDTO, String registCode) {
        String phone = userInpDTO.getPhone();
        if (StringUtils.isEmpty(phone)) {
            return setResultError("手机号码不能为空!");
        }
        String password = userInpDTO.getPassword();
        if (StringUtils.isEmpty(password)) {
            return setResultError("密码不能为空!");
        }
        BaseResponse<JSONObject> verificaWeixinCode = verificaCodeService.verificaWeixinCode(phone, registCode);
        if (!verificaWeixinCode.getRtnCode().equals(Constants.HTTP_RES_CODE_200)) {
            return setResultError(verificaWeixinCode.getMsg());
        }
        userInpDTO.setPassword(bCryptPasswordEncoder.encode(password));
        userInpDTO.setIsAvalible('1');
        userInpDTO.setCreated(new Date());
        userInpDTO.setUpdated(new Date());
        UserDo userDo = STBeanUtils.dtoToDo(userInpDTO, UserDo.class);
        return weixinUserMapper.register(userDo)>0?setResultSuccess("注册成功"):setResultError("注册失败");
    }
}
