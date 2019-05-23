package com.st.tt.user.constants;

/**
 * Created by asus on 2019/4/2.
 */
public interface Constants {
    String COOKIE_USER = "cookie_user";
    int COOKIE_TIME = (60 * 60 * 24 * 90);
    // 响应请求成功
    String HTTP_RES_CODE_200_VALUE = "success";
    // 系统错误
    String HTTP_RES_CODE_500_VALUE = "fial";
    // 响应请求成功code
    Integer HTTP_RES_CODE_200 = 200;
    // 系统错误
    Integer HTTP_RES_CODE_500 = 500;
    // 未关联QQ账号
    Integer HTTP_RES_CODE_201 = 201;
    // 用户信息不存在
    Integer HTTP_RES_CODE_EXISTMOBILE_203 = 203;
    // 发送邮件
    String MSG_EMAIL = "email";
    // 会员token
    String TOKEN_MEMBER = "TOKEN_MEMBER";
    // 用户有效期 90天
    Long TOKEN_MEMBER_TIME = (long) (60 * 60 * 24 * 90);
    int COOKIE_TOKEN_MEMBER_TIME = (60 * 60 * 24 * 90);
    // cookie 会员 totoken 名称
    String COOKIE_MEMBER_TOKEN = "cookie_member_token";
    // 微信code
    String WEIXINCODE_KEY = "weixin.code";
    // 微信注册码有效期30分钟
    Long WEIXINCODE_TIMEOUT = 1800l;

}
