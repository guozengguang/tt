package com.st.tt.user.controller;

import com.alibaba.fastjson.JSONObject;
import com.st.tt.user.base.BaseResponse;
import com.st.tt.user.base.BaseWebController;
import com.st.tt.user.controller.req.vo.RegisterVo;
import com.st.tt.user.dto.input.dto.UserInpDTO;
import com.st.tt.user.service.impl.WeiXInRegisterServiceImpl;
import com.st.tt.user.utils.RandomValidateCodeUtil;
import com.st.tt.user.utils.bean.MeiteBeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import javax.servlet.http.HttpSession;

/**
 * Created by asus on 2019/5/3.
 */
@Controller
public class WeiXinController extends BaseWebController{

    @Autowired
    private WeiXInRegisterServiceImpl weiXInRegisterService;

    @PostMapping("/weixinRegister")
    public String postRegister(@ModelAttribute("registerVo") @Validated RegisterVo registerVo,
                               BindingResult bindingResult, Model model, HttpSession httpSession) {
        // 1.接受表单参数 (验证码) 创建对象接受参数 vo do dto
        if (bindingResult.hasErrors()) {
            // 如果参数有错误的话
            // 获取第一个错误!
            String errorMsg = bindingResult.getFieldError().getDefaultMessage();
            setErrorMsg(model, errorMsg);
            return "weixin/reg";
        }
        // 建议不要if lese 判断 嵌套判断统一return
        // 2.判断图形验证码是否正确
        String graphicCode = registerVo.getGraphicCode();
        Boolean checkVerify = RandomValidateCodeUtil.checkVerify(graphicCode, httpSession);
        if (!checkVerify) {
            setErrorMsg(model, "图形验证码不正确!");
            return "weixin/reg";
        }
        // 3.调用会员服务接口实现注册 将前端提交vo 转换dto
        UserInpDTO userInpDTO = MeiteBeanUtils.voToDto(registerVo, UserInpDTO.class);
        BaseResponse<JSONObject> register = weiXInRegisterService.register(userInpDTO, registerVo.getRegistCode());
        if (!isSuccess(register)) {
            setErrorMsg(model, register.getMsg());
            return "weixin/reg";
        }
        // 4.跳转到登陆页面
        return "login";
    }
}
