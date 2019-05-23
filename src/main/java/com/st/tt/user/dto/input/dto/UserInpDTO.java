package com.st.tt.user.dto.input.dto;

import lombok.Data;

import java.util.Date;

/**
 * Created by asus on 2019/5/2.
 */
@Data
public class UserInpDTO {
    private Long id;
    private String phone;
    private String email;
    private String password;
    private String username;
    private char sex;
    private Integer age;
    private String picImg;
    private Date created;
    private Date updated;
    private String openid;
    private String wxOpenId;
    private char isAvalible;
}
