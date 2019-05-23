package com.st.tt.user.dto.output.dto;

import lombok.Data;

import java.util.Date;

/**
 * Created by asus on 2019/5/2.
 */
@Data
public class UserOutDTO {
    private Long id;
    private String phone;
    private String email;
    private String username;
    private char sex;
    private Integer age;
    private Date created;
    private Date updated;
    private char isAvalible;// 账号是否可以用 1 正常 0冻结
    private String picImg;
    private String openid;//用户关联 QQ 开放ID
    private String wxOpenid;//用户关联 微信 开放ID
    private Boolean isVip;
}
