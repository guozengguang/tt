package com.st.tt.user.listener;

import com.aliyuncs.exceptions.ClientException;
import com.st.tt.user.utils.SmsUtil;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.Map;

/**
 * Created by asus on 2019/1/5.
 */
@Component
@RabbitListener(queues = "sms")
public class SmsListener {
    @Autowired
    private SmsUtil smsUtil;
    //模版代码
    @Value("${aliyun.sms.template_code}")
    private String template_code;
    //模板签名
    @Value("${aliyun.sms.sign_name}")
    private String sign_name;

    @RabbitHandler
    public void sendSms(Map<String,String> message){
        System.out.println("手机号码："+ message.get("phone"));
        System.out.println("验证码："+message.get("checkcode"));
        try {
            smsUtil.sendSms(message.get("phone"),template_code,sign_name,"{\"code\":\""+message.get("checkcode")+"\"}");
        } catch (ClientException e) {
            e.printStackTrace();
        }
    }
}
